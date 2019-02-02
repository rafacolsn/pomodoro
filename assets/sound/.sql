-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-raphcolson.alwaysdata.net
-- Generation Time: Dec 10, 2018 at 01:57 PM
-- Server version: 10.2.17-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messenger`
--

-- --------------------------------------------------------

--
-- Table structure for table `T_CONVERSATION`
--

CREATE TABLE `T_CONVERSATION` (
  `id_conversation` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `subject` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `TimeTopic` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `msg_unread` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_CONVERSATION`
--

INSERT INTO `T_CONVERSATION` (`id_conversation`, `author_id`, `subject`, `TimeTopic`, `msg_unread`) VALUES
(21, 3, 'Une première conversation', '2018-12-04 15:32:04', 0),
(22, 6, 'Comment lester un cadavre ?', '2018-12-07 08:21:25', 0),
(24, 4, 'Qui aime la popmusic ?', '2018-12-04 15:32:04', 0),
(25, 7, 'Comment découper un corps ?', '2018-12-07 08:21:36', 0),
(26, 3, 'Personne ne me connait ?', '2018-12-04 15:32:04', 0),
(35, 13, 'Salut, Nouveau sur BigChat', '2018-12-05 09:21:38', 0),
(36, 15, 'Overwatch Boost', '2018-12-05 09:24:57', 0),
(43, 15, 'Destruction du Monde', '2018-12-05 10:31:06', 0),
(53, 13, 'Qui veux du fromage ?', '2018-12-05 11:20:48', 0),
(58, 13, 'John Malkovich\r\n', '2018-12-05 11:24:16', 0),
(94, 15, 'test', '2018-12-05 15:41:00', 0),
(97, 13, 'Salut', '2018-12-06 08:15:15', 0),
(102, 6, 'Comment détruire une base de données ?', '2018-12-06 08:32:28', 0),
(112, 15, 'HELP OW', '2018-12-06 11:02:21', 0),
(131, 6, 'Comment faire une messagerie sans se clasher ?', '2018-12-06 15:10:59', 0),
(132, 15, 'chocolat noisette ', '2018-12-06 15:40:53', 0),
(165, 13, 'Jojojo', '2018-12-07 08:15:18', 0),
(166, 6, '2kg de cocaine à revendre', '2018-12-07 09:22:19', 0),
(175, 19, 'Vends Harley Davidson', '2018-12-10 09:31:23', 0),
(177, 21, 'Retour sur ma planète', '2018-12-10 09:12:29', 0),
(178, 23, 'BigChat entre en bourse', '2018-12-10 09:24:15', 0),
(179, 25, 'Salut les gens', '2018-12-10 11:07:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `T_EMOJIS`
--

CREATE TABLE `T_EMOJIS` (
  `id_emoji` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_EMOJIS`
--

INSERT INTO `T_EMOJIS` (`id_emoji`, `url`) VALUES
(1, 'content'),
(3, 'faché'),
(2, 'pas content'),
(4, 'triste');

-- --------------------------------------------------------

--
-- Table structure for table `T_MESSAGES`
--

CREATE TABLE `T_MESSAGES` (
  `id_message` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `T_MESSAGES`
--

INSERT INTO `T_MESSAGES` (`id_message`, `author_id`, `conversation_id`, `content`, `date_creation`, `date_modif`) VALUES
(5, 4, 22, 'Le travail des médecins légistes était difficile puisque le corps d\'Alexandre Dullekens est resté plus de quatre mois dans une fosse septique et était en \"état de dégradation majeure\". \"Le lestage du corps était très important car l\'accusé a lesté le corps avec trois grosses pierres, ce qui représente trente-trois kilos de charge, et ces pierres étaient reliées par des câbles électriques de plusieurs diamètres\", explique l\'un des trois médecins désignés par le juge d\'instruction. ', '2018-11-23 14:55:44', '2018-11-23 14:55:44'),
(6, 3, 22, 'La tête de la victime était emballée dans un sac en plastique, fermé avec des adhésifs, mais le haut du crane est resté libre. \"Nous avons observé un important bâillon tourné en de multiples spires autour du cou et de la tête et l\'enlèvement de ce bâillon a entraîné un flot de sang important qui provient probablement d\'un oedème hémorragique pulmonaire en rapport avec la strangulation\", note un médecin. \r\n', '2018-11-23 14:56:02', '2018-11-23 14:56:02'),
(8, 4, 24, 'La musique pop est un genre musical apparu dans les années 1960 au Royaume-Uni et aux États-Unis. Ces chansons parlent en général de l\'amour ou des relations entre les femmes et les hommes.', '2018-11-23 15:00:04', '2018-11-23 15:00:04'),
(11, 3, 26, 'La notoriété d\'une personne, d\'un organisme, d\'une marque ou d\'un produit est sa renommée publique, le fait qu\'il soit connu (ou non).', '2018-11-23 15:01:20', '2018-11-23 15:01:20'),
(12, 4, 25, 'Plusieurs organes ont été perforés mais il s\'agit, selon les médecins, de perforations post-mortem, vraisemblablement par sondes enfoncées dans le corps. On sait que l\'accusé a utilisé une tige métallique pour pousser le corps de la victime au fond de la fosse après avoir constaté, début juin, que le corps était remonté à la surface de l\'eau. ', '2018-11-23 15:02:35', '2018-11-23 15:02:35'),
(543, 7, 21, 'Look, just because I don\'t be givin\' no man a foot massage don\'t make it right for Marsellus to throw Antwone into a glass motherfuckin\' house, fuckin\' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, \'cause I\'ll kill the motherfucker, know what I\'m sayin\'? ', '2018-12-07 15:38:11', '2018-12-07 15:38:11'),
(545, 7, 25, 'avec une tronçonneuse...', '2018-12-07 15:39:20', '2018-12-07 15:39:20'),
(546, 7, 53, 'j\'ai dix kilos de raclette à donner', '2018-12-07 15:39:42', '2018-12-07 15:39:42'),
(548, 6, 166, 'qui a du blé ?', '2018-12-07 15:42:33', '2018-12-07 15:42:33'),
(549, 13, 165, 'lol', '2018-12-07 15:45:58', '2018-12-07 15:45:58'),
(550, 6, 131, 'Thks to Andy pour la cohésion d\'équipe !!!😜😜😜😍', '2018-12-07 15:46:17', '2018-12-07 15:46:17'),
(551, 6, 22, 'Benoît Poolvoerde a fait un bon tuto là-dessus...😓😳', '2018-12-07 15:47:13', '2018-12-07 15:47:13'),
(552, 6, 21, 'C\'est ici que tout a commené', '2018-12-07 15:47:42', '2018-12-07 15:47:42'),
(553, 6, 58, 'John Malkovich', '2018-12-07 15:49:06', '2018-12-07 15:49:06'),
(554, 7, 58, 'John Malkovich', '2018-12-07 15:49:51', '2018-12-07 15:49:51'),
(555, 6, 58, 'John Malkovich', '2018-12-07 15:50:06', '2018-12-07 15:50:06'),
(556, 6, 165, 'jajaja', '2018-12-07 15:53:39', '2018-12-07 15:53:39'),
(558, 13, 58, 'Malkovich John', '2018-12-07 15:55:23', '2018-12-07 15:55:23'),
(559, 17, 166, 'ooooooooooooh', '2018-12-07 15:55:32', '2018-12-07 15:55:32'),
(563, 6, 166, 'j\'attends vos offres', '2018-12-07 15:58:44', '2018-12-07 15:58:44'),
(564, 6, 102, 'des idées ?', '2018-12-07 15:59:06', '2018-12-07 15:59:06'),
(568, 13, 131, '🍊🍰🍮👻🍈🍈🍈😕🍋', '2018-12-08 19:01:08', '2018-12-08 19:01:08'),
(569, 15, 21, 'Steve was here...', '2018-12-09 13:52:23', '2018-12-09 13:52:23'),
(570, 17, 166, 'Joyeux anniversaire a Youssef ! en retard mybad : D', '2018-12-09 14:12:18', '2018-12-09 14:12:18'),
(571, 15, 166, '🎉🎁🍻 Encore bon anniversaire @badou !', '2018-12-09 14:17:43', '2018-12-09 14:17:43'),
(572, 13, 166, 'Merci, merci 🐵😬\r\n', '2018-12-09 18:18:09', '2018-12-09 18:18:09'),
(576, 19, 166, 'AKEKOUKOU VOTRE MESSAGERIE ELLE EST TIPTOP', '2018-12-10 08:48:02', '2018-12-10 08:48:02'),
(579, 19, 175, 'wesh, j\'vends mon harley, elle me sert pû a rien, négociable\r\n', '2018-12-10 08:50:40', '2018-12-10 08:50:40'),
(580, 6, 175, 'tu veux pas de la coke en échange... ?', '2018-12-10 08:54:25', '2018-12-10 09:22:12'),
(581, 13, 166, 'waw, trop gentil ça D\'jo', '2018-12-10 08:55:09', '2018-12-10 08:55:09'),
(582, 19, 175, 'J\'prends plus trop d\'coke, mais y a moyen négocier si elle est vrmt bonnne', '2018-12-10 08:58:54', '2018-12-10 08:58:54'),
(583, 6, 36, 'Y a qqqun ?', '2018-12-10 09:03:29', '2018-12-10 09:03:29'),
(584, 13, 36, 'Oui oui', '2018-12-10 09:03:40', '2018-12-10 09:03:40'),
(585, 7, 58, 'John Malkovitch', '2018-12-10 09:03:56', '2018-12-10 09:03:56'),
(586, 7, 165, 'mdr', '2018-12-10 09:05:04', '2018-12-10 09:05:04'),
(587, 7, 36, 'yep', '2018-12-10 09:05:46', '2018-12-10 09:05:46'),
(588, 6, 175, 'c\'est d\'la boooooombe !!😜😜👻💣💣💣', '2018-12-10 09:07:10', '2018-12-10 09:07:10'),
(589, 21, 177, 'Je veux rentrer chez moi !!! 😭😭😭', '2018-12-10 09:13:20', '2018-12-10 09:13:20'),
(590, 19, 177, 'Ecoute, j\'peux t\'heberger en attendant de trouver cmt rentrer, mais faudra pas toucher a  Laetitia', '2018-12-10 09:16:20', '2018-12-10 09:16:30'),
(591, 6, 177, 'Johnny revend une Harley si ça peut t\'aider...🐱🐱😍', '2018-12-10 09:16:30', '2018-12-10 09:16:30'),
(592, 23, 178, 'dkadkakdak', '2018-12-10 09:24:32', '2018-12-10 09:24:32'),
(593, 6, 178, 'pas très loquace Mark !!', '2018-12-10 09:25:01', '2018-12-10 09:25:19'),
(594, 25, 178, 'Salut a vous😭🙈', '2018-12-10 11:05:39', '2018-12-10 11:05:39'),
(595, 13, 178, 'lol', '2018-12-10 11:06:14', '2018-12-10 11:06:14'),
(596, 13, 178, 'lol', '2018-12-10 11:06:24', '2018-12-10 11:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `T_PARTICIPATION_CONVERSATION`
--

CREATE TABLE `T_PARTICIPATION_CONVERSATION` (
  `user_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `unread_msg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_PARTICIPATION_CONVERSATION`
--

INSERT INTO `T_PARTICIPATION_CONVERSATION` (`user_id`, `conversation_id`, `unread_msg`) VALUES
(3, 21, 14),
(3, 22, 9),
(3, 26, 7),
(3, 36, 8),
(3, 53, 7),
(4, 24, 7),
(4, 26, 7),
(4, 36, 8),
(4, 53, 7),
(4, 175, 3),
(6, 21, 0),
(6, 22, 0),
(6, 25, 0),
(6, 36, 0),
(6, 58, 1),
(6, 102, 0),
(6, 131, 1),
(6, 165, 0),
(6, 166, 0),
(6, 175, 0),
(6, 177, 0),
(6, 178, 3),
(6, 179, 0),
(7, 21, 2),
(7, 25, 0),
(7, 36, 0),
(7, 53, 0),
(7, 58, 0),
(7, 165, 0),
(7, 177, 3),
(8, 36, 15),
(8, 58, 29),
(10, 21, 3),
(10, 22, 10),
(10, 25, 2),
(10, 36, 8),
(10, 58, 29),
(10, 166, 17),
(13, 21, 0),
(13, 25, 0),
(13, 35, 0),
(13, 36, 1),
(13, 53, 0),
(13, 58, 1),
(13, 97, 0),
(13, 102, 0),
(13, 112, 0),
(13, 131, 0),
(13, 165, 1),
(13, 166, 0),
(13, 175, 0),
(13, 177, 3),
(13, 178, 0),
(13, 179, 0),
(15, 21, 0),
(15, 25, 0),
(15, 36, 0),
(15, 43, 0),
(15, 94, 0),
(15, 102, 0),
(15, 112, 0),
(15, 131, 0),
(15, 132, 0),
(15, 166, 0),
(15, 175, 0),
(15, 177, 0),
(15, 178, 0),
(17, 21, 0),
(17, 25, 0),
(17, 36, 3),
(17, 58, 1),
(17, 131, 0),
(17, 166, 2),
(17, 175, 3),
(17, 177, 3),
(19, 166, 1),
(19, 175, 0),
(19, 177, 0),
(19, 178, 5),
(21, 166, 0),
(21, 177, 0),
(21, 178, 5),
(23, 175, 0),
(23, 178, 3),
(25, 178, 0),
(25, 179, 0);

-- --------------------------------------------------------

--
-- Table structure for table `T_REACTIONS`
--

CREATE TABLE `T_REACTIONS` (
  `message_id` int(11) NOT NULL,
  `liked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_REACTIONS`
--

INSERT INTO `T_REACTIONS` (`message_id`, `liked`) VALUES
(543, 0),
(545, 1),
(546, 0),
(548, 0),
(549, 5),
(550, 1),
(551, 0),
(552, 1),
(553, 1),
(554, 1),
(555, 2),
(556, 2),
(558, 3),
(559, 2),
(563, 1),
(564, 0),
(568, 0),
(569, 1),
(570, 2),
(571, 2),
(572, 0),
(576, 2),
(579, 10),
(580, 1),
(581, 0),
(582, 0),
(583, 1),
(584, 0),
(585, 0),
(586, 0),
(587, 0),
(588, 0),
(589, 0),
(590, 1),
(591, 0),
(592, 0),
(593, 0),
(594, 1),
(595, 0),
(596, 0);

-- --------------------------------------------------------

--
-- Table structure for table `T_USERS`
--

CREATE TABLE `T_USERS` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `connected` tinyint(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `T_USERS`
--

INSERT INTO `T_USERS` (`id_user`, `email`, `firstname`, `lastname`, `username`, `password`, `connected`, `avatar`, `time`) VALUES
(6, 'raphcolson@gmail.com', 'Raphaël', 'Colson', 'raphcolson', '$2y$10$CSwOPdt/IY3hhyCglg0z1ekzTAFX8aVtvrcgi2X7RhJ6Yj8Og5.Ie', 1, 'raphcolson.jpg', '2018-12-10 12:53:20'),
(7, 'albert@mail.com', 'Albert', 'Cherche', 'albert', '$2y$10$OLEfKJsBs73Kxzfz7kvkouc0s.vmkl2dQTaDADLcRqYLlp9YZIMXG', 0, 'albert.jpg', '2018-12-10 09:15:32'),
(8, 'franco@cool.com', 'Franco', 'Verso', 'franco', '$2y$10$gR8rODOKAe2ste3pzCv3zOVYbLDdF7TM4dc3tsiuEJbmOxpZ2nrhS', 0, '', '2018-12-04 11:06:21'),
(10, 'kevin@becode.org', 'kevin', 'kevin', 'kevin', '$2y$10$mbqauipY5zHI6GhVdxfS/.kTxsdL14..jgwyRBSYU5uy4FVzN48fS', 0, '', '2018-12-04 11:06:21'),
(13, 'el.hirech.youssef@gmail.com', 'Youssef', 'El Hirech', 'badou', '$2y$10$WPVfHJkQq8PKKGLQZDV.lO9h7VihU7G96G7XBnAGX9jd8IwzYkXtS', 1, 'badou.jpeg', '2018-12-10 12:46:55'),
(15, 'steve.piron@gmail.com', 'Steve', 'Piron', 'Beda', '$2y$10$0SJPjYD1QY4dQ62hxi5k4ODI/5ulHDk5J2DcilScP7CqTiAHK2dZS', 1, 'Beda.jpg', '2018-12-10 12:45:02'),
(17, 'Jamaisdelavie@jeladonne.be', 'Krause', 'Andy', 'Jin', '$2y$10$nxxWpkdGv.bkVlm6m.YCH.Fjhiw9uZw.Su.xhqaj6Z1cdH2EDknRW', 0, 'Jin.jpg', '2018-12-10 08:39:51'),
(19, 'johnny@gmail.com', 'Johnny', 'Hallyday', 'Johnny', '$2y$10$CRB/ZzAXJ2wC35UKItEAsePHJXOjXa1Q85CHwCoFqmxTOFbkuZPGO', 0, 'Johnny.jpg', '2018-12-10 09:31:29'),
(21, 'alf@galilea.space', 'Alf', 'ET', 'Alf', '$2y$10$CzcFC5OxdeikmeObsUZdUeVTeFfK9.XBWQMvtTogNtEVnMBMXmaA.', 0, 'alf.jpg', '2018-12-10 12:45:02'),
(23, 'markzurker@gmail.com', 'Mark', 'Zukerberg', 'MarkZuker', '$2y$10$ZvNXcZw5e9TLfeXekWH7guWqDcXAjrip/rOsTnfb19/t4LwwJR/Ze', 0, 'Markzuker.jpg', '2018-12-10 09:38:26'),
(25, 'leny@gmail.com', 'leny', 'leny', 'Leny', '$2y$10$HtH4jVCYTC1QoWnekKXTE.Ghsja6Z1g7ZmSbQhH4bvEO7XXTQRh/2', 0, 'leny.png', '2018-12-10 12:45:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_CONVERSATION`
--
ALTER TABLE `T_CONVERSATION`
  ADD PRIMARY KEY (`id_conversation`),
  ADD UNIQUE KEY `subject` (`subject`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `T_EMOJIS`
--
ALTER TABLE `T_EMOJIS`
  ADD PRIMARY KEY (`id_emoji`),
  ADD UNIQUE KEY `URL` (`url`);

--
-- Indexes for table `T_MESSAGES`
--
ALTER TABLE `T_MESSAGES`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `T_MESSAGES_ibfk_1` (`conversation_id`);

--
-- Indexes for table `T_PARTICIPATION_CONVERSATION`
--
ALTER TABLE `T_PARTICIPATION_CONVERSATION`
  ADD UNIQUE KEY `user_id&conversation_id` (`user_id`,`conversation_id`) USING BTREE,
  ADD KEY `T_PARTICIPATION_CONVERSATION_ibfk_2` (`conversation_id`);

--
-- Indexes for table `T_REACTIONS`
--
ALTER TABLE `T_REACTIONS`
  ADD KEY `T_REACTIONS_ibfk_1` (`message_id`);

--
-- Indexes for table `T_USERS`
--
ALTER TABLE `T_USERS`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `T_CONVERSATION`
--
ALTER TABLE `T_CONVERSATION`
  MODIFY `id_conversation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `T_EMOJIS`
--
ALTER TABLE `T_EMOJIS`
  MODIFY `id_emoji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `T_MESSAGES`
--
ALTER TABLE `T_MESSAGES`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=597;

--
-- AUTO_INCREMENT for table `T_USERS`
--
ALTER TABLE `T_USERS`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_CONVERSATION`
--
ALTER TABLE `T_CONVERSATION`
  ADD CONSTRAINT `T_CONVERSATION_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `T_USERS` (`id_user`);

--
-- Constraints for table `T_MESSAGES`
--
ALTER TABLE `T_MESSAGES`
  ADD CONSTRAINT `T_MESSAGES_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `T_CONVERSATION` (`id_conversation`) ON DELETE CASCADE,
  ADD CONSTRAINT `T_MESSAGES_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `T_USERS` (`id_user`);

--
-- Constraints for table `T_PARTICIPATION_CONVERSATION`
--
ALTER TABLE `T_PARTICIPATION_CONVERSATION`
  ADD CONSTRAINT `T_PARTICIPATION_CONVERSATION_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `T_USERS` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `T_PARTICIPATION_CONVERSATION_ibfk_2` FOREIGN KEY (`conversation_id`) REFERENCES `T_CONVERSATION` (`id_conversation`) ON DELETE CASCADE;

--
-- Constraints for table `T_REACTIONS`
--
ALTER TABLE `T_REACTIONS`
  ADD CONSTRAINT `T_REACTIONS_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `T_MESSAGES` (`id_message`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
