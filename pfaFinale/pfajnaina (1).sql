-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 juil. 2021 à 20:11
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pfajnaina`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `description`) VALUES
(1, 'cat11', 'categorie 1'),
(2, 'categorie test', 'lorem ipsum'),
(3, 'cat cat cat', 'cat cat qsdqsdq'),
(4, 'aaaaaaaaaaaaa', 'aaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210630111134', '2021-06-30 11:11:55', 59),
('DoctrineMigrations\\Version20210630111500', '2021-06-30 11:15:11', 74),
('DoctrineMigrations\\Version20210630112018', '2021-06-30 11:20:30', 74),
('DoctrineMigrations\\Version20210630112602', '2021-06-30 11:26:09', 166),
('DoctrineMigrations\\Version20210701131356', '2021-07-01 13:14:02', 187),
('DoctrineMigrations\\Version20210701164951', '2021-07-01 16:49:56', 195),
('DoctrineMigrations\\Version20210703130112', '2021-07-03 13:01:20', 264);

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

DROP TABLE IF EXISTS `maladie`;
CREATE TABLE IF NOT EXISTS `maladie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `solution` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `coleur` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `maladie`
--

INSERT INTO `maladie` (`id`, `nom`, `solution`, `description`, `image`, `position`, `coleur`) VALUES
(1, 'malad1', 'sol malad1', 'des mala 1', '9d10341b84c799a9f8115e829c87f0d9.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310096!2d10.180870850510406!3d36.79846447985055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625090080454!5m2!1sfr!2stn', '#ff0000'),
(2, 'maladie 11', 'maladie 11', 'maladie 11', '48fe866f0a0ef5fb4c20ff78e8908c7f.jpeg', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310096!2d10.180870850510406!3d36.79846447985055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625090080454!5m2!1sfr!2stn', '#fff700'),
(3, 'maladi dinale', 'maladie final sol', 'lorem ipsum', '25d219f4aaa33e3c6fdf6931544edc9f.jpeg', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310105!2d10.180870850510411!3d36.79846447985054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625154505896!5m2!1sfr!2stn', '#000000'),
(4, 'maladie jj', 'maladie jj', 'maladie jj', '201becb53fa71b75d6012aa9809d3639.jpeg', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d51347.42019069015!2d10.680236301667234!3d36.45239006027098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x13029895efbdd3d3%3A0x2e5d60d1569ce4fe!2zTmFiZXVs4oCO!5e0!3m2!1sfr!2stn!4v1625173598513!5m2!1sfr!2stn', '#000000'),
(5, 'm1', 'm1', 'm1', '3d651c5db5b70ed125b78a068a211ace.jpeg', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d103514.99349276087!2d10.547842289052488!3d35.82831413292067!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x130275759ac9d10d%3A0x698e3915682cef7d!2sSousse!5e0!3m2!1sfr!2stn!4v1625328027294!5m2!1sfr!2stn', '#000000');

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) DEFAULT NULL,
  `maladie_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_creation` date NOT NULL,
  `position` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historique` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_517A6947BCF5E72D` (`categorie_id`),
  KEY `IDX_517A6947B4B1C397` (`maladie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plante`
--

INSERT INTO `plante` (`id`, `categorie_id`, `maladie_id`, `nom`, `description`, `ville`, `date_de_creation`, `position`, `image`, `histourique`) VALUES
(1, 1, 1, 'aa', 'aa', 'aa', '2021-06-30', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310096!2d10.180870850510406!3d36.79846447985055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625090080454!5m2!1sfr!2stn', '7035b6f860b23e05b75232b4ad3a0109.png', ''),
(2, 2, 2, 'plant 1', 'lorem', 'nabeul', '2021-07-01', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310096!2d10.180870850510406!3d36.79846447985055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625136743413!5m2!1sfr!2stn', '8b3f4ed13b98ab2c7673c6c4fcba4e24.jpeg', ''),
(3, 2, 3, 'aa', 'aa', 'aa', '2021-07-01', 'aa', '11640ab016f0bd1e9c284fee5580cb44.jpeg', ''),
(4, 1, 1, 'plant 2', 'description', 'ville', '2021-07-01', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3194.8367439310096!2d10.180870850510406!3d36.79846447985055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd346da0119c97%3A0x9a3d8e91a753dbf!2zQ2luw6ltYSBUaMOpw6J0cmUgbGUgUklP!5e0!3m2!1sfr!2stn!4v1625090080454!5m2!1sfr!2stn', 'a63a8edca36763acf43ca7292efcf130.jpeg', ''),
(5, 2, 2, 'aaa', 'aaa', 'aaa', '2021-07-03', 'aaa', '3948e83812085271cee1ffd8d7dfeb0b.jpeg', 'aa');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `roles`) VALUES
(1, 'admin@gmail.com', 'admin', '$2y$13$hJdnp14hKrGgU/BJXGyEReAWGqipRBG/0Tlcd2wWL0kfLiwkbqlWy', '[\"ROLE_ADMIN\"]'),
(2, 'membre@gmail.com', 'membre', '$2y$13$9nU4sC4aE9KvE12cz7D/iOq9Mf5O3qynWFtoGHJ8U3J89DfXEXVb2', '[]'),
(3, 'editor@gmail.com', 'editor', '$2y$13$vbHBKkAv/FlynT2aAPI.x.QftSN0ariesSK3MASlv2p9KGJUy72ci', '[\"ROLE_USER\", \"ROLE_EDITOR\"]');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `FK_517A6947B4B1C397` FOREIGN KEY (`maladie_id`) REFERENCES `maladie` (`id`),
  ADD CONSTRAINT `FK_517A6947BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
