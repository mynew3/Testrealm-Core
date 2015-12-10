#include "AccountMgr.h"
#include "time.h"
#include <stdio.h>
#include "Bag.h"
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


class sb_uebung : public CreatureScript
{

public:
	sb_uebung() : CreatureScript("sb_uebung") { }



	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
	{
		pPlayer->ADD_GOSSIP_ITEM(7, "1 level aufsteigen. Kosten: 10 Astrale Kredite", GOSSIP_SENDER_MAIN, 0);
		pPlayer->ADD_GOSSIP_ITEM(7, "10 level aufsteigen.  Kosten: 90 Astrale Kredite.", GOSSIP_SENDER_MAIN, 1);
	
		if (pPlayer->getLevel() < 80)
		{
			pPlayer->ADD_GOSSIP_ITEM(7, "Auf Level 80 setzen.  Kosten: 800 Astrale Kredite.", GOSSIP_SENDER_MAIN, 2);

		}
		pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
		return true;

	}

	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
	{
		switch (uiAction)
		{
		case 0:
		{
			
			levelup(pPlayer, 10, 79, 1);

		}break;

		
		case 1:
		{
			
			levelup(pPlayer, 90, 70, 10);

		}break;

	
		case 2:
		{
			uint16 abstand = 80 - pPlayer->getLevel();
			// abstand ist der abstand des Spielerlevels zu Level 80

			levelup(pPlayer, 800, 80, abstand); 
			
		}break;


		}
		return true;
	}



	

	void levelup(Player* pPlayer, uint16 kosten, uint16 levelanforderung, uint16 levelerhoehung)
	
		// kosten sind die Kredite die ben�tigt werden
		// levelanforderung ist der Schwellenwert ab wann eine Aufwertung nicht durchgef�hrt wird
		// levelerhoehung ist der Wert um den das level erhoeht wird

	{

		if (pPlayer->getLevel() <= levelanforderung)
		{
			
			if (pPlayer->HasItemCount(38186, kosten, true))
			{
				pPlayer->SetLevel(pPlayer->getLevel() + levelerhoehung);
				pPlayer->DestroyItemCount(38186, kosten, true);
				pPlayer->GetSession()->SendNotification("Dir wurden Astralekredite abgezogen und dein Level wurde erhoeht");
				return;
			}

			else
			{
				pPlayer->GetSession()->SendNotification("Du hast leider nicht genug Astralekredite");
				return;
			}
		}

		else
		{
			pPlayer->GetSession()->SendNotification("Dein Level ist schon zuhoch!");
			return;
		}


	}






};

void AddSC_sb_uebung()
{
	new sb_uebung();
}








