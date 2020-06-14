-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Haz 2020, 13:50:46
-- Sunucu sürümü: 10.4.6-MariaDB
-- PHP Sürümü: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `otobus_bilet`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bilet`
--

CREATE TABLE `bilet` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soy_ad` varchar(50) NOT NULL,
  `telefon_no` varchar(12) DEFAULT NULL,
  `sefer_no` int(11) NOT NULL,
  `koltuk_numara` int(11) DEFAULT NULL
) ;

--
-- Tablo döküm verisi `bilet`
--

INSERT INTO `bilet` (`id`, `ad`, `soy_ad`, `telefon_no`, `sefer_no`, `koltuk_numara`) VALUES
(3, 'DILARA', 'YILDIZ', '04353232', 1, 1),
(4, 'BUSE', 'YILDIZ', '59435324', 1, 30);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `otobus`
--

CREATE TABLE `otobus` (
  `id` int(11) NOT NULL,
  `plaka` char(8) DEFAULT NULL,
  `marka` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `otobus`
--

INSERT INTO `otobus` (`id`, `plaka`, `marka`) VALUES
(1, '34ABC10', 'MERCEDES'),
(2, '34ABC11', 'MERCEDES');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seferler`
--

CREATE TABLE `seferler` (
  `id` int(11) NOT NULL,
  `nereden` int(11) NOT NULL,
  `nereye` int(11) NOT NULL,
  `otobus_no` int(11) DEFAULT NULL,
  `sofor_no` int(11) DEFAULT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `seferler`
--

INSERT INTO `seferler` (`id`, `nereden`, `nereye`, `otobus_no`, `sofor_no`, `tarih`) VALUES
(1, 1, 2, 1, 1, '2020-06-13 21:00:00'),
(2, 2, 1, 2, 2, '2020-06-14 11:47:54');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sehir`
--

CREATE TABLE `sehir` (
  `id` int(11) NOT NULL,
  `sehir` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `sehir`
--

INSERT INTO `sehir` (`id`, `sehir`) VALUES
(1, 'ADANA'),
(2, 'ADIYAMAN');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sofor`
--

CREATE TABLE `sofor` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soy_ad` varchar(50) NOT NULL,
  `telefon_no` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `sofor`
--

INSERT INTO `sofor` (`id`, `ad`, `soy_ad`, `telefon_no`) VALUES
(1, 'IBRAHIM', 'YILDIZ', '05042342'),
(2, 'SELIN', 'YILDIZ', '5435834');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefon_no` (`telefon_no`),
  ADD KEY `sefer_no` (`sefer_no`);

--
-- Tablo için indeksler `otobus`
--
ALTER TABLE `otobus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plaka` (`plaka`);

--
-- Tablo için indeksler `seferler`
--
ALTER TABLE `seferler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nereden` (`nereden`),
  ADD KEY `nereye` (`nereye`),
  ADD KEY `otobus_no` (`otobus_no`),
  ADD KEY `sofor_no` (`sofor_no`);

--
-- Tablo için indeksler `sehir`
--
ALTER TABLE `sehir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sehir` (`sehir`);

--
-- Tablo için indeksler `sofor`
--
ALTER TABLE `sofor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefon_no` (`telefon_no`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bilet`
--
ALTER TABLE `bilet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `otobus`
--
ALTER TABLE `otobus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `seferler`
--
ALTER TABLE `seferler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `sehir`
--
ALTER TABLE `sehir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `sofor`
--
ALTER TABLE `sofor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`sefer_no`) REFERENCES `seferler` (`id`);

--
-- Tablo kısıtlamaları `seferler`
--
ALTER TABLE `seferler`
  ADD CONSTRAINT `seferler_ibfk_1` FOREIGN KEY (`nereden`) REFERENCES `sehir` (`id`),
  ADD CONSTRAINT `seferler_ibfk_2` FOREIGN KEY (`nereye`) REFERENCES `sehir` (`id`),
  ADD CONSTRAINT `seferler_ibfk_3` FOREIGN KEY (`otobus_no`) REFERENCES `otobus` (`id`),
  ADD CONSTRAINT `seferler_ibfk_4` FOREIGN KEY (`sofor_no`) REFERENCES `sofor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
