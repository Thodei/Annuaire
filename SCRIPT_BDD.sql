-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 07 mai 2019 à 15:15
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `annuaire`
--


CREATE DATABASE IF NOT EXISTS annuaire;
USE annuaire;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idpersonne` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `bureau` varchar(10) NOT NULL,
  `date_arrivee` date NOT NULL,
  `mail` varchar(50) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  `poste_idposte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`idpersonne`, `nom`, `prenom`, `date_naissance`, `sexe`, `bureau`, `date_arrivee`, `mail`, `avatar`, `poste_idposte`) VALUES
(1, 'Sacquet', 'Frodon', '1980-05-08', 'Homme', 'Comté', '2019-05-01', 'sacquet.frodon@mail.com', 'avatar', 4),
(2, 'Eilish', 'Billie', '2001-12-18', 'Femme', 'B218', '2019-05-01', 'eilish.billie@mail.com', 'avatar', 5),
(3, 'Uchiha', 'Itachi', '1998-07-13', 'Homme', 'Konoha', '2019-05-01', 'uchiha.itachi@mail.com', 'avatar', 3),
(4, 'Azami', 'Riku', '1999-09-28', 'Homme', 'A078', '2019-05-01', 'azami.riku@mail.com', 'avatar', 6),
(5, 'Letexier', 'Yvick', '1993-08-14', 'Homme', 'G-Ville', '2019-05-01', 'letexier.yvick@mail.com', 'avatar', 1),
(6, 'Kaneki', 'Ken', '2007-08-23', 'Homme', 'I123', '2019-05-01', 'kaneki.ken@gmail.com', 'avatar', 8),
(7, 'Fillon', 'François', '1954-03-04', 'Homme', 'A089', '2019-05-01', 'fillon.francois@mail.com', 'avatar', 2),
(8, 'Uzumaki', 'Naruto', '1999-01-08', 'Homme', 'Konoha', '2019-05-01', 'uzumaki.naruto@mail.com', 'avatar', 10),
(9, 'Lannister', 'Cersei', '2013-03-08', 'Femme', 'B023', '2019-05-01', 'lannister.cersei@mail.com', 'avatar', 9),
(10, 'White', 'Walter', '2011-02-04', 'Homme', 'A148', '2019-05-01', 'white.walter@mail.com', 'avatar', 2),
(11, 'Laurent', 'Fiora', '2001-08-17', 'Femme', 'C484', '2019-05-01', 'laurent.fiora@mail.com', 'avatar', 5),
(12, 'Deiss', 'Thomas', '1998-08-27', 'Homme', 'A012', '2019-05-01', 'thomas.deiss@outlook.com', 'avatar', 5),
(21, 'Nougaret', 'Adrien', '1990-03-01', 'Homme', 'Le manoir', '2019-05-01', 'nougaret.adrien@mail.com', 'avatar', 5),
(26, 'Stark', 'Jon', '1779-08-05', 'Homme', 'North', '2019-05-01', 'stark.jon@mail.com', 'avatar', 6),
(29, 'Freecs', 'Gon', '1998-03-15', 'Homme', 'E123', '2019-05-01', 'freecs.gon@mail.com', 'avatar', 9);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE `poste` (
  `idposte` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `niveau_fonctionnel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`idposte`, `libelle`, `niveau_fonctionnel`) VALUES
(1, 'Directeur', 'Directeur'),
(2, 'Comptable', 'Cadre'),
(3, 'Ingénieur comptable', 'Cadre supérieur'),
(4, 'Peintre', 'Salarié'),
(5, 'Développeur', 'Cadre'),
(6, 'Technicien de surface', 'Salarié'),
(7, 'Chef d\'équipe', 'Cadre'),
(8, 'Technicien réseau', 'Salarié'),
(9, 'Secrétaire', 'Salarié'),
(10, 'Assistant directeur', 'Cadre supérieur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `mdp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `login`, `mdp`) VALUES
(1, 'utilisateur', 'motdepasse'),
(2, 'admin', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idpersonne`),
  ADD KEY `fk_personne_poste_idx` (`poste_idposte`);

--
-- Index pour la table `poste`
--
ALTER TABLE `poste`
  ADD PRIMARY KEY (`idposte`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idutilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `idpersonne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `poste`
--
ALTER TABLE `poste`
  MODIFY `idposte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `fk_personne_poste` FOREIGN KEY (`poste_idposte`) REFERENCES `poste` (`idposte`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
