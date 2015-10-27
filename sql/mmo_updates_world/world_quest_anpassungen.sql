-- Wandervolk Questender
UPDATE `quest_template` SET `RequiredNpcOrGo2`='0', `RequiredNpcOrGoCount2`='0' WHERE `ID`='800005';
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES ('800027', '900800');
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES ('800027', '900801');

/* LIGHT HARDMODE LOOTANPASSUNG */
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800063', '46964', '0', '25', '0', '4', '5', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800063', '46991', '0', '25', '0', '4', '5', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800063', '46993', '0', '25', '0', '4', '5', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800063', '46986', '0', '25', '0', '4', '5', '1', '1');
UPDATE `creature_loot_template` SET `LootMode`='5' WHERE `Entry`='800063' and`Item`='50300';



-- Bitty Frostschleuder FLAGGER
UPDATE `creature_template` SET `npcflag`='3' WHERE `entry`= '32690';

/*Kupferpulver Quest Itemcountanpassung*/
UPDATE `quest_template` SET `RequiredItemCount1`='30' WHERE `ID`='800513';


/*--Beschreibung Halloweenquest 900503*/
UPDATE `quest_template` SET `LogDescription`='Hey $N, wir wollen ein bisschen Action zu Halloween oder nicht ? Bringt mir 20 Grobes Gorillahaar und 15 Gorillafangzaehne. Geht danach zu Orrig vor Orgrimmar.' WHERE `ID`='900503';


/*--Orrig Halloweenquest Starter*/

DELETE FROM `creature_queststarter` WHERE `id` = 800002 and `quest` = 900504;
DELETE FROM `creature_questender` WHERE `id` = 800002 and `quest` = 900504;
REPLACE INTO `game_event_creature_quest` (`eventEntry`, `id`, `quest`) VALUES ('71', '800002', '900504');
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES ('800002', '900504');

/* Halloweenabzeichen stackable */
UPDATE `item_template` SET `stackable`='100' WHERE `entry`='700520';


/* Quest 900509 auf Daily gesetzt */
UPDATE `quest_template` SET `Flags`='4096' WHERE `ID`='900509';


/* MMO Bosse MArken */
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800010', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800025', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800030', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800037', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800038', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800039', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800040', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800041', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800050', '49426', '0', '25', '0', '1', '0', '2', '2');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '49426', '0', '25', '0', '1', '0', '2', '2');


/* Wandervolk Baum*/
UPDATE `creature_template` SET `scale`='2' WHERE `entry`='800072';


/* Eowyn */
UPDATE `creature_template` SET `npcflag`='4227' WHERE `entry`='800027';

/*Lok Regual */
UPDATE `creature_template` SET `name`='Lok Regual', `npcflag`='3', `trainer_race`='0', `type`='0' WHERE `entry`='800009';

/* PVP Vendor ANpassungen */
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40787' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40788' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40789' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40807' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40808' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40809' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40826' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40827' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40828' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40847' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40848' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40849' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40866' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40868' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40869' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40907' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40927' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40933' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40939' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40963' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40992' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='40993' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41001' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41007' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41013' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41019' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41027' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41033' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41038' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41044' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41081' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41087' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41137' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41143' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41151' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41157' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41199' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41205' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41211' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41217' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41275' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41281' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41287' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41293' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41298' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41304' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41310' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41316' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41321' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41327' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41650' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41655' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41661' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41667' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41672' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41678' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41683' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41715' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41767' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41773' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41854' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41859' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41864' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41869' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41874' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41915' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41921' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41927' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41934' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41940' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41946' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41953' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41959' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41965' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41971' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41993' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='41998' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='42005' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='42011' and`ExtendedCost`='2411';
UPDATE  `npc_vendor` SET `ExtendedCost`='0' WHERE `entry`='800019' and`item`='42017' and`ExtendedCost`='2411';
UPDATE    `creature` SET `position_x`='-823.926', `position_y`='1502.19', `position_z`='104.552', `orientation`='5.73852' WHERE `guid`='800019';



