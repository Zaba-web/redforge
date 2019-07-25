-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 25 2019 г., 19:40
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `redforge`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_developers`
--

CREATE TABLE `admin_developers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_developers`
--

INSERT INTO `admin_developers` (`id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_mails`
--

CREATE TABLE `admin_mails` (
  `id` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `subject` tinytext NOT NULL,
  `sender` varchar(255) NOT NULL,
  `reciver` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `visibility` int(11) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `name`, `title`, `type`, `visibility`, `icon`) VALUES
(1, 'home', 'Домашня сторінка', 'system', 1, ' <svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"28\" height=\"28\" viewBox=\"0 0 172 172\" style=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M86,13.94141l-3.86328,3.69531l-69.875,69.875l7.72656,7.72656l6.88672,-6.88672v62.14844h48.375v-53.75h21.5v53.75h48.375v-62.14844l6.88672,6.88672l7.72656,-7.72656l-69.875,-69.875zM86,29.22656l48.375,48.375v62.14844h-26.875v-53.75h-43v53.75h-26.875v-62.14844z\"></path></g></g></g></svg>'),
(2, 'pages', 'Сторінки', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"28\" height=\"28\" viewBox=\"0 0 172 172\" style=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M24.08,6.88v158.24h123.84v-114.9175l-0.9675,-1.075l-41.28,-41.28l-1.075,-0.9675zM30.96,13.76h68.8v27.52h-48.16v6.88h48.16v6.88h41.28v103.2h-110.08zM106.64,18.705l29.455,29.455h-29.455zM51.6,75.68v6.88h10.32v-6.88zM75.68,75.68v6.88h44.72v-6.88zM51.6,96.32v6.88h10.32v-6.88zM75.68,96.32v6.88h44.72v-6.88zM51.6,116.96v6.88h10.32v-6.88zM75.68,116.96v6.88h44.72v-6.88z\"></path></g></g></g></svg>'),
(3, 'categories', 'Категорії', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"28\" height=\"28\" viewBox=\"0 0 172 172\" style=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M72.24,24.08c-5.65719,0 -10.32,4.66281 -10.32,10.32v17.2c0,5.65719 4.66281,10.32 10.32,10.32h10.32v13.76h-44.72c-9.44656,0 -17.2,7.75344 -17.2,17.2v17.2h-10.32c-5.65719,0 -10.32,4.66281 -10.32,10.32v17.2c0,5.65719 4.66281,10.32 10.32,10.32h27.52c5.65719,0 10.32,-4.66281 10.32,-10.32v-17.2c0,-5.65719 -4.66281,-10.32 -10.32,-10.32h-10.32v-17.2c0,-5.6975 4.6225,-10.32 10.32,-10.32h44.72v27.52h-10.32c-5.65719,0 -10.32,4.66281 -10.32,10.32v17.2c0,5.65719 4.66281,10.32 10.32,10.32h27.52c5.65719,0 10.32,-4.66281 10.32,-10.32v-17.2c0,-5.65719 -4.66281,-10.32 -10.32,-10.32h-10.32v-27.52h44.72c5.6975,0 10.32,4.6225 10.32,10.32v17.2h-10.32c-5.65719,0 -10.32,4.66281 -10.32,10.32v17.2c0,5.65719 4.66281,10.32 10.32,10.32h27.52c5.65719,0 10.32,-4.66281 10.32,-10.32v-17.2c0,-5.65719 -4.66281,-10.32 -10.32,-10.32h-10.32v-17.2c0,-9.44656 -7.75344,-17.2 -17.2,-17.2h-44.72v-13.76h10.32c5.65719,0 10.32,-4.66281 10.32,-10.32v-17.2c0,-5.65719 -4.66281,-10.32 -10.32,-10.32zM72.24,30.96h27.52c1.90813,0 3.44,1.53188 3.44,3.44v17.2c0,1.90813 -1.53187,3.44 -3.44,3.44h-27.52c-1.90812,0 -3.44,-1.53187 -3.44,-3.44v-17.2c0,-1.90812 1.53188,-3.44 3.44,-3.44zM10.32,116.96h27.52c1.90813,0 3.44,1.53188 3.44,3.44v17.2c0,1.90813 -1.53187,3.44 -3.44,3.44h-27.52c-1.90812,0 -3.44,-1.53187 -3.44,-3.44v-17.2c0,-1.90812 1.53188,-3.44 3.44,-3.44zM72.24,116.96h27.52c1.90813,0 3.44,1.53188 3.44,3.44v17.2c0,1.90813 -1.53187,3.44 -3.44,3.44h-27.52c-1.90812,0 -3.44,-1.53187 -3.44,-3.44v-17.2c0,-1.90812 1.53188,-3.44 3.44,-3.44zM134.16,116.96h27.52c1.90813,0 3.44,1.53188 3.44,3.44v17.2c0,1.90813 -1.53187,3.44 -3.44,3.44h-27.52c-1.90812,0 -3.44,-1.53187 -3.44,-3.44v-17.2c0,-1.90812 1.53188,-3.44 3.44,-3.44z\"></path></g></g></g></svg>'),
(4, 'posts', 'Публікації', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\"\nwidth=\"28\" height=\"28\"\nviewBox=\"0 0 172 172\"\nstyle=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M10.32,10.32c-1.89469,0 -3.44,1.54531 -3.44,3.44v120.4c0,13.26281 10.81719,24.08 24.08,24.08h51.6v-6.88h-51.6c-9.54062,0 -17.2,-7.65937 -17.2,-17.2v-116.96h99.76v89.44h6.88v-68.8h16.555c-0.43,0.69875 -0.83312,1.3975 -1.12875,2.09625c-1.81406,4.23281 -1.66625,8.30438 -1.66625,8.30438v58.39937h6.88v-58.48c0,-0.02687 0,-0.05375 0,-0.08062c0,0 -0.01344,-2.80844 1.11531,-5.45563c1.12875,-2.63375 2.59344,-4.78375 7.48469,-4.78375c4.89125,0 6.35594,2.15 7.48469,4.78375c1.12875,2.64719 1.11531,5.45563 1.11531,5.45563c0,0.02687 0,0.05375 0,0.08062v58.48h6.88v-58.39937c0,0 0.14781,-4.07156 -1.66625,-8.30438c-1.81406,-4.24625 -6.35594,-8.97625 -13.81375,-8.97625c-0.02687,0 -0.05375,0 -0.09406,0h-29.14594v-17.2c0,-1.89469 -1.54531,-3.44 -3.44,-3.44zM27.52,34.4c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h68.8c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM27.52,48.16c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h68.8c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM30.96,75.68c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM72.24,75.68c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM30.96,89.44c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM72.24,89.44c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM30.96,103.2c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM72.24,103.2c-1.89469,0 -3.44,1.54531 -3.44,3.44c0,1.89469 1.54531,3.44 3.44,3.44h10.32v-3.44h10.32c0,-1.89469 -1.54531,-3.44 -3.44,-3.44zM89.44,113.52v58.48h82.56v-58.48zM30.96,116.96c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM72.24,116.96c-1.89469,0 -3.44,1.54531 -3.44,3.44c0,1.89469 1.54531,3.44 3.44,3.44h10.32v-6.88zM96.32,120.4h30.96v24.08h-30.96zM134.16,120.4h30.96v3.44h-30.96zM30.96,130.72c-1.23625,-0.01344 -2.39187,0.63156 -3.02344,1.70656c-0.61813,1.075 -0.61813,2.39187 0,3.46687c0.63156,1.075 1.78719,1.72 3.02344,1.70656h24.08c1.23625,0.01344 2.39188,-0.63156 3.02344,-1.70656c0.61813,-1.075 0.61813,-2.39187 0,-3.46687c-0.63156,-1.075 -1.78719,-1.72 -3.02344,-1.70656zM72.24,130.72c-1.89469,0 -3.44,1.54531 -3.44,3.44c0,1.89469 1.54531,3.44 3.44,3.44h10.32v-6.88zM134.16,130.72h30.96v3.44h-30.96zM134.16,141.04h30.96v3.44h-30.96zM96.32,151.36h68.8v3.44h-68.8zM96.32,161.68h68.8v3.44h-68.8z\"></path></g></g></g></svg>'),
(5, 'files', 'Файли', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"28\" height=\"28\" viewBox=\"0 0 172 172\" style=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><path d=\"M157.66667,28.66667h-143.33333v114.66667h143.33333zM71.66667,57.33333c3.956,0 7.16667,3.21067 7.16667,7.16667c0,3.956 -3.21067,7.16667 -7.16667,7.16667c-3.956,0 -7.16667,-3.21067 -7.16667,-7.16667c0,-3.956 3.21067,-7.16667 7.16667,-7.16667zM136.16667,121.83333h-100.33333l25.07617,-32.24283l17.92383,21.5645l25.08333,-32.3145z\"></path></g></g></svg>'),
(6, 'menu', 'Меню', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\"\nwidth=\"24\" height=\"24\"\nviewBox=\"0 0 172 172\"\nstyle=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M0,25.8v17.2h172v-17.2zM0,77.4v17.2h172v-17.2zM0,129v17.2h172v-17.2z\"></path></g></g></g></svg>'),
(8, 'users', 'Користувачі', 'system', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\"\r\nwidth=\"28\" height=\"28\"\r\nviewBox=\"0 0 172 172\"\r\nstyle=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><g id=\"surface1\"><path d=\"M85.0325,6.88c-2.16344,0 -4.28656,0.05375 -6.3425,0.215c-0.25531,0.01344 -0.49719,0.08063 -0.7525,0.1075c-1.80062,0.16125 -3.56094,0.37625 -5.2675,0.645c-1.8275,0.29563 -3.655,0.645 -5.375,1.075c-0.08062,0.01344 -0.14781,0.09406 -0.215,0.1075c-3.62812,0.92719 -6.9875,2.15 -10.105,3.655c-3.14437,1.51844 -5.99312,3.38625 -8.6,5.4825c-1.29,1.04813 -2.49937,2.15 -3.655,3.3325c-4.56875,4.67625 -8.02219,10.34688 -10.32,17.0925c-0.55094,1.62594 -1.08844,3.30563 -1.505,5.0525c-0.37625,1.55875 -0.69875,3.19813 -0.9675,4.8375c-0.17469,1.06156 -0.30906,2.13656 -0.43,3.225c-0.09406,0.87344 -0.25531,1.67969 -0.3225,2.58c-0.16125,2.02906 -0.215,4.11188 -0.215,6.235c0,1.74688 0.30906,3.96406 0.645,6.3425c0.36281,2.56656 0.88688,5.34813 1.505,8.17c0.55094,2.52625 1.08844,4.97188 1.72,7.31c0.06719,0.26875 0.14781,0.59125 0.215,0.86c0.43,1.54531 0.87344,3.10406 1.29,4.4075c-1.00781,0.86 -2.02906,1.41094 -3.01,2.9025c-1.65281,2.52625 -2.86219,6.06031 -2.365,10.32c1.45125,12.29531 9.16438,16.68938 11.7175,17.9525c0.98094,5.75125 3.95063,12.84625 8.815,20.1025c5.21375,7.78031 12.41625,15.25156 21.1775,19.4575c0.16125,0.08063 0.26875,0.24188 0.43,0.3225c3.15781,3.77594 7.61906,6.45 12.9,6.45c5.28094,0 9.74219,-2.67406 12.9,-6.45c0.16125,-0.08062 0.26875,-0.24187 0.43,-0.3225c8.73438,-4.21937 15.78906,-11.67719 20.9625,-19.4575c4.81063,-7.24281 7.72656,-14.37812 8.7075,-20.1025c2.52625,-1.19594 10.46781,-5.46906 11.9325,-17.845c0.49719,-4.27312 -0.80625,-7.88781 -2.4725,-10.4275c-0.99437,-1.505 -2.00219,-2.02906 -3.01,-2.9025c0.56438,-1.78719 1.23625,-3.80281 1.8275,-6.02c0.04031,-0.13437 0.06719,-0.29562 0.1075,-0.43c0.06719,-0.22844 0.14781,-0.51062 0.215,-0.7525c0.61813,-2.41875 1.04813,-4.75687 1.505,-7.095c0.52406,-2.70094 0.99438,-5.36156 1.29,-7.955c0.09406,-0.7525 0.14781,-1.51844 0.215,-2.2575c0.13438,-1.35719 0.25531,-2.6875 0.3225,-4.085c0.06719,-1.34375 0.1075,-2.66062 0.1075,-3.9775c0,-0.92719 -0.04031,-1.98875 -0.1075,-3.01c-0.01344,-0.14781 0.01344,-0.28219 0,-0.43c-0.06719,-0.84656 -0.215,-1.67969 -0.3225,-2.58c-0.06719,-0.49719 -0.13437,-1.00781 -0.215,-1.505c-0.08062,-0.49719 -0.12094,-0.99437 -0.215,-1.505c-0.08062,-0.40312 -0.12094,-0.77937 -0.215,-1.1825c-0.12094,-0.56437 -0.28219,-1.15562 -0.43,-1.72c-0.09406,-0.36281 -0.215,-0.72562 -0.3225,-1.075c-0.17469,-0.60469 -0.33594,-1.22281 -0.5375,-1.8275c-0.1075,-0.33594 -0.20156,-0.645 -0.3225,-0.9675c-0.215,-0.57781 -0.51062,-1.14219 -0.7525,-1.72c-0.38969,-0.91375 -0.81969,-1.80062 -1.29,-2.6875c-0.18812,-0.36281 -0.33594,-0.72562 -0.5375,-1.075c-0.26875,-0.48375 -0.65844,-0.92719 -0.9675,-1.3975c-0.22844,-0.34937 -0.40312,-0.73906 -0.645,-1.075c-0.3225,-0.44344 -0.61812,-0.87344 -0.9675,-1.29c-0.26875,-0.33594 -0.57781,-0.645 -0.86,-0.9675c-0.34937,-0.38969 -0.69875,-0.81969 -1.075,-1.1825c-0.34937,-0.34937 -0.71219,-0.63156 -1.075,-0.9675c-0.73906,-0.67187 -1.54531,-1.24969 -2.365,-1.8275c-3.42656,-2.40531 -7.51156,-3.9775 -12.3625,-4.3c-0.94062,-1.38406 -2.41875,-3.14437 -4.4075,-4.945c-0.77937,-0.71219 -1.6125,-1.45125 -2.58,-2.15c-0.1075,-0.08062 -0.215,-0.13437 -0.3225,-0.215c-0.1075,-0.06719 -0.215,-0.14781 -0.3225,-0.215c-0.95406,-0.645 -1.98875,-1.23625 -3.1175,-1.8275c-3.46687,-1.8275 -7.71312,-3.39969 -13.115,-4.085c-0.24187,-0.02687 -0.49719,-0.08062 -0.7525,-0.1075c-0.20156,-0.02687 -0.44344,0.02688 -0.645,0c-1.62594,-0.16125 -3.34594,-0.3225 -5.16,-0.3225zM111.8,49.45c3.34594,5.33469 8.6,15.43969 8.6,26.23c0.06719,5.73781 2.28438,15.29188 9.9975,16.2325c0.68531,0.51063 1.59906,1.30344 2.365,2.4725c0.95406,1.46469 1.59906,3.225 1.29,5.805c-1.31687,11.08594 -9.03,13.2225 -9.03,13.2225c-1.29,0.41656 -2.21719,1.55875 -2.365,2.9025c-0.40312,3.80281 -3.27875,11.51594 -8.0625,18.705c-4.78375,7.18906 -11.35469,14.04219 -18.5975,17.415c-0.56437,0.25531 -1.04812,0.67188 -1.3975,1.1825c-1.85437,2.76813 -4.99875,4.6225 -8.6,4.6225c-3.60125,0 -6.74562,-1.85437 -8.6,-4.6225c-0.34937,-0.51062 -0.83312,-0.92719 -1.3975,-1.1825c-7.26969,-3.37281 -13.88094,-10.22594 -18.705,-17.415c-4.82406,-7.18906 -7.78031,-14.91562 -8.17,-18.705c-0.16125,-1.27656 -1.03469,-2.365 -2.2575,-2.795c0,0 -7.72656,-2.32469 -9.03,-13.4375c-0.30906,-2.59344 0.34938,-4.38062 1.29,-5.805c0.38969,-0.59125 0.86,-1.075 1.29,-1.505c0.26875,0.06719 0.57781,0.1075 0.86,0.1075c6.78594,0 9.1375,-11.30094 10.32,-17.2c2.15,-10.73656 13.975,-13.76 30.96,-13.76c16.00406,0 24.99375,-7.43094 29.24,-12.47zM67.08,92.88c-2.84875,0 -5.16,2.31125 -5.16,5.16c0,2.84875 2.31125,5.16 5.16,5.16c2.84875,0 5.16,-2.31125 5.16,-5.16c0,-2.84875 -2.31125,-5.16 -5.16,-5.16zM104.92,92.88c-2.84875,0 -5.16,2.31125 -5.16,5.16c0,2.84875 2.31125,5.16 5.16,5.16c2.84875,0 5.16,-2.31125 5.16,-5.16c0,-2.84875 -2.31125,-5.16 -5.16,-5.16z\"></path></g></g></g></svg>'),
(9, 'notes', 'Замітки', 'system', 0, ''),
(10, 'mails', 'Повідомлення', 'system', 0, ''),
(12, 'references', 'Довідка', 'system', 0, ''),
(14, 'ref_edit', 'Довідка', 'dev', 1, '<svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" width=\"28\" height=\"28\" viewBox=\"0 0 172 172\" style=\" fill:#000000;\"><g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\"></path><g fill=\"#ffffff\"><path d=\"M86,6.88c-43.65603,0 -79.12,35.46397 -79.12,79.12c0,43.65603 35.46397,79.12 79.12,79.12c43.65603,0 79.12,-35.46397 79.12,-79.12c0,-43.65603 -35.46397,-79.12 -79.12,-79.12zM86,13.76c39.93779,0 72.24,32.30221 72.24,72.24c0,39.93779 -32.30221,72.24 -72.24,72.24c-39.93779,0 -72.24,-32.30221 -72.24,-72.24c0,-39.93779 32.30221,-72.24 72.24,-72.24zM86,37.84c-5.69958,0 -10.32,4.62042 -10.32,10.32c0,5.69958 4.62042,10.32 10.32,10.32c5.69958,0 10.32,-4.62042 10.32,-10.32c0,-5.69958 -4.62042,-10.32 -10.32,-10.32zM72.24,72.24v6.88h3.44h3.44v44.72h-3.44h-3.44v6.88h3.44h3.44h13.76h3.44h3.44v-6.88h-3.44h-3.44v-51.6h-3.44h-13.76z\"></path></g></g></svg>');

-- --------------------------------------------------------

--
-- Структура таблицы `admin_notes`
--

CREATE TABLE `admin_notes` (
  `id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `date` varchar(255) NOT NULL,
  `author` varchar(512) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_references`
--

CREATE TABLE `admin_references` (
  `id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `subject` varchar(512) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_references`
--

INSERT INTO `admin_references` (`id`, `title`, `subject`, `content`) VALUES
(4, 'Контролер', 'Розробка', '<p>Контролери - це компонент ядра, який керує завантаженням контенту на сайті.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>При переході на сайт контролер маршрутизації (router) здійнює лексичний аналіз посилання, звідки визначає до якого контролера звертається користувач і який аргумент йому передається. Після визначення цільового контролера&nbsp;та аргументу маршрутизатор передає керування індексному файлу, який здійнює перевірку на наявність контролера у базі. У випадку, якщо такий контролер існує, індексний файл завантажує його, після чого керування подальше сайтом передається викликаному контролеру.</p>\n\n<p>&nbsp;</p>\n\n<p>Основне завдання контролера полягає в тому, щоб виходячи з переданої йому інформації знайти в базі даних потрібний контент і завантажити композицію, яка відповідає за відображення контенту для цього контролера.</p>\n\n<p>&nbsp;</p>\n\n<h5>Перелік стандартних контролерів RED Forge</h5>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li><span style=\"color:#e74c3c\">router </span>- контролер маршрутизаці. Здійснює аналіз посилання і завантаження контентних контролерів;</li>\n	<li><span style=\"color:#e74c3c\">main </span>- здійнює завантаження головної сторінки сайту;</li>\n	<li><span style=\"color:#e74c3c\">page </span>- здійнює завантаження сторінок;</li>\n	<li><span style=\"color:#e74c3c\">category </span>- здійнює завантаження списку категорій у випадку виклику без передачі аргументів або списку публікацій в певній категорії, якщо аргумент було передано;</li>\n	<li><span style=\"color:#e74c3c\">post</span> - здійснює завантаження публікацій;</li>\n	<li><span style=\"color:#e74c3c\">admin </span>-&nbsp;здійснює завантаження панелі адміністратора.</li>\n</ul>\n');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `additional_param1` text NOT NULL,
  `additional_param2` text NOT NULL,
  `additional_param3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `href` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `browser_title` text NOT NULL,
  `site_title` text NOT NULL,
  `content` longtext DEFAULT NULL,
  `additional_param1` text NOT NULL DEFAULT 'none',
  `additional_param2` text NOT NULL DEFAULT 'none',
  `additional_param3` text DEFAULT 'none',
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `parent` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `additional_param1` text NOT NULL DEFAULT 'none',
  `additional_param2` text NOT NULL DEFAULT 'none',
  `additional_param3` text NOT NULL DEFAULT 'none',
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `a` int(2) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`a`, `b`, `c`, `d`) VALUES
(1, 'first', 'first', 'first'),
(2, 'second', 'second', 'second'),
(3, 'third', 'third', 'third');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(64) NOT NULL,
  `varchar_param1` varchar(255) NOT NULL,
  `varchar_param2` varchar(255) NOT NULL,
  `varchar_param3` varchar(255) NOT NULL,
  `varchar_param4` varchar(255) NOT NULL,
  `varchar_param5` varchar(255) NOT NULL,
  `varchar_param6` varchar(255) NOT NULL,
  `varchar_param7` varchar(255) NOT NULL,
  `varchar_param8` varchar(255) NOT NULL,
  `varchar_param9` varchar(255) NOT NULL,
  `varchar_param10` varchar(255) NOT NULL,
  `int_param1` int(64) NOT NULL,
  `int_param2` int(64) NOT NULL,
  `int_param3` int(64) NOT NULL,
  `int_param4` int(64) NOT NULL,
  `int_param5` int(64) NOT NULL,
  `int_param6` int(64) NOT NULL,
  `int_param7` int(64) NOT NULL,
  `int_param8` int(64) NOT NULL,
  `int_param9` int(64) NOT NULL,
  `int_param10` int(64) NOT NULL,
  `text_param1` text NOT NULL,
  `text_param2` text NOT NULL,
  `text_param3` text NOT NULL,
  `text_param4` text NOT NULL,
  `text_param5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `varchar_param1`, `varchar_param2`, `varchar_param3`, `varchar_param4`, `varchar_param5`, `varchar_param6`, `varchar_param7`, `varchar_param8`, `varchar_param9`, `varchar_param10`, `int_param1`, `int_param2`, `int_param3`, `int_param4`, `int_param5`, `int_param6`, `int_param7`, `int_param8`, `int_param9`, `int_param10`, `text_param1`, `text_param2`, `text_param3`, `text_param4`, `text_param5`) VALUES
(1, 'Admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Ulyanov Lenin', '', '', '', '', '', '', '', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/98381915/original/9a98da91fcc1709763e92016d13756af640abcb7/design-minimalist-flat-line-vector-avatar-of-you.jpg', '', '', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_developers`
--
ALTER TABLE `admin_developers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin_mails`
--
ALTER TABLE `admin_mails`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin_notes`
--
ALTER TABLE `admin_notes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin_references`
--
ALTER TABLE `admin_references`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`a`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `varchar_param1` (`varchar_param1`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_developers`
--
ALTER TABLE `admin_developers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `admin_mails`
--
ALTER TABLE `admin_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `admin_notes`
--
ALTER TABLE `admin_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `admin_references`
--
ALTER TABLE `admin_references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `a` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
