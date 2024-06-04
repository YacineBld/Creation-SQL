-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 23 Mars 2024 à 13:51
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cinéma`
--

-- --------------------------------------------------------

--
-- Structure de la table `aime`
--

CREATE TABLE `aime` (
  `spectateur` int(11) NOT NULL,
  `titre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aime`
--

INSERT INTO `aime` (`spectateur`, `titre`) VALUES
(750, 'Dune'),
(2500, 'Godzilla'),
(3200, 'Star_Wars');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `titre` varchar(35) NOT NULL,
  `realisateur` varchar(30) DEFAULT NULL,
  `acteur` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`titre`, `realisateur`, `acteur`) VALUES
('Dune', 'Hugo', 'Timothée'),
('Godzilla', 'Steven', 'Peter'),
('Star_Wars', 'George_Lucas', 'Ben');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `producteur` varchar(30) DEFAULT NULL,
  `titre` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`producteur`, `titre`) VALUES
('Henry', 'Godzilla'),
('Carl', 'Star_Wars'),
('Ryles', 'Dune');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `nom` varchar(40) NOT NULL,
  `horaire` int(11) DEFAULT NULL,
  `titre` varchar(35) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `num_salle` int(11) DEFAULT NULL,
  `climatise` tinyint(1) DEFAULT NULL,
  `nb_place` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`nom`, `horaire`, `titre`, `adresse`, `code_postal`, `num_salle`, `climatise`, `nb_place`) VALUES
('Gaumont', 18, 'Star_Wars', '8 Rue du Mondial 1998', 93200, 2, 0, 120),
('Grand_As', 17, 'Dune', '7 Rue Honoré de Balzac', 75012, 3, 1, 200),
('Grand_Rex', 14, 'Godzilla', '1 Bd Poissonnière', 75002, 1, 1, 280);

-- --------------------------------------------------------

--
-- Structure de la table `vu`
--

CREATE TABLE `vu` (
  `spectateur` int(11) NOT NULL,
  `titre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vu`
--

INSERT INTO `vu` (`spectateur`, `titre`) VALUES
(5000, 'Dune'),
(3000, 'Godzilla'),
(4000, 'Star_Wars');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aime`
--
ALTER TABLE `aime`
  ADD PRIMARY KEY (`spectateur`,`titre`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`titre`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD KEY `titre` (`titre`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`nom`),
  ADD KEY `titre` (`titre`);

--
-- Index pour la table `vu`
--
ALTER TABLE `vu`
  ADD PRIMARY KEY (`spectateur`,`titre`),
  ADD KEY `titre` (`titre`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`);

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`);

--
-- Contraintes pour la table `vu`
--
ALTER TABLE `vu`
  ADD CONSTRAINT `vu_ibfk_1` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
