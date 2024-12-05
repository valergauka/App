-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 05 2024 г., 19:21
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lessen-app`
--
CREATE DATABASE IF NOT EXISTS `lessen-app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lessen-app`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'debitis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(2, 'in', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(3, 'eum', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(4, 'aut', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(5, 'delectus', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(6, 'qui', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(7, 'exercitationem', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(8, 'molestiae', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(9, 'dolorem', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(10, 'rerum', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(11, 'et', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(12, 'rerum', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(13, 'in', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(14, 'molestias', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(15, 'minima', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(16, 'commodi', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(17, 'dolores', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(18, 'et', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(19, 'saepe', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(20, 'voluptate', '2023-10-06 03:46:23', '2023-10-06 03:46:23');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_29_122726_create_posts_table', 1),
(6, '2023_09_29_123132_create_categories_table', 1),
(7, '2023_09_29_123219_create_tags_table', 1),
(8, '2023_09_29_123353_create_post_tag_table', 1),
(9, '2023_10_09_075320_add_column_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `likes` bigint(20) UNSIGNED DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `image`, `likes`, `is_published`, `created_at`, `updated_at`, `deleted_at`, `category_id`) VALUES
(1, 'Enim sed doloribus est et.', 'In at nulla id explicabo aut enim. Aut qui delectus a nemo et facilis.', 'https://via.placeholder.com/640x480.png/00bbaa?text=fugit', 176066, 1, '2023-10-06 03:46:23', '2023-10-06 03:46:23', NULL, 3),
(2, 'Mollitia ut ex aut vero.', 'Ipsa vel earum ut sed. Est quis molestias ullam suscipit. Qui et voluptas architecto quos soluta optio. Repudiandae consequuntur ut et qui. Impedit dolor aperiam eum modi. Aut et omnis consequatur.', 'https://via.placeholder.com/640x480.png/00dd11?text=dolorem', 20327, 1, '2023-10-06 03:46:23', '2023-10-06 03:46:23', NULL, 16),
(3, 'Beatae aut non possimus voluptas aliquid ipsam.', 'Non repellat aut labore ipsum ipsam deleniti. Ipsum animi non eligendi voluptatum at omnis. Labore ipsam quas qui facilis facere est qui. Quasi architecto eligendi sit temporibus.', 'https://via.placeholder.com/640x480.png/00dddd?text=reiciendis', 121622, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(4, 'Voluptatum laudantium repellendus laborum quidem.', 'Aut et saepe aut ipsum quos quo. Facere ut iusto vel beatae porro. Commodi aliquam cum error omnis iure qui consequatur. Sint ex necessitatibus illum voluptates quidem omnis eum.', 'https://via.placeholder.com/640x480.png/007788?text=quidem', 32588, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(5, 'Minus non reiciendis et.', 'Aut amet debitis velit suscipit provident animi. Suscipit et tempore delectus sit numquam quia. Aliquam et earum et fuga quod saepe. Id consequatur assumenda facilis et natus.', 'https://via.placeholder.com/640x480.png/0033bb?text=et', 85211, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(6, 'Enim harum sit voluptatem.', 'Voluptatem non itaque distinctio qui officia blanditiis impedit est. Voluptas adipisci amet consectetur est aut.', 'https://via.placeholder.com/640x480.png/009922?text=sit', 102849, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(7, 'Provident animi sapiente aut.', 'Error repellat veniam et quia sunt. Natus ut consequatur ea beatae. Enim natus voluptas eveniet est ut esse. Veniam veniam dolorem aut.', 'https://via.placeholder.com/640x480.png/0066cc?text=commodi', 185956, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(8, 'Fugiat odio perspiciatis corrupti.', 'Molestiae numquam eveniet voluptates quo. Qui deserunt repellendus autem voluptas possimus consectetur quae voluptatibus. Id veniam amet ut officia repudiandae dolor modi.', 'https://via.placeholder.com/640x480.png/006688?text=ducimus', 150292, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(9, 'Possimus sed possimus sapiente fugiat vero.', 'Dignissimos enim voluptatum at voluptatem alias quis. Aut sit dolorem ut vitae esse sapiente ea. Eos illo et repellendus beatae dolorem. Dolorem consequatur aspernatur reprehenderit voluptas dolorem.', 'https://via.placeholder.com/640x480.png/0000ee?text=quae', 171664, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(10, 'Eveniet tempore vel fugiat perferendis quos.', 'Quos nihil dicta cupiditate voluptas quis porro. Qui et rem suscipit aut. Eveniet explicabo nisi eum sapiente asperiores qui.', 'https://via.placeholder.com/640x480.png/008844?text=officiis', 65264, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(11, 'Quis sed eius architecto.', 'Vel architecto laudantium incidunt quasi aut a. Tempora eveniet recusandae animi ratione quibusdam. Veniam adipisci eum aut dolorem ut odio. A impedit quod sint sunt omnis nulla commodi.', 'https://via.placeholder.com/640x480.png/00bbff?text=qui', 38167, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(12, 'Ut amet earum cupiditate temporibus aliquid tempore.', 'Voluptas molestiae odit velit. Laboriosam odio officiis ipsa quia et placeat veritatis. Sit nulla ea architecto ipsa error debitis.', 'https://via.placeholder.com/640x480.png/006655?text=odit', 141723, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(13, 'Veritatis qui omnis ipsum non.', 'Voluptatibus ad est vel excepturi natus soluta voluptas. Accusantium occaecati sit et illum. Eaque velit placeat hic illum excepturi dignissimos. Quia amet quos alias quia hic ab non.', 'https://via.placeholder.com/640x480.png/00ff44?text=voluptatem', 151445, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(14, 'Sed sit impedit ullam in consequatur alias.', 'Nisi labore aperiam qui amet. Eos ut deserunt voluptatum aliquid quod repudiandae ullam ea.', 'https://via.placeholder.com/640x480.png/0011aa?text=officia', 102874, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(15, 'Quos nesciunt et magnam aliquam quis.', 'Sequi quo eveniet est ullam alias beatae. Doloribus tenetur vel cupiditate natus commodi harum. Ab pariatur eos assumenda consequatur optio quia ut. Hic aut et quidem.', 'https://via.placeholder.com/640x480.png/0077cc?text=natus', 85550, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(16, 'Quibusdam temporibus voluptatibus rerum explicabo vitae.', 'Esse possimus earum aut. Accusamus dolores quo doloremque odio totam sunt est. Soluta autem itaque est qui accusamus. Voluptatem mollitia dicta asperiores dolor aut.', 'https://via.placeholder.com/640x480.png/003355?text=voluptatibus', 191623, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(17, 'Est est ut non ratione.', 'Est qui quae voluptatibus error assumenda et libero. Quos dolores quasi assumenda. Magnam adipisci repellendus voluptatem architecto accusantium. Velit reprehenderit quasi occaecati in fugit.', 'https://via.placeholder.com/640x480.png/002222?text=amet', 57973, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(18, 'Vitae quia et est a.', 'Earum consectetur cumque molestiae praesentium aliquam qui amet id. Sed tempora ratione quasi aut. Error error explicabo dolor amet quo.', 'https://via.placeholder.com/640x480.png/0088ff?text=eveniet', 189552, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(19, 'Rerum sed sed esse nisi amet reiciendis.', 'Qui nihil explicabo odit sit. Quia et ex ut saepe eum. Et ut dolorem modi vero qui et ab aut. Atque reiciendis aliquam laboriosam itaque cumque. Voluptas illum et et minus quisquam dolor vel.', 'https://via.placeholder.com/640x480.png/0033dd?text=maxime', 66827, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(20, 'Vel totam itaque officiis.', 'Voluptatem ea necessitatibus enim rerum totam quidem. Dolorem dolore dolore suscipit voluptatem ea voluptatem vel ut. Possimus rerum voluptatum ea est ratione accusamus.', 'https://via.placeholder.com/640x480.png/0066bb?text=sunt', 181534, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(21, 'Commodi in et libero minus expedita error.', 'Quisquam qui exercitationem veniam eveniet. Voluptas debitis sunt libero. Deserunt expedita beatae aut eos ipsum iusto. Voluptatum laborum et ratione accusantium rerum natus.', 'https://via.placeholder.com/640x480.png/00ff22?text=occaecati', 83153, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(22, 'Rem omnis ut quo ipsa.', 'Autem quidem qui suscipit ex aut. Ut voluptates sit possimus et repudiandae porro quos voluptatem. Perspiciatis culpa aut ut. Unde quisquam quia nam et.', 'https://via.placeholder.com/640x480.png/00aa88?text=ut', 89364, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(23, 'Maxime ipsum sint nostrum repellendus.', 'Voluptatem qui ut hic iure ratione animi. Reprehenderit accusantium ipsam in error architecto tenetur. Enim qui laborum ut saepe.', 'https://via.placeholder.com/640x480.png/008844?text=tempora', 193951, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(24, 'Rerum voluptatibus maiores et quis veritatis.', 'Repellendus esse velit quia voluptas ut. Soluta voluptas sint eos consequatur quis sunt tempora rerum. Ullam temporibus quo veniam et. Et possimus id ut aliquid quia ut sunt.', 'https://via.placeholder.com/640x480.png/0055bb?text=architecto', 76115, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(25, 'Et aut qui cupiditate totam dolorum numquam.', 'Id deleniti et tempora consequuntur. Suscipit amet in a qui molestiae cupiditate qui dolorem. Cum nihil magni vero dolores. Sit nobis et quod sed voluptates omnis eveniet.', 'https://via.placeholder.com/640x480.png/0066aa?text=sint', 49783, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(26, 'Ad nulla earum voluptates nostrum.', 'Culpa ut rerum mollitia nam quia nobis nihil. Unde nam nam aut autem est voluptatem tenetur. Iure iusto cupiditate porro voluptatem. Suscipit ea reprehenderit illo molestiae.', 'https://via.placeholder.com/640x480.png/0022dd?text=nihil', 69575, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(27, 'Molestiae voluptas laboriosam eum repudiandae.', 'Rem et sint similique similique eveniet doloremque. Nulla doloremque quos similique laborum nobis dolorem architecto. Dicta sunt sapiente voluptas.', 'https://via.placeholder.com/640x480.png/0099dd?text=eum', 127498, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(28, 'Ipsum deleniti assumenda rerum neque.', 'Tempore nobis cupiditate dolor ad nihil debitis. Illo consectetur possimus ab quia odit sit vel.', 'https://via.placeholder.com/640x480.png/002277?text=voluptatibus', 43037, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(29, 'Repellat voluptas eligendi placeat.', 'Nihil libero repellendus modi. Atque tempora doloribus vel perferendis quas est quo quisquam.', 'https://via.placeholder.com/640x480.png/0033cc?text=velit', 26287, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(30, 'Molestias eius non suscipit.', 'Occaecati necessitatibus minima eaque blanditiis libero. Ipsam dolor voluptatem dicta neque sequi et.', 'https://via.placeholder.com/640x480.png/0099dd?text=recusandae', 109129, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(31, 'Placeat laborum enim unde distinctio.', 'Soluta est fugiat eum fugiat nesciunt. Repellendus officia voluptatem est possimus illo. Rerum id sunt et vero necessitatibus sequi.', 'https://via.placeholder.com/640x480.png/0066dd?text=reiciendis', 123945, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(32, 'Quo rerum dolore molestiae vel exercitationem.', 'Quis quam voluptate vel omnis voluptates beatae laudantium. Est qui exercitationem excepturi aspernatur dolores nihil qui. Provident suscipit soluta dolores id voluptatibus ducimus.', 'https://via.placeholder.com/640x480.png/005577?text=quam', 31931, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(33, 'Quod magni ut porro eos quo.', 'Sapiente quia perferendis consequatur porro in voluptates vel. Voluptas deleniti sed voluptatem quos ipsam delectus. Ut assumenda odio aliquid autem vel.', 'https://via.placeholder.com/640x480.png/007700?text=sunt', 103936, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(34, 'Veritatis et delectus aut.', 'Aspernatur ratione labore et quae. Dolore ducimus accusantium iure deleniti magni. Sapiente repellat eos nihil quod illum in fugiat placeat.', 'https://via.placeholder.com/640x480.png/0099ff?text=dolorum', 60412, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(35, 'Ipsam ipsum dolor minus.', 'Voluptates quis atque eos consequatur quia et. Cumque velit quia omnis sunt. Esse voluptates sint voluptate et magni error.', 'https://via.placeholder.com/640x480.png/00aa88?text=iusto', 15217, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(36, 'Amet vel libero earum nisi voluptatem.', 'Repellendus ipsum aut voluptas delectus et vitae quisquam. Et sequi consectetur adipisci sint eos dicta. Dignissimos corporis non iure doloremque.', 'https://via.placeholder.com/640x480.png/00eecc?text=fugiat', 128611, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(37, 'Eveniet expedita placeat et.', 'Vel culpa quis fuga quia omnis sint voluptatibus dicta. Sed aut aut architecto doloribus sunt sunt. Voluptas libero rem voluptatem aut ad rem eligendi dicta.', 'https://via.placeholder.com/640x480.png/0077aa?text=qui', 11216, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(38, 'Aut pariatur et aut occaecati.', 'Sit temporibus nemo et minima minima. Numquam ipsum earum qui aut dicta quo. Voluptates repellat perferendis ut maiores omnis voluptatem cumque. Et inventore vel et nisi mollitia.', 'https://via.placeholder.com/640x480.png/0033dd?text=aut', 120126, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(39, 'Nobis ea aut quia est unde sunt.', 'In est ut esse. Ut et quibusdam optio sint inventore accusamus. Assumenda rem labore sed est nesciunt deserunt qui. Rem delectus reprehenderit ratione et.', 'https://via.placeholder.com/640x480.png/004400?text=ut', 173023, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(40, 'Aut rerum deleniti atque nulla dolore eos.', 'Molestiae sint fugit et qui quasi ipsa incidunt. Ipsum dolores quibusdam reiciendis est neque aut occaecati eveniet. Consequatur vel dolore ut officia accusamus. Autem laboriosam et perferendis non.', 'https://via.placeholder.com/640x480.png/009911?text=nulla', 17972, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(41, 'Odio quod sit saepe harum.', 'Aperiam mollitia mollitia earum dolores unde. Expedita quia quisquam quia quidem tempore fugit voluptatum. Laborum et ut fuga.', 'https://via.placeholder.com/640x480.png/0077dd?text=est', 57632, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(42, 'Minus architecto vel rerum beatae ut aut.', 'Quidem unde rerum necessitatibus quia nostrum quisquam. Illum eveniet quidem delectus iure. Velit voluptatem quam officiis tenetur. Ut sint animi explicabo qui consequuntur enim illo.', 'https://via.placeholder.com/640x480.png/008899?text=soluta', 196386, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(43, 'Veritatis molestias ut nesciunt inventore recusandae.', 'Maiores possimus reprehenderit quia voluptas earum dolorem soluta. Ipsam est aliquam magni veniam dolor. Sint accusamus qui qui et accusantium molestiae.', 'https://via.placeholder.com/640x480.png/00aaff?text=soluta', 106795, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(44, 'Sit facere illo voluptatem.', 'Veniam recusandae aliquam cum. Provident adipisci qui assumenda eligendi in. Nihil est illo autem quia optio ullam at.', 'https://via.placeholder.com/640x480.png/004444?text=aut', 104100, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(45, 'Et ullam fugit accusamus cupiditate enim.', 'Officia quia numquam quod magni quos ut. Nam pariatur fugiat voluptatibus iusto corporis voluptatem. Enim consequuntur non nobis est.', 'https://via.placeholder.com/640x480.png/00ccee?text=eveniet', 85686, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(46, 'Nobis in ipsum quisquam qui nam animi.', 'Quas veritatis in sed aliquam a nesciunt enim sit. Quo quas dolor accusantium et. Quis ut pariatur libero voluptas. Exercitationem aut rem odit voluptas rerum et.', 'https://via.placeholder.com/640x480.png/00ccee?text=rerum', 77097, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(47, 'Iste porro officia distinctio autem tempore voluptate.', 'Ipsa sint deserunt id incidunt. Consequuntur eos eum porro repudiandae. Et quidem voluptas deserunt iste. Eligendi enim omnis veritatis similique reprehenderit beatae ut.', 'https://via.placeholder.com/640x480.png/001155?text=molestias', 161677, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(48, 'Odio ipsam voluptatem laborum architecto autem modi.', 'Dolores quibusdam qui quam dolorem eligendi totam id. Nisi sed consectetur eos. Eaque quo a quis et. Possimus sunt aut fuga rerum dolores voluptatum distinctio quasi.', 'https://via.placeholder.com/640x480.png/00dd77?text=ea', 104663, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(49, 'Dolores quos qui corporis in ut natus.', 'Unde laboriosam molestiae quis iste porro. Sapiente accusamus sed dolorum ratione ut illum dolores. Maiores commodi laudantium alias ad dolores deserunt. Odio quasi ut iusto voluptatibus aut.', 'https://via.placeholder.com/640x480.png/00ddbb?text=vel', 79685, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(50, 'Aut aut cupiditate optio officiis minima.', 'Sed consequatur facilis blanditiis perferendis mollitia est. Sit vel odio qui doloremque voluptatum corporis. Alias error et aut assumenda placeat.', 'https://via.placeholder.com/640x480.png/0088aa?text=iure', 98542, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(51, 'Eum distinctio in officia iste.', 'Libero repellat atque reiciendis vel vero hic. Beatae dolorum quos nam consectetur qui numquam.', 'https://via.placeholder.com/640x480.png/0022ff?text=minus', 21832, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(52, 'Quia ducimus aut dolor.', 'In dolorum illum quae omnis dolore facilis qui dolor. Perferendis id impedit unde error ipsam. Minus rem assumenda dolores sit recusandae voluptatem. Libero est amet iure nesciunt.', 'https://via.placeholder.com/640x480.png/0088dd?text=voluptas', 120906, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(53, 'Ut aliquid laudantium voluptate dolorem quas.', 'Earum autem aperiam nostrum voluptas corporis at asperiores. Sit qui maiores voluptatem vel voluptates omnis est necessitatibus. Dolor omnis impedit quo quia inventore.', 'https://via.placeholder.com/640x480.png/000088?text=quod', 165498, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(54, 'Praesentium cupiditate ab velit harum sunt nisi.', 'Sit quam nesciunt dolore temporibus quam. Quia animi sint vero rerum qui fuga est.', 'https://via.placeholder.com/640x480.png/00aacc?text=blanditiis', 175742, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(55, 'Ut laborum doloremque sint dignissimos et.', 'Quae cum totam magni iusto quos maxime. Rerum deserunt architecto tempore rerum consequuntur sint. Quae nemo ex perferendis qui aut in voluptatum.', 'https://via.placeholder.com/640x480.png/0099dd?text=sequi', 84229, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(56, 'Recusandae excepturi voluptas veniam maiores tempora.', 'Libero voluptas rem velit ab. Quis ut atque perferendis porro. Ullam ratione illo numquam. Quaerat maiores assumenda ad.', 'https://via.placeholder.com/640x480.png/003311?text=ut', 183280, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(57, 'Nisi est temporibus praesentium rerum sint.', 'At sit voluptatem ipsa est. Sunt ut quia id aperiam. Qui ut non et dicta qui minima. Beatae similique atque placeat id eum sed.', 'https://via.placeholder.com/640x480.png/00ff11?text=porro', 31258, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(58, 'Deserunt suscipit perferendis sequi esse.', 'Laudantium nulla impedit sit fugiat. Quis sit in dignissimos laboriosam repudiandae recusandae excepturi nam. Sint repellendus incidunt consequuntur pariatur atque.', 'https://via.placeholder.com/640x480.png/0000dd?text=inventore', 78392, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(59, 'Facere beatae quia delectus nihil hic.', 'Sit qui in perferendis necessitatibus reiciendis qui. Dolores repudiandae maxime quos aliquid excepturi soluta. Et libero fuga dignissimos exercitationem dolor.', 'https://via.placeholder.com/640x480.png/00ffee?text=ipsam', 28697, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(60, 'Distinctio quae possimus qui iste deleniti maxime.', 'Rem assumenda est soluta facilis rem dignissimos quis minus. Eum repudiandae quibusdam ea beatae ut consequatur. Quaerat quos aut at recusandae autem. Id quos aut omnis.', 'https://via.placeholder.com/640x480.png/00ccee?text=voluptatem', 28025, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(61, 'Ipsam corrupti expedita perferendis.', 'Sint ad consequatur libero iusto doloribus nisi deserunt aut. Eos et ad cum et illum quisquam labore. Quia molestias ut placeat qui.', 'https://via.placeholder.com/640x480.png/007744?text=mollitia', 142851, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(62, 'Nulla sunt dignissimos tempore mollitia quia sequi.', 'Quia vitae sequi ipsam. Alias est maiores maiores qui laborum quibusdam sed quam. Praesentium nisi qui iusto architecto nulla quas porro.', 'https://via.placeholder.com/640x480.png/000000?text=omnis', 29631, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(63, 'Ullam commodi iure asperiores.', 'Non facere repudiandae eius et et omnis. Autem rerum delectus unde occaecati iste sit. Itaque consequatur tempora natus et.', 'https://via.placeholder.com/640x480.png/004499?text=odit', 25409, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(64, 'Aut rerum totam maxime quod.', 'Ex unde optio molestiae quia. Autem ducimus commodi qui quod illo qui voluptatibus. Ullam id asperiores excepturi ipsam dolorem minima explicabo.', 'https://via.placeholder.com/640x480.png/00dd33?text=aut', 91194, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(65, 'Dolores dolorum voluptatem dolorum et laborum beatae.', 'Vel fuga quam numquam aut nemo consequuntur. Qui quia et pariatur eos reiciendis voluptatibus blanditiis. Ratione ut omnis sed magnam numquam magnam maxime quos. Debitis fugiat aut eveniet culpa.', 'https://via.placeholder.com/640x480.png/004477?text=et', 96513, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(66, 'Sit molestiae ratione quidem.', 'Odio adipisci delectus excepturi autem autem earum magnam ut. Quis qui necessitatibus qui molestiae ducimus itaque. Illum omnis voluptas perferendis quis.', 'https://via.placeholder.com/640x480.png/00aacc?text=velit', 24721, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(67, 'Eveniet non nostrum quaerat laborum minima.', 'Aut nam laboriosam et at veritatis excepturi et. Est non est corrupti culpa praesentium laborum. Fuga veritatis quos officiis commodi. Sed fuga amet maiores dolorem aliquid nihil iure.', 'https://via.placeholder.com/640x480.png/004455?text=quisquam', 3833, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(68, 'Dolorem sequi facilis aspernatur magni et ipsa.', 'Voluptatem explicabo voluptatum non veniam voluptatum. Et maiores facilis magnam blanditiis rem. Similique ut veritatis similique voluptate debitis est.', 'https://via.placeholder.com/640x480.png/00ccdd?text=qui', 119690, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(69, 'Ipsum ut nulla iure facere quaerat aut.', 'Eos occaecati impedit corporis aliquid ipsa architecto. Modi molestiae qui debitis ea.', 'https://via.placeholder.com/640x480.png/003399?text=veniam', 71943, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(70, 'Tempora rerum quaerat aut ea rerum.', 'Similique ipsum veniam veritatis. Deserunt quia sequi nihil. Placeat quibusdam voluptatum et perspiciatis voluptatibus et.', 'https://via.placeholder.com/640x480.png/007711?text=nulla', 104812, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(71, 'Explicabo velit aut quidem quia occaecati.', 'Accusamus dolores eos voluptas nostrum quia exercitationem. Quia quis quia numquam qui. Est illum recusandae repudiandae iste.', 'https://via.placeholder.com/640x480.png/001199?text=vero', 49612, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(72, 'Dolor esse adipisci omnis qui aut.', 'Ratione eaque sequi dicta ipsum possimus. Quia qui voluptas eum sit repellat est. Esse vel quia eaque. Maxime officiis nam optio rerum.', 'https://via.placeholder.com/640x480.png/00cc77?text=odio', 117336, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(73, 'Cum reiciendis suscipit velit.', 'Aperiam est nisi ut rerum dignissimos facere. Adipisci aut sint officiis maxime corporis occaecati cumque. Enim quia exercitationem voluptas et aut et.', 'https://via.placeholder.com/640x480.png/005577?text=modi', 45881, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(74, 'Amet odio quia in dicta ut dolorum.', 'Distinctio neque soluta architecto est rerum tenetur facere illo. Mollitia totam in dolores eum aut impedit aut soluta. Eum repellat quia commodi accusantium suscipit. Unde quae eveniet labore odio.', 'https://via.placeholder.com/640x480.png/00aa44?text=consequatur', 192197, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(75, 'Numquam molestiae molestiae similique asperiores ut.', 'Quis et veniam et molestiae aperiam et. Alias ea molestias sed est accusamus adipisci.', 'https://via.placeholder.com/640x480.png/0055ee?text=ducimus', 129872, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(76, 'Sint tempore ea rerum.', 'Nesciunt dolorem voluptate sequi consequatur et aut ut. Quia reiciendis magnam occaecati aspernatur qui nesciunt. Error porro impedit non.', 'https://via.placeholder.com/640x480.png/007700?text=necessitatibus', 145740, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(77, 'Nemo nam similique omnis.', 'Nihil dignissimos molestias quam aut sit porro quaerat. Commodi magnam beatae eos non libero. Et occaecati itaque deleniti excepturi illo est.', 'https://via.placeholder.com/640x480.png/00bb44?text=consequuntur', 196463, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(78, 'Voluptas ipsam consequatur quisquam ea perspiciatis repellendus.', 'Illum vel omnis atque expedita illo tempore repudiandae est. Facere tenetur recusandae est animi consectetur voluptas voluptates. Id aut et expedita qui. Officiis temporibus laborum ex rerum ut.', 'https://via.placeholder.com/640x480.png/00bb77?text=iusto', 84423, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(79, 'Et rerum minima error.', 'Deserunt quis excepturi numquam ex architecto modi provident. Consectetur laborum dicta quos ea adipisci voluptates ducimus aut. Voluptatum aliquam sequi quod temporibus.', 'https://via.placeholder.com/640x480.png/00dd66?text=odio', 11753, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(80, 'Et quas ad in beatae reiciendis.', 'Fugit adipisci exercitationem consequatur quia vero laboriosam mollitia ut. Illo perferendis eos corporis dolor cum corporis. Sequi quasi dolorem debitis magni cumque eum iure.', 'https://via.placeholder.com/640x480.png/004433?text=qui', 156370, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(81, 'Sequi et ab doloremque non velit.', 'Et nobis delectus dolorum non est. Eum maxime maiores natus.', 'https://via.placeholder.com/640x480.png/005599?text=doloribus', 103439, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(82, 'Commodi corrupti dolore aliquid qui.', 'Tempore nam praesentium qui in placeat. Voluptates et voluptatibus modi. Rerum ut qui distinctio et aut dolores. Vitae molestias maxime maxime aliquid quas et. Quia nulla natus ut sequi rerum omnis.', 'https://via.placeholder.com/640x480.png/003377?text=suscipit', 58004, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(83, 'Eveniet sunt eos tenetur et.', 'Mollitia nam voluptas ducimus eveniet. Rem aut natus eum possimus. Ratione accusantium culpa neque quis eius commodi. Doloremque ut facere maiores nostrum doloribus.', 'https://via.placeholder.com/640x480.png/00ee66?text=nemo', 35522, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(84, 'Iusto explicabo voluptas temporibus iste amet ipsam.', 'Inventore et voluptas excepturi nulla. Optio quae magnam aut officia molestiae. Voluptatem dolore iusto exercitationem voluptas. Aut minus sint eum. Est et aut temporibus tenetur.', 'https://via.placeholder.com/640x480.png/00ff22?text=reiciendis', 11497, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(85, 'Voluptatum pariatur magni minima.', 'Sint quia eum sed quas. Vel et quia omnis delectus commodi. Impedit est vero nihil reiciendis. Mollitia repellat vel sint inventore veritatis non magnam.', 'https://via.placeholder.com/640x480.png/0000ee?text=consectetur', 73275, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(86, 'Aut voluptas suscipit aut a.', 'Tenetur non quae aut maxime qui perspiciatis. Eveniet quos qui neque et. Qui in aut qui ipsum. Aut sit inventore exercitationem.', 'https://via.placeholder.com/640x480.png/00cc33?text=tempora', 180397, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(87, 'Et et ut sequi dolorem quam.', 'Quae possimus asperiores deleniti itaque nihil sapiente fugit. Ea aut nobis minus optio veritatis. Aperiam repellendus illo sit repellendus impedit deserunt nesciunt sequi.', 'https://via.placeholder.com/640x480.png/00aa55?text=id', 95337, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(88, 'Tenetur eaque reiciendis ea aut autem.', 'Quidem odit mollitia tempore nesciunt ut. Et dolores sequi iusto quidem. Iure est et et sequi et voluptate. Voluptate dolores molestiae dolorem quisquam corrupti.', 'https://via.placeholder.com/640x480.png/003388?text=excepturi', 11155, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(89, 'Cumque pariatur earum dolores et quisquam.', 'Repudiandae in voluptatem consequuntur corporis iste recusandae nesciunt. Aliquam nulla voluptatum maxime quis quibusdam reiciendis. Laborum et ex assumenda adipisci ab expedita.', 'https://via.placeholder.com/640x480.png/006699?text=eligendi', 76367, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(90, 'Laborum rerum consequatur voluptas sed corporis.', 'Ut est facilis numquam quisquam est reprehenderit omnis. Quibusdam architecto quia autem aut aut doloribus non.', 'https://via.placeholder.com/640x480.png/0088aa?text=culpa', 8497, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(91, 'Voluptates distinctio odio nesciunt.', 'Occaecati voluptas eum eligendi rerum totam officiis. Porro deleniti perferendis modi unde. Voluptatem provident laboriosam ut ducimus vel molestiae.', 'https://via.placeholder.com/640x480.png/008822?text=quibusdam', 33274, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(92, 'Sunt aliquam voluptatem qui.', 'Aspernatur vitae accusamus eum culpa voluptates et tempora dolorem. Eos eum voluptates repudiandae ut eos. Sed et vel alias. Reprehenderit quos iusto sequi dolores quia eum.', 'https://via.placeholder.com/640x480.png/005500?text=dolores', 199917, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(93, 'Non omnis modi optio.', 'Illum enim ad non ut et aliquid. Vero laborum similique autem aut voluptatem error. Molestiae quo eos et aliquam. Nobis repudiandae ut quia facilis qui sit dolorem.', 'https://via.placeholder.com/640x480.png/00ee22?text=aut', 100313, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(94, 'Dolor quasi est molestiae vel eum.', 'Rerum deserunt omnis sit vel quidem debitis magnam iste. Saepe ut iste nesciunt et veniam optio et. Autem quis dicta aliquid nesciunt.', 'https://via.placeholder.com/640x480.png/003300?text=nisi', 191438, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(95, 'Ut non aspernatur numquam cupiditate iste iste.', 'Optio sequi accusantium sunt quasi iusto voluptas. Architecto voluptas quis id non ab vel. Molestiae sit esse voluptas. Totam magni repellat qui quidem qui.', 'https://via.placeholder.com/640x480.png/006677?text=aut', 143806, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(96, 'Quos asperiores et distinctio.', 'Enim iure ut voluptate dolorem. Similique amet culpa animi sunt recusandae ducimus aut consectetur. Quo qui culpa sequi eius mollitia provident.', 'https://via.placeholder.com/640x480.png/0088bb?text=rem', 26423, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(97, 'Eos expedita totam ut corrupti.', 'Ea est ad eaque et. Error quasi at ab libero. Voluptatibus ab enim soluta esse est.', 'https://via.placeholder.com/640x480.png/00dddd?text=quos', 45273, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(98, 'Voluptas molestias quis quia quod velit.', 'Et eum et dolore quisquam voluptas nesciunt et. Explicabo itaque et maiores similique qui sed.', 'https://via.placeholder.com/640x480.png/008855?text=vero', 90741, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(99, 'Sit aliquam ducimus at occaecati est asperiores.', 'Quo ipsum quos aspernatur dignissimos minus aut voluptate. Laudantium molestiae sed architecto ut minima. Et asperiores sed voluptatum nihil.', 'https://via.placeholder.com/640x480.png/00ff88?text=quia', 82729, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(100, 'Sit soluta temporibus voluptatum odit similique a.', 'Et saepe impedit voluptates ex sunt saepe. Qui illum quas nisi dolor. Ipsum magnam architecto et delectus officia ut sed nemo. Voluptas placeat facere quas doloribus ratione dolor.', 'https://via.placeholder.com/640x480.png/00dd44?text=ut', 39905, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(101, 'Non exercitationem iste eligendi laborum voluptatibus.', 'Nesciunt nulla voluptatibus ea eos in. Accusantium natus praesentium ratione dolores excepturi quia. Id sit hic illo doloribus.', 'https://via.placeholder.com/640x480.png/00cc99?text=quod', 31644, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(102, 'Occaecati nemo veritatis saepe et voluptates delectus.', 'Eum ut consectetur deserunt eos non praesentium. Quia consectetur quos eius alias dolor. Aut ut voluptate unde quia assumenda quam.', 'https://via.placeholder.com/640x480.png/0077aa?text=est', 131161, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(103, 'Quibusdam nobis et vel.', 'Sunt corporis dolores optio dolore sunt hic sit. Doloremque ullam quos doloribus ipsa. Iure aut sint doloribus magnam.', 'https://via.placeholder.com/640x480.png/00ee22?text=necessitatibus', 93267, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(104, 'Provident et nisi voluptatibus.', 'Excepturi ipsam nobis amet dolor et odit. Corporis consequatur magnam quo sunt optio. Cumque maxime voluptatem enim et corporis est beatae cum.', 'https://via.placeholder.com/640x480.png/00bb33?text=excepturi', 37002, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(105, 'Sed facere dolorum cupiditate est earum.', 'Maxime minus et sed totam qui quae hic. Soluta ut et eaque dolorum. Omnis ipsum voluptates rem.', 'https://via.placeholder.com/640x480.png/00aa66?text=deserunt', 109722, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(106, 'Sit quia ea voluptatem id placeat.', 'Vero est cupiditate inventore autem et voluptas facere. Id magnam sint harum ipsa ad et alias. Delectus odio aliquam et non ipsa corrupti.', 'https://via.placeholder.com/640x480.png/000088?text=sint', 155718, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(107, 'Ab ab accusamus nihil excepturi sed quas.', 'Veniam alias illo velit ea repellendus. Quod nostrum ratione sed et soluta. Aspernatur delectus animi facilis id perspiciatis porro.', 'https://via.placeholder.com/640x480.png/00eebb?text=distinctio', 189209, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(108, 'Quis optio placeat voluptas aut.', 'Officia enim iste laudantium veritatis mollitia non. Adipisci reiciendis fugit libero aspernatur inventore provident. Adipisci aut velit neque saepe iusto. Et asperiores fugit voluptas eaque ut iste.', 'https://via.placeholder.com/640x480.png/0088ff?text=molestias', 194973, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(109, 'Omnis officiis esse aspernatur perferendis molestiae alias.', 'Vitae perspiciatis nulla perspiciatis laborum aliquam id. Dolores voluptate quis aut nostrum. Blanditiis reprehenderit alias autem voluptas reprehenderit corrupti non et. Sed labore quam odio.', 'https://via.placeholder.com/640x480.png/00ff66?text=architecto', 152346, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(110, 'Nisi voluptates ipsa consequatur.', 'Voluptates harum doloribus voluptatem et voluptas delectus velit. Sed saepe tenetur et et. Repellat delectus adipisci qui et et. Hic ut perferendis omnis molestias ab ipsa.', 'https://via.placeholder.com/640x480.png/00ee77?text=tempore', 109338, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(111, 'Id enim deserunt iure.', 'Repellat assumenda repellendus vitae distinctio et distinctio ut ipsum. Eos dignissimos ut nisi qui qui.', 'https://via.placeholder.com/640x480.png/0055ee?text=optio', 48950, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(112, 'Dolore a eos et.', 'Molestiae laborum dolorem quos unde iste sit. Asperiores et voluptatem cumque omnis necessitatibus. Aut minus incidunt ut dolor atque autem deleniti.', 'https://via.placeholder.com/640x480.png/001199?text=quos', 191539, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(113, 'Omnis ea quia ea.', 'Consequatur quasi similique perferendis ut et eos labore. Quas laudantium doloremque debitis deleniti repellendus. Eum non ut sit. Ab fugiat dolor voluptatibus odit.', 'https://via.placeholder.com/640x480.png/00aa55?text=fuga', 151950, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(114, 'Et consequatur hic in quidem.', 'Cupiditate molestias perspiciatis sit in dolores. Assumenda voluptatem iure ipsum exercitationem harum. Ea dolorum animi ipsam ea qui id dolore.', 'https://via.placeholder.com/640x480.png/0055ff?text=fugiat', 186852, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(115, 'Molestiae officia fugiat pariatur quis.', 'Harum qui iste excepturi iusto molestiae doloribus. Et cupiditate aut laborum. Vero temporibus velit fugiat eos assumenda. At voluptas voluptates doloremque voluptates totam saepe enim.', 'https://via.placeholder.com/640x480.png/00dd66?text=explicabo', 72040, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(116, 'Dolores delectus est fuga ad.', 'Eum sapiente ipsam quam provident facere. Error blanditiis aliquid exercitationem consequatur est quo. Minus expedita ad et quod harum. Suscipit doloremque aliquam natus.', 'https://via.placeholder.com/640x480.png/00ee55?text=laborum', 41707, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(117, 'Labore nulla libero sequi ea.', 'Porro eligendi aut reprehenderit amet aut corrupti. Quo soluta aperiam rem hic suscipit architecto perspiciatis. Doloremque et dolor maiores laboriosam vitae perferendis.', 'https://via.placeholder.com/640x480.png/00ee11?text=voluptas', 175460, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(118, 'Sit minus quae velit voluptas dolore.', 'Aliquid voluptas eligendi quia. Impedit autem ab occaecati odit ratione et beatae. Aut labore facilis dicta possimus sed. Odit iure molestias asperiores quia.', 'https://via.placeholder.com/640x480.png/00bbbb?text=voluptatem', 37012, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(119, 'Eaque unde veniam molestiae quasi officia est.', 'Architecto odit autem aut voluptatem laboriosam non incidunt iure. Quasi beatae nostrum ullam qui autem. Aut harum rerum quidem adipisci fuga eum nostrum.', 'https://via.placeholder.com/640x480.png/0055aa?text=dolor', 119430, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(120, 'Fugiat ipsam perferendis et laborum tempora.', 'Quia veritatis cupiditate quis officia ut. Culpa iusto voluptas quae rerum. Et a ea autem aperiam dolores reprehenderit. Libero animi totam beatae aliquid.', 'https://via.placeholder.com/640x480.png/0055ff?text=ut', 70899, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(121, 'Animi eum recusandae et aut est animi.', 'Maiores qui a delectus molestiae unde repellat. Eligendi animi vel voluptatibus. Ut molestias aut quia optio qui.', 'https://via.placeholder.com/640x480.png/00ff88?text=qui', 37921, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(122, 'Veritatis voluptas ut asperiores praesentium.', 'Et aliquid nulla sunt ut nihil ab. Corrupti quo possimus assumenda dolor. Quia laborum id omnis reprehenderit eligendi.', 'https://via.placeholder.com/640x480.png/00ee55?text=debitis', 8377, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(123, 'At rerum iure dicta.', 'Doloremque beatae aut eos aut dolor. Nisi ut rerum eos. Eaque enim dignissimos itaque sint doloremque minus.', 'https://via.placeholder.com/640x480.png/00aa77?text=quidem', 45708, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(124, 'Dolor itaque id laborum.', 'Porro recusandae dolor nisi laudantium rem. Rerum dolor quis ut consequatur sit hic ullam. Dolores expedita et quisquam libero non. Nulla voluptate voluptatem eligendi sit.', 'https://via.placeholder.com/640x480.png/0066ee?text=laboriosam', 134103, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(125, 'Ipsam corrupti voluptatem et voluptatem.', 'Odit omnis corrupti quisquam. Quo quaerat consectetur aut aperiam. Et pariatur iusto quia rerum reiciendis ut amet doloribus.', 'https://via.placeholder.com/640x480.png/00dd44?text=omnis', 159273, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(126, 'Totam labore nam et a voluptates.', 'Ratione qui et inventore minus. Accusantium nobis porro autem quidem distinctio et. Eaque a exercitationem mollitia fuga.', 'https://via.placeholder.com/640x480.png/0088aa?text=vero', 94921, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(127, 'Natus itaque nesciunt aliquid odit minus voluptas.', 'Ut est et eum assumenda. Error autem voluptates mollitia veritatis sit nisi facere. Quaerat amet amet excepturi vel voluptates temporibus iusto ea.', 'https://via.placeholder.com/640x480.png/008899?text=sit', 64924, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(128, 'Occaecati voluptatem laboriosam minima incidunt.', 'Aut et beatae aliquid. Eos nobis quae officiis quas quibusdam rerum. Nulla recusandae dolor temporibus. Et qui quidem fugiat ut voluptates quos fugit quo.', 'https://via.placeholder.com/640x480.png/009966?text=omnis', 148434, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(129, 'Fuga molestiae blanditiis laborum.', 'Et et sunt recusandae perspiciatis iure ut sed. Velit debitis voluptatibus nemo. Id voluptatem nemo nihil suscipit aspernatur suscipit rerum. Fuga autem et eum libero et sunt possimus.', 'https://via.placeholder.com/640x480.png/00ddff?text=accusantium', 109307, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(130, 'Sit rem beatae ad aspernatur voluptatem doloribus.', 'Voluptatem inventore voluptas tempora dolore. Cum nobis et nam. Itaque et pariatur ipsum et molestiae est dolores.', 'https://via.placeholder.com/640x480.png/0088dd?text=ut', 190139, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(131, 'Qui beatae qui quod.', 'Id accusamus labore quis voluptatem. Assumenda alias et temporibus. Error nisi ex magni laborum. Modi est error quam quia expedita.', 'https://via.placeholder.com/640x480.png/00ff66?text=est', 196811, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(132, 'Pariatur ut iste molestias laborum quidem minima.', 'Autem harum consequatur qui eum qui aliquid rem. Sed labore voluptatem voluptatem consequatur accusamus voluptatem. Minus animi iusto illum doloribus iure aut saepe. Sed ullam est dolorem dolorem.', 'https://via.placeholder.com/640x480.png/002211?text=dolor', 149841, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(133, 'Quam quia consequuntur enim dolores.', 'Libero est ducimus voluptas officiis. Et rerum amet non sint qui provident. Rerum sunt autem consequuntur molestiae aut.', 'https://via.placeholder.com/640x480.png/006611?text=aspernatur', 190539, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(134, 'Rerum facilis maiores est quia.', 'Nostrum enim commodi nobis similique facilis. Veritatis laborum aliquam consequatur sunt. Dolores iusto cupiditate nulla quasi vel recusandae.', 'https://via.placeholder.com/640x480.png/006600?text=est', 84289, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(135, 'Esse dolorum alias culpa consequuntur.', 'Harum veritatis ipsa eum non. Eius laboriosam commodi illum tempore voluptas omnis accusamus velit. Amet error et deleniti voluptas ea non.', 'https://via.placeholder.com/640x480.png/00dd44?text=dolor', 2285, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(136, 'Quis illum reprehenderit mollitia soluta rerum.', 'Ad dolorem id nisi nulla voluptates magni id. Iusto sit nulla fuga eveniet. Aut omnis iusto veritatis est enim enim omnis. Aut natus aut consequatur eum quo dicta.', 'https://via.placeholder.com/640x480.png/000055?text=earum', 96621, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 2),
(137, 'Doloremque natus molestiae sed commodi numquam.', 'Sit enim quas qui sequi. Autem minima nemo fugiat qui. Velit tempora sed laudantium dolor. Dignissimos ex animi natus.', 'https://via.placeholder.com/640x480.png/002255?text=deleniti', 122342, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(138, 'Illo tenetur quo et.', 'Dolorem sit earum aut ducimus adipisci corporis necessitatibus. Sit et reprehenderit voluptas totam sequi in. Enim eos sit necessitatibus omnis animi. Hic totam in fugiat aliquid voluptatem commodi.', 'https://via.placeholder.com/640x480.png/0033cc?text=mollitia', 161822, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(139, 'Sint qui sequi est officia.', 'Distinctio voluptates magnam doloribus veniam et sunt. Dolor nisi perspiciatis ex incidunt cupiditate eum assumenda. Alias eos id provident et. Adipisci voluptates voluptates dolorem ut.', 'https://via.placeholder.com/640x480.png/00ff55?text=ratione', 160761, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(140, 'Eum molestias vel molestiae autem.', 'Esse animi cumque asperiores ex reprehenderit. Iure sequi ut ea voluptate iste. Consequatur quia tempore perspiciatis quam. In eos reprehenderit rem voluptas id sequi.', 'https://via.placeholder.com/640x480.png/00ee44?text=rerum', 154907, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(141, 'Saepe quae velit quisquam enim placeat.', 'Suscipit occaecati est omnis tenetur expedita accusamus cupiditate laborum. Accusamus quia dolore exercitationem possimus minus et.', 'https://via.placeholder.com/640x480.png/00ff00?text=neque', 15264, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 4),
(142, 'Quasi veniam vel possimus.', 'Et cupiditate et eaque blanditiis et. Nam aut tempore ex vero reprehenderit culpa.', 'https://via.placeholder.com/640x480.png/006677?text=ipsum', 92587, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19),
(143, 'Autem voluptate eum eos qui.', 'Sed quidem ut cupiditate tempore iusto amet. Deleniti qui perferendis dolores perspiciatis ut modi quam. Et autem quasi consequatur distinctio consequatur.', 'https://via.placeholder.com/640x480.png/00ffcc?text=eaque', 148497, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 1),
(144, 'Alias quasi aut iusto molestiae in.', 'Deleniti id quas ut excepturi facere expedita. Ut ipsum sint aliquid non. Sapiente iusto harum dolor assumenda magnam et iure natus. Praesentium odit voluptas aliquid.', 'https://via.placeholder.com/640x480.png/007766?text=dolor', 31988, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(145, 'Necessitatibus ad et eligendi.', 'Occaecati cupiditate enim voluptas occaecati voluptates officia impedit. Nisi ipsa et laudantium ab iure. Cupiditate aut non blanditiis eaque culpa enim maiores.', 'https://via.placeholder.com/640x480.png/00ff00?text=exercitationem', 52624, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(146, 'Et sunt sit quam.', 'Id soluta doloremque pariatur enim. Deserunt asperiores corporis maiores magnam. Deserunt sed soluta eveniet sit. Sunt non et quia omnis unde. Et itaque non sunt beatae et corporis architecto.', 'https://via.placeholder.com/640x480.png/00aa00?text=nisi', 4717, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(147, 'Qui ut dignissimos suscipit dolores veniam aut.', 'Tenetur quam cupiditate consequatur eaque quia ut. Tenetur eaque qui voluptas sit non voluptas dolore. Enim quis assumenda doloribus et. Numquam quas mollitia suscipit alias illum maxime omnis.', 'https://via.placeholder.com/640x480.png/0088dd?text=voluptas', 6903, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(148, 'Dolor voluptatem explicabo eveniet.', 'Vero occaecati consequatur quia nesciunt qui quas sit. In quam consequatur hic. Qui dolorum at quae nihil.', 'https://via.placeholder.com/640x480.png/00ee22?text=non', 175641, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 4),
(149, 'Nostrum doloribus eum inventore sit qui a.', 'Libero optio quam ipsa consequatur ut sed. Quia et qui molestiae odio ut adipisci. Voluptatem facere quod rerum nostrum atque unde.', 'https://via.placeholder.com/640x480.png/0077ff?text=cupiditate', 173243, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(150, 'Suscipit beatae qui commodi nesciunt.', 'Et nobis ut recusandae velit vel. Et reprehenderit id molestiae sequi sequi ab. Et dicta consectetur aliquam dignissimos in quia sit voluptate.', 'https://via.placeholder.com/640x480.png/00aa33?text=rerum', 180500, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(151, 'Qui est dolores enim sit alias.', 'Ut vel quis saepe culpa sint sit. Dolor perferendis harum adipisci sit aut et. Doloribus et delectus ex pariatur tenetur.', 'https://via.placeholder.com/640x480.png/0055ee?text=rerum', 158326, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(152, 'Nostrum ea veritatis excepturi quo ut voluptates.', 'Similique ex officia qui nihil. Dignissimos nulla quam optio voluptatibus. Placeat aut quos occaecati sit officiis ut distinctio.', 'https://via.placeholder.com/640x480.png/00ee00?text=adipisci', 163522, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(153, 'Sed sit repudiandae qui sit.', 'Dolorum porro aperiam non eos. Accusantium voluptatem quo necessitatibus quas commodi. Ad animi veniam pariatur velit.', 'https://via.placeholder.com/640x480.png/0066cc?text=quo', 170763, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 19);
INSERT INTO `posts` (`id`, `title`, `content`, `image`, `likes`, `is_published`, `created_at`, `updated_at`, `deleted_at`, `category_id`) VALUES
(154, 'In tempore veniam consequatur repudiandae.', 'Quis tenetur quia sed quos in nihil. Adipisci qui natus optio incidunt tempore aut. Sit sit animi tempore. Et qui quis et dignissimos quia quaerat vero.', 'https://via.placeholder.com/640x480.png/0077dd?text=doloremque', 19766, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(155, 'Minus cumque qui maiores itaque.', 'Aut accusantium voluptas et sit voluptas. Sapiente dolore aut nihil exercitationem quia et dignissimos. Mollitia quidem impedit eveniet voluptatem nostrum omnis. Ea vero quia nisi vel.', 'https://via.placeholder.com/640x480.png/009955?text=qui', 118294, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(156, 'Sit repudiandae non maxime.', 'Eligendi sed vitae exercitationem eum ratione ullam non hic. Quia alias qui nulla harum et molestiae ut architecto. Et in culpa suscipit repellendus possimus ex alias eos.', 'https://via.placeholder.com/640x480.png/00ff22?text=recusandae', 55436, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(157, 'Quo dolorum omnis omnis ab.', 'Sunt accusamus voluptatem consectetur. Pariatur qui quis rem voluptatem quis odio atque. Facere accusamus quis id error. Quos debitis beatae sed nihil esse voluptas.', 'https://via.placeholder.com/640x480.png/0044bb?text=qui', 5333, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(158, 'Ut eaque voluptates voluptate aut aut iste.', 'Modi quod adipisci sit pariatur maiores vel aperiam. Mollitia est quidem sint veniam quas consectetur quas. Aliquid nisi voluptas et ut sunt.', 'https://via.placeholder.com/640x480.png/00bb99?text=voluptatibus', 150142, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(159, 'Ullam sit odio iusto quia.', 'Magnam qui at nihil voluptas. Qui id quo quaerat ut et molestias pariatur. Sunt asperiores tempora asperiores cumque dolorum neque. Et occaecati porro in reiciendis.', 'https://via.placeholder.com/640x480.png/0022dd?text=qui', 976, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(160, 'Eveniet dolorem in magni eos est.', 'Blanditiis maxime suscipit quaerat voluptatem. Est rerum ratione tempora aspernatur fugiat.', 'https://via.placeholder.com/640x480.png/006644?text=id', 164054, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(161, 'Omnis ratione nihil amet est.', 'Sit minus quis ut. Deserunt rerum maxime alias vitae repellendus. Explicabo aut id non et accusantium aut pariatur. Nemo aliquam commodi asperiores sit facere fugiat ea nostrum.', 'https://via.placeholder.com/640x480.png/00aabb?text=natus', 132628, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(162, 'Aut eligendi fugiat ut ut.', 'Accusantium sunt nihil earum qui voluptate laboriosam. Dolor est saepe quis placeat sint perferendis. Reprehenderit sed ipsa repudiandae.', 'https://via.placeholder.com/640x480.png/007733?text=quia', 148422, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(163, 'Soluta animi architecto ut voluptatem et.', 'Exercitationem ipsum eligendi cumque. Qui eum enim soluta quos. Et et velit molestiae iure id qui. Similique illum et impedit aut occaecati laudantium amet nesciunt.', 'https://via.placeholder.com/640x480.png/008822?text=placeat', 47252, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(164, 'Facere adipisci accusamus totam corrupti sapiente.', 'Qui facilis atque dolorum sed. Quod ut sed quas labore delectus ut. Nobis est voluptate quasi est qui delectus. Esse provident vel quod natus ut corporis eveniet.', 'https://via.placeholder.com/640x480.png/00aa22?text=sunt', 177895, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 4),
(165, 'Laudantium quia placeat numquam ipsa.', 'Sint doloribus esse dicta sapiente eius. Aspernatur libero ea distinctio aut vero nisi et officia. Voluptatibus aliquam nisi reprehenderit voluptas unde rerum. Totam perspiciatis itaque et eum sequi.', 'https://via.placeholder.com/640x480.png/001111?text=pariatur', 118128, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(166, 'Architecto nulla dolorem porro velit at incidunt.', 'Est porro pariatur omnis minus rerum minima aut. Asperiores ipsam omnis iusto ad totam. Est possimus aperiam rerum sit at et.', 'https://via.placeholder.com/640x480.png/00bb66?text=voluptas', 69582, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 3),
(167, 'Neque laborum sed sit ut excepturi.', 'Nam placeat laboriosam labore dolorem deleniti et. Maxime perspiciatis ut omnis consequatur qui sed. Ipsum eos voluptatem assumenda a reprehenderit.', 'https://via.placeholder.com/640x480.png/0055bb?text=ut', 55530, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(168, 'Pariatur delectus consequatur itaque quia.', 'Officia rerum sapiente ratione voluptas totam ipsa quia aspernatur. Tenetur saepe eum et non quibusdam in nihil accusamus. Nisi tenetur nihil rem.', 'https://via.placeholder.com/640x480.png/0022dd?text=culpa', 37966, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 15),
(169, 'Eum doloribus aut voluptas tenetur dolorem dolor.', 'Vero quidem porro rerum officia. Corporis quia aut optio vero mollitia. Omnis aperiam corrupti beatae aperiam perferendis ipsam dignissimos.', 'https://via.placeholder.com/640x480.png/005500?text=praesentium', 23566, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(170, 'Nulla ex veritatis enim vel facere.', 'Quas minus quas similique aliquam dolorem quia id. Eos voluptatem enim explicabo nam facere numquam. Hic rerum distinctio ab suscipit fuga omnis. Sit quia veniam atque velit aut adipisci in.', 'https://via.placeholder.com/640x480.png/00ee44?text=illum', 28007, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(171, 'Ut numquam excepturi ipsa.', 'Similique delectus esse ut vel. Nulla nostrum a exercitationem non et. Ut cum quo beatae beatae maiores assumenda. Perferendis ad nesciunt aut possimus dicta.', 'https://via.placeholder.com/640x480.png/00dd00?text=laudantium', 10622, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(172, 'Et repellat cumque adipisci sint.', 'Et aut accusamus qui qui laboriosam et. Repudiandae similique aut perferendis. Quos vitae omnis omnis maiores velit. Odio dolorem nemo deserunt dolore ipsam qui doloremque. Omnis ut aut quae.', 'https://via.placeholder.com/640x480.png/008866?text=non', 29198, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(173, 'Aspernatur sint officia a ab.', 'Voluptatum laborum velit ut. Deleniti fugit iure dolor et occaecati et. Ipsa qui dolor incidunt quasi in. Sapiente rerum id itaque sequi eos qui totam.', 'https://via.placeholder.com/640x480.png/007766?text=architecto', 47857, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 7),
(174, 'Ea perferendis perferendis odit et in saepe.', 'Iure voluptatem rerum totam in. Exercitationem et et ad aut sint et.', 'https://via.placeholder.com/640x480.png/004422?text=architecto', 173850, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 4),
(175, 'Dolorem dolore quis voluptatum.', 'Molestiae aliquam nisi est aut reprehenderit. Voluptatem omnis ut ut. Corporis est soluta id totam. Est cupiditate id est voluptatem dolore. Distinctio molestiae ut et in est neque.', 'https://via.placeholder.com/640x480.png/0077bb?text=unde', 36387, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(176, 'Odit et non est.', 'Tempora est quo autem. Totam vitae perferendis natus voluptas quos itaque. Et odit qui voluptatem voluptatem. In sed et perferendis et.', 'https://via.placeholder.com/640x480.png/009933?text=qui', 40884, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(177, 'Ut qui temporibus velit aliquam.', 'Sint necessitatibus hic magni nobis corrupti consequatur. Libero est quo quia dolorem. Et sunt qui provident quo architecto repudiandae. Rem ducimus quibusdam quidem tenetur ipsam.', 'https://via.placeholder.com/640x480.png/00aaee?text=reiciendis', 80179, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(178, 'Molestiae beatae quia dolor.', 'Odio esse a non consequuntur possimus repudiandae eveniet. Non saepe et vero vel ut. Fugit incidunt voluptatem rerum omnis ea laborum.', 'https://via.placeholder.com/640x480.png/00ff11?text=facere', 61336, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 9),
(179, 'Tenetur sit sequi sit sequi.', 'Id dolor et vitae qui. Perspiciatis aut inventore rerum consequatur officia enim distinctio. Commodi et quo sed velit enim. Minima labore fugit nulla ipsam aut et.', 'https://via.placeholder.com/640x480.png/002288?text=commodi', 191099, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(180, 'Repellendus animi omnis sed nostrum aspernatur.', 'Laudantium aut ab dicta rerum illum. Quis eos possimus aut saepe corporis tenetur nisi. Dignissimos aut velit sed id tempore eveniet voluptatem. Illum sit velit cumque natus voluptatem accusantium.', 'https://via.placeholder.com/640x480.png/00ff11?text=ut', 187616, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(181, 'Ut numquam voluptatem sed veniam quis corporis veniam.', 'Est eum aut sit officia animi sint dolores qui. Beatae cumque in quia esse corrupti placeat. Voluptates alias consequatur dolorem odio unde amet.', 'https://via.placeholder.com/640x480.png/0055bb?text=quos', 28660, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(182, 'Sit at sapiente consequatur corporis tempora amet.', 'Aliquid et ex reiciendis fugiat blanditiis ipsam reprehenderit. Perspiciatis qui eaque ipsa labore. Cum quia voluptates laboriosam atque labore ab.', 'https://via.placeholder.com/640x480.png/00aa66?text=impedit', 160070, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(183, 'Odit ducimus eaque omnis.', 'Consequuntur maiores beatae et ut. Rerum sit et molestiae. Maxime in distinctio ullam vel modi ut voluptatum.', 'https://via.placeholder.com/640x480.png/009900?text=ab', 98443, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 4),
(184, 'Ea ad in aliquam eum earum.', 'Eius earum ut magni asperiores necessitatibus. Voluptatibus dolorem laudantium in minus quia provident unde. Culpa ut doloremque at ipsum sed.', 'https://via.placeholder.com/640x480.png/00ffbb?text=in', 57264, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 17),
(185, 'Cupiditate dolor magni delectus commodi veritatis blanditiis.', 'Expedita voluptatibus itaque odit quia quia molestiae. Aut adipisci sint dolorum ea molestias rerum fugit. Sit animi modi totam ipsum consequuntur doloribus ipsa.', 'https://via.placeholder.com/640x480.png/00dd55?text=assumenda', 10650, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 13),
(186, 'Et fugit corrupti et.', 'Et dolorem quasi aut natus voluptatem. Voluptatem eveniet modi est non quaerat aliquid. Amet quia voluptas eos aliquid repellendus perspiciatis aut. Dolores distinctio dolorem quam ducimus.', 'https://via.placeholder.com/640x480.png/00aa77?text=molestias', 181173, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 20),
(187, 'Dolores debitis sunt ducimus nihil.', 'Sequi ad modi incidunt accusamus ratione amet deserunt placeat. Officia aliquid sed dolores expedita earum eum. Quidem sunt consequatur ad reprehenderit et.', 'https://via.placeholder.com/640x480.png/0088ff?text=eum', 74613, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(188, 'Quae possimus veritatis optio quo dolores.', 'Laudantium aut tempora illum quia et. Architecto necessitatibus labore excepturi iusto sapiente temporibus.', 'https://via.placeholder.com/640x480.png/00cc00?text=fugit', 135907, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(189, 'Rerum iure eveniet placeat nulla nihil alias.', 'A quasi doloribus qui assumenda. Vero dignissimos distinctio quia eius qui eos. Quae inventore est ipsam saepe placeat asperiores qui.', 'https://via.placeholder.com/640x480.png/004411?text=aut', 145706, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 5),
(190, 'Officiis aut nulla nemo dicta unde est.', 'Hic incidunt nihil omnis voluptatem. Dolorem eveniet ut est ut voluptatem vero quo. Deleniti recusandae aut et quibusdam. Et ipsam excepturi incidunt nihil est.', 'https://via.placeholder.com/640x480.png/00ccff?text=non', 61898, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 14),
(191, 'Ratione quisquam nihil voluptate aut.', 'Deserunt veritatis quia tempore quis. Consequatur repellat ea tempore voluptas accusantium deserunt quia. Sit tempore rerum architecto est. In alias fugiat est temporibus.', 'https://via.placeholder.com/640x480.png/009999?text=illo', 97951, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(192, 'Non laboriosam nemo repellat doloremque.', 'Itaque necessitatibus iste vel. Ducimus rerum qui minus harum accusamus porro.', 'https://via.placeholder.com/640x480.png/008811?text=saepe', 195534, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 11),
(193, 'Ad eveniet molestias quam quia suscipit ut.', 'Nemo nam debitis ut qui dolor dolores. Esse distinctio corporis quaerat. In deserunt maxime eos quos ducimus dolorem.', 'https://via.placeholder.com/640x480.png/006699?text=eligendi', 146967, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 12),
(194, 'Dolorem ea repellendus corrupti in.', 'Quo sit et est velit. Non alias dignissimos cumque molestias voluptas. Eius sint dolorem consequatur alias expedita inventore. Enim doloremque esse nihil aspernatur.', 'https://via.placeholder.com/640x480.png/008811?text=est', 62831, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 10),
(195, 'Dolorum ipsum tempore necessitatibus rerum.', 'Sequi illo assumenda ipsa ad veritatis. Tenetur eos nihil veritatis quibusdam. Eos mollitia asperiores harum nisi voluptas aliquid. Omnis eveniet magni facilis ipsa enim illo.', 'https://via.placeholder.com/640x480.png/002233?text=sit', 52323, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(196, 'In omnis modi modi blanditiis non.', 'Ducimus sit debitis non facere temporibus. Unde recusandae inventore non eum. Mollitia repudiandae praesentium ut maxime.', 'https://via.placeholder.com/640x480.png/0033dd?text=accusamus', 96260, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(197, 'Optio libero dolore quia voluptatum harum rerum.', 'Non accusamus sunt aut et sint. Atque numquam architecto consequatur reprehenderit nesciunt nobis. Sapiente eaque necessitatibus qui blanditiis non totam.', 'https://via.placeholder.com/640x480.png/00aa11?text=deleniti', 173271, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 6),
(198, 'Enim repellendus tempore ut aut rem.', 'Explicabo sunt cupiditate nam sed perferendis deserunt velit. Quam neque ea ut porro soluta consectetur qui. Quia sunt impedit reprehenderit.', 'https://via.placeholder.com/640x480.png/0033ff?text=iure', 16457, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 16),
(199, 'Est pariatur nisi nihil voluptas commodi veritatis.', 'Facilis ullam deserunt fuga doloremque non voluptatem. Minima quo itaque consequatur nihil. Qui voluptas ab cupiditate provident aperiam qui. Quo dolorem voluptatem sed enim nihil.', 'https://via.placeholder.com/640x480.png/008822?text=quam', 162415, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 8),
(200, 'Facere expedita veritatis perspiciatis et iste.', 'Voluptatem et est enim eius. Velit esse minima deleniti.', 'https://via.placeholder.com/640x480.png/0077cc?text=ratione', 61045, 1, '2023-10-06 03:46:24', '2023-10-06 03:46:24', NULL, 18),
(201, 'nhkrahfj', 'werdfgh', 'img', NULL, 1, '2023-10-06 08:21:10', '2023-10-06 08:21:10', NULL, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, NULL, NULL),
(2, 1, 10, NULL, NULL),
(3, 1, 11, NULL, NULL),
(4, 1, 22, NULL, NULL),
(5, 1, 24, NULL, NULL),
(6, 2, 4, NULL, NULL),
(7, 2, 6, NULL, NULL),
(8, 2, 19, NULL, NULL),
(9, 2, 34, NULL, NULL),
(10, 2, 53, NULL, NULL),
(11, 3, 18, NULL, NULL),
(12, 3, 29, NULL, NULL),
(13, 3, 46, NULL, NULL),
(14, 3, 49, NULL, NULL),
(15, 3, 51, NULL, NULL),
(16, 4, 2, NULL, NULL),
(17, 4, 26, NULL, NULL),
(18, 4, 28, NULL, NULL),
(19, 4, 38, NULL, NULL),
(20, 4, 54, NULL, NULL),
(21, 5, 1, NULL, NULL),
(22, 5, 6, NULL, NULL),
(23, 5, 13, NULL, NULL),
(24, 5, 23, NULL, NULL),
(25, 5, 49, NULL, NULL),
(26, 6, 2, NULL, NULL),
(27, 6, 24, NULL, NULL),
(28, 6, 30, NULL, NULL),
(29, 6, 37, NULL, NULL),
(30, 6, 41, NULL, NULL),
(31, 7, 14, NULL, NULL),
(32, 7, 26, NULL, NULL),
(33, 7, 37, NULL, NULL),
(34, 7, 46, NULL, NULL),
(35, 7, 47, NULL, NULL),
(36, 8, 16, NULL, NULL),
(37, 8, 27, NULL, NULL),
(38, 8, 31, NULL, NULL),
(39, 8, 35, NULL, NULL),
(40, 8, 36, NULL, NULL),
(41, 9, 15, NULL, NULL),
(42, 9, 21, NULL, NULL),
(43, 9, 29, NULL, NULL),
(44, 9, 30, NULL, NULL),
(45, 9, 40, NULL, NULL),
(46, 10, 5, NULL, NULL),
(47, 10, 19, NULL, NULL),
(48, 10, 37, NULL, NULL),
(49, 10, 48, NULL, NULL),
(50, 10, 51, NULL, NULL),
(51, 11, 10, NULL, NULL),
(52, 11, 20, NULL, NULL),
(53, 11, 36, NULL, NULL),
(54, 11, 40, NULL, NULL),
(55, 11, 52, NULL, NULL),
(56, 12, 4, NULL, NULL),
(57, 12, 15, NULL, NULL),
(58, 12, 34, NULL, NULL),
(59, 12, 42, NULL, NULL),
(60, 12, 43, NULL, NULL),
(61, 13, 4, NULL, NULL),
(62, 13, 26, NULL, NULL),
(63, 13, 38, NULL, NULL),
(64, 13, 39, NULL, NULL),
(65, 13, 52, NULL, NULL),
(66, 14, 9, NULL, NULL),
(67, 14, 37, NULL, NULL),
(68, 14, 51, NULL, NULL),
(69, 14, 54, NULL, NULL),
(70, 14, 55, NULL, NULL),
(71, 15, 1, NULL, NULL),
(72, 15, 20, NULL, NULL),
(73, 15, 25, NULL, NULL),
(74, 15, 42, NULL, NULL),
(75, 15, 48, NULL, NULL),
(76, 16, 10, NULL, NULL),
(77, 16, 21, NULL, NULL),
(78, 16, 24, NULL, NULL),
(79, 16, 48, NULL, NULL),
(80, 16, 49, NULL, NULL),
(81, 17, 11, NULL, NULL),
(82, 17, 12, NULL, NULL),
(83, 17, 13, NULL, NULL),
(84, 17, 22, NULL, NULL),
(85, 17, 53, NULL, NULL),
(86, 18, 4, NULL, NULL),
(87, 18, 8, NULL, NULL),
(88, 18, 25, NULL, NULL),
(89, 18, 41, NULL, NULL),
(90, 18, 51, NULL, NULL),
(91, 19, 5, NULL, NULL),
(92, 19, 17, NULL, NULL),
(93, 19, 37, NULL, NULL),
(94, 19, 42, NULL, NULL),
(95, 19, 50, NULL, NULL),
(96, 20, 6, NULL, NULL),
(97, 20, 8, NULL, NULL),
(98, 20, 37, NULL, NULL),
(99, 20, 39, NULL, NULL),
(100, 20, 55, NULL, NULL),
(101, 21, 1, NULL, NULL),
(102, 21, 25, NULL, NULL),
(103, 21, 36, NULL, NULL),
(104, 21, 42, NULL, NULL),
(105, 21, 46, NULL, NULL),
(106, 22, 1, NULL, NULL),
(107, 22, 15, NULL, NULL),
(108, 22, 17, NULL, NULL),
(109, 22, 21, NULL, NULL),
(110, 22, 35, NULL, NULL),
(111, 23, 7, NULL, NULL),
(112, 23, 14, NULL, NULL),
(113, 23, 31, NULL, NULL),
(114, 23, 45, NULL, NULL),
(115, 23, 46, NULL, NULL),
(116, 24, 22, NULL, NULL),
(117, 24, 25, NULL, NULL),
(118, 24, 35, NULL, NULL),
(119, 24, 40, NULL, NULL),
(120, 24, 47, NULL, NULL),
(121, 25, 6, NULL, NULL),
(122, 25, 29, NULL, NULL),
(123, 25, 31, NULL, NULL),
(124, 25, 34, NULL, NULL),
(125, 25, 38, NULL, NULL),
(126, 26, 6, NULL, NULL),
(127, 26, 19, NULL, NULL),
(128, 26, 33, NULL, NULL),
(129, 26, 37, NULL, NULL),
(130, 26, 45, NULL, NULL),
(131, 27, 12, NULL, NULL),
(132, 27, 13, NULL, NULL),
(133, 27, 21, NULL, NULL),
(134, 27, 36, NULL, NULL),
(135, 27, 45, NULL, NULL),
(136, 28, 5, NULL, NULL),
(137, 28, 26, NULL, NULL),
(138, 28, 29, NULL, NULL),
(139, 28, 32, NULL, NULL),
(140, 28, 45, NULL, NULL),
(141, 29, 2, NULL, NULL),
(142, 29, 27, NULL, NULL),
(143, 29, 33, NULL, NULL),
(144, 29, 40, NULL, NULL),
(145, 29, 51, NULL, NULL),
(146, 30, 1, NULL, NULL),
(147, 30, 19, NULL, NULL),
(148, 30, 20, NULL, NULL),
(149, 30, 24, NULL, NULL),
(150, 30, 30, NULL, NULL),
(151, 31, 10, NULL, NULL),
(152, 31, 13, NULL, NULL),
(153, 31, 37, NULL, NULL),
(154, 31, 38, NULL, NULL),
(155, 31, 51, NULL, NULL),
(156, 32, 3, NULL, NULL),
(157, 32, 7, NULL, NULL),
(158, 32, 14, NULL, NULL),
(159, 32, 33, NULL, NULL),
(160, 32, 36, NULL, NULL),
(161, 33, 5, NULL, NULL),
(162, 33, 14, NULL, NULL),
(163, 33, 27, NULL, NULL),
(164, 33, 44, NULL, NULL),
(165, 33, 49, NULL, NULL),
(166, 34, 5, NULL, NULL),
(167, 34, 15, NULL, NULL),
(168, 34, 40, NULL, NULL),
(169, 34, 50, NULL, NULL),
(170, 34, 54, NULL, NULL),
(171, 35, 6, NULL, NULL),
(172, 35, 10, NULL, NULL),
(173, 35, 42, NULL, NULL),
(174, 35, 44, NULL, NULL),
(175, 35, 45, NULL, NULL),
(176, 36, 2, NULL, NULL),
(177, 36, 10, NULL, NULL),
(178, 36, 28, NULL, NULL),
(179, 36, 42, NULL, NULL),
(180, 36, 47, NULL, NULL),
(181, 37, 11, NULL, NULL),
(182, 37, 13, NULL, NULL),
(183, 37, 41, NULL, NULL),
(184, 37, 43, NULL, NULL),
(185, 37, 53, NULL, NULL),
(186, 38, 14, NULL, NULL),
(187, 38, 17, NULL, NULL),
(188, 38, 33, NULL, NULL),
(189, 38, 54, NULL, NULL),
(190, 38, 55, NULL, NULL),
(191, 39, 9, NULL, NULL),
(192, 39, 25, NULL, NULL),
(193, 39, 28, NULL, NULL),
(194, 39, 40, NULL, NULL),
(195, 39, 53, NULL, NULL),
(196, 40, 9, NULL, NULL),
(197, 40, 21, NULL, NULL),
(198, 40, 25, NULL, NULL),
(199, 40, 34, NULL, NULL),
(200, 40, 37, NULL, NULL),
(201, 41, 5, NULL, NULL),
(202, 41, 11, NULL, NULL),
(203, 41, 14, NULL, NULL),
(204, 41, 26, NULL, NULL),
(205, 41, 41, NULL, NULL),
(206, 42, 23, NULL, NULL),
(207, 42, 25, NULL, NULL),
(208, 42, 31, NULL, NULL),
(209, 42, 44, NULL, NULL),
(210, 42, 50, NULL, NULL),
(211, 43, 4, NULL, NULL),
(212, 43, 15, NULL, NULL),
(213, 43, 21, NULL, NULL),
(214, 43, 26, NULL, NULL),
(215, 43, 27, NULL, NULL),
(216, 44, 2, NULL, NULL),
(217, 44, 18, NULL, NULL),
(218, 44, 19, NULL, NULL),
(219, 44, 22, NULL, NULL),
(220, 44, 28, NULL, NULL),
(221, 45, 2, NULL, NULL),
(222, 45, 26, NULL, NULL),
(223, 45, 29, NULL, NULL),
(224, 45, 36, NULL, NULL),
(225, 45, 53, NULL, NULL),
(226, 46, 4, NULL, NULL),
(227, 46, 6, NULL, NULL),
(228, 46, 9, NULL, NULL),
(229, 46, 15, NULL, NULL),
(230, 46, 55, NULL, NULL),
(231, 47, 10, NULL, NULL),
(232, 47, 12, NULL, NULL),
(233, 47, 18, NULL, NULL),
(234, 47, 30, NULL, NULL),
(235, 47, 48, NULL, NULL),
(236, 48, 23, NULL, NULL),
(237, 48, 26, NULL, NULL),
(238, 48, 28, NULL, NULL),
(239, 48, 34, NULL, NULL),
(240, 48, 46, NULL, NULL),
(241, 49, 2, NULL, NULL),
(242, 49, 25, NULL, NULL),
(243, 49, 33, NULL, NULL),
(244, 49, 40, NULL, NULL),
(245, 49, 41, NULL, NULL),
(246, 50, 7, NULL, NULL),
(247, 50, 11, NULL, NULL),
(248, 50, 15, NULL, NULL),
(249, 50, 21, NULL, NULL),
(250, 50, 27, NULL, NULL),
(251, 51, 11, NULL, NULL),
(252, 51, 28, NULL, NULL),
(253, 51, 34, NULL, NULL),
(254, 51, 44, NULL, NULL),
(255, 51, 55, NULL, NULL),
(256, 52, 2, NULL, NULL),
(257, 52, 20, NULL, NULL),
(258, 52, 30, NULL, NULL),
(259, 52, 44, NULL, NULL),
(260, 52, 45, NULL, NULL),
(261, 53, 32, NULL, NULL),
(262, 53, 35, NULL, NULL),
(263, 53, 40, NULL, NULL),
(264, 53, 44, NULL, NULL),
(265, 53, 50, NULL, NULL),
(266, 54, 15, NULL, NULL),
(267, 54, 24, NULL, NULL),
(268, 54, 46, NULL, NULL),
(269, 54, 49, NULL, NULL),
(270, 54, 51, NULL, NULL),
(271, 55, 2, NULL, NULL),
(272, 55, 10, NULL, NULL),
(273, 55, 14, NULL, NULL),
(274, 55, 16, NULL, NULL),
(275, 55, 24, NULL, NULL),
(276, 56, 14, NULL, NULL),
(277, 56, 19, NULL, NULL),
(278, 56, 20, NULL, NULL),
(279, 56, 25, NULL, NULL),
(280, 56, 32, NULL, NULL),
(281, 57, 4, NULL, NULL),
(282, 57, 5, NULL, NULL),
(283, 57, 14, NULL, NULL),
(284, 57, 21, NULL, NULL),
(285, 57, 28, NULL, NULL),
(286, 58, 2, NULL, NULL),
(287, 58, 7, NULL, NULL),
(288, 58, 12, NULL, NULL),
(289, 58, 18, NULL, NULL),
(290, 58, 46, NULL, NULL),
(291, 59, 12, NULL, NULL),
(292, 59, 14, NULL, NULL),
(293, 59, 17, NULL, NULL),
(294, 59, 25, NULL, NULL),
(295, 59, 27, NULL, NULL),
(296, 60, 10, NULL, NULL),
(297, 60, 22, NULL, NULL),
(298, 60, 31, NULL, NULL),
(299, 60, 39, NULL, NULL),
(300, 60, 47, NULL, NULL),
(301, 61, 15, NULL, NULL),
(302, 61, 16, NULL, NULL),
(303, 61, 25, NULL, NULL),
(304, 61, 34, NULL, NULL),
(305, 61, 54, NULL, NULL),
(306, 62, 5, NULL, NULL),
(307, 62, 8, NULL, NULL),
(308, 62, 30, NULL, NULL),
(309, 62, 35, NULL, NULL),
(310, 62, 47, NULL, NULL),
(311, 63, 2, NULL, NULL),
(312, 63, 10, NULL, NULL),
(313, 63, 26, NULL, NULL),
(314, 63, 38, NULL, NULL),
(315, 63, 52, NULL, NULL),
(316, 64, 2, NULL, NULL),
(317, 64, 29, NULL, NULL),
(318, 64, 32, NULL, NULL),
(319, 64, 47, NULL, NULL),
(320, 64, 53, NULL, NULL),
(321, 65, 1, NULL, NULL),
(322, 65, 9, NULL, NULL),
(323, 65, 14, NULL, NULL),
(324, 65, 34, NULL, NULL),
(325, 65, 46, NULL, NULL),
(326, 66, 12, NULL, NULL),
(327, 66, 17, NULL, NULL),
(328, 66, 19, NULL, NULL),
(329, 66, 30, NULL, NULL),
(330, 66, 39, NULL, NULL),
(331, 67, 15, NULL, NULL),
(332, 67, 19, NULL, NULL),
(333, 67, 23, NULL, NULL),
(334, 67, 36, NULL, NULL),
(335, 67, 49, NULL, NULL),
(336, 68, 5, NULL, NULL),
(337, 68, 9, NULL, NULL),
(338, 68, 14, NULL, NULL),
(339, 68, 26, NULL, NULL),
(340, 68, 39, NULL, NULL),
(341, 69, 17, NULL, NULL),
(342, 69, 20, NULL, NULL),
(343, 69, 22, NULL, NULL),
(344, 69, 44, NULL, NULL),
(345, 69, 48, NULL, NULL),
(346, 70, 1, NULL, NULL),
(347, 70, 22, NULL, NULL),
(348, 70, 24, NULL, NULL),
(349, 70, 27, NULL, NULL),
(350, 70, 52, NULL, NULL),
(351, 71, 11, NULL, NULL),
(352, 71, 23, NULL, NULL),
(353, 71, 29, NULL, NULL),
(354, 71, 32, NULL, NULL),
(355, 71, 53, NULL, NULL),
(356, 72, 11, NULL, NULL),
(357, 72, 24, NULL, NULL),
(358, 72, 37, NULL, NULL),
(359, 72, 43, NULL, NULL),
(360, 72, 45, NULL, NULL),
(361, 73, 16, NULL, NULL),
(362, 73, 20, NULL, NULL),
(363, 73, 22, NULL, NULL),
(364, 73, 51, NULL, NULL),
(365, 73, 55, NULL, NULL),
(366, 74, 9, NULL, NULL),
(367, 74, 12, NULL, NULL),
(368, 74, 27, NULL, NULL),
(369, 74, 45, NULL, NULL),
(370, 74, 54, NULL, NULL),
(371, 75, 10, NULL, NULL),
(372, 75, 12, NULL, NULL),
(373, 75, 27, NULL, NULL),
(374, 75, 34, NULL, NULL),
(375, 75, 52, NULL, NULL),
(376, 76, 3, NULL, NULL),
(377, 76, 20, NULL, NULL),
(378, 76, 22, NULL, NULL),
(379, 76, 43, NULL, NULL),
(380, 76, 52, NULL, NULL),
(381, 77, 9, NULL, NULL),
(382, 77, 23, NULL, NULL),
(383, 77, 31, NULL, NULL),
(384, 77, 37, NULL, NULL),
(385, 77, 55, NULL, NULL),
(386, 78, 8, NULL, NULL),
(387, 78, 31, NULL, NULL),
(388, 78, 40, NULL, NULL),
(389, 78, 43, NULL, NULL),
(390, 78, 48, NULL, NULL),
(391, 79, 8, NULL, NULL),
(392, 79, 19, NULL, NULL),
(393, 79, 23, NULL, NULL),
(394, 79, 40, NULL, NULL),
(395, 79, 48, NULL, NULL),
(396, 80, 22, NULL, NULL),
(397, 80, 32, NULL, NULL),
(398, 80, 35, NULL, NULL),
(399, 80, 42, NULL, NULL),
(400, 80, 53, NULL, NULL),
(401, 81, 9, NULL, NULL),
(402, 81, 24, NULL, NULL),
(403, 81, 47, NULL, NULL),
(404, 81, 50, NULL, NULL),
(405, 81, 54, NULL, NULL),
(406, 82, 4, NULL, NULL),
(407, 82, 17, NULL, NULL),
(408, 82, 38, NULL, NULL),
(409, 82, 40, NULL, NULL),
(410, 82, 45, NULL, NULL),
(411, 83, 3, NULL, NULL),
(412, 83, 6, NULL, NULL),
(413, 83, 10, NULL, NULL),
(414, 83, 17, NULL, NULL),
(415, 83, 55, NULL, NULL),
(416, 84, 1, NULL, NULL),
(417, 84, 15, NULL, NULL),
(418, 84, 23, NULL, NULL),
(419, 84, 45, NULL, NULL),
(420, 84, 48, NULL, NULL),
(421, 85, 13, NULL, NULL),
(422, 85, 15, NULL, NULL),
(423, 85, 17, NULL, NULL),
(424, 85, 29, NULL, NULL),
(425, 85, 45, NULL, NULL),
(426, 86, 6, NULL, NULL),
(427, 86, 8, NULL, NULL),
(428, 86, 28, NULL, NULL),
(429, 86, 34, NULL, NULL),
(430, 86, 42, NULL, NULL),
(431, 87, 1, NULL, NULL),
(432, 87, 2, NULL, NULL),
(433, 87, 10, NULL, NULL),
(434, 87, 24, NULL, NULL),
(435, 87, 54, NULL, NULL),
(436, 88, 13, NULL, NULL),
(437, 88, 18, NULL, NULL),
(438, 88, 33, NULL, NULL),
(439, 88, 38, NULL, NULL),
(440, 88, 54, NULL, NULL),
(441, 89, 7, NULL, NULL),
(442, 89, 20, NULL, NULL),
(443, 89, 28, NULL, NULL),
(444, 89, 40, NULL, NULL),
(445, 89, 53, NULL, NULL),
(446, 90, 8, NULL, NULL),
(447, 90, 11, NULL, NULL),
(448, 90, 21, NULL, NULL),
(449, 90, 28, NULL, NULL),
(450, 90, 41, NULL, NULL),
(451, 91, 13, NULL, NULL),
(452, 91, 27, NULL, NULL),
(453, 91, 31, NULL, NULL),
(454, 91, 34, NULL, NULL),
(455, 91, 49, NULL, NULL),
(456, 92, 6, NULL, NULL),
(457, 92, 8, NULL, NULL),
(458, 92, 18, NULL, NULL),
(459, 92, 42, NULL, NULL),
(460, 92, 51, NULL, NULL),
(461, 93, 3, NULL, NULL),
(462, 93, 9, NULL, NULL),
(463, 93, 24, NULL, NULL),
(464, 93, 42, NULL, NULL),
(465, 93, 55, NULL, NULL),
(466, 94, 14, NULL, NULL),
(467, 94, 26, NULL, NULL),
(468, 94, 29, NULL, NULL),
(469, 94, 43, NULL, NULL),
(470, 94, 44, NULL, NULL),
(471, 95, 1, NULL, NULL),
(472, 95, 7, NULL, NULL),
(473, 95, 12, NULL, NULL),
(474, 95, 54, NULL, NULL),
(475, 95, 55, NULL, NULL),
(476, 96, 12, NULL, NULL),
(477, 96, 19, NULL, NULL),
(478, 96, 21, NULL, NULL),
(479, 96, 33, NULL, NULL),
(480, 96, 40, NULL, NULL),
(481, 97, 10, NULL, NULL),
(482, 97, 22, NULL, NULL),
(483, 97, 48, NULL, NULL),
(484, 97, 50, NULL, NULL),
(485, 97, 54, NULL, NULL),
(486, 98, 19, NULL, NULL),
(487, 98, 26, NULL, NULL),
(488, 98, 28, NULL, NULL),
(489, 98, 38, NULL, NULL),
(490, 98, 54, NULL, NULL),
(491, 99, 5, NULL, NULL),
(492, 99, 22, NULL, NULL),
(493, 99, 24, NULL, NULL),
(494, 99, 30, NULL, NULL),
(495, 99, 44, NULL, NULL),
(496, 100, 5, NULL, NULL),
(497, 100, 15, NULL, NULL),
(498, 100, 24, NULL, NULL),
(499, 100, 30, NULL, NULL),
(500, 100, 44, NULL, NULL),
(501, 101, 1, NULL, NULL),
(502, 101, 2, NULL, NULL),
(503, 101, 29, NULL, NULL),
(504, 101, 31, NULL, NULL),
(505, 101, 54, NULL, NULL),
(506, 102, 12, NULL, NULL),
(507, 102, 25, NULL, NULL),
(508, 102, 43, NULL, NULL),
(509, 102, 47, NULL, NULL),
(510, 102, 54, NULL, NULL),
(511, 103, 2, NULL, NULL),
(512, 103, 14, NULL, NULL),
(513, 103, 21, NULL, NULL),
(514, 103, 49, NULL, NULL),
(515, 103, 50, NULL, NULL),
(516, 104, 8, NULL, NULL),
(517, 104, 14, NULL, NULL),
(518, 104, 20, NULL, NULL),
(519, 104, 41, NULL, NULL),
(520, 104, 48, NULL, NULL),
(521, 105, 15, NULL, NULL),
(522, 105, 19, NULL, NULL),
(523, 105, 27, NULL, NULL),
(524, 105, 28, NULL, NULL),
(525, 105, 54, NULL, NULL),
(526, 106, 5, NULL, NULL),
(527, 106, 19, NULL, NULL),
(528, 106, 48, NULL, NULL),
(529, 106, 51, NULL, NULL),
(530, 106, 52, NULL, NULL),
(531, 107, 7, NULL, NULL),
(532, 107, 10, NULL, NULL),
(533, 107, 16, NULL, NULL),
(534, 107, 19, NULL, NULL),
(535, 107, 52, NULL, NULL),
(536, 108, 10, NULL, NULL),
(537, 108, 14, NULL, NULL),
(538, 108, 24, NULL, NULL),
(539, 108, 25, NULL, NULL),
(540, 108, 33, NULL, NULL),
(541, 109, 2, NULL, NULL),
(542, 109, 22, NULL, NULL),
(543, 109, 26, NULL, NULL),
(544, 109, 33, NULL, NULL),
(545, 109, 42, NULL, NULL),
(546, 110, 1, NULL, NULL),
(547, 110, 26, NULL, NULL),
(548, 110, 47, NULL, NULL),
(549, 110, 50, NULL, NULL),
(550, 110, 52, NULL, NULL),
(551, 111, 10, NULL, NULL),
(552, 111, 13, NULL, NULL),
(553, 111, 14, NULL, NULL),
(554, 111, 35, NULL, NULL),
(555, 111, 45, NULL, NULL),
(556, 112, 4, NULL, NULL),
(557, 112, 26, NULL, NULL),
(558, 112, 30, NULL, NULL),
(559, 112, 31, NULL, NULL),
(560, 112, 45, NULL, NULL),
(561, 113, 25, NULL, NULL),
(562, 113, 36, NULL, NULL),
(563, 113, 38, NULL, NULL),
(564, 113, 39, NULL, NULL),
(565, 113, 50, NULL, NULL),
(566, 114, 3, NULL, NULL),
(567, 114, 8, NULL, NULL),
(568, 114, 9, NULL, NULL),
(569, 114, 24, NULL, NULL),
(570, 114, 50, NULL, NULL),
(571, 115, 3, NULL, NULL),
(572, 115, 7, NULL, NULL),
(573, 115, 14, NULL, NULL),
(574, 115, 30, NULL, NULL),
(575, 115, 47, NULL, NULL),
(576, 116, 8, NULL, NULL),
(577, 116, 15, NULL, NULL),
(578, 116, 18, NULL, NULL),
(579, 116, 22, NULL, NULL),
(580, 116, 51, NULL, NULL),
(581, 117, 5, NULL, NULL),
(582, 117, 18, NULL, NULL),
(583, 117, 27, NULL, NULL),
(584, 117, 39, NULL, NULL),
(585, 117, 55, NULL, NULL),
(586, 118, 22, NULL, NULL),
(587, 118, 25, NULL, NULL),
(588, 118, 46, NULL, NULL),
(589, 118, 49, NULL, NULL),
(590, 118, 53, NULL, NULL),
(591, 119, 10, NULL, NULL),
(592, 119, 12, NULL, NULL),
(593, 119, 13, NULL, NULL),
(594, 119, 42, NULL, NULL),
(595, 119, 49, NULL, NULL),
(596, 120, 7, NULL, NULL),
(597, 120, 16, NULL, NULL),
(598, 120, 22, NULL, NULL),
(599, 120, 41, NULL, NULL),
(600, 120, 47, NULL, NULL),
(601, 121, 14, NULL, NULL),
(602, 121, 20, NULL, NULL),
(603, 121, 22, NULL, NULL),
(604, 121, 26, NULL, NULL),
(605, 121, 38, NULL, NULL),
(606, 122, 3, NULL, NULL),
(607, 122, 5, NULL, NULL),
(608, 122, 18, NULL, NULL),
(609, 122, 20, NULL, NULL),
(610, 122, 38, NULL, NULL),
(611, 123, 2, NULL, NULL),
(612, 123, 5, NULL, NULL),
(613, 123, 7, NULL, NULL),
(614, 123, 18, NULL, NULL),
(615, 123, 46, NULL, NULL),
(616, 124, 11, NULL, NULL),
(617, 124, 19, NULL, NULL),
(618, 124, 20, NULL, NULL),
(619, 124, 21, NULL, NULL),
(620, 124, 23, NULL, NULL),
(621, 125, 25, NULL, NULL),
(622, 125, 31, NULL, NULL),
(623, 125, 45, NULL, NULL),
(624, 125, 51, NULL, NULL),
(625, 125, 53, NULL, NULL),
(626, 126, 3, NULL, NULL),
(627, 126, 5, NULL, NULL),
(628, 126, 10, NULL, NULL),
(629, 126, 49, NULL, NULL),
(630, 126, 50, NULL, NULL),
(631, 127, 1, NULL, NULL),
(632, 127, 19, NULL, NULL),
(633, 127, 28, NULL, NULL),
(634, 127, 44, NULL, NULL),
(635, 127, 49, NULL, NULL),
(636, 128, 3, NULL, NULL),
(637, 128, 4, NULL, NULL),
(638, 128, 25, NULL, NULL),
(639, 128, 26, NULL, NULL),
(640, 128, 52, NULL, NULL),
(641, 129, 8, NULL, NULL),
(642, 129, 25, NULL, NULL),
(643, 129, 28, NULL, NULL),
(644, 129, 31, NULL, NULL),
(645, 129, 55, NULL, NULL),
(646, 130, 9, NULL, NULL),
(647, 130, 22, NULL, NULL),
(648, 130, 36, NULL, NULL),
(649, 130, 47, NULL, NULL),
(650, 130, 49, NULL, NULL),
(651, 131, 11, NULL, NULL),
(652, 131, 36, NULL, NULL),
(653, 131, 38, NULL, NULL),
(654, 131, 42, NULL, NULL),
(655, 131, 49, NULL, NULL),
(656, 132, 1, NULL, NULL),
(657, 132, 6, NULL, NULL),
(658, 132, 36, NULL, NULL),
(659, 132, 53, NULL, NULL),
(660, 132, 54, NULL, NULL),
(661, 133, 5, NULL, NULL),
(662, 133, 7, NULL, NULL),
(663, 133, 12, NULL, NULL),
(664, 133, 13, NULL, NULL),
(665, 133, 25, NULL, NULL),
(666, 134, 1, NULL, NULL),
(667, 134, 8, NULL, NULL),
(668, 134, 22, NULL, NULL),
(669, 134, 29, NULL, NULL),
(670, 134, 42, NULL, NULL),
(671, 135, 1, NULL, NULL),
(672, 135, 15, NULL, NULL),
(673, 135, 19, NULL, NULL),
(674, 135, 26, NULL, NULL),
(675, 135, 47, NULL, NULL),
(676, 136, 6, NULL, NULL),
(677, 136, 12, NULL, NULL),
(678, 136, 44, NULL, NULL),
(679, 136, 51, NULL, NULL),
(680, 136, 55, NULL, NULL),
(681, 137, 19, NULL, NULL),
(682, 137, 26, NULL, NULL),
(683, 137, 32, NULL, NULL),
(684, 137, 38, NULL, NULL),
(685, 137, 44, NULL, NULL),
(686, 138, 9, NULL, NULL),
(687, 138, 13, NULL, NULL),
(688, 138, 19, NULL, NULL),
(689, 138, 21, NULL, NULL),
(690, 138, 41, NULL, NULL),
(691, 139, 5, NULL, NULL),
(692, 139, 23, NULL, NULL),
(693, 139, 28, NULL, NULL),
(694, 139, 43, NULL, NULL),
(695, 139, 44, NULL, NULL),
(696, 140, 6, NULL, NULL),
(697, 140, 7, NULL, NULL),
(698, 140, 22, NULL, NULL),
(699, 140, 24, NULL, NULL),
(700, 140, 30, NULL, NULL),
(701, 141, 2, NULL, NULL),
(702, 141, 18, NULL, NULL),
(703, 141, 31, NULL, NULL),
(704, 141, 37, NULL, NULL),
(705, 141, 51, NULL, NULL),
(706, 142, 1, NULL, NULL),
(707, 142, 14, NULL, NULL),
(708, 142, 17, NULL, NULL),
(709, 142, 40, NULL, NULL),
(710, 142, 48, NULL, NULL),
(711, 143, 13, NULL, NULL),
(712, 143, 19, NULL, NULL),
(713, 143, 23, NULL, NULL),
(714, 143, 30, NULL, NULL),
(715, 143, 45, NULL, NULL),
(716, 144, 1, NULL, NULL),
(717, 144, 6, NULL, NULL),
(718, 144, 25, NULL, NULL),
(719, 144, 44, NULL, NULL),
(720, 144, 53, NULL, NULL),
(721, 145, 20, NULL, NULL),
(722, 145, 24, NULL, NULL),
(723, 145, 42, NULL, NULL),
(724, 145, 46, NULL, NULL),
(725, 145, 50, NULL, NULL),
(726, 146, 7, NULL, NULL),
(727, 146, 19, NULL, NULL),
(728, 146, 34, NULL, NULL),
(729, 146, 35, NULL, NULL),
(730, 146, 49, NULL, NULL),
(731, 147, 3, NULL, NULL),
(732, 147, 7, NULL, NULL),
(733, 147, 28, NULL, NULL),
(734, 147, 31, NULL, NULL),
(735, 147, 39, NULL, NULL),
(736, 148, 10, NULL, NULL),
(737, 148, 12, NULL, NULL),
(738, 148, 14, NULL, NULL),
(739, 148, 19, NULL, NULL),
(740, 148, 45, NULL, NULL),
(741, 149, 5, NULL, NULL),
(742, 149, 7, NULL, NULL),
(743, 149, 15, NULL, NULL),
(744, 149, 24, NULL, NULL),
(745, 149, 31, NULL, NULL),
(746, 150, 11, NULL, NULL),
(747, 150, 12, NULL, NULL),
(748, 150, 18, NULL, NULL),
(749, 150, 28, NULL, NULL),
(750, 150, 31, NULL, NULL),
(751, 151, 11, NULL, NULL),
(752, 151, 15, NULL, NULL),
(753, 151, 30, NULL, NULL),
(754, 151, 38, NULL, NULL),
(755, 151, 40, NULL, NULL),
(756, 152, 17, NULL, NULL),
(757, 152, 26, NULL, NULL),
(758, 152, 30, NULL, NULL),
(759, 152, 46, NULL, NULL),
(760, 152, 53, NULL, NULL),
(761, 153, 36, NULL, NULL),
(762, 153, 43, NULL, NULL),
(763, 153, 45, NULL, NULL),
(764, 153, 52, NULL, NULL),
(765, 153, 55, NULL, NULL),
(766, 154, 6, NULL, NULL),
(767, 154, 21, NULL, NULL),
(768, 154, 35, NULL, NULL),
(769, 154, 44, NULL, NULL),
(770, 154, 45, NULL, NULL),
(771, 155, 3, NULL, NULL),
(772, 155, 4, NULL, NULL),
(773, 155, 23, NULL, NULL),
(774, 155, 46, NULL, NULL),
(775, 155, 52, NULL, NULL),
(776, 156, 8, NULL, NULL),
(777, 156, 10, NULL, NULL),
(778, 156, 41, NULL, NULL),
(779, 156, 48, NULL, NULL),
(780, 156, 50, NULL, NULL),
(781, 157, 10, NULL, NULL),
(782, 157, 18, NULL, NULL),
(783, 157, 22, NULL, NULL),
(784, 157, 41, NULL, NULL),
(785, 157, 44, NULL, NULL),
(786, 158, 4, NULL, NULL),
(787, 158, 7, NULL, NULL),
(788, 158, 12, NULL, NULL),
(789, 158, 27, NULL, NULL),
(790, 158, 55, NULL, NULL),
(791, 159, 1, NULL, NULL),
(792, 159, 5, NULL, NULL),
(793, 159, 13, NULL, NULL),
(794, 159, 34, NULL, NULL),
(795, 159, 36, NULL, NULL),
(796, 160, 2, NULL, NULL),
(797, 160, 31, NULL, NULL),
(798, 160, 34, NULL, NULL),
(799, 160, 39, NULL, NULL),
(800, 160, 46, NULL, NULL),
(801, 161, 4, NULL, NULL),
(802, 161, 5, NULL, NULL),
(803, 161, 38, NULL, NULL),
(804, 161, 46, NULL, NULL),
(805, 161, 47, NULL, NULL),
(806, 162, 12, NULL, NULL),
(807, 162, 20, NULL, NULL),
(808, 162, 26, NULL, NULL),
(809, 162, 40, NULL, NULL),
(810, 162, 44, NULL, NULL),
(811, 163, 7, NULL, NULL),
(812, 163, 12, NULL, NULL),
(813, 163, 14, NULL, NULL),
(814, 163, 19, NULL, NULL),
(815, 163, 37, NULL, NULL),
(816, 164, 7, NULL, NULL),
(817, 164, 38, NULL, NULL),
(818, 164, 42, NULL, NULL),
(819, 164, 45, NULL, NULL),
(820, 164, 51, NULL, NULL),
(821, 165, 20, NULL, NULL),
(822, 165, 25, NULL, NULL),
(823, 165, 42, NULL, NULL),
(824, 165, 47, NULL, NULL),
(825, 165, 49, NULL, NULL),
(826, 166, 1, NULL, NULL),
(827, 166, 7, NULL, NULL),
(828, 166, 21, NULL, NULL),
(829, 166, 40, NULL, NULL),
(830, 166, 49, NULL, NULL),
(831, 167, 1, NULL, NULL),
(832, 167, 11, NULL, NULL),
(833, 167, 20, NULL, NULL),
(834, 167, 43, NULL, NULL),
(835, 167, 48, NULL, NULL),
(836, 168, 8, NULL, NULL),
(837, 168, 12, NULL, NULL),
(838, 168, 30, NULL, NULL),
(839, 168, 46, NULL, NULL),
(840, 168, 47, NULL, NULL),
(841, 169, 9, NULL, NULL),
(842, 169, 18, NULL, NULL),
(843, 169, 23, NULL, NULL),
(844, 169, 24, NULL, NULL),
(845, 169, 31, NULL, NULL),
(846, 170, 15, NULL, NULL),
(847, 170, 27, NULL, NULL),
(848, 170, 43, NULL, NULL),
(849, 170, 44, NULL, NULL),
(850, 170, 47, NULL, NULL),
(851, 171, 3, NULL, NULL),
(852, 171, 16, NULL, NULL),
(853, 171, 21, NULL, NULL),
(854, 171, 24, NULL, NULL),
(855, 171, 53, NULL, NULL),
(856, 172, 5, NULL, NULL),
(857, 172, 8, NULL, NULL),
(858, 172, 45, NULL, NULL),
(859, 172, 50, NULL, NULL),
(860, 172, 53, NULL, NULL),
(861, 173, 8, NULL, NULL),
(862, 173, 12, NULL, NULL),
(863, 173, 34, NULL, NULL),
(864, 173, 35, NULL, NULL),
(865, 173, 37, NULL, NULL),
(866, 174, 21, NULL, NULL),
(867, 174, 25, NULL, NULL),
(868, 174, 36, NULL, NULL),
(869, 174, 40, NULL, NULL),
(870, 174, 44, NULL, NULL),
(871, 175, 8, NULL, NULL),
(872, 175, 21, NULL, NULL),
(873, 175, 37, NULL, NULL),
(874, 175, 50, NULL, NULL),
(875, 175, 55, NULL, NULL),
(876, 176, 6, NULL, NULL),
(877, 176, 17, NULL, NULL),
(878, 176, 25, NULL, NULL),
(879, 176, 30, NULL, NULL),
(880, 176, 54, NULL, NULL),
(881, 177, 7, NULL, NULL),
(882, 177, 19, NULL, NULL),
(883, 177, 35, NULL, NULL),
(884, 177, 49, NULL, NULL),
(885, 177, 52, NULL, NULL),
(886, 178, 10, NULL, NULL),
(887, 178, 27, NULL, NULL),
(888, 178, 34, NULL, NULL),
(889, 178, 36, NULL, NULL),
(890, 178, 43, NULL, NULL),
(891, 179, 7, NULL, NULL),
(892, 179, 17, NULL, NULL),
(893, 179, 23, NULL, NULL),
(894, 179, 34, NULL, NULL),
(895, 179, 39, NULL, NULL),
(896, 180, 14, NULL, NULL),
(897, 180, 31, NULL, NULL),
(898, 180, 36, NULL, NULL),
(899, 180, 50, NULL, NULL),
(900, 180, 51, NULL, NULL),
(901, 181, 3, NULL, NULL),
(902, 181, 23, NULL, NULL),
(903, 181, 27, NULL, NULL),
(904, 181, 28, NULL, NULL),
(905, 181, 34, NULL, NULL),
(906, 182, 23, NULL, NULL),
(907, 182, 29, NULL, NULL),
(908, 182, 31, NULL, NULL),
(909, 182, 35, NULL, NULL),
(910, 182, 54, NULL, NULL),
(911, 183, 4, NULL, NULL),
(912, 183, 6, NULL, NULL),
(913, 183, 10, NULL, NULL),
(914, 183, 44, NULL, NULL),
(915, 183, 50, NULL, NULL),
(916, 184, 12, NULL, NULL),
(917, 184, 16, NULL, NULL),
(918, 184, 23, NULL, NULL),
(919, 184, 28, NULL, NULL),
(920, 184, 37, NULL, NULL),
(921, 185, 8, NULL, NULL),
(922, 185, 11, NULL, NULL),
(923, 185, 32, NULL, NULL),
(924, 185, 44, NULL, NULL),
(925, 185, 54, NULL, NULL),
(926, 186, 6, NULL, NULL),
(927, 186, 14, NULL, NULL),
(928, 186, 26, NULL, NULL),
(929, 186, 38, NULL, NULL),
(930, 186, 55, NULL, NULL),
(931, 187, 19, NULL, NULL),
(932, 187, 27, NULL, NULL),
(933, 187, 42, NULL, NULL),
(934, 187, 45, NULL, NULL),
(935, 187, 55, NULL, NULL),
(936, 188, 4, NULL, NULL),
(937, 188, 8, NULL, NULL),
(938, 188, 28, NULL, NULL),
(939, 188, 33, NULL, NULL),
(940, 188, 35, NULL, NULL),
(941, 189, 1, NULL, NULL),
(942, 189, 22, NULL, NULL),
(943, 189, 30, NULL, NULL),
(944, 189, 39, NULL, NULL),
(945, 189, 46, NULL, NULL),
(946, 190, 19, NULL, NULL),
(947, 190, 26, NULL, NULL),
(948, 190, 32, NULL, NULL),
(949, 190, 50, NULL, NULL),
(950, 190, 52, NULL, NULL),
(951, 191, 6, NULL, NULL),
(952, 191, 13, NULL, NULL),
(953, 191, 19, NULL, NULL),
(954, 191, 25, NULL, NULL),
(955, 191, 49, NULL, NULL),
(956, 192, 4, NULL, NULL),
(957, 192, 8, NULL, NULL),
(958, 192, 32, NULL, NULL),
(959, 192, 44, NULL, NULL),
(960, 192, 51, NULL, NULL),
(961, 193, 8, NULL, NULL),
(962, 193, 13, NULL, NULL),
(963, 193, 15, NULL, NULL),
(964, 193, 33, NULL, NULL),
(965, 193, 51, NULL, NULL),
(966, 194, 2, NULL, NULL),
(967, 194, 17, NULL, NULL),
(968, 194, 35, NULL, NULL),
(969, 194, 51, NULL, NULL),
(970, 194, 54, NULL, NULL),
(971, 195, 6, NULL, NULL),
(972, 195, 22, NULL, NULL),
(973, 195, 26, NULL, NULL),
(974, 195, 43, NULL, NULL),
(975, 195, 44, NULL, NULL),
(976, 196, 6, NULL, NULL),
(977, 196, 28, NULL, NULL),
(978, 196, 34, NULL, NULL),
(979, 196, 40, NULL, NULL),
(980, 196, 53, NULL, NULL),
(981, 197, 25, NULL, NULL),
(982, 197, 35, NULL, NULL),
(983, 197, 38, NULL, NULL),
(984, 197, 39, NULL, NULL),
(985, 197, 55, NULL, NULL),
(986, 198, 8, NULL, NULL),
(987, 198, 9, NULL, NULL),
(988, 198, 10, NULL, NULL),
(989, 198, 48, NULL, NULL),
(990, 198, 54, NULL, NULL),
(991, 199, 4, NULL, NULL),
(992, 199, 14, NULL, NULL),
(993, 199, 16, NULL, NULL),
(994, 199, 27, NULL, NULL),
(995, 199, 31, NULL, NULL),
(996, 200, 3, NULL, NULL),
(997, 200, 11, NULL, NULL),
(998, 200, 22, NULL, NULL),
(999, 200, 23, NULL, NULL),
(1000, 200, 50, NULL, NULL),
(1001, 201, 2, NULL, NULL),
(1002, 201, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'est', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(2, 'quae', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(3, 'fugit', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(4, 'sed', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(5, 'pariatur', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(6, 'voluptate', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(7, 'excepturi', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(8, 'saepe', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(9, 'at', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(10, 'eos', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(11, 'repellat', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(12, 'quasi', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(13, 'voluptas', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(14, 'possimus', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(15, 'consequatur', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(16, 'ipsa', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(17, 'aut', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(18, 'rem', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(19, 'similique', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(20, 'dolores', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(21, 'est', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(22, 'repellat', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(23, 'laudantium', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(24, 'rerum', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(25, 'neque', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(26, 'voluptas', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(27, 'veritatis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(28, 'beatae', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(29, 'aspernatur', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(30, 'delectus', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(31, 'et', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(32, 'eos', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(33, 'vero', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(34, 'nemo', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(35, 'omnis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(36, 'quis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(37, 'fugiat', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(38, 'aut', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(39, 'eos', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(40, 'nisi', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(41, 'officia', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(42, 'consequatur', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(43, 'voluptatibus', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(44, 'et', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(45, 'aut', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(46, 'omnis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(47, 'neque', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(48, 'ullam', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(49, 'sequi', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(50, 'exercitationem', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(51, 'itaque', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(52, 'sed', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(53, 'nesciunt', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(54, 'quis', '2023-10-06 03:46:23', '2023-10-06 03:46:23'),
(55, 'tempore', '2023-10-06 03:46:23', '2023-10-06 03:46:23');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Lera', 'hauka.valeriia@chnu.edu.ua', NULL, '$2y$10$sX2XIeToWsG5uEmqog.Hh.k3S4pnLki5uphvBafe3F6eDU0IoS66G', NULL, '2023-10-07 04:45:36', '2023-10-07 04:45:36', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT для таблицы `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- База данных: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Структура таблицы `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Дамп данных таблицы `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"projectback\",\"table\":\"reviews\"},{\"db\":\"projectback\",\"table\":\"sessions\"},{\"db\":\"projectback\",\"table\":\"statuses\"},{\"db\":\"projectback\",\"table\":\"responsible_for_reviews\"},{\"db\":\"projectback\",\"table\":\"groups\"},{\"db\":\"projectback\",\"table\":\"users\"},{\"db\":\"projectback\",\"table\":\"group_user\"},{\"db\":\"projectback\",\"table\":\"files\"},{\"db\":\"projectback\",\"table\":\"approves\"},{\"db\":\"projectback\",\"table\":\"categories\"}]');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Дамп данных таблицы `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'projectback', 'approves', '{\"CREATE_TIME\":\"2023-10-03 16:04:31\",\"col_order\":[0,1,2,3,4,5,6,7,8,9,10,11],\"col_visib\":[1,1,1,1,1,1,1,1,1,1,1,1]}', '2023-10-30 12:20:48'),
('root', 'projectback', 'files', '{\"sorted_col\":\"`file_path` ASC\"}', '2023-11-03 12:43:27');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Дамп данных таблицы `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-12-05 18:21:12', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"ru\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Индексы таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Индексы таблицы `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Индексы таблицы `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Индексы таблицы `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Индексы таблицы `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Индексы таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Индексы таблицы `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Индексы таблицы `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Индексы таблицы `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Индексы таблицы `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Индексы таблицы `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- База данных: `projectback`
--
CREATE DATABASE IF NOT EXISTS `projectback` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projectback`;

-- --------------------------------------------------------

--
-- Структура таблицы `approves`
--

CREATE TABLE `approves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `committeMNDate` date NOT NULL,
  `committeMNNumber` int(11) DEFAULT NULL,
  `committeSCDate` date NOT NULL,
  `committeSCNumber` int(11) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `approves`
