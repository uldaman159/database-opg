-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 30. 08 2018 kl. 13:43:44
-- Serverversion: 10.1.34-MariaDB
-- PHP-version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_opg`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `custermer`
--

CREATE TABLE `custermer` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `custermer`
--

INSERT INTO `custermer` (`ID`, `FirstName`, `LastName`, `City`, `Country`, `PhoneNumber`, `Created`, `Modified`) VALUES
(2, 'Peter', 'Olesen', 'holstebro', '', 0, '2018-08-29 13:30:05', '2018-08-29 13:30:05'),
(3, 'Peter', 'Olesen', 'holstebro', 'Danmark', 31311313, '2018-08-29 13:31:04', '2018-08-29 13:31:04');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `order66`
--

CREATE TABLE `order66` (
  `ID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderNumber` int(11) NOT NULL,
  `CustermerId` int(11) NOT NULL,
  `TotalAmount` double NOT NULL,
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `orderitem`
--

CREATE TABLE `orderitem` (
  `ID` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `ProductName` varchar(255) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `product`
--

INSERT INTO `product` (`ID`, `SupplierId`, `ProductName`, `UnitPrice`, `created`, `modifed`) VALUES
(3, 1, 'Tv', 5000, '2018-08-29 22:11:14', '2018-08-29 22:21:39'),
(4, 1, 'PC', 2000, '2018-08-30 12:45:15', '2018-08-30 12:45:15');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `supplier`
--

INSERT INTO `supplier` (`ID`, `CompanyName`, `City`, `Country`, `Phone`, `Email`, `created`, `modified`) VALUES
(1, 'bilka', 'Holstebro', 'Danmark', 13376660, 'hej@gmail.com', '2018-08-29 12:37:21', '2018-08-29 12:37:21');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `custermer`
--
ALTER TABLE `custermer`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `order66`
--
ALTER TABLE `order66`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Order2Customer` (`CustermerId`);

--
-- Indeks for tabel `orderitem`
--
ALTER TABLE `orderitem`
  ADD KEY `OrderItem2Order` (`OrderId`),
  ADD KEY `OrderItem2Product` (`ProductId`);

--
-- Indeks for tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Product2Supplier` (`SupplierId`);

--
-- Indeks for tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `custermer`
--
ALTER TABLE `custermer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tilføj AUTO_INCREMENT i tabel `order66`
--
ALTER TABLE `order66`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tilføj AUTO_INCREMENT i tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `order66`
--
ALTER TABLE `order66`
  ADD CONSTRAINT `Order2Customer` FOREIGN KEY (`CustermerId`) REFERENCES `custermer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrænsninger for tabel `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `OrderItem2Order` FOREIGN KEY (`OrderId`) REFERENCES `order66` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem2Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrænsninger for tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product2Supplier` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