/*Boss Spawn Anpassungen */
UPDATE `creature` SET `map`='169', `position_x`='-313.07', `position_y`='3084.26', `position_z`='100.08', `orientation`='0.17' WHERE `guid`='800030';
UPDATE `creature` SET `map`='169', `position_x`='3514.63', `position_y`='4012.01', `position_z`='92.0083', `orientation`='0.384703' WHERE `guid`='800038';
UPDATE `creature` SET `map`='169', `position_x`='-1199.58', `position_y`='-2390.67', `position_z`='109.692', `orientation`='3.71644' WHERE `guid`='800037';
UPDATE `creature` SET `map`='169', `position_x`='-1784.85', `position_y`='-780.503', `position_z`='121.452', `orientation`='5.25372' WHERE `guid`='800035';
UPDATE `creature` SET `map`='169', `position_x`='-2902.88', `position_y`='-1368.75', `position_z`='125.728', `orientation`='5.71264' WHERE `guid`='800039';
UPDATE `creature` SET `map`='169', `position_x`='-2660.49', `position_y`='-2700.24', `position_z`='130.028', `orientation`='3.79707' WHERE `guid`='800041';
UPDATE `creature` SET `map`='169', `position_x`='-4313.12', `position_y`='-1465.59', `position_z`='92.007', `orientation`='3.22764' WHERE `guid`='800050';
UPDATE `creature` SET `map`='169', `position_x`='-4338.46', `position_y`='-719.724', `position_z`='127.903', `orientation`='4.24175' WHERE `guid`='800040';
UPDATE `creature` SET `map`='169', `position_x`='-3694.01', `position_y`='-1061.39', `position_z`='126.757', `orientation`='0.243516' WHERE `guid`='800058';

/*BOSSZEICHEN TYPEFLAGS */
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800010';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800030';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800025';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800038';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800037';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800039';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800041';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800050';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800040';
UPDATE `creature_template` SET `type_flags`='4' WHERE `entry`='800058';

UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800010';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800030';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800025';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800038';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800037';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800039';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800041';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800050';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800040';
UPDATE `creature_template` SET `ArmorModifier`='20' WHERE `entry`='800058';

/* Ein holpriger Ritt 12536 */
UPDATE `quest_template` SET `StartItem`='38512' WHERE `ID`='12536';






/* Die Aufnahme */
UPDATE `quest_template` SET `LogDescription`='Bringt die Schriftensammlung zu Destro MMOwning. Toetet zusaetzlich Geisselfuerst Tyrannus und den den Verschlinger der Seelen.', `QuestDescription`='Bringt die Schriftensammlung zu Destro MMOwning. Ihr findet Ihn an der Kueste von Westfall. Aus seiner Sicht gesehen schaut er auf ein Schriffswrack. Meist hoert er im Wind die Schreie von Murlockreaturen. Zusaetzlich muesst ihr Geisselfuerst Tyrannus und den Verschlinger der Seelen zu toeten.' WHERE `ID`='800005';

/* Therakin */
UPDATE `creature_loot_template` SET `Chance`='1' WHERE `Entry`='800038' and`Item`='21176';
UPDATE `creature_loot_template` SET `Chance`='1' WHERE `Entry`='800038' and`Item`='56806';