--

INSERT INTO `approves` (`id`, `committeMNDate`, `committeMNNumber`, `committeSCDate`, `committeSCNumber`, `orderNumber`, `orderDate`, `resolution`, `deleted_at`, `created_at`, `updated_at`, `review_id`) VALUES
(16, '2023-10-11', 10, '2023-10-02', 10, 10, '2023-10-01', 'Не має ухвали', NULL, '2023-10-31 15:18:09', '2023-10-31 15:18:09', 8),
(27, '2023-10-30', 13, '2023-10-31', 8, 8, '2023-11-02', 'Не має ухвали', NULL, '2023-11-02 09:47:54', '2023-11-02 09:47:54', 33),
(35, '2024-06-11', 7, '2024-06-11', 7, 7, '2024-06-11', 'Не має ухвали від комісії.', NULL, '2024-06-25 16:02:49', '2024-08-24 03:44:26', 38),
(39, '2024-06-17', 10, '2024-06-07', 4, 7, '2024-06-23', 'Не має ухвали та не буде!', NULL, '2024-07-29 13:26:49', '2024-10-01 09:11:47', 39),
(49, '2024-08-16', 10, '2024-08-22', 10, 0, '2000-01-01', 'Не має ухвали', NULL, '2024-08-22 11:45:02', '2024-08-22 11:45:02', 43),
(55, '2024-10-15', 4, '2024-10-01', 4, 4, '2024-10-14', 'все чудово', NULL, '2024-10-05 05:10:08', '2024-10-05 05:10:08', 47),
(57, '2024-10-01', 5, '2024-10-02', 5, 5, '2024-10-14', 'Не має ухвали', NULL, '2024-10-06 07:00:58', '2024-10-06 07:00:58', 50),
(59, '2000-01-01', 0, '2000-01-01', 0, 0, '2000-01-01', 'Не має ухвали', NULL, '2024-10-06 12:12:34', '2024-10-06 12:12:34', 52),
(60, '2023-01-01', 4, '2024-01-01', 4, 4, '2024-01-01', 'Не має ухвали', NULL, '2024-10-06 12:12:34', '2024-10-06 12:13:43', 53),
(62, '2024-11-06', 11, '2024-11-06', 11, 11, '2024-11-11', 'Не має ухвали', NULL, '2024-11-16 11:21:28', '2024-11-16 11:21:28', 63),
(63, '2024-11-18', 1, '2024-11-16', 4, 10, '2024-11-11', 'Комісія ухвалила вашу заяву', NULL, '2024-11-19 15:18:53', '2024-11-19 15:18:53', 68);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Перейменування кафедри', NULL, NULL),
(2, 'Зміна гаранта', NULL, NULL),
(3, 'Оновлення складу проєктної групи', NULL, NULL),
(4, 'Внесення змін до ОП (ОПП, ОНП)', NULL, NULL),
(5, 'Закриття ОП (ОПП, ОНП)', NULL, NULL),
(6, 'Проєктна група для започаткування ОП', NULL, NULL),
(7, 'Започаткування ОП (ОПП, ОНП)', NULL, NULL),
(8, 'Інше', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `comment`, `review_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Неправильно внесені данні, виправіть!', 6, 13, '2023-10-27 08:53:25', '2023-10-27 08:53:25'),
(2, 'Не було обгрунтована заява!', 6, 13, '2023-10-27 09:44:30', '2023-10-27 09:44:30'),
(6, 'dfghjkl', 3, 13, '2023-10-31 15:12:04', '2023-10-31 15:12:04'),
(7, 'vghjkl ljkj jjk ij;ioj oij;j ijuy guy g iyukg uy g uyg uy g uyjg jh g uyg kuyg uyg yjg uykg  g uyguy kg yuhg yu guy g yu yu g yug y gyu g yug yg uy gy gu gyk yg yuyukgu ygu ygu yu', 16, 13, '2023-11-01 05:16:01', '2023-11-01 05:16:01'),
(8, 'jbhj ljh jhuh hlhjkhkjh kjhl khl  khljhjjh hjhgfdretrf ygrtfuytf tyfrderftgyuh detygu dhtryjguh drtyuh gdrftgyhju cfgthj', 15, 13, '2023-11-01 05:17:24', '2023-11-01 05:17:24'),
(9, 'Все добре!', 16, 13, '2023-11-01 10:11:36', '2023-11-01 10:11:36'),
(10, 'Завантажені файли не стосуються Вашої ОП! Подайте ще раз заяву з коректними файлами.', 18, 13, '2023-11-02 05:10:15', '2023-11-02 05:10:15'),
(12, 'Непраильне ID ОП, Ви написати ID не актуальної ОП зі станою назвою спецівльності! Перегляньте зауваження та виправіть. Також оновіть витяг із засідання кафедри.', 18, 16, '2023-11-02 05:14:39', '2023-11-02 05:14:39'),
(14, 'неправильне ID ОП', 9, 28, '2024-02-04 06:45:53', '2024-02-04 06:45:53'),
(16, 'Не правильна назва ОП!', 39, 28, '2024-03-04 06:14:01', '2024-03-04 06:14:01'),
(20, 'Не має файлів', 45, 28, '2024-10-01 09:09:17', '2024-10-01 09:09:17'),
(21, 'У вас все добре', 47, 28, '2024-10-05 04:01:28', '2024-10-05 04:01:28'),
(22, 'У вас все добре!', 45, 28, '2024-10-05 04:03:36', '2024-10-05 04:03:36'),
(23, 'У вас не вистачає файлів!', 45, 28, '2024-10-05 04:04:20', '2024-10-05 04:04:20'),
(26, 'Не правильно задали освітній рівекнь.', 68, 28, '2024-11-19 15:07:09', '2024-11-19 15:07:09'),
(27, 'Подайте повторно заяву!', 68, 32, '2024-11-19 15:08:15', '2024-11-19 15:08:15'),
(28, 'Не достатньо файлів!', 30, 28, '2024-12-04 18:08:50', '2024-12-04 18:08:50');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `review_id`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(40, 39, 'ОП Англ.-укр. переклад..._2023.pdf', 'uploads/39/1N2l7Vt9i2GPvsX510teAq28nQgnjJlyyxQxohRF.pdf', '2024-02-09 06:53:56', '2024-02-09 06:53:56'),
(41, 39, 'ОП Укр. мова та література_2023.pdf', 'uploads/39/s3Rby12LeoDrGeyy7i7kv4KSSroGh2iJfBSBo2yz.pdf', '2024-02-09 06:53:56', '2024-02-09 06:53:56'),
(42, 39, 'ОП Геодезія та землеустрій_2023.pdf', 'uploads/39/GZJK5HZMXZWv8bwc5w2OeIKPo3YF34cyoM1WMtPH.pdf', '2024-02-09 06:53:56', '2024-02-09 06:53:56'),
(43, 39, 'ОП Кібербезпека_2023.pdf', 'uploads/39/usVfDHTiKvwpZneeak4ac2doMmY0v0Orpo16KKKK.pdf', '2024-02-09 06:53:56', '2024-02-09 06:53:56'),
(44, 40, '_Рівняння..pdf', 'uploads/40/fX4XGwSlWT4nh0TKIu9MDS6Mua54hbpiRpWAFm0I.pdf', '2024-04-20 03:36:00', '2024-04-20 03:36:00'),
(45, 40, 'Інтеграл (1).pdf', 'uploads/40/CdUOBFAdiPsChljnJkecFnkoFUrYsrci21UPgdYq.pdf', '2024-04-20 03:36:00', '2024-04-20 03:36:00'),
(46, 40, 'Первісна.pdf', 'uploads/40/IkGmcFWjQCs2AnOxpq5iAEklfJqIbjkdDUS0V7LK.pdf', '2024-04-20 03:36:00', '2024-04-20 03:36:00'),
(52, 43, '5.pdf', 'uploads/43/fiOTsJc3FST8ARXQUU4lIOPGouUNxGE6RNAJgfWq.pdf', '2024-07-29 11:39:05', '2024-07-29 11:39:05'),
(53, 43, '9.pdf', 'uploads/43/RdKJuxOj11R2bvZ0OatMiP2W0DxLsWUrOwL5WZZz.pdf', '2024-07-29 11:39:05', '2024-07-29 11:39:05'),
(54, 43, 'Hauka (1).pdf', 'uploads/43/GLhP0S01IA0JEvutpAyIZ5QGeHE7CAtCLvijFNgE.pdf', '2024-07-29 11:39:05', '2024-07-29 11:39:05'),
(55, 43, 'Про алгоритм дій під час .pdf', 'uploads/43/QMt33gAgtF5erUpbNDTYQZF8xQDgPITqj9J1NDox.pdf', '2024-07-29 11:39:05', '2024-07-29 11:39:05'),
(73, 46, '5.pdf', 'uploads/46/drLmtmCne8Wxy0HFWUjovv87L8GroIx8W8LyajgN.pdf', '2024-08-20 04:04:16', '2024-08-20 04:04:16'),
(74, 46, 'Hauka (1).pdf', 'uploads/46/Z20Gqn9Nm5ZMKEJEzkQpsHZiIOSvkqQMrl5LN52v.pdf', '2024-08-20 04:04:16', '2024-08-20 04:04:16'),
(75, 46, '9.pdf', 'uploads/46/5R69zz2e6dK45UgJjFCXXQC1s8hJmcDzab3xKKuN.pdf', '2024-08-20 04:04:16', '2024-08-20 04:04:16'),
(76, 47, '5.pdf', 'uploads/47/bQH3Duqfim14nbfOP6WZW97iGyBVInuTM3eTrnTT.pdf', '2024-08-20 08:40:31', '2024-08-20 08:40:31'),
(77, 47, 'Про алгоритм дій під час .pdf', 'uploads/47/JXs4bCqwtXRRHhWsTcKPXSEm2T6n9A4o8OCdqtiC.pdf', '2024-08-20 08:40:31', '2024-08-20 08:40:31'),
(78, 47, '9.pdf', 'uploads/47/FAdsKhZ0d6ErNDxEcXg1hFswgDcU3veEkocUEJmY.pdf', '2024-08-20 08:40:31', '2024-08-20 08:40:31'),
(79, 48, '5 клас Робототехніка (35 год).pdf', 'uploads/48/F9nvB1lOtoP5IYlbjA1qvNCYkzoICARv7NxBCa9P.pdf', '2024-08-22 12:49:32', '2024-08-22 12:49:32'),
(80, 48, '9.pdf', 'uploads/48/qENGMg7zCly2JjEJrdh0IS6BOOSFW6ud7sviiqO9.pdf', '2024-08-22 12:49:32', '2024-08-22 12:49:32'),
(81, 48, 'AI приклади.pdf', 'uploads/48/XGBJJRmnzjkJsnZvBNYrLqpbafCigJ5pLsKUoPjj.pdf', '2024-08-22 12:49:32', '2024-08-22 12:49:32'),
(82, 48, 'AI in Education and the Workforce.pdf', 'uploads/48/gpGM66YA76N21nzi5OVrVO9qrkdymjEvEdFrjwnh.pdf', '2024-08-22 12:49:32', '2024-08-22 12:49:32'),
(83, 48, '5.pdf', 'uploads/48/vzZePJDV1Ym2ugsk6S2ij2VchYwcVnl4xshOvSki.pdf', '2024-08-22 12:49:32', '2024-08-22 12:49:32'),
(87, 50, 'AI приклади.pdf', 'uploads/50/WGExFfKNJtGLZl5U4A8rxmDRHpiJj5InrqO29iM1.pdf', '2024-10-03 11:22:55', '2024-10-03 11:22:55'),
(88, 50, 'Hauka (1).pdf', 'uploads/50/7r60OB18tJR9MgKFZ66mMrIVQ3gaiIHWeT4wT0Rv.pdf', '2024-10-03 11:22:55', '2024-10-03 11:22:55'),
(89, 50, 'AI приклади.pdf', 'uploads/50/MQPwaAqfai2N8OpOYwwIoNnJSVgNGJCcm9QfDbYj.pdf', '2024-10-03 11:22:57', '2024-10-03 11:22:57'),
(90, 50, 'Hauka (1).pdf', 'uploads/50/J1pVOhSa2zIMd6j1tBHww1amtuBp8s1JXWLLhJvE.pdf', '2024-10-03 11:22:57', '2024-10-03 11:22:57'),
(91, 50, 'AI приклади.pdf', 'uploads/50/bOoza5DeLdndAuuQqevETMjtTZAM1Pg4lNSrdKad.pdf', '2024-10-03 11:22:58', '2024-10-03 11:22:58'),
(92, 50, 'Hauka (1).pdf', 'uploads/50/CeVTsrhBtlBgUhxglsvE4agWxGO31nX14NlDndVs.pdf', '2024-10-03 11:22:58', '2024-10-03 11:22:58'),
(93, 50, 'Проєкти Робототехніка (1).pdf', 'uploads/50/6SLneMbXSiZu8kOO2UgznGeKcIFQ9GmWBCPB0FW7.pdf', '2024-10-03 11:22:58', '2024-10-03 11:22:58'),
(94, 50, 'Проєкти Робототехніка (2).pdf', 'uploads/50/LCYPOOIlLhl3bVhDTk4E8fMbdZI29c7kStjv0S8U.pdf', '2024-10-03 11:22:58', '2024-10-03 11:22:58'),
(95, 50, 'AI приклади.pdf', 'uploads/50/BkY0bbHkls3oaT7hHbk14CvfslIKYpBkItL22nn4.pdf', '2024-10-03 11:22:59', '2024-10-03 11:22:59'),
(96, 50, 'Hauka (1).pdf', 'uploads/50/JUZZ9kePo3fD3uu4pJkyER7HafWFWzNLCxkI4Bx8.pdf', '2024-10-03 11:22:59', '2024-10-03 11:22:59'),
(97, 50, 'Проєкти Робототехніка (1).pdf', 'uploads/50/lWm6lhLqHPA2AZ3kzem1GwAXy1WaurE56cVmBA2t.pdf', '2024-10-03 11:22:59', '2024-10-03 11:22:59'),
(98, 50, 'Проєкти Робототехніка (2).pdf', 'uploads/50/HXW2VJZgwePaIGw2wFF5I2heCTRZ1CccVV5Acodo.pdf', '2024-10-03 11:22:59', '2024-10-03 11:22:59'),
(110, 52, '130_сертифікат_Міхалчан М.pdf', 'uploads/52/e07O0Sd0NoNwpZjwP0WwpvkJnuL0Cb0z7rVbvZ1a.pdf', '2024-10-03 11:29:25', '2024-10-03 11:29:25'),
(111, 52, 'AI приклади.pdf', 'uploads/52/YGaWaLlwpofC4xYPk0dnGWCJL4mqO5BSfnS0JgQt.pdf', '2024-10-03 11:29:25', '2024-10-03 11:29:25'),
(112, 52, 'Hauka (1).pdf', 'uploads/52/5ERU5HfUUlbQYRGvqtAv8PK6Crvlljqk7AGiU2sa.pdf', '2024-10-03 11:29:25', '2024-10-03 11:29:25'),
(113, 52, '130_сертифікат_Міхалчан М.pdf', 'uploads/52/mOSLzvChz7eVcdDQhpMr7oXxCcR4wQbRBgY3J6qA.pdf', '2024-10-03 11:29:28', '2024-10-03 11:29:28'),
(114, 52, 'AI приклади.pdf', 'uploads/52/kR2Wz1CdsWVuR1VlGJTAjbkes3eoTu28zfZOsTw9.pdf', '2024-10-03 11:29:28', '2024-10-03 11:29:28'),
(115, 52, 'Hauka (1).pdf', 'uploads/52/Sa9rLL5fKqwAOI9JAHUJgQ2qzrVoVluPNzXr2YOD.pdf', '2024-10-03 11:29:28', '2024-10-03 11:29:28'),
(116, 52, '130_сертифікат_Міхалчан М.pdf', 'uploads/52/OCvaxxTku7psXpvqacnfoOyyNnp83KVMumOQPqPE.pdf', '2024-10-03 11:29:32', '2024-10-03 11:29:32'),
(117, 52, 'AI приклади.pdf', 'uploads/52/5IV7ZgHi9mviTBJqN1nibVAxX1ezL4mRiFt4Auen.pdf', '2024-10-03 11:29:32', '2024-10-03 11:29:32'),
(118, 52, 'Hauka (1).pdf', 'uploads/52/cJs5mAWZZts8U5JX9wLsxpEKlvrFf9OlKw9iGPdJ.pdf', '2024-10-03 11:29:32', '2024-10-03 11:29:32'),
(119, 52, 'Про алгоритм дій під час .pdf', 'uploads/52/ckh6tbdu7QerZA1RW3lQ4wdW63U6gKBZuHYTd1ll.pdf', '2024-10-03 11:29:32', '2024-10-03 11:29:32'),
(120, 52, 'Проєкти Робототехніка (1).pdf', 'uploads/52/PPv7gQzJD5EkOxhwKLD8bFRh1pI4jLeced1CpC63.pdf', '2024-10-03 11:29:32', '2024-10-03 11:29:32'),
(121, 53, 'Проєкти Робототехніка (1).pdf', 'uploads/53/3AqA4rC8uTdCi8ZoXzCuvYOH0VLyWvhQl2PXjo6i.pdf', '2024-10-05 03:59:26', '2024-10-05 03:59:26'),
(122, 53, 'Проєкти Робототехніка (2).pdf', 'uploads/53/Jkz5FwQULnsRe7yKado94FKMBfVskVrC33UjuTer.pdf', '2024-10-05 03:59:26', '2024-10-05 03:59:26'),
(123, 53, 'Проєкти Робототехніка (3).pdf', 'uploads/53/7TlgCtLwhKR86xSbRjCFq4d93yyvt7N9ZHVl4YXr.pdf', '2024-10-05 03:59:26', '2024-10-05 03:59:26'),
(124, 56, 'Про алгоритм дій під час .pdf', 'uploads/56/Haytg3FxwDSYBPiLj0i6LFFtZ7vilBPmIvBsHTNv.pdf', '2024-10-06 11:40:23', '2024-10-06 11:40:23'),
(125, 56, 'Проєкти Робототехніка (1).pdf', 'uploads/56/U06BnDCrJ42OSUjZpk0sy93GBat3GuZQGZuPtvD3.pdf', '2024-10-06 11:40:23', '2024-10-06 11:40:23'),
(132, 57, 'Про алгоритм дій під час .pdf', 'uploads/57/ZWqWadYOuiFbdt9SPZWKLDFpWMEpStbLXAY9jA0W.pdf', '2024-10-15 12:06:49', '2024-10-15 12:06:49'),
(142, 58, 'AI приклади.pdf', 'uploads/58/CtNEuD44RRaDMe3iLVL2NQ58Fw9wjJ7p045EJgQ1.pdf', '2024-11-16 08:56:24', '2024-11-16 08:56:24'),
(143, 58, 'вчителі.pdf', 'uploads/58/swQDlmvM5vYUHHrsau08BMw9xzeL1MlIxotpRr6L.pdf', '2024-11-16 08:56:24', '2024-11-16 08:56:24'),
(145, 58, '9.pdf', 'uploads/58/rUXQzB5tqbk2JBdgm8c4Lrurk7EPJ0wGkQGXK1zp.pdf', '2024-11-16 08:56:24', '2024-11-16 08:56:24'),
(146, 62, 'Hauka (1).pdf', 'uploads/62/wD0ybqtSOQEN4c1K1fqMewfeYyrlpLFU03nBl38X.pdf', '2024-11-16 10:02:52', '2024-11-16 10:02:52'),
(147, 68, 'вчителі.pdf', 'uploads/68/yQeymJxFUNygnMBxqn6JpQYrLw5agz6wJBaWDh5T.pdf', '2024-11-19 14:59:40', '2024-11-19 14:59:40'),
(148, 68, 'Про алгоритм дій під час .pdf', 'uploads/68/AeBLrsvuGxXLNMkCYUyc61ywy6QHJN9cKkOMqYIc.pdf', '2024-11-19 14:59:40', '2024-11-19 14:59:40');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Користувач', NULL, NULL),
(2, 'Комісія', NULL, NULL),
(3, 'Адміністратор', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `group_user`
--

CREATE TABLE `group_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_user`
--

INSERT INTO `group_user` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 1, 13, NULL, NULL),
(13, 3, 13, NULL, NULL),
(14, 2, 13, NULL, NULL),
(16, 2, 15, NULL, NULL),
(19, 1, 15, NULL, NULL),
(21, 1, 17, NULL, NULL),
(25, 1, 18, NULL, NULL),
(26, 1, 19, NULL, NULL),
(27, 1, 20, NULL, NULL),
(28, 3, 20, NULL, NULL),
(29, 2, 23, NULL, NULL),
(30, 1, 23, NULL, NULL),
(33, 1, 25, NULL, NULL),
(35, 1, 27, NULL, NULL),
(47, 2, 30, NULL, NULL),
(48, 1, 30, NULL, NULL),
(49, 1, 31, NULL, NULL),
(61, 1, 28, NULL, NULL),
(62, 2, 28, NULL, NULL),
(63, 3, 28, NULL, NULL),
(64, 1, 24, NULL, NULL),
(65, 3, 24, NULL, NULL),
(66, 1, 16, NULL, NULL),
(67, 1, 26, NULL, NULL),
(68, 1, 29, NULL, NULL),
(70, 1, 32, NULL, NULL),
(71, 2, 32, NULL, NULL),
(72, 2, 33, NULL, NULL),
(73, 1, 33, NULL, NULL),
(74, 3, 33, NULL, NULL),
(75, 1, 36, NULL, NULL),
(77, 1, 37, NULL, NULL),
(78, 3, 37, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_03_22_080634_create_ops_table', 1),
(3, '2023_10_02_071835_create_categories_table', 1),
(4, '2023_10_02_071910_create_statuses_table', 1),
(5, '2023_10_03_093556_create_approves_table', 1),
(9, '2014_10_12_000000_create_users_table', 4),
(10, '2014_10_12_100000_create_password_resets_table', 4),
(11, '2019_08_19_000000_create_failed_jobs_table', 4),
(12, '2023_10_07_081317_create_groups_table', 5),
(13, '2023_10_07_081414_create_group_user_table', 5),
(14, '2023_10_10_062403_create_review_table', 6),
(15, '2023_10_10_075704_create_reviews_table', 7),
(16, '2023_10_27_113904_create_comments_table', 8),
(17, '2023_10_31_075302_create_files_table', 9),
(19, '2024_10_05_074633_create_responsible_for_reviews_table', 10),
(21, '2024_10_05_160711_create_sessions_table', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `ops`
--

CREATE TABLE `ops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch` varchar(255) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `specialisation` varchar(255) NOT NULL,
  `op` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ops`
--

INSERT INTO `ops` (`id`, `branch`, `speciality`, `specialisation`, `op`, `created_at`, `updated_at`) VALUES
(16, '01 Освіта/Педагогіка', '011 Науки про освіту', '', '18060 соціальна педагогіка', NULL, NULL),
(17, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '27405 Дошкільна освіта (Логопедія)', NULL, NULL),
(18, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '26895 Дошкільна освіта', NULL, NULL),
(19, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '28040 Дошкільна освіта (Практична психологія)', NULL, NULL),
(20, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '28038 Дошкільна освіта (Психологія в закладах дошкільної освіти)', NULL, NULL),
(21, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '31582 Дошкільна освіта (Логопедія)', NULL, NULL),
(22, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '2508 дошкільна освіта', NULL, NULL),
(23, '01 Освіта/Педагогіка', '012 Дошкільна освіта', '', '28044 Дошкільна освіта (Психологія в закладах дошкільної освіти)', NULL, NULL),
(24, '01 Освіта/Педагогіка', '013 Початкова освіта', '', '2820 Початкова освіта', NULL, NULL),
(25, '01 Освіта/Педагогіка', '013 Початкова освіта', '', '26896 Початкова освіта', NULL, NULL),
(26, '01 Освіта/Педагогіка', '014 Середня освіта', '', '18026 Зарубіжна література та англійська мова', NULL, NULL),
(27, '01 Освіта/Педагогіка', '014 Середня освіта', '014.01 Українська мова і література', '1247 Українська мова та література', NULL, NULL),
(28, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література', '22993 Англійська мова і література та друга іноземна мова', NULL, NULL),
(29, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література', '2806 Румунська мова та література', NULL, NULL),
(30, '01 Освіта/Педагогіка', '014 Середня освіта', '014.03 Історія', '29244 Середня освіта (Історія)', NULL, NULL),
(31, '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '18044 Математика та інформатика', NULL, NULL),
(32, '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '2764 Математика', NULL, NULL),
(33, '01 Освіта/Педагогіка', '014 Середня освіта', '014.05 Біологія', '2976 Біологія', NULL, NULL),
(34, '01 Освіта/Педагогіка', '014 Середня освіта', '014.06 Хімія', '2379 Хімія', NULL, NULL),
(35, '01 Освіта/Педагогіка', '014 Середня освіта', '014.07 Географія', '2509 Географія', NULL, NULL),
(36, '01 Освіта/Педагогіка', '014 Середня освіта', '014.08 Фізика', '1566 Фізика, інформатика', NULL, NULL),
(37, '01 Освіта/Педагогіка', '014 Середня освіта', '014.08 Фізика', '2255 Фізика', NULL, NULL),
(38, '01 Освіта/Педагогіка', '014 Середня освіта', '014.09 Інформатика', '2439 Інформатика та математика', NULL, NULL),
(39, '01 Освіта/Педагогіка', '014 Середня освіта', '014.09 Інформатика', '2398 Інформатика', NULL, NULL),
(40, '01 Освіта/Педагогіка', '014 Середня освіта', '014.10 Трудове навчання та технології', '3183 Трудове навчання, технології, інформатика', NULL, NULL),
(41, '01 Освіта/Педагогіка', '014 Середня освіта', '014.10 Трудове навчання та технології', '3749 Трудове навчання та технології', NULL, NULL),
(42, '01 Освіта/Педагогіка', '014 Середня освіта', '014.11 Фізична культура', '2994 Фізична культура', NULL, NULL),
(43, '01 Освіта/Педагогіка', '014 Середня освіта', '014.11 Фізична культура', '2821 Фізичне виховання', NULL, NULL),
(44, '01 Освіта/Педагогіка', '014 Середня освіта', '014.13 Музичне мистецтво', '3377 Музичне мистецтво', NULL, NULL),
(45, '01 Освіта/Педагогіка', '014 Середня освіта', '014.13 Музичне мистецтво', '27404 Середня освіта (Музичне мистецтво)', NULL, NULL),
(46, '01 Освіта/Педагогіка', '014 Середня освіта', '014.05 Біологія та здоров’я людини', '22988 Біологія та здоров\'я людини', NULL, NULL),
(47, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література (англійська)', '36296 Англійська мова і література та друга іноземна мова', NULL, NULL),
(48, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література (румунська)', '36302 Румунська мова та література', NULL, NULL),
(49, '01 Освіта/Педагогіка', '014 Середня освіта', '014.027 Румунська/молдовська мова і література', '39762 Румунська мова та література', NULL, NULL),
(50, '01 Освіта/Педагогіка', '014 Середня освіта', '014.021 Англійська мова і література', '39765 Англійська мова і література та друга іноземна мова', NULL, NULL),
(51, '01 Освіта/Педагогіка', '014 Середня освіта', '014.022 Німецька мова і література', '39766 Німецька мова і література та друга іноземна мова', NULL, NULL),
(52, '01 Освіта/Педагогіка', '014 Середня освіта', '014.023 Французька мова і література', '39767 Французька мова і література та друга іноземна мова', NULL, NULL),
(53, '01 Освіта/Педагогіка', '014 Середня освіта', '014.021 Англійська мова та зарубіжна література', '60905 Англійська мова та зарубіжна література', NULL, NULL),
(54, '01 Освіта/Педагогіка', '014 Середня освіта', '014.027 Румунська мова/мова молдовської національної меншини та зарубіжна література', '60912 Румунська мова та література. Зарубіжна література', NULL, NULL),
(55, '01 Освіта/Педагогіка', '014 Середня освіта', '', '26419 Біологія', NULL, NULL),
(56, '01 Освіта/Педагогіка', '014 Середня освіта', '014.01 Українська мова і література', '2356 Українська мова та література', NULL, NULL),
(57, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література', '1559 Румунська мова та література', NULL, NULL),
(58, '01 Освіта/Педагогіка', '014 Середня освіта', '014.03 Історія', '29130 Середня освіта (Історія)', NULL, NULL),
(59, '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '38764 Математика та інформатика', NULL, NULL),
(60, '01 Освіта/Педагогіка', '014 Середня освіта', '014.05 Біологія', '2995 Біологія', NULL, NULL),
(61, '01 Освіта/Педагогіка', '014 Середня освіта', '014.06 Хімія', '3070 Хімія', NULL, NULL),
(62, '01 Освіта/Педагогіка', '014 Середня освіта', '014.07 Географія', '2399 Географія', NULL, NULL),
(63, '01 Освіта/Педагогіка', '014 Середня освіта', '014.08 Фізика', '2261 Фізика, інформатика', NULL, NULL),
(64, '01 Освіта/Педагогіка', '014 Середня освіта', '014.08 Фізика', '3272 Фізика', NULL, NULL),
(65, '01 Освіта/Педагогіка', '014 Середня освіта', '014.10 Трудове навчання та технології', '1563 Трудове навчання та технології', NULL, NULL),
(66, '01 Освіта/Педагогіка', '014 Середня освіта', '014.10 Трудове навчання та технології', '2441 технологічна освіта', NULL, NULL),
(67, '01 Освіта/Педагогіка', '014 Середня освіта', '014.11 Фізична культура', '22962 Фізична культура', NULL, NULL),
(68, '01 Освіта/Педагогіка', '014 Середня освіта', '014.11 Фізична культура', '3093 фізичне виховання', NULL, NULL),
(69, '01 Освіта/Педагогіка', '014 Середня освіта', '014.13 Музичне мистецтво', '2586 Музичне мистецтво', NULL, NULL),
(70, '01 Освіта/Педагогіка', '014 Середня освіта', '014.13 Музичне мистецтво', '28049 Середня освіта (Музичне мистецтво)', NULL, NULL),
(71, '01 Освіта/Педагогіка', '014 Середня освіта', '014.05 Біологія та здоров’я людини', '23652 Біологія та здоров\'я людини', NULL, NULL),
(72, '01 Освіта/Педагогіка', '014 Середня освіта', '014.02 Мова і література (румунська)', '36303 Румунська мова та література', NULL, NULL),
(73, '01 Освіта/Педагогіка', '014 Середня освіта', '014.021 Англійська мова і література', '39834 Англійська мова і література та друга іноземна мова', NULL, NULL),
(74, '01 Освіта/Педагогіка', '014 Середня освіта', '014.022 Німецька мова і література', '39908 Німецька мова і література та друга іноземна мова', NULL, NULL),
(75, '01 Освіта/Педагогіка', '014 Середня освіта', '014.023 Французька мова і література', '39909 Французька мова і література та друга іноземна мова', NULL, NULL),
(76, '01 Освіта/Педагогіка', '014 Середня освіта', '014.027 Румунська/молдовська мова і література', '39913 Румунська мова та література', NULL, NULL),
(77, '01 Освіта/Педагогіка', '014 Середня освіта', '014.09 Інформатика', '56933 Інформатика та інформаційні технології в освіті', NULL, NULL),
(78, '01 Освіта/Педагогіка', '014 Середня освіта', '014.09 Інформатика', '51462 Інформатика та математика', NULL, NULL),
(79, '01 Освіта/Педагогіка', '014 Середня освіта', '014.021 Англійська мова та зарубіжна література', '60906 Англійська мова та зарубіжна література', NULL, NULL),
(80, '01 Освіта/Педагогіка', '014 Середня освіта', '014.027 Румунська мова/мова молдовської національної меншини та зарубіжна література', '60913 Румунська мова та література. Зарубіжна література', NULL, NULL),
(81, '01 Освіта/Педагогіка', '015 Професійна освіта', '015.11 Машинобудування', '32698 Машинобудування', NULL, NULL),
(82, '01 Освіта/Педагогіка', '015 Професійна освіта', '015.34 Машинобудування', '40225 Машинобудування', NULL, NULL),
(83, '01 Освіта/Педагогіка', '015 Професійна освіта', '015.11 Машинобудування', '2928 Машинобудування', NULL, NULL),
(84, '01 Освіта/Педагогіка', '015 Професійна освіта', '015.34 Машинобудування', '40224 Машинобудування', NULL, NULL),
(85, '01 Освіта/Педагогіка', '015 Професійна освіта', '', '38593 Теорія і методика професійної освіти', NULL, NULL),
(86, '01 Освіта/Педагогіка', '015 Професійна освіта', '015.11 Машинобудування', '2587 Машинобудування', NULL, NULL),
(87, '01 Освіта/Педагогіка', '016 Спеціальна освіта', '016.01 Логопедія', '60545 Логопедія', NULL, NULL),
(88, '01 Освіта/Педагогіка', '016 Спеціальна освіта', '016.01 Логопедія', '60545 Логопедія', NULL, NULL),
(89, '01 Освіта/Педагогіка', '017 Фізична культура і спорт', '', '2582 Фізична культура і спорт', NULL, NULL),
(90, '01 Освіта/Педагогіка', '017 Фізична культура і спорт', '', '25714 Фітнес та рекреація', NULL, NULL),
(91, '01 Освіта/Педагогіка', '017 Фізична культура і спорт', '', '26898 Фізична культура і спорт', NULL, NULL),
(92, '02 Культура і мистецтво', '023 Образотворче мистецтво, декоративне мистецтво, реставрація', '', '29586 Образотворче мистецтво, декоративне мистецтво, реставрація', NULL, NULL),
(93, '02 Культура і мистецтво', '023 Образотворче мистецтво, декоративне мистецтво, реставрація', '', '27440 Декоративно-прикладне та образотворче мистецтво', NULL, NULL),
(94, '02 Культура і мистецтво', '023 Образотворче мистецтво, декоративне мистецтво, реставрація', '', '24241 Образотворче мистецтво, декоративне мистецтво, реставрація', NULL, NULL),
(95, '02 Культура і мистецтво', '025 Музичне мистецтво', '', '4117 музичне мистецтво', NULL, NULL),
(96, '02 Культура і мистецтво', '025 Музичне мистецтво', '', '28051 Музичне мистецтво', NULL, NULL),
(97, '02 Культура і мистецтво', '025 Музичне мистецтво', '', '27406 Музичне мистецтво', NULL, NULL),
(98, '02 Культура і мистецтво', '027 Музеєзнавство, пам’яткознавство', '', '29296 Музеєзнавство, пам’яткознавство', NULL, NULL),
(99, '02 Культура і мистецтво', '029 Інформаційна, бібліотечна та архівна справа', '', '22913 Інформаційна діяльність', NULL, NULL),
(100, '02 Культура і мистецтво', '029 Інформаційна, бібліотечна та архівна справа', '', '29297 Інформаційна, бібліотечна та архівна справа', NULL, NULL),
(101, '03 Гуманітарні науки', '031 Релігієзнавство', '', '26900 Релігієзнавство', NULL, NULL),
(102, '03 Гуманітарні науки', '031 Релігієзнавство', '', '3178 Релігієзнавство', NULL, NULL),
(103, '03 Гуманітарні науки', '031 Релігієзнавство', '', '38594 Релігієзнавство', NULL, NULL),
(104, '03 Гуманітарні науки', '032 Історія та археологія', '', '38595 Історія та археологія', NULL, NULL),
(105, '03 Гуманітарні науки', '032 Історія та археологія', '', '1250 Історія та археологія', NULL, NULL),
(106, '03 Гуманітарні науки', '032 Історія та археологія', '', '29245 Історія та археологія', NULL, NULL),
(107, '03 Гуманітарні науки', '033 Філософія', '', '26901 Філософія', NULL, NULL),
(108, '03 Гуманітарні науки', '033 Філософія', '', '2384 Філософія', NULL, NULL),
(109, '03 Гуманітарні науки', '033 Філософія', '', '38596 Філософія', NULL, NULL),
(110, '03 Гуманітарні науки', '034 Культурологія', '', '24244 Культурологія', NULL, NULL),
(111, '03 Гуманітарні науки', '034 Культурологія', '', '26902 Культурологія', NULL, NULL),
(112, '03 Гуманітарні науки', '035 Філологія', '', '18032 Зарубіжна література та теорія літератури', NULL, NULL),
(113, '02 Культура і мистецтво', '035 Філологія', '035.01 українська мова та література', '2930 Українська мова та література', NULL, NULL),
(114, '02 Культура і мистецтво', '035 Філологія', '035.01 українська мова та література', '3651 Зарубіжна література та теорія літератури', NULL, NULL),
(115, '02 Культура і мистецтво', '035 Філологія', '035.04 германські мови та літератури (переклад включно)', '28442 Англійська мова і література та друга іноземна мова', NULL, NULL),
(116, '02 Культура і мистецтво', '035 Філологія', '035.04 германські мови та літератури (переклад включно)', '28453 Англійсько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(117, '02 Культура і мистецтво', '035 Філологія035 Філологія', '035.04 германські мови та літератури (переклад включно)', '3187 Англійсько-український переклад', NULL, NULL),
(118, '02 Культура і мистецтво', '035 Філологія', '035.05 романські мови та літератури (переклад включно)', '1245 Румунська мова та література', NULL, NULL),
(119, '02 Культура і мистецтво', '035 Філологія', '035.041 германські мови та літератури (переклад включно), перша - англійська', '23003 Англійська мова і література та друга іноземна мова', NULL, NULL),
(120, '02 Культура і мистецтво', '035 Філологія', '035.041 германські мови та літератури (переклад включно), перша - англійська', '23005 Англійсько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(121, '02 Культура і мистецтво', '035 Філологія', '035.041 германські мови та літератури (переклад включно), перша - англійська', '28448 Англійсько-український переклад та переклад з другої  іноземної мови', NULL, NULL),
(122, '02 Культура і мистецтво', '035 Філологія', '035.043 германські мови та літератури (переклад включно), перша - німецька', '23007 Німецько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(123, '02 Культура і мистецтво', '035 Філологія', '035.054 романські мови та літератури (переклад включно), перша - румунська', '23321 Румунська мова та література і англійська мова', NULL, NULL),
(124, '02 Культура і мистецтво', '035 Філологія', '035.054 романські мови та літератури (переклад включно), перша - румунська', '23322 Румунсько-український переклад', NULL, NULL),
(125, '02 Культура і мистецтво', '035 Філологія', '035.054 романські мови та літератури (переклад включно), перша - румунська', '30254 Румунська мова та література', NULL, NULL),
(126, '02 Культура і мистецтво', '035 Філологія', '035.055 романські мови та літератури (переклад включно), перша - французька', '23009 Французько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(127, '02 Культура і мистецтво', '035 Філологія', '035.033 слов’янські мови та літератури (переклад включно), перша - польська', '55452 Європейські славістичні студії. Польська мова та література (філологія)', NULL, NULL),
(128, '02 Культура і мистецтво', '035 Філологія', '', '18989 Зарубіжна література та теорія літератури', NULL, NULL),
(129, '02 Культура і мистецтво', '035 Філологія', '035.01 українська мова та література', '2783 Українська мова та література', NULL, NULL),
(130, '02 Культура і мистецтво', '035 Філологія', '035.01 українська мова та література', '1229 Зарубіжна література та теорія літератури', NULL, NULL),
(131, '02 Культура і мистецтво', '035 Філологія', '035.05 романські мови та літератури (переклад включно)', '2700 Румунська мова та література', NULL, NULL),
(132, '02 Культура і мистецтво', '035 Філологія', '035.041 германські мови та літератури (переклад включно), перша - англійська', '23004 Англійська мова і література та друга іноземна мова', NULL, NULL),
(133, '02 Культура і мистецтво', '035 Філологія', '035.041 германські мови та літератури (переклад включно), перша - англійська', '23006 Англійсько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(134, '02 Культура і мистецтво', '035 Філологія', '035.043 германські мови та літератури (переклад включно), перша - німецька', '23008 Німецько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(135, '02 Культура і мистецтво', '035 Філологія', '035.043 германські мови та літератури (переклад включно), перша - німецька', '23002 Німецька мова і література та друга іноземна мова', NULL, NULL),
(136, '02 Культура і мистецтво', '035 Філологія', '035.043 германські мови та літератури (переклад включно), перша - німецька', '52852 Німецька мова і література та англійська мова', NULL, NULL),
(137, '02 Культура і мистецтво', '035 Філологія', '035.054 романські мови та літератури (переклад включно), перша - румунська', '22979 Румунська мова та література', NULL, NULL),
(138, '02 Культура і мистецтво', '035 Філологія', '035.055 романські мови та літератури (переклад включно), перша - французька', '23010 Французько-український переклад та переклад з другої іноземної мови', NULL, NULL),
(139, '02 Культура і мистецтво', '035 Філологія', '035.055 романські мови та літератури (переклад включно), перша - французька', '23000 Французька мова і література та друга іноземна мова', NULL, NULL),
(140, '02 Культура і мистецтво', '035 Філологія', '035.055 романські мови та літератури (переклад включно), перша - французька', '54246 Французька мова та друга іноземна мова. Переклад з двох іноземних мов', NULL, NULL),
(141, '02 Культура і мистецтво', '035 Філологія', '', '38597 Філологія', NULL, NULL),
(142, '04 Богослов’я', '041 Богослов’я', '', '26903 Богослов\'я', NULL, NULL),
(143, '04 Богослов’я', '041 Богослов’я', '', '27312 Богослов\'я', NULL, NULL),
(144, '05 Соціальні та поведінкові науки', '051 Економіка', '', '1246 Економічна теорія', NULL, NULL),
(145, '05 Соціальні та поведінкові науки', '051 Економіка', '', '39764 Управління персоналом', NULL, NULL),
(146, '05 Соціальні та поведінкові науки', '051 Економіка', '', '2510 Економічна кібернетика', NULL, NULL),
(147, '05 Соціальні та поведінкові науки', '051 Економіка', '', '3030 Управління персоналом та економіка праці', NULL, NULL),
(148, '05 Соціальні та поведінкові науки', '051 Економіка', '', '3275 Аналітична економіка', NULL, NULL),
(149, '05 Соціальні та поведінкові науки', '051 Економіка', '', '3326 Інформаційні технології та моделювання в економіці', NULL, NULL),
(150, '05 Соціальні та поведінкові науки', '051 Економіка', '', '29246 Інформаційні технології та моделювання в економіці', NULL, NULL),
(151, '05 Соціальні та поведінкові науки', '051 Економіка', '', '31481 HR-інжиніринг (Управління людськими ресурсами)', NULL, NULL),
(152, '05 Соціальні та поведінкові науки', '051 Економіка', '', '3748 Управління персоналом та економіка праці', NULL, NULL),
(153, '05 Соціальні та поведінкові науки', '051 Економіка', '', '1249 Аналітична економіка', NULL, NULL),
(154, '05 Соціальні та поведінкові науки', '051 Економіка', '', '38598 Економіка', NULL, NULL),
(155, '05 Соціальні та поведінкові науки', '052 Політологія', '', '38599 Політологія', NULL, NULL),
(156, '05 Соціальні та поведінкові науки', '052 Політологія', '', '54206 Менеджмент політичної діяльності', NULL, NULL),
(157, '05 Соціальні та поведінкові науки', '052 Політологія', '', '1219 Політологія', NULL, NULL),
(158, '05 Соціальні та поведінкові науки', '052 Політологія', '', '26914 Політологія', NULL, NULL),
(159, '05 Соціальні та поведінкові науки', '053 Психологія', '', '3120 соціальна психологія', NULL, NULL),
(160, '05 Соціальні та поведінкові науки', '053 Психологія', '', '28057 Соціальна психологія', NULL, NULL),
(161, '05 Соціальні та поведінкові науки', '053 Психологія', '', '2778 Психологія', NULL, NULL),
(162, '05 Соціальні та поведінкові науки', '053 Психологія', '', '2702 практична психологія', NULL, NULL),
(163, '05 Соціальні та поведінкові науки', '053 Психологія', '', '28054 Практична психологія', NULL, NULL),
(164, '05 Соціальні та поведінкові науки', '053 Психологія', '', '3068 соціальна психологія', NULL, NULL),
(165, '05 Соціальні та поведінкові науки', '053 Психологія', '', '28053 Соціальна психологія', NULL, NULL),
(166, '05 Соціальні та поведінкові науки', '053 Психологія', '', '39880 Соціальна психологія управління', NULL, NULL),
(167, '05 Соціальні та поведінкові науки', '053 Психологія', '', '3072 Психологія', NULL, NULL),
(168, '05 Соціальні та поведінкові науки', '053 Психологія', '', '4116 практична психологія', NULL, NULL),
(169, '05 Соціальні та поведінкові науки', '053 Психологія', '', '28052 Практична психологія', NULL, NULL),
(170, '05 Соціальні та поведінкові науки', '054 Соціологія', '', '1244 Соціологія', NULL, NULL),
(171, '05 Соціальні та поведінкові науки', '054 Соціологія', '', '26913 Соціологія', NULL, NULL),
(172, '05 Соціальні та поведінкові науки', '056 Міжнародні економічні відносини', '', '27344 Міжнародні економічні відносини', NULL, NULL),
(173, '06 Журналістика', '061 Журналістика', '', '2707 Видавнича справа та медіаредагування', NULL, NULL),
(174, '06 Журналістика', '061 Журналістика', '', '3119 Журналістика та кросмедійність', NULL, NULL),
(175, '06 Журналістика', '061 Журналістика', '', '3278 Видавнича справа та медіаредагування', NULL, NULL),
(176, '06 Журналістика', '061 Журналістика', '', '3325 Журналістика та кросмедійність', NULL, NULL),
(177, '06 Журналістика', '061 Журналістика', '', '2588 Видавнича справа та редагування', NULL, NULL),
(178, '07 Управління та адміністрування', '071 Облік і оподаткування', '', '24247 Облік і оподаткування', NULL, NULL),
(179, '07 Управління та адміністрування', '071 Облік і оподаткування', '', '20537 Облік і оподаткування', NULL, NULL),
(180, '07 Управління та адміністрування', '071 Облік і оподаткування', '', '20532 Облік і аудит в промисловості', NULL, NULL),
(181, '07 Управління та адміністрування', '071 Облік і оподаткування', '', '26918 Облік і оподаткування в управлінні підприємницькою діяльністю', NULL, NULL),
(182, '07 Управління та адміністрування', '071 Облік і оподаткування', '', '38600 Облік і оподаткування', NULL, NULL),
(183, '07 Управління та адміністрування', '072 Фінанси, банківська справа та страхування', '', '2438 Публічні, корпоративні фінанси та фінансове посередництво', NULL, NULL),
(184, '07 Управління та адміністрування', '072 Фінанси, банківська справа та страхування', '', '20535 Фінанси, банківська справа та страхування', NULL, NULL),
(185, '07 Управління та адміністрування', '072 Фінанси, банківська справа та страхування', '', '4118 Публічні, корпоративні фінанси та фінансове посередництво', NULL, NULL),
(186, '07 Управління та адміністрування', '072 Фінанси, банківська справа та страхування', '', '20534 Фінанси, банківська справа та страхування', NULL, NULL),
(187, '07 Управління та адміністрування', '072 Фінанси, банківська справа та страхування', '', '38601 Фінанси, банківська справа та страхування', NULL, NULL),
(188, '07 Управління та адміністрування', '073 Менеджмент', '', '2926 Менеджмент туристичної індустрії', NULL, NULL),
(189, '07 Управління та адміністрування', '073 Менеджмент', '', '39811 Психологія ділового адміністрування', NULL, NULL),
(190, '07 Управління та адміністрування', '073 Менеджмент', '', '29248 Менеджмент організацій і адміністрування', NULL, NULL),
(191, '07 Управління та адміністрування', '073 Менеджмент', '', '2459 Менеджмент туристичної індустрії', NULL, NULL),
(192, '07 Управління та адміністрування', '073 Менеджмент', '', '3252 Менеджмент організацій і адміністрування', NULL, NULL),
(193, '07 Управління та адміністрування', '074 Публічне управління та адміністрування', '', '29326 Державна служба', NULL, NULL),
(194, '07 Управління та адміністрування', '074 Публічне управління та адміністрування', '', '2260 місцеве самоврядування', NULL, NULL),
(195, '07 Управління та адміністрування', '075 Маркетинг', '', '1228 маркетинг', NULL, NULL),
(196, '07 Управління та адміністрування', '075 Маркетинг', '', '29250 Маркетинг', NULL, NULL),
(197, '07 Управління та адміністрування', '075 Маркетинг', '', '35816 Маркетинг ресторанного, готельного та туристичного бізнесу', NULL, NULL),
(198, '07 Управління та адміністрування', '075 Маркетинг', '', '1565 Маркетинг', NULL, NULL),
(199, '07 Управління та адміністрування', '075 Маркетинг', '', '2499 Маркетинг індустрії гостинності', NULL, NULL),
(200, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '30443 Економіка та організація бізнесу', NULL, NULL),
(201, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '20536 Підприємництво, торгівля та біржова діяльність', NULL, NULL),
(202, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '30451 Підприємництво, електронна торгівля та логістика', NULL, NULL),
(203, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '20533 Підприємництво, торгівля та біржові операції', NULL, NULL),
(204, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '31494 Управління бізнес-процесами', NULL, NULL),
(205, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '24246 Підприємництво, торгівля та біржова діяльність', NULL, NULL),
(206, '07 Управління та адміністрування', '076 Підприємництво, торгівля та біржова діяльність', '', '38602 Підприємництво, торгівля та біржова діяльність', NULL, NULL),
(207, '08 Право', '081 Право', '', '38603 Право', NULL, NULL),
(208, '08 Право', '081 Право', '', '2808 Право', NULL, NULL),
(209, '08 Право', '081 Право', '', '40223 Медіація', NULL, NULL),
(210, '08 Право', '081 Право', '', '26899 Право', NULL, NULL),
(211, '09 Біологія', '091 Біологія', '', '26906 Біологія', NULL, NULL),
(212, '09 Біологія', '091 Біологія', '', '18063 Біохімія та лабораторна діагностика', NULL, NULL),
(213, '09 Біологія', '091 Біологія', '', '56206 Фізіологія рухової активності', NULL, NULL),
(214, '09 Біологія', '091 Біологія', '', '3123 Біологія', NULL, NULL),
(215, '09 Біологія', '091 Біологія', '', '38604 Біологія', NULL, NULL),
(216, '10 Природничі науки', '101 Екологія', '', '38605 Екологія', NULL, NULL),
(217, '10 Природничі науки', '101 Екологія', '', '3751 Екологія', NULL, NULL),
(218, '10 Природничі науки', '101 Екологія', '', '29687 Екологія', NULL, NULL),
(219, '10 Природничі науки', '102 Хімія', '', '29688 Хімія', NULL, NULL),
(220, '10 Природничі науки', '102 Хімія', '', '2457 Хімія', NULL, NULL),
(221, '10 Природничі науки', '102 Хімія', '', '38606 Хімія', NULL, NULL),
(222, '10 Природничі науки', '103 Науки про Землю', '', '38607 Науки про Землю', NULL, NULL),
(223, '10 Природничі науки', '103 Науки про Землю', '', '1222 Гідрологія', NULL, NULL),
(224, '10 Природничі науки', '103 Науки про Землю', '', '18007 Гідрометеорологія', NULL, NULL),
(225, '10 Природничі науки', '103 Науки про Землю', '', '51463 Геосистеми та георизики', NULL, NULL),
(226, '10 Природничі науки', '104 Фізика та астрономія', '', '32435 Фізика та астрономія', NULL, NULL),
(227, '10 Природничі науки', '104 Фізика та астрономія', '', '1226 Комп\'ютерна фізика', NULL, NULL),
(228, '10 Природничі науки', '104 Фізика та астрономія', '', '27469 Теоретична фізика та комп`ютерне моделювання', NULL, NULL),
(229, '10 Природничі науки', '104 Фізика та астрономія', '', '31193 Комп\'ютерна  фізика', NULL, NULL),
(230, '10 Природничі науки', '104 Фізика та астрономія', '', '31196 Теоретична фізика та комп’ютерне моделювання', NULL, NULL),
(231, '10 Природничі науки', '104 Фізика та астрономія', '', '38608 Фізика та астрономія', NULL, NULL),
(232, '10 Природничі науки', '105 Прикладна фізика та наноматеріали', '', '38609 Прикладна фізика та наноматеріали', NULL, NULL),
(233, '10 Природничі науки', '105 Прикладна фізика та наноматеріали', '', '2977 медична фізика', NULL, NULL),
(234, '10 Природничі науки', '105 Прикладна фізика та наноматеріали', '', '2460 Прикладна фізика', NULL, NULL),
(235, '10 Природничі науки', '105 Прикладна фізика та наноматеріали', '', '31229 Прикладна фізика та наноматеріали', NULL, NULL),
(236, '10 Природничі науки', '105 Прикладна фізика та наноматеріали', '', '30249 Прикладна фізика та наноматеріали', NULL, NULL),
(237, '11 Математика та статистика', '111 Математика', '', '26915 Математика', NULL, NULL),
(238, '11 Математика та статистика', '111 Математика', '', '2383 Математика', NULL, NULL),
(239, '11 Математика та статистика', '111 Математика', '', '38611 Математика', NULL, NULL),
(240, '11 Математика та статистика', '112 Статистика', '', '22675 Статистика', NULL, NULL),
(241, '11 Математика та статистика', '113 Прикладна математика', '', '3121 Прикладна математика', NULL, NULL),
(242, '11 Математика та статистика', '113 Прикладна математика', '', '48807 Технології програмування та комп\'ютерне моделювання', NULL, NULL),
(243, '11 Математика та статистика', '113 Прикладна математика', '', '26916 Прикладна математика', NULL, NULL),
(244, '11 Математика та статистика', '113 Прикладна математика', '', '48806 Технології програмування та комп\'ютерне моделювання', NULL, NULL),
(245, '11 Математика та статистика', '113 Прикладна математика', '', '38612 Прикладна математика', NULL, NULL),
(246, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '38613 Інженерія програмного забезпечення', NULL, NULL),
(247, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '52635 Менеджмент проєктів програмного забезпечення та англійська мова', NULL, NULL),
(248, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '27397 Інженерія програмного забезпечення', NULL, NULL),
(249, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '52634 Програмна інженерія', NULL, NULL),
(250, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '23649 Менеджмент програмного забезпечення та англійська мова', NULL, NULL),
(251, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '52636 Програмне забезпечення систем', NULL, NULL),
(252, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '2997 Інженерія програмного забезпечення', NULL, NULL),
(253, '12 Інформаційні технології', '121 Інженерія програмного забезпечення', '', '27786 Менеджмент проектів та інженерія програмного забезпечення', NULL, NULL),
(254, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '2257 Алгоритмічне та програмне забезпечення комп’ютерних систем', NULL, NULL),
(255, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '1224 Комп\'ютерний еколого-економічний моніторинг', NULL, NULL),
(256, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '2259 Інтелектуальний аналіз даних в комп\'ютерних інформаційних системах', NULL, NULL),
(257, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '3274 Алгоритмічне та програмне забезпечення комп’ютерних систем', NULL, NULL),
(258, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '1221 Прикладні інформаційні системи', NULL, NULL),
(259, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '17852 інтелектуальний аналіз даних в комп\'ютерних інформаційних системах', NULL, NULL),
(260, '12 Інформаційні технології', '122 Комп’ютерні науки та інформаційні технології', '', '3752 Інформаційні технології та управління проектами', NULL, NULL),
(261, '12 Інформаційні технології', '123 Комп’ютерна інженерія', '', '27398 Комп’ютерна інженерія', NULL, NULL),
(262, '12 Інформаційні технології', '123 Комп’ютерна інженерія', '', '49320 Програмування мобільних і вбудованих комп\'ютерних систем та засобів інтернету речей', NULL, NULL),
(263, '12 Інформаційні технології', '123 Комп’ютерна інженерія', '', '3094 Комп\'ютерна інженерія', NULL, NULL),
(264, '12 Інформаційні технології', '123 Комп’ютерна інженерія', '', '31266 Комп’ютерна інженерія технологій інтернету речей та кіберфізичних систем', NULL, NULL),
(265, '12 Інформаційні технології', '124 Системний аналіз', '', '24250 Системний аналіз', NULL, NULL),
(266, '12 Інформаційні технології', '124 Системний аналіз', '', '26917 Системний аналіз', NULL, NULL),
(267, '12 Інформаційні технології', '125 Кібербезпека', '', '22991 Кібербезпека', NULL, NULL),
(268, '12 Інформаційні технології', '125 Кібербезпека', '', '22992 Лінгвістичне забезпечення кібербезпеки', NULL, NULL),
(269, '12 Інформаційні технології', '125 Кібербезпека', '', '2402 Кібербезпека', NULL, NULL),
(270, '12 Інформаційні технології', '125 Кібербезпека', '', '3250 Системи технічного захисту інформації', NULL, NULL),
(271, '14 Електрична інженерія', '141 Електроенергетика, електротехніка та електромеханіка', '', '1251 Світлотехніка і джерела світла', NULL, NULL),
(272, '14 Електрична інженерія', '141 Електроенергетика, електротехніка та електромеханіка', '', '27732 Електроенергетика, електротехніка та електромеханіка (Нетрадиційні та відновлювані джерела енергії)', NULL, NULL),
(273, '14 Електрична інженерія', '141 Електроенергетика, електротехніка та електромеханіка', '', '1227 Нетрадиційні та відновлювані джерела енергії', NULL, NULL),
(274, '14 Електрична інженерія', '141 Електроенергетика, електротехніка та електромеханіка', '', '27731 Електроенергетика, електротехніка та електромеханіка (Світлотехніка і джерела світла)', NULL, NULL),
(275, '14 Електрична інженерія', '141 Електроенергетика, електротехніка та електромеханіка', '', '27396 Електроенергетика, електротехніка та електромеханіка', NULL, NULL),
(276, '15 Автоматизація та приладобудування', '151 Автоматизація та комп’ютерно-інтегровані технології', '', '56511 Автоматизація та комп\'ютерно-інтегровані технології', NULL, NULL),
(277, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '30425 Метрологія та інформаційно-вимірювальна техніка', NULL, NULL),
(278, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '27466 Метрологія та інформаційно-вимірювальна техніка (Оптичні інформаційні та комп’ютерні технології)', NULL, NULL),
(279, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '3122 Фотоніка: компю\'терні оптичні системи', NULL, NULL),
(280, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '27465 Метрологія та інформаційно-вимірювальна техніка (Фотоніка:комп’ютерні оптичні системи)', NULL, NULL),
(281, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '2705 Оптичні інформаційні та комп\'ютерні технології', NULL, NULL),
(282, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '31269 Фотоніка: компю\'терні оптичні системи', NULL, NULL),
(283, '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', '', '31270 Оптичні інформаційні та компю\'терні технології', NULL, NULL),
(284, '15 Автоматизація та приладобудування', '153 Мікро- та наносистемна техніка', '', '2763 Мікро- та наносистемна техніка', NULL, NULL),
(285, '15 Автоматизація та приладобудування', '153 Мікро- та наносистемна техніка', '', '27737 Мікро- та наносистемна техніка', NULL, NULL),
(286, '16 Хімічна та біоінженерія', '162 Біотехнології та біоінженерія', '', '27394 Біотехнології та біоінженерія', NULL, NULL),
(287, '16 Хімічна та біоінженерія', '162 Біотехнології та біоінженерія', '', '18070 Біотехнологія харчової продукції', NULL, NULL),
(288, '16 Хімічна та біоінженерія', '162 Біотехнології та біоінженерія', '', '29691 Біотехнології та біоінженерія', NULL, NULL),
(289, '17 Електроніка та телекомунікації', '171 Електроніка', '', '3246 Електроніка', NULL, NULL),
(290, '17 Електроніка та телекомунікації', '171 Електроніка', '', '22880 Електронні прилади та пристрої', NULL, NULL),
(291, '17 Електроніка та телекомунікації', '171 Електроніка', '', '27733 Електроніка (Електронні прилади та пристрої)', NULL, NULL),
(292, '17 Електроніка та телекомунікації', '171 Електроніка', '', '3330 Електронні пристрої та системи', NULL, NULL),
(293, '17 Електроніка та телекомунікації', '171 Електроніка', '', '27395 Електроніка', NULL, NULL),
(294, '17 Електроніка та телекомунікації', '171 Електроніка', '', '38614 Електроніка', NULL, NULL),
(295, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '38615 Телекомунікації та радіотехніка', NULL, NULL),
(296, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '3329 Радіотехніка', NULL, NULL),
(297, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '3124 Телекомунікації', NULL, NULL),
(298, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '22989 Радіоелектронні комп’ютеризовані засоби', NULL, NULL),
(299, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '27464 Телекомунікації та радіотехніка', NULL, NULL),
(300, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '22990 Безпека інформаційних і комунікаційних систем та Інтернету речей', NULL, NULL),
(301, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '2780 Радіотехніка', NULL, NULL),
(302, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '1562 Інформаційні мережі зв’язку', NULL, NULL),
(303, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '31277 Інфокомунікації та кіберпсихологія', NULL, NULL),
(304, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '31278 Медіакультура в інформаційних мережах', NULL, NULL),
(305, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '31279 Цифрові комунікації в глобальному просторі', NULL, NULL),
(306, '17 Електроніка та телекомунікації', '172 Телекомунікації та радіотехніка', '', '26420 Біотехнічні та медичні апарати і системи', NULL, NULL),
(307, '18 Виробництво та технології', '181 Харчові технології', '', '56495 Якість та безпека харчової продукції', NULL, NULL),
(308, '18 Виробництво та технології', '181 Харчові технології', '', '17703 Технологічна експертиза, безпека харчової продукції та модернізація технологічних процесів', NULL, NULL),
(309, '18 Виробництво та технології', '186 Видавництво та поліграфія', '', '3378 Видавництво та поліграфія', NULL, NULL),
(310, '18 Виробництво та технології', '186 Видавництво та поліграфія', '', '31280 Мультимедіа та психологія управління в інформаційних системах', NULL, NULL),
(311, '18 Виробництво та технології', '186 Видавництво та поліграфія', '', '29941 Технологія електронних мультимедійних видань', NULL, NULL),
(312, '18 Виробництво та технології', '186 Видавництво та поліграфія', '', '30426 Видавництво та поліграфія', NULL, NULL),
(313, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '27414 Архітектура будівель і споруд', NULL, NULL),
(314, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '24242 Архітектура та містобудування', NULL, NULL),
(315, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '31426 Архітектура будівель і споруд', NULL, NULL),
(316, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '48804 Архітектура та містобудування', NULL, NULL),
(317, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '29587 Архітектура будівель і споруд', NULL, NULL),
(318, '19 Архітектура та будівництво', '191 Архітектура та містобудування', '', '26907 Архітектура та містобудування', NULL, NULL),
(319, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '27413 Промислове та цивільне будівництво', NULL, NULL),
(320, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '26908 Будівництво та цивільна інженерія', NULL, NULL),
(321, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '3031 Гідротехніка', NULL, NULL),
(322, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '29562 Промислове та цивільне будівництво', NULL, NULL),
(323, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '24248 Будівництво та цивільна інженерія', NULL, NULL),
(324, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '2975 Раціональне використання і охорона водних ресурсів', NULL, NULL),
(325, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '31423 Промислове та цивільне будівництво', NULL, NULL),
(326, '19 Архітектура та будівництво', '192 Будівництво та цивільна інженерія', '', '48805 Будівництво та цивільна інженерія', NULL, NULL),
(327, '19 Архітектура та будівництво', '193 Геодезія та землеустрій', '', '2397 Геодезія', NULL, NULL),
(328, '19 Архітектура та будівництво', '193 Геодезія та землеустрій', '', '1225 Землеустрій та кадастр', NULL, NULL),
(329, '19 Архітектура та будівництво', '193 Геодезія та землеустрій', '', '2699 Геодезія та землеустрій', NULL, NULL),
(330, '19 Архітектура та будівництво', '193 Геодезія та землеустрій', '', '2380 Землеустрій та кадастр', NULL, NULL),
(331, '20 Аграрні науки та продовольство', '201 Агрономія', '', '29686 Технології виробництва та агроменеджмент', NULL, NULL),
(332, '20 Аграрні науки та продовольство', '201 Агрономія', '', '29690 Агрономія', NULL, NULL),
(333, '20 Аграрні науки та продовольство', '205 Лісове господарство', '', '18071 Лісове господарство', NULL, NULL),
(334, '20 Аграрні науки та продовольство', '205 Лісове господарство', '', '27392 Лісове господарство', NULL, NULL),
(335, '22 Охорона здоров’я', '227 Фізична реабілітація', '', '27319 Фізична реабілітація', NULL, NULL),
(336, '23 Соціальна робота', '231 Соціальна робота', '', '2825 соціальна педагогіка', NULL, NULL),
(337, '23 Соціальна робота', '231 Соціальна робота', '', '39763 Соціально-психологічна реабілітація', NULL, NULL),
(338, '23 Соціальна робота', '231 Соціальна робота', '', '3125 Соціальна робота', NULL, NULL),
(339, '23 Соціальна робота', '231 Соціальна робота', '', '3095 соціальна робота в громаді', NULL, NULL),
(340, '23 Соціальна робота', '231 Соціальна робота', '', '20164 соціальна реабілітація', NULL, NULL),
(341, '23 Соціальна робота', '231 Соціальна робота', '', '3276 Управління соціальними процесами в громаді', NULL, NULL),
(342, '23 Соціальна робота', '231 Соціальна робота', '', '2355 соціальна педагогіка', NULL, NULL),
(343, '23 Соціальна робота', '231 Соціальна робота', '', '3186 Соціальна робота', NULL, NULL),
(344, '23 Соціальна робота', '231 Соціальна робота', '', '18990 соціальне управління', NULL, NULL),
(345, '23 Соціальна робота', '231 Соціальна робота', '', '28056 Соціальне управління', NULL, NULL),
(346, '23 Соціальна робота', '232 Соціальне забезпечення', '', '26912 Соціальне забезпечення', NULL, NULL),
(347, '24 Сфера обслуговування', '242 Туризм', '', '3180 Міжнародний туризм', NULL, NULL),
(348, '24 Сфера обслуговування', '242 Туризм', '', '39792 Готельно-ресторанний сервіс та туроперейтинг', NULL, NULL),
(349, '24 Сфера обслуговування', '242 Туризм', '', '56510 Міжнародний туризм і туроперейтинг', NULL, NULL),
(350, '24 Сфера обслуговування', '242 Туризм', '', '3069 Туризмознавство', NULL, NULL),
(351, '28 Публічне управління та адміністрування', '281 Публічне управління та адміністрування', '', '18991 Державна служба', NULL, NULL),
(352, '28 Публічне управління та адміністрування', '281 Публічне управління та адміністрування', '', '18992 Місцеве самоврядування', NULL, NULL),
(353, '28 Публічне управління та адміністрування', '281 Публічне управління та адміністрування', '', '22914 Державна служба', NULL, NULL),
(354, '10 Природничі науки', '106 Географія', '', '26909 Географія', NULL, NULL),
(355, '10 Природничі науки', '106 Географія', '', '39789 Регіональний розвиток і просторове планування', NULL, NULL),
(356, '10 Природничі науки', '106 Географія', '', '24240 Географія', NULL, NULL),
(357, '10 Природничі науки', '106 Географія', '', '39810 Регіональний розвиток і просторове планування', NULL, NULL),
(358, '10 Природничі науки', '106 Географія', '', '38610 Географія', NULL, NULL),
(359, '12 Інформаційні технології', '126 Інформаційні системи та технології', '', '30431 Інформаційні системи та технології', NULL, NULL),
(360, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '20524 Соціальна педагогіка', NULL, NULL),
(361, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '26886 Інклюзивна освіта', NULL, NULL),
(362, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '20525 Соціальна реабілітація', NULL, NULL),
(363, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '27651 Освітні, педагогічні науки (соціальна педагогіка)', NULL, NULL),
(364, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '29096 Соціальна педагогіка', NULL, NULL),
(365, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '22160 Психологія дошкільного та шкільного віку', NULL, NULL),
(366, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '28041 Освітні, педагогічні науки (освіта дорослих)', NULL, NULL),
(367, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '22939 Освіта дорослих', NULL, NULL),
(368, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '26885 Інклюзивна освіта', NULL, NULL),
(369, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '27652 Освітні, педагогічні науки (соціальна педагогіка)', NULL, NULL),
(370, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '27362 Освітні, педагогічні науки (психологія дошкільного та шкільного віку)', NULL, NULL),
(371, '01 Освіта/Педагогіка', '011 Освітні, педагогічні науки', '', '38592 Освітні, педагогічні науки', NULL, NULL),
(372, '22 Охорона здоров’я', '227 Фізична терапія, ерготерапія', '', '24243 Фізична терапія, ерготерапія', NULL, NULL),
(373, '22 Охорона здоров’я', '227 Фізична терапія, ерготерапія', '227.01 Фізична терапія', '36306 Фізична терапія', NULL, NULL),
(374, '22 Охорона здоров’я', '227 Фізична терапія, ерготерапія', '', '26897 Фізична терапія, ерготерапія', NULL, NULL),
(375, '29 Міжнародні відносини', '291 Міжнародні відносини, суспільні комунікації та регіональні студії', '', '20527 Міжнародна інформація', NULL, NULL),
(376, '29 Міжнародні відносини', '291 Міжнародні відносини, суспільні комунікації та регіональні студії', '', '20529 Міжнародні відносини', NULL, NULL),
(377, '29 Міжнародні відносини', '291 Міжнародні відносини, суспільні комунікації та регіональні студії', '', '20528 Міжнародна інформація', NULL, NULL),
(378, '29 Міжнародні відносини', '291 Міжнародні відносини, суспільні комунікації та регіональні студії', '', '20530 Міжнародні відносини', NULL, NULL),
(379, '29 Міжнародні відносини', '291 Міжнародні відносини, суспільні комунікації та регіональні студії', '', '50924 Стратегічні комунікації та національна безпека', NULL, NULL),
(380, '29 Міжнародні відносини', '292 Міжнародні економічні відносини', '', '24239 Міжнародні економічні відносини', NULL, NULL),
(381, '29 Міжнародні відносини', '292 Міжнародні економічні відносини', '', '26910 Міжнародні економічні відносини', NULL, NULL),
(382, '29 Міжнародні відносини', '293 Міжнародне право', '', '26911 Міжнародне право', NULL, NULL),
(383, '29 Міжнародні відносини', '293 Міжнародне право', '', '24237 Міжнародне право', NULL, NULL),
(384, '29 Міжнародні відносини', '293 Міжнародне право', '', '38616 Міжнародне право', NULL, NULL),
(385, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21315 Алгоритмічне та програмне забезпечення комп’ютерних систем', NULL, NULL),
(386, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '25713 Комп\'ютерна графіка та мультимедіа', NULL, NULL),
(387, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21317 Інтелектуальний аналіз даних в комп’ютерних інформаційних системах', NULL, NULL),
(388, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21319 Інформаційні технології та управління проектами', NULL, NULL),
(389, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21314 Алгоритмічне та програмне забезпечення комп’ютерних систем', NULL, NULL),
(390, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21316 Інтелектуальний аналіз даних в комп’ютерних інформаційних системах', NULL, NULL),
(391, '12 Інформаційні технології', '122 Комп\'ютерні науки', '', '21318 Інформаційні технології та управління проектами', NULL, NULL),
(392, '07 Управління та адміністрування', '072 Фінанси, банківська справа, страхування та фондовий ринок', '', '57984 Фінанси, банківська справа та страхування', NULL, NULL),
(393, '07 Управління та адміністрування', '072 Фінанси, банківська справа, страхування та фондовий ринок', '', '57986 Фінанси, банківська справа та страхування', NULL, NULL),
(394, '07 Управління та адміністрування', '072 Фінанси, банківська справа, страхування та фондовий ринок', '', '57985 Фінанси, банківська справа та страхування', NULL, NULL),
(395, '07 Управління та адміністрування', '076 Підприємництво та торгівля', '', '57989 Підприємництво, торгівля та біржова діяльність', NULL, NULL),
(396, '07 Управління та адміністрування', '076 Підприємництво та торгівля', '', '57992 Підприємництво, торгівля та біржова діяльність', NULL, NULL),
(397, '07 Управління та адміністрування', '076 Підприємництво та торгівля', '', '57987 Економіка та організація бізнесу', NULL, NULL),
(398, '07 Управління та адміністрування', '076 Підприємництво та торгівля', '', '57988 Підприємництво, торгівля та біржові операції', NULL, NULL),
(399, '09 Біологія', '091 Біологія та біохімія', '', '58028 Біологія', NULL, NULL),
(400, '09 Біологія', '091 Біологія та біохімія', '', '58034 Біохімія та лабораторна діагностика', NULL, NULL),
(401, '09 Біологія', '091 Біологія та біохімія', '', '58035 Фізіологія рухової активності', NULL, NULL),
(402, '09 Біологія', '091 Біологія та біохімія', '', '58033 Біологія', NULL, NULL),
(403, '09 Біологія', '091 Біологія та біохімія', '', '58031 Біологія', NULL, NULL),
(404, '12 Інформаційні технології', '125 Кібербезпека та захист інформації', '', '58038 Кібербезпека', NULL, NULL),
(405, '12 Інформаційні технології', '125 Кібербезпека та захист інформації', '', '58036 Кібербезпека', NULL, NULL),
(406, '16 Хімічна та біоінженерія', '162 Біотехнології та біоінженерія', '', '58813 Біотехнології та біоінженерія', NULL, NULL);
INSERT INTO `ops` (`id`, `branch`, `speciality`, `specialisation`, `op`, `created_at`, `updated_at`) VALUES
(407, '16 Хімічна та біоінженерія', '162 Біотехнології та біоінженерія', '', '58815 Біотехнології та біоінженерія', NULL, NULL),
(408, '17 Електроніка та телекомунікації', '171 Електроніка', '', '58045 Електроніка', NULL, NULL),
(409, '17 Електроніка та телекомунікації', '172 Електронні комунікації та радіотехніка', '', '58049 Телекомунікації та радіотехніка', NULL, NULL),
(410, '17 Електроніка та телекомунікації', '172 Електронні комунікації та радіотехніка', '', '58070 Радіотехніка', NULL, NULL),
(411, '17 Електроніка та телекомунікації', '172 Електронні комунікації та радіотехніка', '', '58050 Інформаційні мережі зв’язку', NULL, NULL),
(412, '17 Електроніка та телекомунікації', '172 Електронні комунікації та радіотехніка', '', '58048 Телекомунікації', NULL, NULL),
(413, '17 Електроніка та телекомунікації', '172 Електронні комунікації та радіотехніка', '', '58047 Безпека інформаційних і комунікаційних систем та Інтернету речей', NULL, NULL),
(414, '17 Електроніка та телекомунікації', '174 Автоматизація, комп’ютерно-інтегровані технології та робототехніка', '', '58039 Автоматизація та комп\'ютерно-інтегровані технології', NULL, NULL),
(415, '17 Електроніка та телекомунікації', '175 Інформаційно-вимірювальні технології', '', '58040 Метрологія та інформаційно-вимірювальна техніка', NULL, NULL),
(416, '17 Електроніка та телекомунікації', '175 Інформаційно-вимірювальні технології', '', '59026 Фотоніка: комп\'ютерні оптичні системи', NULL, NULL),
(417, '17 Електроніка та телекомунікації', '176 Мікро- та наносистемна техніка', '', '58042 Мікро- та наносистемна техніка', NULL, NULL),
(418, '22 Охорона здоров’я', '227 Терапія та реабілітація', '227.01 Фізична терапія', '58071 Фізична терапія, ерготерапія', NULL, NULL),
(419, '22 Охорона здоров’я', '227 Терапія та реабілітація', '227.01 Фізична терапія', '59934 Фізична терапія', NULL, NULL),
(420, '24 Сфера обслуговування', '242 Туризм і рекреація', '', '58074 Міжнародний туризм і туроперейтинг', NULL, NULL),
(421, '24 Сфера обслуговування', '242 Туризм і рекреація', '', '58073 Міжнародний туризм', NULL, NULL),
(422, '24 Сфера обслуговування', '242 Туризм і рекреація', '', '58072 Готельно-ресторанний сервіс та туроперейтинг', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `responsible_for_reviews`
--

CREATE TABLE `responsible_for_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `responsible_for_reviews`
--

INSERT INTO `responsible_for_reviews` (`id`, `created_at`, `updated_at`, `user_id`, `review_id`) VALUES
(1, NULL, NULL, 28, 38),
(2, NULL, NULL, 28, 40),
(3, NULL, NULL, 28, 45),
(5, NULL, NULL, 28, 50),
(6, NULL, NULL, 28, 30),
(13, '2024-10-06 13:30:45', '2024-10-06 13:30:45', 30, 46),
(23, '2024-11-16 11:14:43', '2024-11-16 11:14:43', 30, 48),
(24, '2024-11-16 11:16:34', '2024-11-16 11:16:34', 28, 56),
(25, '2024-11-16 11:19:03', '2024-11-16 11:19:03', 30, 58),
(26, '2024-11-16 11:19:26', '2024-11-16 11:19:26', 28, 63),
(27, '2024-11-16 12:33:53', '2024-11-16 12:33:53', 28, 64),
(28, '2024-11-16 12:36:51', '2024-11-16 12:36:51', 30, 57),
(29, '2024-11-16 13:11:57', '2024-11-16 13:11:57', 30, 66),
(30, '2024-11-19 15:01:39', '2024-11-19 15:01:39', 32, 68);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educLevel` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `specialisation` varchar(255) NOT NULL,
  `nameOp` varchar(255) NOT NULL,
  `guarantor` varchar(255) NOT NULL,
  `structural` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `educLevel`, `branch`, `speciality`, `specialisation`, `nameOp`, `guarantor`, `structural`, `faculty`, `date`, `deleted_at`, `created_at`, `updated_at`, `category_id`, `status_id`, `user_id`) VALUES
(8, 'Освітньо-науковий', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '26 916	Прикладна математика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2023-10-25', NULL, '2023-10-25 02:59:19', '2023-11-01 10:21:25', 2, 3, 16),
(30, 'Освітньо-науковий', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '26 916	Прикладна математика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2023-10-25', NULL, '2023-10-25 02:59:19', '2023-11-01 10:21:25', 2, 3, 16),
(31, 'Освітньо-науковий', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '26 916	Прикладна математика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2023-10-25', NULL, '2023-10-25 02:59:19', '2023-11-01 10:21:25', 2, 3, 16),
(38, 'Магістр', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '48807 Технології програмування та комп\'ютерне моделювання', 'Бігун Ярослав Йосипович', 'кафедра Прикладної математики', 'Факультет математики та інформатики', '2024-02-09', NULL, '2024-02-09 06:11:18', '2024-06-25 16:02:49', 2, 2, 28),
(39, 'Магістр', '01 Освіта/Педагогіка', '013 Початкова освіта', 'Не має спеціалізації', '2820 Початкова освіта', 'Бігун', 'кафедра', 'Навчально-науковий інститут фізико-технічних та комп`ютерних наук', '2024-02-09', NULL, '2024-02-09 06:52:56', '2024-11-16 09:55:59', 5, 3, 28),
(40, 'Освітньо-науковий', '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '38764 Математика та інформатика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2024-04-20', NULL, '2024-04-20 03:35:45', '2024-10-08 11:06:12', 3, 1, 28),
(43, 'Магістр', '01 Освіта/Педагогіка', '015 Професійна освіта', '015.34 Машинобудування', '40225 Машинобудування', 'Шпатар Петро Михайлович', 'кафедра', 'Навчально-науковий інститут фізико-технічних та комп`ютерних наук', '2024-07-29', NULL, '2024-07-29 11:38:47', '2024-08-22 11:45:02', 2, 2, 28),
(45, 'Магістр', '01 Освіта/Педагогіка', '011 Науки про освіту', 'Не має спеціалізації', '18060 соціальна педагогіка', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет педагогіки, психології та соціальної роботи', '2024-08-20', NULL, '2024-08-20 04:01:49', '2024-10-08 11:06:27', 2, 1, 28),
(46, 'Бакалавр', '01 Освіта/Педагогіка', '015 Професійна освіта', '015.34 Машинобудування', '40225 Машинобудування', 'Бігун Ярослав Йосипович', 'кафедра', 'Навчально-науковий інститут фізико-технічних та комп`ютерних наук', '2024-08-20', NULL, '2024-08-20 04:03:38', '2024-08-22 14:29:31', 6, 1, 28),
(47, 'Освітньо-науковий', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '38612 Прикладна математика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2024-08-20', NULL, '2024-08-20 08:39:50', '2024-10-05 05:10:08', 7, 2, 28),
(48, 'Освітньо-науковий', '06 Журналістика', '061 Журналістика', 'Не має спеціалізації', '2588 Видавнича справа та редагування', 'Бігун Ярослав Йосипович', 'кафедра', 'Філологічний факультет', '2024-08-22', NULL, '2024-08-22 12:49:00', '2024-08-22 12:49:00', 7, 1, 28),
(50, 'Магістр', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '26916 Прикладна математика', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-10-03', NULL, '2024-10-03 11:10:32', '2024-10-06 07:00:58', 2, 2, 31),
(52, 'Освітньо-науковий', '11 Математика та статистика', '113 Прикладна математика', 'Не має спеціалізації', '26916 Прикладна математика', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-10-03', NULL, '2024-10-03 11:29:04', '2024-10-06 12:12:34', 7, 2, 31),
(53, 'Магістр', '05 Соціальні та поведінкові науки', '053 Психологія', 'Не має спеціалізації', '4116 практична психологія', 'Шпатар Петро Михайлович', 'кафедра', 'Факультет педагогіки, психології та соціальної роботи', '2024-10-05', NULL, '2024-10-05 03:59:10', '2024-11-16 09:53:05', 6, 3, 28),
(56, 'Освітньо-науковий', '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', 'Не має спеціалізації', '27466 Метрологія та інформаційно-вимірювальна техніка (Оптичні інформаційні та комп’ютерні технології)', 'Шпатар Петро Михайлович', 'кафедра', 'Навчально-науковий інститут фізико-технічних та комп`ютерних наук', '2024-10-06', NULL, '2024-10-06 11:40:14', '2024-11-16 11:22:43', 7, 1, 28),
(57, 'Бакалавр', '11 Математика та статистика', '112 Статистика', 'Немає спеціалізації', '22675 Статистика', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-10-15', NULL, '2024-10-15 12:06:17', '2024-11-16 12:27:54', 7, 1, 28),
(58, 'Магістр', '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '18044 Математика та інформатика', 'Бігун Ярослав Йосипович', 'кафедра', 'Факультет математики та інформатики', '2024-11-16', NULL, '2024-11-16 08:42:25', '2024-11-16 11:18:34', 8, 1, 28),
(62, 'Бакалавр', '11 Математика та статистика', '113 Прикладна математика', 'Немає спеціалізації', '48807 Технології програмування та комп\'ютерне моделювання', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-11-16', NULL, '2024-11-16 08:51:57', '2024-11-16 13:08:21', 8, 1, 28),
(63, 'Магістр', '15 Автоматизація та приладобудування', '152 Метрологія та інформаційно-вимірювальна техніка', 'Немає спеціалізації', '3122 Фотоніка: компю\'терні оптичні системи', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-11-16', NULL, '2024-11-16 11:18:01', '2024-11-16 11:21:28', 6, 2, 28),
(64, 'Освітньо-науковий', '05 Соціальні та поведінкові науки', '052 Політологія', 'Немає спеціалізації', '54206 Менеджмент політичної діяльності', 'Шпатар Петро Михайлович', 'Кафедра', 'Факультет архітектури, будівництва та декорптивно-прикладного мистецтва', '2024-11-16', NULL, '2024-11-16 11:18:25', '2024-11-16 12:33:20', 6, 1, 28),
(65, 'Магістр', '01 Освіта/Педагогіка', '015 Професійна освіта', '015.34 Машинобудування', '40224 Машинобудування', 'Бігун Ярослав Йосипович', 'Кафедра', 'Навчально-науковий інститут фізико-технічних та комп`ютерних наук', '2024-11-16', NULL, '2024-11-16 13:09:36', '2024-11-16 13:09:36', 6, 4, 28),
(66, 'Освітньо-науковий', '01 Освіта/Педагогіка', '014 Середня освіта', '014.04 Математика', '18044 Математика та інформатика', 'Шпатар Петро Михайлович', 'Кафедра', 'Факультет математики та інформатики', '2024-11-16', NULL, '2024-11-16 13:10:15', '2024-11-16 13:10:53', 5, 1, 28),
(67, 'Бакалавр', '12 Інформаційні технології', '124 Системний аналіз', 'Немає спеціалізації', '24250 Системний аналіз', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-11-16', NULL, '2024-11-16 13:10:45', '2024-11-16 13:10:45', 6, 4, 28),
(68, 'Бакалавр', '11 Математика та статистика', '113 Прикладна математика', 'Немає спеціалізації', '48807 Технології програмування та комп\'ютерне моделювання', 'Бігун Ярослав Йосипович', 'Кафедра', 'Факультет математики та інформатики', '2024-11-19', NULL, '2024-11-19 14:59:00', '2024-11-19 15:18:53', 7, 2, 32);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Подані', NULL, NULL),
(2, 'Затверджені', NULL, NULL),
(3, 'Архівовані', NULL, NULL),
(4, 'Чернетка', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(16, 'Gauka Valeria Ivanivna', 'h.valerii@chnu.edu.ua', NULL, '$2y$10$McQOha.exNvSfCX22Qia1.IOUznSrvt1tnyh8oUFsfUtNVTn4gQiq', NULL, '2023-10-25 02:58:43', '2023-10-25 02:58:43'),
(21, 'xdfghjk', 'uahekrgui@chnu.edu.ua', NULL, '$2y$10$Yc/88vr4KKKU3.Yvtg548./YOMh0DOGthaQYtXBobKhv0GsG2SGAa', NULL, '2023-10-31 11:26:09', '2023-10-31 11:26:09'),
(22, 'dfghjkm', 'awesdrtyhytre@chnu.edu.ua', NULL, '$2y$10$e6DvZbrtqAT1SBRTpY6RaeTFZQf6ddeCM8VSy6AYvs91cVKdsOXiS', NULL, '2023-10-31 11:27:12', '2023-10-31 11:27:12'),
(26, 'Гаука Лера Валерівна', 'v.hauka9@chnu.edu.ua', NULL, '$2y$10$58TjJ9C3zrgM8RhQ86UL9eROZaWxfwcII.gs7ZBnomG96tTjZmZIe', NULL, '2023-11-02 10:49:43', '2024-11-16 10:11:39'),
(28, 'Гаука Валерія Валеріївна', 'v.gauka@chnu.edu.ua', NULL, '$2y$10$TdgSotYlZdlgdQyERlF.TuWbInNCpAr7yGLzNg7wH2hdpdH2gbeUC', NULL, '2024-01-19 05:38:08', '2024-01-19 05:38:08'),
(29, 'Гаука Валерія Валеріївна', 'l.hauka@chnu.edu.ua', NULL, '$2y$10$Nw5mLiJrt669i.C/aMAX8u8OPaKwk02WmjVonuY/yLdW.5gfa8iWi', NULL, '2024-07-29 13:09:01', '2024-07-29 13:09:01'),
(30, 'Юрійчук Анастасія Олександрівна', 'a.yuriichuk@chnu.edu.ua', NULL, '$2y$10$FvwU11Y.fExvVcltLASnIuR6OXDdS7WArfierywEtHXa3lFbTmH2S', NULL, '2024-08-22 14:22:08', '2024-08-22 14:22:08'),
(32, 'Бігун Ярослав Йосипович', 'y.bihun@chnu.edu.ua', NULL, '$2y$10$SewLqnNgXDgB1Y/s03B2ZeRU9MpSjTqVO309Q15du1Ab2iQezXqOm', NULL, '2024-11-19 14:57:42', '2024-11-19 15:01:04'),
(33, 'Мартинюк Ольга Василівна', 'o.martiniuk@chnu.edu.ua', NULL, '$2y$10$oYzZ97oAbZI/XnSnqzCSmeAjIHammXtUWc1vaG8DE4LwCZ7.E3smS', NULL, '2024-11-19 17:04:00', '2024-11-19 17:04:00'),
(36, 'Шепетюк Богдан Васильович', 'b.shepetiuk@chnu.edu.ua', NULL, '$2y$10$3d5FXU2jqMqQ5NdeDU1ngOvRN/io8eO82FaT1QawUZwIGquU0jZKm', NULL, '2024-11-19 17:10:02', '2024-11-19 17:10:02'),
(37, 'Гаука Валерія Валеріївна', 'l.hauca@chnu.edu.ua', NULL, '$2y$10$JOJJFrG2YkG88563txeYa.5BOWQWdxm0eCy/8xF1lp9GJ4xRi8NuO', NULL, '2024-12-05 14:30:48', '2024-12-05 14:30:48');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `approves`
--
ALTER TABLE `approves`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_review_id_foreign` (`review_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ops`
--
ALTER TABLE `ops`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `responsible_for_reviews`
--
ALTER TABLE `responsible_for_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `responsible_for_reviews_user_id_foreign` (`user_id`),
  ADD KEY `responsible_for_reviews_review_id_foreign` (`review_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `approves`
--
ALTER TABLE `approves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `ops`
--
ALTER TABLE `ops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `responsible_for_reviews`
--
ALTER TABLE `responsible_for_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `responsible_for_reviews`
--
ALTER TABLE `responsible_for_reviews`
  ADD CONSTRAINT `responsible_for_reviews_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `responsible_for_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
