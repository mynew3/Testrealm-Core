CREATE TABLE IF NOT EXISTS `item_codes` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `code` VARCHAR(45) NOT NULL COMMENT '',
  `belohnung` INT NULL COMMENT '',
  `anzahl` INT NULL COMMENT '',
  `benutzt` INT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '');



CREATE TABLE IF NOT EXISTS `eventteamlog` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `player` VARCHAR(45) NULL COMMENT '',
  `guid` INT NULL COMMENT '',
  `itemid` INT NULL COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '');
