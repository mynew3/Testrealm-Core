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


enum Belohnungen
{
	ASTRALER_KREDIT = 38186,
	FROSTMARKEN = 49426,
	TRIUMPHMARKEN = 47241

};


class npc_first_char : public CreatureScript
{
		public: npc_first_char() : CreatureScript("npc_first_char"){ }

				bool OnGossipHello(Player *pPlayer, Creature* _creature)
				{
					pPlayer->ADD_GOSSIP_ITEM(7, "Informationen und Hilfe", GOSSIP_SENDER_MAIN, 0);
					pPlayer->ADD_GOSSIP_ITEM(7, "Firstausstattung beantragen", GOSSIP_SENDER_MAIN, 1);
					pPlayer->ADD_GOSSIP_ITEM(7, "Gildenaufwertung 10er", GOSSIP_SENDER_MAIN, 2);
					pPlayer->ADD_GOSSIP_ITEM(7, "Gildenaufwertung 25er", GOSSIP_SENDER_MAIN, 3);
					pPlayer->ADD_GOSSIP_ITEM(7, "Features", GOSSIP_SENDER_MAIN, 25);
					

					if (pPlayer->IsGameMaster()){
						pPlayer->ADD_GOSSIP_ITEM(7, "Aufwertungen einsehen", GOSSIP_SENDER_MAIN, 4);
					}
					
					pPlayer->PlayerTalkClass->SendGossipMenu(907, _creature->GetGUID());
					return true;


				}

				std::ostringstream ss;

				bool OnGossipSelect(Player * pPlayer, Creature * pCreature, uint32 /*uiSender*/, uint32 uiAction)
				{
					switch (uiAction)
					{
					case 1:
					{

						uint32 guid = pPlayer->GetGUID();

						QueryResult accountres = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
						uint32 accountresint = (*accountres)[0].GetUInt32();
						QueryResult charresult = CharacterDatabase.PQuery("Select count(guid) From characters where account = '%u'", accountresint);
						uint32 charresultint = (*charresult)[0].GetUInt32();

						QueryResult onechar = CharacterDatabase.PQuery("Select count(guid) From first_char where guid = '%u'", guid);
						uint32 onecharint = (*onechar)[0].GetUInt32();

						QueryResult ipadr = LoginDatabase.PQuery("SELECT last_ip FROM account where id = %u", accountresint);
						std::string ipadrint = (*ipadr)[0].GetString();
						QueryResult ipadrcount = LoginDatabase.PQuery("SELECT count(last_ip) FROM account WHERE last_ip = '%s'", ipadrint);
						uint32 ipadrcountint = (*ipadrcount)[0].GetUInt32();


						/*Username*/
						QueryResult guidname = CharacterDatabase.PQuery("SELECT name FROM characters where guid = %u", guid);
						std::string charname = (*guidname)[0].GetString();

						/*Accname*/
						QueryResult accountname = LoginDatabase.PQuery("SELECT username FROM account where id = %u", accountresint);
						std::string accname = (*accountname)[0].GetString();

						/*Acccountanzahl z�hlen*/
						QueryResult accountanz = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
						uint32 accountanzint = (*accountanz)[0].GetUInt32();
						QueryResult accountgesanz = CharacterDatabase.PQuery("SELECT count(account) FROM first_char WHERE account = '%u'", accountanzint);
						uint32 accountanzgesint = (*accountgesanz)[0].GetUInt32();



						if (charresultint == 1 && ipadrcountint == 1 && onecharint != 1 && accountanzgesint <= 1){

							time_t sek;
							time(&sek);
							uint32 zeit = time(&sek);
							pPlayer->GetGUID();
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Deine Aufwertung wurde ausgefuehrt. Viel Spass wuenscht Exitare sowie das MMOwning-Team.",
								pPlayer->GetName());

							ss << "|cff54b5ffEine Firstausstattung wurde von |r " << ChatHandler(pPlayer->GetSession()).GetNameLink() << " |cff54b5ff in Anspruch genommen!|r";
							sWorld->SendGMText(LANG_GM_BROADCAST, ss.str().c_str());
							pPlayer->PlayerTalkClass->SendCloseGossip();
							pPlayer->SetLevel(80);
							pPlayer->TeleportTo(0, -792.84, -1607.55, 142.30, 2.33, 0);
							pPlayer->AddItem(20400, 4);
							pPlayer->SetMoney(50000000);
							pPlayer->UpdateSkillsToMaxSkillsForLevel();




							pPlayer->PlayerTalkClass->SendCloseGossip();

							CharacterDatabase.PExecute("REPLACE INTO first_char "
								"(guid,Charname, account, Accname, time, guildid,ip) "
								"VALUES ('%u', '%s', %u, '%s', %u, %u, '%s')",
								guid, charname, accountresint, accname, zeit, 0, ipadrint);

							return true;
						}

						else {
							pPlayer->GetGUID();
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nDu hast bereits einen anderen Charakter auf diesem Realm oder versuchst mit zu vielen Accounts eine Erstaustattung zu erlangen.\nDiese wird daher abgelehnt.\nMfG Exitare und das MMOwning-Team.",
								pPlayer->GetName());
							pPlayer->PlayerTalkClass->SendCloseGossip();
							return true;
						}



					}break;

