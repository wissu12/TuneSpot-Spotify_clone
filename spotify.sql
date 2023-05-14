-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 12 mai 2023 à 19:18
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `spotify`
--

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `artist`
--

INSERT INTO `artist` (`id`, `nom`, `image`) VALUES
(15, 'conord maynard', 'conord.jfif'),
(16, 'Rihanna', 'images.jfif'),
(17, 'Jennifer Lopez', 'jenniferlopez.jfif'),
(18, 'The weeknd', 'the weeknd.jfif'),
(19, 'John legend', 'jognlegend.png'),
(20, 'Sia', 'sia.jfif'),
(21, 'Selena Gomez', 'selenagomez.jfif'),
(22, 'Justin Bieber', 'jutinbieber.jpg'),
(23, 'Charlie puth', 'charlieputh.jpg'),
(24, 'Shown mendes', 'shownmendes.jfif'),
(26, 'Adele', 'adele.jpg'),
(27, 'Ed sheran', 'edsheran.jfif'),
(28, 'Alan walker', 'alanwalker.jfif');

-- --------------------------------------------------------

--
-- Structure de la table `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `audio` varchar(1000) NOT NULL,
  `id_artiste` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `song`
--

INSERT INTO `song` (`id`, `titre`, `image`, `audio`, `id_artiste`) VALUES
(0, 'Easy on me', '0.jpg', '0.mp3', 26),
(1, 'Hello', '1.jpg', '1.mp3', 26),
(2, 'Someone like you', '2.jpg', '2.mp3', 26),
(3, 'Someone you loved', '3.jpg', '3.mp3', 15),
(4, 'On the floor', '4.jpg', '4.mp3', 17),
(5, 'Save your tears', '5.jpg', '5.mp3', 18),
(6, 'Unstoppable', '6.jpg', '6.mp3', 20),
(7, 'Photograph', '7.jpg', '7.mp3', 27),
(8, 'Perfect', '8.jpg', '8.mp3', 27),
(9, 'Shape of you', '9.jpg', '9.mp3', 27),
(10, 'Diamonds', '10.jpg', '10.mp3', 16),
(11, 'We found a love', '11.jpg', '11.mp3', 16),
(12, 'Adter hours', '12.jpg', '12.mp3', 18),
(13, 'Blinding lights', '13.jpg', '13.mp3', 18),
(14, 'All of me', '14.jpg', '14.mp3', 19),
(15, 'Calm down', '15.jpg', '15.mp3', 21),
(16, 'Peaches', '16.jpg', '16.mp3', 22),
(17, 'Stay', '17.jpg', '17.mp3', 22),
(18, 'Hero', '18.jpg', '18.mp3', 28),
(19, 'Alone', '19.jpg', '19.mp3', 28),
(20, 'Faded', '20.jpg', '20.mp3', 28),
(21, 'Stitches', '21.jpg', '21.mp3', 24),
(22, 'See you again', '22.jpg', '22.mp3', 23);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `photo`, `adresse`, `tel`) VALUES
(11, ' ouafy', 'wissal', 'wissal.elouafy@etu.uae.ac.ma', '1234', '1.jpg', 'tetouan', '123456'),
(15, 'bassir', 'hamza', 'hamzabassir70@gmail.com', '1234', '9.jpg', 'Tetouan ,elhamama', '123456789'),
(19, 'El ouafy', 'wissu', 'wissalelouafy12@gmail.com', '1234', 'adele.jpg', 'Beni mellal ,ibn sina', '12345678');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artiste` (`id_artiste`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
