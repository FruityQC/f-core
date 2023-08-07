CREATE DATABASE IF NOT EXISTS `practice`;
USE `practice`;

CREATE TABLE `users` (
    `steamname` VARCHAR(40) NOT NULL,
    `steamid` VARCHAR(40) NOT NULL,
    `license` VARCHAR(40) NULL,

    PRIMARY KEY (`steamid`)
);