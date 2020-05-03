-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 01:45 PM
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
-- Database: `shoptop_gago`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `boards` (`id`, `image`, `preview`, `author_id`, `last_editor_id`, `category_id`, `sorting`, `created_at`, `updated_at`, `name_hy`, `metatitle_hy`, `metadescription_hy`, `name_en`, `metatitle_en`, `metadescription_en`, `name_ru`, `metatitle_ru`, `metadescription_ru`, `publish`) VALUES
(175, '1584432401.jpg', 'preview_1584432401.jpg', 1, NULL, 45, 35, '2020-03-01 15:01:10', '2020-03-01 15:01:20', 'Մսամթերք', NULL, NULL, 'Meat Products', NULL, NULL, 'Мясные продукты', NULL, NULL, 1);

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
(1, '1582210369.png', 'davidausar@gmail.com', 'davidausar@gmail.com', 'ShopTop', 'sdfsdf', 'aaaaa', 'ՇոփԹոփ', 'ԹոփՇոփ', NULL, 'ШопТоп', 'ТопШоп', 'ТопШоп', NULL, NULL, 'Cart is empty', 'Մուտքագրեք Ձեր հեռախոսահամարը', 'Введите Ваш номер телефона', 'Please enter Your phone number', 'Շնորհակալություն  պատվերի համար։  Մենք շուտով կզանգահարենք։', 'Спасибо за ваш заказ. Мы скоро вам позвоним.', 'Thank you for your order. We will call you soon.', NULL, NULL, 'Please seleted', NULL, NULL, 'Register completed text');

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
  ADD PRIMARY KEY (`id`),
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
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
