-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2019 at 08:42 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sweet_cake`
--
CREATE DATABASE sweet_cake;

USE sweet_cake;
-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `singer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `singer_id`, `title`, `slug`, `genre`, `published`, `created`, `modified`) VALUES
(1, 1, 'Jazz', 'jazz', 'Rock', 1, '2019-08-12 21:25:55', '2019-08-12 21:25:55'),
(2, 1, 'A Night at the Opera', 'a-night-at-the-opera', 'Rock', 1, '2019-08-12 21:25:55', '2019-08-12 21:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `albums_songs`
--

CREATE TABLE `albums_songs` (
  `album_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `singers`
--

CREATE TABLE `singers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `singers`
--

INSERT INTO `singers` (`id`, `name`, `country`, `created`, `modified`) VALUES
(1, 'Queen', 'Great Britain', '2019-08-12 21:25:47', '2019-08-12 21:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `song_text` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `slug`, `song_text`, `created`, `modified`) VALUES
(1, 'Mustapha', 'mustapha', 'Ibrahim, Ibrahim, Ibrahim,\r\nAllah, Allah, Allah, Allah will pray for you.\r\nHey!\r\nMustapha, Mustapha, Mustapha Ibrahim.\r\nMustapha, Mustapha, Mustapha Ibrahim.\r\nMustapha Ibrahim, Mustapha Ibrahim\r\nAllah, Allah, Allah will pray for you.', '2019-08-12 21:30:12', '2019-08-12 21:30:12'),
(2, 'Jealousy', 'jealousy', 'Oh how wrong can you be?\r\nOh to fall in love\r\nWas my very first mistake\r\nHow was I to know\r\nI was far too much in love to see?', '2019-08-12 21:30:12', '2019-08-12 21:30:12'),
(3, 'Bicycle Race', 'bicycle-race', 'Bicycle, bicycle, bicycle\r\nI want to ride my bicycle, bicycle, bicycle\r\nI want to ride my bicycle', '2019-08-12 21:30:12', '2019-08-12 21:30:12'),
(4, 'Love of My Life', 'love-of-my-life', 'Love of my life, you\'ve hurt me\r\nYou\'ve broken my heart and now you leave me\r\nLove of my life, can\'t you see?\r\nBring it back, bring it back\r\nDon\'t take it away from me, because you don\'t know\r\nWhat it means to me', '2019-08-12 21:30:12', '2019-08-12 21:30:12'),
(5, 'Bohemian Rhapsody', 'bohemian-rhapsody', 'Mama, just killed a man\r\nPut a gun against his head\r\nPulled my trigger, now he\'s dead\r\nMama, life had just begun\r\nBut now I\'ve gone and thrown it all away', '2019-08-12 21:30:12', '2019-08-12 21:30:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `singer_key` (`singer_id`);

--
-- Indexes for table `albums_songs`
--
ALTER TABLE `albums_songs`
  ADD PRIMARY KEY (`album_id`,`song_id`),
  ADD KEY `song_key` (`song_id`);

--
-- Indexes for table `singers`
--
ALTER TABLE `singers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `singers`
--
ALTER TABLE `singers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `singer_key` FOREIGN KEY (`singer_id`) REFERENCES `singers` (`id`);

--
-- Constraints for table `albums_songs`
--
ALTER TABLE `albums_songs`
  ADD CONSTRAINT `album_key` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`),
  ADD CONSTRAINT `song_key` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
