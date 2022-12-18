-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Гру 18 2022 р., 22:43
-- Версія сервера: 8.0.30
-- Версія PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `eldorado`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int NOT NULL,
  `full_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `Customers`
--

INSERT INTO `Customers` (`customer_id`, `full_name`, `phone_number`) VALUES
(1, 'Михайло Губенко', 380982757833),
(2, 'Микита Кириндась', 380764728862),
(3, 'Ганна Чорна', 380609489987),
(4, 'Марія Склодовська', 380690472785),
(5, 'Альберт Ейнштейн', 380928756745),
(6, 'Карл Гаус', 380394568994),
(7, 'Маргарет Тетчер', 380856774839),
(8, 'Черчіль ІІІ', 380946783881),
(9, 'Чемих Арамін', 380654774907),
(10, 'Марина Мажуга', 380348693994);

-- --------------------------------------------------------

--
-- Структура таблиці `Goods`
--

CREATE TABLE `Goods` (
  `goods_id` int NOT NULL,
  `goods_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `Goods`
--

INSERT INTO `Goods` (`goods_id`, `goods_name`, `price`, `quantity`) VALUES
(1, 'Samsung Fridge S1299', 25999, 3),
(2, 'LG SmartTV Aboba+', 46999, 5),
(3, 'Asus ZenPhone 1+', 9999, 16),
(4, 'Apple iPad 15', 33999, 4),
(5, 'ArtLine GameReady GTX1060', 28999, 2),
(6, 'Apple iPad 15', 33999, 4),
(7, 'Some item 1', 950, 37),
(8, 'Some item 2', 3769, 9),
(9, 'Some item 3', 1399, 12),
(10, 'Some item 4', 16999, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `goods_id` int NOT NULL,
  `order_date` date NOT NULL,
  `quantity` int NOT NULL,
  `order_cost` int DEFAULT NULL,
  `comment` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `Orders`
--

INSERT INTO `Orders` (`order_id`, `goods_id`, `order_date`, `quantity`, `order_cost`, `comment`) VALUES
(2, 9, '2021-11-27', 2, NULL, 'Не дзвоніть'),
(3, 1, '2021-12-30', 1, NULL, NULL),
(4, 2, '2022-01-04', 1, 2342, 'Пакети ще будь ласка'),
(5, 7, '2022-01-26', 12, NULL, NULL),
(6, 6, '2022-01-12', 1, NULL, NULL),
(7, 4, '2021-02-07', 2, NULL, 'Нужен как можно бістрєє!!!1'),
(8, 3, '2022-02-02', 1, NULL, 'Aboba'),
(9, 8, '2022-08-22', 4, NULL, NULL),
(10, 1, '2022-09-30', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `Reviews`
--

CREATE TABLE `Reviews` (
  `review_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `goods_id` int NOT NULL,
  `mark` int NOT NULL,
  `review_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `Reviews`
--

INSERT INTO `Reviews` (`review_id`, `customer_id`, `goods_id`, `mark`, `review_text`) VALUES
(1, 1, 9, 5, 'Норм, рекомедую!'),
(2, 8, 3, 5, NULL),
(3, 3, 5, 4, 'Є пошкодження пакування, але з самим ПК все добре'),
(4, 2, 2, 1, 'Брух'),
(5, 9, 1, 5, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `usertbl`
--

CREATE TABLE `usertbl` (
  `id` int NOT NULL,
  `full_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `level` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп даних таблиці `usertbl`
--

INSERT INTO `usertbl` (`id`, `full_name`, `email`, `username`, `password`, `level`) VALUES
(1, 'ФОП Роман', 'usertest@ukr.net', 'user', 'userpass', NULL),
(2, 'Євгеній Максимович Нігільський', 'admintest@ukr.net', 'admin', 'adminpass', 'admin');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Індекси таблиці `Goods`
--
ALTER TABLE `Goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Індекси таблиці `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_ibfk_2` (`goods_id`);

--
-- Індекси таблиці `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_ibfk_2` (`customer_id`),
  ADD KEY `reviews_ibfk_3` (`goods_id`);

--
-- Індекси таблиці `usertbl`
--
ALTER TABLE `usertbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `Goods`
--
ALTER TABLE `Goods`
  MODIFY `goods_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `usertbl`
--
ALTER TABLE `usertbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `Goods` (`goods_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `Goods` (`goods_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Обмеження зовнішнього ключа таблиці `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `Goods` (`goods_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
