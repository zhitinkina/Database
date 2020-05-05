CREATE DATABASE `shop` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `shop`;

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `description` text,
  `ord` int(3) DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`id`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `goods` (`id`, `name`, `cost`, `description`, `ord`, `img`) VALUES
(1, 'Vivienne Sabo Тушь', 300, 'Тушь для ресниц супер-объемная, со сценическим эффектом', 1, 'ink.jpg'),
(2, 'Палетка теней', 882, 'Палетка теней Rimmel Magnif''Eyes Blush', 1, 'pallete.jpg'),
(3, 'Губная помада-тинт', 1000, 'L`Oreal Paris Rouge Signature, матовый, "Я протестую", красный', 1, 'lips.jpg'),
(4, 'Vivienne Sabo Тушь', 296, 'Тушь для ресниц со сценическим эффектом "Cabaret premiere"', 1, 'ink2.jpg'),
(5, 'DIVAGE Румяна', 271, 'Румяна компактные "VELVET"', 1, 'brash1.jpg'),
(6, 'Relouis Помада', 345, 'Помада губная La Mia Italia', 1, 'lips2.jpg'),

(7, 'Matrix Шампунь', 1100, 'Шампунь для волос Total Results So Silver, для нейтрализации желтизны', 2, 'shampoo.jpg'),
(8, 'Бигуди-бумеранги', 235, 'Harizma Бигуди-бумеранги 22x240 мм 10 шт h10983-22, зелёные', 2, 'hair-curlers.jpg'),
(9, 'Расческа Tangle Teezer', 1288, 'Щетка для волос', 2, 'hairbrush.jpg'),

(10, 'Лак для ногтей', 570, 'Kinetics SolarGel Polish тон 200, 15 мл', 3, 'varnish2.jpg'),
(11, 'Быстрая сушка лака', 212, 'Super Fast Drying, 11 мл.', 3, 'varnish.jpg'),
(12, 'Слайдер-дизайн', 345, 'Слайдер-дизайн Пары линии, sd1-1567 в наборе', 3, 'varnish-nabor.jpg'),

(13, 'Крем для тела', 470, 'Botanic Secrets Апельсин и какао 150мл', 3, 'cream.jpg'),
(14, 'Молочко-хайлайтер', 845, 'MIXIT Бронзовое молочко-хайлайтер для тела Unicorn Shimmer Milk Color Bronze, 100 мл', 3, 'highlighter.jpg'),
(15, 'Большая щётка', 345, 'Lapochka большая щётка из бука для сухого массажа max (щетина кабана) средней жесткости', 3, 'brush.jpg');
