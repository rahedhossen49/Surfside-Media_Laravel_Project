-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 05:00 PM
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
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `isdefault`, `created_at`, `updated_at`) VALUES
(2, 3, 'Rahed Hossen', '01975539232', 'Byzid', 'chittagong', 'chittagong', 'chittagong', 'Bangladesh', 'Chittagong', '4000', 'home', 1, '2024-11-21 07:56:35', '2024-11-21 07:56:35');

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
(21, 'Sony', 'sony', '1732034312.webp', '2024-11-19 10:38:32', '2024-11-20 06:17:37');

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
(9, 'Speaker', 'speaker', '1732034224.webp', NULL, '2024-11-19 10:37:04', '2024-11-19 10:37:04');

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
(38, '2024_11_21_125837_create_reviews_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `month_names`
--

CREATE TABLE `month_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 3, 1000.00, 0.00, 210.00, 1210.00, 'Rahed Hossen', '01975539232', 'Byzid', 'chittagong', 'chittagong', 'chittagong', 'Bangladesh', 'Chittagong', '4000', 'home', 'ordered', 0, NULL, NULL, '2024-11-21 07:56:35', '2024-11-21 07:56:35');

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
(2, 11, 2, 1000.00, 1, NULL, 0, '2024-11-21 07:56:35', '2024-11-21 07:56:35');

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
(2, 'Lenovo IdeaPad D330 10IGL Intel CDC N4020 4GB RAM 128GB eMMC 10.1 Inch HD IPS Touch Display Mineral Grey Laptop', 'lenovo-ideapad-d330-10igl-intel-cdc-n4020-4gb-ram-128gb-emmc-101-inch-hd-ips-touch-display-mineral-grey-laptop', 'Processor Type. - Intel Celeron\r\nGeneration - Celeron Series\r\nRAM - 4GB\r\nStorage - 128GB eMMC\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 10.1', 'Features of Lenovo IdeaPad D330 10IGL Laptop In Bangladesh\r\nDetails Overview for Lenovo IdeaPad D330 10 IGL Intel CDC N4020 Mineral Grey Laptop\r\nThe Lenovo IdeaPad D330 10 IGL is a 2-in-1 detachable laptop with a 10.1 inch HD (1280x800) IPS touchscreen display. It\'s powered by an Intel Celeron N4020 processor, 4GB of RAM, and 128GB of eMMC storage.\r\n\r\neMMC storage is a type of flash storage that is slower than traditional solid state drives (SSDs), but it is also more affordable.\r\n\r\nThis makes it a good option for basic tasks such as web browsing, emailing, and light productivity work. It is also relatively portable at over 1 pound for the tablet and 1.18 pounds for the keyboard dock.', 40000.00, 45000.00, 'LP-2', 'instock', 0, 4, '1731947792.webp', '1731947792-1.webp,1731947792-2.webp,1731947792-3.webp', 1, 1, '2024-11-18 10:36:33', '2024-11-19 09:10:30'),
(3, 'Lenovo IdeaPad 1 15AMN7 AMD Athlon Silver 7120U 8GB RAM, 512GB SSD 15.6 Inch FHD Display Cloud Grey Laptop', 'lenovo-ideapad-1-15amn7-amd-athlon-silver-7120u-8gb-ram-512gb-ssd-156-inch-fhd-display-cloud-grey-laptop', 'Processor Type. - AMD Athlon\r\nGeneration - Athlon Series\r\nRAM - 8GB\r\nStorage - 512GB SSD\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 15.6', 'Features of Lenovo IdeaPad 1 15AMN7 Laptop In Bangladesh\r\nThe Lenovo IdeaPad 1 15AMN7 AMD Athlon Silver 7120U is a sleek, budget-friendly laptop that brings performance and style together in a practical, user-friendly design. With an AMD Athlon Silver processor, 8GB RAM, and a 512GB SSD, this 15.6-inch FHD display laptop is ideal for daily computing tasks, from studying to entertainment and light productivity work. Its Cloud Grey finish adds a modern touch, making it perfect for those who want an affordable, reliable, and stylish machine.', 39000.00, 45000.00, 'LP-3', 'instock', 0, 2, '1731947934.webp', '1731947934-1.webp,1731947934-2.webp,1731947934-3.webp', 1, 1, '2024-11-18 10:38:55', '2024-11-19 09:09:59'),
(4, 'HP 250 G8 Intel CDC N4020 4GB RAM 1TB HDD 15.6 Inch FHD Display Dark Ash Silver Laptop', 'hp-250-g8-intel-cdc-n4020-4gb-ram-1tb-hdd-156-inch-fhd-display-dark-ash-silver-laptop', 'Processor Type. - Intel Celeron\r\nGeneration - Celeron Series\r\nRAM - 4GB\r\nStorage - 1TB HDD\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 15.6', 'Features of HP 250 G8 Laptop In Bangladesh\r\nLaptop Brand - Hp, Laptop Series - 250, Laptop Model - HP 250 G8, Processor Brand - Intel, Processor Type - Intel Celeron Dual Core, Processor Generation - Celeron Series, Processor Model - CDC N4020, Processor Base Frequency - 1.10GHz, Processor Max Turbo Frequency - 2.80GHz, Processor Core - 2, Processor Thread - 2, Processor Cache - 4MB, Display Size - 15.6 Inch, Display Technology - FHD LED Display, Panel Type - IPS, Display Resolution - 1920 x 1080, Display Surface - Anti-glare, Touch Display - No, Display Bezel - Narrow Bezel, Brightness - 250nits, Display Features - 250 Nits, 45% NTSC, Secondary Screen Size - No Secondary Screen, Secondary Screen Technology - No Secondary Screen, Secondary Screen Resolution - No Secondary Screen, Memory (RAM) - 4GB, Installed Memory Details - 1 x 4GB Removable, Memory Type - DDR4, Memory Bus (MHz) - 3200MHz, Total Memory Slot - 1, Empty Memory Slot - No, Max Memory Support - 8GB, Storage - 1TB HDD, Installed HDD Type - SATA, HDD RPM - 5400RPM, HDD Expansion Slot - No, Installed SSD Type - No SSD, SSD Expansion Slot - No, Storage Upgrade - Installed HDD Can Be Upgradeable, Optical Drive - No-ODD, Multimedia Card Slot - 1, Supported Multimedia Card - SD, SDHC, SDXC, Graphics Chipset - Intel UHD Graphics 600, Graphics Memory Accessibility - Integrated, Graphics Memory - Shared, LAN - Yes, WiFi - WLAN ac (2x2), Bluetooth - Bluetooth 5.0, USB 2 Port - No, USB 3 Port - 2 x USB 3.2 Gen 1 Type-A, USB C / Thunderbolt Port - 1 x USB Type-C, HDMI Port - 1, Micro HDMI Port - No, Mini HDMI Port - No, DP Port - No, Mini DP Port - No, D-SUB / VGA Port - No, Headphone Port - Combo, Microphone Port - Combo, Audio Properties - Stereo speakers, Speaker - Yes, Microphone - Yes, WebCam - HD camera, Keyboard Layout - Full-size keyboard with numeric keypad, Keyboard Back-lit - No, RGB Keyboard - No, Num Key pad - Yes (Numeric), Pointing Device - Touchpad, Dedicated Navigation key - No, Finger Print Sensor - No, Face Detection - No, TPM - Yes, Security Chip - Firmware TPM 2.0, Security Lock Slot - No, Battery Cell - 3 cell, Battery Capacity - 41Wh, Battery Type - Li-ion, Battery Backup (Approximate) - Up to 2.5 hour, Power Adapter - 45W, Adapter Type - AC Adapter, Operating System - Windows 11 Home, Device Lighting - No, Color - Dark Ash Silver, Dimension (W x D x H) - 357.8 x 242.1 x 19.8mm, Weight - 1.74 kg, Best For - Browsing, working on documents, and making light photo and video edits, create presentations, and enjoy music, books, movies, and more, Licensed Application - No, Warranty - 2 Year (1 year for Battery and Adapter), Warranty Claim Duration (Approximate) - Estimated Warranty Claim Duration 20 Days. It may take additional time up to 40 days, Part Number - 5C3R7PA, Country of Origin - USA, Made in / Assembled in - China, Disclaimer - Mentioned Battery Backup information is collected from manufacturer. As per manufacturer the backup time may vary for different use case, settings, applications and some other factors.', 34000.00, 39000.00, 'L-H', 'instock', 1, 2, '1732034874.jpg', '1731948145-1.webp,1731948145-2.webp,1731948145-3.webp', 1, 2, '2024-11-18 10:42:26', '2024-11-19 10:47:55'),
(5, 'HP 255 G8 AMD Ryzen 3 5300U 8GB RAM 1TB HDD 15.6 Inch FHD Display Dark Ash Silver Laptop', 'hp-255-g8-amd-ryzen-3-5300u-8gb-ram-1tb-hdd-156-inch-fhd-display-dark-ash-silver-laptop', 'Processor Type. - Ryzen 3\r\nGeneration - Ryzen\r\nRAM - 8GB\r\nStorage - 1TB HDD\r\nGraphics Memory - Shared\r\nDisplay Size (Inch) - 15.6', 'Features of HP 255 G8 Laptop In Bangladesh\r\nDetails Overview for HP 255 G8 AMD Ryzen 3 5300U 8 Dark Ash Silver Laptop\r\nThe HP 255 G8 is a versatile laptop suitable for everyday tasks. It features an AMD Ryzen 3 5300U processor, which can handle basic computing needs efficiently.\r\n\r\nWith 8GB of RAM, you can multitask between several applications without experiencing lag. The 1TB hard drive provides ample storage space for your documents, photos, and videos.\r\n\r\nThe 15.6-inch Full HD display offers crisp visuals for work and entertainment, while the dark ash silver color gives it a professional look.', 36000.00, 37000.00, 'L-H-1', 'instock', 0, 3, '1731948272.webp', '1731948272-1.webp,1731948272-2.webp,1731948272-3.webp', 1, 2, '2024-11-18 10:44:33', '2024-11-19 09:08:44'),
(10, 'Wintech Pro Box V1 BK Mini Tower Black Micro-ATX Desktop Casing', 'wintech-pro-box-v1-bk-mini-tower-black-micro-atx-desktop-casing', 'Case Type - Mini Tower\r\nOptical Drive Bay - No\r\nCooling Fan (Built-In) - No\r\nLighting Fan - LED\r\nPower Supply (Built-In) - No\r\nBack-Connect Supported - No', 'Features of Wintech Pro Box V1 BK Casing In Bangladesh\r\nThe Wintech Pro Box V1 BK Mini Tower Black Micro-ATX Desktop Casing is a stylish, durable, and compact casing designed to provide an ideal home for your Micro-ATX PC components. Whether you\'re building a gaming PC, workstation, or an office system, the Wintech Pro Box V1 offers both space efficiency and easy access to all your internal components. Its sleek black finish and sturdy construction ensure your PC build will look great and last long. Perfect for users looking for a compact solution without compromising on performance or design.', 1200.00, 1100.00, 'C-C', 'instock', 1, 1, '1732027567.webp', '1732027567-1.webp,1732027567-2.webp,1732027567-3.webp', 4, 6, '2024-11-19 08:46:08', '2024-11-19 09:11:43'),
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
(39, 'Dahua DHI-LM22-L200 22 Inch Display FHD HDMI, VGA Black Monitor', 'dahua-dhi-lm22-l200-22-inch-display-fhd-hdmi-vga-black-monitor', 'Display Size (Inch) - 22\r\nDisplay Resolution - 1920x1080\r\nPanel Type - VA\r\nRefresh Rate (Hz) - 75Hz\r\nRotatable - No\r\nHDMI Port - 1', 'Benefits & Features\r\nFull HD Resolution: Enjoy crisp and clear visuals with the Dahua DHI-LM22-L200 Resolution at 1080p.\r\nVersatile Connectivity: This monitor supports both HDMI and VGA inputs, making it easy to connect to various devices.\r\nEnergy Efficient: The Dahua LED Screen is designed to consume less power, helping you save on electricity bills.\r\nWide Viewing Angle: With a wide viewing angle, you get consistent picture quality from different positions.\r\nSlim Design: The Dahua 22 Inch Monitor has a sleek and modern look that complements any setup.\r\nBuilt-In Speakers: Equipped with built-in speakers, it’s ready for multimedia tasks without needing extra equipment.\r\nDurable Build: Made with quality materials, the Dahua DHI-LM22-L200 is built to last.\r\nEasy Setup: The Dahua DHI-LM22-L200 Setup is simple, with clear instructions for quick installation.\r\nReliable Performance: Known for its durability, this Dahua Monitor provides consistent performance over time.\r\nAffordable Price: As an Affordable 22 Inch Monitor, it offers excellent value for its features.', 8900.00, 8200.00, 'M-D', 'instock', 0, 2, '1732111463.webp', '1732111463-1.webp,1732111463-2.webp,1732111463-3.webp', 2, 15, '2024-11-20 08:04:24', '2024-11-20 08:04:24');

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
('JyadX7hZfabmsthDqIeTbGdlNPKjdAq1spKc4TOy', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidWhaQzdRYnN1VDd5M1Q4NWdlOXgzUHp5RVF6U0paYzI3RnFuYUpwbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zbGlkZS9hZGQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTczMjI5MDQ0MTt9fQ==', 1732291033),
('XMvZN1dz1w4yH8JpX0SWFrnAo6UOMp1JOf8ilBfZ', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYWVQdm02Z3JacU9TRDZxZ29OVmJOcG9RNEgyaTBRSlZweUY3MlkxcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMyMjg5NjcwO319', 1732291167);

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
(12, 'Quae qui velit sed p', 'Ipsum dolore magni t', 'Sunt vero pariatur', 'Provident sed non s', '1732290911.jpg', 1, '2024-11-22 09:55:11', '2024-11-22 09:55:11'),
(13, 'Molestiae nulla dolo', 'Sunt quas in in seq', 'Magni enim in quaera', 'Corrupti minima bea', '1732291004.webp', 1, '2024-11-22 09:56:45', '2024-11-22 09:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal','bkash','nagad') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 'cod', 'pending', '2024-11-21 07:56:35', '2024-11-21 07:56:35');

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
(3, 'Rahed hossen', 'rahedhossen75@gmail.com', '01917558212', NULL, '$2y$12$39YVu23QPMOkIyHrrGFPfeY2NXesPfirSxnvYlYUZBVXp9jC.R6WG', 'USR', NULL, '2024-11-21 07:55:42', '2024-11-21 07:56:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `month_names`
--
ALTER TABLE `month_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
