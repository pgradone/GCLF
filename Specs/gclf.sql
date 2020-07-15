-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 15, 2020 at 11:13 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gclf`
--

-- --------------------------------------------------------

--
-- Table structure for table `act`
--

DROP TABLE IF EXISTS `act`;
CREATE TABLE IF NOT EXISTS `act` (
  `movie_id` int(11) NOT NULL COMMENT 'id of movie acting',
  `actor_id` int(11) NOT NULL COMMENT 'id of actor acting',
  PRIMARY KEY (`actor_id`,`movie_id`),
  KEY `FK_movies_act` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `act`
--

INSERT INTO `act` (`movie_id`, `actor_id`) VALUES
(4, 2),
(5, 2),
(10, 2),
(2, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of actor',
  `first_name` varchar(100) DEFAULT NULL COMMENT 'first name of actor',
  `surname` varchar(100) DEFAULT NULL COMMENT 'family name of actor',
  `portrait` varchar(1000) DEFAULT NULL COMMENT 'url picture of actor',
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `first_name`, `surname`, `portrait`) VALUES
(2, 'Harrison', 'Ford', 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Harrison_Ford_2017.jpg'),
(3, 'Al', 'Pacino', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Al_Pacino.jpg/220px-Al_Pacino.jpg'),
(4, 'Laura', 'Betti', 'https://www.google.com/search?sxsrf=ALeKk01X4TFNlnTNeDwm9S-s6BaWNXzy8g:1594809391798&q=Laura+Betti&stick=H4sIAAAAAAAAAONgFuLQz9U3MDcqSlfiBLGMc8vj07SEspOt9NMyc3LBhFVyYnHJI8Y9jNwCL3_cE5baxDhpzclrjKsZubCoE1LhYnPNK8ksqRSS4uKRghuvwSDFxYWwLNsoftelaefYIgUZgOBBaJiDlKaWEBe7Z7FPfnJijmDqBhmGr__f22sJc3GEJFbk5-XnVoKVMjB8sFdS5DTs0HT4C5QXvNnAwCAbH-AgwaHAqMFgGPbt__xf9S4OWgxN-1YcYmPhYBRgsGLSYOJZxMrtk1halKjglFpSkjmBjREA8Yo6ePwAAAA&sa=X&ved=2ahUKEwiF9aD6h8_qAhXoRxUIHY9fDj8Q-BYwNHoECCUQRQ'),
(5, 'Giorgio', 'Cataldi', 'https://www.google.com/search?sxsrf=ALeKk01X4TFNlnTNeDwm9S-s6BaWNXzy8g:1594809391798&q=Giorgio+Cataldi&stick=H4sIAAAAAAAAAONgFuLQz9U3MDcqSlfiBLGyjUoKc7WEspOt9NMyc3LBhFVyYnHJI8Y9jNwCL3_cE5baxDhpzclrjKsZubCoE1LhYnPNK8ksqRSS4uKRghuvwSDFxYWwLNsoftelaefYIgUZgOBBaJiDlKaWEBe7Z7FPfnJijmDqBhmGr__f22sJc3GEJFbk5-XnVoKVMjB8sFdS5DTs0HT4C5QXvNnAwCAbH-AgwaHAqMFgGPbt__xf9S4OWgxN-1YcYmPhYBRgsGLSYOJZxMrvnplflJ6Zr-CcWJKYk5I5gY0RAHdshKAAAQAA&sa=X&ved=2ahUKEwiF9aD6h8_qAhXoRxUIHY9fDj8Q-BYwLHoECCUQLQ');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identifier of category',
  `gender` varchar(50) DEFAULT NULL COMMENT 'gender or label of category',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK_Category` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `gender`) VALUES
