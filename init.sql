CREATE DATABASE `shop` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `shop`;

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id_manufacturer` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_manufacturer`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `manufacturer` (`id_manufacturer`, `name`, `description`) VALUES
(1, 'Vivienne Sabo', 'Vivienne Sabo -марка с романтичной парижской душой, дарит ощущения весеннего Парижа, современная и классическая, интригующая и демократичная. При создании косметических продуктов марки Vivienne Sabo используются самые современные текстуры и формулы Аромат свежих цветов фиалки, украшающих коллекцию, дарит ощущение весеннего Парижа.'),
(2, 'Maybelline New York', 'Maybelline New York - бренд макияжа №1 в России. Это бренд, вдохновленный духом Нью-Йорка и несущий в себе такие ценности как: красота, мода, неограниченные возможности, инновации и доступность. Косметика Maybelline NY - отличный способ самовыражения. Это современный бренд, который тонко чувствует актуальные тенденции, но при этом имеет 100-летнюю историю.'),
(3, '"ЧИСТАЯ ЛИНИЯ"', '"ЧИСТАЯ ЛИНИЯ" - Это уникальная косметика на основе натуральных экстрактов российских трав. Опыт и научные исследования компании позволяют открывать уникальные свойства российских трав для защиты и сохранения красоты и здоровья кожи и волос.'),
(4, 'Estel (Эстель)', 'Estel (Эстель) - российский производитель профессиональной косметики для волос.');


CREATE TABLE IF NOT EXISTS `product` (
  `id_product` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `description` text,
  `id_category` int(3) DEFAULT NULL,
  `img` text,
  `color` text,
  `valume` int(3),
  `id_manufacturer` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `product` (`id_product`, `name`, `cost`, `description`, `id_category`, `img`, `color`, `valume`, `id_manufacturer`) VALUES
(1, 'Vivienne Sabo Тушь', 300, 'Тушь для ресниц супер-объемная, со сценическим эффектом', 1, 'ink.jpg', 'черная', '100', 1),
(2, 'Палетка теней', 882, 'Палетка теней Rimmel Magnif''Eyes Blush', 1, 'pallete.jpg', 'черная', '100', 1),
(3, 'Губная помада-тинт', 1000, 'L`Oreal Paris Rouge Signature, матовый, "Я протестую", красный', 1, 'lips.jpg', 'черная', '100', 1),
(4, 'Vivienne Sabo Тушь', 296, 'Тушь для ресниц со сценическим эффектом "Cabaret premiere"', 1, 'ink2.jpg', 'черная', '100', 1),
(5, 'DIVAGE Румяна', 271, 'Румяна компактные "VELVET"', 1, 'brash1.jpg', 'черная', '100', 1),
(6, 'Relouis Помада', 345, 'Помада губная La Mia Italia', 1, 'lips2.jpg', 'черная', '100', 1),

(7, 'Matrix Шампунь', 1100, 'Шампунь для волос Total Results So Silver, для нейтрализации желтизны', 2, 'shampoo.jpg', 'черная', '100', 1),
(8, 'Бигуди-бумеранги', 235, 'Harizma Бигуди-бумеранги 22x240 мм 10 шт h10983-22, зелёные', 2, 'hair-curlers.jpg', 'черная', '100', 1),
(9, 'Расческа Tangle Teezer', 1288, 'Щетка для волос', 2, 'hairbrush.jpg', 'черная', '100', 1),

(10, 'Лак для ногтей', 570, 'Kinetics SolarGel Polish тон 200, 15 мл', 3, 'varnish2.jpg', 'черная', '100', 1),
(11, 'Быстрая сушка лака', 212, 'Super Fast Drying, 11 мл.', 3, 'varnish.jpg', 'черная', '100', 1),
(12, 'Слайдер-дизайн', 345, 'Слайдер-дизайн Пары линии, sd1-1567 в наборе', 3, 'varnish-nabor.jpg', 'черная', '100', 1),

(13, 'Крем для тела', 470, 'Botanic Secrets Апельсин и какао 150мл', 3, 'cream.jpg', 'черная', '100', 1),
(14, 'Молочко-хайлайтер', 845, 'MIXIT Бронзовое молочко-хайлайтер для тела Unicorn Shimmer Milk Color Bronze, 100 мл', 3, 'highlighter.jpg', 'черная', '100', 1),
(15, 'Большая щётка', 345, 'Lapochka большая щётка из бука для сухого массажа max (щетина кабана) средней жесткости', 3, 'brush.jpg', 'черная', '100', 1);


CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `category` (`id_category`, `name`) VALUES
(1, 'Лицо'),
(2, 'Волосы'),
(3, 'Ногти'),
(4, 'Тело');


CREATE TABLE IF NOT EXISTS `permission` (
  `id_permission` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permission`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `permission` (`id_permission`, `name`) VALUES
(1, 'Разрешение есть'),
(2, 'Разрешения нет');


CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` int(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_permission` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `customer` (`id_customer`, `name`, `login`, `password`, `email`, `id_permission`) VALUES
(1, 'Никитос', 'Nekit123', '123456', 'Nekit123.com', '1');


CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int(4) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `status` (`id_status`, `value`) VALUES
(1, 'В процессе'),
(2, 'Оплачено');


CREATE TABLE IF NOT EXISTS `basket` (
  `id_basket` int(4) NOT NULL AUTO_INCREMENT,
  `id_customer` int(3) DEFAULT NULL,
  `date`date,
  `id_status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_basket`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `basket` (`id_basket`, `id_customer`, `date`, `id_status`) VALUES
(1, 1, '07.05.2020', 1);


CREATE TABLE `order` ( 
  `id_basket` int(10) NOT NULL AUTO_INCREMENT , 
  `id_product` int(10) NOT NULL AUTO_INCREMENT , 
  `quantity` int(10) NOT NULL , 
  PRIMARY KEY (`id_basket`, `id_product`)
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

INSERT INTO `order` (`id_basket`, `id_product`, `quantity`) VALUES
(1, 2, 2);