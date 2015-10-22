DELETE FROM `creature_template` WHERE `entry` = 800068;
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`,`npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) 

VALUES ( /*  ID */ 800068,
  /*  Dificculty 1 */0,
 /* Dif2  */ 0,
  /*  Dif3 */0,
  /* KillCredit1  */0,
  /*  KillCredit2  */0,
  /* Modelid  */21822,
  /* Modelid2  */0,
  /* Modelid3   */0,
  /* Model4  */ 0,
 /* Name  */'Der Halloweenschreck',
  /*  Subname */'Der schreckhafte Schrecken',
  /*  Iconname */'',
  /* gossip_menu_id`  */0,
  /*  Min Level */83,
  /* Max Level  */83,
  /*  Exp */0,
  21,
  /*  npcflag Was ist er Questgeber oder weiteres? */0,
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
  /*  lootid */800068,
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
  /* Scriptname  */'');
  
UPDATE `creature_template` SET `HealthModifier`='150', `ArmorModifier`='20', `DamageModifier`='60' WHERE `entry`='800068';
DELETE FROM `creature` WHERE `id` = 800068;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
('800068','800068','0','1','1','21822','0','-4887.84','-2754.46','325.66','3.62','43200','5000','0','1000000','250000','1');


DELETE FROM `creature_loot_template` WHERE `Entry` = 800068;
REPLACE INTO `creature_loot_template` (`Entry`,`Item`,`Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`)
VALUES 
/* Group 1*/
(800068,700511, 0, 20, 0, 1, 1, 1, 1),
(800068,2846, 0, 20, 0, 1, 1, 1, 5),
(800068,44836, 0, 20, 0, 1, 1, 1, 5),
(800068,4656, 0, 20, 0, 1, 1, 1, 5),
(800068,46784, 0, 20, 0, 1, 1, 1, 5),
/*Group2 */
(800068,700519, 0, 20, 0, 1, 2, 5, 10),
(800068,44862, 0, 20, 0, 1, 2, 1, 5),
(800068,33154, 0, 20, 0, 1, 2, 1, 5),
(800068,33117, 0, 20, 0, 1, 2, 1, 5),
(800068,20557, 0, 20, 0, 1, 2, 1, 5),

/*GRoup 3 */
(800068,700499, 0, 10, 0, 1, 3, 1, 2),
(800068,44626, 0, 10, 0, 1, 3, 1, 5),
(800068,7293, 0, 10, 0, 1, 3, 1, 5),
(800068,43268, 0, 20, 0, 1, 3, 1, 5),
(800068,43138, 0, 20, 0, 1, 3, 1, 5),
(800068,42431, 0, 20, 0, 1, 3, 1, 5),
(800068,700498, 0, 10, 0, 1, 3, 1, 1);