(2, NULL),
(3, 'Adventure'),
(6, 'Comedy'),
(5, 'Drama'),
(7, 'Horror'),
(1, 'Sci-Fi'),
(4, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `contain`
--

DROP TABLE IF EXISTS `contain`;
CREATE TABLE IF NOT EXISTS `contain` (
  `playlist_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`movie_id`),
  KEY `contain_ibfk_1` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of the movie',
  `title` varchar(50) NOT NULL,
  `year_released` int(11) DEFAULT NULL COMMENT 'year of release',
  `synopsis` varchar(500) DEFAULT NULL COMMENT 'synopsis of the film',
  `poster` varchar(1000) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'category id of movie',
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `UK_title` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `year_released`, `synopsis`, `poster`, `category_id`) VALUES
(1, 'Jurassic Park', 1993, '2', 'https://images-na.ssl-images-amazon.com/images/I/51dZZ4pl-kL._AC_.jpg', NULL),
(2, 'Scarface', 1983, '4', 'https://thewallpaper.co//wp-content/uploads/2019/10//gun-film-movie-drama-dark-weapon-crime-poster-movie-wallpaper-scarface-cinema-images-hd-wallpaper-jpg.jpg', NULL),
(3, 'Salò', 1975, '3', 'https://cdn.shopify.com/s/files/1/1057/4964/products/salo-vintage-movie-poster-original-italian-2-foglio-39x55-6073_1491x.jpg?v=1534413233', NULL),
(4, 'Star Wars I', 1978, '5', 'https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_.jpg', NULL),
(5, 'Indiana Jones', 1981, '2', 'https://m.media-amazon.com/images/M/MV5BMTIxNDUxNzcyMl5BMl5BanBnXkFtZTcwNTgwOTI3MQ@@._V1_UY1200_CR90,0,630,1200_AL_.jpg', NULL),
(6, 'Teorema', 1968, '3', 'https://m.media-amazon.com/images/M/MV5BZjNlMzM5MGYtMmRiYS00NDlhLThjMTgtYmUwYzVhYzVlZjgyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_UY1200_CR79,0,630,1200_AL_.jpg', NULL),
(7, 'Oedipus Rex', 1967, '3', 'https://www.gstatic.com/tv/thumb/v22vodart/31308/p31308_v_v8_aa.jpg', NULL),
(8, 'The Real Thing', 2002, '6', 'https://m.media-amazon.com/images/M/MV5BMTc4NjcxMjczMF5BMl5BanBnXkFtZTcwMjg0MDcyMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', NULL),
(9, 'Something Fishy', 1994, '1', 'https://m.media-amazon.com/images/M/MV5BMWI3ZjAwMjEtNmU1Zi00MDU4LTk5M2QtNWViMjRiMGVhYjg1XkEyXkFqcGdeQXVyNTY1MDY1NjY@._V1_SY1000_CR0,0,734,1000_AL_.jpg', NULL),
(10, 'Raiders of the Lost Ark', 1981, '5', 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_UY1200_CR84,0,630,1200_AL_.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
CREATE TABLE IF NOT EXISTS `playlists` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of playlist',
  `playlist_name` varchar(100) NOT NULL COMMENT 'name of playlist',
  `creation_date` date DEFAULT NULL COMMENT 'date of creation',
  `user_id` int(11) DEFAULT NULL COMMENT 'foreign key to user id',
  PRIMARY KEY (`playlist_id`),
  UNIQUE KEY `UK_playlist_name` (`playlist_name`),
  KEY `IDX_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='movies playlist';

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `playlist_name`, `creation_date`, `user_id`) VALUES
(1, 'Playlist one', '2020-07-08', NULL),
(2, 'Playlist Two', '2020-07-14', 3),
(3, 'Playlist Three', '2020-05-14', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL COMMENT 'email of user',
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'banana', 'banana@tree.com', 'bananainthebox'),
(3, 'pgradone', 'pgradone@gmail.com', '$2y$10$sQYaVRU4a/yisiJY4I0AceXM5jUVejPZtZ7c1J9aWvRMTaETnYMSu'),
(4, 'avy', 'avy@gmail.com', '$2y$10$9GEJLZRdL4AWMbKj4H3F2e88jN.SB3arVIBNs5399llQXjiNVcw2q');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `act`
--
ALTER TABLE `act`
  ADD CONSTRAINT `FK_actors_act` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_movies_act` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `FK_movies_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;