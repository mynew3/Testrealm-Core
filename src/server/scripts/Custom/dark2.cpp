#include "ScriptMgr.h"
#include "AccountMgr.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"




class dark2 : public CreatureScript
{
public: dark2() : CreatureScript("dark2"){ }

		bool OnGossipHello(Player *pPlayer, Creature* _creature)
		{
			pPlayer->ADD_GOSSIP_ITEM(7, "Ich fordere euren Bruder heraus!", GOSSIP_SENDER_MAIN, 0);
			pPlayer->ADD_GOSSIP_ITEM(7, "Ich fordere euren Bruder heraus! [Hardmode]", GOSSIP_SENDER_MAIN, 1);
			pPlayer->PlayerTalkClass->SendGossipMenu(907, _creature->GetGUID());
			return true;
		}

		bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest){
			if (quest->GetQuestId() != 800000){
				return false;
			}
			return true;
		}

		bool OnGossipSelect(Player * pPlayer, Creature * pCreature, uint32 /*uiSender*/, uint32 uiAction)
		{
			switch (uiAction)
			{
			case 0:
			{
				
				if (pPlayer->HasItemCount(700518, 4)){
					pPlayer->DestroyItemCount(700518, 4, true);
					pCreature->SummonCreature(800061, -7193.60, -4314.26, 264.06, 6.22, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
					pPlayer->PlayerTalkClass->SendCloseGossip();
				}

				else{
					pPlayer->GetSession()->SendAreaTriggerMessage("Du hast dich noch nicht wuerdig erwiesen um den Prinzen herauszufordern. Komm wieder wenn du wuerdig bist!");
					return true;
					pPlayer->PlayerTalkClass->SendCloseGossip();
				}
			}break;

			case 1:
			{
				if (pPlayer->HasItemCount(700518, 8)){
					pCreature->SummonCreature(800063, -7193.60, -4314.26, 264.06, 6.22, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 120000);
					pPlayer->DestroyItemCount(700518, 4, true);
					pPlayer->PlayerTalkClass->SendCloseGossip();
					pPlayer->GetGUID();
					return true;
				}

				else{
					pPlayer->GetSession()->SendAreaTriggerMessage("Du hast dich noch nicht wuerdig erwiesen um den Prinzen herauszufordern. Komm wieder wenn du wuerdig bist!");
					return true;
					pPlayer->PlayerTalkClass->SendCloseGossip();
				}

			}break;
			}
			return true;
		}

};


void AddSC_dark2()
{
	new dark2();
}