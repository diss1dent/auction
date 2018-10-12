-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 12 2018 г., 13:52
-- Версия сервера: 5.7.16
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `auction`
--

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `slug` varchar(1024) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) DEFAULT NULL,
  `thumbnail_path` varchar(1024) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `article_attachment`
--

CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(1024) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `article_category`
--

INSERT INTO `article_category` (`id`, `slug`, `title`, `body`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'news', 'News', NULL, NULL, 1, 1539173215, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `file_storage_item`
--

CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `i18n_message`
--

CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `i18n_source_message`
--

CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(32) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `key_storage_item`
--

CREATE TABLE `key_storage_item` (
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `comment` text,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `key_storage_item`
--

INSERT INTO `key_storage_item` (`key`, `value`, `comment`, `updated_at`, `created_at`) VALUES
('backend.layout-boxed', '0', NULL, NULL, NULL),
('backend.layout-collapsed-sidebar', '0', NULL, NULL, NULL),
('backend.layout-fixed', '0', NULL, NULL, NULL),
('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', NULL, NULL),
('frontend.maintenance', 'disabled', 'Set it to \"enabled\" to turn on maintenance mode', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `land_plot`
--

CREATE TABLE `land_plot` (
  `id` int(11) NOT NULL,
  `cad_num` text COMMENT 'кадастровый номер',
  `area` double NOT NULL COMMENT 'площадь',
  `area_unit` varchar(11) NOT NULL COMMENT 'ед.измерения',
  `purpose` varchar(255) DEFAULT NULL COMMENT 'целевое назначение',
  `valuation` double DEFAULT NULL COMMENT 'нормативная оценка',
  `obkect_of_sale` varchar(255) DEFAULT NULL COMMENT 'Об’єкт продажу',
  `address` varchar(255) DEFAULT NULL COMMENT 'Місце розташування ',
  `term_of_lease` varchar(255) DEFAULT NULL COMMENT 'Строк оренди '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `land_plot`
--

INSERT INTO `land_plot` (`id`, `cad_num`, `area`, `area_unit`, `purpose`, `valuation`, `obkect_of_sale`, `address`, `term_of_lease`) VALUES
(1, '7121283600:04:005:0253', 20.7, 'га', '', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `lot`
--

CREATE TABLE `lot` (
  `id` int(11) NOT NULL,
  `lot_number` int(11) NOT NULL COMMENT 'Номер Лоту',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата проведення',
  `address` varchar(512) DEFAULT NULL COMMENT 'Місце проведення',
  `organizer` varchar(512) DEFAULT NULL COMMENT 'Організатор',
  `organizer_representative` varchar(255) DEFAULT NULL COMMENT 'Представник (уповноважена особа) Організатора',
  `performer` varchar(255) DEFAULT NULL COMMENT 'Виконавець',
  `performer_edrpoy` varchar(255) DEFAULT NULL COMMENT 'ЄДРПОУ',
  `performer_address` varchar(255) DEFAULT NULL COMMENT 'Адреса',
  `performer_litiator` varchar(255) DEFAULT NULL COMMENT 'Ліцетатор',
  `starting_rent` double DEFAULT NULL COMMENT 'Стартова річна орендна плата',
  `bidding_step` double DEFAULT NULL COMMENT 'Крок торгів (грн.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lot`
--

INSERT INTO `lot` (`id`, `lot_number`, `date`, `address`, `organizer`, `organizer_representative`, `performer`, `performer_edrpoy`, `performer_address`, `performer_litiator`, `starting_rent`, `bidding_step`) VALUES
(1, 26933, NULL, '', '', '', '', '', '', '', 6602.43, 33.01);

-- --------------------------------------------------------

--
-- Структура таблицы `lot_objects`
--

CREATE TABLE `lot_objects` (
  `id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_variant` int(11) NOT NULL DEFAULT '1' COMMENT 'land plot (1)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1539172534);

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(2048) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `body`, `view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about', 'About', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, 1, 1539173215, 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `nane` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `representative` varchar(255) DEFAULT NULL,
  `representative_authority` varchar(255) DEFAULT NULL,
  `bank_account` int(11) DEFAULT NULL,
  `bank_mfo` int(11) DEFAULT NULL,
  `edrpoy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_auth_assignment`
--

CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rbac_auth_assignment`
--

INSERT INTO `rbac_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', '1', 1539173215),
('manager', '2', 1539173215),
('user', '3', 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_auth_item`
--

CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rbac_auth_item`
--

INSERT INTO `rbac_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, NULL, NULL, NULL, 1539173215, 1539173215),
('editOwnModel', 2, NULL, 'ownModelRule', NULL, 1539173215, 1539173215),
('loginToBackend', 2, NULL, NULL, NULL, 1539173215, 1539173215),
('manager', 1, NULL, NULL, NULL, 1539173215, 1539173215),
('user', 1, NULL, NULL, NULL, 1539173215, 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_auth_item_child`
--

CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rbac_auth_item_child`
--

INSERT INTO `rbac_auth_item_child` (`parent`, `child`) VALUES
('user', 'editOwnModel'),
('administrator', 'loginToBackend'),
('manager', 'loginToBackend'),
('administrator', 'manager'),
('administrator', 'user'),
('manager', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_auth_rule`
--

CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rbac_auth_rule`
--

INSERT INTO `rbac_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('ownModelRule', 0x4f3a32393a22636f6d6d6f6e5c726261635c72756c655c4f776e4d6f64656c52756c65223a333a7b733a343a226e616d65223b733a31323a226f776e4d6f64656c52756c65223b733a393a22637265617465644174223b693a313533393137333231353b733a393a22757064617465644174223b693a313533393137333231353b7d, 1539173215, 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `system_db_migration`
--

CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `system_db_migration`
--

INSERT INTO `system_db_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1539173211),
('m140703_123000_user', 1539173211),
('m140703_123055_log', 1539173212),
('m140703_123104_page', 1539173212),
('m140703_123803_article', 1539173212),
('m140703_123813_rbac', 1539173212),
('m140709_173306_widget_menu', 1539173212),
('m140709_173333_widget_text', 1539173213),
('m140712_123329_widget_carousel', 1539173213),
('m140805_084745_key_storage_item', 1539173213),
('m141012_101932_i18n_tables', 1539173213),
('m150318_213934_file_storage_item', 1539173213),
('m150414_195800_timeline_event', 1539173213),
('m150725_192740_seed_data', 1539173215),
('m150929_074021_article_attachment_order', 1539173215),
('m160203_095604_user_token', 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `system_log`
--

CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_log`
--

INSERT INTO `system_log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 1, 'Error', 1539178598.5572, '[backend][/backend/web/system/information/index]', 'Error: Class \'COM\' not found in C:\\OpenServer\\domains\\auction\\vendor\\trntv\\probe\\src\\Provider\\WindowsProvider.php:276\nStack trace:\n#0 C:\\OpenServer\\domains\\auction\\vendor\\trntv\\probe\\src\\Provider\\WindowsProvider.php(175): Probe\\Provider\\WindowsProvider->getWMI()\n#1 C:\\OpenServer\\domains\\auction\\vendor\\trntv\\probe\\src\\Provider\\WindowsProvider.php(152): Probe\\Provider\\WindowsProvider->getCpuInfo()\n#2 C:\\OpenServer\\domains\\auction\\backend\\modules\\system\\views\\information\\index.php(33): Probe\\Provider\\WindowsProvider->getCpuModel()\n#3 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(336): require(\'C:\\\\OpenServer\\\\d...\')\n#4 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(254): yii\\base\\View->renderPhpFile(\'C:\\\\OpenServer\\\\d...\', Array)\n#5 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\OpenServer\\\\d...\', Array, Object(backend\\modules\\system\\controllers\\InformationController))\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\modules\\system\\controllers\\InformationController))\n#7 C:\\OpenServer\\domains\\auction\\backend\\modules\\system\\controllers\\InformationController.php(35): yii\\base\\Controller->render(\'index\', Array)\n#8 [internal function]: backend\\modules\\system\\controllers\\InformationController->actionIndex()\n#9 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#10 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#11 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#12 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'system/informat...\', Array)\n#13 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#14 C:\\OpenServer\\domains\\auction\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#15 {main}'),
(2, 1, 'yii\\base\\ErrorException:2', 1539178616.891, '[backend][/backend/web/system/log/view?id=1]', 'yii\\base\\ErrorException: symlink(): No such file or directory in C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:531\nStack trace:\n#0 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(463): yii\\web\\AssetManager->publishDirectory()\n#1 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(185): yii\\web\\AssetManager->publish()\n#2 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(268): yii\\web\\AssetBundle->publish()\n#3 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(239): yii\\web\\AssetManager->loadBundle()\n#4 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\View.php(286): yii\\web\\AssetManager->getBundle()\n#5 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\View.php(291): yii\\web\\View->registerAssetBundle()\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\View.php(291): yii\\web\\View->registerAssetBundle()\n#7 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(125): yii\\web\\View->registerAssetBundle()\n#8 C:\\OpenServer\\domains\\auction\\backend\\views\\layouts\\common.php(18): yii\\web\\AssetBundle::register()\n#9 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(336): yii\\base\\View->unknown()\n#10 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(254): yii\\base\\View->renderPhpFile()\n#11 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\widgets\\ContentDecorator.php(79): yii\\base\\View->renderFile()\n#12 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Widget.php(109): yii\\widgets\\ContentDecorator->run()\n#13 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(509): yii\\base\\Widget::end()\n#14 C:\\OpenServer\\domains\\auction\\backend\\views\\layouts\\main.php(12): yii\\base\\View->endContent()\n#15 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(336): yii\\base\\View->unknown()\n#16 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(254): yii\\base\\View->renderPhpFile()\n#17 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(399): yii\\base\\View->renderFile()\n#18 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(385): yii\\base\\Controller->renderContent()\n#19 C:\\OpenServer\\domains\\auction\\backend\\modules\\system\\controllers\\LogController.php(67): yii\\base\\Controller->render()\n#20 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): backend\\modules\\system\\controllers\\LogController->actionView()\n#21 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): ::call_user_func_array:{C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:57}()\n#22 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams()\n#23 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction()\n#24 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction()\n#25 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest()\n#26 C:\\OpenServer\\domains\\auction\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#27 {main}'),
(3, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539179325.363, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(4, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539179382.3658, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(5, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539179624.6617, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(6, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539179646.4597, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(7, 1, 'yii\\base\\ViewNotFoundException', 1539179751.1102, '[backend][/backend/web/land-plot/index]', 'yii\\base\\ViewNotFoundException: The view file does not exist: C:\\OpenServer\\domains\\auction\\backend\\views\\land-plot\\index.php in C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php:233\nStack trace:\n#0 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\OpenServer\\\\d...\', Array, Object(backend\\controllers\\LandPlotController))\n#1 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(384): yii\\base\\View->render(\'index\', Array, Object(backend\\controllers\\LandPlotController))\n#2 C:\\OpenServer\\domains\\auction\\backend\\controllers\\LandPlotController.php(43): yii\\base\\Controller->render(\'index\', Array)\n#3 [internal function]: backend\\controllers\\LandPlotController->actionIndex()\n#4 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#5 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#7 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'land-plot/index\', Array)\n#8 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#9 C:\\OpenServer\\domains\\auction\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#10 {main}'),
(8, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539180023.5965, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(9, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539180038.487, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(10, 1, 'ParseError', 1539180077.3218, '[backend][/backend/web/lot/index]', 'ParseError: syntax error, unexpected \'step\' (T_STRING), expecting \']\' in C:\\OpenServer\\domains\\auction\\common\\models\\LotSearch.php:67\nStack trace:\n#0 [internal function]: yii\\BaseYii::autoload(\'common\\\\models\\\\L...\')\n#1 C:\\OpenServer\\domains\\auction\\backend\\controllers\\LotController.php(38): spl_autoload_call(\'common\\\\models\\\\L...\')\n#2 [internal function]: backend\\controllers\\LotController->actionIndex()\n#3 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#4 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#5 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'lot/index\', Array)\n#7 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#8 C:\\OpenServer\\domains\\auction\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#9 {main}'),
(11, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539180112.1683, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(12, 1, 'yii\\base\\UnknownPropertyException', 1539180254.3228, '[backend][/backend/web/lot/index]', 'yii\\base\\UnknownPropertyException: Getting unknown property: common\\models\\LotSearch::bidding step in C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Component.php:154\nStack trace:\n#0 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component->__get(\'bidding step\')\n#1 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\validators\\Validator.php(264): yii\\db\\BaseActiveRecord->__get(\'bidding step\')\n#2 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Model.php(367): yii\\validators\\Validator->validateAttributes(Object(common\\models\\LotSearch), Array)\n#3 C:\\OpenServer\\domains\\auction\\common\\models\\LotSearch.php(55): yii\\base\\Model->validate()\n#4 C:\\OpenServer\\domains\\auction\\backend\\controllers\\LotController.php(39): common\\models\\LotSearch->search(Array)\n#5 [internal function]: backend\\controllers\\LotController->actionIndex()\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)\n#7 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Controller.php(157): yii\\base\\InlineAction->runWithParams(Array)\n#8 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#9 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'lot/index\', Array)\n#10 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#11 C:\\OpenServer\\domains\\auction\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#12 {main}'),
(13, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539180265.8466, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(14, 1, 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', 1539180275.1488, '[frontend][/frontend/web/gii/crud]', 'The message file for category \'app\' does not exist: C:\\OpenServer\\domains\\auction\\common/messages/ru-RU/app.php Fallback file does not exist as well: C:\\OpenServer\\domains\\auction\\common/messages/ru/app.php'),
(15, 1, 'yii\\base\\InvalidConfigException', 1539250466.0753, '[frontend][/frontend/web/assets/5e25e145/style.css]', 'yii\\base\\InvalidConfigException: yii\\web\\Request::cookieValidationKey must be configured with a secret key. in C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Request.php:1554\nStack trace:\n#0 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Request.php(1536): yii\\web\\Request->loadCookies()\n#1 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\User.php(539): yii\\web\\Request->getCookies()\n#2 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\User.php(709): yii\\web\\User->renewIdentityCookie()\n#3 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\User.php(192): yii\\web\\User->renewAuthStatus()\n#4 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\User.php(360): yii\\web\\User->getIdentity()\n#5 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Component.php(139): yii\\web\\User->getIsGuest()\n#6 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2-debug\\panels\\UserPanel.php(81): yii\\base\\Component->__get(\'isGuest\')\n#7 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\debug\\panels\\UserPanel->init()\n#8 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#9 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\di\\Container.php(383): ReflectionClass->newInstanceArgs(Array)\n#10 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'yii\\\\debug\\\\panel...\', Array, Array)\n#11 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\debug\\\\panel...\', Array, Array)\n#12 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2-debug\\Module.php(177): yii\\BaseYii::createObject(Array)\n#13 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2-debug\\Module.php(149): yii\\debug\\Module->initPanels()\n#14 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\debug\\Module->init()\n#15 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(158): yii\\base\\BaseObject->__construct(Array)\n#16 [internal function]: yii\\base\\Module->__construct(\'debug\', Object(yii\\web\\Application), Array)\n#17 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\di\\Container.php(383): ReflectionClass->newInstanceArgs(Array)\n#18 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\di\\Container.php(156): yii\\di\\Container->build(\'yii\\\\debug\\\\Modul...\', Array, Array)\n#19 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\debug\\\\Modul...\', Array, Array)\n#20 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Module.php(427): yii\\BaseYii::createObject(Array, Array)\n#21 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(315): yii\\base\\Module->getModule(\'debug\')\n#22 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\web\\Application.php(69): yii\\base\\Application->bootstrap()\n#23 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(273): yii\\web\\Application->bootstrap()\n#24 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\base\\Application->init()\n#25 C:\\OpenServer\\domains\\auction\\vendor\\yiisoft\\yii2\\base\\Application.php(206): yii\\base\\BaseObject->__construct(Array)\n#26 C:\\OpenServer\\domains\\auction\\frontend\\web\\index.php(22): yii\\base\\Application->__construct(Array)\n#27 {main}');

-- --------------------------------------------------------

--
-- Структура таблицы `system_rbac_migration`
--

CREATE TABLE `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `system_rbac_migration`
--

INSERT INTO `system_rbac_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1539173215),
('m150625_214101_roles', 1539173215),
('m150625_215624_init_permissions', 1539173215),
('m151223_074604_edit_own_model', 1539173215);

-- --------------------------------------------------------

--
-- Структура таблицы `timeline_event`
--

CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL,
  `application` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `timeline_event`
--

INSERT INTO `timeline_event` (`id`, `application`, `category`, `event`, `data`, `created_at`) VALUES
(1, 'frontend', 'user', 'signup', '{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1539173213}', 1539173213),
(2, 'frontend', 'user', 'signup', '{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1539173213}', 1539173213),
(3, 'frontend', 'user', 'signup', '{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1539173213}', 1539173213);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `auth_key` varchar(32) NOT NULL,
  `access_token` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `oauth_client` varchar(255) DEFAULT NULL,
  `oauth_client_user_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `access_token`, `password_hash`, `oauth_client`, `oauth_client_user_id`, `email`, `status`, `created_at`, `updated_at`, `logged_at`) VALUES
(1, 'webmaster', 'FDRZGjtj2JlPEorIfxYrNzmoZhEzJrUu', 'vlChVJGpxD0q965Au6E1KtFOtmFez5PiAe5dkd94', '$2y$13$bMmF2IZWpnS9uOuAIPQG3.JEy0HpowbT49HarTpIY09cDjkpdPUWq', NULL, NULL, 'webmaster@example.com', 2, 1539173214, 1539173214, 1539173959),
(2, 'manager', 'AOXlBEBwh0xx2D1mpl8WooGT2UZukYF6', 'QIoTBd3B_IUB8i3PkY8CSYdkCwWlfyLNE_e2rnkY', '$2y$13$kEiiUemxbnjWlICwU8JOoOPQvglaWxuIxJOqcq/1XcdjBaMuMgrt2', NULL, NULL, 'manager@example.com', 2, 1539173214, 1539173214, NULL),
(3, 'user', 'oq4ropgdxPomd1-6s8S5OTvwCqqYG8TT', 'bg_SbK95RpjUdacpIoElrklvdCmCFBmPT8Pmrkwk', '$2y$13$nJlDTJLnadUQtX7gOg8ydOafo4dsj9/6z1mOuIeq9iNbcEQpIYDg6', NULL, NULL, 'user@example.com', 2, 1539173215, 1539173215, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_base_url` varchar(255) DEFAULT NULL,
  `locale` varchar(32) NOT NULL,
  `gender` smallint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `firstname`, `middlename`, `lastname`, `avatar_path`, `avatar_base_url`, `locale`, `gender`) VALUES
(1, 'John', NULL, 'Doe', NULL, NULL, 'en-US', NULL),
(2, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL),
(3, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `widget_carousel`
--

CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_carousel`
--

INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES
(1, 'index', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_carousel_item`
--

CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `asset_url` varchar(1024) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `caption` varchar(1024) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_carousel_item`
--

INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `asset_url`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://auction', 'img/yii2-starter-kit.gif', 'http://auction/img/yii2-starter-kit.gif', 'image/gif', '/', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_menu`
--

CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_menu`
--

INSERT INTO `widget_menu` (`id`, `key`, `title`, `items`, `status`) VALUES
(1, 'frontend-index', 'Frontend index menu', '[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_text`
--

CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_text`
--

INSERT INTO `widget_text` (`id`, `key`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', 1, 1539173215, 1539173215),
(2, 'ads-example', 'Google Ads Example Block', '<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>', 0, 1539173215, 1539173215);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_author` (`created_by`),
  ADD KEY `fk_article_updater` (`updated_by`),
  ADD KEY `fk_article_category` (`category_id`);

--
-- Индексы таблицы `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_attachment_article` (`article_id`);

--
-- Индексы таблицы `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_category_section` (`parent_id`);

--
-- Индексы таблицы `file_storage_item`
--
ALTER TABLE `file_storage_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Индексы таблицы `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `key_storage_item`
--
ALTER TABLE `key_storage_item`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `idx_key_storage_item_key` (`key`);

--
-- Индексы таблицы `land_plot`
--
ALTER TABLE `land_plot`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lot_objects`
--
ALTER TABLE `lot_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbac_auth_assignment`
--
ALTER TABLE `rbac_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `rbac_auth_item`
--
ALTER TABLE `rbac_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `rbac_auth_item_child`
--
ALTER TABLE `rbac_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `rbac_auth_rule`
--
ALTER TABLE `rbac_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `system_db_migration`
--
ALTER TABLE `system_db_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Индексы таблицы `system_rbac_migration`
--
ALTER TABLE `system_rbac_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `timeline_event`
--
ALTER TABLE `timeline_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_carousel`
--
ALTER TABLE `widget_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_carousel` (`carousel_id`);

--
-- Индексы таблицы `widget_menu`
--
ALTER TABLE `widget_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widget_text`
--
ALTER TABLE `widget_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_widget_text_key` (`key`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `article_attachment`
--
ALTER TABLE `article_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `file_storage_item`
--
ALTER TABLE `file_storage_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `land_plot`
--
ALTER TABLE `land_plot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `lot`
--
ALTER TABLE `lot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `lot_objects`
--
ALTER TABLE `lot_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `timeline_event`
--
ALTER TABLE `timeline_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `widget_carousel`
--
ALTER TABLE `widget_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_menu`
--
ALTER TABLE `widget_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `widget_text`
--
ALTER TABLE `widget_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lot_objects`
--
ALTER TABLE `lot_objects`
  ADD CONSTRAINT `lot_objects_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rbac_auth_assignment`
--
ALTER TABLE `rbac_auth_assignment`
  ADD CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rbac_auth_item`
--
ALTER TABLE `rbac_auth_item`
  ADD CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rbac_auth_item_child`
--
ALTER TABLE `rbac_auth_item_child`
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
