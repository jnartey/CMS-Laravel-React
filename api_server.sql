-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2018 at 11:20 PM
-- Server version: 5.6.38
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_server`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_10_17_235016_create_roles_table', 1),
(9, '2018_10_17_235810_create_user_role_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004bcbac5129b032498042fe802c2f6485134d44630591db94d6a57bcf145de63a7f59b6d882ff41', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-21 07:14:04', '2018-11-21 07:14:04', '2019-11-21 02:14:04'),
('008f733539ff3f5655e8d03dd0265c17105a722e4fff45b86f33b360aca27ac7e41cd6f4d8219a19', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 05:58:24', '2018-11-26 05:58:24', '2019-11-26 00:58:24'),
('02d34307f900c54d1c447ef280f5d34f5db9585bce41528c755137e1529438ac38f303cd90a2debc', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-21 06:59:27', '2018-11-21 06:59:27', '2019-11-21 01:59:27'),
('05d49f7be11085e3ed6072a3325f1954260e1de3707f1f3d757bdf7c8484bc73e139b16074f2cd81', 13, 1, 'FifthLightApp', '[]', 0, '2018-11-20 19:47:44', '2018-11-20 19:47:44', '2019-11-20 14:47:44'),
('06108311221e1e7b179b64deb4ae58f2f0202006efa29aec3368603615a7c48375fab95aaffcddc9', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:35:12', '2018-11-26 06:35:12', '2019-11-26 01:35:12'),
('0a2f83282db9fa7b2b6cab8886d595aa9a5b294ce06182fbce61cddf9cdb949c3d8f8997be5ada3f', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 00:56:18', '2018-12-05 00:56:18', '2019-12-04 19:56:18'),
('0e1daafd39f95398b5f78815ff4562fb7905823ca6f7f4183ee45c7ad5be692c5223104701be8e01', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 21:03:01', '2018-11-26 21:03:01', '2019-11-26 16:03:01'),
('1403f0b4cb7326ddfb43ccdcadb08abf253c05224245a121bcb1392196aee594fbcca07de5b0e815', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-30 07:38:08', '2018-11-30 07:38:08', '2019-11-30 02:38:08'),
('1971c5f11a97899baad3f37df27229c79b2b9246425531cbeb1c82b93a0449b9e0a8dbee02dc7704', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:20:02', '2018-12-05 02:20:02', '2019-12-04 21:20:02'),
('199bbd72bdfb220caa350cc90066b143e6e97bce228b879a7f55b8fb7402321a8c19a815cc4df332', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:05:23', '2018-11-26 06:05:23', '2019-11-26 01:05:23'),
('1b169ee892308c3960ac2dc72545f51e97ac23c97bcc173bb8f2266934c7ffd74b9503165b508926', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-12 22:38:35', '2018-12-12 22:38:35', '2019-12-12 17:38:35'),
('200ed49925ff59db3aa28f579c6fbf788736ef56113089d96accc4b1fdf13f5247e6261ef9dc40f6', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 07:46:05', '2018-11-26 07:46:05', '2019-11-26 02:46:05'),
('20c70064ea0bc97c3680dad256b0fd2909d7c160968f4e4c580fae983963a0421a43ba4234a712cf', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 07:42:24', '2018-11-26 07:42:24', '2019-11-26 02:42:24'),
('237db2346a26bc255f9e1fab5aeec60d95d17b9abade7c6cc0c12a4765c1ba35b0fe535059ef6e83', 15, 1, 'FifthLightApp', '[]', 0, '2018-11-20 20:01:15', '2018-11-20 20:01:15', '2019-11-20 15:01:15'),
('25133943903217b7c10480063f6ac5e3bf625dd663283898512c99b537a28294c6fe817e7320bf47', 16, 1, 'FifthLightApp', '[]', 0, '2018-11-20 21:12:58', '2018-11-20 21:12:58', '2019-11-20 16:12:58'),
('28daa77f60648c0013ea4d1369335a562e4fd2eecf97e802bc0a9d2a11cd9281c7e25c3c2be336f3', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-17 13:13:15', '2018-11-17 13:13:15', '2019-11-17 08:13:15'),
('2bf66f5e910a7b5cfc840af5446293265c8614201c5d7bba3b1d48f7eced7a71ad3a841aefc55805', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:19:56', '2018-11-26 06:19:56', '2019-11-26 01:19:56'),
('2ea6a547ab8906874f4fd953e22ac5e3952cf4994d938404a2351378ba33345055a722cf42a3d80a', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 20:56:57', '2018-11-26 20:56:57', '2019-11-26 15:56:57'),
('3040b2c4b1d575cfbb86ace1f2742e8a741ed374884f7d5e8f1f99c553eeb64844c28d73f9d36295', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 01:00:35', '2018-12-05 01:00:35', '2019-12-04 20:00:35'),
('3042d8ac3cb26de38c81ed9f16da0825925f8f6e33927ef4221257697222ce2a9b8056d950d254af', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 07:19:00', '2018-11-26 07:19:00', '2019-11-26 02:19:00'),
('33e3962b9cabaf42abda562f33843e3c2519ec1385bdfbd6d15e0b28cb644b3dbc857d824bc44442', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 03:09:18', '2018-11-16 03:09:18', '2019-11-15 22:09:18'),
('3d3693fcb2a222a1893db4fa981748ef730e675dd277ea73c421bacf2d249d0c616dbb2215d0e152', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:21:06', '2018-11-26 06:21:06', '2019-11-26 01:21:06'),
('42628dc94589cebfe3cfc781daed22aca2861191006920737d20dda07dcc195b842f16de9c457cdd', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 03:21:41', '2018-11-16 03:21:41', '2019-11-15 22:21:41'),
('4940eaec99c87e852506e326b0bb7d1b0cf17ef8227ad98e7dc328a27a339c050c97d5adf22c792d', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 09:18:53', '2018-11-26 09:18:53', '2019-11-26 04:18:53'),
('5294b3eee47d7d56195ef75a46ce2b0ccf011c5f067710fcc06ea50fec71a43481c3ce2ba66e5495', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-12 22:38:22', '2018-12-12 22:38:22', '2019-12-12 17:38:22'),
('5e6b71a0b3cf8b7da839237437e1dd4947cfda2d7ed87e149bf24470eb8cfff64170f7f856b0b6bb', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 01:24:21', '2018-11-16 01:24:21', '2019-11-15 20:24:21'),
('627ff87bacf1f8d584f404b6dd75c6a2d75f6f5572e602da465cfd5b3bf752280dc72193533717ad', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-18 04:52:08', '2018-11-18 04:52:08', '2019-11-17 23:52:08'),
('6735e0e37f41ba52dd8371d2473e40a50aa1f2e63edda05a2fabc848f15546664019829cdcb2d25b', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-21 07:20:44', '2018-11-21 07:20:44', '2019-11-21 02:20:44'),
('687c841bf8aa1374bd7090a0b020f19f028dd22d641f27a6f874694528b869dbed9087041be3dd1e', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:24:03', '2018-11-26 06:24:03', '2019-11-26 01:24:03'),
('6a2e6ef7f514bcec0a8d702105716b94168ce8ee92dc5435be6b6d36687b8c80b75109c892f10c37', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-17 01:43:41', '2018-11-17 01:43:41', '2019-11-16 20:43:41'),
('6a4e222cbc68c898644ce64ca8750a1547f7077e6a94dcc82df39dc31429d1194523a67062b0eed2', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 01:22:31', '2018-11-16 01:22:31', '2019-11-15 20:22:31'),
('6cba1c7e5f104d886fac4145b129265dd9132651954895801a2732141bf4a56ef7e7f3a929aef78c', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-12 22:37:23', '2018-12-12 22:37:23', '2019-12-12 17:37:23'),
('72113ad9c5c958eb532ce0b24d79169b16cfbc6db68893b90f0ab9d14404e42e1a49272f5ca7381c', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 03:22:38', '2018-11-16 03:22:38', '2019-11-15 22:22:38'),
('7711b6a194eccf9a79082a2ea24aaa7a5372e8e05dc8d93bf57cb2f5bab9fbf5fa4275028abb0763', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:36:51', '2018-11-26 06:36:51', '2019-11-26 01:36:51'),
('77592a3d15fd928a109ce041d0083eaef98c5284115732c1dd534f602689cb6c85ada4de02f45939', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 07:49:00', '2018-11-26 07:49:00', '2019-11-26 02:49:00'),
('861dd29490815b1ab788b8881b6b74ed2608009385f0fd2b7fd6c4599ea3c61baf88b2b51671e083', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-15 22:14:31', '2018-11-15 22:14:31', '2019-11-15 17:14:31'),
('8bc4e0684b83d799da9ceafaef858b33c87580134c96cfdc1c537fc2158379f4aafb5444e669021e', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 21:02:06', '2018-11-26 21:02:06', '2019-11-26 16:02:06'),
('8d833a04a977945092ae8605581fba5b93d36963a73894ca5a0fce94acf6667eeeb0444afcb8dec2', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 20:45:23', '2018-11-26 20:45:23', '2019-11-26 15:45:23'),
('92d0a850e6ea9aad38d57a991916a6f62d3d302aa2c0c616d331da46a0fe4617f61626650170b1d8', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:19:18', '2018-11-26 06:19:18', '2019-11-26 01:19:18'),
('94ff79d91e2a6fce5bca86078f44be08632bf205d8cd811126b4133e0ff6e2b7d351f16e418595f3', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 03:32:49', '2018-11-16 03:32:49', '2019-11-15 22:32:49'),
('966771a535a0f2da2d34abd0045de7b0d42dab39918951088d44b9d765761342e8c235c3a317999e', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 07:53:03', '2018-11-26 07:53:03', '2019-11-26 02:53:03'),
('97e0cb55b59d2233fc62e54991667f033e31094f52250e84e9034a5ea57aaec43120f23dd64ccca9', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-30 07:37:20', '2018-11-30 07:37:20', '2019-11-30 02:37:20'),
('9ad4a5d14e7e47be2571f31e91d74241aa81ef9e430f30b5052f540d92b825e0b97716894ba3295c', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-12 22:37:08', '2018-12-12 22:37:08', '2019-12-12 17:37:08'),
('9b0471f0c78f131b4ee6f5d18116f476f31594bfe9ba4a975ff534932c6e4d5cf1db83613ea3bcda', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 01:01:04', '2018-12-05 01:01:04', '2019-12-04 20:01:04'),
('9d4797a21ee7cafef8fc1e98b4e490880be21c7a0a0b879d7573e1c9fd90c2e9b2065e97a9626a54', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-21 06:58:07', '2018-11-21 06:58:07', '2019-11-21 01:58:07'),
('a03f4f3f4ba02b2f2ebc9ea01815984ebdc4f9aed22abebb4f38c8f99085c2e5d8e8fb864f1e7fde', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 01:01:36', '2018-12-05 01:01:36', '2019-12-04 20:01:36'),
('a0af0efa631fecc3506d02f7a810a37d0ce615ec0bdfcc3fbe94e3bac219b1b01c1dd860942fcea8', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:28:53', '2018-11-26 06:28:53', '2019-11-26 01:28:53'),
('a6d3abc2b0b48a412b6534dcadd675d13c1d9ebbbb4718a31c68436b11f8ec9ecd8c0948b3cfa950', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 09:12:55', '2018-11-26 09:12:55', '2019-11-26 04:12:55'),
('ac14b82f28e29e232539ed93ce34d50ac361fc0d80a06846dd87b45fc2cc33f5f5fb596659bcb589', 9, 1, 'FifthLightApp', '[]', 0, '2018-11-20 02:12:04', '2018-11-20 02:12:04', '2019-11-19 21:12:04'),
('b0e1069c6e509accd6e12f84bab2f08598e61e4419bcbc79d47f45c01209cab797537d28d36fae5c', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-18 08:00:14', '2018-11-18 08:00:14', '2019-11-18 03:00:14'),
('b1e9089c32b303f5fb23f9a3ab4d878a800e92c7a03c2bc776b36dcb3d51f4841d82268ea613e488', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 09:18:09', '2018-11-26 09:18:09', '2019-11-26 04:18:09'),
('b2eda37282f82ecefa9344957bf7d365032b7e88ae120a473b6a8524fe31807fb2c8ce2f53ffbb05', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:51:20', '2018-12-05 02:51:20', '2019-12-04 21:51:20'),
('b6ad3179d641aeb6da3fc7e7968ba46ab9395b2d2bbc5a9dc58146c36f0f02a0a277a55ca9409583', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:49:41', '2018-12-05 02:49:41', '2019-12-04 21:49:41'),
('b7e97e2d55822aff22322f387b9e918fc754876b33dc430c91ba4adf22b3bd3493440b32cb49a319', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-07 07:02:01', '2018-12-07 07:02:01', '2019-12-07 02:02:01'),
('ba74b46940f3acc049c3ef52cbc884ea137dc11ef14d9b09067f81822d0d601cec3320a711d31db2', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:51:18', '2018-12-05 02:51:18', '2019-12-04 21:51:18'),
('c11cb5309c31a6cba613a7b597b984706da434f207ca276acd8e7184c8f6035f5dc2b6f35587857d', 23, 1, 'FifthLightApp', '[]', 0, '2018-11-20 21:24:23', '2018-11-20 21:24:23', '2019-11-20 16:24:23'),
('c28ee839b348eebf2f582ac1391221849a7a778c8ccd614aa575dee7327fc0fde233b8713aa6c36e', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-15 19:33:22', '2018-11-15 19:33:22', '2019-11-15 14:33:22'),
('c3fdceab704f8251e2816d09f2b11acd2f02cda7a6452ebecce4b68b1df923950c4bff767ed027e1', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:23:23', '2018-11-26 06:23:23', '2019-11-26 01:23:23'),
('c457d500133fde396c560c47746baf5a07c27f07ca0c9046e2e8b4c31a80e5ca46520878a35171ac', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 08:23:43', '2018-11-26 08:23:43', '2019-11-26 03:23:43'),
('c525834576bc8320626eae59d9014e5e63343a6753444ba2adb673d19e1b484d2f38a9ea915541d2', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 08:24:19', '2018-11-26 08:24:19', '2019-11-26 03:24:19'),
('c587eb0bfccf45ec256e3586d951b38e3543a2a0dca6cd798c80ddfb7b19b208a51bfc0013778bfe', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 08:41:31', '2018-11-26 08:41:31', '2019-11-26 03:41:31'),
('ce37280f015dff057a34b97eab5d88a5b7f306ef9b834a4ec241d958572c5f646c8915b9efa33396', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-16 03:23:09', '2018-11-16 03:23:09', '2019-11-15 22:23:09'),
('cee67e3595896536ad4b46eea8501013293a3b1bde0db6cff358014350be93e655efaef9ccb4a15a', 4, 1, 'FifthLightApp', '[]', 0, '2018-12-05 21:06:40', '2018-12-05 21:06:40', '2019-12-05 16:06:40'),
('d1065734733aa0d4875ca8f71e51d67749c8ef450eeb872e7b60e4f2f5411b97009caef37f4817f5', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 00:55:30', '2018-12-05 00:55:30', '2019-12-04 19:55:30'),
('d72e2ef252d7feb8c81b87bb9138424a7368abd4536038ec249cbf70dc97e30f782775f6435dfacb', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:49:41', '2018-12-05 02:49:41', '2019-12-04 21:49:41'),
('d8b3c72bf1124c02fad14b0fb66196247095054ada40f638a2abbc4493f55f7d7440680fa8f1d34e', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:02:30', '2018-11-26 06:02:30', '2019-11-26 01:02:30'),
('e05ebadbc3679fdd901ce70507f4d7945e5280a03f258cec7299dd29c252184ac71d8cf711973c35', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 20:42:32', '2018-11-26 20:42:32', '2019-11-26 15:42:32'),
('e0a734bb284fd7fd852fa0cafed1b5d257adf9759dca7505756defe886d3ec0b4a63d93d0f94f9bb', 5, 1, 'FifthLightApp', '[]', 0, '2018-11-23 20:35:58', '2018-11-23 20:35:58', '2019-11-23 15:35:58'),
('e310e0ae362904889ae699412c02a2a50e93b578f426d77347d128fa3247e0bbdb758efca5bb972c', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:20:26', '2018-12-05 02:20:26', '2019-12-04 21:20:26'),
('e991da81d10a6ff317b2a7737a4226ead4eff8f97e194527e7c4be21120db723d6d6265997a9a416', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-30 07:36:38', '2018-11-30 07:36:38', '2019-11-30 02:36:38'),
('ed29825116d35ba871b1a8898fffd7235062fb66e44beba57eb07a00f024d6411baef52d32b29962', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 20:13:54', '2018-11-26 20:13:54', '2019-11-26 15:13:54'),
('ef643a85b6adaded827dde4bc4893d2c3bb6516e306d1156b52e79a77b7f1e7a7adc70ef00592817', 1, 1, 'Personal Access Token', '[]', 0, '2018-12-05 02:16:55', '2018-12-05 02:16:55', '2019-12-04 21:16:55'),
('f37d5741ef0fef07e0b652df01f454050724c2da58055cfcf4e51897762c16742b399354d741e445', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-15 19:41:53', '2018-11-15 19:41:53', '2019-02-07 14:41:53'),
('fab3939f220696c51b977363ea39e33500b796e05bba2ecfa35307bd8998a2bbf3492d3066f49f5a', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 06:07:57', '2018-11-26 06:07:57', '2019-11-26 01:07:57'),
('fbf3c8e354fef797ebab2585ce88123b23bc63ecab0de601c8087fae203bd850711dd45e73552ce7', 1, 1, 'Personal Access Token', '[]', 0, '2018-11-26 20:55:16', '2018-11-26 20:55:16', '2019-11-26 15:55:16'),
('fc0172286c9a9f81fb1ba6795d8b981d26ff7816467c322b68dbe41cc8a11e26d5a4f7064f54cf0b', 1, 1, 'Personal Access Token', '[]', 1, '2018-11-15 19:37:43', '2018-11-15 19:37:43', '2019-11-15 14:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'lE4pK6YQlmQibdhrdqvVPSHkVs6bAOKMjRXTYHUF', 'http://localhost', 1, 0, 0, '2018-10-18 20:17:52', '2018-10-18 20:17:52'),
(2, NULL, 'Laravel Password Grant Client', '4XE5Y19PkF8uv5duEIz4o6f7BDi1aCAs4zbaleR1', 'http://localhost', 0, 1, 0, '2018-10-18 20:17:52', '2018-10-18 20:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-10-18 20:17:52', '2018-10-18 20:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `name`, `description`) VALUES
(1, '2018-10-18 04:44:12', '2018-10-18 04:44:12', 'Administrator', 'User with all privileges'),
(2, '2018-10-18 04:44:12', '2018-10-18 04:44:12', 'Editor', 'User with some privileges'),
(3, '2018-10-18 04:44:12', '2018-10-18 04:44:12', 'User', 'Normal user for general web app functions');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'FifthLight', 'Admin', 'admin', 'jacob@fifthlightmedia.com', NULL, '$2y$10$pLVqH.w.0dxgtLKBu1Z99.pZNkEop91nbbQZy14ofBCeSCzBzGtNW', 'ucgjbfz0w2pUl15AllnrB0FR3a96ffHaV8MZOxynSOeRYivgrGCsHav0RKMr', '2018-10-18 04:44:12', '2018-10-18 04:44:12'),
(3, 'FifthLight', 'Editor', 'editor', 'jnartey@gmail.com', NULL, '$2y$10$uqS.dxDUK/e66DICAOM50.pO/Kxmf9UgVMFm1AgV/J8GaBIS1RIom', NULL, '2018-11-15 21:23:23', '2018-11-15 21:23:23'),
(4, 'Esther', 'Ofori', 'eofori', 'fletto@gmail.com', NULL, '$2y$10$RpIFm0.YlW/HXO7Ouz1iYOe/nHSDQS18oFeM4J8OjTYB1vjWQLQzS', NULL, '2018-12-05 21:06:40', '2018-12-05 21:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 3, 2),
(3, NULL, NULL, 4, 3),
(4, NULL, NULL, 5, 3),
(5, NULL, NULL, 6, 3),
(6, NULL, NULL, 9, 1),
(7, NULL, NULL, 13, 2),
(8, NULL, NULL, 15, 2),
(9, NULL, NULL, 16, 3),
(10, NULL, NULL, 23, 1),
(11, NULL, NULL, 5, 1),
(12, NULL, NULL, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
