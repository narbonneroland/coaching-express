-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 27 Février 2014 à 14:22
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `Coach`
--

INSERT INTO `Coach` (`id`, `user_id`, `tarif`, `sexe`) VALUES
(1, 2, 45, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Contenu de la table `Sportif`
--

INSERT INTO `Sportif` (`id`, `user_id`, `training_id`, `coach_id`, `taille`, `poids`, `sexe`, `date_naissance`, `niveau`) VALUES
(1, 2, NULL, NULL, 171, 85, 1, '2009-01-01', 'débutant'),
(2, 3, NULL, NULL, 200, 100, 0, '2014-01-01', 'pro'),
(4, 5, NULL, NULL, 150, 45, 1, '2009-01-01', 'gfhg'),
(5, 6, NULL, NULL, 150, 45, 1, '2009-01-01', 'Intermédiaire'),
(7, 7, 6, NULL, 150, 85, 0, '2009-01-01', 'Intermédiaire'),
(8, 8, 1, NULL, 210, 120, 0, '2009-01-01', 'Intermédiaire'),
(9, 10, 9, NULL, 171, 85, 0, '2009-01-01', 'Intermédiaire'),
(13, 11, 2, NULL, 100, 10, 0, '1894-01-01', 'Intermédiaire'),
(14, 12, 8, NULL, 200, 100, 0, '1994-07-11', 'Professionnel'),
(16, 13, 10, NULL, 110, 110, 0, '1894-01-01', 'Intermédiaire');

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
(1, 'Sèche Débutant', 'Débutant'),
(2, 'Sèche Intermédiaire', 'Intermédiaire'),
(3, 'Sèche Avancée', 'Avancée'),
(4, 'Sèche Professionnelle', 'Professionnelle'),
(5, 'Prise de Masse Débutant', 'Débutant'),
(6, 'Prise de masse Intermédiaire', 'Intermédiaire'),
(7, 'Prise de Masse Avancée', 'Avancée'),
(8, 'Prise de masse Professionnelle', 'Professionnelle'),
(9, 'Entretien Débutant', 'Débutant'),
(10, 'Entretien Intermédiaire', 'Intermédiaire'),
(11, 'Entretien Avancée', 'Avancée');

-- --------------------------------------------------------

--
-- Structure de la table `Tweet`
--

CREATE TABLE IF NOT EXISTS `Tweet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FCA7253FC63E6FFF` (`twitter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Contenu de la table `User`
--

INSERT INTO `User` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `nom`, `prenom`) VALUES
(2, 'roland', 'roland', 'jane@doe.fr', 'jane@doe.fr', 1, 'd74gfmginy0wwgc00wcs0k0wsco0ckg', 'E6X6Uk55eWGSI9Ms4pXqbbzJ9cOA9BzPSOU+jdvCgEUdP4ojRpkFFJtG7oi+scHqrT+GpsrJYAUZDKqlDG5OiQ==', '2014-02-27 09:43:18', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'narbonne', 'roland'),
(3, 'toto', 'toto', 'toto@mail.fr', 'toto@mail.fr', 1, 'q13b5je4or4csgcw04gwss44s8g0co0', 'Uvl54+6tjefy0MTAvq8djOGZxt7Pt/ZuUX3AzhbIZJU3ZZEx5lsS4iEu6/YPXTwa3JMdB1DhZOfVPZKFrl1PqA==', '2014-02-26 10:59:25', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(4, 'toto2', 'toto2', 'toto2@mail.fr', 'toto2@mail.fr', 1, 'av8yx6s4o288cwk480w0sgow0ock0g', 'dxiKsoitlkvKt6T+TMOBZ7pl/9SJDUpAzX8LQQcdTDOCcnd/Vpdnc7nc6H985LNLDUoIBJWXsCpjQs5iTkdO/w==', '2014-02-26 11:16:10', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(5, 'toototo', 'toototo', 'totoo@mail.fr', 'totoo@mail.fr', 1, 'cu2z262w2v404wggg0w4w8swc4wcoko', 'SGcH+AAnwo235fnFERB41aNZY1qXYSrc/wtlmeF5DN30siQS6z5sZ1rH7L3h0PcAWMtQPgKTAavxciyHzcCH5Q==', '2014-02-26 12:13:27', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(6, 'aaa', 'aaa', 'dsqdfq@fsqdfsqd.fr', 'dsqdfq@fsqdfsqd.fr', 1, 'r1xytkv74xwg4cw8k00k0ksgk4kosg4', 'PonLCXf9BxBM7nLekkbmQxrieox5YcSbTSVjTVpudRs/JZKBQ51a3ut+l6rMfZOyUUU5LLrfSbbNm6s2+p/uZQ==', '2014-02-26 14:14:41', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(7, 'tootooo', 'tootooo', 'toto3@mail.fr', 'toto3@mail.fr', 1, 'dkiuzsaed1wssw084wwk0kgg48os40s', '8ID3E/NvMgqPM6F6mH7Um8+1nvMp0PIT5yVnErna++FSyY6ofJAKLP9+zEnRDbI7ofMtAG8iX45dwqIDEHnoIg==', '2014-02-26 14:36:48', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(8, 'dernier', 'dernier', 'totototo@mail.fr', 'totototo@mail.fr', 1, 'jkpr14asqt4wogk4g0cwwc040400gwo', 'xZX7yK5IrD5NBPc5OlL68zCZ+7f7oq8Q8EdIqinVH4xiY8tgrjuQbptTtHezattse6MQgE3hpWLYOJ09gDVhKQ==', '2014-02-26 17:18:08', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(9, 'oooo', 'oooo', 'o@o.fr', 'o@o.fr', 1, 'b3ub4e8e7a0c8csgocccwgsk08o8ccw', 'YIXC4HuaEDhFgwO9ZUAwEKJNdsgRe7JCB+EvF+qyWVM49tIvG/yCImcWPXFUIelGLOUvxaQCQU2kw0bjuiZAMw==', '2014-02-26 17:25:54', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(10, 'duduche', 'duduche', 'duduche@mail.fr', 'duduche@mail.fr', 1, '9gs4gt23iwgs0g848cc0wkocccc4o0w', 'FDFQ9JTL3uPqfJ05vwWcleuChNk8GSsP42b6Jxlm7uO+d7SndeqIYL9bE3slf/f/+6ECCxWCrN+X6y2EPjxdFQ==', '2014-02-27 09:37:37', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(11, 'titi', 'titi', 'titi@mail.fr', 'titi@mail.fr', 1, 'myrbv8d7beskc8ckggg0w4ggkcwk04k', 'WmHXLHQyy1xk8xdHgPqF2VnVLD8ZYZCGLrFhvQsXOA9LldCDX6+QXSzmbeiV4RdpYDNJQGpkv1TnOupyB1HltA==', '2014-02-27 10:04:28', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(12, 'lionel', 'lionel', 'lionel@mail.fr', 'lionel@mail.fr', 1, '9nxim2527nk0kkwsw84c44c4gwwg0ok', 'wLHLUhQ+/c1wS6sfa+vHU+xitlfuJlxxSzvsluPwyhxRKa7+S93qa8NKgS2hnq4sW7pPCz6Qb9JQx47lof1XYA==', '2014-02-27 11:06:22', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL),
(13, 'aaaa', 'aaaa', 'sdfsdf@fdsdf.fr', 'sdfsdf@fdsdf.fr', 1, '7ri34fuylyoskcw40gcck04gk0gw04s', 'bH0QfQwP+2mTUmnpzlyqhd8/EMhJKrZ/pIhIX7RSLvt9zDpsQHetDRT99S66kFYqcYirq7ZBzl1FLlaeBdYkCg==', '2014-02-27 12:57:21', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL);

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
