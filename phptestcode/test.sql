-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 10 2024 г., 21:00
-- Версия сервера: 10.7.5-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Datas`
--

CREATE TABLE `Datas` (
  `ID_Datas` int(11) NOT NULL,
  `DateNow` date NOT NULL,
  `ID_org` int(11) NOT NULL,
  `password_eqip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actuality` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Datas`
--

INSERT INTO `Datas` (`ID_Datas`, `DateNow`, `ID_org`, `password_eqip`, `comments`, `actuality`) VALUES
(1, '2024-06-01', 1, '123', '123', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Org`
--

CREATE TABLE `Org` (
  `ID_org` int(11) NOT NULL,
  `name_org` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Org`
--

INSERT INTO `Org` (`ID_org`, `name_org`) VALUES
(1, 'Рога и копыта'),
(2, 'Тарковское Метадвижение'),
(3, 'ПивоЗавод!');

-- --------------------------------------------------------

--
-- Структура таблицы `pass`
--

CREATE TABLE `pass` (
  `ID_pass` int(11) NOT NULL,
  `ID_org` int(11) NOT NULL,
  `ID_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pass`
--

INSERT INTO `pass` (`ID_pass`, `ID_org`, `ID_users`) VALUES
(2, 1, 2),
(3, 1, 2),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `ID_users` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`ID_users`, `login`, `passwords`, `role`) VALUES
(1, 'login-test', '123', 'Admin'),
(2, 'Guts', 'Casca', 'Kill Griffith');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Datas`
--
ALTER TABLE `Datas`
  ADD PRIMARY KEY (`ID_Datas`),
  ADD KEY `ID_org` (`ID_org`);

--
-- Индексы таблицы `Org`
--
ALTER TABLE `Org`
  ADD PRIMARY KEY (`ID_org`);

--
-- Индексы таблицы `pass`
--
ALTER TABLE `pass`
  ADD PRIMARY KEY (`ID_pass`),
  ADD KEY `ID_org` (`ID_org`),
  ADD KEY `ID_users` (`ID_users`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID_users`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Datas`
--
ALTER TABLE `Datas`
  MODIFY `ID_Datas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Org`
--
ALTER TABLE `Org`
  MODIFY `ID_org` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pass`
--
ALTER TABLE `pass`
  MODIFY `ID_pass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `ID_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Datas`
--
ALTER TABLE `Datas`
  ADD CONSTRAINT `datas_ibfk_1` FOREIGN KEY (`ID_org`) REFERENCES `Org` (`ID_org`);

--
-- Ограничения внешнего ключа таблицы `pass`
--
ALTER TABLE `pass`
  ADD CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`ID_org`) REFERENCES `Org` (`ID_org`),
  ADD CONSTRAINT `pass_ibfk_2` FOREIGN KEY (`ID_users`) REFERENCES `Users` (`ID_users`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
