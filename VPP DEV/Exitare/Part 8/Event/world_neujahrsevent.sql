DELETE FROM `game_event` WHERE `eventEntry` = 75;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`)
VALUES (75, '2015-10-21 21:00:00', '2030-11-10 20:00:00', '527040', '28740', '0','Neujahrsevent', '0');

/*Gameobject id = 19021 Rusty Chest */
DELETE FROM `gameobject_loot_template` where `entry` = 2971 and `item` = 700522;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES ('2971', '700522', '0', '100', '0', '1', '0', '1', '1');




/* NPC EVENT PORTER KALASTORIA */

DELETE FROM `creature_template` WHERE `entry` = 800096;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`,`npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) 

VALUES ( /*  ID */ 800096,
  /*  Dificculty 1 */0,
 /* Dif2  */ 0,
  /*  Dif3 */0,
  /* KillCredit1  */0,
  /*  KillCredit2  */0,
  /* Modelid  */7625,
  /* Modelid2  */0,
  /* Modelid3   */0,
  /* Model4  */ 0,
 /* Name  */'Kalastoria',
  /*  Subname */'',
  /*  Iconname */'',
  /* gossip_menu_id`  */0,
  /*  Min Level */80,
  /* Max Level  */80,
  /*  Exp */0,
  35,
  /*  npcflag Was ist er Questgeber oder weiteres? */3,
  /*  Speedwalk */1,
 /*  speedrun */ 1,
  /*  scale */0,
  /*  rank  Normal, Elite?*/3,
  /*  dmgschool Normal Holy Fire? */0,
  /* BaseAttackTime`  */3000,
  /* RangeAttackTime`  */5000,
  /*  Welche Klasse? Krieger Pala, also Mana oder kein MAna? */0,
  /*  unit flag */0,
  /*  unit flags2  */0,
  /*  dynamicflag */0,
  /* Family  */0,
  /*  Trainer type */0,
  /*  trainer spell */0,
  /*  trainer class */0,
  /* trainer race  */0,
  /* type  */0,
  /* type flag  */ 0,
  /*  lootid */0,
  /*  pickpocketloot` */0,
/*Skinloot*/ 0,  
  /* Restistance1  */300,
  /*   */300,
  /*   */300,
  /*   */300,
  /*   */300,
  /*  Resi 6*/300,
  /* spell1  */0,
  /*   */0,
  /*   */0,
  /*   */0, 
  /*   */0, 
  /*   */0, 
  /*   */0, 
  /*  Spell8 */0, 
  /*  Petspelldataid */0, 
 /*   VehicleId` */ 0, 
  /* mingold`  */0, 
  /* MaxGold  */0, 
  /*  AiName */'',
  /*  Movement Type */1, 
  /*Inhabit Type   */1, 
  /*  Hoverheight */1, 
  /* Racial Leader  */0,
 /* movement id  */ 0, 
  /*  RegenHealth`` */1, 
  /*  mechanic_immune_mask` */0, 
  /*  flags_extra` */0, 
  /* Scriptname  */'neujahrsevent');
  
  DELETE FROM `creature` WHERE `id` = 800096;
  /* Sturmwind */
  REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
('800096','800096','0','1','1','7625','0','-8857.28','638.38','96.23','2.02','120','0','0','1000000','250000','0');



/* QUEST 900100 */ 

DELETE FROM `quest_template` WHERE  `id` = 900100;
DELETE FROM `quest_template_addon` WHERE `id` = 900100;
DELETE FROM `creature_questender` WHERE `id` = 800096 AND `quest` = 900100;
DELETE FROM `creature_queststarter` WHERE `id` = 800096   AND `quest` = 900100;


