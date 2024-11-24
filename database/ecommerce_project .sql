-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 07:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `country`, `state`, `zip`, `address`, `isdefault`, `created_at`, `updated_at`) VALUES
(1, 3, 'Rakib Hossen', '01975539231', 'Bangladesh', 'chittagong', '4000', 'chittagong', 1, '2024-11-24 11:12:05', '2024-11-24 11:12:05'),
(2, 4, 'Sazzad', '01234567891', 'Bangladesh', 'chittagong', '4000', 'chittagong', 1, '2024-11-24 11:29:56', '2024-11-24 11:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Lenovo', 'lenovo', '1731944337.webp', '2024-11-18 09:38:58', '2024-11-18 09:38:58'),
(2, 'HP', 'hp', '1731948014.webp', '2024-11-18 10:40:14', '2024-11-18 10:40:14'),
(3, 'Asus', 'asus', '1731948313.webp', '2024-11-18 10:45:13', '2024-11-18 10:45:13'),
(6, 'Wintech', 'wintech', '1732027456.webp', '2024-11-19 08:44:16', '2024-11-19 08:44:16'),
(7, 'Intel', 'intel', '1732027865.webp', '2024-11-19 08:51:05', '2024-11-19 08:51:05'),
(8, 'AMD Ryzen', 'amd-ryzen', '1732027931.webp', '2024-11-19 08:52:11', '2024-11-19 08:52:11'),
(11, 'Digital X', 'digital-x', '1732030185.jpg', '2024-11-19 09:29:45', '2024-11-19 09:29:45'),
(12, 'Power Guard', 'power-guard', '1732030226.webp', '2024-11-19 09:30:26', '2024-11-19 09:30:26'),
(14, 'Epson', 'epson', '1732031143.jpg', '2024-11-19 09:45:43', '2024-11-20 06:19:59'),
(15, 'Dahua', 'dahua', '1732032756.webp', '2024-11-19 10:12:36', '2024-11-20 06:19:43'),
(16, 'Hikvision', 'hikvision', '1732032799.webp', '2024-11-19 10:13:19', '2024-11-20 06:19:12'),
(18, 'Samsung', 'samsung', '1732033524.webp', '2024-11-19 10:25:24', '2024-11-20 06:19:31'),
(19, 'Xiaomi', 'xiaomi', '1732033558.webp', '2024-11-19 10:25:58', '2024-11-20 06:17:59'),
(20, 'Amazon', 'amazon', '1732034261.webp', '2024-11-19 10:37:41', '2024-11-20 06:17:48'),
(21, 'Sony', 'sony', '1732034312.webp', '2024-11-19 10:38:32', '2024-11-20 06:17:37'),
(22, 'HUAWEI', 'huawei', '1732378415.webp', '2024-11-23 10:13:35', '2024-11-23 10:13:35'),
(23, 'Apple', 'apple', '1732378454.webp', '2024-11-23 10:14:14', '2024-11-23 10:14:14'),
(24, 'Yison Celebrat', 'yison-celebrat', '1732379735.webp', '2024-11-23 10:35:35', '2024-11-23 10:35:35'),
(25, 'Casio', 'casio', '1732458862.webp', '2024-11-24 08:34:22', '2024-11-24 08:34:22'),
(26, 'Awei', 'awei', '1732459192.webp', '2024-11-24 08:39:52', '2024-11-24 08:39:52'),
(27, 'Hoco', 'hoco', '1732459221.webp', '2024-11-24 08:40:21', '2024-11-24 08:40:21'),
(28, 'A9002', 'a9002', '1732460093.webp', '2024-11-24 08:54:53', '2024-11-24 08:54:53'),
(29, 'HJ78 RC', 'hj78-rc', '1732460162.webp', '2024-11-24 08:56:02', '2024-11-24 08:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'laptop', '1731944175.jpg', NULL, '2024-11-18 09:36:18', '2024-11-18 09:36:18'),
(2, 'Monitor', 'monitor', '1731948688.webp', NULL, '2024-11-18 10:51:29', '2024-11-18 10:51:29'),
(4, 'Desktop', 'desktop', '1732027813.webp', NULL, '2024-11-19 08:50:13', '2024-11-19 08:50:13'),
(5, 'UPS', 'ups', '1732030169.webp', NULL, '2024-11-19 09:29:30', '2024-11-19 09:29:30'),
(6, 'Printer', 'printer', '1732031055.webp', NULL, '2024-11-19 09:44:15', '2024-11-19 09:44:15'),
(7, 'Camera', 'camera', '1732032678.webp', NULL, '2024-11-19 10:11:18', '2024-11-19 10:11:18'),
(8, 'Tablet Pc', 'tablet-pc', '1732033446.webp', NULL, '2024-11-19 10:24:06', '2024-11-19 10:24:06'),
(9, 'Speaker', 'speaker', '1732034224.webp', NULL, '2024-11-19 10:37:04', '2024-11-19 10:37:04'),
(10, 'Watch', 'watch', '1732378379.webp', NULL, '2024-11-23 10:12:59', '2024-11-23 10:12:59'),
(11, 'Earphone', 'earphone', '1732379094.webp', NULL, '2024-11-23 10:24:54', '2024-11-23 10:24:54'),
(13, 'Calculator', 'calculator', '1732458805.webp', NULL, '2024-11-24 08:33:25', '2024-11-24 08:33:25'),
(14, 'Power Bank', 'power-bank', '1732459161.webp', NULL, '2024-11-24 08:39:22', '2024-11-24 08:39:22'),
(15, 'Wireless Earbuds', 'wireless-earbuds', '1732459671.webp', NULL, '2024-11-24 08:47:51', '2024-11-24 08:47:51'),
(16, 'Toy Drone', 'toy-drone', '1732460000.webp', NULL, '2024-11-24 08:53:20', '2024-11-24 08:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `expiry_date`, `created_at`, `updated_at`) VALUES
(1, 'WNR11', 'fixed', 500.00, 2.00, '2025-02-01', '2024-11-24 08:11:53', '2024-11-24 08:11:53'),
(2, 'WNR10', 'percent', 500.00, 2.00, '2025-02-01', '2024-11-24 08:12:36', '2024-11-24 08:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(24, '0001_01_01_000000_create_users_table', 1),
(25, '0001_01_01_000001_create_cache_table', 1),
(26, '0001_01_01_000002_create_jobs_table', 1),
(27, '2024_10_28_162026_create_brands_table', 1),
(28, '2024_10_31_162644_create_categories_table', 1),
(29, '2024_11_02_165329_create_products_table', 1),
(30, '2024_11_13_141334_create_coupons_table', 1),
(31, '2024_11_14_125130_create_orders_table', 1),
(32, '2024_11_14_125200_create_order_items_table', 1),
(33, '2024_11_14_125242_create_addresses_table', 1),
(34, '2024_11_14_125338_create_transactions_table', 1),
(35, '2024_11_15_144017_create_slides_table', 1),
(36, '2024_11_15_193839_create_month_names_table', 1),
(37, '2024_11_16_110555_create_contacts_table', 1),
(38, '2024_11_21_125837_create_reviews_table', 2),
(39, '2024_11_24_170435_create_addresses_table', 3),
(40, '2024_11_24_170503_create_transaction_table', 3),
(41, '2024_11_24_171601_create_transactions_table', 4),
(42, '2024_11_24_171649_create_transactions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `month_names`
--

CREATE TABLE `month_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `month_names`
--

INSERT INTO `month_names` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `status`, `is_shipping_different`, `delivered_date`, `canceled_date`, `created_at`, `updated_at`) VALUES
(12, 3, 36500.00, 0.00, 7665.00, 44165.00, 'Rakib Hossen', '01975539231', 'chittagong', 'chittagong', 'chittagong', 'chittagong', 'Bangladesh', 'chittagong', '4000', 'home', 'ordered', 0, NULL, NULL, '2024-11-24 12:04:25', '2024-11-24 12:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `options` longtext DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `options`, `rstatus`, `created_at`, `updated_at`) VALUES
(12, 1, 12, 36500.00, 1, NULL, 0, '2024-11-24 12:04:25', '2024-11-24 12:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` bigint(20) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Lenovo IdeaPad Slim 1i 14IGL7 Intel CDC N4020 8GB RAM, 256GB SSD 14 Inch FHD Display Cloud Grey Laptop', 'lenovo-ideapad-slim-1i-14igl7-intel-cdc-n4020-8gb-ram-256gb-ssd-14-inch-fhd-display-cloud-grey-laptop', 'Processor Type. - Intel Celeron\r\nGeneration - Celeron Series\r\nRAM - 8GB\r\nStorage - 256GB SSD\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 14', 'IdeaPad Slim 1i - Unmatched efficiency. Unmatched fun.\r\nRaise the bar on what to expect from an affordable laptop with the IdeaPad 1i (14, Intel). Browse, explore, and connect with confidence on reliable Intel Celeron processors and workflow-improving smart features. And with a remarkably thin design and fun color options that compliment your personal style, this device is a highly mobile digital companion.\r\nEverything you need, anywhere you need it\r\nThe IdeaPad 1i (14\" Intel) is exactly what you need in an everyday use laptop. Watch shows on an up to 14\" FHD display with a razor-thin frame.', 39600.00, 36500.00, 'LP-1', 'instock', 1, 3, '1731945656.webp', '1731945656-1.webp,1731945656-2.webp,1731945656-3.webp,1731945656-4.webp', 1, 1, '2024-11-18 10:00:58', '2024-11-18 10:00:58'),
(11, 'Wintech Pro Box V2 BK Mini Tower Desktop Casing', 'wintech-pro-box-v2-bk-mini-tower-desktop-casing', 'Case Type - Mini Tower\r\nOptical Drive Bay - No\r\nCooling Fan (Built-In) - No\r\nLighting Fan - LED\r\nPower Supply (Built-In) - No\r\nBack-Connect Supported - No', 'Case Type - Mini Tower\r\nOptical Drive Bay - No\r\nCooling Fan (Built-In) - No\r\nLighting Fan - LED\r\nPower Supply (Built-In) - No\r\nBack-Connect Supported - No', 1100.00, 1000.00, 'C-W', 'instock', 0, 2, '1732027714.webp', '1732027714-1.webp,1732027714-2.webp,1732027714-3.webp', 4, 6, '2024-11-19 08:48:35', '2024-11-19 09:11:13'),
(12, 'Intel 12th Gen Core i5-12400 Budget Desktop PC', 'intel-12th-gen-core-i5-12400-budget-desktop-pc', 'Model: 12th Gen Desktop PC\r\nIntel 12th Gen Core i5-12400 Alder Lake Processor\r\nMSI PRO H610M-E DDR4 mATX Motherboard\r\nHP V6 8GB 3200MHz DDR4 Desktop RAM\r\nTeam MP33 256GB M.2 PCIe SSD', 'Intel 12th Gen Core i5-12400 Budget Desktop PC\r\nThe Intel 12th Gen Core i5-12400 Budget Desktop PC is a powerful and cost-effective solution for those seeking a balance between performance and affordability. Ideal for everyday computing tasks, gaming, and content creation, this desktop configuration offers reliable performance with its latest-generation components. The Intel 12th Gen Core i5-12400 Alder Lake Processor powers the system, which features 6 cores and 12 threads, a base clock speed of 2.5 GHz, and a max turbo frequency of 4.4 GHz. The processor’s hybrid architecture combines high-performance and high-efficiency cores, providing an 18MB Intel Smart Cache and a thermal design power (TDP) of 65W. Supporting the processor is the MSI PRO H610M-E DDR4 mATX Motherboard, a compact micro ATX board featuring the Intel H610 chipset. It supports DDR4 memory up to 3200MHz, offers multiple expansion slots, and provides various storage options including 4 SATA 6Gb/s ports and an M.2 slot. Connectivity options include USB 3.2 Gen 1 and USB 2.0 ports and Gigabit LAN and Realtek ALC897 audio. The system includes 8GB of HP V6 3200MHz DDR4 RAM, ensuring smooth multitasking and efficient performance. Storage is handled by the Team MP33 256GB M.2 PCIe SSD, offering fast read and write speeds of up to 1700 MB/s and 1400 MB/s, respectively. The Antec META V350 350W Power Supply ensures stable and efficient power delivery, boasting 80 Plus certification and multiple protection features. All these components are housed in the Antec AX61 ELITE Mid-Tower ATX Gaming Case, which offers a compact yet spacious design with excellent cooling capabilities through its included 3 x 120mm fans. The case also features multiple drive bays and front I/O ports for easy access. This budget-friendly desktop PC is built to easily handle a wide range of tasks, from basic computing to more demanding applications. Its components ensure a smooth and responsive experience, making it a great choice for users looking for value without sacrificing performance.', 3000.00, 2900.00, 'D-P', 'instock', 1, 2, '1732028181.webp', '1732028181-1.webp,1732028181-2.webp', 4, 7, '2024-11-19 08:56:21', '2024-11-19 09:04:32'),
(13, 'AMD Ryzen 7 5700G Custom Desktop PC', 'amd-ryzen-7-5700g-custom-desktop-pc', 'Model: Ryzen 7 5700G Custom Desktop PC\r\nAMD Ryzen 7 5700G Processor with Radeon Graphics\r\nMSI A520M-A Pro AM4 AMD Micro-ATX Motherboard\r\nCorsair Vengeance LPX 8GB 3200MHz DDR4 Desktop RAM\r\nTeam MP33 256GB M.2 PCIe SSD', 'The AMD Ryzen 7 5700G Custom Desktop PC is a powerful and versatile computer that is capable of gaming, productivity, and entertainment. It has an AMD Ryzen 7 5700G Processor with Radeon Graphics, which is an 8-core, 16-thread CPU with integrated graphics and overclocking capability. The MSI A520M-A Pro AM4 AMD Micro-ATX Motherboard features a clean and beautiful design and supports the newest AMD AM4 CPUs. The 8GB of Corsair Vengeance LPX DDR4 RAM with the Team MP33 256GB M.2 PCIe SSD delivers quick and smooth performance for your system. The Value-Top VT-G651A ATX Gaming Casing offers a sleek design and a transparent side panel that shows off your components. The AMD Ryzen 7 5700G Custom Desktop PC is an excellent choice for anybody looking for a powerful and versatile PC that can tackle any work or game.', 37670.00, 34250.00, 'D-C', 'instock', 0, 1, '1732028281.webp', '1732028281-1.webp,1732028281-2.webp', 4, 8, '2024-11-19 08:58:02', '2024-11-19 09:03:34'),
(18, 'Digital X 650VA Offline UPS', 'digital-x-650va-offline-ups', 'Model: Digital X 650VA\r\nLow voltage input\r\nCapacity: 650VA\r\nLoad Capacity: 360W\r\nFrequency: 50 - 60Hz', 'Digital X 650VA Offline UPS\r\nDigital X 650VA Offline UPS will stabilize the AC signal and maintain the safe voltage without having to resort to the battery power. Provides notification of changing utility power and UPS power conditions. This UPS has Low voltage input with 360W load capacity, 85 - 135V Input Voltage Range, 100 - 220V Output Voltage, 50 - 60Hz frequency and 1 pcs, 12V, 7AH battery.When power goes out for even a second it can result in data loss and hardware damage which can shorten equipment life expectancy. This Digital X UPS battery backup unit provides sufficient emergency run time power to allow for safe closure of open files and proper shutdown of electronics when an outage occurs. This UPS occurring power surges caused by storms, activity on the power grid, or high-powered equipment turning on and off. The Digital 650VA is offline type UPS which provides backup power and surge protection for small office computers and home, and also compatible with wired and wireless network router or modems. This UPS provides 01 year warranty.', 3300.00, 3050.00, 'U-D', 'instock', 1, 3, '1732030375.jpg', '1732030375-1.jpg,1732030375-2.webp', 5, 11, '2024-11-19 09:32:56', '2024-11-19 09:36:57'),
(19, 'Power Guard ECO-430-PRO 8000mAh Mini DC UPS for Router', 'power-guard-eco-430-pro-8000mah-mini-dc-ups-for-router', 'Type - Mini UPS\r\nInput Voltage (V) - 100 - 240V\r\nOutput Voltage (V) - USB: 5V DC, DC: 9V DC/12V DC, POE: 15V DC/24V DC\r\nLoad Capacity - Unmentioned\r\nBack up time(Full load) - 4-8 Hours\r\nBody Material - Unmentioned', 'Application: WiFi routers, traditional routers, ONU/MCs, IP cams/CC cams, door locks, fingerprint scanners, mobile phones, and tablets.\r\nHigh-capacity lithium batteries provide long backups to the loads.\r\nHigh compatibility, suitable for most digital products in the market.\r\nPOE can transmit power and simplify wiring.\r\nUSB output (5V), can supply charging for digital products like mobile phones, PDAs, PSPs, iPods, MP4 etc.\r\nIntelligent circuit design with over-charging, over-discharging, and short circuit protection.\r\nThe built-in adapter allows a wide AC voltage range (85-265Vac).', 3300.00, 3050.00, 'U-P', 'instock', 0, 2, '1732030533.webp', '1732030533-1.webp,1732030533-2.webp,1732030533-3.webp', 5, 12, '2024-11-19 09:35:34', '2024-11-19 09:35:34'),
(20, 'Power Guard PG650VA-PS 650VA Offline UPS with Metal Body', 'power-guard-pg650va-ps-650va-offline-ups-with-metal-body', 'Type - Offline UPS\r\nInput Voltage (V) - 145-280V\r\nOutput Voltage (V) - 220-230 VAC +/-10%\r\nLoad Capacity - 390W\r\nBack up time - Up to 15 Minutes\r\nBody Material - Metal', 'Features of Power Guard PG650VA-PS 650VA UPS In Bangladesh\r\nBrand - Power Guard, Model - Power Guard PG650VA-PS 650VA, Type - Offline UPS, Volt Ampere (VA) - 650V, Input Voltage (V) - 145-280 VAC, Output Voltage (V) - 220-230 VAC +/-10%, Frequency (Hz) - 50-60Hz +/-5%, Load Capacity (Watt) - 390 W, Transfer Rate (ms) - 2-6ms Typical, LED Display - Yes, Battery(Qty with V & A) - 1 pc with 12V & 8.2Ah, Back up time - Up to 15 Minutes, Fuse - Yes, Stabilizer (Built In) - Yes, Cable Length (Meter) - 0.86 Meter, Output connection (Back side) - 2 Port, Body Materials - Metal, Dimension - 81.28 x 304.8 x 139.7 mm, Net Weight(kg) - 5.5 Kg, Others - Sinewave: Simulated Sinewave, Metal Body, Specialty - Automatic voltage ragulation (AVR) High/Low Voltage Protection Overload/Short Protection Cool start computer even there is no main power Automatic recharge even UPS is off Beeping Alarm Frequency Selection Automatically Intelligent Battery Management Compatibility with generators., Warranty - 01 Year Battery & 02 Years Service with Spare Parts (Box Mandatory While Claiming), Country of Origin - China, Made in/ Assemble - China', 5370.00, 3050.00, 'P-U', 'instock', 0, 1, '1732030783.webp', '1732030783-1.webp,1732030783-2.webp,1732030783-3.webp', 5, 12, '2024-11-19 09:39:44', '2024-11-19 09:39:44'),
(21, 'Digital X MP910S 1000VA Online UPS', 'digital-x-mp910s-1000va-online-ups', 'Type - Online UPS\r\nInput Voltage (V) - 110V - 300V\r\nLoad Capacity - 800W\r\nBack up time(Full load) - Up to 15 Minute\r\nBody Material - Unmentioned', 'Features of Digital X MP910S 1000VA UPS In Bangladesh\r\nBrand - Digital X, Model - Digital X MP910S 1000VA, Type - Online UPS, Volt Ampere (VA) - 1000V, Input Voltage (V) - 110V - 300V, Load Capacity (Watt) - 800W, LED Display - Yes, Battery(Qty with V & A) - 3 pcs, 12V, 7Ah, Back up time(Full load) - Up to 15 Minute, Output connection (Back side) - 2 Port, Net Weight(kg) - 9Kg, Others - 1 KVA output power for higher operations, Single phase with grounding, High capacity, Low voltage operating range, High efficiency, Overload capability, High temperature with lowest noise, 2 universal scoket., Specialty - High frequency and double conversion on-line technology, Digitized microprocessor control optimizes reliability, Lightning & Surge protection, Short circuit and overload protection, Advanced battery management, Warranty - 1 Year (Box Mandatory While Claiming), Country of Origin - China, Made in/ Assemble - China', 18550.00, 17200.00, 'U-P', 'instock', 0, 2, '1732030961.webp', '1732030961-1.webp,1732030961-2.webp,1732030961-3.webp', 5, 11, '2024-11-19 09:42:42', '2024-11-19 09:42:42'),
(24, 'Epson EcoTank Monochrome M1120 Wi-Fi InkTank Printer #C11CG96501', 'epson-ecotank-monochrome-m1120-wi-fi-inktank-printer-c11cg96501', 'Functions - Print Only\r\nOutput Color - Black & White\r\nPrint Speed (Black) - 15ipm(ISO) (A4), 32ppm(Draft) (A4)\r\nPrint Paper Size Max. - Legal\r\nInterface (Built-in) - USB, WiFi', 'Efficiency meets economy with the EcoTank monochrome M1120 printer. Look forward to lower business costs with bottles that provide an ultra-high page yield of up to 6,000 pages (at 12 paise per print cost)4 . Simplify processes with the integrated ink tank that enables spill- and error-free ink refilling, and enjoy laser-quality text that is smudge-proof and water-resistant with the pigment ink. The M1120 brings convenient printing with wireless connectivity.\r\n\r\n12 paise cost per print (CPP)\r\nCompact integrated tank design\r\nHigh-yield pigment ink bottle\r\nSpill-free, error-free refilling\r\nWi-Fi, Wi-Fi Direct\r\nEpson Connect', 19210.00, 18000.00, 'P-E', 'instock', 1, 4, '1732032598.webp', '1732032598-1.webp,1732032598-2.webp,1732032598-3.webp', 6, 14, '2024-11-19 10:09:59', '2024-11-19 10:09:59'),
(25, 'Hikvision DS-2CE16D0T-EXIPF (3.6mm) (2.0MP) Bullet CC Camera', 'hikvision-ds-2ce16d0t-exipf-36mm-20mp-bullet-cc-camera', 'Usage - Outdoor\r\nForm-Factor - Bullet\r\nMega Pixels (MP) - 2.0\r\nNight Vision Mode - Black and White\r\nIR Range - 20 Meter', 'The Hikvision DS-2CE16D0T-EXIPF is a 2-megapixel, bullet-style security camera with a 3.6mm lens. This resolution translates to 1920 x 1080 pixels, also known as 1080p high definition. The 3.6mm lens offers a moderate field of view, which is ideal for capturing footage in most doorways, hallways, and smaller rooms. Night vision is another key feature of the DS-2CE16D0T-EXIPF. The camera uses infrared (IR) illumination to provide clear images even in low-light conditions. The IR illuminators can typically reach distances of up to 20 meters (65 feet) depending on the environment.', 1210.00, 1100.00, 'C-H', 'instock', 1, 3, '1732032939.webp', '1732032939-1.webp,1732032939-2.webp,1732032939-3.webp', 7, 16, '2024-11-19 10:15:40', '2024-11-19 10:15:40'),
(26, 'HikVision DS-2CE16F1T-IT (3.0MP) Bullet CC Camera', 'hikvision-ds-2ce16f1t-it-30mp-bullet-cc-camera', 'Usage - Outdoor\r\nForm-Factor - Bullet\r\nMega Pixels (MP) - 3.0\r\nNight Vision Mode - Black and White\r\nIR Range - 20 Meter', '3 Megapixel high-performance CMOS\r\nAnalog HD output, up to 3MP resolution\r\nTrue Day/Night\r\nOSD menu, DNR, Smart IR\r\nEXIR technology, up to 20m IR distance \r\nIP66 weatherproof', 3190.00, 2900.00, 'C-HS', 'instock', 0, 2, '1732033082.webp', '1732033082-1.webp,1732033082-2.webp,1732033082-3.webp', 7, 16, '2024-11-19 10:18:03', '2024-11-19 10:18:03'),
(27, 'Dahua DH-HAC-T1A21P (2.8mm) (2MP) Dome CC Camera', 'dahua-dh-hac-t1a21p-28mm-2mp-dome-cc-camera', 'Usage - Indoor\r\nForm-Factor - Dome\r\nMega Pixels (MP) - 2.0\r\nNight Vision Mode - Color\r\nIR Range - 20 Meter', 'High-Resolution Imaging: The Dahua DH-HAC-T1A21P offers a 2MP resolution, delivering clear and detailed video footage.\r\nNight Vision: Equipped with infrared technology, this 2MP Dome Camera captures clear images even in low-light conditions.\r\nDurable Design: The Dahua Dome Camera is built to withstand various weather conditions, making it ideal for both indoor and outdoor use.\r\nEasy Installation: This camera is simple to install, with user-friendly instructions included.\r\nCompact and Discreet: Its dome shape allows it to blend into its surroundings, making it less noticeable.\r\nWide-Angle Lens: The 2.8mm lens provides a broad field of view, ensuring maximum coverage.\r\nReliable Performance: The Dahua DH-HAC-T1A21P is known for its consistent performance, providing peace of mind.\r\nAffordable Security Solution: It’s an excellent choice for those seeking a cost-effective surveillance option.\r\nAdvanced Motion Detection: The camera features motion detection, alerting you to any unusual activity.\r\nVersatile Application: Suitable for both residential and commercial properties.', 1790.00, 1650.00, 'C-D', 'instock', 1, 2, '1732033231.webp', '1732033231-1.webp,1732033231-2.webp,1732033231-3.webp', 7, 15, '2024-11-19 10:20:32', '2024-11-19 11:03:19'),
(28, 'Xiaomi Pad 6 (Wifi) Snapdragon 870 Octa-core Processor 8GB RAM 11 Inch WQHD+ Display Mist Blue Tablet', 'xiaomi-pad-6-wifi-snapdragon-870-octa-core-processor-8gb-ram-11-inch-wqhd-display-mist-blue-tablet', 'Processor Model - Snapdragon 870 Octa-core\r\nDisplay Size (Inch) - 11\r\nRAM - 8GB\r\nStorage - 128GB\r\nFront Camera - 8MP\r\nBack/Rear Camera - 13MP\r\nBattery. - 8840 mAh', 'Xiaomi Redmi Pad 6 (Wifi) is a mid-range tablet that offers impressive performance and features at an affordable price point. Powered by the Snapdragon 870 Octa-core processor and 8GB of RAM, this tablet delivers smooth multitasking and handles demanding tasks with ease. Its large 11-inch WQHD+ display provides vibrant visuals and ample screen real estate for entertainment and productivity.', 45030.00, 42000.00, 'T-S', 'instock', 1, 5, '1732033702.webp', '1732033702-1.webp,1732033702-2.webp,1732033702-3.webp', 8, 19, '2024-11-19 10:28:23', '2024-11-19 10:28:23'),
(29, 'Xiaomi Redmi Pad Pro (Wifi) Snapdragon 7s Gen 2 Octa-core Processor 8GB RAM 12.1 Inch 2K Display Graphite Gray Tablet', 'xiaomi-redmi-pad-pro-wifi-snapdragon-7s-gen-2-octa-core-processor-8gb-ram-121-inch-2k-display-graphite-gray-tablet', 'Processor Model - Snapdragon 7s Gen 2 Octa-core\r\nDisplay Size (Inch) - 12.1\r\nRAM - 8GB\r\nStorage - 256GB\r\nFront Camera - 8MP\r\nBack/Rear Camera - 8MP\r\nBattery. - 10000mAh', 'The Xiaomi Redmi Pad Pro (Wifi) Snapdragon 7s Tablet is a cutting-edge device that combines powerful performance. Powered by the Qualcomm Snapdragon 7s chipset, this tablet offers smooth multitasking and efficient processing for various applications. Its vibrant display delivers stunning visuals, making it perfect for multimedia consumption and productivity tasks. With its Wi-Fi capabilities, users can stay connected and access online content perfectly. The tablet\'s slim profile and lightweight build ensure portability, while its long-lasting battery life keeps you powered throughout the day. Xiaomi has integrated their intuitive MIUI interface, optimized for tablet use that provides a user-friendly experience enhanced by AI-driven features and customization options.', 46440.00, 43000.00, 'T-XM', 'instock', 1, 3, '1732033824.webp', '1732033824-1.webp,1732033824-2.webp,1732033824-3.webp,1732033824-4.webp', 8, 19, '2024-11-19 10:30:25', '2024-11-19 11:02:53'),
(30, 'Samsung Galaxy Tab A7 Lite (Wi-Fi) Mediatek MT8768T Helio P22T Octa-core Processor 4GB RAM 8.7 Inch Silver Tablet', 'samsung-galaxy-tab-a7-lite-wi-fi-mediatek-mt8768t-helio-p22t-octa-core-processor-4gb-ram-87-inch-silver-tablet', 'Processor Model - Mediatek MT8768T Helio P22T Octa-core Processor\r\nDisplay Size (Inch) - 8.7\r\nRAM - 4GB\r\nStorage - 64GB\r\nFront Camera - 2MP\r\nBack/Rear Camera - 8MP\r\nBattery. - 5100mAh', 'The Samsung Galaxy Tab A7 Lite is a sleek and lightweight tablet designed for on-the-go use. Powered by a Mediatek MT8768T Helio P22T Octa-core processor and 4GB RAM, this tablet delivers smooth performance for everyday tasks. Its 8.7-inch display offers a vibrant viewing experience, making it perfect for browsing, streaming, and light gaming. The silver finish adds a touch of elegance, making it both functional and stylish.', 25170.00, 23500.00, 'T-SU', 'instock', 1, 3, '1732033960.webp', '1732033960-1.webp,1732033960-2.webp,1732033960-3.webp', 8, 18, '2024-11-19 10:32:41', '2024-11-19 10:32:41'),
(31, 'Lenovo TAB M9 LTE MediaTek Helio G80 4GB RAM 9 inch HD IPS Display Arctic Grey Tablet #TB310XU', 'lenovo-tab-m9-lte-mediatek-helio-g80-4gb-ram-9-inch-hd-ips-display-arctic-grey-tablet-tb310xu', 'Processor Model - MediaTek Helio G80\r\nDisplay Size (Inch) - 9\r\nRAM - 4GB\r\nStorage - 64GB\r\nFront Camera - 2MP\r\nBack/Rear Camera - 8MP\r\nBattery. - 5100mAh', 'Brand - Lenovo, Model - Lenovo TAB M9 LTE, Generation - Unmentioned, Processor Model - MediaTek Helio G80, Processor Clock Speed - 2.0 GHz + 2.0 GHz, RAM - 4GB, Storage - 64GB, GPU - Mali-G52 MC2, Display Type - HD IPS Display, Display Size (Inch) - 9 Inch, Display Resolution - 1340x800, Panel Type - IPS, Connectivity - Bluetooth, WiFi, LTE, Additional Ports - USB Type-C, Card Slot - Yes, Card Type - MicroSDXC, Sim Card Slot - Yes, Sim Card Type - Nano-SIM, Front Camera - 2MP, Rear Camera - 8MP, Stylus Pen Included - No, Sound - Dual stereo speakers with Dolby Atmos, Play Store Support - Yes, Battery (mAh) - 5100mAh, Backup Hours - Up to 13 Hrs., Body Color - Arctic Grey, Base OS - Android 12, Operating System - Android, Dimensions - 215.43 x 136.76 x 7.99mm, Weight - 344 gm, Others - Preloaded Software: Camera Go, Entertainment Space, Google Kids Space, Google One, Google TV, Netflix, YouTube Kids, WiFi: 802.11AC, 2.4 GHz & 5 GHz, Bluetooth 5.1, Sensors: Accelerometer, proximity, Specialty - Stylish design, Power play, Search what you see, Chill for a longer, Binge safer, Keep your security on lock, Part No - TB310XU, In Box - Lenovo Tab M9 (9 Inch MTK), USB-C 2.0 charging cable, 5V/2A charging adapter, Quick Start Guide, & Safety, Warranty, Tray pin, Warranty - 1 Year, Country of Origin - China, Made in/ Assemble - China', 25720.00, 24000.00, 'T-L', 'instock', 1, 2, '1732034100.webp', '1732034100-1.webp,1732034100-2.webp,1732034100-3.webp', 8, 1, '2024-11-19 10:35:01', '2024-11-20 06:17:00'),
(32, 'Sony Ult Field 7 Black Portable Bluetooth Party Speaker (1 Year Warranty)', 'sony-ult-field-7-black-portable-bluetooth-party-speaker-1-year-warranty', 'Channel - 1:0\r\nConnectivity Mode - Bluetooth & Wired\r\nMemory Card Slot - No\r\nUSB Port - Yes\r\nRemote Control - No\r\nFM Radio - No\r\nVoice Enabled - No\r\nTouch Controls - No', 'The Sony Ult Field 7 delivers exceptional sound quality and versatile connectivity, making it perfect for any party setting. Designed for both indoor and outdoor events, this portable Bluetooth speaker offers high-end features, superior durability, and a long-lasting battery life. Its lightweight design allows for easy portability without compromising on powerful audio performance.', 92230.00, 85000.00, 'S-S', 'instock', 1, 2, '1732034542.webp', '1732034542-1.webp,1732034542-2.webp,1732034542-3.webp', 9, 21, '2024-11-19 10:42:23', '2024-11-19 10:42:23'),
(33, 'Amazon Echo Dot 5th Gen Smart Speaker with Alexa (Chalk/Glacier White)', 'amazon-echo-dot-5th-gen-smart-speaker-with-alexa-chalkglacier-white', 'Channel - 1:0\r\nConnectivity Mode - Bluetooth\r\nMemory Card Slot - No\r\nUSB Port - No\r\nRemote Control - No\r\nFM Radio - No\r\nVoice Enabled - Yes', 'OUR BEST SOUNDING ECHO DOT YET – Enjoy an improved audio experience compared to any previous Echo Dot with Alexa for clearer vocals, deeper bass and vibrant sound in any room.\r\nYOUR FAVORITE MUSIC AND CONTENT – Play music, audiobooks, and podcasts from Amazon Music, Apple Music, Spotify and others or via Bluetooth throughout your home.\r\nALEXA IS HAPPY TO HELP – Ask Alexa for weather updates and to set hands-free timers, get answers to your questions and even hear jokes. Need a few extra minutes in the morning? Just tap your Echo Dot to snooze your alarm.\r\nKEEP YOUR HOME COMFORTABLE – Control compatible smart home devices with your voice and routines triggered by built-in motion or indoor temperature sensors. Create routines to automatically turn on lights when you walk into a room, or start a fan if the inside temperature goes above your comfort zone.\r\nDESIGNED TO PROTECT YOUR PRIVACY – Amazon is not in the business of selling your personal information to others. Built with multiple layers of privacy controls, including a mic off button.\r\nDO MORE WITH DEVICE PAIRING – Fill your home with music using compatible Echo devices in different rooms, create a home theatre system with Fire TV, or extend wifi coverage with a compatible eero network so you can say goodbye to drop-offs and buffering.', 7380.00, 6800.00, 'S-A', 'instock', 1, 2, '1732034678.webp', '1732034678-1.webp,1732034678-2.webp', 9, 20, '2024-11-19 10:44:39', '2024-11-19 10:44:39'),
(34, 'Asus BR1100FKA Intel CDC N4500 4GB RAM 256GB SSD 11.6 Inch HD Touch Display Dark Grey Education Laptop (Stylus Pen Included)', 'asus-br1100fka-intel-cdc-n4500-4gb-ram-256gb-ssd-116-inch-hd-touch-display-dark-grey-education-laptop-stylus-pen-included', 'Processor Type. - Intel Celeron\r\nGeneration - Celeron Series\r\nRAM - 4GB\r\nStorage - 256GB SSD\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 11.6', 'Features of Asus BR1100FKA Laptop In Bangladesh\r\nLaptop Brand - Asus, Laptop Series - ExpertBook, Laptop Model - Asus BR1100FKA, User Segment - Business, Processor Brand - Intel, Processor Type - Intel Celeron, Processor Generation - Celeron Series, Processor Model - CDC N4500, Processor Base Frequency - 1.10GHz, Processor Max Turbo Frequency - 2.80GHz, Processor Core - 2, Processor Thread - 2, Processor Cache - 4MB, Display Size - 11.6 Inch, Display Technology - HD LED Touch Display, Panel Type - IPS, Display Resolution - 1366x768, Display Surface - Glossy, Touch Display - Yes, Display Bezel - Slim Bazel, Brightness - 250nits, Display Features - 16:9 IPS glossy panel, 250 nits brightness, 63% screen-to-body ratio., Secondary Screen Size - No Secondary Screen, Secondary Screen Technology - No Secondary Screen, Secondary Screen Resolution - No Secondary Screen, Memory (RAM) - 4GB, Installed Memory Details - 1 x 4GB Non Removable, Memory Type - DDR4, Total Memory Slot - No, Empty Memory Slot - No, Max Memory Support - 4GB, Storage - 256GB SSD, Installed HDD Type - No HDD, HDD RPM - No HDD, HDD Expansion Slot - No, Installed SSD Type - NVMe PCIe, SSD Expansion Slot - No, Storage Upgrade - Installed SSD Can Not Be Replaced, Optical Drive - No-ODD, Multimedia Card Slot - No, Supported Multimedia Card - No, Graphics Chipset - Intel UHD Graphics, Graphics Memory Accessibility - Integrated, Graphics Memory - Shared, Graphics Memory Type - Not Applicable, LAN - Yes, WiFi - Wi-Fi 5 (802.11ac), Bluetooth - Bluetooth 5.1, USB 2 Port - 1 x USB 2.0 Type-A, USB 3 Port - 1 x USB 3.2 Gen 1 Type-A, USB C / Thunderbolt Port - 1 x USB 3.2 Gen 2 Type-C, HDMI Port - 1, Micro HDMI Port - No, Mini HDMI Port - No, DP Port - No, Mini DP Port - No, D-SUB / VGA Port - No, Headphone Port - Combo, Microphone Port - Combo, Audio Properties - SonicMaster, Speaker - Yes, Microphone - Yes, WebCam - HD Webcam, Keyboard Layout - 1.35mm key travel chiclet keyboard, Keyboard Back-lit - No, RGB Keyboard - No, Num Key pad - No, Pointing Device - TouchPad, Dedicated Navigation key - No, Finger Print Sensor - No, Face Detection - No, TPM - Yes, Security Chip - Firmware TPM, Security Lock Slot - Kensington Lock Slot, Battery Cell - 3 cell, Battery Capacity - 42Wh, Battery Type - Li-ion, Battery Backup (Approximate) - Up to 3Hr., Power Adapter - 45W, Adapter Type - AC Adapter, Operating System - Windows 11 Home, Pre-loaded Application - MyASUS, Certifications - Military Grade, TUV Rheinland, Body Material - ABS + Plastic, Device Lighting - No, Color - Dark Grey, Dimension (W x D x H) - 294.6 x 204.9 x 19.9mm, Weight - 1.40 kg, Best For - Business Communication,internet banking, bill payment, listening to music, watching movies, playing games, online education, internet surfing, etc., Special Feature - AI Noise-Canceling Technology, 2 integrated stereo speakers, Array microphone with Cortana voice-recognition support., Others - Trusted Platform Module (Firmware TPM), Kensington Security Slot, Special feature: System diagnosis, Battery health charging, Splendid, Function key lock, WiFi SmartConnect.Military grade: US Military-Grade MIL-STD-810H Durability certified., Package Contents - Original factory fitted Sleeve case, MPP 2.0 ASUS Stylus Pen, Warranty - 3 Year International (3 year for Battery and Adapter), Warranty Claim Duration (Approximate) - Estimated Warranty Claim Duration 20 Days. It may take additional time up to 40 days, Part Number - BP1039W, Country of Origin - Taiwan, Made in / Assembled in - China, Disclaimer - Mentioned Battery Backup information is collected from manufacturer. As per manufacturer the backup time may vary for different use case, settings, applications and some other factors.', 34000.00, 35000.00, 'L-A', 'instock', 0, 2, '1732035041.webp', '1732035041-1.webp,1732035041-2.webp,1732035041-3.webp', 1, 3, '2024-11-19 10:50:42', '2024-11-20 07:47:03'),
(38, 'Lenovo D19-10 18.5 Inch HD HDMI VGA Monitor #61E0KAR6WW', 'lenovo-d19-10-185-inch-hd-hdmi-vga-monitor-61e0kar6ww', 'Display Size (Inch) - 18.5\r\nDisplay Resolution - 1366x768\r\nPanel Type - TN\r\nRefresh Rate (Hz) - 60Hz\r\nRotatable - No\r\nHDMI Port - 1', 'Made for small businesses and industrial applications, as well as home use, the Lenovo D19-10 is a simple and affordable display solution. Designed to be an everyday workhorse, the Lenovo D19-10 is focused, offering a hassle-free user experience.\r\n\r\n \r\n\r\nNO FRILLS ATTACHED \r\n\r\nMade for small businesses and industrial applications, as well as home use, the Lenovo D19-10 is a simple and affordable display solution. It has a minimalistic design that is both subtle and efficient. \r\n\r\nDesigned to be an everyday workhorse, the Lenovo D19-10 is focused, offering a hassle-free user experience. As an essential device, it does not skimp on necessary features that can enhance viewing experiences, offering everything expected from a compact monitor.\r\n\r\n \r\n\r\nSimple, Clean Design \r\n\r\nComfortable Display The monitor is made to be a suitable fit in small offices and ideal for professionals who do not work on heavy visuals or graphics—for example, security monitoring rooms, OTC displays, and billing systems could benefit from a D19-10.\r\n\r\n \r\n\r\nComfortable Display\r\n\r\nThe 18.5-inch display in the D19-10 is a WLED backlit, 1366 x 786 HD, TN panel that supports 16.7M colors, covering 72% of the NTSC gamut. It also has a 5ms response time for smooth visuals. It is TÜV certified, meaning less strain on the eyes through long workdays.', 7810.00, 7500.00, 'M-Ls', 'instock', 1, 3, '1732111334.webp', '1732111334-1.webp,1732111334-2.webp,1732111334-3.webp', 2, 1, '2024-11-20 08:02:15', '2024-11-20 08:02:15'),
(39, 'Dahua DHI-LM22-L200 22 Inch Display FHD HDMI, VGA Black Monitor', 'dahua-dhi-lm22-l200-22-inch-display-fhd-hdmi-vga-black-monitor', 'Display Size (Inch) - 22\r\nDisplay Resolution - 1920x1080\r\nPanel Type - VA\r\nRefresh Rate (Hz) - 75Hz\r\nRotatable - No\r\nHDMI Port - 1', 'Benefits & Features\r\nFull HD Resolution: Enjoy crisp and clear visuals with the Dahua DHI-LM22-L200 Resolution at 1080p.\r\nVersatile Connectivity: This monitor supports both HDMI and VGA inputs, making it easy to connect to various devices.\r\nEnergy Efficient: The Dahua LED Screen is designed to consume less power, helping you save on electricity bills.\r\nWide Viewing Angle: With a wide viewing angle, you get consistent picture quality from different positions.\r\nSlim Design: The Dahua 22 Inch Monitor has a sleek and modern look that complements any setup.\r\nBuilt-In Speakers: Equipped with built-in speakers, it’s ready for multimedia tasks without needing extra equipment.\r\nDurable Build: Made with quality materials, the Dahua DHI-LM22-L200 is built to last.\r\nEasy Setup: The Dahua DHI-LM22-L200 Setup is simple, with clear instructions for quick installation.\r\nReliable Performance: Known for its durability, this Dahua Monitor provides consistent performance over time.\r\nAffordable Price: As an Affordable 22 Inch Monitor, it offers excellent value for its features.', 8900.00, 8200.00, 'M-D', 'instock', 0, 2, '1732111463.webp', '1732111463-1.webp,1732111463-2.webp,1732111463-3.webp', 2, 15, '2024-11-20 08:04:24', '2024-11-20 08:04:24'),
(40, 'Lenovo IdeaPad Slim 1i 14IGL7 Intel Celeron N4020 14\" FHD Laptop', 'lenovo-ideapad-slim-1i-14igl7-intel-celeron-n4020-14-fhd-laptop', 'MPN: 82V6007SIN\r\nModel: IdeaPad Slim 1i 14IGL7\r\nProcessor: Intel Celeron N4020 (4M Cache, 1.10 GHz up to 2.80 GHz)\r\nRAM: 8GB DDR4, Storage: 256GB SSD\r\nDisplay: 14\" FHD (1920 x 1080) TN\r\nFeatures: Type-C, Privacy Shutter, Stereo speakers', 'Lenovo IdeaPad Slim 1i 14IGL7 Intel Celeron N4020 14\" FHD Laptop\r\nThe Lenovo IdeaPad Slim 1i 14IGL7 is a versatile and compact laptop designed for everyday use. Its Intel Celeron N4020 processor and integrated Intel UHD Graphics 600 deliver stable performance for web surfing, media streaming, and basic productivity app management. With 8GB of DDR4 RAM and a 256GB PCIe NVMe SSD, it provides fluid multitasking and speedy storage access. The 14-inch Full HD display with anti-glare technology ensures clear images, while the dual speakers\' improved Dolby Audio produces immersive sound. Because it contains an HD webcam with privacy shutter enabled and twin array microphones, it offers better privacy and clear communication. A card reader, USB ports, and HDMI are included in the Lenovo IdeaPad Slim 1i 14IGL7 Intel Celeron N4020 14\" FHD Laptop\'s array of wireless networking options, which also include Bluetooth 5.1 and 11ac Wi-Fi. The Lenovo IdeaPad Slim 1i 14IGL7 Intel Celeron N4020 Laptop\'s elegant Cloud Grey design and robust PC-ABS construction combine to offer both style and durability for on-the-go use. Security features like firmware TPM 2.0 and a privacy shutter for the camera also help users feel more at peace. The Lenovo IdeaPad Slim 1i 14IGL7 is a trustworthy companion for general computing needs, whether for business or pleasure.', 39050.00, 36500.00, 'L_L', 'instock', 0, 2, '1732378082.webp', '1732378082-1.jpeg,1732378082-2.webp,1732378082-3.webp', 1, 1, '2024-11-23 10:08:05', '2024-11-23 10:08:05'),
(41, 'HP 250 G8 Core i3 11th Gen 15.6\" 4GB RAM 1TB HDD with windows Laptop', 'hp-250-g8-core-i3-11th-gen-156-4gb-ram-1tb-hdd-with-windows-laptop', 'MPN: 4T085PA\r\nModel: 250 G8\r\nProcessor: Intel Core i3-1115G4 (6MB Cache, 3.00 GHz up to 4.10 GHz)\r\nRAM: 4GB DDR4 3200MHz, Storage: 1TB HDD\r\nDisplay: 15.6\" FHD (1920 x 1080)\r\nFeatures: Full-Size island-style keyboard, Type-C', 'HP 250 G8 Core i3 11th Gen 15.6\" 4GB RAM 1TB HDD Laptop\r\nThe HP 250 G8 laptop is powered by Intel Core i3-1115G4 Processor (6M Cache, 3.00 GHz up to 4.10 GHz) and it comes with 4GB DDR4 RAM. It has a 1TB 5400 RPM SATA HDD for storage option. This laptop is integrated with Intel UHD Graphics and it has a 15.6\" diagonal, FHD (1920 x 1080), IPS, anti-glare WLED, 250 nits, eDP micro-edge, 45% NTSC Display. It comes with integrated stereo speakers and Integrated dual-array microphones. It has an HP TrueVision HD Camera also. For input options, it comes with a Full-Size Textured island-style keyboard and a Touchpad with multi-touch gesture support. This laptop is designed with 2x USB 3.2 Gen 1 ports, 1x USB 3.2 Gen 1 Type-C port (data only), 1 x HDMI 1.4b and 1 x Headphone /Microphone port. It also has a Multi-format digital media reader (supports SD, SDHC, and SDXC). it is powered by a 3 Cell, 41 Wh Li-ion battery. It comes with a 45W AC power adapter. It is equipped with Realtek 802.11ac (2x2) WLAN and Bluetooth 5 Combo for wireless connectivity.', 53170.00, 49400.00, 'H-P', 'instock', 1, 2, '1732378254.webp', '1732378254-1.jpeg,1732378254-2.webp,1732378254-3.webp', 1, 2, '2024-11-23 10:10:55', '2024-11-23 10:10:55'),
(42, 'HUAWEI WATCH GT 4 46 mm Bluetooth Calling Smart Watch Green', 'huawei-watch-gt-4-46-mm-bluetooth-calling-smart-watch-green', 'Model: WATCH GT 4\r\n1.43 inches AMOLED Color Screen\r\nDual-band Five-system GNSS\r\nBluetooth Call Support\r\n5 ATM Water Resistance', 'HUAWEI WATCH GT 4 46 mm Bluetooth Calling Smart Watch Green\r\nThe HUAWEI WATCH GT 4 Green design has a 1.43-inch AMOLED screen. There are 24-hour options for better fitness and health management. With an incredible two-week battery life, this timepiece serves as your scientific workout coach, providing tracking and support for a variety of activities. The Huawei Watch GT 4 offers a broad range of fitness tracking capabilities, including calorie management, real-time data, and more than 100 activity modes. It monitors your heart rate and provides vocal direction so that your training is effortless. It also includes tools for stress management, SpO2 readings, and heart rate monitoring. The watch also offers information about fertile times, ovulation, and menstruation, which is specifically tailored to the health needs of women. Using your wrist, you may take calls over Bluetooth, listen to music on its own, keep track of your calendar, and even reply to SMS messages. iOS and Android smartphones are both compatible with the HUAWEI WATCH GT 4.', 31899.00, 26990.00, 'W-H', 'instock', 1, 3, '1732378572.webp', '1732378572-1.webp,1732378572-2.webp', 10, 22, '2024-11-23 10:16:13', '2024-11-23 10:16:13'),
(43, 'Apple Watch Series 9 45mm Smart Watch', 'apple-watch-series-9-45mm-smart-watch', 'Model: Watch Series 9\r\nAlways-On Retina LTPO OLED display, 2000 nits brightness\r\nS9 SiP, dual-core CPU with 5.6 billion transistors\r\nDouble Tap Sensor, Blood Oxygen app & ECG app\r\n50m water resistant, IP6X dust resistant', 'Apple Watch Series 9 45mm Smart Watch\r\nApple Watch Series 9 Smart Watch is designed with the all new S9 SiP and latest dual-core CPU has 5.6 billion transistors. The watch has a 1.9-inch display with a 484 x 396-pixel resolution Always-On Retina LTPO OLED display that is able to produce up to 2000 nits brightness. The display is crack-resistant, dust-resistant (IP6X), and Swimproof with 50m water resistance. The new Apple Series 9 provides the double-tap sensor. This latest watch has the latest Bluetooth calling, and texting features that enhance your usability. The watchOS 10 update brings more to your screen than ever before. The Apple Watch Series 9 capable for measuring heart rate through the ECG app and also measures blood oxygen level. Apple Watch Series 9 also allows you to stream music and podcasts through Apple Music and pay hands-free in an instant almost anywhere with Apple Pay.', 51150.00, 44590.00, 'W-A', 'instock', 1, 2, '1732378720.webp', '1732378720-1.webp,1732378720-2.webp', 10, 23, '2024-11-23 10:18:40', '2024-11-23 10:18:40'),
(44, 'Apple Watch Ultra GPS + Cellular 49mm Titanium Case with Green Alpine Loop', 'apple-watch-ultra-gps-cellular-49mm-titanium-case-with-green-alpine-loop', 'Model: Apple Watch Ultra\r\nAlways-On Retina LTPO OLED display\r\nS8 SiP with 64-bit dual-core processor\r\nDual speakers, Three-microphone array\r\n100m water resistant, IP6X dust resistant', 'Description\r\nApple Watch Ultra GPS + Cellular 49mm Titanium Case with Green Alpine Loop\r\nApple Watch Ultra is the most rugged and capable Apple Watch ever. The Apple Watch Ultra is the ideal travel companion thanks to its durable titanium case, accurate dual-frequency GPS, up to 36 hours of battery life, and three specialized bands made for athletes and adventurers of all kinds. Apple Watch Ultra is a vital exploration tool that can go anywhere because it is made to withstand harsh environments, elevations, and temperatures. assist in getting you home.\r\n\r\nRobust titanium case\r\nThe Apple Watch Ultra is made with a durable titanium case that is resistant to scratches, dents, and corrosion. It is also water resistant to 50 meters, so you can take it with you in the pool or the ocean.\r\n\r\nPrecision dual-frequency GPS\r\nApple Watch Ultra features precision dual-frequency GPS that provides greater range and accuracy, even in challenging environments. This means that you can track your workouts with confidence, even when you are in the mountains or the woods.', 107250.00, 94490.00, 'A-WT', 'instock', 0, 2, '1732378829.jpg', '1732378829-1.jpeg,1732378829-2.jpeg', 10, 23, '2024-11-23 10:20:29', '2024-11-23 10:20:29'),
(45, 'Xiaomi Watch 2 AMOLED Bluetooth Calling Smart Watch', 'xiaomi-watch-2-amoled-bluetooth-calling-smart-watch', 'Model: Watch 2\r\nDisplay: 1.43\" AMOLED 466×466 Resolution\r\nBluetooth Calling & Google Assistant\r\nSupport 160+ sports modes including professional ski mode\r\n5ATM Water-resistance, Up to 65-hour Battery Life', 'Xiaomi Watch 2 AMOLED Bluetooth Calling Smart Watch\r\nThe Xiaomi Watch 2 AMOLED Bluetooth Calling Smart Watch has a vibrant 1.43-inch AMOLED display with 466x466 pixel resolution, which provides clear and bright visuals even in sunshine. This Smart Watch is powered by the Qualcomm Snapdragon W5+ Gen 1 Platform. It features 2GB of RAM and 32GB of storage, which helps provide smooth performance The Smart Watch has a 495 mAh battery that fully charges in about 45 minutes. The Xiaomi Watch 2 provides up to 65 hours of typical use time. It has dual-band Wi-Fi, and Bluetooth 5.2. The smartwatch has advanced navigation capabilities, which include dual-band GPS and multiple satellite systems. The heart rate, accelerometer, gyroscope, ambient light, compass, and barometer sensors are all included in the health and fitness tracking system. The smartwatch is 5ATM water-resistant, which makes it ideal for a variety of water activities.', 24199.00, 18290.00, 'X-W', 'instock', 1, 2, '1732378984.webp', '1732378984-1.webp,1732378984-2.webp', 10, 19, '2024-11-23 10:23:05', '2024-11-23 10:23:05'),
(46, 'Lenovo HE05 Bluetooth Neckband Earphone Black', 'lenovo-he05-bluetooth-neckband-earphone-black', 'Model: HE05\r\nBluetooth version: 5.0\r\nTransmission distance: 10m\r\nWaterproof: IPX5\r\nWorking time: 8 hours', 'Lenovo HE05 Bluetooth Neckband Earphone Black\r\nLenovo HE05 is Equipped with an 8mm drive to deliver stunning sound for an enjoyable listening experience. Comes with a Built-in large-capacity battery for up to 12 hours of working time and 7 days of standby time. It works with Bluetooth 5.0 chips to ensure a stable and fast connection. Here, IPX5 waterproof rate can keep the rain and sweat far away. Its ergonomically designed earphones for long-time comfort. It has CVC noise-canceling microphone & magnetic design for easy storage. This Lenovo HE05  earphone has no Warranty.', 605.00, 450.00, 'E-L', 'instock', 1, 2, '1732379180.webp', '1732379180-1.webp', 11, 1, '2024-11-23 10:26:20', '2024-11-23 10:26:20'),
(47, 'Lenovo HE05X Bluetooth Neckband Earphone Black', 'lenovo-he05x-bluetooth-neckband-earphone-black', 'Model: HE05X\r\nFrequency response: 20Hz-20KHz\r\n3D surround sound, 5.0 dual-ear chip\r\nIntegrated battery: 3.7V / 110mAh', 'Lenovo HE05X Bluetooth Neckband Earphone Black\r\nLenovo HE05X is equipped with a 10mm driver that delivers stunning sound for an enjoyable listening experience. It has a 3.7-volt, 110-mAh large-capacity battery that can last up to 12 hours. Using low-power micro-power technology in conjunction with chip low-power technology significantly increases use time. The carbon fiber composite diaphragm and large moving coil acoustic technology resonate under the action of magnetism and electricity and restore the shocking sound quality of high-frequency, intermediate-frequency, and low-frequency music with high fidelity. It is equipped with Bluetooth 5.0 chips to ensure a stable and fast connection. The Lenovo HE05X features IPX5 waterproof protection that can keep the rain and sweat far away. Its ergonomically designed earphones provide long-term comfort. The Lenovo HE05X  earphone has no Warranty.', 660.00, 490.00, 'E-L', 'instock', 0, 2, '1732379417.webp', '1732379417-1.webp', 11, 1, '2024-11-23 10:30:17', '2024-11-23 10:30:17'),
(48, 'Yison Celebrat G28 3.5mm Wired Earphone', 'yison-celebrat-g28-35mm-wired-earphone', 'Model: Celebrat G28\r\nDrive Unit: 10mm\r\nImpedance: 32Ω±15%\r\nCable length: 1.2m\r\nPlug Type: 3.5mm', 'Yison Celebrat G28 3.5mm Wired Earphone\r\nThe Yison Celebrat G28 3.5mm Wired Earphone is designed to provide consistent audio performance and comfort for everyday listening. These earphones include a 10mm drive unit and deliver balanced sound reproduction with clear highs and strong bass, resulting in an immersive listening experience across many music genres. With a sensitivity of 100dB±3dB and an impedance of 32Ω±15%, they provide effective power usage and compatibility with a variety of devices, including smartphones and laptops. The Yison Celebrat G28 earphones are designed for clarity and accuracy, with a frequency response range of 200Hz to 5KHz, allowing you to capture the intricacies of your favorite tunes in incredible detail. Whether you\'re listening to podcasts, music, or phone conversations, these earbuds provide clean and natural sound quality for a pleasant listening experience. The Yison Celebrat G28 earbuds include a standard φ3.5mm socket and 1.2m cable length, allowing for easy connecting and flexibility of movement while listening to music. The ergonomic design offers a comfortable and secure fit, making them ideal for long-term usage during commuting, exercises, or leisure activities. With their elegant and adaptable design, the Yison Celebrat G28 Wired Earphones are the ideal companion for your everyday activities, providing dependable performance and comfort wherever you go. Enhance your listening experience with the Yison Celebrat G28 Wired Earphones, which provide crystal-clear sound quality on demand.', 189.00, 172.00, 'E-Y', 'instock', 1, 2, '1732379952.webp', '', 11, 24, '2024-11-23 10:39:12', '2024-11-23 10:39:12'),
(49, 'Yison Celebrat D2 3.5mm Wired Premium Earphone', 'yison-celebrat-d2-35mm-wired-premium-earphone', 'Model: Celebrat D2\r\nSupports with Portable Media Player, Mobile Phone, PC\r\nFunction: Microphone, Noise Cancelling\r\nDrive Unit: 10mm, Sensitivity: 92dBÂ±3dB\r\nPlug Type: 3.5mm, Cable length: 1.2m', 'Yison Celebrat D2 3.5mm Wired Premium Earphone\r\nYison Celebrat D2 Premium Earphone comes with 3.5mm cable (Cable length: 1.2m). This Earphone has Microphone, Noise Cancelling function. This Earphone featured with Drive Unit: 10mm, Sensitivity 92dBÂ±3dB, Impedance 16Î©Â±15%, Frequency Response 20-20000Hz. This Yison Celebrat D2 3.5mm Wired Premium Earphone compatible with Portable Media Player, Mobile Phone, Computer. The new Yison Celebrat D2 3.5mm Wired Premium Earphone has no warranty.', 215.00, 195.00, 'E-ER', 'instock', 0, 2, '1732380079.jpg', '1732380079-1.jpg,1732380079-2.jpg', 11, 24, '2024-11-23 10:41:19', '2024-11-23 10:41:19'),
(50, 'Casio FC-200V Financial Calculator', 'casio-fc-200v-financial-calculator', 'MPN: C38\r\nModel: Casio FC-200V\r\nInterest, Amortization, Margins & Break-Even\r\nTVM Analysis and Cash Flow Analysis\r\nDepreciation & Discount\r\nDual Power (Solar+Battery)', 'Casio FC-200V Financial Calculator\r\nCasio FC-200V Financial Calculator comes with a Dot Matrix DisplayDual power and also has exclusive built-in functions like Cost/Sell/Margin etc. In this calculator , it has Dedicated buttons for Cost, selling price,or margin, Depreciation, Bond etc. This Financial Calculator featured with Simple & Compound Interest calculationInvestment appraisal (cash flow), Amortization, Converts between percentage interest rate and effective interest rate, Day calculation, Depreciation, Bond calculation, Break Even point calculation, Cost/Sell/Margin, Statistics, Slide-on hard case and Solar Plus with battery back-up. It is also designed with .49â€�H x 3.15â€�W x 6.34â€�L Dimensions, 3.7 oz. Weight. This Casio Financial Calculator has no warranty.', 5600.00, 5100.00, 'C-C', 'instock', 0, 2, '1732459010.jpg', '', 13, 25, '2024-11-24 08:36:50', '2024-11-24 08:38:31'),
(51, 'Casio MJ-120D Calculator', 'casio-mj-120d-calculator', 'MPN: B85\r\nModel: MJ-120D\r\n150 Steps Check & Tax Keys\r\nDigit: 12 Digits Display\r\nPower Sources: Solar & Battery', 'Casio MJ-120D Calculator\r\nCasio MJ-120D Calculator comes with 150 Steps Check and Tax Keys. This calculator is featured with Regular percent, 12 digits, Tax calculation, Solar & Battery(Solar powered when light is sufficient, battery powered when light is insufficient.) , Function command signs, Key rollover, Extra Large display, Plastic keys, Mark-up, Localized number display. It is also has Function command signs: A symbol (+, -, x, /) on the display indicates the status of operation are currently performing. Here, Key operations are stored in a buffer, so nothing is lost even during high-speed input. The Larger display makes more data easier to read. This calculator is capable for Automatic calculation of price plus tax, price less tax, discount, selling price, tax amount, discount amount, and margin amount and also designed with 140Ã—123Ã—30.1mm dimension. This new Casio MJ-120D Calculator has 01-year Official warranty (For Warranty Must Claim With Box).', 990.00, 900.00, 'C-CS', 'instock', 1, 3, '1732459102.webp', '', 13, 3, '2024-11-24 08:38:22', '2024-11-24 08:38:22');
INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(52, 'Hoco J72 Easy Travel 10000mAh Power Bank', 'hoco-j72-easy-travel-10000mah-power-bank', 'Model: J72 Easy Travel\r\nCapacity: 10000mAh 37Wh\r\nInput: Micro-USB / Type-C, 5V / 2A max.\r\nOutput: USB 1/2 – 5V / 2A max\r\nDisplay: LED indicator of Power level.', 'Hoco J72 Easy Travel 10000mAh Power Bank\r\nThe Hoco J72 Easy Travel 10000mAh Power Bank is a compact and reliable charging solution designed for both daily use and travel. With a capacity of 10000mAh, it provides ample power to keep your devices running, making it ideal for those who are constantly on the go. The power bank\'s durable design features a flame-retardant ABS and PC shell, ensuring it remains safe and resilient in various conditions. Its lightweight and sleek build also makes it easy to carry in a bag or pocket, offering convenience without compromising functionality. Equipped with versatile charging options, the Hoco J72 supports both Micro-USB and Type-C inputs, allowing for flexible recharging. The power bank’s input is rated at 5V / 2A, ensuring a quick recharge time, so you can power up the bank without long waits. It comes with two USB output ports, each delivering 5V / 2A, providing sufficient power to charge two devices at once. This makes it ideal for smartphones, tablets, and other USB-powered devices. The power bank features a clear LED power indicator, which shows the remaining battery level, ensuring you’re always aware of when it’s time to recharge. The built-in lithium polymer battery is known for its safety and longevity, while the flame-retardant materials used in the construction add an extra layer of protection. With a rated capacity of 5900mAh and a total output of 5V / 2A, the Hoco J72 combines portability, safety, and efficiency, making it an essential accessory for anyone in need of reliable, on-the-go power.', 1280.00, 970.00, 'P-H', 'instock', 1, 3, '1732459320.webp', '', 14, 27, '2024-11-24 08:42:00', '2024-11-24 08:42:00'),
(53, 'Hoco J85 Wellspring 20000mAh Digital Display Power Bank', 'hoco-j85-wellspring-20000mah-digital-display-power-bank', 'Model: J85 Wellspring\r\nCapacity: 20000mAh, 74Wh\r\nOutput Power: Up to 2A\r\nPorts: Micro-USB, Dual USB\r\nDisplay: LED digital display', 'Hoco J85 Wellspring 20000mAh Digital Display Power Bank\r\nThe Hoco J85 Wellspring 20000mAh Digital Display Power Bank is intended to provide a dependable and efficient power supply for your electronics on the road. With a powerful 20000mAh capacity and a reported capacity of 11800mAh, this power bank is ideal for numerous recharges of smartphones, tablets, and other portable devices, making it a fantastic choice for travelers or those frequently on the go. It has multiple input choices, with Micro-USB and Type-C connectors that both enable a 5V/2A input, allowing for easy power bank recharging. On the output side, the Hoco J85 Wellspring 20000mAh Power Bank has two USB ports, each giving 5V/2A, allowing you to charge two devices simultaneously with a total output of 5V/2A. The LED digital display gives clear and precise updates on the power bank\'s remaining charge, allowing you to manage your power requirements effectively. The Hoco J85 Wellspring 20000mAh Digital Display Power Bank is built of flame-retardant ABS and PC components, ensuring its safety and endurance over time. Inside, a high-quality lithium polymer battery provides consistent and reliable power delivery. The Hoco J85 weighs 418g and has a compact size of 138*70*28mm, making it convenient to carry in a backpack or pocket while maintaining capacity. Its lightweight design, paired with powerful performance, makes it suitable for everyday use or long excursions where charging outlets may be scarce.', 1405.00, 1275.00, 'P-HS', 'instock', 0, 2, '1732459404.webp', '', 14, 27, '2024-11-24 08:43:24', '2024-11-24 08:43:24'),
(54, 'Awei P88K 10000mAh 22.5W Mini Fast Charging Power Bank', 'awei-p88k-10000mah-225w-mini-fast-charging-power-bank', 'Model: P88K\r\nCapacity: 10000mAh\r\nType-C Input: 5V/2.0A\r\nUSB1+USB2 Output: 5V/2.1A\r\nMaterial: ABS+PC', 'Awei P88K 10000mAh 22.5W Mini Fast Charging Power Bank\r\nThe Awei P88K 10000mAh Mini Fast Charging Power Bank is an ideal combination of design, portability, and high-performance charging for today\'s mobile lifestyle. This P88K sleek power bank has a distinctive wood-like texture made of strong PC and ABS components, providing a modern look that stands out while being useful and durable. It weighs only 239g and fits comfortably in your pocket or backpack, making it an excellent companion for travel, commuting, and outdoor pursuits. Powered by a powerful li-polymer battery with a capacity of 10,000mAh, the P88K has a rated capacity of 6200mAh, allowing you to charge your devices numerous times. The P88K power bank\'s Type-C cable output provides rapid charging at an astounding 22.5W, guaranteeing that your devices are fueled up quickly, while the dedicated iPhone output offers a reliable 12W for seamless compatibility with Apple products. Recharging the P88K power bank is quick and easy owing to the Type-C connection, which enables input choices of 5V/2A and 9V/2A, reducing downtime. Additionally, the USB-A output is versatile, with options of 5V/4.5A and 4.5V/5A, allowing a wide range of devices from smartphones to tablets. The Awei P88K, with its combination of efficient charging capabilities, elegant design, and small size, is a vital companion for anybody who wants to stay connected and energized throughout their busy day, ensuring you\'re always ready to face whatever comes your way.', 1550.00, 1350.00, 'P-A', 'instock', 1, 2, '1732459508.webp', '', 14, 26, '2024-11-24 08:45:08', '2024-11-24 08:45:08'),
(55, 'Awei P10K 10000mah 22.5W Fast Charging Digital Display Power Bank', 'awei-p10k-10000mah-225w-fast-charging-digital-display-power-bank', 'Model: P10K\r\nBattery Capacity: 10000mAh\r\nOutput: 22.5W Fast Charging\r\nOutput Ports: 2x USB & 1x Type-C\r\nDisplay: LED Digital Display', 'Awei P10K 10000mah 22.5W Fast Charging Digital Display Power Bank\r\nThe Awei P10K 10000mAh 22.5W Fast Charging Digital Display Power Bank is a versatile and powerful portable charger that will suit your on-the-go charging requirements. With a large capacity of 10000mAh, it keeps your gadgets powered throughout the day. The power bank enables rapid charging, with a maximum output of 22.5W, allowing you to charge your gadgets quickly and efficiently. It has an LED digital display that shows real-time information on the remaining battery capacity, so you always know how much power is left. The Awei P10K 10000mAh 22.5W Fast Charging Power Bank has several input and output choices for enhanced convenience. The Type-C input supports 5V/2.8A, 9V/2A, and 12V/1.5A, making it suitable for various devices. The Type-C connection outputs 5V/3A, 9V/2.22A, and 12V/1.67A, guaranteeing quick and stable charging. Furthermore, the Awei P10K 10000mah 22.5W Fast Charging Power Bank includes a USB1 output that delivers 10V/2.25A, 5V/3A, 9V/2A, and 12V/1.5A, while the USB2 output provides 10V/2.25A, 5V/3A, 9V/2A, and 12V/1.5A, allowing you to charge several devices at the same time. The power bank has a total output of 5V/3A, which ensures that all connected devices receive appropriate power. Whether you need to charge your smartphone, tablet, or other electronic device, the Awei P10K power bank provides a dependable and efficient alternative. Its tiny form and lightweight construction make it easy to transport, making it an excellent companion for travel, work, or everyday use. With its innovative features and strong performance, the Awei P10K 10000mAh 22.5W Fast Charging Digital Display Power Bank is an essential accessory for anyone needing dependable portable power.', 1145.00, 950.00, 'P-AW', 'instock', 0, 2, '1732459597.webp', '', 14, 26, '2024-11-24 08:46:37', '2024-11-24 08:46:37'),
(56, 'Awei T71 True Wireless Earbuds', 'awei-t71-true-wireless-earbuds', 'Model: T71\r\nDriver: 13mm\r\nBattery Capacity: 180mAh\r\nPlay Time: Up to 6H\r\nComfortably Wear', 'Awei T71 True Wireless Earbuds\r\nThe Awei T71 True Wireless Earbuds are intended for those who respect both performance and aesthetics. These T71 earbuds are both practical and stylish, with sleek color options like as Warm White for a fresh, modern look and Quiet Black for a more classic, modest design. Powered by Bluetooth 5.3, they provide a quick and robust connection, reducing latency and delivering smooth audio whether you\'re listening to music or making calls. The 13mm moving coil drivers of T71 produce dynamic sound with strong bass, precise mids, and clean treble, ideal for an immersive music experience. Each earbud has a 30mAh battery, allowing you up to 6 hours of continuous music playing and 5 hours of call time on a single charge. The charging case of Awei T71, which includes a 180mAh battery, facilitates quick recharges, ensuring that your earbuds are always ready to go. With a rapid 1-hour charging time, you can recharge during breaks, and the outstanding 300-hour standby period ensures they are available when you need them. With intuitive touch controls, the Awei T71 lets you easily handle your calls, music, and volume with a single tap, giving you total control without having to reach for your phone. The lightweight air-sense wear design guarantees a comfortable fit, so you may wear them for extended periods of time without discomfort. Whether for business, relaxation, or exercise, the Awei T71 True Wireless Earbuds provide a superior listening experience by merging style, comfort, and cutting-edge technologies in a small and adaptable packaging.', 1050.00, 940.00, 'W-A', 'instock', 1, 3, '1732459756.webp', '', 15, 26, '2024-11-24 08:49:16', '2024-11-24 08:49:16'),
(57, 'Awei T62 ENC True Wireless Earbuds', 'awei-t62-enc-true-wireless-earbuds', 'Model: T62\r\nDriver: 6mm\r\nBattery Capacity: 500mAh\r\nPlay Time: Up to 3.5H\r\nFrequency Response Range: 20-20000Hz', 'Awei T62 ENC True Wireless Earbuds\r\nThe Awei T62 ENC True Wireless Earbuds are an impressive combination of cutting-edge technology and stylish design, suitable for both audiophiles and casual listeners. With a sophisticated Bluetooth 5.3 chip, these earbuds provide speedy pairing and a robust connection, allowing for uninterrupted music streaming and clear phone conversations. Each earbud of T62 has twin 10mm drivers that produce exceptional sound quality with powerful bass, crystal-clear mids, and dazzling highs, giving you an immersive audio experience whether you\'re listening to music or conversing with others. With a small 30mAh battery in each earbud, you can get up to 5 hours of playing on a single charge, making them ideal for lengthy journeys, workouts, or relaxing at home. Furthermore, the charging case has a capacity of 300mAh, offers multiple recharges, extending your listening time without the need to plug in frequently. The T62 earbuds also enable up to 4.5 hours of talk time, making them ideal for hands-free calls. The Awei T62 is built for ease, with a 1.5-hour charge period that keeps you connected to your music at all times. The earphones\' ergonomic shape offers a comfortable fit for longer use, and their lightweight construction makes them simple to carry in your pocket or backpack. These T62 earbuds, which include Environmental Noise Cancellation (ENC) technology, efficiently reduce background noise, ensuring that your voice is heard clearly during calls even in busy locations. Whether you\'re at the gym, commuting, or resting at home, the Awei T62 ENC True Wireless Earbuds provide a combination of design, comfort, and exceptional sound quality, making them an indispensable item for your audio needs.', 1100.00, 1000.00, 'W-AS', 'instock', 0, 2, '1732459843.webp', '', 15, 26, '2024-11-24 08:50:43', '2024-11-24 08:50:43'),
(58, 'HJ78 RC Pro Duel 4K Camera Toy Drone', 'hj78-rc-pro-duel-4k-camera-toy-drone', 'Model: S70 Pro\r\nFoldable and Durable Design\r\n6-Axis Gyro for Easy Control\r\nBattery: 3.7V 600mah\r\nDistance: Up to 100 Meter', 'The HJ78 RC  Duel 4K Camera Toy Drone is an excellent drone that allows you to take spectacular 4K videos and photographs from the sky. Because it is intended for novices, you may easily manage it with the remote or your smartphone over Wi-Fi. It also features a gesture mode where you can control it with your hand gestures. The S70 Pro Duel 4K Camera Toy Drone is equipped with a robust battery that can provide up to 15 minutes of flight time. It features a battery capacity of 600 milliamp hours and a lithium ion battery cell composition. It also contains a low battery warning that alerts you when the power is running low, allowing you to securely land the drone. The dual camera technology on the S70 Pro Duel 4K Camera Toy Drone allows you to swap between front and bottom views, giving you multiple perspectives and angles. You may also manually adjust the camera angle and zoom in and out using the remote control. The drone accepts SD cards up to 128GB in size, allowing you to store a large number of films and photographs. The S70 Pro Duel Camera Toy Drone is a lightweight, foldable drone that is easy to transport. When unfolded, it is 28 x 23 x 5cm, and when folded, it measures 12 x 7 x 5cm. It weights only 240g and is suited for both children and adults. The drone also features a bright LED light that illuminates it in the dark.', 6600.00, 6000.00, 'D-S', 'instock', 1, 2, '1732460341.webp', '', 16, 29, '2024-11-24 08:59:02', '2024-11-24 08:59:02'),
(59, 'A9002 4K HD Camera Toy Drone', 'a9002-4k-hd-camera-toy-drone', 'Model: A9002\r\nFoldable design, easy to carry\r\nTop Speed: Up to 25 meters\r\nG-type smart sensors\r\nDistance: Up to 230 Feet', 'A9002 4K HD Camera Toy Drone\r\nThe A9002 4K HD Camera Toy Drone comes equipped with a 4K camera and a real-time video transmitter, allowing you to capture breathtaking aerial footage. It has a 20-minute flight time and a quick charging time of about 55 minutes. The drone has a 1800mAh lithium battery and can travel at speeds of up to 25 meters per second. The drone provides precise and agile flight control thanks to its G-type smart sensors and all-side movement capability. For added convenience, the A9002 Toy Drone has a control distance of up to 230 meters and includes a low battery signal and an auto return button. The A9002 drone is also equipped with WiFi and 2.4GHz remote control connectivity. It is a beginner-friendly drone and comes with extra features like propeller guards and a high-quality carrying case.', 6500.00, 5500.00, 'D-C', 'instock', 0, 2, '1732460458.webp', '', 16, 28, '2024-11-24 09:00:58', '2024-11-24 09:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `details` longtext DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8H3gvRq8dVSVRaeoVAfCvn2yMmtbLnCgOR2SHlpT', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMmw3V2hKcW9hakFQWERWWmpiU1hmTDdaenA4TmRUWFI4RHg1TlpocyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGVja291dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YToxOntzOjQ6ImNhcnQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e3M6MzI6IjAyN2M5MTM0MWZkNWNmNGQyNTc5YjQ5YzRiNmE5MGRhIjtPOjM1OiJTdXJmc2lkZW1lZGlhXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiMDI3YzkxMzQxZmQ1Y2Y0ZDI1NzliNDljNGI2YTkwZGEiO3M6MjoiaWQiO3M6MToiMSI7czozOiJxdHkiO3M6MToiMSI7czo0OiJuYW1lIjtzOjEwMjoiTGVub3ZvIElkZWFQYWQgU2xpbSAxaSAxNElHTDcgSW50ZWwgQ0RDIE40MDIwIDhHQiBSQU0sIDI1NkdCIFNTRCAxNCBJbmNoIEZIRCBEaXNwbGF5IENsb3VkIEdyZXkgTGFwdG9wIjtzOjU6InByaWNlIjtkOjM2NTAwO3M6Nzoib3B0aW9ucyI7Tzo0MjoiU3VyZnNpZGVtZWRpYVxTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NTI6IgBTdXJmc2lkZW1lZGlhXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO3M6MTg6IkFwcFxNb2RlbHNcUHJvZHVjdCI7czo0NDoiAFN1cmZzaWRlbWVkaWFcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAHRheFJhdGUiO2k6MjE7czo0NDoiAFN1cmZzaWRlbWVkaWFcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMyNDcxNDAzO319', 1732471411),
('DklYlIAgjjXN0f6e4dosLVZoszGr6lED1G2i4Iqd', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU09vbGZuS0diR25uZGk4OTNtMnNOaU1nbUlmeHNKMlpTd3NORWRPcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi91c2VyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MzI0NjgyNTE7fX0=', 1732471341),
('wTiNTMR6bid82tMpsQ512v7Tp5QxcvnlzvcnXazB', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYms0OW4zTUZ6WGdXR1pRdVE0SjM3eG1QV3F1c050UnJ2SXppUmlJZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NDoiY2FydCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjg6Im9yZGVyX2lkIjtpOjExO30=', 1732471361),
('yJPiIoBGfv8iVuOolgohzPbKQjjuZuMf3cOsZkvs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR3hKSEJDRlRKYUlUZlpXQ2xLVlA4bzZRVEdkbWFzM1N0MXpNQUFIRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0L2FkZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMyNDUzMjYyO31zOjQ6ImNhcnQiO2E6MTp7czo4OiJ3aXNobGlzdCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6ODoib3JkZXJfaWQiO2k6Mzt9', 1732467042);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `tagline`, `title`, `subtitle`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Aut placeat fugiat', 'Nisi ipsum sint ali', 'Aut maxime et aute v', 'Vel deleniti molesti', '1732290863.webp', 1, '2024-11-22 09:54:27', '2024-11-22 09:54:27'),
(12, 'Quae qui velit sed p', 'Ipsum dolore magni t', 'Sunt vero pariatur', 'Provident sed non s', '1732290911.jpg', 1, '2024-11-22 09:55:11', '2024-11-22 09:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` varchar(255) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `trans_id`, `status`, `created_at`, `updated_at`) VALUES
(7, 3, 12, 'online', '67436aa9c1592', 'pending', '2024-11-24 12:04:25', '2024-11-24 12:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USER for User or Customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rahed Hossen', 'rahedhossen49@gmail.com', '01975539231', NULL, '$2y$12$a8AmAa91gnWZ2gX3YgeU2uiKpTETIKtOHt7nPNYETAtxJYK6FtI92', 'ADM', NULL, '2024-11-18 09:34:04', '2024-11-18 09:34:04'),
(3, 'Rahed hossen', 'rahedhossen75@gmail.com', '01917558212', NULL, '$2y$12$39YVu23QPMOkIyHrrGFPfeY2NXesPfirSxnvYlYUZBVXp9jC.R6WG', 'USR', NULL, '2024-11-21 07:55:42', '2024-11-21 07:56:00'),
(4, 'Sazzad', 'sazzad@gmail.com', '01234567891', NULL, '$2y$12$3fT.f6KWf5NOCUPmWOwBFulZsXpeGopuxJ7KqciQJipq4i2ql9kge', 'USR', NULL, '2024-11-24 11:29:04', '2024-11-24 11:29:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `month_names`
--
ALTER TABLE `month_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `month_names`
--
ALTER TABLE `month_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
