#include "AccountMgr.h"
#include "time.h"
#include <stdio.h>
#include "Bag.h"
#include "Mail.h"
#include "Common.h"
#include "Config.h"
#include "DatabaseEnv.h"
#include "DBCStructure.h"
#include "Define.h"
#include "Field.h"
#include "GameEventMgr.h"
#include "Item.h"
#include "ItemPrototype.h"
#include "Language.h"
#include "Log.h"
#include "ObjectGuid.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "QueryResult.h"
#include "ScriptMgr.h"
#include "SharedDefines.h"
#include "Transaction.h"
#include "WorldSession.h"
#include <sstream>
#include <string>
#include <stdlib.h>
#include "Guild.h"
#include "Arena.h"
#include "ArenaTeam.h"
#include "ArenaScore.h"



class goldaufbank : public PlayerScript
{

public:
	goldaufbank() : PlayerScript("goldaufbank") { }

	// gildenid -> GildenID des Spielers
	// gGold -> Gold das der Spieler GRADE lootet
	// gGoldBank -> Das Gold des Spielers auf der Gildenbank
	// gGoldAdd -> 10% des gelootet Goldes als Betrag
	// gGoldNew -> Der neue Bankbetrag der Guilde (inkl. der 10%)

	void OnMoneyChanged(Player* pPlayer, int32& gGold)
	{
		bool elite = pPlayer->GetSession()->IsPremium();
		uint32 gildenid = pPlayer->GetGuildId();

		if (gildenid == 0)
		{
			return;
		}

		else
		{
			if (!elite)
			{

				QueryResult ergebnis;
				ergebnis = CharacterDatabase.PQuery("Select bankmoney from `guild` where `guildid` = '%u'", gildenid);
				Field *feld = ergebnis->Fetch();
				uint32 gGoldBank = feld[0].GetUInt32();

				uint32 gGoldAdd = gGold * 0.10;

				uint32 gGoldNew = gGoldBank + gGoldAdd;

				CharacterDatabase.PExecute("UPDATE guild SET `bankmoney` = '%u' WHERE `guildid` = '%u'", gGoldNew, gildenid);

			}

			else
			{

				QueryResult ergebnis;
				ergebnis = CharacterDatabase.PQuery("Select bankmoney from `guild` where `guildid` = '%u'", gildenid);
				Field *feld = ergebnis->Fetch();
				uint32 gGoldBank = feld[0].GetUInt32();

				uint32 gGoldAdd = gGold * 0.20;

				uint32 gGoldNew = gGoldBank + gGoldAdd;

				CharacterDatabase.PExecute("UPDATE guild SET `bankmoney` = '%u' WHERE `guildid` = '%u'", gGoldNew, gildenid);

			}

			return;
		}

	}
}; 




/*
class ruhestein : public PlayerScript
{

public:
	ruhestein() : PlayerScript("ruhestein") { }

	// zZauber ist Variable f�r Ruhestein-zauber
	// cCooldown ist Variable f�r Cooldown vom Ruhestein

	void OnSpellCast(Player* pPlayer, Spell* spell, bool skipCheck)
	{
	SpellInfo const* zZauber;

		if (zZauber->Id == 8690)
		{
			uint32 cCooldown = pPlayer->GetRuneCooldown(6948) * 0.5;
			pPlayer->SetRuneCooldown(6948, cCooldown, true);

		}
	}

};

*/




void AddSC_sb_uebung()
{
	new goldaufbank();

}

