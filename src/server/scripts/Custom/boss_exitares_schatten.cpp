#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"

enum Spells
{
	SPELL_POISON_NOVA = 68989,
	SPELL_ENRAGE = 68335,
	SPELL_TOXIC_WASTE = 69024,
	SPELL_RAIN_OF_FIRE = 59971,
	SPELL_FLAME_BURST = 41131,
	SPELL_ARCANE_BOMB = 56431,
	SPELL_LIGHT_VORTEX = 66046,
	SPELL_MOONFIRE = 48463,
	SPELL_SPALTEN = 20691,
	SPELL_SARGERAS = 28342,
	SPELL_BURN = 46218
};

enum Events
{
	EVENT_POISON_NOVA = 1,
	EVENT_ENRAGE = 2,
	EVENT_TOXIC_WASTE = 3,
	EVENT_RAIN_OF_FIRE = 4,
	EVENT_FLAME_BURST = 5,
	EVENT_ARCANE_BOMB = 6,
	EVENT_LIGHT_VORTEX = 7,
	EVENT_MOONFIRE = 8,
	EVENT_SUMMONS = 9,
	EVENT_SPALTEN= 10,
	EVENT_BURN = 11


};

enum Phases
{
	PHASE_ONE = 1,
	PHASE_TWO = 2,
	PHASE_THREE = 3
};

enum Summons
{
	NPC_PUSTELIGER_SCHRECKEN = 31139
};

enum Texts
{
	SAY_AGGRO = 0,
	SAY_RANDOM = 1,
	SAY_HELP = 2,
	SAY_BERSERK = 3,
	SAY_ENRAGE = 4,
	SAY_DEAD = 5
};

class exitare : public CreatureScript
{
public:
	exitare() : CreatureScript("exitare") { }

	struct exitareAI : public ScriptedAI
	{
		exitareAI(Creature* creature) : ScriptedAI(creature), Summons(me) { }

		void Reset() override
		{
			_events.Reset();
			Summons.DespawnAll();
		}

		void EnterCombat(Unit* /*who*/) override
		{
			Talk(SAY_AGGRO);
			_events.SetPhase(PHASE_ONE);
			_events.ScheduleEvent(EVENT_TOXIC_WASTE, 8000);
			_events.ScheduleEvent(EVENT_POISON_NOVA, 10000);
			_events.ScheduleEvent(EVENT_MOONFIRE, 8000);
			_events.ScheduleEvent(EVENT_SPALTEN, 15000);

		}

		void DamageTaken(Unit* /*attacker*/, uint32& damage) override
		{
			if (me->HealthBelowPctDamaged(75, damage) && _events.IsInPhase(PHASE_ONE))
			{
				_events.SetPhase(PHASE_TWO);
				_events.ScheduleEvent(EVENT_LIGHT_VORTEX, 10000);
				_events.ScheduleEvent(EVENT_RAIN_OF_FIRE, 8000);
				_events.ScheduleEvent(EVENT_FLAME_BURST, 12000);
				_events.ScheduleEvent(EVENT_SUMMONS, 10000);

			}

			if (me->HealthBelowPctDamaged(35, damage) && _events.IsInPhase(PHASE_TWO))
			{
				_events.SetPhase(PHASE_THREE);
				_events.ScheduleEvent(EVENT_ARCANE_BOMB, 5000);
				_events.ScheduleEvent(EVENT_POISON_NOVA, 15000);
				_events.ScheduleEvent(EVENT_TOXIC_WASTE, 6000);
				_events.ScheduleEvent(EVENT_ENRAGE, 25000);
				_events.ScheduleEvent(EVENT_SPALTEN, 12000);
			}
		}

		void JustSummoned(Creature* summon) override
		{
			Summons.Summon(summon);

			switch (summon->GetEntry())
			{
			case NPC_PUSTELIGER_SCHRECKEN:
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 300.0f))
					summon->AI()->AttackStart(target); // I think it means the Tank !
				break;
			}
		}

		void JustDied(Unit* pPlayer)
		{
			char msg[250];
			snprintf(msg, 250, "|cffff0000[Boss System]|r Boss|cffff6060 Exitares Schatten|r wurde getoetet! Respawn in 6h 33min.");
			sWorld->SendGlobalText(msg, NULL);
		}

		

		void UpdateAI(uint32 diff) override
		{
			if (!UpdateVictim())
				return;

			_events.Update(diff);

			while (uint32 eventId = _events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_POISON_NOVA:
					DoCastAOE(SPELL_POISON_NOVA);
					break;
				case EVENT_TOXIC_WASTE:
					DoCastToAllHostilePlayers(SPELL_TOXIC_WASTE);
					_events.ScheduleEvent(EVENT_TOXIC_WASTE, 8000);
					break;
				case EVENT_ENRAGE:
					Talk(SAY_RANDOM);
					DoCast(SPELL_ENRAGE);
					break;
				case EVENT_RAIN_OF_FIRE:
					DoCastToAllHostilePlayers(SPELL_RAIN_OF_FIRE);
					_events.ScheduleEvent(EVENT_RAIN_OF_FIRE, 15000);
					break;
				case EVENT_FLAME_BURST:
					Talk(SAY_BERSERK);
					DoCast(me, SPELL_FLAME_BURST);
					_events.ScheduleEvent(EVENT_FLAME_BURST, 12000);
					break;
				case EVENT_SUMMONS:
					Talk(SAY_HELP);
					me->SummonCreature(NPC_PUSTELIGER_SCHRECKEN, me->GetPositionX() + 5, me->GetPositionY(), me->GetPositionZ() + 5, 0, TEMPSUMMON_CORPSE_DESPAWN, 12000);
					_events.ScheduleEvent(EVENT_SUMMONS, 30000);
					break;
				case EVENT_ARCANE_BOMB:
					Talk(SAY_ENRAGE);
					DoCast(me, SPELL_ARCANE_BOMB);
					_events.ScheduleEvent(EVENT_ARCANE_BOMB, 10000);
					break;
				case EVENT_LIGHT_VORTEX:
					DoCast(me, SPELL_LIGHT_VORTEX);
					_events.ScheduleEvent(EVENT_LIGHT_VORTEX, 15000);
					break;
				case EVENT_MOONFIRE:
					DoCastToAllHostilePlayers(SPELL_MOONFIRE);
					_events.ScheduleEvent(EVENT_MOONFIRE, 10000);
					break;
				case EVENT_SPALTEN:
					DoCastVictim(SPELL_SPALTEN);
					_events.ScheduleEvent(EVENT_SPALTEN, 20000);
					break;
				case SPELL_BURN:
					DoCastToAllHostilePlayers(SPELL_BURN);
					_events.ScheduleEvent(SPELL_BURN, 5000);
					break;



				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap _events;
		SummonList Summons;
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new exitareAI(creature);
	}



};

void AddSC_exitare()
{
	new exitare();
}