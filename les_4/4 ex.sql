USE vk2;

/*  Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)*/

DROP DATABASE IF EXISTS vk2;

CREATE DATABASE IF NOT EXISTS vk2;

USE vk2;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(145) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(145) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(145) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` char(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('1', 'Andres', 'Hansen', 'mitchell.langosh@example.com', '731.747.148', '2ee04942cf43e9764909613431764e2bc1ed8585', '1985-03-29 05:42:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('2', 'Kathlyn', 'Funk', 'rosalind24@example.org', '+77(7)50355', '0929fdc45a62b929eb867fcd4b62e5fac3deeadb', '2000-07-24 20:28:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('3', 'Alexandrine', 'Bednar', 'roberta29@example.com', '+47(1)37662', 'f029b7303cca2e0127468851b04cbe8406b768ec', '1973-05-25 06:58:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('4', 'Andres', 'Balistreri', 'lyda.hessel@example.net', '1-829-641-0', '82b20532412673adaffa4a72fc0305a7c7cab464', '2011-08-30 15:29:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('5', 'Alessandro', 'Swaniawski', 'aylin92@example.org', '1-297-684-4', '7c1813d0b50b3638437d87e70247d49143e779b4', '1981-08-24 16:03:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('6', 'Glenda', 'Kovacek', 'lcartwright@example.net', '275-094-901', '1917dbd95be9f8f5b031e86a73f9bbe49ad8acd2', '1980-06-05 07:53:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('7', 'Eliane', 'Oberbrunner', 'christophe98@example.com', '152.907.552', '23f6cc2f909a03ce29424e79116cf72b6b840493', '2009-11-02 14:20:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('8', 'Maynard', 'Lebsack', 'hauck.brenna@example.net', '+85(3)76386', 'a56f5813e1b94a2e2a8e9f131a33eb9597fc5325', '1993-08-16 01:05:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('9', 'Ruthie', 'Gusikowski', 'jarrod94@example.org', '(080)489-58', 'f6b9726b45d5f5d86b22a1db3066d2e66193edf0', '1970-01-22 23:43:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('10', 'Deshaun', 'Senger', 'qdietrich@example.com', '187-840-334', '8f8f348d946658c4620d751d48a81aa7bfc107d7', '2004-03-29 12:19:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('11', 'Helga', 'Wiza', 'benny.monahan@example.net', '063.738.670', '86e02ac0f400939a327235007e6401329e4a491e', '1989-01-26 20:33:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('12', 'Thalia', 'Keebler', 'tosinski@example.com', '1-297-904-5', '08b9d3bbaf0554876005d8853a7912654bcd738f', '1996-03-18 21:39:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('13', 'Alex', 'Farrell', 'kendra56@example.com', '255.375.284', '203e8db0a3adb117b37e3d2c852ef2b51294a207', '1987-05-06 01:38:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('14', 'Travis', 'Tillman', 'halvorson.everette@example.org', '+81(1)63163', 'dc87b554d181d6439c97b2a427facf69dcfae17d', '1985-06-06 00:15:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('15', 'Fay', 'Nitzsche', 'gulgowski.hulda@example.net', '+33(6)64188', '898cb073b87a405e13e8962aeea88fbb83d71f1b', '1984-11-23 20:06:04');

#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `txt` text COLLATE utf8_unicode_ci NOT NULL,
  `is_delivered` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `messages_from_user_id_idx` (`from_user_id`),
  KEY `messages_to_user_id_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('1', '1', '1', 'Neque nobis suscipit repellendus nisi nihil molestias. Temporibus ea maiores a. Ut labore quidem necessitatibus cumque tempore amet.', 0, '1977-01-06 07:02:43', '2015-01-05 05:56:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('2', '2', '2', 'Et temporibus sed minima magnam id accusamus voluptas. Repellendus qui qui et et dolorum dolores ex.', 1, '2018-03-12 23:13:34', '1971-07-26 22:51:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('3', '3', '3', 'Explicabo occaecati ea dolore facere a quod placeat. Esse non voluptas et repudiandae. Ipsa dolores sequi consequatur omnis exercitationem.', 1, '1983-03-22 09:55:37', '1988-01-07 18:59:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('4', '4', '4', 'Error hic tempore dolores nihil ea cum. Velit quas iusto quia voluptatem quia consectetur. Hic est et omnis. Consequuntur sed cum porro omnis illum omnis sed.', 1, '2003-09-29 07:13:29', '2010-09-23 01:01:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('5', '5', '5', 'Molestiae et inventore porro accusamus harum provident nostrum. Id explicabo repellat veniam odio tempore qui. Illo quae qui nam odit. Qui dolores mollitia ipsum.', 0, '2017-08-20 05:24:26', '1994-08-01 21:31:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('6', '6', '6', 'Consequuntur nemo officia qui nemo quis. Ea ducimus similique fugit. Distinctio similique dolor consequatur et. Suscipit accusantium dolorem sapiente.', 0, '1985-12-14 16:56:49', '2001-07-05 13:09:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('7', '7', '7', 'Aut asperiores sunt corrupti alias. Quis fuga aliquid dolores aut dolores aliquam. Assumenda tempore nam natus commodi natus non.', 0, '1978-09-13 06:08:48', '1997-11-17 18:15:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('8', '8', '8', 'Est libero laudantium sint distinctio. Debitis quam est sit quis. Et eos reprehenderit nesciunt mollitia earum laudantium officia ipsa.', 0, '1990-03-30 05:32:37', '1983-05-03 17:58:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('9', '9', '9', 'Ratione eligendi qui tempore. Magni earum fugiat ad ad maxime maiores. Error et deleniti perferendis et maiores id expedita. Optio esse omnis consequatur nesciunt.', 1, '2016-03-22 21:04:18', '1973-12-26 11:17:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('10', '10', '10', 'Et consequatur molestiae eveniet corporis officia temporibus. Explicabo consectetur odit quo ut. Molestiae aut et numquam. Quas consectetur pariatur architecto voluptas et.', 1, '2016-08-03 02:03:14', '1996-12-21 07:55:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('11', '11', '11', 'Labore quos quibusdam iure maxime cumque. Maiores dolor accusamus quasi molestiae. Dolore et quia voluptatem magni.', 0, '2015-11-07 17:20:17', '2007-02-15 02:52:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('12', '12', '12', 'Praesentium vel inventore magni esse. Id qui illum animi. Reprehenderit quia voluptas quaerat itaque.', 0, '2003-10-10 03:55:16', '1980-09-01 20:09:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('13', '13', '13', 'Et vel exercitationem id. Suscipit consequatur perferendis voluptatem eius natus aliquam praesentium.', 0, '1991-02-25 16:26:07', '1998-06-14 03:10:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('14', '14', '14', 'Magni labore rerum maxime earum inventore aliquam. Rem ut iure non quisquam possimus vel vitae aut. Consequatur quis qui maxime autem ducimus.', 0, '1976-08-09 01:19:37', '1986-04-07 12:47:21');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('15', '15', '15', 'Dolore hic ut ut dolores dolores. Voluptate error cupiditate sequi. Illum est dolor sit officia. Quia nisi exercitationem repellat ipsam sed alias laboriosam.', 0, '1977-02-05 16:43:00', '2013-05-10 18:09:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('16', '1', '1', 'Facere qui ut dolorem deleniti exercitationem eligendi. Illum rerum assumenda quasi aut id. Commodi vero nobis animi at laboriosam qui. Mollitia et et odit quisquam quos mollitia.', 1, '2009-08-29 07:39:17', '2013-11-04 18:30:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('17', '2', '2', 'Iure aliquid vel nam atque autem molestiae. Praesentium commodi omnis autem eius animi non magnam cum. Eveniet vel quo perferendis. Animi debitis voluptatum provident ducimus consequatur debitis.', 0, '1975-10-12 22:54:44', '1989-06-01 13:53:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('18', '3', '3', 'Perspiciatis perferendis molestiae fugit veritatis nobis autem ut. Eos earum impedit rerum occaecati eum. Voluptas dicta incidunt repudiandae occaecati voluptates quibusdam.', 0, '2020-11-18 15:14:34', '2019-05-04 18:30:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('19', '4', '4', 'Saepe eos explicabo dolor vitae. Perspiciatis vel sunt aut ratione.', 0, '2015-11-21 08:06:33', '1993-10-17 07:15:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `txt`, `is_delivered`, `created_at`, `updated_at`) VALUES ('20', '5', '5', 'Voluptatum fugit iste dicta est et. Iusto excepturi magni et. Ab molestiae earum doloremque et voluptatem iure qui.', 0, '1985-09-14 20:51:16', '1986-04-13 14:12:19');

#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` (`id`, `name`) VALUES (3, ' документ');
INSERT INTO `media_types` (`id`, `name`) VALUES (2, ' музыка');
INSERT INTO `media_types` (`id`, `name`) VALUES (1, 'изображение');

#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_types_id` int(10) unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '/files/folder/img.png',
  `file_size` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_types_id` (`media_types_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('1', '1', 1, 'quae', '0', '2014-07-20 07:31:05');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('2', '2', 2, 'nostrum', '435361', '1978-04-10 00:26:50');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('3', '3', 3, 'quaerat', '24', '1984-01-18 06:35:45');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('4', '4', 1, 'labore', '3', '1997-08-11 22:39:24');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('5', '5', 2, 'vel', '59', '1974-04-01 06:22:27');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('6', '6', 3, 'ipsam', '718649641', '1974-05-08 00:54:03');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('7', '7', 1, 'nam', '55680', '1989-10-13 06:19:09');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('8', '8', 2, 'molestias', '0', '1993-09-24 16:55:08');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('9', '9', 3, 'sed', '743071', '1998-12-20 01:43:54');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('10', '10', 1, 'voluptates', '0', '2016-12-14 04:23:47');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('11', '11', 2, 'quasi', '169943', '2020-11-30 01:02:39');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('12', '12', 3, 'et', '0', '1980-04-14 06:56:41');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('13', '13', 1, 'exercitationem', '430768379', '2013-04-02 23:16:50');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('14', '14', 2, 'amet', '2021747', '2004-09-30 22:52:59');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('15', '15', 3, 'ipsam', '0', '2020-04-27 04:44:29');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('16', '1', 1, 'dolorem', '53212', '1993-01-12 19:13:42');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('17', '2', 2, 'ducimus', '8391', '1999-08-16 11:15:15');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('18', '3', 3, 'aut', '1351596', '1988-11-30 13:51:05');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('19', '4', 1, 'provident', '79688', '1985-12-14 21:45:28');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('20', '5', 2, 'rem', '461397228', '2014-01-29 00:44:21');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('21', '6', 3, 'voluptate', '4446681', '1985-04-20 03:09:43');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('22', '7', 1, 'illo', '31', '1995-07-01 16:25:33');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('23', '8', 2, 'nam', '675818973', '2003-08-07 00:24:48');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('24', '9', 3, 'ratione', '469', '1978-07-21 22:11:29');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('25', '10', 1, 'laboriosam', '60594', '2005-09-12 09:58:32');

#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('1', 'mollitia', 'Eveniet voluptatum voluptatem dolorem reprehenderit aut quas. Qui a illum ut nihil aut. Quo asperiores deserunt odio culpa corporis distinctio iure.', '1');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('2', 'aut', 'Et nemo repellendus qui sapiente excepturi totam. Facilis vero sint fugit sapiente. Ducimus iste in dolore aut. Quod veritatis dolore dolor minus repellat laudantium consequatur. Natus totam ullam sed quaerat quisquam.', '2');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('3', 'error', 'Excepturi maxime ut laborum aspernatur exercitationem quaerat dolor. Nemo repudiandae quod aut nemo. Sequi voluptatem omnis est. Tempore et eos est quia rerum molestiae repudiandae.', '3');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('4', 'tempora', 'Dicta recusandae corrupti nam at. Est eaque ab aut quas vero voluptatem porro. Ut culpa consectetur illum est rem et omnis. Cum voluptatem culpa corrupti esse.', '4');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('5', 'dicta', 'Voluptates non atque sit accusantium cumque voluptatum. Saepe deserunt beatae vitae provident aliquam minus nemo. Ipsam nobis et eum natus tempore ipsum incidunt debitis.', '5');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('6', 'molestiae', 'Dolorum et dolore placeat. Sit assumenda sint vitae ex blanditiis exercitationem iste. Ducimus eum ullam facilis facilis.', '6');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('7', 'quos', 'Vel cum exercitationem dignissimos. Ipsa dolorem doloremque harum. Sit qui aut facere et. Eius quidem sit dolores ut.', '7');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('8', 'odit', 'Rem dolorem sit nemo doloribus maxime a nisi. Officia in dolorem tempora cum itaque ipsum ullam. Incidunt porro non quas sint labore nihil in illum.', '8');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('9', 'sed', 'Aut iusto illum pariatur vel aut. Et necessitatibus magni nostrum aut commodi cumque nulla. In nesciunt in qui. Id ut ullam quis quae amet corrupti qui minima.', '9');
INSERT INTO `communities` (`id`, `name`, `description`, `admin_id`) VALUES ('10', 'voluptas', 'Repellat enim odio non. Et enim assumenda laboriosam enim voluptas. Debitis est omnis libero quia et omnis quas. Sapiente rerum blanditiis quasi architecto ut dolore.', '10');

#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `community_id` (`community_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `communities_users_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('1', '1', '1982-03-20 10:40:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('1', '6', '1987-11-05 00:54:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('1', '11', '1970-03-27 02:38:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('2', '2', '1993-11-06 09:12:28');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('2', '7', '1970-01-05 17:01:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('2', '12', '2014-09-08 03:43:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('3', '3', '1977-08-27 16:10:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('3', '8', '2002-07-27 15:52:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('3', '13', '2021-08-03 00:34:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('4', '4', '1996-06-20 20:07:14');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('4', '9', '1970-02-09 04:56:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('4', '14', '1984-06-14 02:00:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('5', '5', '1986-10-03 19:22:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('5', '10', '1994-07-09 00:14:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('5', '15', '2009-07-18 15:47:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('6', '1', '1992-01-09 11:05:44');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('6', '6', '1998-08-27 00:45:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('7', '2', '2022-03-17 16:43:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('7', '7', '1998-09-08 17:44:20');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('8', '3', '2021-04-03 23:31:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('8', '8', '2013-12-03 22:23:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('9', '4', '2014-12-19 01:37:31');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('9', '9', '1990-04-05 05:23:45');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('10', '5', '1973-06-09 22:59:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES ('10', '10', '1985-01-12 12:05:11');

#
# TABLE STRUCTURE FOR: calls
#

DROP TABLE IF EXISTS `calls`;

CREATE TABLE `calls` (
  `id_call` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `call_status` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_call`),
  UNIQUE KEY `id_call` (`id_call`),
  KEY `calls_from_user_id_idx` (`from_user_id`),
  KEY `calls_to_user_id_idx` (`to_user_id`),
  CONSTRAINT `fk_calls_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_calls_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('1', '1', '1', 1, '2011-02-15 07:12:26', '1992-08-04 23:39:38');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('2', '2', '2', 1, '1987-08-28 19:30:19', '1986-10-15 17:30:27');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('3', '3', '3', 0, '1995-11-06 12:14:36', '2019-08-15 11:56:33');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('4', '4', '4', 1, '2001-01-19 03:35:38', '1971-12-11 14:14:09');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('5', '5', '5', 0, '1983-02-26 22:37:19', '2007-09-29 23:59:00');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('6', '6', '6', 0, '2012-08-14 00:38:34', '2020-02-03 20:34:58');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('7', '7', '7', 1, '2017-06-10 01:47:03', '2006-04-28 09:10:40');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('8', '8', '8', 1, '2016-05-02 18:48:39', '1977-12-05 14:00:13');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('9', '9', '9', 1, '2004-01-02 16:25:26', '1971-11-27 20:02:43');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('10', '10', '10', 0, '2003-01-15 07:22:10', '1986-03-26 06:15:51');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('11', '11', '11', 0, '2010-12-05 05:16:39', '1995-10-24 03:54:29');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('12', '12', '12', 1, '1983-10-12 17:36:22', '1975-04-03 06:06:26');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('13', '13', '13', 1, '1996-12-22 02:15:58', '2001-08-31 17:05:39');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('14', '14', '14', 0, '2017-02-19 04:24:19', '1987-01-27 17:22:48');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('15', '15', '15', 1, '1984-05-17 20:10:11', '2011-10-01 16:29:36');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('16', '1', '1', 0, '2001-07-23 10:12:32', '1980-08-24 04:17:25');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('17', '2', '2', 1, '2007-12-18 23:36:55', '1981-02-23 10:11:17');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('18', '3', '3', 1, '2006-10-21 04:22:14', '1986-07-19 01:56:31');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('19', '4', '4', 0, '1992-06-14 14:58:49', '1986-02-10 00:30:40');
INSERT INTO `calls` (`id_call`, `from_user_id`, `to_user_id`, `call_status`, `created_at`, `updated_at`) VALUES ('20', '5', '5', 1, '2002-08-24 04:36:56', '2004-04-13 06:59:01');

#
# TABLE STRUCTURE FOR: countries
#

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `country_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_id` (`country_id`),
  KEY `country_id_idx` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('1', 'Greenland', '1980-01-23 21:09:29', '1972-11-19 15:02:07');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('2', 'Finland', '1977-09-25 05:13:15', '2013-09-24 10:24:15');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('3', 'Bermuda', '2020-08-18 07:56:22', '2018-12-23 05:19:54');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('4', 'Saint Helena', '1975-04-07 20:43:19', '1992-12-07 06:16:54');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('5', 'Liechtenstein', '1975-08-04 15:37:31', '2014-10-13 15:07:38');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('6', 'Spain', '2000-08-28 06:52:47', '1975-11-06 22:02:14');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('7', 'Fiji', '1971-01-11 23:32:05', '2003-03-24 13:37:15');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('8', 'Guyana', '1997-01-31 14:31:08', '2001-05-28 12:16:40');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('9', 'Trinidad and Tobago', '2013-10-06 19:38:40', '1995-02-18 03:13:07');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('10', 'Bhutan', '2001-01-11 15:20:40', '1997-08-25 05:15:54');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('11', 'China', '2002-08-30 02:45:29', '1994-10-14 02:03:51');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('12', 'Burundi', '2021-08-21 03:45:31', '1971-06-09 03:50:58');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('13', 'Aruba', '2005-01-08 10:05:34', '2012-08-24 10:21:27');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('14', 'Serbia', '1972-11-19 11:31:08', '1993-07-10 18:00:39');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('15', 'Saint Vincent and the Grenadines', '1988-02-18 10:17:53', '2014-12-05 20:11:15');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('16', 'Turkmenistan', '1988-11-11 15:00:30', '1977-03-12 01:25:20');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('17', 'Wallis and Futuna', '1983-01-10 06:52:08', '1980-02-15 22:00:26');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('18', 'Cameroon', '1986-01-05 19:42:43', '1982-01-11 05:01:35');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('19', 'Macedonia', '1999-03-28 23:50:27', '1978-04-19 18:34:08');
INSERT INTO `countries` (`country_id`, `country_name`, `created_at`, `updated_at`) VALUES ('20', 'Swaziland', '1988-08-25 15:11:15', '2017-09-24 14:10:23');

#
# TABLE STRUCTURE FOR: cities
#

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `city_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id` (`city_id`),
  KEY `city_id_idx` (`city_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('1', 'East Antonefurt', '1', '1991-06-01 22:39:26', '2015-06-08 10:35:48');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('2', 'New Lurlineside', '2', '2021-01-23 19:57:59', '1992-01-13 02:42:00');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('3', 'New Ariane', '3', '2017-08-14 08:12:06', '1983-01-12 22:50:12');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('4', 'Beiermouth', '4', '1999-10-13 12:15:10', '2001-09-13 01:24:27');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('5', 'Diannastad', '5', '2008-02-26 12:21:29', '1974-03-13 19:11:27');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('6', 'Lake Brooksview', '6', '1978-07-03 01:33:58', '2014-05-08 14:43:55');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('7', 'Cristside', '7', '2002-03-22 17:29:56', '1975-06-19 02:10:31');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('8', 'East Malvina', '8', '1995-03-16 10:50:27', '1989-10-25 08:29:45');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('9', 'Rohanbury', '9', '2006-03-29 21:44:07', '2000-02-11 17:46:18');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('10', 'Port Izaiah', '10', '2000-02-15 17:15:50', '2015-03-04 22:57:18');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('11', 'Veldafort', '11', '1976-08-08 16:20:15', '2012-12-08 00:18:28');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('12', 'New Faefort', '12', '1976-01-06 17:39:32', '2013-01-18 12:57:17');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('13', 'Trompburgh', '13', '2004-06-06 06:49:40', '2011-06-29 00:44:09');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('14', 'Burleyfurt', '14', '2014-08-02 01:34:37', '2010-01-07 08:48:11');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('15', 'South Milfordfurt', '15', '1986-09-10 12:22:01', '2019-10-08 16:52:06');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('16', 'Clairbury', '16', '2017-07-18 08:59:15', '1972-04-24 13:36:12');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('17', 'East Kristopher', '17', '1983-05-13 18:54:13', '2005-09-18 07:12:36');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('18', 'Rathstad', '18', '1973-11-16 18:15:05', '1999-01-11 12:35:35');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('19', 'Feilport', '19', '1975-08-25 15:13:49', '1992-02-29 06:37:33');
INSERT INTO `cities` (`city_id`, `city_name`, `country_id`, `created_at`, `updated_at`) VALUES ('20', 'Collinsland', '20', '1999-08-31 18:16:33', '1981-04-05 02:42:41');

#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` enum('f','m','x') COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `photo_id` (`photo_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('1', 'm', '2015-01-01', '1', '1', '1');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('2', 'f', '1992-04-15', '2', '2', '2');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('3', 'x', '2016-07-29', '3', '3', '3');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('4', 'x', '1982-02-27', '4', '4', '4');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('5', 'm', '1977-01-16', '5', '5', '5');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('6', 'm', '1991-03-10', '6', '6', '6');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('7', 'f', '1972-12-21', '7', '7', '7');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('8', 'm', '2013-12-01', '8', '8', '8');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('9', 'm', '2014-11-05', '9', '9', '9');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('10', 'm', '1997-04-07', '10', '10', '10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('11', 'm', '1984-06-14', '11', '11', '11');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('12', 'x', '1986-10-14', '12', '12', '12');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('13', 'm', '1971-03-18', '13', '13', '13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('14', 'm', '1981-09-30', '14', '14', '14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `city_id`, `country_id`) VALUES ('15', 'm', '1972-05-28', '15', '15', '15');

#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `friend_requests_from_user_id_idx` (`from_user_id`),
  KEY `friend_requests_to_user_id_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_chk_1` CHECK (`from_user_id` <> `to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('1', '2', 1);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('3', '1', 1);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('1', '3', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('15', '2', 1);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('12', '2', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('1', '12', 1);

/*Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке*/

SELECT users.first_name from users ORDER BY first_name ASC;

/*Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 * Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)*/

ALTER TABLE profiles ADD COLUMN is_active tinyint(1) DEFAULT 1;

UPDATE profiles 
SET is_active = 0
WHERE birthday >= CURRENT_DATE()-INTERVAL 18 YEAR;

/*Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)*/

DELETE FROM messages WHERE created_at > CURRENT_DATE();








