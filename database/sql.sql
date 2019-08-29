CREATE DATABASE maratona_fotografica;

USE maratona_fotografica;

CREATE TABLE IF NOT EXISTS `user` (
	`registration` INTEGER AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `level` INTEGER NOT NULL,
    UNIQUE(`email`),
    PRIMARY KEY(`registration`)
);

CREATE TABLE IF NOT EXISTS `group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `group_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `participant` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_registration` INTEGER NOT NULL,
    `group_id` INTEGER NOT NULL,
    UNIQUE (`user_registration`),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_registration`) REFERENCES `user`(`registration`),
    FOREIGN KEY(`group_id`) REFERENCES `group`(`id`)
);

CREATE TABLE IF NOT EXISTS `theme` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `theme` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `photo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `path` VARCHAR(255) NOT NULL,
    `group_id` INTEGER NOT NULL,
    `theme_id` INTEGER NOT NULL,
    UNIQUE(`group_id`, `theme_id`),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`group_id`) REFERENCES `group`(`id`),
    FOREIGN KEY(`theme_id`) REFERENCES `theme`(`id`)
);

CREATE TABLE IF NOT EXISTS `note` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `note` FLOAT NOT NULL,
    `user_registration` INTEGER NOT NULL,
    `photo_id` INTEGER NOT NULL,
    UNIQUE(`user_registration`, `photo_id`),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_registration`) REFERENCES `user`(`registration`),
    FOREIGN KEY(`photo_id`) REFERENCES `photo`(`id`)
);