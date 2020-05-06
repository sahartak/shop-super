-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 07:35 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoptop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_editor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_hy` text COLLATE utf8mb4_unicode_ci,
  `metatitle_hy` text COLLATE utf8mb4_unicode_ci,
  `metadescription_hy` text COLLATE utf8mb4_unicode_ci,
  `name_en` text COLLATE utf8mb4_unicode_ci,
  `metatitle_en` text COLLATE utf8mb4_unicode_ci,
  `metadescription_en` text COLLATE utf8mb4_unicode_ci,
  `name_ru` text COLLATE utf8mb4_unicode_ci,
  `metatitle_ru` text COLLATE utf8mb4_unicode_ci,
  `metadescription_ru` text COLLATE utf8mb4_unicode_ci,
  `publish` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`image`, `preview`, `author_id`, `last_editor_id`, `category_id`, `sorting`, `created_at`, `updated_at`, `name_hy`, `metatitle_hy`, `metadescription_hy`, `name_en`, `metatitle_en`, `metadescription_en`, `name_ru`, `metatitle_ru`, `metadescription_ru`, `publish`) VALUES
('1584432401.jpg', 'preview_1584432401.jpg', 1, NULL, 45, 35, '2020-03-01 15:01:10', '2020-03-01 15:01:20', 'Մսամթերք', NULL, NULL, 'Meat Products', NULL, NULL, 'Мясные продукты', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `ordered` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inprocess` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `board_id` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name_ru` text COLLATE utf8_unicode_ci,
  `text_ru` text COLLATE utf8_unicode_ci,
  `metatitle_ru` text COLLATE utf8_unicode_ci,
  `metadescription_ru` text COLLATE utf8_unicode_ci,
  `name_hy` text COLLATE utf8_unicode_ci,
  `text_hy` text COLLATE utf8_unicode_ci,
  `metatitle_hy` text COLLATE utf8_unicode_ci,
  `metadescription_hy` text COLLATE utf8_unicode_ci,
  `name_en` text COLLATE utf8_unicode_ci,
  `text_en` text COLLATE utf8_unicode_ci,
  `metatitle_en` text COLLATE utf8_unicode_ci,
  `metadescription_en` text COLLATE utf8_unicode_ci,
  `sorting` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name_ru`, `text_ru`, `metatitle_ru`, `metadescription_ru`, `name_hy`, `text_hy`, `metatitle_hy`, `metadescription_hy`, `name_en`, `text_en`, `metatitle_en`, `metadescription_en`, `sorting`) VALUES
