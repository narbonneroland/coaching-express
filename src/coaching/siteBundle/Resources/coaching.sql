-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 25 Février 2014 à 12:20
-- Version du serveur: 5.5.34-0ubuntu0.13.04.1
-- Version de PHP: 5.4.9-4ubuntu2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `coaching`
--

-- --------------------------------------------------------

--
-- Structure de la table `Coach`
--

CREATE TABLE IF NOT EXISTS `Coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tarif` double NOT NULL,
  `sexe` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FE9842C8A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `coach_training`
--

CREATE TABLE IF NOT EXISTS `coach_training` (
  `coach_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  PRIMARY KEY (`coach_id`,`training_id`),
  KEY `IDX_ADAE93C53C105691` (`coach_id`),
  KEY `IDX_ADAE93C5BEFD98D1` (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Sportif`
--

CREATE TABLE IF NOT EXISTS `Sportif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `training_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `taille` int(11) NOT NULL,
  `poids` double NOT NULL,
  `sexe` tinyint(1) NOT NULL,
  `date_naissance` date NOT NULL,
  `niveau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D317D11A76ED395` (`user_id`),
  UNIQUE KEY `UNIQ_1D317D11BEFD98D1` (`training_id`),
  UNIQUE KEY `UNIQ_1D317D113C105691` (`coach_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `Sportif`
--

INSERT INTO `Sportif` (`id`, `user_id`, `training_id`, `coach_id`, `taille`, `poids`, `sexe`, `date_naissance`, `niveau`) VALUES
(1, 2, NULL, NULL, 171, 85, 1, '2009-01-01', 'débutant');

-- --------------------------------------------------------

--
-- Structure de la table `Training`
--

CREATE TABLE IF NOT EXISTS `Training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `Training`
--

INSERT INTO `Training` (`id`, `type`, `niveau`) VALUES
(1, 'Sèche', 'Débutant'),
(2, 'Sèche', 'Intermédiaire'),
(3, 'Sèche', 'Avancée'),
(4, 'Sèche', 'Professionnelle'),
(5, 'Prise de Masse', 'Débutant'),
(6, 'Prise de masse', 'Intermédiaire'),
(7, 'Prise de Masse', 'Avancée'),
(8, 'Prise de masse', 'Professionnelle'),
(9, 'Entretien', 'Débutant'),
(10, 'Entretien', 'Intermédiaire'),
(11, 'Entretien', 'Avancée');

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `nom` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2DA1797792FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_2DA17977A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `User`
--

INSERT INTO `User` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `nom`, `prenom`) VALUES
(2, 'roland', 'roland', 'jane@doe.fr', 'jane@doe.fr', 1, 'd74gfmginy0wwgc00wcs0k0wsco0ckg', 'E6X6Uk55eWGSI9Ms4pXqbbzJ9cOA9BzPSOU+jdvCgEUdP4ojRpkFFJtG7oi+scHqrT+GpsrJYAUZDKqlDG5OiQ==', '2014-02-25 11:52:22', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Coach`
--
ALTER TABLE `Coach`
  ADD CONSTRAINT `FK_FE9842C8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Contraintes pour la table `coach_training`
--
ALTER TABLE `coach_training`
  ADD CONSTRAINT `FK_ADAE93C53C105691` FOREIGN KEY (`coach_id`) REFERENCES `Coach` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ADAE93C5BEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `Training` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Sportif`
--
ALTER TABLE `Sportif`
  ADD CONSTRAINT `FK_1D317D113C105691` FOREIGN KEY (`coach_id`) REFERENCES `Coach` (`id`),
  ADD CONSTRAINT `FK_1D317D11A76ED395` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `FK_1D317D11BEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `Training` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