					case 0:
					{
						uint32 guid = pPlayer->GetGUID();

						pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());
						pPlayer->PlayerTalkClass->ClearMenus();
						pPlayer->ADD_GOSSIP_ITEM(7, "Einzelausstattung. Wer/Was/Wie?", GOSSIP_SENDER_MAIN, 5);
						pPlayer->ADD_GOSSIP_ITEM(7, "Gildentransfer Wer/Was/Wie?", GOSSIP_SENDER_MAIN, 6);
						pPlayer->ADD_GOSSIP_ITEM(7, "Meine Aufwertung wurde abgelehnt! Was tun?", GOSSIP_SENDER_MAIN, 7);
						pPlayer->ADD_GOSSIP_ITEM(7, "Ich moechte einen anderen Charakter ausstatten lassen.", GOSSIP_SENDER_MAIN, 8);
						pPlayer->ADD_GOSSIP_ITEM(7, "Ein Spieler mit der selben IP moechte eine Charakteraufwertung! Wie geht das?", GOSSIP_SENDER_MAIN, 9);
						pPlayer->ADD_GOSSIP_ITEM(7, "Was bedeutet Level 80 Equipment?", GOSSIP_SENDER_MAIN, 11);
						pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
						return true;
					}break;


					case 5:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nWer? \nJeder der noch keinen Character auf seinem Account hat. Es muss zwingend der erste Charakter ausgestattet werden. Existiert ein Charakter auf dem Account muss dieser geloescht werden.\nWas?\nEs gibt 5k Gold, 4 Taschen, sowie eine Grundausstattung auf Itemlevel 219.\nWie? \nEinfach auf ""Charakteraufwertung beantragen"" klicken und alles wird in die Wege geleitet.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 6:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nEine Gildenaufwertung funktioniert praktisch wie eine Einzelaufwertung.Zusaetzlich bekommt ihr jedoch den Reitskill bis zu Schnellem Reiten hochgesetzt. Ihr muesst jedoch in einer Gilde sein und duerft keine Einzelaufwertung beantragt haben. Solltet ihr das getan haben, einfach den Charakter loeschen und neu machen. Ihr muesst die Gilde schon gegruendet haben und Euch auch schon in dieser befinden. Waehlt dann die entsprechende Groesse aus um die Aufwertung zu bekommen.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 7:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nErst einmal keine Panik. Sollte deine Aufwertung abgelehnt werden, ist entweder ueber deinen Account oder deine IP schon eine Aufwertung erfolgt, der Charakter hat schon eine Aufwertung bekommen oder du hast mehr als 1 Charakter auf diesem Account.\nBeachte bitte: Nur der erste Charakter auf MMOwning darf ausgestattet werden. Solltest du dennoch Probleme haben, gehe bitte ins TS und frage nach Exitare.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 8:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nDas ist kein Problem. Loesche einfach diesen Charakter und erstelle dir einen neuen. Bedenke aber das du nur 2 Ausstattungen beantragen kannst. Solltest du deinen Charakter also loeschen, hast du nur noch einmal die Moeglichkeit eine Erstaustattung zu beantragen.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 9:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nUm eine Austattung ueber die gleiche IP vornehmen zu lassen muesst ihr euch BEIDE ins TS begeben. Fragt dort nach einem GM, dieser wird ueberpruefen ob alles f�r eine Ausstattung erfuellt ist und diese dann durchfuehren.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 11:
					{
						pPlayer->GetGUID();
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System]\nLevel 80 Equipment bedeutet, dass ihr Euch fuer 2000 Gold Level 80 Equipment kaufen koennt. Dies kann mit jedem Character benutzt werden.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();
						return true;
					}

					case 2:
					{
						uint32 guid = pPlayer->GetGUID();

						bool gild = pPlayer->GetGuild();

						if (gild)
						{
							QueryResult accountres = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
							uint32 accountresint = (*accountres)[0].GetUInt32();
							QueryResult charresult = CharacterDatabase.PQuery("Select count(guid) From characters where account = '%u'", accountresint);
							uint32 charresultint = (*charresult)[0].GetUInt32();

							/*Gildenselect*/
							QueryResult guildid = CharacterDatabase.PQuery("SELECT guildid FROM guild_member WHERE guid= %u", guid);
							uint32 guildidint = (*accountres)[0].GetUInt32();

							/*Gildenmemberanzahl*/
							QueryResult guildmember = CharacterDatabase.PQuery("SELECT count(guid) FROM guild_member WHERE guildid = %u", guildidint);
							uint32 guildmemberint = (*guildmember)[0].GetUInt32();


							QueryResult onechar = CharacterDatabase.PQuery("Select count(guid) From first_char where guid = '%u'", guid);
							uint32 onecharint = (*onechar)[0].GetUInt32();

							/*Username*/
							QueryResult guidname = CharacterDatabase.PQuery("SELECT name FROM characters where guid = %u", guid);
							std::string charname = (*guidname)[0].GetString();

							/*Accname*/
							QueryResult accountname = LoginDatabase.PQuery("SELECT username FROM account where id = %u", accountresint);
							std::string accname = (*accountname)[0].GetString();

							QueryResult ipadr = LoginDatabase.PQuery("SELECT last_ip FROM account where id = %u", accountresint);
							std::string ipadrint = (*ipadr)[0].GetString();
							/*IPAdresse auslesen*/
							QueryResult ipadrcount = LoginDatabase.PQuery("SELECT count(last_ip) FROM account WHERE last_ip = '%s'", ipadrint);
							uint32 ipadrcountint = (*ipadrcount)[0].GetUInt32();

							time_t seconds;
							seconds = time(NULL);
							uint32 zeit = seconds;


							/*Acccountanzahl z�hlen*/
							QueryResult accountanz = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
							uint32 accountanzint = (*accountanz)[0].GetUInt32();
							QueryResult accountgesanz = CharacterDatabase.PQuery("SELECT count(account) FROM first_char WHERE account = '%u'", accountanzint);
							uint32 accountanzgesint = (*accountgesanz)[0].GetUInt32();

							if (guildmemberint >= 10 && guildmemberint < 25 && charresultint == 1 && ipadrcountint == 1 && onecharint != 1 && accountanzgesint <= 1){
								pPlayer->SetLevel(80);
								pPlayer->LearnDefaultSkill(762, 3);
								pPlayer->TeleportTo(0, -792.84, -1607.55, 142.30, 2.33, 0);
								pPlayer->AddItem(20400, 4);
								pPlayer->SetMoney(50000000);
								pPlayer->UpdateSkillsToMaxSkillsForLevel();

								ss << "|cff54b5ffEine 10er Gildenfirstausstattung wurde von |r " << ChatHandler(pPlayer->GetSession()).GetNameLink() << " |cff54b5ff in Anspruch genommen!|r";
								sWorld->SendGMText(LANG_GM_BROADCAST, ss.str().c_str());

								CharacterDatabase.PExecute("REPLACE INTO first_char "
									"(guid,Charname, account, Accname, time, guildid,ip) "
									"VALUES ('%u', '%s', %u, '%s', %u, %u, '%s')",
									guid, charname, accountresint, accname, zeit, guildidint, ipadrint);
								return true;


							}

							if (onecharint != 1){
								pPlayer->GetSession()->SendNotification("Du hast mehr als einen Charakter auf deinem Account. Es darf nur der ERSTE Charakter ausgestattet werden.");
							}

							if (guildmemberint < 10){
								pPlayer->GetSession()->SendNotification("Deine Gilde hat weniger als 10 Gildenmitglieder.");
							}


							else{
								ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Deine Gilde ist nicht neu, oder hat nicht genug oder zu viele Mitglieder.",
									pPlayer->GetName());
								pPlayer->PlayerTalkClass->SendCloseGossip();
								return true;
							}


							return true;

						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Tut mir Leid du bist in keiner Gilde.",
								pPlayer->GetName());
							pPlayer->PlayerTalkClass->SendCloseGossip();
							return false;
						}

					}break;


					case 3:
					{
						uint32 guid = pPlayer->GetGUID();
						bool gild = false;
						gild = pPlayer->GetGuild();

						if (gild)
						{
							QueryResult accountres = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
							uint32 accountresint = (*accountres)[0].GetUInt32();
							QueryResult charresult = CharacterDatabase.PQuery("Select count(guid) From characters where account = '%u'", accountresint);
							uint32 charresultint = (*charresult)[0].GetUInt32();

							/*Gildenselect*/
							QueryResult guildid = CharacterDatabase.PQuery("SELECT guildid FROM guild_member WHERE guid= %u", guid);
							uint32 guildidint = (*accountres)[0].GetUInt32();

							/*Gildenmemberanzahl*/
							QueryResult guildmember = CharacterDatabase.PQuery("SELECT count(guid) FROM guild_member WHERE guildid = %u", guildidint);
							uint32 guildmemberint = (*guildmember)[0].GetUInt32();


							QueryResult onechar = CharacterDatabase.PQuery("Select count(guid) From first_char where guid = '%u'", guid);
							uint32 onecharint = (*onechar)[0].GetUInt32();

							/*Username*/
							QueryResult guidname = CharacterDatabase.PQuery("SELECT name FROM characters where guid = %u", guid);
							std::string charname = (*guidname)[0].GetString();

							/*Accname*/
							QueryResult accountname = LoginDatabase.PQuery("SELECT username FROM account where id = %u", accountresint);
							std::string accname = (*accountname)[0].GetString();


							QueryResult ipadr = LoginDatabase.PQuery("SELECT last_ip FROM account where id = %u", accountresint);
							std::string ipadrint = (*ipadr)[0].GetString();
							/*IPAdresse auslesen*/
							QueryResult ipadrcount = LoginDatabase.PQuery("SELECT count(last_ip) FROM account WHERE last_ip = '%s'", ipadrint);
							uint32 ipadrcountint = (*ipadrcount)[0].GetUInt32();

							/*Acccountanzahl z�hlen*/
							QueryResult accountanz = CharacterDatabase.PQuery("SELECT account FROM characters WHERE guid = %u", guid);
							uint32 accountanzint = (*accountanz)[0].GetUInt32();
							QueryResult accountgesanz = CharacterDatabase.PQuery("SELECT count(account) FROM first_char WHERE account = '%u'", accountanzint);
							uint32 accountanzgesint = (*accountgesanz)[0].GetUInt32();

							time_t seconds;
							seconds = time(NULL);
							uint32 zeit = seconds;


							if (guildmemberint > 25 && charresultint == 1 && ipadrcountint == 1 && onecharint != 1 && accountanzgesint <= 1){
								pPlayer->SetLevel(80);
								pPlayer->LearnDefaultSkill(762, 4);
								pPlayer->TeleportTo(0, -792.84, -1607.55, 142.30, 2.33, 0);
								pPlayer->AddItem(20400, 4);
								pPlayer->SetMoney(50000000);
								pPlayer->UpdateSkillsToMaxSkillsForLevel();


								ss << "|cff54b5ffEine 25er Gildenfirstausstattung wurde von |r " << ChatHandler(pPlayer->GetSession()).GetNameLink() << " |cff54b5ff in Anspruch genommen!|r";
								sWorld->SendGMText(LANG_GM_BROADCAST, ss.str().c_str());
								CharacterDatabase.PExecute("REPLACE INTO first_char "
									"(guid,Charname, account, Accname, time, guildid,ip) "
									"VALUES ('%u', '%s', %u, '%s', %u, %u, '%s')",
									guid, charname, accountresint, accname, zeit, guildidint, ipadrint);
								return true;
							}

							if (onecharint != 1){
								pPlayer->GetSession()->SendNotification("Du hast mehr als einen Charakter auf deinem Account. Es darf nur der ERSTE Charakter ausgestattet werden.");
							}

							if (guildmemberint < 25){
								pPlayer->GetSession()->SendNotification("Deine Gilde hat weniger als 25 Gildenmitglieder.");
							}

							

							else{
								ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Deine Gilde ist nicht neu, oder hat nicht genug oder zu viele Mitglieder.",
									pPlayer->GetName());
								pPlayer->PlayerTalkClass->SendCloseGossip();
								return true;
							}


							return true;

						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Tut mir Leid du bist in keiner Gilde.",
								pPlayer->GetName());
							pPlayer->PlayerTalkClass->SendCloseGossip();
							return false;
						}
					}break;


					case 4:
					{
						ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Diese Funktion wird noch implementiert.",
							pPlayer->GetName());
						pPlayer->PlayerTalkClass->SendCloseGossip();

						return true;

					}break;



					case 10:
					{

						uint32 guid = pPlayer->GetGUID();
						uint32 acc = pPlayer->GetSession()->GetAccountId();

						if (pPlayer->HasEnoughMoney(5000 * GOLD)){
							pPlayer->GetGUID();
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Deine Aufwertung wurde ausgefuehrt. Viel Spass wuenscht Exitare sowie das MMOwning-Team.",
								pPlayer->GetName());

							ss << "|cff54b5ffEine 2t Ausstattung wurde von |r " << ChatHandler(pPlayer->GetSession()).GetNameLink() << " |cff54b5ff in Anspruch genommen!|r";
							sWorld->SendGMText(LANG_GM_BROADCAST, ss.str().c_str());
							pPlayer->TeleportTo(0, -792.84, -1607.55, 142.30, 2.33, 0);
							pPlayer->PlayerTalkClass->SendCloseGossip();
							pPlayer->ModifyMoney(-5000 * GOLD);
							std::string name = pPlayer->GetName();

							WorldDatabase.PExecute("INSERT INTO zweitausstattung "
								"(uid,spieler, account) "
								"VALUES ('%u', '%s', '%u')",
								guid, name, acc);
							return true;
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast nicht genug Gold. Du brauchst 5000 Gold um dir dein Equipment zu kaufen.",
								pPlayer->GetName());

						}

						return true;
					}break;


					case 12:
					{


						pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());
						pPlayer->PlayerTalkClass->ClearMenus();

						pPlayer->ADD_GOSSIP_ITEM(7, "Bergbau", GOSSIP_SENDER_MAIN, 13);
						pPlayer->ADD_GOSSIP_ITEM(7, "Schneiderei", GOSSIP_SENDER_MAIN, 14);
						pPlayer->ADD_GOSSIP_ITEM(7, "Schmiedekunst", GOSSIP_SENDER_MAIN, 15);
						pPlayer->ADD_GOSSIP_ITEM(7, "Kraeuterkunde", GOSSIP_SENDER_MAIN, 16);
						pPlayer->ADD_GOSSIP_ITEM(7, "Kuerschner", GOSSIP_SENDER_MAIN, 17);
						pPlayer->ADD_GOSSIP_ITEM(7, "Lederer", GOSSIP_SENDER_MAIN, 18);
						pPlayer->ADD_GOSSIP_ITEM(7, "Juwelierskunst", GOSSIP_SENDER_MAIN, 19);
						pPlayer->ADD_GOSSIP_ITEM(7, "Alchemie", GOSSIP_SENDER_MAIN, 20);
						pPlayer->ADD_GOSSIP_ITEM(7, "Verzauberkunst", GOSSIP_SENDER_MAIN, 21);
						

						pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
						return true;

					}break;

					//Bergbau
					case 13:
					{

						if (pPlayer->HasSkill(186) && pPlayer->HasEnoughMoney(3000* GOLD)){
							pPlayer->LearnDefaultSkill(186, 6);
							uint32 skill = pPlayer->GetSkillValue(186);
							pPlayer->SetSkill(186, pPlayer->GetSkillStep(186), skill,450);
							
							
							
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;

					//Schneiderei
					case 14:
					{

						if (pPlayer->HasSkill(197) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(197, 6);
							pPlayer->UpdateSkillsToMaxSkillsForLevel();

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//Schmiedekunst
					case 15:
					{

						if (pPlayer->HasSkill(164) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(164, 6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//Kraeuterkunde
					case 16:
					{

						if (pPlayer->HasSkill(182) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(182, 6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//K�rschner
					case 17:
					{

						if (pPlayer->HasSkill(393) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(393,6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//Lederer
					case 18:
					{

						if (pPlayer->HasSkill(165) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(165, 6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//Juwe
					case 19:
					{

						if (pPlayer->HasSkill(755) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(755, 6);
							uint32 skill = pPlayer->GetSkillValue(755);
							pPlayer->SetSkill(755, 6, skill, 450);
							


							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;



					//Alchemie
					case 20:
					{

						if (pPlayer->HasSkill(171) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(171, 6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					//VZ
					case 21:
					{

						if (pPlayer->HasSkill(333) && pPlayer->HasEnoughMoney(3000 * GOLD)){
							pPlayer->LearnDefaultSkill(333, 6);

							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Dein Beruf wurde hochgesetzt.",
								pPlayer->GetName());
						}

						else {
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Aufwertungs System] Du hast diesen Beruf leider nicht erlernt.",
								pPlayer->GetName());
						}

					}break;


					case 22:
					{
						uint32 guid = pPlayer->GetGUID();

						pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());
						pPlayer->PlayerTalkClass->ClearMenus();
						pPlayer->ADD_GOSSIP_ITEM(7, "XP Boost: 1 Stunde Kosten: 500 Gold", GOSSIP_SENDER_MAIN, 24);
						
						pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
						return true;

					}break;


					case 23:
					{
						if (pPlayer->HasEnoughMoney(5000 * GOLD)){
							pPlayer->ModifyMoney(-5000 * GOLD);
							srand(time(NULL));
							int r = rand();

							std::string grund = "Gutschein";

							if (r % 5 == 0){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt,name) Values ('%s','%u','%u','%u','%s')", grund, ASTRALER_KREDIT, r, 1, pPlayer->GetName());
								Item* item = Item::CreateItem(ASTRALER_KREDIT, 5);
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und die Belohnung zugesendet!");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								item->SaveToDB(trans);
								MailDraft("Dein Gutscheincode", "Dein Code wurde erfolgreich eingeloest. Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team").AddItem(item)
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 1){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt,name) Values ('%s','%u','%u','%u','%s')", grund, 9999, 5, 1, pPlayer->GetName());
								
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und die Belohnung zugesendet!");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								MailDraft("Dein Gutscheincode", "Dein Code wurde erfolgreich eingeloest. Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team").AddMoney(10000 * GOLD)
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 2){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt,name) Values ('%s','%u','%u','%u','%s')", grund, FROSTMARKEN, r, 1, pPlayer->GetName());
								Item* item = Item::CreateItem(FROSTMARKEN, 2);
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und die Belohnung zugesendet!");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								item->SaveToDB(trans);
								MailDraft("Dein Gutscheincode", "Dein Code wurde erfolgreich eingeloest. Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team").AddItem(item)
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 3){
								
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt,name) Values ('%s','%u','%u','%u','%s')", grund, TRIUMPHMARKEN, r, 1, pPlayer->GetName());
								Item* item = Item::CreateItem(TRIUMPHMARKEN, 4);
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und die Belohnung zugesendet!");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								item->SaveToDB(trans);
								MailDraft("Dein Gutscheincode", "Dein Code wurde erfolgreich eingeloest. Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team").AddItem(item)
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 4){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt,name) Values ('%s','%u','%u','%u','%s')", grund, TRIUMPHMARKEN, r, 1, pPlayer->GetName());
								Item* item = Item::CreateItem(ASTRALER_KREDIT, 5);
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und die Belohnung zugesendet!");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								item->SaveToDB(trans);
								MailDraft("Dein Gutscheincode", "Dein Code wurde erfolgreich eingeloest. Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team").AddItem(item)
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}
						}


					}break;

					case 25:
					{
						pPlayer->PlayerTalkClass->ClearMenus();
						pPlayer->ADD_GOSSIP_ITEM(7, "Gutschein generieren [Kosten: 5000G]", GOSSIP_SENDER_MAIN, 23);
						
							if (pPlayer->GetSession()->IsPremium()){
								pPlayer->ADD_GOSSIP_ITEM(7, "Gutschein zum Verschenken generieren [Kosten: 5000 Gold]", GOSSIP_SENDER_MAIN, 24);
							}
						
						pPlayer->ADD_GOSSIP_ITEM(7, "Level 80 Equipment. [Kosten: 5000G]", GOSSIP_SENDER_MAIN, 10);
					

						if (pPlayer->GetSession()->GetSecurity() == 3){	
							pPlayer->ADD_GOSSIP_ITEM(7, "Berufe skillen [Nicht aktiv, geht nicht!]", GOSSIP_SENDER_MAIN, 12);
							pPlayer->ADD_GOSSIP_ITEM(7, "Aufwertungen einsehen", GOSSIP_SENDER_MAIN, 4);
						}

						pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
						return true;
					}break;

					case 24:
					{
						
					/*	if (pPlayer->HasEnoughMoney(5000 * GOLD) && pPlayer->GetSession()->IsPremium() || pPlayer->HasEnoughMoney(10000 * GOLD) && !pPlayer->GetSession()->IsPremium()){
							if (pPlayer->GetSession()->IsPremium()){
								pPlayer->ModifyMoney(-5000 * GOLD);
							}
							
							else {
								pPlayer->ModifyMoney(-10000 * GOLD);
							}
							
							srand(time(NULL));
							int r = rand();

							std::string str;
							auto randchar = []() -> char
							{
								const char charset[] =
									"0123456789"
									"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
									"abcdefghijklmnopqrstuvwxyz";
								const size_t max_index = (sizeof(charset) - 1);
								return charset[rand() % max_index];
							};
							std::string str(20, 0);
							std::generate_n(str.begin(), 20, randchar);
							

							uint32 anzahl = 1 + (std::rand() % (5 - 1 + 1));


							if (r % 5 == 0){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt) Values ('%s','%u','%u','%u')", str, ASTRALER_KREDIT, anzahl, 0);
								std::ostringstream ss;
								//ss << "Dein Code lautet:" << str << " . Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team";
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und dir zugesendet.");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								MailDraft("Dein Gutscheincode", ss.str().c_str())
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 1){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt) Values ('%s','%u','%u','%u')", str, 9999, anzahl, 0);

								std::ostringstream ss;
								//ss << "Dein Code lautet: " << str << " . Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team";
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und dir zugesendet.");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								MailDraft("Dein Gutscheincode", ss.str().c_str())
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 2){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt) Values ('%s','%u','%u','%u')", str, FROSTMARKEN, anzahl, 0);
								
								std::ostringstream ss;
								//ss << "Dein Code lautet:" << str << " . Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team";
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und dir zugesendet.");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								
								MailDraft("Dein Gutscheincode", ss.str().c_str())
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 3){

								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt) Values ('%s','%u','%u','%u')", str, TRIUMPHMARKEN, anzahl, 0);
								
								std::ostringstream ss;
								//ss << "Dein Code lautet:" << str << " . Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team";
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und dir zugesendet.");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								
								MailDraft("Dein Gutscheincode", ss.str().c_str())
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}

							if (r % 5 == 4){
								WorldDatabase.PExecute("INSERT INTO item_codes (code,belohnung,anzahl,benutzt) Values ('%s','%u','%u','%u')", str, TRIUMPHMARKEN, anzahl, 0);
								
								std::ostringstream ss;
								//ss << "Dein Code lautet:" << str << " . Wir wuenschen dir weiterhin viel Spass auf MMOwning. Dein MMOwning-Team";
								pPlayer->GetSession()->SendNotification("Dein Code wurde generiert und dir zugesendet.");
								SQLTransaction trans = CharacterDatabase.BeginTransaction();
								
								MailDraft("Dein Gutscheincode", ss.str().c_str())
									.SendMailTo(trans, MailReceiver(pPlayer, pPlayer->GetGUID()), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM));
								CharacterDatabase.CommitTransaction(trans);
							}
						}
							
						else{
							pPlayer->GetSession()->SendNotification("Du hast nicht genug Gold.");
							ChatHandler(pPlayer->GetSession()).PSendSysMessage("[Gutschein System] Du hast nicht genug Gold. Als Elitespieler brauchst du 5000 Gold als normaler Spieler 10.000 Gold.",
								pPlayer->GetName());
						}
						*/
					}break;

				

					}
					return true;
				}
					
};
				






void AddSC_npcfirstchar()
{
	new npc_first_char();
}