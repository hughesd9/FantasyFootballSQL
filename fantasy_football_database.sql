-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2018 at 02:01 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fantasy football database`
--

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `LeagueID` int(10) NOT NULL,
  `LeagueName` text NOT NULL,
  `NumberOfManagers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`LeagueID`, `LeagueName`, `NumberOfManagers`) VALUES
(1111111111, 'League2', 5),
(1234567890, 'League1', 10),
(1422919111, 'League5', 18),
(1817161514, 'League4', 27),
(2147483647, 'League3', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `manager_and_league_view`
-- (See below for the actual view)
--
CREATE TABLE `manager_and_league_view` (
`ManagerID` int(10)
,`Points` int(11)
,`LeaguePosition` int(10)
,`LeagueID` int(10)
,`LeagueName` text
,`NumberOfManagers` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `manager_history`
--

CREATE TABLE `manager_history` (
  `ManagerID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_history`
--

INSERT INTO `manager_history` (`ManagerID`, `Year`, `Points`) VALUES
(52908501, 2016, 2130),
(222111334, 2016, 1890),
(222111334, 2017, 2150),
(1234561231, 2017, 2248),
(2147483647, 2015, 1907);

-- --------------------------------------------------------

--
-- Table structure for table `manager_table`
--

CREATE TABLE `manager_table` (
  `ManagerID` int(10) NOT NULL,
  `Points` int(11) NOT NULL,
  `LeagueID` int(10) NOT NULL,
  `LeaguePosition` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_table`
--

INSERT INTO `manager_table` (`ManagerID`, `Points`, `LeagueID`, `LeaguePosition`) VALUES
(52908501, 970, 1422919111, 9),
(222111334, 1204, 1234567890, 7),
(437918722, 1333, 1422919111, 4),
(1234561231, 1531, 1111111111, 3),
(2147483647, 1690, 1111111111, 1);

--
-- Triggers `manager_table`
--
DELIMITER $$
CREATE TRIGGER `InsertManagerHistory` AFTER INSERT ON `manager_table` FOR EACH ROW BEGIN
INSERT INTO manager_history VALUES(NEW.ManagerID, 2018, NEW.Points);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `manager_view`
-- (See below for the actual view)
--
CREATE TABLE `manager_view` (
`ManagerID` int(10)
,`Points` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `player_history`
--

CREATE TABLE `player_history` (
  `PlayerID` int(11) NOT NULL,
  `PlayerName` text NOT NULL,
  `Year` int(11) NOT NULL,
  `Points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_history`
--

INSERT INTO `player_history` (`PlayerID`, `PlayerName`, `Year`, `Points`) VALUES
(112937012, 'Christian Eriksen', 2017, 218),
(312636092, 'Matt Doherty', 2015, 124),
(343923223, 'Callum Paterson', 2018, 41),
(1122334455, 'Eden Hazard', 2017, 173),
(1231231234, 'Mo Salah', 2017, 303),
(2147483647, 'Sergio Aguero', 2017, 169);

-- --------------------------------------------------------

--
-- Table structure for table `player_table`
--

CREATE TABLE `player_table` (
  `PlayerID` int(10) NOT NULL,
  `PlayerName` text NOT NULL,
  `Team` text NOT NULL,
  `Position` text NOT NULL,
  `Points` int(11) NOT NULL,
  `Goals` int(11) NOT NULL,
  `Assists` int(11) NOT NULL,
  `CleanSheets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_table`
--

INSERT INTO `player_table` (`PlayerID`, `PlayerName`, `Team`, `Position`, `Points`, `Goals`, `Assists`, `CleanSheets`) VALUES
(112937012, 'Christian Eriksen', 'Tottenham Hotspur', 'Midfielder', 199, 11, 10, 17),
(312636092, 'Matt Doherty', 'Wolverhampton Wanderers', 'Defender', 95, 5, 1, 6),
(343923223, 'Callum Paterson', 'Cardiff City FC', 'Midfielder', 41, 3, 1, 1),
(1122334455, 'Eden Hazard', 'Chelsea', 'Forward', 211, 13, 10, 5),
(1231231234, 'Mo Salah', 'Liverpool', 'Forward', 132, 7, 4, 8),
(2147483647, 'Sergio Aguero', 'Manchester City', 'Forward', 160, 9, 6, 10);

--
-- Triggers `player_table`
--
DELIMITER $$
CREATE TRIGGER `InsertPlayerHistory` AFTER INSERT ON `player_table` FOR EACH ROW BEGIN
INSERT INTO player_history VALUES(NEW.PlayerID, NEW.PlayerName, 2018, NEW.Points);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TeamID` int(10) NOT NULL,
  `ManagerID` int(10) NOT NULL,
  `Goalkeeper_ID` int(10) NOT NULL,
  `Defender_1_ID` int(10) NOT NULL,
  `Defender_2_ID` int(10) NOT NULL,
  `Midfielder_ID` int(10) NOT NULL,
  `Forward_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TeamID`, `ManagerID`, `Goalkeeper_ID`, `Defender_1_ID`, `Defender_2_ID`, `Midfielder_ID`, `Forward_ID`) VALUES
(13, 52908501, 10001, 20001, 20002, 30001, 1122334455),
(37, 222111334, 10002, 312636092, 20003, 343923223, 40003),
(82, 1234561231, 10003, 20004, 20005, 112937012, 1122334455),
(90, 437918722, 10004, 312636092, 20004, 112937012, 2147483647),
(132, 2147483647, 10005, 20003, 20001, 112937012, 40001);

-- --------------------------------------------------------

--
-- Structure for view `manager_and_league_view`
--
DROP TABLE IF EXISTS `manager_and_league_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `manager_and_league_view`  AS  select `a`.`ManagerID` AS `ManagerID`,`a`.`Points` AS `Points`,`a`.`LeaguePosition` AS `LeaguePosition`,`b`.`LeagueID` AS `LeagueID`,`b`.`LeagueName` AS `LeagueName`,`b`.`NumberOfManagers` AS `NumberOfManagers` from (`manager_table` `a` join `league` `b` on((`a`.`LeagueID` = `b`.`LeagueID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `manager_view`
--
DROP TABLE IF EXISTS `manager_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `manager_view`  AS  select `manager_table`.`ManagerID` AS `ManagerID`,`manager_table`.`Points` AS `Points` from `manager_table` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`LeagueID`);

--
-- Indexes for table `manager_history`
--
ALTER TABLE `manager_history`
  ADD PRIMARY KEY (`ManagerID`,`Year`);

--
-- Indexes for table `manager_table`
--
ALTER TABLE `manager_table`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Indexes for table `player_history`
--
ALTER TABLE `player_history`
  ADD PRIMARY KEY (`PlayerID`,`Year`);

--
-- Indexes for table `player_table`
--
ALTER TABLE `player_table`
  ADD PRIMARY KEY (`PlayerID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamID`,`ManagerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