REPLACE INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(
/* Id  */ '900100', 
/* TYPE  */ '2',
/* LEVEL  */ '80',
/* MINLevel  */ '80',
/* QuestSortID`  */'-22',
/* QuestInfoID`  */ '0',
/* SuggestedGroupNum`  */ '0',
/* RequiredFactionId1`  */'0',
/* RequiredFactionId2`  */'0',
/* RequiredFactionValue1`  */'0',
/* RequiredFactionValue2` */ '0',
/* RewardNextQuest` */'0',
/* RewardXPDifficulty` */ '0', 
/* RewardMoney`  */'0', 
/* RewardBonusMoney` */'0',
/* RewardDisplaySpell`  */'0',
/* RewardSpell`  */'0',
/* RewardHonor` */ '0',
/* RewardKillHonor` */ '0',
/* Startitem */ '0',
/* Flags` */ '0',
/* RequiredPlayerKills`  */'0',
/* RewardItem1` */ '0',
/* RewardAmount1` */ '0',
/* RewardItem2`  */'0',
/* RewardAmount2`  */'0',
/* RewardItem3`   */'0',
/* RewardAmount3  */ '0',
/* RewardItem4`  */ '0',
/* RewardAmount4   */'0',
/* ItemDrop1`  */'0',
/* ItemDropQuantity1` */'0',
/* Itemdrop2  */'0',
/* Quantity2 */ '0',
/* ItemDrop3` */ '0',
/* Quantity3 */ '0',
/* ItemDrop4`  */ '0', 
/* Itemdropquantity4   */'0',
/* RewardChoiceItemID1  */'0',
/* RewardChoiceItemQuantity1 */ '0',
/* RewardChoiceItemID2`  */'0',
/* RewardChoiceItemQuantity2` */ '0',
/* RewardChoiceItemID3`  */ '0',
/* RewardChoiceItemQuantity3`   */'0',
/* RewardChoiceItemID4`  */'0',
/* RewardChoiceItemQuantity4` */ '0',
/* RewardChoiceItemID5`  */'0',
/* RewardChoiceItemQuantity5`  */ '0',
/* RewardChoiceItemID6  */		'0',
/* RewardChoiceItemQuantity6`   */'0',
/* POIContinent   */'0',
/* POIx   */'0',
/* POIy*/ '0',
/* POIPriority */ '0',
/* RewardTitle */ '0',
/* RewardTalents  */ '0',
/* RewardArenaPoints  */ '0',
/* RewardFactionID1*/'0',
/* RewardFactionValue1   */ '0',
/* RewardFactionOverride1  */ '0',
/* RewardFactionID2   */ '0',
/* RewardFactionValue2`   */'0',
/* RewardFactionOverride2  */ '0',
/* RewardFactionID3`   */'0',
/* RewardFactionValue3`  */ '0',
/* RewardFactionOverride3*/ '0',
/* RewardFactionID4`   */ '0',
/* RewardFactionValue4*/ '0',
/* RewardFactionOverride4 */ '0',
/* RewardFactionID5`   */'0',
/* RewardFactionValue5*/ '0',
/* RewardFactionOverride5  */ '0',
/* TimeAllowed  */ '0',
/* AllowableRaces  */ '1791',
/* LogTitle   */'Frohes Neujahr',
/* LogDescription  */ 'Wir feiern gemeinsam Neujahr. Begebt Euch als erstes zum Labyrinth.',
/* QuestDescription   */'Willkommen beim Neujahrsevent. Begebt Euch als erstes zum Labyrinth. Ihr muesst nur euren Weg suchen, den benoetigten NPC werden ihr finden.',
/* QuestCompletionLog  */ 'Es ist eure Sache was ihr tut.',
/* RequiredNpcOrGo1   */'0',
/* RequiredNpcOrGo2`  */ '0',
/* RequiredNpcOrGo3`   */'0',
/* RequiredNpcOrGo4`  */ '0',
/* RequiredNpcOrGoCount1  */ '0',
/* RequiredNpcOrGoCount2`  */ '0',
/* RequiredNpcOrGoCount3`  */ '0',
/* RequiredNpcOrGoCount4`   */'0',
/* RequiredItemId1  */ '700522',
/* RequiredItemId2`  */ '0',
/* RequiredItemId3` */ '0',
/* RequiredItemId4`   */'0',
/* RequiredItemId5`  */ '0',
/* RequiredItemId6`  */ '0',
/* RequiredItemCount1   */'1',
/* RequiredItemCount2`  */ '0',
/* RequiredItemCount3`  */ '0',
/* RequiredItemCount4`   */'0',
/* RequiredItemCount5`   */'0',
/* RequiredItemCount6` */ '0',
/* Unknown0   */'0',
/* ObjectiveText1   */'0',
/* ObjectiveText2`   */'0',
/* ObjectiveText3`   */'0',
/* ObjectiveText4`    */'0',
/*  VerifiedBuild  */ '0');