(33, '2019-11-15 10:50:27', '2019-11-15 10:50:27', 'Соки и напитки', 'Соки и напитки', 'Соки и напитки', 'Соки и напитки', 'Հյութեր և ըմպելիքներ', 'Հյութեր և ըմպելիքներ', 'Հյութեր և ըմպելիքներ', 'Հյութեր և ըմպելիքներ', 'Juice and Beverages', 'Juice and Beverages', 'Juice and Beverages', 'Juice and Beverages', 5),
(34, '2019-11-18 11:10:23', '2019-11-18 11:10:23', 'Консервированные продукты', 'Консервированные продукты', 'Консервированные продукты', 'Консервированные продукты', 'Պահածոյացված մթերք', 'Պահածոյացված մթերք', 'Պահածոյացված մթերք', 'Պահածոյացված մթերք', 'Canned Food', 'Canned Food', 'Canned Food', 'Canned Food', 11),
(35, '2019-11-22 17:05:52', '2019-11-22 17:05:52', 'Бакалея', 'Бакалея', 'Бакалея', 'Бакалея', 'Նպարեղեն', 'Նպարեղեն', 'Նպարեղեն', 'Նպարեղեն', 'Grocery', 'Grocery', 'Grocery', 'Grocery', 3),
(37, '2019-12-27 07:10:16', '2019-12-27 07:10:16', 'Хлебобулочные изделия и выпечка', 'Хлебобулочные изделия и выпечка', 'Хлебобулочные изделия и выпечка', 'Хлебобулочные изделия и выпечка', 'Հացաբուլկեղեն և թխվածքներ', 'Հացաբուլկեղեն և թխվածքներ', 'Հացաբուլկեղեն և թխվածքներ', 'Հացաբուլկեղեն և թխվածքներ', 'Bakery Goods, Buns and Rolls', 'Bakery Goods, Buns and Rolls', 'Bakery Goods, Buns and Rolls', 'Bakery Goods, Buns and Rolls', 1),
(38, '2020-02-19 13:08:27', '2020-02-19 13:08:27', 'Молочные продукты', 'Молочные продукты', 'Молочные продукты', 'Молочные продукты', 'Կաթնամթերք', 'Կաթնամթերք', 'Կաթնամթերք', 'Կաթնամթերք', 'Dairy', 'Dairy', 'Dairy', 'Dairy', 2),
(41, '2020-02-19 14:35:30', '2020-02-19 14:35:30', 'Алкогольные напитки', 'Алкогольные напитки', 'Алкогольные напитки', 'Алкогольные напитки', 'Ալկոհոլային խմիչքներ', 'Ալկոհոլային խմիչքներ', 'Ալկոհոլային խմիչքներ', 'Ալկոհոլային խմիչքներ', 'Alcoholic beverages', 'Alcoholic beverages', 'Alcoholic beverages', 'Alcoholic beverages', 8),
(39, '2020-02-19 13:29:22', '2020-02-19 13:29:22', 'Сладости', 'Сладости', 'Сладости', 'Сладости', 'Քաղցրավենիք', 'Քաղցրավենիք', 'Քաղցրավենիք', 'Քաղցրավենիք', 'Candy', 'Candy', 'Candy', 'Candy', 4),
(40, '2020-02-19 13:32:43', '2020-02-19 13:32:43', 'Чай', 'Чай', 'Чай , Кофе', 'Чай , Кофе', 'Թեյ', 'Թեյ', 'Թեյ , Սուրճ', 'Թեյ , Սուրճ', 'Tea', 'Tea', 'Tea , Coffe', 'Tea , Coffe', 6),
(51, '2020-03-21 13:47:12', '2020-03-21 13:47:12', 'Кофе', 'Кофе', 'Кофе', 'Кофе', 'Սուրճ', 'Սուրճ', 'Սուրճ', 'Սուրճ', 'Cofee', 'Coffe', 'Cofee', 'Cofee', 7),
(42, '2020-02-19 14:36:52', '2020-02-19 14:36:52', 'Табачные изделия', 'Табачные изделия', 'Табачные изделия', 'Табачные изделия', 'Ծխախոտային արտադրանք', 'Ծխախոտային արտադրանք', 'Ծխախոտային արտադրանք', 'Ծխախոտային արտադրանք', 'Tobacco products', 'Tobacco products', 'Tobacco products', 'Tobacco products', 10),
(43, '2020-02-19 14:39:52', '2020-02-19 14:39:52', 'Свежие овощи', 'Свежие овощи', 'Свежие овощи', 'Свежие овощи', 'Թարմ բանջարեղեն', 'Թարմ բանջարեղեն', 'Թարմ բանջարեղեն', 'Թարմ բանջարեղեն', 'Fresh vegetables', 'Fresh vegetables', 'Fresh vegetables', 'Fresh vegetables', 12),
(44, '2020-02-19 14:40:49', '2020-02-19 14:40:49', 'Фрукты', 'Фрукты', 'Фрукты', 'Фрукты', 'Միրգ', 'Միրգ', 'Միրգ', 'Միրգ', 'Fruits', 'Fruits', 'Fruits', 'Fruits', 13),
(45, '2020-02-28 17:30:04', '2020-02-28 17:30:04', 'Мясные продукты', NULL, NULL, NULL, 'Մսամթերք', NULL, NULL, NULL, 'Meat Products', NULL, NULL, NULL, 9),
(48, '2020-03-19 17:26:07', '2020-03-19 17:26:07', 'Хозяйственные товары', NULL, NULL, NULL, 'Տնտեսական ապրանքներ', NULL, NULL, NULL, 'Household goods', NULL, NULL, NULL, 15),
(49, '2020-03-21 11:40:43', '2020-03-21 11:40:43', 'Готовая еда', NULL, NULL, NULL, 'Պատրաստի ուտեստներ', NULL, NULL, NULL, 'Ready Made Meals', NULL, NULL, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_000000_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_09_17_105017_create_boards_table', 1),
(6, '2019_09_17_105245_create_products_table', 1),
(7, '2019_09_17_110016_create_carts_table', 1),
(8, '2019_09_17_110021_create_cart_items_table', 1),
(9, '2019_10_12_094046_create_product_translations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name_en` text COLLATE utf8_unicode_ci,
  `text_en` text COLLATE utf8_unicode_ci,
  `metatitle_en` text COLLATE utf8_unicode_ci,
  `metadescription_en` text COLLATE utf8_unicode_ci,
  `name_ru` text COLLATE utf8_unicode_ci,
  `text_ru` text COLLATE utf8_unicode_ci,
  `metatitle_ru` text COLLATE utf8_unicode_ci,
  `metadescription_ru` text COLLATE utf8_unicode_ci,
  `name_hy` text COLLATE utf8_unicode_ci,
  `text_hy` text COLLATE utf8_unicode_ci,
  `metatitle_hy` text COLLATE utf8_unicode_ci,
  `metadescription_hy` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `image`, `order`, `created_at`, `updated_at`, `name_en`, `text_en`, `metatitle_en`, `metadescription_en`, `name_ru`, `text_ru`, `metatitle_ru`, `metadescription_ru`, `name_hy`, `text_hy`, `metatitle_hy`, `metadescription_hy`) VALUES
(3, NULL, NULL, '2019-12-19 14:56:01', '2019-12-19 14:56:01', 'About us', '<p>Me, Mariam Poghosyan, along with our team of highly skilled professionals put our minds to<br />create a website called Shoptop by applying Bloomline online purchase software system. Our key objective is to provide our users with more efficient and comfortable<br />option for product delivery service.<br />In our opinion the procedure for purchase and delivery of goods on the online platforms could<br />be simplified and made clearer and more comfortable to users. I&rsquo;m confident that the most users<br />are unwilling to waste their time on the registration and completion of all mandatory lines<br />necessary for placing an order, as well as surfing the web-pages in search for the needed<br />goods.<br />For these very reasons and due to the fact that most of the relevant websites are not user-<br />friendly we offer our users a gamechanging solution. Hence, while making purchase through the<br />Shoptop, the user will have a real feel of being in the shop pavilion. On a single page he/she will<br />be enabled to watch over 60 products placed on the shelves in the pavilion. The user will only<br />have to pick the needed item and easily place an order.<br />Thank you for visiting &ldquo;About us&rdquo; page. We shall do our best to provide you with the most user-<br />friendly interface and ensure fast and safe delivery of your ordered goods.</p>', NULL, NULL, 'О нас', '<p>Я, Мариам Погосян, совместно с нашей профессиональной командой решили создать сайт под названием shoptop с применением программы Bloomline онлайн покупок. Основной целью было обеспечение более доступного и удобного варианта предоставления онлайн услуги по доставке продуктов питания для наших пользователей.</p>\r\n<p>По нашему мнению процедуру закупки и доставки товаров на интернет площадках можно гораздо упростить и сделать более удобной для наших пользователей. Уверена, что при осуществлении покупок у многих не возникает желания тратить время на регистрацию и заполнение всяких разных пунктов, необходимых для размещения заказа, а также просмотра множества страниц, чтобы найти на сайте требующийся товар.</p>\r\n<p>С учетом вышесказанного, а также по причине того, что многие специализированные сайты не обеспечивают для пользователей интуитивно понятный интерфейс, мы предлагаем нашим пользователям инновационное решение. При осуществлении покупок через сайт shoptop у пользователя будет ощущение присутствия в реальном павильоне магазина. У пользователя также будет возможость просматривать на одной странице более 60 видов продуктов, разложенных по полкам в павильонах. Ему/ей нужно будет просто выбрать и с легкостью разместить заказ на нужный товар.</p>\r\n<p>Спасибо за посещение нашей странички &laquo;О нас&raquo;. Мы сделаем все возможное, чтобы вам было наиболее удобно пользоваться нашим сайтом и обеспечить быструю и безопасную доставку заказанных вами товаров.</p>', NULL, NULL, 'Մեր մասին', '<p><span style=\"font-weight: 400;\">Ես՝ Մարիամ Պողոսյանս և մեր արհեստավարժ անձնակազմը որոշեցինք ստեղծել shoptop կայքը՝ կիրառելով &laquo;Bloomline&raquo; </span><span style=\"font-weight: 400;\">առցանց գնումների ծրագրային համակարգը։ Հիմնական նպատակն էր մեր օգտատերերի համար ապահովել մթերքների առաքման առցանց ծառայության՝ ավելի մատչելի և հարմարավետ տարբերակ։</span></p>\r\n<p><span style=\"font-weight: 400;\">Մեր կարծիքով առցանց հարթակներում ապրանքների գնման և առաքման ընթացակարգը կարելի է դարձնել շատ ավելի պարզ և հասարակ բոլոր օգտատերերի համար։ Վստահ եմ, որ առցանց գնումներ կատարելիս շատերը ցանկություն չունեն ժամանակ տրամադրել գրանցվելու և լրացնելու բոլոր այն պահանջվող բազմաթիվ կետերը, որոնք անհրաժեշտ են պատվեր կատարելու համար, ինչպես նաև թերթելու բազմաթիվ էջեր՝ հետաքրքրող ապրանքը կայքում գտնելու համար։</span></p>\r\n<p><span style=\"font-weight: 400;\">Ահա այս և այլ՝ օգտատերերին ոչ հարմար պատճառներից ելնելով՝ մենք մեր հաճախորդներին առաջարկում ենք նորարարական լուծում։ Shoptop&ndash;ի միջոցով գնումներ կատարելիս օգտատերն իրեն կզգա ինչպես իրական խանութի սրահում։ Մեկ էջի վրա նա հնարավորություն կունենա տեսնելու իրական տաղավարներում դարակաշարերի վրա դասավորված ավելի քան 60 ապրանքատեսակ։ Նրան պարզապես կմնա ընտրել իրեն հարկավոր ապրանքը և հեշտությամբ պատվիրել այն։</span></p>\r\n<p><span style=\"font-weight: 400;\">Շնորհակալություն &laquo;Մեր մասին&raquo; էջն այցելելու համար։ Մենք կանենք հնարավորինը, որպեսզի մեր կայքից օգտվելը լինի ձեզ համար առավել հարմարավետ, իսկ ձեր պատվիրած ապրանքների առաքումը՝ արագ և ապահով։</span></p>', NULL, NULL),
(4, NULL, NULL, '2019-12-26 14:54:10', '2019-12-26 14:54:10', 'How to order', NULL, NULL, NULL, 'Как заказать', NULL, NULL, NULL, 'Ինչպես պատվիրել կայքից', '<p><video controls=\"controls\" width=\"1280\" height=\"640\">\r\n<source src=\"../../../files/Shoptop.am.mp4\" type=\"video/mp4\" /></video></p>', 'Մեր մասին', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `coordinates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `price` int(11) DEFAULT NULL,
  `board_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `coordinates`, `price`, `board_id`, `created_at`, `updated_at`, `weight`) VALUES
(2881, '{\"top\":\"3.2781567787106143\",\"left\":\"3.5964912280701755\",\"width\":\"5.7894736842105265\",\"height\":\"18.633733268460336\"}', 2700, 1, '2020-05-06 05:35:10', '2020-03-19 11:02:20', NULL),
(2882, '{\"top\":\"2.58801850950838\",\"left\":\"10\",\"width\":\"5.87719298245614\",\"height\":\"19.49640610496313\"}', 2700, 1, '2020-05-06 05:35:10', '2020-03-19 11:02:28', NULL),
(2884, '{\"top\":\"2.415483942207821\",\"left\":\"22.63157894736842\",\"width\":\"6.228070175438597\",\"height\":\"19.49640610496313\"}', 2250, 1, '2020-05-06 05:35:10', '2020-03-19 11:02:52', NULL),
(2883, '{\"top\":\"2.415483942207821\",\"left\":\"16.31578947368421\",\"width\":\"6.052631578947368\",\"height\":\"19.49640610496313\"}', 2500, 1, '2020-05-06 05:35:10', '2020-03-19 11:02:41', NULL),
(2885, '{\"top\":\"2.7605530768089386\",\"left\":\"29.12280701754386\",\"width\":\"6.228070175438597\",\"height\":\"19.32387153766257\"}', 2700, 1, '2020-05-06 05:35:10', '2020-03-19 11:03:10', NULL),
(2886, '{\"top\":\"2.58801850950838\",\"left\":\"35.43859649122807\",\"width\":\"6.315789473684211\",\"height\":\"19.49640610496313\"}', 3100, 1, '2020-05-06 05:35:10', '2020-03-19 11:03:19', NULL),
(2889, '{\"top\":\"2.2429493749072624\",\"left\":\"54.64912280701754\",\"width\":\"6.491228070175438\",\"height\":\"19.668940672263687\"}', 2450, 1, '2020-05-06 05:35:10', '2020-03-19 11:16:46', NULL),
(2887, '{\"top\":\"2.58801850950838\",\"left\":\"42.01754385964912\",\"width\":\"6.140350877192983\",\"height\":\"19.32387153766257\"}', 3100, 1, '2020-05-06 05:35:10', '2020-03-19 11:13:06', NULL),
(2888, '{\"top\":\"2.0704148076067037\",\"left\":\"48.24561403508772\",\"width\":\"6.315789473684211\",\"height\":\"19.841475239564247\"}', 3100, 1, '2020-05-06 05:35:10', '2020-03-19 11:14:00', NULL),
(2891, '{\"top\":\"2.2429493749072624\",\"left\":\"67.71929824561404\",\"width\":\"6.491228070175438\",\"height\":\"19.668940672263687\"}', 1250, 1, '2020-05-06 05:35:10', '2020-03-19 11:24:14', NULL),
(2894, '{\"top\":\"2.415483942207821\",\"left\":\"87.36842105263158\",\"width\":\"6.491228070175438\",\"height\":\"19.668940672263687\"}', 1500, 1, '2020-05-06 05:35:10', '2020-03-19 11:41:28', NULL),
(2890, '{\"top\":\"2.415483942207821\",\"left\":\"61.228070175438596\",\"width\":\"6.4035087719298245\",\"height\":\"19.49640610496313\"}', 3500, 1, '2020-05-06 05:35:10', '2020-03-19 15:41:33', NULL),
(2893, '{\"top\":\"2.415483942207821\",\"left\":\"80.78947368421052\",\"width\":\"6.491228070175438\",\"height\":\"19.49640610496313\"}', 3100, 1, '2020-05-06 05:35:10', '2020-03-19 11:33:53', NULL),
(2892, '{\"top\":\"2.415483942207821\",\"left\":\"74.21052631578948\",\"width\":\"6.491228070175438\",\"height\":\"19.49640610496313\"}', 3200, 1, '2020-05-06 05:35:10', '2020-03-19 11:29:03', NULL),
(2897, '{\"top\":\"39.337881344527375\",\"left\":\"16.403508771929825\",\"width\":\"6.052631578947368\",\"height\":\"20.18654437416536\"}', 1, 1, '2020-05-06 05:35:10', '2020-03-02 16:59:47', NULL),
(2896, '{\"top\":\"39.337881344527375\",\"left\":\"10\",\"width\":\"5.964912280701754\",\"height\":\"20.18654437416536\"}', 1250, 1, '2020-05-06 05:35:10', '2020-03-19 11:49:00', NULL),
(2895, '{\"top\":\"39.337881344527375\",\"left\":\"3.245614035087719\",\"width\":\"6.052631578947368\",\"height\":\"19.841475239564247\"}', 1, 1, '2020-05-06 05:35:10', '2020-03-02 16:58:25', NULL),
(2899, '{\"top\":\"39.165346777226816\",\"left\":\"29.473684210526315\",\"width\":\"5.964912280701754\",\"height\":\"20.35907894146592\"}', 2980, 1, '2020-05-06 05:35:10', '2020-03-19 12:03:13', NULL),
(2903, '{\"top\":\"38.99281220992626\",\"left\":\"55.26315789473684\",\"width\":\"6.315789473684211\",\"height\":\"20.35907894146592\"}', 5000, 1, '2020-05-06 05:35:10', '2020-03-19 12:51:57', NULL),
(2898, '{\"top\":\"39.165346777226816\",\"left\":\"22.894736842105264\",\"width\":\"6.228070175438597\",\"height\":\"20.18654437416536\"}', 2400, 1, '2020-05-06 05:35:10', '2020-03-19 15:48:38', NULL),
(2902, '{\"top\":\"38.99281220992626\",\"left\":\"48.771929824561404\",\"width\":\"6.315789473684211\",\"height\":\"20.18654437416536\"}', 3300, 1, '2020-05-06 05:35:10', '2020-03-19 12:22:57', NULL),
(2901, '{\"top\":\"39.165346777226816\",\"left\":\"42.280701754385966\",\"width\":\"6.315789473684211\",\"height\":\"20.18654437416536\"}', 1, 1, '2020-05-06 05:35:10', '2020-03-02 17:04:17', NULL),
(2900, '{\"top\":\"39.165346777226816\",\"left\":\"35.70175438596491\",\"width\":\"6.315789473684211\",\"height\":\"20.014009806864802\"}', 3800, 1, '2020-05-06 05:35:10', '2020-03-19 12:10:01', NULL),
(2908, '{\"top\":\"39.510415911827934\",\"left\":\"87.98245614035088\",\"width\":\"6.578947368421052\",\"height\":\"20.18654437416536\"}', 3700, 1, '2020-05-06 05:35:10', '2020-03-19 13:01:57', NULL),
(2907, '{\"top\":\"39.337881344527375\",\"left\":\"81.3157894736842\",\"width\":\"6.578947368421052\",\"height\":\"20.014009806864802\"}', 4700, 1, '2020-05-06 05:35:10', '2020-03-19 12:56:58', NULL),
(2906, '{\"top\":\"39.165346777226816\",\"left\":\"74.91228070175438\",\"width\":\"6.4035087719298245\",\"height\":\"20.35907894146592\"}', 3990, 1, '2020-05-06 05:35:10', '2020-03-19 12:54:40', NULL),
(2905, '{\"top\":\"39.165346777226816\",\"left\":\"68.33333333333333\",\"width\":\"6.4035087719298245\",\"height\":\"20.35907894146592\"}', 3400, 1, '2020-05-06 05:35:10', '2020-03-19 12:52:27', NULL),
(2904, '{\"top\":\"39.337881344527375\",\"left\":\"61.666666666666664\",\"width\":\"6.578947368421052\",\"height\":\"20.014009806864802\"}', 3500, 1, '2020-05-06 05:35:10', '2020-03-19 12:52:07', NULL),
(2912, '{\"top\":\"76.26027874684692\",\"left\":\"22.63157894736842\",\"width\":\"6.140350877192983\",\"height\":\"21.049217210668157\"}', 3200, 1, '2020-05-06 05:35:10', '2020-03-19 13:46:30', NULL),
(2909, '{\"top\":\"76.43281331414748\",\"left\":\"2.8947368421052633\",\"width\":\"6.228070175438597\",\"height\":\"20.70414807606704\"}', 3800, 1, '2020-05-06 05:35:10', '2020-03-19 13:09:03', NULL),
(2910, '{\"top\":\"76.7778824487486\",\"left\":\"9.298245614035087\",\"width\":\"6.4035087719298245\",\"height\":\"20.35907894146592\"}', 4700, 1, '2020-05-06 05:35:10', '2020-03-19 13:18:56', NULL),
(2911, '{\"top\":\"76.60534788144804\",\"left\":\"16.228070175438596\",\"width\":\"5.964912280701754\",\"height\":\"20.18654437416536\"}', 3250, 1, '2020-05-06 05:35:10', '2020-03-19 13:24:13', NULL),
(2914, '{\"top\":\"76.43281331414748\",\"left\":\"35.6140350877193\",\"width\":\"6.315789473684211\",\"height\":\"20.53161350876648\"}', 6400, 1, '2020-05-06 05:35:10', '2020-03-19 14:04:06', NULL),
(2913, '{\"top\":\"76.26027874684692\",\"left\":\"29.210526315789473\",\"width\":\"6.228070175438597\",\"height\":\"20.876682643367598\"}', 7000, 1, '2020-05-06 05:35:10', '2020-03-19 13:51:45', NULL),
(2915, '{\"top\":\"76.60534788144804\",\"left\":\"42.19298245614035\",\"width\":\"6.491228070175438\",\"height\":\"20.18654437416536\"}', 6400, 1, '2020-05-06 05:35:10', '2020-03-19 14:15:26', NULL),
(2916, '{\"top\":\"76.26027874684692\",\"left\":\"48.771929824561404\",\"width\":\"6.4035087719298245\",\"height\":\"21.221751777968713\"}', 6500, 1, '2020-05-06 05:35:10', '2020-03-19 14:23:06', NULL),
(2922, '{\"top\":\"76.95041701604916\",\"left\":\"88.24561403508773\",\"width\":\"6.666666666666667\",\"height\":\"20.876682643367598\"}', 1250, 1, '2020-05-06 05:35:10', '2020-03-19 15:29:23', NULL),
(2921, '{\"top\":\"76.60534788144804\",\"left\":\"81.75438596491227\",\"width\":\"6.491228070175438\",\"height\":\"21.049217210668157\"}', 6200, 1, '2020-05-06 05:35:10', '2020-03-19 15:22:08', NULL),
(2920, '{\"top\":\"76.60534788144804\",\"left\":\"75.08771929824562\",\"width\":\"6.578947368421052\",\"height\":\"21.049217210668157\"}', 1, 1, '2020-05-06 05:35:10', '2020-03-02 17:21:14', NULL),
(2919, '{\"top\":\"76.60534788144804\",\"left\":\"68.42105263157895\",\"width\":\"6.666666666666667\",\"height\":\"21.049217210668157\"}', 10200, 1, '2020-05-06 05:35:10', '2020-03-19 15:02:26', NULL),
(2917, '{\"top\":\"76.43281331414748\",\"left\":\"55.43859649122807\",\"width\":\"6.4035087719298245\",\"height\":\"21.049217210668157\"}', 10900, 1, '2020-05-06 05:35:10', '2020-03-19 14:46:34', NULL),
(2918, '{\"top\":\"76.43281331414748\",\"left\":\"61.92982456140351\",\"width\":\"6.491228070175438\",\"height\":\"21.049217210668157\"}', 8600, 1, '2020-05-06 05:35:10', '2020-03-19 14:52:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `title`, `description`) VALUES
(6043, 2882, 'hy', 'Երշիկ կիսաապխտած \'Բոյարական\" Աթենք', '<p style=\"text-align: center;\"><img src=\"https://www.atenk.am/resources/athenk/img/product/big/1439628655,1.jpeg\" /></p>'),
(6044, 2882, 'ru', 'Колбаса полукопченая \"Боярская\" Атенк', '<p style=\"text-align: center;\"><img src=\"https://www.atenk.am/resources/athenk/img/product/big/1439628655,1.jpeg\" /></p>'),
(6045, 2882, 'en', 'Smoked Sausage \"Boyarakan\" Atenq', '<p style=\"text-align: center;\"><img src=\"https://www.atenk.am/resources/athenk/img/product/big/1439628655,1.jpeg\" /></p>'),
(6048, 2883, 'en', 'Sausage \"Mairaqaghaqayin\" Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/%2C5%2Ct%2Ct%2Ct.jpg\" alt=\",5,t,t,t\" width=\"484\" height=\"276\" /></p>'),
(6049, 2883, 'ru', 'Колбаса  \"Столичная\" Атенк', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/%2C5%2Ct%2Ct%2Ct.jpg\" alt=\",5,t,t,t\" width=\"484\" height=\"276\" /></p>'),
(6052, 2881, 'ru', 'Колбаса полукопченая  \'Палермо\'  Атенк', NULL),
(6053, 2884, 'ru', 'Колбаса полукопченая \"Кремлевская \"  Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/jnfnhfnfnf.jpg\" alt=\"jnfnhfnfnf\" width=\"464\" height=\"264\" /></p>'),
(6055, 2881, 'en', 'Smoked Sausage\" Palermo\"   Atenq', NULL),
(6056, 2883, 'hy', 'Երշիկ  \"Մայրաքաղաքային\" Աթենք', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/%2C5%2Ct%2Ct%2Ct.jpg\" alt=\",5,t,t,t\" width=\"484\" height=\"276\" /></p>'),
(6057, 2881, 'hy', 'Երշիկ կիսաապխտած   Պալեռմո   Աթենք', NULL),
(6058, 2884, 'hy', 'Երշիկ կիսաապխտած \"Կրեմլյովսկի\"Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/jnfnhfnfnf.jpg\" alt=\"jnfnhfnfnf\" width=\"459\" height=\"261\" /></p>'),
(6059, 2884, 'en', 'Smoked Sausage \"Kremlyovski\" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/jnfnhfnfnf.jpg\" alt=\"jnfnhfnfnf\" width=\"464\" height=\"264\" /></p>'),
(6060, 2885, 'ru', 'Колбаса полукопченая \"Сервелат, в сетке\" Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/dddd.jpg\" alt=\"dddd\" /></p>'),
(6061, 2885, 'hy', 'Երշիկ կիսաապխտած\" Սերվելատ, ցանցում\" Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/dddd.jpg\" alt=\"dddd\" /></p>'),
(6062, 2886, 'en', 'Smoked Sausage \"Sapore \" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1469540086%2C0djdududu.png\" alt=\"1469540086,0djdududu\" width=\"513\" height=\"293\" /></p>'),
(6063, 2886, 'hy', 'Կիսաապխտած երշիկ \"Սապոռե\" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1469540086%2C0djdududu.png\" alt=\"1469540086,0djdududu\" width=\"485\" height=\"277\" /></p>'),
(6064, 2886, 'ru', 'Полукопченая колбаса \"Сапоре \" Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1469540086%2C0djdududu.png\" alt=\"1469540086,0djdududu\" width=\"471\" height=\"269\" /></p>'),
(6065, 2885, 'en', 'Smoked Sausage \'Servelat, in the grid \'  Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/dddd.jpg\" alt=\"dddd\" width=\"434\" height=\"248\" /></p>'),
(6066, 2887, 'hy', 'Երշիկ կիսաապխտած \"Սաբռոսո\" Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rhrrhj.jpg\" alt=\"rhrrhj\" width=\"474\" height=\"271\" /></p>'),
(6067, 2887, 'ru', 'Полукопченая колбаса \"Сабросо\" Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rhrrhj.jpg\" alt=\"rhrrhj\" width=\"471\" height=\"269\" /></p>'),
(6068, 2887, 'en', 'Smoked Sausage \"Sabroso \" Atenq,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rhrrhj.jpg\" alt=\"rhrrhj\" width=\"481\" height=\"275\" /></p>'),
(6069, 2888, 'hy', 'Կիսաապխտած երշիկ \"Իսպանական, կծու \" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/shshshsh.jpg\" alt=\"shshshsh\" width=\"457\" height=\"261\" /></p>'),
(6070, 2888, 'ru', 'Полукопченая колбаса \'Испанская, острая \' Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/shshshsh.jpg\" alt=\"shshshsh\" width=\"450\" height=\"257\" /></p>'),
(6071, 2889, 'en', 'Smoked Sausage \"Gyumri\",  Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/eijeej.jpg\" alt=\"eijeej\" /></p>'),
(6072, 2888, 'en', 'Smoked Sausage \"Ispanakan\" (Spanish), spicy  Atenq,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/shshshsh.jpg\" alt=\"shshshsh\" width=\"475\" height=\"271\" /></p>'),
(6073, 2889, 'hy', 'Երշիկ կիսաապխտած\" Գյումրի \" Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/eijeej.jpg\" alt=\"eijeej\" width=\"439\" height=\"250\" /></p>'),
(6075, 2889, 'ru', 'Колбаса полукопченая \"Гюмри\" Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/eijeej.jpg\" alt=\"eijeej\" />&nbsp;</p>'),
(6081, 2891, 'hy', 'Երշիկ հում ապխտած \"Պիկանտ\" Աթենք,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/14GRGRGRGR.jpg\" alt=\"14GRGRGRGR\" /></p>'),
(6082, 2891, 'ru', 'Колбаса сырокопченая \"Пикантная\" Атенк,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/14GRGRGRGR.jpg\" alt=\"14GRGRGRGR\" /></p>'),
(6083, 2891, 'en', 'Raw Smoked Sausage\" Piquant\" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/14GRGRGRGR.jpg\" alt=\"14GRGRGRGR\" /></p>'),
(6084, 2892, 'en', 'Smoked Sausage\" Salyami\" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/mtrmrmrmrm.jpg\" alt=\"mtrmrmrmrm\" /></p>'),
(6086, 2892, 'hy', 'Երշիկ կիսաապխտած \"Սալյամի\" Աթենք', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/mtrmrmrmrm.jpg\" alt=\"mtrmrmrmrm\" /></p>'),
(6087, 2892, 'ru', 'Колбаса полукопченая \"Салями\"  Атенк,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/mtrmrmrmrm.jpg\" alt=\"mtrmrmrmrm\" /></p>'),
(6089, 2893, 'ru', 'Полукопченая колбаса \"Ротонда\" Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rotonda.png\" alt=\"rotonda\" width=\"469\" height=\"268\" /></p>'),
(6090, 2893, 'hy', 'Կիսաապխտած երշիկ \"Ռոտոնդա\"Աթենք, ,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rotonda.png\" alt=\"rotonda\" width=\"525\" height=\"300\" /></p>'),
(6091, 2893, 'en', 'Smoked Sausage \"Rotonda\" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/rotonda.png\" alt=\"rotonda\" width=\"450\" height=\"257\" /></p>'),
(6093, 2894, 'hy', 'Երշիկ հում ապխտած \"Չորիզո\" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/chorrrr.jpg\" alt=\"chorrrr\" width=\"443\" height=\"253\" /></p>'),
(6094, 2894, 'ru', 'Колбаса сырокопченая \"Чоризо\" Атенк,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/chorrrr.jpg\" alt=\"chorrrr\" width=\"463\" height=\"264\" /></p>'),
(6095, 2894, 'en', 'Raw Smoked Sausage \"Chorizo \" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/chorrrr.jpg\" alt=\"chorrrr\" width=\"480\" height=\"274\" /></p>'),
(6096, 2895, 'hy', 'Երշիկ հում ապխտած \"Կոնյակով\" Աթենք,  (վակուումային փաթեթավորումով)', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/konyka.jpg\" alt=\"konyka\" /></p>'),
(6097, 2895, 'ru', 'Колбаса сырокопченая \"Коньячная\"  Атенк, (в вакуумной упаковке)', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/konyka.jpg\" alt=\"konyka\" /></p>'),
(6098, 2895, 'en', 'Raw Smoked Sausage \"Konyakov\" Atenq (vacuum packaging)', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/konyka.jpg\" alt=\"konyka\" /></p>'),
(6099, 2896, 'hy', 'Երշիկ հում ապխտած \"Պիկանտ \" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/pikant.jpg\" alt=\"pikant\" /></p>'),
(6100, 2896, 'ru', 'Колбаса сырокопченая \"Пикантная \" Атенк,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/pikant.jpg\" alt=\"pikant\" /></p>'),
(6101, 2896, 'en', 'Raw Smoked Sausage \"Piquant\" Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/pikant.jpg\" alt=\"pikant\" /></p>'),
(6102, 2897, 'hy', 'Երշիկ հում ապխտած\" Կոնյակով\" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/KONYAK2.jpg\" alt=\"KONYAK2\" /></p>'),
(6103, 2897, 'ru', 'Колбаса сырокопченая \"Коньячная\" Атенк', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/KONYAK2.jpg\" alt=\"KONYAK2\" /></p>'),
(6106, 2897, 'en', 'Raw Smoked Sausage\" Konyakov\"Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/KONYAK2.jpg\" alt=\"KONYAK2\" /></p>'),
(6108, 2899, 'hy', 'կիսաապխտած \"Ազդրի ապուխտ\" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/UUUURFHF.jpg\" alt=\"UUUURFHF\" /></p>'),
(6109, 2899, 'ru', 'Бедро, полукопченое  Атенк,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/UUUURFHF.jpg\" alt=\"UUUURFHF\" /></p>'),
(6110, 2899, 'en', 'Meat Delicacy Hip, smoked \"Atenq\"', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/UUUURFHF.jpg\" alt=\"UUUURFHF\" /></p>'),
(6111, 2900, 'hy', 'Ուտեստ կիսաապխտած \"Վզի միս \" Աթենք,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/jhuhuhuhu.jpg\" alt=\"jhuhuhuhu\" /></p>'),
(6112, 2900, 'ru', 'Шейка полукопченая. Атенк', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/jhuhuhuhu.jpg\" alt=\"jhuhuhuhu\" /></p>'),
(6113, 2900, 'en', 'Meat Delicacy Neck, smoked  Atenq,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/jhuhuhuhu.jpg\" alt=\"jhuhuhuhu\" /></p>'),
(6114, 2901, 'hy', 'Երշիկ կիսաապխտած \"Պռեզենտո\" Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/preaento.jpg\" alt=\"preaento\" width=\"438\" height=\"250\" /></p>'),
(6115, 2901, 'ru', 'Полукопченая колбаса\"Презенто \" Атенк,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/preaento.jpg\" alt=\"preaento\" width=\"438\" height=\"250\" /></p>'),
(6117, 2901, 'en', 'Semi-smoked \"Presento sausage\" Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/preaento.jpg\" alt=\"preaento\" width=\"462\" height=\"264\" /></p>'),
(6119, 2902, 'hy', 'Ուտեստ կիսաապխտած\"Պոռկետտա\",կրծքամիս  Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gdgdgdg.jpg\" alt=\"gdgdgdg\" width=\"459\" height=\"262\" /></p>'),
(6120, 2902, 'ru', 'Поркетта, грудинка полукопченая  Ганзасарский', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gdgdgdg.jpg\" alt=\"gdgdgdg\" width=\"466\" height=\"266\" /></p>'),
(6122, 2902, 'en', 'Meat Delicacy Porketta, Brisket, smoked Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gdgdgdg.jpg\" alt=\"gdgdgdg\" width=\"441\" height=\"252\" /></p>'),
(6126, 2903, 'hy', 'կիսաախած Ֆիլե  Աթենք,,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/JRJRJRNRN.jpg\" alt=\"JRJRJRNRN\" /></p>'),
(6127, 2903, 'ru', 'Филе полукопченое  Атенк,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/JRJRJRNRN.jpg\" alt=\"JRJRJRNRN\" /></p>'),
(6129, 2903, 'en', 'Meat Delicacy Fillet, smoked \"Atenq\"', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/JRJRJRNRN.jpg\" alt=\"JRJRJRNRN\" /></p>'),
(6130, 2904, 'hy', 'Ուտեստ կիսաապխտած Ֆիլե  Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gandzasar.jpg\" alt=\"gandzasar\" /></p>'),
(6131, 2904, 'ru', 'Филе, полукопченое, Ганзасарский', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/gandzasar.jpg\" alt=\"Гандзасар\" /></p>'),
(6133, 2904, 'en', 'Meat Delicacy Fillet, smoked Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gandzasar.jpg\" alt=\"gandzasar\" /></p>'),
(6135, 2905, 'hy', 'Ուտեստ կիսաապխտած Վզի միս  Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1447248847%2C19vizzzz.jpg\" alt=\"1447248847,19vizzzz\" width=\"441\" height=\"252\" /></p>'),
(6136, 2905, 'ru', 'Закуска полукопченая Шейка Ганзасарский', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1447248847%2C19vizzzz.jpg\" alt=\"1447248847,19vizzzz\" width=\"452\" height=\"258\" /></p>'),
(6138, 2905, 'en', 'Meat Delicacy Neck, smoked  Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1447248847%2C19vizzzz.jpg\" alt=\"1447248847,19vizzzz\" /></p>'),
(6139, 2906, 'hy', 'Ուտեստ կիսաապխած Ֆիլե Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/file%20atenq.jpg\" alt=\"file atenq\" width=\"473\" height=\"270\" /></p>'),
(6140, 2906, 'ru', 'Филе полукопченое Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/file%20atenq.jpg\" alt=\"файл atenq\" width=\"447\" height=\"255\" /></p>'),
(6141, 2907, 'hy', 'Ուտեստ կիսաապխտած Կրծքամիս, Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/krcq.jpg\" alt=\"krcq\" width=\"446\" height=\"254\" /></p>'),
(6142, 2907, 'ru', 'Грудинка полукопченая Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/krcq.jpg\" alt=\"krcq\" /></p>'),
(6143, 2907, 'en', 'Meat Delicacy Brisket, smoked   Atenq', '<p style=\"text-align: center;\">&nbsp;<img src=\"../../files/chocco/chipser/ershikner/krcq.jpg\" alt=\"krcq\" /></p>'),
(6145, 2908, 'hy', 'Ուտեստ կիսաապխտած Բեկոն  Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/bekon.jpg\" alt=\"bekon\" width=\"446\" height=\"255\" /></p>'),
(6147, 2908, 'ru', 'Бекон, полукопченый   Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/bekon.jpg\" alt=\"bekon\" /></p>'),
(6149, 2908, 'en', 'Meat Delicacy Bacon, smoked  Atenk', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/bekon.jpg\" alt=\"bekon\" /></p>'),
(6150, 2909, 'hy', 'Ուտեստ կիսաապխտած Կրծքամիս  Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gangggg.jpg\" alt=\"gangggg\" width=\"468\" height=\"267\" /></p>'),
(6151, 2909, 'ru', 'Грудинка, полукопченая  Ганзасарский', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gangggg.jpg\" alt=\"gangggg\" width=\"450\" height=\"257\" /></p>'),
(6153, 2909, 'en', 'Meat Delicacy Brisket, smoked  Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gangggg.jpg\" alt=\"gangggg\" width=\"474\" height=\"271\" /></p>'),
(6157, 2910, 'hy', 'Ուտեստ կիսաապխտած Ռուլետ, Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gygygygygygy.jpg\" alt=\"gygygygygygy\" width=\"452\" height=\"258\" /></p>'),
(6158, 2910, 'ru', 'Рулет полукопченый  Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gygygygygygy.jpg\" alt=\"gygygygygygy\" width=\"420\" height=\"240\" /></p>'),
(6159, 2910, 'en', 'Meat Delicacy Roll, smoked Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/gygygygygygy.jpg\" alt=\"gygygygygygy\" width=\"420\" height=\"240\" /></p>'),
(6160, 2911, 'hy', 'Ուտեստ կիսաապխտած Խոզապուխտ, տորթ  Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tort.jpg\" alt=\"tort\" width=\"436\" height=\"248\" /></p>'),
(6162, 2911, 'ru', 'Ветчина-торт, полукопченая  Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tort.jpg\" alt=\"tort\" width=\"431\" height=\"245\" /></p>'),
(6164, 2911, 'en', 'Meat Delicacy Ham-Cake, smoked  Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tort.jpg\" alt=\"tort\" /></p>'),
(6169, 2912, 'hy', 'Ուտեստ կիսաապխտած Հավի ռուլետ,  Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/havik.jpg\" alt=\"havik\" width=\"419\" height=\"239\" /></p>'),
(6177, 2912, 'ru', 'Рулет куриный, полукопченый   Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/havik.jpg\" alt=\"havik\" width=\"473\" height=\"270\" /></p>'),
(6178, 2912, 'en', 'Meat Delicacy Chicken Roll  Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/havik.jpg\" alt=\"havik\" width=\"453\" height=\"259\" /></p>'),
(6179, 2913, 'hy', 'Ուտեստ հում ապխտած Վզի միս, Աթենք,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/utututututut.jpg\" alt=\"utututututut\" width=\"446\" height=\"253\" /></p>'),
(6180, 2913, 'ru', 'Шейка сырокопченая  Атенк,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/utututututut.jpg\" alt=\"utututututut\" width=\"463\" height=\"263\" /></p>'),
(6181, 2913, 'en', 'Meat Delicacy Neck, Raw Smoked,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/utututututut.jpg\" alt=\"utututututut\" width=\"483\" height=\"274\" /></p>'),
(6183, 2914, 'hy', '\'Բեկոն\" հում ապխտած  Աթենք', NULL),
(6184, 2914, 'ru', '\"Бекон \" сырокопченый  Атенк', NULL),
(6185, 2914, 'en', '\"Bekon\" Raw Smoked  ATENQ', NULL),
(6186, 2915, 'hy', 'Ուտեստ հում ապխտած Ֆիլե  Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HFHFHFF.jpg\" alt=\"HFHFHFF\" width=\"454\" height=\"259\" /></p>'),
(6187, 2915, 'ru', 'Филе сырокопченое, Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HFHFHFF.jpg\" alt=\"HFHFHFF\" width=\"480\" height=\"274\" /></p>'),
(6188, 2915, 'en', 'Meat Delicacy Fillet, Raw Smoked  Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HFHFHFF.jpg\" alt=\"HFHFHFF\" width=\"452\" height=\"258\" /></p>'),
(6189, 2916, 'hy', 'տավարի  լեզու Աթենք', NULL),
(6190, 2916, 'ru', 'телячий язык     Атенк', NULL),
(6191, 2916, 'en', 'calf tongue  ATENQ', NULL),
(6199, 2917, 'ru', 'Закуска Бастурмы  с белой кожурой  Атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/spitak.jpg\" alt=\"spitak\" /></p>'),
(6200, 2917, 'hy', 'Ուտեստ Բաստուրմա սպիտակ կեղևով  Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/spitak.jpg\" alt=\"spitak\" width=\"490\" height=\"280\" /></p>'),
(6201, 2917, 'en', 'Meat Delicacy Batsourma with white rind   Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/spitak.jpg\" alt=\"spitak\" /></p>'),
(6203, 2918, 'hy', 'Ուտեստ Բաստուրմա   Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tftfgfgcc.jpg\" alt=\"tftfgfgcc\" width=\"448\" height=\"256\" /></p>'),
(6204, 2918, 'ru', 'Закуска Бастурмы Ганзасарский', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tftfgfgcc.jpg\" alt=\"tftfgfgcc\" width=\"462\" height=\"264\" /></p>'),
(6205, 2918, 'en', 'Meat delicacy Batsourma  Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/tftfgfgcc.jpg\" alt=\"tftfgfgcc\" width=\"440\" height=\"251\" /></p>'),
(6210, 2919, 'hy', 'Ուտեստ Բաստուրմա   Աթենք,,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/hfjfffh.jpg\" alt=\"hfjfffh\" /></p>'),
(6211, 2919, 'ru', 'Закуска Бастурмы Атенк', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/hfjfffh.jpg\" alt=\"hfjfffh\" /></p>'),
(6213, 2919, 'en', 'Meat Delicacy Batsourma  Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/hfjfffh.jpg\" alt=\"hfjfffh\" /></p>'),
(6214, 2920, 'hy', 'Ուտեստ Բաստուրմա, էկոնոմ  Գանձասար', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HHRHRHRHRHRH.jpg\" alt=\"HHRHRHRHRHRH\" width=\"485\" height=\"277\" /></p>'),
(6215, 2920, 'ru', 'Закуска Бастурма, эконом  Ганзасарский', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HHRHRHRHRHRH.jpg\" alt=\"HHRHRHRHRHRH\" width=\"457\" height=\"261\" /></p>'),
(6216, 2920, 'en', 'Meat delicacy Batsourma, economy  Gandzasar\'s', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/HHRHRHRHRHRH.jpg\" alt=\"HHRHRHRHRHRH\" width=\"457\" height=\"261\" /></p>'),
(6222, 2921, 'hy', 'Սուջուխ, հում ապխտած  Աթենք', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/1447SUJUX.jpg\" alt=\"1447SUJUX\" /></p>'),
(6224, 2921, 'ru', 'Суджух, сырокопченый  Атенк', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/1447SUJUX.jpg\" alt=\"1447SUJUX\" /></p>'),
(6225, 2921, 'en', 'Raw Smoked Sudjukh  Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/1447SUJUX.jpg\" alt=\"1447SUJUX\" /></p>'),
(6228, 2922, 'ru', 'Колбаса сырокопченая \"Ленинакан\"   атенк', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/leniniii.jpg\" alt=\"leniniii\" /></p>'),
(6229, 2922, 'hy', 'Երշիկ հում ապխտած \"Լենինական\"  Աթենք', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/leniniii.jpg\" alt=\"leniniii\" /></p>'),
(6230, 2922, 'en', 'Raw Smoked Sausage \'Leninakan\'  Atenq', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/leniniii.jpg\" alt=\"leniniii\" /></p>'),
(6235, 2890, 'hy', 'Երշիկ կիսաապխտած \"Մոսկովյան  \" Աթենք,', '<p style=\"text-align: center;\"><img src=\"../../files/chocco/chipser/ershikner/moskovyan.jpg\" alt=\"moskovyan\" width=\"469\" height=\"266\" /></p>'),
(6237, 2890, 'ru', 'Колбаса полукопченая \"московская\" Атенк,', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/moskovyan.jpg\" alt=\"moskovyan\" width=\"483\" height=\"274\" /></p>'),
(6238, 2890, 'en', 'Smoked Sausage \"Moskovian\", Atenq', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../files/chocco/chipser/ershikner/moskovyan.jpg\" alt=\"moskovyan\" width=\"483\" height=\"274\" /></p>'),
(6239, 2898, 'hy', 'Ուտեստ  կիսաապխտած  \" Պապրիկանա\" Աթենք', NULL),
(6241, 2898, 'ru', 'Полукопченая \"Паприкана\"    Атенк,,', NULL),
(6242, 2898, 'en', 'Meat Delicacy  \"Paprikana\"  Atenq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-11-04 04:49:18', '2019-11-04 04:49:18'),
(2, 'user', '2019-11-04 04:49:18', '2019-11-04 04:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `newemail` text COLLATE utf8_unicode_ci,
  `sitename_en` text COLLATE utf8_unicode_ci,
  `metatitle_en` text COLLATE utf8_unicode_ci,
  `metadescription_en` text COLLATE utf8_unicode_ci,
  `sitename_hy` text COLLATE utf8_unicode_ci,
  `metatitle_hy` text COLLATE utf8_unicode_ci,
  `metadescription_hy` text COLLATE utf8_unicode_ci,
  `sitename_ru` text COLLATE utf8_unicode_ci,
  `metatitle_ru` text COLLATE utf8_unicode_ci,
  `metadescription_ru` text COLLATE utf8_unicode_ci,
  `cartempty_hy` text COLLATE utf8_unicode_ci,
  `cartempty_ru` text COLLATE utf8_unicode_ci,
  `cartempty_en` text COLLATE utf8_unicode_ci,
  `ordertext_hy` text COLLATE utf8_unicode_ci,
  `ordertext_ru` text COLLATE utf8_unicode_ci,
  `ordertext_en` text COLLATE utf8_unicode_ci,
  `ordertextcompleted_hy` text COLLATE utf8_unicode_ci,
  `ordertextcompleted_ru` text COLLATE utf8_unicode_ci,
  `ordertextcompleted_en` text COLLATE utf8_unicode_ci,
  `registertext_hy` text COLLATE utf8_unicode_ci,
  `registertext_ru` text COLLATE utf8_unicode_ci,
  `registertext_en` text COLLATE utf8_unicode_ci,
  `registercompletedtext_hy` text COLLATE utf8_unicode_ci,
  `registercompletedtext_ru` text COLLATE utf8_unicode_ci,
  `registercompletedtext_en` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `email`, `newemail`, `sitename_en`, `metatitle_en`, `metadescription_en`, `sitename_hy`, `metatitle_hy`, `metadescription_hy`, `sitename_ru`, `metatitle_ru`, `metadescription_ru`, `cartempty_hy`, `cartempty_ru`, `cartempty_en`, `ordertext_hy`, `ordertext_ru`, `ordertext_en`, `ordertextcompleted_hy`, `ordertextcompleted_ru`, `ordertextcompleted_en`, `registertext_hy`, `registertext_ru`, `registertext_en`, `registercompletedtext_hy`, `registercompletedtext_ru`, `registercompletedtext_en`) VALUES
(1, '1582210369.png', '', '', 'ShopTop', 'sdfsdf', 'aaaaa', 'ՇոփԹոփ', 'ԹոփՇոփ', NULL, 'ШопТоп', 'ТопШоп', 'ТопШоп', NULL, NULL, 'Cart is empty', 'Մուտքագրեք Ձեր հեռախոսահամարը', 'Введите Ваш номер телефона', 'Please enter Your phone number', 'Շնորհակալություն  պատվերի համար։  Մենք շուտով կզանգահարենք։', 'Спасибо за ваш заказ. Мы скоро вам позвоним.', 'Thank you for your order. We will call you soon.', NULL, NULL, 'Please seleted', NULL, NULL, 'Register completed text');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD KEY `boards_author_id_foreign` (`author_id`),
  ADD KEY `boards_last_editor_id_foreign` (`last_editor_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_board_id_foreign` (`board_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  ADD KEY `product_translations_locale_index` (`locale`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--


--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4833;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6243;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