/* Arcturus */
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37255';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37256';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37257';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37258';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37363';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37260';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37261';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37262';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37263';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37361';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37360';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37362';
DELETE FROM `creature_loot_template` WHERE `Entry`='800035' and`Item`='37364';
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035 ', '50290', '0', '20', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50292', '0', '20', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50293', '0', '20', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50295', '0', '20', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50294', '0', '20', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50298', '0', '20', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50300', '0', '20', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50260', '0', '20', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50296', '0', '20', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50303', '0', '20', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50314', '0', '20', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50304', '0', '20', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50311', '0', '20', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50305', '0', '20', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50313', '0', '20', '0', '1', '3', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50310', '0', '20', '0', '1', '4', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '50309', '0', '20', '0', '1', '4', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '49844', '0', '20', '0', '1', '4', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '49849', '0', '20', '0', '1', '4', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800035', '49841', '0', '20', '0', '1', '4', '1', '1');
UPDATE `creature_loot_template` SET `Chance`='33.3', `MinCount`='5', `MaxCount`='10' WHERE `Entry`='800035' and`Item`='38186';


/*PVP QUEST */
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800505';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800507';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800508';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800506';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800504';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='803900';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='803903';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='803902';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='803901';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800514';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800515';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800517';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800518';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800519';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800520';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800521';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800522';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800523';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800525';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800526';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800527';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800528';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800529';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800530';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800531';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800532';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800533';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800534';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800535';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800544';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800545';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800546';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800547';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800551';
UPDATE `quest_template` SET `QuestType`='62' WHERE `ID`='800552';


/* WAndervolk 900801 */
UPDATE `quest_template` SET `LogDescription`='Das Wandervolk ist ein interessantes Volk. Um das Volk kennenzulernen braucht ihr 2 Auktionspapiere und 50 Feine Gewuerze', `QuestDescription`='Hallo $N, das Wandervolk ist ein interessantes Volk, welches im Dunkel der Welten hausst. Erfuellt die Quest und ihr steht in ihrer Gunst.', `RequiredItemCount2`='50' WHERE `ID`='900801';

/* MEHR HILFE FUER DAS VOLK 800500 */
UPDATE `quest_template` SET `Flags`='32768' WHERE `ID`='800500';


/* RENAME TYRANIUM */
UPDATE `creature_template` SET `name`='Eonar' WHERE `entry`='800050';


/* BOSSLOOT TOLREOS */
UPDATE `creature_loot_template` SET `MinCount`='2', `MaxCount`='2' WHERE `Entry`='800058' and`Item`='47241';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47248';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47249';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47468';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47495';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47498';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47510';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47512';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47522';
DELETE FROM `creature_loot_template` WHERE `Entry`='800058' and`Item`='47561';
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45110', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45142', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45147', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45170', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45171', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45165', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45246', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45256', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45257', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45233', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45234', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45261', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '45587', '0', '6.25', '0', '1', '1', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '23713', '0', '5', '0', '1', '2', '1', '1');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('800058', '49287', '0', '5', '0', '1', '2', '1', '1');
UPDATE `creature_loot_template` SET `Chance`='5', `MinCount`='1', `MaxCount`='4' WHERE `Entry`='800058' and`Item`='38186';



/* Kuerbissoldaten lootid und loot */
UPDATE `creature_template` SET `lootid`='27936' WHERE `entry`='27936';
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('27936', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('800010', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('800058', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('800040', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('800050', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('800037', '700520', '0', '50', '0', '1', '0', '1', '13', 'Halloweenabzeichen');
/* DELETE FROM `creature_loot_template` WHERE `ENTRY` = 800010 AND `ITEM = 700520; */
/* DELETE FROM `creature_loot_template` WHERE `ENTRY` = 800058 AND `ITEM = 700520; */
/* DELETE FROM `creature_loot_template` WHERE `ENTRY` = 800040 AND `ITEM = 700520; */
/* DELETE FROM `creature_loot_template` WHERE `ENTRY` = 800050 AND `ITEM = 700520; */
/* DELETE FROM `creature_loot_template` WHERE `ENTRY` = 800037 AND `ITEM = 700520; */


/* ARGENTUMGRUNZLING */
UPDATE `creature_template` SET `type_flags`='1216348160' WHERE `entry`='33239';
UPDATE `creature_template` SET `type_flags`='1216348160' WHERE `entry`='33238';
