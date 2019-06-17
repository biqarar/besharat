CREATE TABLE IF NOT EXISTS `section` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`creator` int(10) UNSIGNED DEFAULT NULL,
`title` varchar(500) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`desc` text CHARACTER SET utf8mb4,
`color` varchar(100) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`file` text CHARACTER SET utf8mb4,
`setting` text CHARACTER SET utf8mb4,
`status` enum('draft', 'publish', 'delete', 'expire') NULL DEFAULT NULL,
`score` text CHARACTER SET utf8mb4,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `section_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `level` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`section_id` int(10) UNSIGNED DEFAULT NULL,
`creator` int(10) UNSIGNED DEFAULT NULL,
`title` varchar(500) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`subtitle` varchar(500) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`image` text CHARACTER SET utf8mb4,
`status` enum('draft', 'publish', 'delete', 'expire') NULL DEFAULT NULL,
`startaya` int(10) UNSIGNED DEFAULT NULL,
`endaya` int(10) UNSIGNED DEFAULT NULL,
`learnvideo` text CHARACTER SET utf8mb4,
`file` mediumtext CHARACTER SET utf8mb4,
`desc` text CHARACTER SET utf8mb4,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `level_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `level_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `userlevel` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`level_id` int(10) UNSIGNED DEFAULT NULL,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`status` enum('start', 'complete', 'delete', 'again') NULL DEFAULT NULL,
`score` int(10) UNSIGNED DEFAULT NULL,
`datestart` timestamp NULL DEFAULT NULL,
`dateend` timestamp NULL DEFAULT NULL,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `userlevel_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `userlevel_level_id` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `quiz` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`section_id` int(10) UNSIGNED DEFAULT NULL,
`level_id` int(10) UNSIGNED DEFAULT NULL,
`title` varchar(500) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`type`  varchar(100) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`status` enum('draft', 'publish', 'delete', 'expire') NULL DEFAULT NULL,
`levelload` int(10) UNSIGNED NULL DEFAULT NULL,
`acceptscore` int(10) UNSIGNED NULL DEFAULT NULL,
`askcount` int(10) UNSIGNED NULL DEFAULT NULL,
`visittimes` int(10) UNSIGNED NULL DEFAULT NULL,
`quiztime` int(10) UNSIGNED NULL DEFAULT NULL,
`desc` text CHARACTER SET utf8mb4,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `quiz_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `quiz_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON UPDATE CASCADE,
CONSTRAINT `quiz_level_id` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `question` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`quiz_id` int(10) UNSIGNED DEFAULT NULL,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`title` varchar(500) CHARACTER SET utf8mb4 NULL DEFAULT NULL,
`file` text CHARACTER SET utf8mb4,
`status` enum('draft', 'publish', 'delete', 'expire') NULL DEFAULT NULL,
`randomopt` bit(1) NULL DEFAULT NULL,
`trueanswer` enum(1,2,3,4) NULL DEFAULT NULL,
`option1` text CHARACTER SET utf8mb4,
`option2` text CHARACTER SET utf8mb4,
`option3` text CHARACTER SET utf8mb4,
`option4` text CHARACTER SET utf8mb4,
`desc` text CHARACTER SET utf8mb4,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `question_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `question_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `userquiz` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`quiz_id` int(10) UNSIGNED DEFAULT NULL,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`status` enum('start', 'complete', 'delete', 'again') NULL DEFAULT NULL,
`score` int(10) UNSIGNED DEFAULT NULL,
`datestart` timestamp NULL DEFAULT NULL,
`dateend` timestamp NULL DEFAULT NULL,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `userquiz_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `userquiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `useranswer` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`quiz_id` int(10) UNSIGNED DEFAULT NULL,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`userquiz_id` int(10) UNSIGNED DEFAULT NULL,
`question_id` int(10) UNSIGNED DEFAULT NULL,
`answer` text CHARACTER SET utf8mb4,
`istrue` bit(1) UNSIGNED DEFAULT NULL,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `useranswer_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
CONSTRAINT `useranswer_userquiz_id` FOREIGN KEY (`userquiz_id`) REFERENCES `userquiz` (`id`) ON UPDATE CASCADE,
CONSTRAINT `useranswer_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON UPDATE CASCADE,
CONSTRAINT `useranswer_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `userrank` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`user_id` int(10) UNSIGNED DEFAULT NULL,
`score` int(10) UNSIGNED DEFAULT NULL,
`datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`datemodified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
CONSTRAINT `useranswer_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