REPLACE INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
( /*  ID  */900100,
  /*  MaxLevel  */80,
  /*  AllowableClasses  */2047,
  /*  SourceSpellID  */ 0,
  /*   PrevQuestID */ 0,
  /*  NextQuestID  */900101,
  /*  ExclusiveGroup  */ 0,
  /*   RewardMailTemplateID */ 0,
  /*  RewardMailDelay  */ 0,
  /*  RequiredSkillID  */ 0,
  /*  RequiredSkillPoints  */ 0,
  /*  RequiredMinRepFaction  */ 0,
  /*  RequiredMaxRepFaction  */ 0,
  /*   RequiredMinRepValue */ 0,
  /*  RequiredMaxRepValue  */ 0,
  /*  ProvidedItemCount  */ 0,
  /*   SpecialFlags */ 0);

REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(800096, 900100);

REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(800096, 900100);



/* QUEST 900101 */
DELETE FROM `quest_template` WHERE  `id` = 900101;
DELETE FROM `quest_template_addon` WHERE `id` = 900101;
DELETE FROM `creature_questender` WHERE `id` = 800096 AND `quest` = 900101;
DELETE FROM `creature_queststarter` WHERE `id` = 800096   AND `quest` = 900101;


REPLACE INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(
/* Id  */ '900101', 
/* TYPE  */ '2',
/* LEVEL  */ '80',
/* MINLevel  */ '80',
/* QuestSortID`  */'-22',
/* QuestInfoID`  */ '0',
/* SuggestedGroupNum`  */ '0',
/* RequiredFactionId1`  */'0',
/* RequiredFactionId2`  */'0',
/* RequiredFactionValue1`  */'0',
/* RequiredFactionValue2` */ '0',
/* RewardNextQuest` */'0',
/* RewardXPDifficulty` */ '0', 
/* RewardMoney`  */'0', 
/* RewardBonusMoney` */'0',
/* RewardDisplaySpell`  */'0',
/* RewardSpell`  */'0',
/* RewardHonor` */ '0',
/* RewardKillHonor` */ '0',
/* Startitem */ '0',
/* Flags` */ '0',
/* RequiredPlayerKills`  */'0',
/* RewardItem1` */ '0',
/* RewardAmount1` */ '0',
/* RewardItem2`  */'0',
/* RewardAmount2`  */'0',
/* RewardItem3`   */'0',
/* RewardAmount3  */ '0',
/* RewardItem4`  */ '0',
/* RewardAmount4   */'0',
/* ItemDrop1`  */'0',
/* ItemDropQuantity1` */'0',
/* Itemdrop2  */'0',
/* Quantity2 */ '0',
/* ItemDrop3` */ '0',
/* Quantity3 */ '0',
/* ItemDrop4`  */ '0', 
/* Itemdropquantity4   */'0',
/* RewardChoiceItemID1  */'0',
/* RewardChoiceItemQuantity1 */ '0',
/* RewardChoiceItemID2`  */'0',
/* RewardChoiceItemQuantity2` */ '0',
/* RewardChoiceItemID3`  */ '0',
/* RewardChoiceItemQuantity3`   */'0',
/* RewardChoiceItemID4`  */'0',
/* RewardChoiceItemQuantity4` */ '0',
/* RewardChoiceItemID5`  */'0',
/* RewardChoiceItemQuantity5`  */ '0',
/* RewardChoiceItemID6  */		'0',
/* RewardChoiceItemQuantity6`   */'0',
/* POIContinent   */'0',
/* POIx   */'0',
/* POIy*/ '0',
/* POIPriority */ '0',
/* RewardTitle */ '0',
/* RewardTalents  */ '0',
/* RewardArenaPoints  */ '0',
/* RewardFactionID1*/'0',
/* RewardFactionValue1   */ '0',
/* RewardFactionOverride1  */ '0',
/* RewardFactionID2   */ '0',
/* RewardFactionValue2`   */'0',
/* RewardFactionOverride2  */ '0',
/* RewardFactionID3`   */'0',
/* RewardFactionValue3`  */ '0',
/* RewardFactionOverride3*/ '0',
/* RewardFactionID4`   */ '0',
/* RewardFactionValue4*/ '0',
/* RewardFactionOverride4 */ '0',
/* RewardFactionID5`   */'0',
/* RewardFactionValue5*/ '0',
/* RewardFactionOverride5  */ '0',
/* TimeAllowed  */ '0',
/* AllowableRaces  */ '1791',
/* LogTitle   */'Frohes Neujahr',
/* LogDescription  */ 'Wir feiern gemeinsam Neujahr. Begebt Euch nun durch das Labyrinth.',
/* QuestDescription   */'Willkommen beim Neujahrsevent. Begebt Euch nun durch das Labyrinth. Ihr muesst nur euren Weg suchen, den benoetigten NPC werden ihr finden.',
/* QuestCompletionLog  */ 'Es ist eure Sache was ihr tut.',
/* RequiredNpcOrGo1   */'800098',
/* RequiredNpcOrGo2`  */ '0',
/* RequiredNpcOrGo3`   */'0',
/* RequiredNpcOrGo4`  */ '0',
/* RequiredNpcOrGoCount1  */ '1',
/* RequiredNpcOrGoCount2`  */ '0',
/* RequiredNpcOrGoCount3`  */ '0',
/* RequiredNpcOrGoCount4`   */'0',
/* RequiredItemId1  */ '0',
/* RequiredItemId2`  */ '0',
/* RequiredItemId3` */ '0',
/* RequiredItemId4`   */'0',
/* RequiredItemId5`  */ '0',
/* RequiredItemId6`  */ '0',
/* RequiredItemCount1   */'0',
/* RequiredItemCount2`  */ '0',
/* RequiredItemCount3`  */ '0',
/* RequiredItemCount4`   */'0',
/* RequiredItemCount5`   */'0',
/* RequiredItemCount6` */ '0',
/* Unknown0   */'0',
/* ObjectiveText1   */'0',
/* ObjectiveText2`   */'0',
/* ObjectiveText3`   */'0',
/* ObjectiveText4`    */'0',
/*  VerifiedBuild  */ '0');


REPLACE INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
( /*  ID  */900101,
  /*  MaxLevel  */80,
  /*  AllowableClasses  */2047,
  /*  SourceSpellID  */ 0,
  /*   PrevQuestID */ 900100,
  /*  NextQuestID  */900102,
  /*  ExclusiveGroup  */ 0,
  /*   RewardMailTemplateID */ 0,
  /*  RewardMailDelay  */ 0,
  /*  RequiredSkillID  */ 0,
  /*  RequiredSkillPoints  */ 0,
  /*  RequiredMinRepFaction  */ 0,
  /*  RequiredMaxRepFaction  */ 0,
  /*   RequiredMinRepValue */ 0,
  /*  RequiredMaxRepValue  */ 0,
  /*  ProvidedItemCount  */ 0,
  /*   SpecialFlags */ 0);

REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(800096, 900101);

REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(800096, 900101);