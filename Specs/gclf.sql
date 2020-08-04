-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2020 at 01:54 PM
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
(1, 2),
(4, 2),
(5, 2),
(10, 2),
(2, 3),
(3, 4),
(6, 4),
(3, 5),
(6, 5),
(7, 5),
(1, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `first_name`, `surname`, `portrait`) VALUES
(2, 'Harrison', 'Ford', 'https://thumbs.dreamstime.com/b/harrison-ford-los-angeles-premiere-extraordinary-measures-held-grauman-s-chinese-theater-hollywood-usa-58056735.jpg'),
(3, 'Al', 'Pacino', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Al_Pacino.jpg/220px-Al_Pacino.jpg'),
(4, 'Laura', 'Betti', 'https://m.media-amazon.com/images/M/MV5BZTYwNWY0ZGMtZjJkMS00ZTk2LWE1Y2EtMWJhYTAzOWQzM2JkXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_UY317_CR175,0,214,317_AL_.jpg'),
(5, 'Giorgio', 'Cataldi', 'https://m.media-amazon.com/images/M/MV5BYzUzODZiZTEtY2NiMC00ZTc4LTkwZTEtZmZhZGZmZWIwMTJmXkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_UY317_CR31,0,214,317_AL_.jpg'),
(6, 'Laura', 'Dern', 'https://m.media-amazon.com/images/M/MV5BMjI3NzY0MDQxMF5BMl5BanBnXkFtZTcwNzMwMzcyNw@@._V1_UX214_CR0,0,214,317_AL_.jpg');

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
  `synopsis` varchar(2000) DEFAULT NULL COMMENT 'synopsis of the film',
  `poster` varchar(1000) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'category id of movie',
  `imdb_ref` varchar(100) DEFAULT NULL COMMENT 'reference to the IMDB database',
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `UK_title` (`movie_id`),
  KEY `FK_movies_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `year_released`, `synopsis`, `poster`, `category_id`, `imdb_ref`) VALUES
(1, 'Jurassic Park', 1993, 'A pragmatic paleontologist visiting an almost complete theme park is tasked with protecting a couple of kids after a power failure causes the park\'s cloned dinosaurs to run loose.', 'https://images-na.ssl-images-amazon.com/images/I/51dZZ4pl-kL._AC_.jpg', 3, 'https://www.imdb.com/title/tt0107290/?ref_=nv_sr_srsg_0'),
(2, 'Scarface', 1983, 'In 1980 Miami, a determined Cuban immigrant takes over a drug cartel and succumbs to greed.', 'https://thewallpaper.co//wp-content/uploads/2019/10//gun-film-movie-drama-dark-weapon-crime-poster-movie-wallpaper-scarface-cinema-images-hd-wallpaper-jpg.jpg', 4, 'https://www.imdb.com/title/tt0086250/?ref_=nv_sr_srsg_0'),
(3, 'Salò', 1975, 'In World War II Italy, four fascist libertines round up nine adolescent boys and girls and subject them to one hundred and twenty days of physical, mental and sexual torture.', 'https://cdn.shopify.com/s/files/1/1057/4964/products/salo-vintage-movie-poster-original-italian-2-foglio-39x55-6073_1491x.jpg?v=1534413233', 5, 'https://www.imdb.com/title/tt0073650/?ref_=nv_sr_srsg_0'),
(4, 'Star Wars I', 1978, 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', 'https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_.jpg', 1, 'https://www.imdb.com/title/tt0076759/?ref_=nv_sr_srsg_9'),
(5, 'Indiana Jones', 1981, 'In 1935, Indiana Jones arrives in India, still part of the British Empire, and is asked to find a mystical stone. He then stumbles upon a secret cult committing enslavement and human sacrifices in the catacombs of an ancient palace.', 'https://m.media-amazon.com/images/M/MV5BMTIxNDUxNzcyMl5BMl5BanBnXkFtZTcwNTgwOTI3MQ@@._V1_UY1200_CR90,0,630,1200_AL_.jpg', 3, 'https://www.imdb.com/title/tt0087469/?ref_=nv_sr_srsg_0'),
(6, 'Teorema', 1968, 'A mysterious young man seduces each member of a bourgeois family. When he suddenly leaves, how will their lives change?', 'https://m.media-amazon.com/images/M/MV5BZjNlMzM5MGYtMmRiYS00NDlhLThjMTgtYmUwYzVhYzVlZjgyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_UY1200_CR79,0,630,1200_AL_.jpg', 5, 'https://www.imdb.com/title/tt0063678/?ref_=nv_sr_srsg_0'),
(7, 'Oedipus Rex', 1967, 'Rescued from abandonment and raised by the King and Queen, Oedipus is still haunted by a prophecy--he\'ll murder his father and marry his mother.', 'https://www.gstatic.com/tv/thumb/v22vodart/31308/p31308_v_v8_aa.jpg', 4, 'https://www.imdb.com/title/tt0061613/?ref_=nv_sr_srsg_0'),
(8, 'The Real Thing', 2002, 'Rupert is a small time crook trying to do the right thing. But when his younger brother gets in trouble and needs a new liver, Rupert gets together his old gang and they plan a heist on New Years Eve.', 'https://m.media-amazon.com/images/M/MV5BMTc4NjcxMjczMF5BMl5BanBnXkFtZTcwMjg0MDcyMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 4, 'https://www.imdb.com/title/tt0377701/?ref_=nv_sr_srsg_0'),
(9, 'Something Fishy', 1994, 'Maxime is the best detective of a French agency. She is always very busy driving many investigations at one time. She divorced 15 years before, when she got the job. During an investigation she finds her son, who had not seen since he was a baby, so she begins to have memories of her past life that she belived forgotten. Another investigation leads her to discover dirty bussiness of her ex-husband.', 'https://m.media-amazon.com/images/M/MV5BMWI3ZjAwMjEtNmU1Zi00MDU4LTk5M2QtNWViMjRiMGVhYjg1XkEyXkFqcGdeQXVyNTY1MDY1NjY@._V1_SY1000_CR0,0,734,1000_AL_.jpg', 6, 'https://www.imdb.com/title/tt0110784/?ref_=nv_sr_srsg_0'),
(10, 'Raiders of the Lost Ark', 1981, 'Spring 1936. In the thick jungle of the South American continent, a renowned archeologist and expert on the occult is studying fragments of a map, when one of his exploration party pulls a gun. The archeologist pulls out a bullwhip and with such disarms the turncoat, sending him running - thus does Dr. Henry \"Indiana\" Jones stay alive. He and a guide enter a dank and oppressively vast cave that contains several traps created by the ancient race which hid inside a famous handheld statue; Indy barely escapes such traps but is cornered by native tribesmen served by Belloq, an old enemy who arrogantly makes off with the statue, while Indy must flee for his life and escape on a friend\'s seaplane. Back in the US two agents from US Army intelligence tell him of Nazi German activities in archeology, including a gigantic excavation site in Egypt - a site that an intercepted cable indicates to Indy is the location of the Ark of the Covenant, the powerful chest bearing the Ten Commandments, that the Nazis can use to obliterate any enemy. Indy must recruit a former girlfriend (the daughter of his old professor) and an old chum in Cairo to infiltrate the Nazi site and make off with the Ark, but along the way Indy gets involved in a series of fights, chases, and traps, before the Nazis learn the full power of the Ark.', 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_UY1200_CR84,0,630,1200_AL_.jpg', 3, 'https://www.imdb.com/title/tt0082971/?ref_=nv_sr_srsg_0'),
(24, 'The Shawshank Redemption', 1994, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 5, 'https://www.imdb.com/title/tt0111161/?ref_=ttmi_tt');

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
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL COMMENT 'email of user',
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'banana', 'big', 'banana@tree.com', 'bananainthebox'),
(3, 'pgradone', 'potito', 'pgradone@gmail.com', '$2y$10$sQYaVRU4a/yisiJY4I0AceXM5jUVejPZtZ7c1J9aWvRMTaETnYMSu'),
(4, 'avy', 'idk', 'avy@gmail.com', '$2y$10$9GEJLZRdL4AWMbKj4H3F2e88jN.SB3arVIBNs5399llQXjiNVcw2q');

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
