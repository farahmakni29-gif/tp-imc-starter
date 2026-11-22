-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 22 nov. 2026 à 21:50
-- Version du serveur : 10.11.19-MariaDB
-- Version de PHP : 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `imc_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `mesures`
--

CREATE TABLE `mesures` (
  `id` int(11) NOT NULL,
  `personne_id` int(11) NOT NULL,
  `poids` decimal(5,1) NOT NULL,
  `taille` decimal(3,2) NOT NULL,
  `imc` decimal(4,1) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `date_mesure` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mesures`
--

INSERT INTO `mesures` (`id`, `personne_id`, `poids`, `taille`, `imc`, `categorie`, `date_mesure`) VALUES
(1, 1, 72.5, 1.75, 23.7, '0', '2026-11-22 00:00:00'),
(2, 1, 80.0, 1.75, 26.1, '0', '2026-11-22 00:00:00'),
(3, 2, 52.0, 1.68, 18.4, '0', '2026-11-22 00:00:00'),
(4, 2, 58.0, 1.68, 20.5, '0', '2026-11-22 00:00:00'),
(5, 3, 95.0, 1.72, 32.1, '0', '2026-11-22 00:00:00'),
(6, 1, 72.5, 1.75, 23.7, 'normal', '2026-11-22 00:00:00'),
(7, 1, 80.0, 1.75, 26.1, 'surpoids', '2026-11-22 00:00:00'),
(8, 2, 52.0, 1.68, 18.4, 'sous poids', '2026-11-22 00:00:00'),
(9, 2, 58.0, 1.68, 20.5, 'normal', '2026-11-22 00:00:00'),
(10, 3, 95.0, 1.72, 32.1, 'obésité', '2026-11-22 00:00:00'),
(11, 1, 72.5, 1.75, 23.7, 'normal', '2026-11-22 00:00:00'),
(12, 1, 80.0, 1.75, 26.1, 'surpoids', '2026-11-22 00:00:00'),
(13, 2, 52.0, 1.68, 18.4, 'sous poids', '2026-11-22 00:00:00'),
(14, 2, 58.0, 1.68, 20.5, 'normal', '2026-11-22 00:00:00'),
(15, 3, 95.0, 1.72, 32.1, 'obésité', '2026-11-22 00:00:00'),
(16, 1, 72.5, 1.75, 23.7, 'normal', '2026-11-22 21:47:53'),
(17, 1, 80.0, 1.75, 26.1, 'surpoids', '2026-11-22 21:47:53'),
(18, 2, 52.0, 1.68, 18.4, 'sous poids', '2026-11-22 21:47:53'),
(19, 2, 58.0, 1.68, 20.5, 'normal', '2026-11-22 21:47:53'),
(20, 3, 95.0, 1.72, 32.1, 'obésité', '2026-11-22 21:47:53');

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id`, `nom`, `prenom`) VALUES
(1, 'ben salah', 'amine'),
(2, 'trabelsi', 'sana'),
(3, 'gharbi', 'youssef');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mesures`
--
ALTER TABLE `mesures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_id` (`personne_id`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mesures`
--
ALTER TABLE `mesures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mesures`
--
ALTER TABLE `mesures`
  ADD CONSTRAINT `mesures_ibfk_1` FOREIGN KEY (`personne_id`) REFERENCES `personnes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
