DELETE FROM `quest_template` WHERE  `id` = 870003;
DELETE FROM `quest_template_addon` WHERE `id` = 870003;
DELETE FROM `creature_questender` WHERE `id` = 800056   AND `quest` = 870003;
DELETE FROM `creature_queststarter` WHERE `id` = 800053   AND `quest` = 870003;

REPLACE INTO `quest_template` (`ID`, `Method`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestType`, `SuggestedGroupNum`, `LimitTime`, `RequiredRaces`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `SourceItemId`, `Flags`, `RewardTitle`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItem1`, `RewardItem2`, `RewardItem3`, `RewardItem4`, `RewardAmount1`, `RewardAmount2`, `RewardAmount3`, `RewardAmount4`, `RewardChoiceItemID1`, `RewardChoiceItemID2`, `RewardChoiceItemID3`, `RewardChoiceItemID4`, `RewardChoiceItemID5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity1`, `RewardChoiceItemQuantity2`, `RewardChoiceItemQuantity3`, `RewardChoiceItemQuantity4`, `RewardChoiceItemQuantity5`, `RewardChoiceItemQuantity6`, `RewardFactionID1`, `RewardFactionID2`, `RewardFactionID3`, `RewardFactionID4`, `RewardFactionID5`, `RewardFactionValue1`, `RewardFactionValue2`, `RewardFactionValue3`, `RewardFactionValue4`, `RewardFactionValue5`, `RewardFactionOverride1`, `RewardFactionOverride2`, `RewardFactionOverride3`, `RewardFactionOverride4`, `RewardFactionOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `LogTitle`, `LogDescription`, `QuestDescription`, `EndText`, `OfferRewardText`, `RequestItemsText`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES
(/*  ID    */870003,
 /*  Method  */ 2,
 /*  QuestLevel  */ 80, 
 /*  MinLevel   */80,
 /*  QuestSortID  */ -1,
 /*  QuestType*/ 0,
 /*  SuggestedGroupNum  */ 0,
 /*  LimitTime  */ 0,
 /*  RequiredRaces   */1791,
 /*  RequiredFactionId1   */ 0,
 /*  RequiredFactionId2  */ 0,
 /*  RequiredFactionValue1  */ 0,
 /*  RequiredFactionValue2   */ 0,
 /*  NextQuestIdChain  */ 0,
 /*  RewardXPId   */0,
 /*  RewardOrRequiredMoney  */ 100000,
 /*  RewardMoneyMaxLevel  */ 100000,	
 /*  RewardSpell   */ 0,
 /*  RewardSpellCast  */ 0,
 /*  RewardHonor  */ 0,
 /*  RewardHonorMultiplier  */ 0,
 /*  SourceItemId  */ 0,
 /*  Flags  */ 0,
 /*  RewardTitle  */ 0,
 /*  RequiredPlayerKills  */ 0,
 /*  RewardTalents  */ 0,
 /*  RewardArenaPoints  */ 0,
 /*  RewardItem1  */ 0,
 /*  RewardItem2  */ 0,
 /*  RewardItem3  */ 0,
 /*  RewardItem4  */ 0,
 /*  RewardAmount1*/ 0,
 /*  RewardAmount2  */ 0,
 /*  RewardAmount3  */ 0,
 /*  RewardAmount4  */ 0,
 /*  RewardChoiceItemID1  */ 0,
 /*  RewardChoiceItemID2  */ 0,
 /*  RewardChoiceItemID3  */ 0,
 /*  RewardChoiceItemID4  */ 0,
 /*  RewardChoiceItemID5  */ 0,
 /*  RewardChoiceItemID6  */ 0,
 /*  RewardChoiceItemQuantity1  */ 0,
 /*  RewardChoiceItemQuantity2  */ 0,
 /*  RewardChoiceItemQuantity3  */ 0,
 /*  RewardChoiceItemQuantity4  */ 0,
 /*  RewardChoiceItemQuantity5  */ 0,
 /*  RewardChoiceItemQuantity6  */ 0,
 /*  RewardFactionID1  */ 0,
 /*  RewardFactionID2  */ 0,
 /*  RewardFactionID3  */ 0,
 /*  RewardFactionID4  */ 0,
 /*  RewardFactionID5  */ 0,
 /*  RewardFactionValue1  */ 0,
 /*  RewardFactionValue2  */ 0,
 /*  RewardFactionValue3  */ 0,
 /*  RewardFactionValue4  */ 0,
 /*  RewardFactionValue5 */ 0,
 /*  RewardFactionOverride1  */ 0,
 /*  RewardFactionOverride2  */ 0,
 /*  RewardFactionOverride3  */ 0,
 /*  RewardFactionOverride4  */ 0,
 /*  RewardFactionOverride5  */ 0,
 /*  PointMapId  */ 0,
 /*  PointX  */ 0,
 /*  PointY  */ 0,
 /*  PointOption  */ 0,
 /*  LogTitle  */ 'Die Prinzessin',
 /*  LogDescription  */  'Geht zur Prinzessin der Sammler und hört Euch ihre Geschichte an.',
 /*  QuestDescription   */ 'Hallo $N. Willkommen im Außenposten der Sammler. Macht es Euch bequem, und wenn ihr Interesse habt geht zu Prinzessin Alanna. Sie braucht bestimmt ein offenes Ohr. Wenn ihr Zeit habt, wird sie Euch vielleicht etwas erzählen.',
 /*  EndText */  '',
 /*  OfferRewardText bevor man beendet  */  'Geht zur Prinzessin der Sammler und hört Euch ihre Geschichte an.',
 /*  RequestItemsText  */ 'Hallo $N, hast du die Aufgabe abgeschlossen?',
 /*  Quest Completed Text wird rechts im Questlog angezeigt der Text */ '',
 /*  RequiredNpcOrGo1  */ 0,
 /*  RequiredNpcOrGo2  */ 0,
 /*  RequiredNpcOrGo3  */ 0,
 /*  RequiredNpcOrGo4  */ 0,
 /*  RequiredNpcOrGoCount1  */ 0,
 /*  RequiredNpcOrGoCount2  */ 0,
 /*  RequiredNpcOrGoCount3  */ 0,
 /*  RequiredNpcOrGoCount4  */ 0,
 /*  RequiredSourceItemId1  */ 0,
 /*  RequiredSourceItemId2  */ 0,
 /*  RequiredSourceItemId3  */ 0,
 /*  RequiredSourceItemId4  */ 0,
 /*  RequiredSourceItemCount1  */ 0,
 /*  RequiredSourceItemCount2  */ 0,
 /*  RequiredSourceItemCount3  */ 0,
 /*  RequiredSourceItemCount4  */ 0,
 /*  RequiredItemId1  */ 0,
 /*  RequiredItemId2  */ 0,
 /*  RequiredItemId3  */ 0,
 /*  RequiredItemId4  */ 0,
 /*  RequiredItemId5  */ 0,
 /*  RequiredItemId6  */ 0,
 /*  RequiredItemCount1  */ 0,
 /*  RequiredItemCount2  */ 0,
 /*  RequiredItemCount3  */ 0,
 /*  RequiredItemCount4  */ 0,
 /*  RequiredItemCount5  */ 0,
 /*  RequiredItemCount6  */ 0,
 /*  Unknown0  */ 0,
 /*  ObjectiveText1  */'',
 /*  ObjectiveText2  */'',
 /*  ObjectiveText3  */'',
 /*  ObjectiveText4  */'',
 /*  DetailsEmote1  */ 0,
 /*  DetailsEmote2  */ 0,
 /*  DetailsEmote3  */ 0,
 /*  DetailsEmote4  */ 0,
 /*  DetailsEmoteDelay1  */ 0,
 /*  DetailsEmoteDelay2  */ 0,
 /*  DetailsEmoteDelay3  */ 0,
 /*  DetailsEmoteDelay4  */ 0,
 /*  EmoteOnIncomplete  */ 0,
 /*  EmoteOnComplete  */ 0,
 /*  OfferRewardEmote1  */ 0,
 /*  OfferRewardEmote2  */ 0,
 /*  OfferRewardEmote3  */ 0,
 /*  OfferRewardEmote4  */ 0,
 /*  OfferRewardEmoteDelay1  */ 0,
 /*  OfferRewardEmoteDelay2  */ 0,
 /*  OfferRewardEmoteDelay3  */ 0,
 /*  OfferRewardEmoteDelay4  */ 0,
 1);

REPLACE INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
( /*  ID  */870003,
  /*  MaxLevel  */80,
  /*  AllowableClasses  */2047,
  /*  SourceSpellID  */ 0,
  /*  PrevQuestID */ 870002,
  /*  NextQuestID  */870004,
  /*  ExclusiveGroup  */ 0,
  /*  RewardMailTemplateID */ 0,
  /*  RewardMailDelay  */ 0,
  /*  RequiredSkillID  */ 0,
  /*  RequiredSkillPoints  */ 0,
  /*  RequiredMinRepFaction  */ 0,
  /*  RequiredMaxRepFaction  */ 0,
  /*  RequiredMinRepValue */ 0,
  /*  RequiredMaxRepValue  */ 0,
  /*  ProvidedItemCount  */ 0,
  /*  SpecialFlags */ 0);

REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(800053, 870003);

REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(800056, 870003);


