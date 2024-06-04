-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 06 Février 2024 à 18:48
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `soins`
--

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `medecin_id` int(11) NOT NULL,
  `rpss` varchar(12) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `adresse` varchar(256) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `specialite` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `medecin`
--

INSERT INTO `medecin` (`medecin_id`, `rpss`, `nom`, `prenom`, `adresse`, `telephone`, `specialite`) VALUES
(1, '100000000001', 'Grey', 'Meredith', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223333', 'Généraliste'),
(2, '100000000002', 'Shepherd', 'Derek', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223334', 'Généraliste'),
(3, '100000000003', 'Karev', 'Alex', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223335', 'Généraliste'),
(4, '100000000004', 'Stevens', 'Izzie', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223336', 'Généraliste'),
(5, '100000000005', 'Bailey', 'Miranda', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223337', 'Généraliste'),
(6, '100000000006', 'Webber', 'Richard', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223338', 'Généraliste'),
(7, '100000000007', 'Yang', 'Cristina', 'CCentre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223339', 'Dermatologue'),
(8, '100000000008', 'Omalley', 'George', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223340', 'Chirurgien'),
(9, '100000000009', 'Burke', 'Preston', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223341', 'Chirurgien'),
(10, '100000000010', 'Montgomery_Shepherd', 'Addison', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '1298223342', 'Cardiologue'),
(11, '100000000011', 'Torres', 'Callie', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223343', 'Dermatologue'),
(12, '100000000012', 'Sloan', 'Mark', 'Centre_Hospitalier_Régional_et_Universitaire_de_Paris', '0198223344', 'Allergologue');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `numsecu` varchar(15) DEFAULT NULL,
  `genre` varchar(10) DEFAULT NULL,
  `date_naissance` varchar(20) DEFAULT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `rattachement` int(11) DEFAULT NULL,
  `medecin_referent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `patient`
--

INSERT INTO `patient` (`patient_id`, `numsecu`, `genre`, `date_naissance`, `nom`, `prenom`, `rattachement`, `medecin_referent`) VALUES
(1, '1690529012561', 'Male', '22/05/1969', 'Dempsey', 'Justin', NULL, 1),
(2, '2080229931002', 'Female', '01/02/2008', 'Dempsey', 'Ellen', 1, 3),
(3, '1990329028069', 'Male', '02/03/1999', 'Dempsey', 'Patrick', 1, 4),
(4, '1560935006999', 'Male', '12/09/1956', 'Knight', 'T.R.', NULL, 2),
(5, '2170335112001', 'Female', '02/03/2017', 'Knight', 'Katherine', 4, 6),
(6, '2991135006001', 'Female', '05/11/1999', 'Knight', 'Sandra', 4, 8),
(7, '2060835112059', 'Female', '25/08/2006', 'Knight', 'Kate', 4, NULL),
(8, '1100135112456', 'Male', '17/01/2010', 'Knight', 'Isaiah', 4, NULL),
(9, '1690672111035', 'Male', '24/06/1969', 'Dane', 'Eric', NULL, NULL),
(10, '1800899112023', 'Male', '24/08/1980', 'Dane', 'James_Jr.', 9, 9),
(11, '2410606006006', 'Female', '21/06/1941', 'Ramirez', 'Sara', NULL, 10),
(12, '2010106006956', 'Female', '12/01/2001', 'Ramirez', 'Chandra', 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prescription`
--

CREATE TABLE `prescription` (
  `ordonnance_id` int(11) NOT NULL,
  `medicament` varchar(30) NOT NULL,
  `medecin` int(11) DEFAULT NULL,
  `patient` int(11) DEFAULT NULL,
  `date_visite` date DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `posologie` double DEFAULT NULL,
  `modalites` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prescription`
--

INSERT INTO `prescription` (`ordonnance_id`, `medicament`, `medecin`, `patient`, `date_visite`, `duree`, `posologie`, `modalites`) VALUES
(1, 'becotide', 1, 3, '2024-01-02', 180, 6, '2_bouffées'),
(1, 'ventoline', 1, 3, '2024-01-02', 2, 8, '1_bouffée_toutes_les_3_heures_pendant_2_jours'),
(2, 'aspégic', 4, 6, '2024-01-02', 5, 3, '1_comprimé_3_fois_par_jour'),
(3, 'ventoline', 12, 6, '2024-01-07', 180, 2, '1_bouffée_matin_et_soir'),
(4, 'doliprane_500', 1, 3, '2024-01-22', 7, 3, '1_comprimé_3_fois_par_jour'),
(5, 'ventoline', 6, 8, '2024-01-23', 60, 1, 'selon_besoins'),
(6, 'ventoline', 12, 9, '2024-01-27', 120, 1, 'selon_besoins'),
(7, 'aspégic', 5, 9, '2024-01-27', 7, 1, 'selon_la_douleur'),
(7, 'doliprane_1000', 5, 9, '2024-01-27', 7, 3, '1_comprimé_3_fois_par_jour');

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE `visite` (
  `medecin` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `date_visite` date NOT NULL,
  `prix` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `visite`
--

INSERT INTO `visite` (`medecin`, `patient`, `date_visite`, `prix`) VALUES
(1, 1, '2024-01-02', 23),
(1, 2, '2024-01-15', 23),
(1, 2, '2024-01-22', 23),
(1, 3, '2024-01-02', 23),
(1, 3, '2024-01-12', 23),
(1, 3, '2024-01-22', 23),
(1, 6, '2024-01-02', 23),
(3, 10, '2024-01-01', 23),
(4, 6, '2024-01-02', 23),
(4, 6, '2024-01-05', 23),
(4, 10, '2024-01-11', 23),
(5, 6, '2024-01-02', 30),
(5, 9, '2024-01-27', 30),
(5, 10, '2024-01-21', 23),
(6, 8, '2024-01-09', 23),
(6, 8, '2024-01-19', 23),
(6, 8, '2024-01-23', 23),
(6, 8, '2024-01-27', 23),
(6, 10, '2024-01-31', 23),
(7, 9, '2024-01-27', 40),
(8, 9, '2024-01-27', 23),
(9, 9, '2024-01-27', 23),
(10, 6, '2024-01-05', 70),
(10, 9, '2024-01-27', 70),
(11, 4, '2024-01-01', 23),
(11, 4, '2024-01-15', 23),
(11, 4, '2024-01-21', 23),
(11, 4, '2024-01-31', 23),
(11, 6, '2024-01-07', 40),
(11, 9, '2024-01-27', 40),
(12, 6, '2024-01-07', 23),
(12, 6, '2024-01-09', 40),
(12, 9, '2024-01-27', 40);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`medecin_id`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `rattachement` (`rattachement`),
  ADD KEY `medecin_referent` (`medecin_referent`);

--
-- Index pour la table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`ordonnance_id`,`medicament`),
  ADD KEY `medecin` (`medecin`,`patient`,`date_visite`);

--
-- Index pour la table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`medecin`,`patient`,`date_visite`),
  ADD KEY `patient` (`patient`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`rattachement`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`medecin_referent`) REFERENCES `medecin` (`medecin_id`);

--
-- Contraintes pour la table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`medecin`,`patient`,`date_visite`) REFERENCES `visite` (`medecin`, `patient`, `date_visite`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`medecin`) REFERENCES `medecin` (`medecin_id`),
  ADD CONSTRAINT `visite_ibfk_2` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
