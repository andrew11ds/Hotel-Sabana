-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2020 a las 22:51:22
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sabana_db`
--
CREATE DATABASE IF NOT EXISTS `sabana_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sabana_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `date`
--

CREATE TABLE `date` (
  `room_id` int(5) NOT NULL,
  `date_id` int(10) NOT NULL,
  `date_start` varchar(10) NOT NULL,
  `date_end` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotels`
--

CREATE TABLE `hotels` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(20) NOT NULL,
  `phone` int(15) NOT NULL,
  `fax` int(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `rooms` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `address`, `state`, `phone`, `fax`, `email`, `website`, `type`, `rooms`) VALUES
(1, 'Raheem Residency', '\"20/1100Beach Road, Alleppey West - 688 012, KERALA\"', 'KERALA', 477, 477, 'contact@raheemresidency.com', 'www.raheemresidency.com', 'Heritage Classic', 10),
(2, 'Noor Us Sabah Palace', '\"V.I.P.RoadKoh-E-Fiza, Bhopal - 462001, MADHYA PRADESH\"', 'MADHYA PRADESH', 755, 755, 'contact@noorussabahpalace.com/reservations@nusp.in', 'www.noorussabahpalace.com', 'Heritage Classic', 57),
(3, 'The Panjim Inn ', '\"31-ST JANUARY ROAD, FONTAINHAS, PANAJI, Panaji , GOA\"', 'GOA', 2147483647, 2147483647, 'visalam@cghearth.com', 'www.cghearth.com', 'Heritage Basic', 15),
(4, 'Balaram Palace Resort', '\"Chitrassani Village,off Abu Palanpur Highway No.14 Banaskantha, BANASKANTHA, GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'balarampalaceresort@gmail.com', 'NA', 'Heritage Basic', 22),
(5, 'Nilambag Palace Hotel', '\"Bhavnagar, Bhavnagar, GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'reservation@nilambagpalace.com', 'NA', 'Heritage Basic', 28),
(6, 'The Fort Ramgarh', '\"Ramgarh, Panchkula On NH - 73 Delhi Shimla Highway, Near Chandigarh, Panchkula Distt., HARYANA\"', 'HARYANA', 1733253072, 0, 'thefortramgarh@gmail.com', 'NA', 'Heritage Basic', 12),
(7, 'The Judges Court', '\"Heritage VillageParagpur, Distt. - Kangra - 177107, HIMACHAL PRADESH\"', 'HIMACHAL PRADESH', 1970, 1970, 'eries@vsnl.com/info@judgescourt.com', 'www.judgescourt.com', 'Heritage Basic', 10),
(8, 'The Palace', '\"Chail, Solan,HIMACHAL PRADESH\"', 'HIMACHAL PRADESH', 1772652704, 1772652206, 'maltidutta50@yahoo.com', 'NA', 'Heritage Basic', 31),
(9, 'The Castle Naggar', '\"Naggar, Distt. Kullu - 175130, HIMACHAL PRADESH\"', 'HIMACHAL PRADESH', 1902248316, 1902223429, 'castle@hptddc.in/kullu@hptdc.in', 'wwwhptdc.nic.in', 'Heritage Basic', 17),
(10, 'Hotel Cherthala House', '\"Court JunctionEast of P.M.C. - 5, cherthala - 688 524, KERALA\"', 'KERALA', 475, 0, 'housecherthala@hotmail.com', 'NA', 'Heritage Basic', 5),
(11, 'Heritaga Methanam', '\"K P XI / 298Near Perumpadappu, Kumbalanghi Bridge, Kumbalanghi P.O., Kochi - 682 007, KERALA\"', 'KERALA', 2147483647, 2147483647, 'heritagemethanam@gmail.com/info@heritagemethanam.com', 'www.heritagemethanam.com', 'Heritage Basic', 7),
(12, 'Old Lighthouse Bristow Hotel ', '\"Beach Road Next to SBI Training Center Fort Kochi , Cochin , KERALA\"', 'KERALA', 2147483647, 0, 'reservations@oldlighthousehotel.com', 'NA', 'Heritage Basic', 11),
(13, 'Hotel Le Colonial ', '\"1/215, Church Road, Vasco-da-Gama Square, Fort Cochin , KERALA\"', 'KERALA', 2147483647, 2147483647, 'lecolonial@dataone.in', 'NA', 'Heritage Basic', 8),
(14, 'Kunnathur Mana Ayurveda Heritage', '\"Door No.VIII/666 Punnayurkulam P.O. Thrissur Dist, Kerala, KERALA\"', 'KERALA', 487, 2147483647, 'mail@kmaheritage.com', 'NA', 'Heritage Basic', 7),
(15, 'Old Harbour Hotel', '\"No-1/328, Tower Road, Fort Kochi , Kochi , KERALA\"', 'KERALA', 2147483647, 0, 'raintree@fortcochin.com', 'NA', 'Heritage Basic', 13),
(16, 'Coconut Lagoon', '\"P.O. Box No. 2Kumarakom, Kottayam - 686563, KERALA\"', 'KERALA', 481, 481, 'coconutlagoon@cghearth.com', 'www.cghearth.com', 'Heritage Basic', 36),
(17, 'Beach Hotel', '\"(Beach Heritage Inn (P) Ltd.)Beach Road, Kozhikode - 673032, KERALA\"', 'KERALA', 495, 495, 'info@beachheritage.com', 'www.beachheritage.com', 'Heritage Basic', 6),
(18, 'Palakkad Heritage Hotels', '\"Koduvayur P.O.Palakkad, Dist., KERALA \"', 'KERALA', 2147483647, 2147483647, 'info@palakkadheritagehotel.com', 'www.palakkadheritagehotel.com', 'Heritage Basic', 5),
(19, 'Somatheeram Ayurvedic Beach Resort (P) Ltd.', '\"P.O. ChowaraVia Balaramapuram, Thiruvananthapuram - 695501, KERALA\"', 'KERALA', 471, 471, 'mail@somatheeram.in', 'www.somatheeram.in', 'Heritage Basic', 42),
(20, 'The Hillway Heritage', '\"Opp. Police Station, State Highway - 1Kilimanoor P.O., Thiruvananthapuram - 695601, KERALA\"', 'KERALA', 2147483647, 0, 'mail@hillwayhotels.com', 'www.hillwayhotels.com', 'Heritage Basic', 6),
(21, 'Ahilya Fort ', '\"Ahilya Fort, Maheshwar, W Nimar , Bhopal , MADHYA PRADESH\"', 'MADHYA PRADESH', 2147483647, 0, 'info@ahilyafort.com', 'www.ahilyafort.com', 'Heritage Basic', 15),
(22, 'Hotel Rock End Manor ', '\"Pachmarhi Distt. ,HOSHANGABAD , MADHYA PRADESH\"', 'MADHYA PRADESH', 2147483647, 2147483647, 'info@mptourism.com', 'www.mptourism.com', 'Heritage Basic', 6),
(23, 'Satpura Retreat', '\"Pachmarhi, Dist. Hosangabad, MADHYA PRADESH\"', 'MADHYA PRADESH', 7578, 0, 'satpura@mptourism.com', 'www.mptourism.com', 'Heritage Basic', 6),
(24, 'Hotel Sheesh Mahal ', '\"MPSTDC, Orchha, Tikamgarh Dist. , MADHYA PRADESH\"', 'MADHYA PRADESH', 2147483647, 2147483647, 'info@mptourism.com', 'www.mptourism.com', 'Heritage Basic', 8),
(25, 'Jehan Numa Palace Hotel ', '\"157, SHAMLA HILL(M.P) , Bhopal , MADHYA PRADESH\"', 'MADHYA PRADESH', 755661100, 755661720, 'NA', 'www.hoteljehanumapalace.com', 'Heritage Basic', 98),
(26, 'LE DUPLEIX ', '\"(unit of auberge Heritage Hotels) 5, CASERNE STREET , Pondicherry, PONDICHERRY\"', 'PONDICHERRY', 2147483647, 2147483647, 'gmldp@sarovarhotels.com', 'NA', 'Heritage Basic', 21),
(27, 'Calve', '\"A Heritage HotelOld No. 36, New No. 44, Vysial Street, Puducherry - 605 001, PUDUCHERRY\"', '', 413, 413, 'whclve@gmail.com/calve@vsnl.net', 'www.calve.in', 'Heritage Basic', 11),
(28, 'Welcome Heritage, Khimsar Fort', '\"Khimsar, RAJASTHAN \"', 'RAJASTHAN ', 1585262345, 1585262228, 'reservation@khimsar.com', 'NA', 'Heritage Basic', 67),
(29, 'The Bagh ', '\"Agra Achnara Road Pucca Bagh Bharatpur, Bharatpur, RAJASTHAN \"', 'RAJASTHAN ', 1733253072, 1733253072, 'contact@thefortramgarh.com', 'NA', 'Heritage Basic', 29),
(30, 'Gajner Palace', '\"P.O. GajnerTehsil : Kolayat, Bikaner - 334001, RAJASTHAN\"', 'RAJASTHAN', 1534, 1534, 'egmnr@gajner.hrhindia.com', 'www.hrhindia.com', 'Heritage Basic', 45),
(31, 'The Laxmi Niwas Palace ', '\"(A Unit of Golden Triangle Fort and Palace Pvt. Ltd.) Dr. Karni Singhji Road ,Bikaner ,RAJASTHAN\"', 'RAJASTHAN', 2147483647, 2147483647, 'panjimin@bsnl.in', 'NA', 'Heritage Basic', 24),
(32, 'Chomu Palace', '\"Near Main ChomuBus Stand, Chomu - 303702, RAJASTHAN\"', 'RAJASTHAN ', 1423, 1423, 'gm@chomupalacehotel.com/info@chomupalacehotel.com', 'www.chomupalacehotel.com', 'Heritage Basic', 58),
(33, 'Bissau Palace ', '\"Outside Chandpole Gate , Jaipur, RAJASTHAN\"', 'RAJASTHAN ', 1412304371, 1412304628, 'bissau@sancharnet.in', 'www.bissaupalace.com', 'Heritage Basic', 50),
(34, 'Deogarh Resorts', '\"Deogarh MahalP.O. Deogarh Madariya, Distt. Rajsamand - 313331, RAJASTHAN\"', 'RAJASTHAN ', 2904, 2904, 'deogarh@datainfosys.net', 'www.deogarhmahal.com', 'Heritage Basic', 45),
(35, 'Shikarbadi Hotel', '\"Goverdhan Vilas, Udaipur - 313001, RAJASTHAN\"', 'RAJASTHAN ', 294, 294, 'shikarbadi@hrhhotels.com', 'www.hrhhotels.com', 'Heritage Basic', 25),
(36, 'Welcom Heritage - Koolwal Kothi', '\"House No. 40,Near Government Hospital RoadNawal Garh District, Jhunjhunu, RAJASTHAN\"', 'RAJASTHAN ', 1594, 1594, 'indralokhotels@hotmail.com/holidays@welcomheritagehotels.com', 'www.welcomheritagehotels.com', 'Heritage Basic', 10),
(37, 'Ajit Bhawan', '\"Near Circuit House, Jodhpur - 342 006, RAJASTHAN\"', 'RAJASTHAN ', 291, 291, 'reservations@ajitbhawan.com', 'www.ajitbhawan.com', 'Heritage Basic', 70),
(38, 'Hotel Samode Palace', '\"Village Samode, Dist. Jaipur - 303806, RAJASTHAN\"', 'RAJASTHAN', 1423, 1423, 'reservations@samode.com', 'www.samode.com', 'Heritage Basic', 43),
(39, 'Raj Niwas Palace', '\"National Highway-3, Dholpur - 328 001, RAJASTHAN\"', 'RAJASTHAN', 5642, 5642, 'info@dholpurpalace.com', 'www.dholpurpalace.com', 'Heritage Basic', 20),
(40, 'Hotel Castle Mandawa Pvt.Ltd.', '\"MandawaJhunjhunu District, Shekhawati - 333704, RAJASTHAN\"', 'RAJASTHAN', 141, 141, 'reservation@castlemandawa.com/castle@datainfosys.net', 'www.castlemandawa.com', 'Heritage Basic', 70),
(41, 'Rohet Garh', '\"Village P.O RohetDistt. Pali, Rajasthan, RAJASTHAN\"', 'RAJASTHAN', 2147483647, 2147483647, 'rohethouse@dataone.in', 'NA', 'Heritage Basic', 34),
(42, 'Lake Pichola Hotel', '\"Piplia Haveli, Out Side ChandpoleUdaipur, Rajasthan, Udaipur, RAJASTHAN\"', 'RAJASTHAN', 2147483647, 2147483647, 'maltidutta50@yahoo.com', 'NA', 'Heritage Basic', 32),
(43, 'The Ramgarh Lodge', '\"Ramgarh LakeJamwa Ramgarh, Jaipur - 303109, RAJASTHAN\"', 'RAJASTHAN', 1426, 1426, 'ramgarh.jaipur@tajhotels.com', 'NA', 'Heritage Basic', 14),
(44, 'Hotel Indra Villas ', '\"A unit of Desert Heritage Resorts Pvt. Ltd. Ward No.2, Village Alsisar , JHUNJHUNU , RAJASTHAN\"', 'RAJASTHAN', 1595275567, 1595275567, 'info@indravilasalsisar.com', 'NA', 'Heritage Basic', 43),
(45, 'Singhasan Haveli', '\"Goenka Chowk, Mandawa,Dist., JHUNJHUNU, RAJASTHAN\"', 'RAJASTHAN', 1126124069, 1126124073, 'info@singhasanhaveli.com', 'NA', 'Heritage Basic', 26),
(46, 'Fort Khejarla', '\"(Aunit of Bhandari Heritage Pvt. Ltd.)Village Khejarla, Via Bilara, Distt. Jodhpur - 342601, RAJASTHAN\"', 'RAJASTHAN', 2930, 2930, 'khejarlafort@gmail.com', 'www.jodhpurforkhejarla.com', 'Heritage Basic', 38),
(47, 'Sardargarh Heritage Hotel ', '\"Sardargarh Fort, Village-Lawa Sardargarh Sardargarh, Dist:-Rajsamand , Rajsamand , RAJASTHAN\"', 'RAJASTHAN', 1592223137, 1592223137, 'hotelmandawa@yahoo.co.in', 'NA', 'Heritage Basic', 24),
(48, 'The Sawai Madhopur Lodge', '\"Ranthambore National Park Road, Sawai Madhopur - 302 005, RAJASTHAN\"', 'RAJASTHAN', 7462, 7462, 'vivanta.sawaimadhopur@tajhotels.com', 'NA', 'Heritage Basic', 36),
(49, 'Karni Bhawan Palace ', '\"Gandhi Colony Bikaner ,Bikaner ,RAJASTHAN\"', 'RAJASTHAN', 1512524701, 1512522408, 'karnihotels@satam.net.in', 'NA', 'Heritage Basic', 12),
(50, 'Norkhill Hotel ', '\"Stadium Road, Gangtok , SIKKIM\"', 'SIKKIM', 2147483647, 2147483647, 'norkhill@elginhotels.com', 'www.elginhotels.com', 'Heritage Basic', 25),
(51, 'Visalam', '\"7/1/143 LOCAL FUND ROAD, KANADUKATHAN KARAIKUDI, TAMIL NADU, KARAIKUDI, TAMIL NADU\"', 'TAMIL NADU', 2147483647, 2147483647, 'visalam@cghearth.com', 'NA', 'Heritage Basic', 15),
(52, 'Hotel Fairhavens Holiday Home', '\"Adacent to Head Post Office Mallital, Nainital, UTTARAKHAND\"', 'UTTARAKHAND', 2147483647, 2147483647, 'fairhavens@rediffmail.com', 'NA', 'Heritage Basic', 30),
(53, 'The Naini Retreat', '\"Ayarapatta Sloppes, Nainital - 263001, UTTARAKHAND\"', 'UTTARAKHAND', 5942, 5942, 'info@leisurehotels.co.in/bookings@leisurehotels.in', 'NA', 'Heritage Basic', 32),
(54, 'The Elgin Hotel', '\"18, H.D. Lama Road, P.O. Darjeeling, WEST BENGAL\"', 'WEST BENGAL', 2147483647, 2147483647, 'reservation@elginhotels.com', 'NA', 'Heritage Basic', 20),
(55, 'Taj Falaknuma Palace ', '\"Engine Bowli, Falaknuma , Hyderabad, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'falaknuma.hyderabad@tajhotels.com', 'NA', '5 Star Deluxe', 60),
(56, 'ITC HOTEL KAKATIYA', '\"6-3-1187,BEGUMPETnull, Hyderabad, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 402340032, 2147483647, 'itckakatiya@itchotel.in', 'NA', '5 Star Deluxe', 188),
(57, 'Eros Hotel Managed by Hilton', '\"S-1American Plaza, International Trade Tower, Nehru Place, New Delhi - 110 019, DELHI\"', 'DELHI', 11, 11, 'nehruplace.reservations@hilton.com', 'www3.hilton.com', '5 Star Deluxe', 216),
(58, 'The Ashok', '\"50-BChanakyapuri, New Delhi - 110021, DELHI\"', 'DELHI', 11, 11, 'ashoknd@ndb.vsnl.net.in', 'www.theashok.com', '5 Star Deluxe', 550),
(59, 'Hotel Imperial', '\"Janpath, New Delhi - 110001, DELHI\"', 'DELHI', 11, 11, 'luxury@theimperialindia.com', 'www.theimperialindia.com', '5 Star Deluxe', 233),
(60, 'Hyatt Regency Delhi', '\"Bhikaji Cama Place, New Delhi - 110066, DELHI\"', 'DELHI', 11, 11, 'delhi.regency@hyatt.com', 'NA', '5 Star Deluxe', 508),
(61, 'ITC-The Maurya', '\"ITC LimitedDiplomatic Enclave, New Delhi - 110021, DELHI\"', 'DELHI', 11, 11, 'reservations.itcmaurya@itchotels.in', 'NA', '5 Star Deluxe', 440),
(62, 'Le Meridien Hotel', '\"8, Windsor Place Janpath, New Delhinull, New Delhi, DELHI\"', 'DELHI', 1123710101, 1123714545, 'info@lemeridien-newdelhi.com', 'NA', '5 Star Deluxe', 358),
(63, 'Taj Palace Hotel ', '\"Sardar Patel Marg , New Delhi ,DELHI\"', 'DELHI', 1126110202, 1126110808, 'palace.delhi@tajhotels.com', 'NA', '5 Star Deluxe', 409),
(64, 'The Lalit', '\"Barakhamba AvenueConnaught Place,New Delhi - 110001, DELHI\"', 'DELHI', 11, 11, 'newdelhi@thelalit.com', 'NA', '5 Star Deluxe', 457),
(65, 'The Oberoi -  New Delhi', '\"Dr. Zakir Hussain Marg, New Delhi - 110003,DELHI\"', 'DELHI', 11, 11, 'reservations@oberoigroup.com', 'NA', '5 Star Deluxe', 283),
(66, 'Aman, New Delhi', '\"Lodhi Road, New Delhi - 110003, DELHI\"', 'DELHI', 1143633333, 1143633335, 'amannewdelhi@amanresorts.com', 'NA', '5 Star Deluxe', 68),
(67, 'The Hotel Leela Palace Kempinski', '\"Diplomatic Enclave, New Delhi - 110023,DELHI, National Highway No. 8, New Delhi-110037, DELHI\"', 'DELHI', 11, 11, 'reservations.newdelhi@theleela.com', 'NA', '5 Star Deluxe', 260),
(68, 'Riviera De Goa Resort', '\"Shimer VaddoXimer, Arpora - 403 518, GOA\"', 'GOA', 832, 832, 'mail@rivieradegoaresorts.com', 'NA', '5 Star Deluxe', 104),
(69, 'Vivanta by Taj - Panaji', '\"Off. D.B. Bandodkar RoadSt. Inez, Panaji - 403001, GOA\"', 'GOA', 832, 832, 'vivanta.panaji@tajhotels.com', 'NA', '5 Star Deluxe', 172),
(70, 'Vivanta by Taj - Holiday', '\"(Earlier known as The Taj Holiday Village)Dando, Candolim, Bardez - 403 515, GOA\"', 'GOA', 832, 832, 'vivanta.holidayvillage@tajhotels.com', 'www.vivantabytaj.com', '5 Star Deluxe', 142),
(71, 'Bell Tower Resorts Pvt.Ltd. ', '\"Bell Tower Resorts Pvt.Ltd. (Retreat by Zuri) Pedda, Uttor Doxi, Varca Salcatte-Goa-403721 , Salcete , GOA\"', 'GOA', 2147483647, 2147483647, 'NA', 'NA', '5 Star Deluxe', 106),
(72, 'Hotel Ramada Caravela Beach Resort', '\"Varca Beach, Salcete - 403721, GOA\"', 'GOA', 832, 832, 'caravela.gr@advanihotels.com/reservations.gr@advanihotels.com', 'www.caravelabeachresort.com', '5 Star Deluxe', 200),
(73, 'Vivanta By Taj- Fort Aguada', '\"Sinquerim, Bardez - 403519, GOA \"', 'GOA', 832, 832, 'vivanta.fortaguada@tajhotels.com', 'www.vivantabytaj.com', '5 Star Deluxe', 145),
(74, 'Th Lalit Golf & Spa Resort Goa', '\"(Bharat Hotels Ltd.)Raj Baga,Canacona, GOA\"', 'GOA', 2147483647, 2147483647, 'goaresv@thelalit.com', 'NA', '5 Star Deluxe', 225),
(75, 'Resort Rio', '\"Resort Rio, Tambudki,Arpora, Bardez, GOA\"', 'GOA', 2147483647, 2147483647, 'gm@resortrio.com', 'NA', '5 Star Deluxe', 82),
(76, 'Hotel Cidade de Goa', '\"(Unit of Fomento Resorts & Hotels Ltd.), Vainguinim Beach - 403004, GOA\"', 'GOA', 2147483647, 2147483647, 'cidadedegoa@cidadedegoa.com', 'www.cidadedegoa.com', '5 Star Deluxe', 205),
(77, 'Majorda Beach Resort', '\"MajordaSalcette, Goa - 403713, GOA\"', 'GOA', 832, 832, 'acc@majordabeachresortgoa.com', 'www.majordabeachresort.com', '5 Star Deluxe', 120),
(78, 'The Leela Kempinski, Goa', '\"MoborCavelossim, Salcette - 403731, GOA\"', 'GOA', 2147483647, 2147483647, 'reservations.goa@theleela.com', 'www.theleela.com', '5 Star Deluxe', 186),
(79, 'Hotel Trident - Gurgaon', '\"Plot No. 443, Udyog ViharPhase - V, Gurgaon - 122016, HARYANA\"', 'HARYANA', 124, 124, 'reservations@tridenthotels.com', 'NA', '5 Star Deluxe', 136),
(80, 'The Leela Kempinski -  Gurgaon', '\"(Ambience Hotels & Resorts Ltd.) Village Nathupur, N.H.-8 Gurgaon, Gurgaon, HARYANA\"', 'HARYANA', 1244771234, 1244771235, 'reservations.gurgaon-delhi@theleela.com', 'NA', '5 Star Deluxe', 412),
(81, 'The Bristol Hotel', '\"Adjacent to DLFQutab Enclave Phase - 1, Gurgaon - 122002, HARYANA\"', 'HARYANA', 124, 124, 'contact@thebristolhotel.com', 'www.thebristolhotel.com', '5 Star Deluxe', 84),
(82, 'Wildflower Hall', '\"(Mashobara Resort Limited, A Unit of EIH Limited)Chharabra, Shimla - 171 012, HIMACHAL PRADESH\"', 'HIMACHAL PRADESH', 177, 177, 'reservations@oberoigroup.com', 'www.oberoihotels.com', '5 Star Deluxe', 85),
(83, 'Vivanta by Taj -  Whitefield', '\"ITBP Whitefield, Bangalore - 560066, KARNATAKA\"', 'KARNATAKA', 80, 80, 'vivanta.whitefield@tajhotels.com', 'NA', '5 Star Deluxe', 199),
(84, 'Hotel Golden Palms Hotel & Spa', '\"NO-31 & 32 GOLDEN PALMS AVENUE OFF TUMKUR ROAD BANGALORE,  KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'info@goldenpalmshotel.com', 'NA', '5 Star Deluxe', 170),
(85, 'ITC Hotel Windsor & Towers ', '\"WINDSOR SQUARE, 25 GOLF COURES ROAD, Bangalore , KARNATAKA\"', 'KARNATAKA', 802269898, 802264941, 'www.welcomgroup.com', 'NA', '5 Star Deluxe', 240),
(86, 'The Taj West End', '\"Race Course Road Bangalore, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'westend.bengalore@tajhotels.com', 'NA', '5 Star Deluxe', 117),
(87, 'Sheraton Banglore at Brigade Gateway', '\"26/1, Rajajinagar ExtensionDr. Rajkumar Road, Malleswaram West, Bangalore, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'diwaker.tyagi@shraton.com', 'www.brigadegroup.com', '5 Star Deluxe', 230),
(88, 'The Oberoi Bangalore', '\"39 Mahatma Gandhi RoadBanglore-560001, Bangalore, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'reservations@oberoiblr.com', 'NA', '5 Star Deluxe', 160),
(89, 'Vivanta by Taj -  Bangalore', '\"41/3M.G. Road, Bangalore - 560001, KARNATAKA\"', 'KARNATAKA', 806660, 806661, 'vivanta.mgroad@tajhotels.com', 'www.vivantabytaj.com', '5 Star Deluxe', 167),
(90, 'Park Plaza', '\"NO. 5 Defence Colony,1st main, Indirangar, KARNATAKA\"', 'KARNATAKA', 42197330, 2147483647, 'sonusarmag@gmail.com', 'NA', '5 Star Deluxe', 218),
(91, 'Dream Hotel Cochin', '\"37/985, C&D, Sahodaran Ayyappan Road Elamkulam Jnction, Kadavanthara cochin-682020, Cochin, KERALA\"', 'KERALA', 2147483647, 2147483647, 'reservations@dreamcochin.com', 'NA', '5 Star Deluxe', 150),
(92, 'Vivanta by Taj - Bekal ', '\"A Unit of Khanna Hotels PVt. LTd. BRDC Site No. 5, Kappil Beach P.O. Udma West Kasaragod - 671319, Kasaragod , KERALA\"', 'KERALA', 2147483647, 2147483647, 'tkhanna99@gmail.com', 'NA', '5 Star Deluxe', 73),
(93, 'The Lalit Resorts & Spa Bekal', '\"Bevoori, Udma, Taluka: Hosedurgh Distt: Kasargod Kerala, Kasaragod , KERALA\"', 'KERALA', 2147483647, 2147483647, 'resvbekal@thelalit.com', 'NA', '5 Star Deluxe', 39),
(94, 'Vivanta By Taj - Kovalam', '\"(Formerly known as Taj Green Cove Kovalam)G V Raja Vattappara Road, Kovalam, Thiruvananthapuram - 695 527, KERALA\"', 'KERALA', 471, 471, 'Vivanta.kovalam@tajhotels.com', 'www.vivantabytaj.com', '5 Star Deluxe', 59),
(95, 'Vivanta by - Taj Malabar ', '\"Willingdon Island , Cochin , KERALA\"', 'KERALA', 2147483647, 2147483647, 'malabar.cochin@tajhotels.com', 'NA', '5 Star Deluxe', 96),
(96, 'The Raviz Kollam', '\"Kollam Royal Park Hotel And Resorts P LtdMathilil, Kollam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'info@theraviz.com', 'www.theraviz.com', '5 Star Deluxe', 93),
(97, 'Kovalam Resort Private Limited', '\"The Leela Kovalam,Kerala, Thiruvananthapuram, KERALA\"', 'KERALA', 2147483647, 2147483647, 'reservations.kovalam@theleela.com', 'NA', '5 Star Deluxe', 127),
(98, 'The Grand Temple View ', '\"Opp. Circuit House , Khajuraho , MADHYA PRADESH\"', 'MADHYA PRADESH', 786272333, 786272123, 'khajraho@thegrandhotels.net', 'NA', '5 Star Deluxe', 47),
(99, 'Hotel Chandela', '\"Airport RoadDist. Chhatarpur, Khajuraho - 471606, MADHYA PRADESH\"', 'MADHYA PRADESH', 7686, 7686, 'chandela.khajuraho@tajhotels.com', 'NA', '5 Star Deluxe', 90),
(100, 'Chalet Hotel', '\"Plot no.39/1 6 to 15 Sector 30 AVashi Navi Mumbai, Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'reservations@fourpointsvashi.com', 'NA', '5 Star Deluxe', 118),
(101, 'Four Seasons Hotel', '\"(Unit of Mogus Estates & Hotels Ltd.) Plot NO.114,Dr.E.Moses Road Worli, Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'reservations.mumbai@fourseasons.com', 'NA', '5 Star Deluxe', 202),
(102, 'HOTEL SAHARA STAR ', '\"DOMESTIC AIRPORT, VILE PARLE (E), MUMBAI , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'www.saharastar.com', 'NA', '5 Star Deluxe', 210),
(103, 'Hyatt Regency Mumbai', '\"Sahar Airport RoadAndheri (East), Mumbai - 400 099, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'mumbai.regency@hyatt.com', 'www.mumbai.regency.hyatt.com', '5 Star Deluxe', 401),
(104, 'Le Royal Meridien ', '\"SAHAR AIRPORT ROAD ANDHERI (E) , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'lmmumbai@vsnl.com', 'NA', '5 Star Deluxe', 171),
(105, 'Sun-n-Sand Hotels Pvt. Ltd.', '\"39Juhu Beach, Mumbai - 400 049, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations@sunnsandhotel.com', 'www.sunnsandhotel.com', '5 Star Deluxe', 120),
(106, 'The Taj Mahal Palace & Tower ', '\"Apollo Bunder , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'tmhbc.bom@tajhotels.com', 'www.tajhotels.com', '5 Star Deluxe', 565),
(107, 'Hotel Le Meridien', '\"R.B.M. Road, Pune - 411001, MAHARASHTRA\"', 'MAHARASHTRA', 2026050505, 2026050506, 'lmpune@lemeridien-pune.com', 'www.lemeridien-pune.com', '5 Star Deluxe', 117),
(108, 'Hotel ITC Grand Central', '\"287, Babasaheb Ambedkar RoadParel,Mumbai-400012, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'itcgrandcentral@itchotels.in', 'NA', '5 Star Deluxe', 242),
(109, 'The Leela Kempinski', '\"Sahar, Mumbai - 400 059, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations.mumbai@theleela.com', 'www.theleela.com', '5 Star Deluxe', 393),
(110, 'The Oberoi, Mumbai', '\"Nariman Point, Mumbai - 400021, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations@oberoigroup.com', 'www.oberoihotels.com', '5 Star Deluxe', 287),
(111, 'The Westin Mumbai Garden City ', '\"Oberoi Garden City, International Business Park, Off Western Express Highway, Goregaon (East) , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'mumbaigardencity@westin.com', 'NA', '5 Star Deluxe', 269),
(112, 'Fariyas Resort, Lonavla', '\"Frichley HillsTungarli, Lonavla - 410401, MAHARASHTRA\"', 'MAHARASHTRA', 2114, 2114, 'fhrl@fariyas.com', 'www.fariyas.com', '5 Star Deluxe', 105),
(113, 'Trident, Nariman Point', '\"Nariman Point, Mumbai - 400 021, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations@tridenthotels.com', 'www.tridenthotels.com', '5 Star Deluxe', 550),
(114, 'Taj Lands End', '\"B.J. RoadBand Stand, Bandra (West), Mumbai - 400050, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'landsend.mumbai@tajhotels.com', 'www.tajhotels.com', '5 Star Deluxe', 493),
(115, 'Trident -  Bhubaneswar ', '\"CB - 1 Nayapalli, Bhubaneshwar , ORISSA\"', 'ORISSA', 2147483647, 2147483647, 'reservations@tridenthotels.com', 'NA', '5 Star Deluxe', 62),
(116, 'Hotel Mayfair Lagoon', '\"8-BJaydev Vihar, Bhubaneswar, ORISSA\"', 'ORISSA', 91, 91, 'lagoon@mayfairhotels.com', 'www.mayfairhotels.com', '5 Star Deluxe', 102),
(117, 'ISTA Amritsar', '\"G.T. Road(Adjoining Alpha One City Centre), Amritsar - 143 001, PUNJAB\"', 'PUNJAB', 183, 183, 'sales@istaamritsar.com/reservations.amritsar@istahotels.com', 'www.istahotels.com', '5 Star Deluxe', 248),
(118, 'Sheraton Rajputana Hotel', '\"Palace Road, Jaipur-302006, RAJASTHAN\"', 'RAJASTHAN', 1415100100, 1415102102, 'reservations.itcrajputana@itchotels.in', 'sheratonrajputana@itcwelcomgroup.in', '5 Star Deluxe', 218),
(119, 'The Oberoi Rajvilas', '\"Goner Road, Jaipur - 303012, RAJASTHAN\"', 'RAJASTHAN', 1412680101, 1412680202, 'reservations@oberoigroup.com', 'www.oberoihotels.com', '5 Star Deluxe', 71),
(120, 'The Oberoi Udaivilas ', '\"Haridas Ji Ki Magri , Udaipur , RAJASTHAN\"', 'RAJASTHAN', 2147483647, 2147483647, 'reservations@oberoigroup.com', 'NA', '5 Star Deluxe', 87),
(121, 'Country Inn & Suites By Carlson', '\"Country Inn & Suites By Carlson (A unit of Shivani Enclaves Pvt.,Khasa Kothi Circle M.I.Road, Jaipur, RAJASTHAN\"', 'RAJASTHAN', 2222686, 2222193, 'mail@goyalfashions.net', 'NA', '5 Star Deluxe', 100),
(122, 'The Leela Palace Kempinski', '\"P.O. Box No. 125Lake Pichola, Udaipur - 313 001, RAJASTHAN\"', 'RAJASTHAN', 294, 294, 'businesscentre@theleela.com', 'www.theleela.com', '5 Star Deluxe', 80),
(123, 'JAI MAHAL PALACE HOTEL', '\"JACOB ROAD,CIVIL LINES, Jaipur, RAJASTHAN\"', 'RAJASTHAN', 1416601111, 1416601057, 'jaimahal.jaipur@tajhotels.com', 'tajhotels.com', '5 Star Deluxe', 100),
(124, 'Mayfair Spa & Resort', '\"(Unit of Mayfair Hotels & Resorts (Sikkim) Pvt. Ltd.)Lower Samdur Block, Ranipool - 737135, Gangtok, SIKKIM\"', 'SIKKIM', 359, 359, 'gangtok@mayfairhotels.com', 'NA', '5 Star Deluxe', 63),
(125, 'Taj Mount Road', '\"No. 2Club House Road, Chennai - 600 002, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'clubhouse.chennai@tajhotels.com/mountroad.chennai@tajhotels.com', 'NA', '5 Star Deluxe', 220),
(126, 'THE PARK ', '\"UNIT :APEEJAY -SURRENDRA PARK HOTELS LTD 601, ANNA SALAI , Chennai, TAMIL NADU \"', 'TAMIL NADU', 2147483647, 2147483647, 'tpch@theparkhotels.com', 'NA', '5 Star Deluxe', 214),
(127, 'Vivanta by Taj - Fishermans Cove', '\"Covelong Beach, Kanchipuram Dist. - 603112, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'vivanta.fishcove@tajhotels.com', 'www.vivantabytaj.com', '5 Star Deluxe', 88),
(128, 'Taj Coromandel', '\"37Mahatma Gandhi Salai, Nungambakkam, Chennai - 600 034, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'coromandel.chennai@tajhotels.com', 'www.tajhotels.com', '5 Star Deluxe', 205),
(129, 'Le Royal Meridien Chennai', '\"(Owned by Appu Hotels Limited)No. 1, G.S.T. Road, St. Thomas Mount, Chennai - 600 016, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'reservation@leroyalmeridien-chennai.com', 'NA', '5 Star Deluxe', 240),
(130, 'ITC The Mughal', '\"Fatehabad RoadTajganj, Agra - 282 001, UTTAR PRADESH\"', 'UTTAR PRADESH', 562, 562, 'reservations.itcmughal@itchotels.in', 'www.itchotels.in', '5 Star Deluxe', 233),
(131, 'Jaypee Greens Golf & Spa Resort', '\"A division of Jaiprakash Associates Ltd. G-Block, Surajpur Kasna Road Gautam Budh Nagar, Greater Noida, UTTAR PRADESH\"', 'UTTAR PRADESH', 1206743000, 1202324720, 'reservation.jggr@jaypeehotels.com', 'NA', '5 Star Deluxe', 170),
(132, 'Vivanta by Taj ', '\"Vipin Khand Gomti Nagar , Lucknow , UTTAR PRADESH\"', 'UTTAR PRADESH', 522671100, 522671166, 'residency.lucknow@tajhotels.com', 'NA', '5 Star Deluxe', 110),
(133, 'Taj Ganges Varanasi', '\"Nadesar Palace GraoundsNadesar, Varanasi - 221002, UTTAR PRADESH\"', 'UTTAR PRADESH', 542, 542, 'ganges.varanasi@tajhotels.com', 'www.tajhotels.com', '5 Star Deluxe', 130),
(134, 'Radisson Hotel', '\"Taj East Gate Road, Agra - 282 001, UTTAR PRADESH\"', 'UTTAR PRADESH', 562, 562, 'reservations@rdagra.in', 'www.radisson.com', '5 Star Deluxe', 140),
(135, 'Radisson MBD Hotel', '\"Plot No. L-2Sector - 18, Noida - 201 301, UTTAR PRADESH\"', 'UTTAR PRADESH', 120, 120, 'reservations@radissonmbd.com', 'www.radissonblu.com', '5 Star Deluxe', 126),
(136, 'Holiday Regency', '\"Holiday Regency (A Unit of Omsons Holiday Inn Pvt. ltd)Om Enclave, (KM, Delhi Road , NH-24, Moradabad, UTTAR PRADESH\"', 'UTTAR PRADESH', 591301235, 2147483647, 'info@holidayregency.com', 'holidayregency.com', '5 Star Deluxe', 74),
(137, 'Jaypee Residency Manor', '\"Barlowganj, Mussoorie, UTTARAKHAND\"', 'UTTARAKHAND', 1352631800, 1352631022, 'jrm@jaypeehotels.com', 'NA', '5 Star Deluxe', 90),
(138, 'ITC Sonar', '\"1, JBS Haldane AvenueOpp. Science City, Kolkata-700046, WEST BENGAL\"', 'WEST BENGAL', 33, 33, 'reservations.itcsonar@itchotels.in', 'NA', '5 Star Deluxe', 239),
(139, 'Hotel Ista Hyderabad', '\"Plot No-7, Road No. 2I.T. Park, Nanakramguda, Gachibowali, Hyderabad - 500019, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 40, 40, 'sales@istahyderabad.com', 'www.anandaspa.com', '5 Star', 157),
(140, 'Hotel Novotel Hyderabad', '\"Novoel & HIVV Complex, Near Hitech City , P.O Bag No-1101, Cyberabad Post Office, Hyderabad, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'H6182-re@accor.com', 'NA', '5 Star', 288),
(141, 'Novotel Hyderabad Airport ', '\"GMR Hyderabad International Airport Ltd., Rajiv Gandhi International Airport Shamshabad, Ranga Reddy Dist , ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'reservations@novotelhyderabadairport.com', 'NA', '5 Star', 305),
(142, 'The Gateway Hotel ', '\"Beach Road, Visakhapatnam , ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'gateway.visakhapatnam@tajhotels.com', 'NA', '5 Star', 95),
(143, 'Taj Deccan - Hyderabad', '\"Road No.1Banjara Hills, Hyderabad - 34, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'tdhgm.hyd@tajhotels.com', 'NA', '5 Star', 151),
(144, 'Leo Meridian Infrastructure', '\"Bommaraspet (Village)Shamirpet Mandal, Ranga Reddy District, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'info@lmiphl.com', 'www.lmiphl.com', '5 Star', 88),
(145, 'Hotel Mountview', '\"Sector 10, Chandigarh, CHANDIGARH\"', 'CHANDIGARH', 1724671111, 1722742220, 'mountview@citcochandigarh.com', 'NA', '5 Star', 155),
(146, 'Hotel Crowne Plaza Today', '\"Plot No. 1Community Centre, Phase 1, Okhla, New Delhi - 110 020, DELHI\"', 'DELHI', 11, 11, 'reservations@cpokhla.com', 'www.crowneplaza.com', '5 Star', 208),
(147, 'Vivanta by Taj Ambassador', '\"Sujan Singh ParkCornwallis Road, New Delhi - 110003, DELHI\"', 'DELHI', 11, 11, 'vivanta.ambassador@tajhotels.com', 'www.vivantabytaj.com', '5 Star', 88),
(148, 'Fortune Select Regina ', '\"376, Off. Fort Aquada Road , Candolim , GOA\"', 'GOA', 2147483647, 0, 'velu@acronindia.com', '', '5 Star', 102),
(149, 'Bogmallo Beach Resort', '\"P.O. Bogmallo, Goa - 403806, GOA\"', 'GOA', 832, 832, 'bbrtwhl@sancharnet.in', 'www.bogmallobeachresort.com', '5 Star', 126),
(150, 'DEVAAYA AYURVEDA SPA RESORT ', '\"DIWAR, ILHAS ,GOA , GOA\"', 'GOA', 2147483647, 2147483647, 'www.alconvictorgroup.com', 'NA', '5 Star', 57),
(151, 'Holiday Inn Resort', '\"Mobor Beach Cavelossim Salcete,Goa, GOA\"', 'GOA', 2147483647, 2147483647, 'NA', 'NA', '5 Star', 203),
(152, 'The Crown Goa', '\"(A unit of Vision Enterprises) Bairo Alto Dos Pilotos, Goa, GOA\"', 'GOA', 2147483647, 2147483647, 'reservations@thecrowngoa.com', 'NA', '5 Star', 43),
(153, 'Hotel Neo Majestic', '\"Plot No. 104/1APorvorim, North Goa, GOA\"', 'GOA', 832, 832, 'neomajestic@neomajestic.com', 'www.neomajestic.com', '5 Star', 50),
(154, 'The Kenilworth Beach Resort & Spa', '\"Utorda, Salcete - 403 713, GOA\"', 'GOA', 832, 832, 'kenilworthgoa@kenilworthhotels.com', 'www.kenilworthhotels.com', '5 Star', 104),
(155, 'Hotel La Calypso Get Aways.', '\"Saunta Vaddo, Baga Calangute Road, Calanguta VPBardez Goa, GOA\"', 'GOA', 2147483647, 2147483647, 'reservations@lacalypsohotels.com', 'www.lacalypsohotels.com', '5 Star', 14),
(156, 'The \"O\"', '\"S. No. 114/1Next to Kingfisher Villa, Condolim, Bardez - 403515, GOA\"', 'GOA', 2147483647, 2147483647, 'info@ohotelsindia.com/res.goa@ohotelsindia.com', 'NA', '5 Star', 75),
(157, 'Sun-n-Sand Hotel', '\"Bairo Alto Dos PilotosJose Falcao Road, Panjim, GOA\"', 'GOA', 2147483647, 2147483647, 'resgoa@sunnsandhotel.com', 'NA', '5 Star', 43),
(158, 'The Imperial Palace ', '\"Dr Yagnik Road , Rajkot , GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'mail@hotelimperialpalace.biz', 'NA', '5 Star', 80),
(159, 'Le Meridien', '\"C/o. Associated Hotels Pvt. Ltd. Chand Suraj Estate Near Nehru Bridge, Khanpur, Ahmedabad, GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'gmoffice.ahmedabad@lemeridien.com', 'NA', '5 Star', 63),
(160, 'The Gateway Hotel Ummed', '\"International Airport CircleNext to Army Cantonment, Hansol, Ahmedabad - 382 475, GUJARAT\"', 'GUJARAT', 79, 79, 'gateway.ahmedabad@tajhotels.com', 'www.thegatewayhotels.com', '5 Star', 91),
(161, 'The Galaxy Hotel', '\"NH-8Sector-15, Part-II, Gurgaon - 122001, HARYANA\"', 'HARYANA', 124, 124, 'info@galaxyhotel.in', 'www.galaxyhotel.in', '5 Star', 80),
(162, 'THE CHANCERY PAVILION', '\"ELIXIR ENTERPRISES & HOTELS PVT LTD., NO-135, RESIDENCY ROAD, BANGALORE, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'gm@chanceryhotels.com', 'NA', '5 Star', 170),
(163, 'The Zuri - Whitefield', '\"Rajpalya Hoodi - RoadWhitefield, Bengaluru - 560048, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'reservations@zuribangalore.com', 'www.thezurihotels.com', '5 Star', 162),
(164, 'Fortune Park J. P. Palace', '\"No.-3 Abba RoadNazarabad Mohalla, Mysore, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'rahul.nama@fortunehotels.in', 'NA', '5 Star', 108),
(165, 'Hotel Le Meridien - Bangalore', '\"No. 28, Sankey RoadP.B. No. 174, Bangalore - 560052, KARNATAKA\"', 'KARNATAKA', 80, 80, 'reservations.bangalore@lemeridien.com/leme.bangalore@lemeridien.com', 'www.lemeridien-bangalore.com', '5 Star', 195),
(166, 'Movenpick Hotel & Spa Bangalore', '\"115 Pipeline Road near BEL CircleGokula Extension, Bangalore, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'hotel.bangalore@moevenpick.com', 'moevenpick-hotel.com', '5 Star', 262),
(167, 'Club Mahindra Lakeview', '\"Munner, Chinnakanal VillageVia: Suryanelli, Idukki District - 685618, KERALA\"', ' KERALA', 4868, 4868, 'gm.munnar@clubmahindra.com', 'www.clubmahindra.com', '5 Star', 38),
(168, 'The Quilon Beach Hotel', '\"Beach Kollam-691001, Kollam, KERALA\"', ' KERALA', 2147483647, 2147483647, 'crs@qresorts.in', 'NA', '5 Star', 95),
(169, 'The Elephant Court', '\"Off Kumily - Thekkady RoadThekkady P.O., Kumily - 685 536, Idukki District, KERALA\"', ' KERALA', 4869, 4869, 'info@theelephantcourt.com', 'www.theelephantcourt.com', '5 Star', 64),
(170, 'Turtle On The Beach', '\"VPI/43ITDC Road, Kovalam, Trivandrum - 685 527, KERALA\"', ' KERALA', 471, 471, 'info.turtle@thrhotels.com', 'www.turtleonthebeach.com', '5 Star', 44),
(171, 'Casino Hotel', '\"Willingdon Island, Cochin - 682 003, KERALA\"', ' KERALA', 484, 484, 'casinohotel@cghearth.com', 'www.cghearth.com', '5 Star', 67),
(172, 'Trident, Cochin', '\"Bristow RoadWillingdon Island, Cochin - 682003, KERALA\"', ' KERALA', 2147483647, 2147483647, 'reservations@tridenthotels.com', 'www.tridenthotels.com', '5 Star', 85),
(173, 'The Gateway Hotel -Ernakulam', '\"Marine DriveErnakulam, Kochi - 682 011, KERALA\"', ' KERALA', 484, 484, 'gateway.ernakulam@tajhotels.com', 'www.thegatewayhotels.com', '5 Star', 108),
(174, 'Kadavu Resort & Ayurveda Centre', '\"NH-17, Calicut Bye Pass Road, Azhijilam P.O., near Feroke CollegeCalicut - 673632, (A Division of Yenkay complex Pvt. Ltd.), KERALA\"', ' KERALA', 483, 483, 'info@kadavuresorts.com', 'www.kadavuresorts.com', '5 Star', 72),
(175, 'The Muthoot Plaza Hotel', '\"Punnen Road, Thiruvananthapuram - 695039, KERALA\"', ' KERALA', 471, 471, 'gmtmp@sarovarhotels.com', 'www.sarovarhotels.com', '5 Star', 57),
(176, 'Taj Residency - Trivandrum', '\"T.C. No. 24/1987 (2)C.V. Raman Pillai Road, Thyeaud, Thiruvananthapuram - 695014, KERALA\"', ' KERALA', 471, 471, 'taj.trivandrum@tajhotels.com', 'www.tajhotels.com', '5 Star', 137),
(177, 'Hotel Ramada -  Khajuraho', '\"(Owned By Jagdish Shanti Hotel Pvt. Ltd.)Airport Road, Khajuraho - 471606, MADHYA PRADESH\"', 'MADHYA PRADESH', 7686, 7686, 'reservations@ramadahotelkhajuraho.com', 'www.ramadahotelkhajuraho.com', '5 Star', 82),
(178, 'Radisson Jass Hotel', '\"By Pass RoadKhajuraho, Dist Chattarpur, MADHYA PRADESH\"', 'MADHYA PRADESH', 2147483647, 2147483647, 'reservations@radissionkhajuraho.com', 'www.radisson.com', '5 Star', 90),
(179, 'Grand Sarovar Premiere', '\"Junction of Veer Savarkar Flyover &S.V. Road, Goregaon (West)-400062, MAHARASHTRA\"', 'MAHARASHTRA', 224215, 222871, 'gm@grandsarovar.com/gsp@sarovarhotels.com', 'www.grandsarovar.com', '5 Star', 98),
(180, 'Hotel Meluha', '\"Building 7, Sector-V, Central Avenue Hiranandani Gardens Powai, Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'sam@meluhafernhotel.com', 'NA', '5 Star', 141),
(181, 'Hotel Tunga Regency Pvt.Ltd. ', '\"PLOT NO-37, SECTOR 30-A, VASHI , NAVI MUMBAI , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'www.tungahotels.com', 'NA', '5 Star', 92),
(182, 'Ramada Plaza Palm Grove', '\"Juhu Beach, Mumbai - 400049, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'palmgrove@krahejahospitality.com', 'www.ramadainternational.com', '5 Star', 115),
(183, 'The Shalimar Hotel ', '\"August Kranti Marg , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'theshalimarhotel@vsnl.com', 'www.theshalimarhotel.com', '5 Star', 65),
(184, 'THE PRIDE HOTEL ', '\"OPP. AIRPORT WARDHA ROAD , Nagpur , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'PRIDE_NGP@SANCHARNET.COM', 'WWW.PRIDEGROUP.NET', '5 Star', 93),
(185, 'Four Points By Sheraton', '\"S.No.197/3, Nagar Road,Viman Nagar, Pune, MAHARASHTRA\"', 'MAHARASHTRA', 2039406699, 2030930930, 'fo@punefourpoints.com', 'NA', '5 Star', 246),
(186, 'Taj Blue Diamond', '\"11Koregaon Road, Pune - 411001, MAHARASHTRA\"', 'MAHARASHTRA', 20, 20, 'sandip.mukherjee@tajhotels.com', 'www.tajhotels.com', '5 Star', 110),
(187, 'The O Hotel', '\"Survey No.371Final Plot No.293, Koregaon, Pune - 411001, MAHARASHTRA\"', 'MAHARASHTRA', 20, 20, 'info@ohotelsindia.com', 'www.ohotelsindia.com', '5 Star', 111),
(188, 'Taj Residency - Aurangabad', '\"8-N-12CIDCO RAUZA BAGH, Aurangabad, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'residency.aurangabad@tajhotels.com', 'NA', '5 Star', 64),
(189, 'Hotel Sea Princess ', '\"969 Juhu Beach , Mumbai , MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'seaprincess@vsnl.com', 'NA', '5 Star', 108),
(190, 'The Gateway Hotel', '\"P-17, MIDC Ambad MumbaiMumbai - Agra Road, Nashik, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'residency.nashik@tajhotels.com', 'tajhotels.com', '5 Star', 70),
(191, 'Hotel Parc Estique', '\"Viman NagarNagar Road, Pune - 411014, MAHARASHTRA\"', 'MAHARASHTRA', 2041004100, 2041004111, 'cmd@parcestique.com/info@parcestique.com', 'www.estiquehotels.com', '5 Star', 116),
(192, 'Radisson Windsor Hotel ', '\"Windsor Fountain G.T. Road, Near BMC Chowk , Jalandhar , PUNJAB\"', 'PUNJAB', 1814671234, 815082233, 'radjal@vsnl.com', 'NA', '5 Star', 62),
(193, 'Majestic Park Plaza ', '\"P.O. BOX NO 333 BHAI BALA CHOWK, FEROZEPUR ROAD. , Ludhiana , PUNJAB\"', 'PUNJAB', 1612773000, 1612771888, 'www.fhraI.com', 'NA', '5 Star', 117),
(194, 'Hotel Mansingh', '\"Sansar Chandra Road, Jaipur, RAJASTHAN\"', 'RAJASTHAN', 1412378771, 1412377582, 'sales.jpr@mansinghhotels.com', 'NA', '5 Star', 95),
(195, 'Hotel Trident, Jaipur', '\"Amber Fort RoadOpp. Jal Mahal, Jaipur, RAJASTHAN\"', 'RAJASTHAN', 141, 141, 'reservations@tridenthotels.com', 'www.tridenthotels.com', '5 Star', 134),
(196, 'Fortune Select Metropolitan - Jaipur', '\"Fortune Select Metropolitan, Nehru Sahkar Bhawan,C-Scheme, Bias Godam Circle, Jaipur, RAJASTHAN\"', 'RAJASTHAN', 2147483647, 2147483647, 'metropolitan@fortunehotels.in', 'NA', '5 Star', 90),
(197, 'Chokhi Dhani', '\"The Ethntic Village Resort12 Miles, Via Vatika, Tonk Road, Jaipur - 303905, RAJASTHAN\"', 'RAJASTHAN', 141, 141, 'resort@chokhidhani.com', 'www.chokhidhani.com', '5 Star', 97),
(198, 'Inder Residency', '\"(A Unit of Seasons Hotels Pvt. Ltd.)Goverdhan Vilas, Shikarbadi Road, Ekling Nagar, Udaipur - 313 001, RAJASTHAN\"', 'RAJASTHAN', 294, 294, 'seasonshotel@gmail.com', 'www.inderresidency.in', '5 Star', 144),
(199, 'Denzong Regency', '\"Cherry Banks,Development Area, Gangtok, SIKKIM\"', 'SIKKIM', 2147483647, 2147483647, 'welcomheritage_denzongregency@hotmail.com', 'denzongregency.com', '5 Star', 25),
(200, 'The Gateway Hotel Pasumalai Madurai', '\"(formerly known as Taj Garden Retreat Madurai)40 T.P.K. Road, Pasumalai, Madurai - 625 004, TAMIL NADU\"', 'TAMIL NADU', 452, 452, 'gateway.madurai@tajhotels.com', 'www.thegatewayhotels.com', '5 Star', 63),
(201, 'Radisson Hotel GRT', '\"G S T Road St Thomas Mount Chennai, Chennai, TAMIL NADU\"', 'TAMIL NADU', 2147483647, 2147483647, 'reservations@radissongrt.com', 'NA', '5 Star', 101),
(202, 'Trident - Chennai', '\"1/24, GST RoadMeenambakkam, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'reservations@tridenthotels.com', 'www.tridenthotels.com', '5 Star', 167),
(203, 'Hotel Clarks Shiraz', '\"54Taj Road, Agra - 282001, UTTAR PRADESH\"', 'UTTAR PRADESH', 562, 562, 'info@hotelclarksshiraz.com/resv@hotelclarks.in', 'www.hotelclarksshiraz.com', '5 Star', 237),
(204, 'Hotel Trident - Agra', '\"Fatehabad Road, Agra, UTTAR PRADESH\"', 'UTTAR PRADESH', 2147483647, 2147483647, 'reservations@tridenthotels.com', 'NA', '5 Star', 138),
(205, 'Country Inn & Suites by Carlson.', '\"64/6, Site - IVSahibabad, (Distt. Ghaziabad) - 201 010, UTTAR PRADESH\"', 'UTTAR PRADESH', 120, 120, 'info@cissahibabad.in', 'www.countryinns.com', '5 Star', 216),
(206, 'Radisson Hotel Varanasi', '\"The Mall Cantonment, Varanasi Uttar Pradesh, Varanasi, UTTAR PRADESH\"', 'UTTAR PRADESH', 2147483647, 2147483647, 'reservations@radissonvns.com', 'NA', '5 Star', 116),
(207, 'The Gateway Hotel, Agra', '\"Taj GanjFatehabad Road, Agra - 282001, UTTAR PRADESH\"', 'UTTAR PRADESH', 2147483647, 2147483647, 'tajview.agra@tajhotels.com/gateway.agra@tajhotels.com', 'www.tajhotels.com', '5 Star', 100),
(208, 'Hotel Hindusthan International', '\"235/1A.J.C. Bose Road, Kolkata - 700020, WEST BENGAL\"', 'WEST BENGAL', 33, 33, 'reservation@hindusthan.com', 'www.hhihotels.com', '5 Star', 184),
(209, 'Swissotel Kolkata Neotia Vista', '\"M/s Swissotel Kolkata Neotia Vista City Center New Town Action Area 2/DPlot No. 11/5 New Town Rajarhat, Kolkata, WEST BENGAL\"', 'WEST BENGAL', 2147483647, 0, 'subrata.sarkar@swissotel.com', 'www.swissotel.com', '5 Star', 147),
(210, 'The Golkonda', '\"(A Unit of Golkonda Hospitality Services & REsorts Ltd.) 10-1-124Masab Tank, Hyderabad, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 2147483647, 2147483647, 'gateway.mangalore@tajhotels.com', 'NA', '4 Star', 94),
(211, 'Palm Beach Hotel', '\"Beach Road, Visakhapatnam - 530 023, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 891, 891, 'info@palmbeachhotel.in', 'www.palmbeachhotel.in', '4 Star', 44),
(212, 'QUALITY INN DV MANOR', '\"40-1-47, M.G.ROADVENKATESHWARA PURAM, Vijayawada, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 866474455, 866483170, 'info@hoteldvmanor.com', 'NA', '4 Star', 115),
(213, 'Best Western Amrutha Castle', '\"5-9-16, SaifabadOpp. Secretariat, Hyderabad - 500063, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 40, 40, 'info@bestwesternamruthacastle.com', 'www.bestwesternamruthacastle.com', '4 Star', 90),
(214, 'Hotel Green Park', '\"(A Division of Diana Hotels Ltd.)7-1-26, Greenlands, Begumpet, Hyderabad - 500016, ANDHRA PRADESH\"', 'ANDHRA PRADESH', 40, 2147483647, 'hyd@hotelgreenpark.com', 'hotelgreenpark.com', '4 Star', 149),
(215, 'Hotel Raj Mahal', '\"A.T. RoadPaltan Bazar, Guwahati - 781001, ASSAM\"', 'ASSAM', 361, 361, 'info@hotelrajmahal.in/hotelrajmahal@vsnl.net', 'www.hotelrajmahal.in', '4 Star', 71),
(216, 'Hotel Natraj', '\"H.S. Road, Dibrugarh - 786001, ASSAM\"', 'ASSAM', 373, 373, 'hotelnatraj09@gmail.com', 'NA', '4 Star', 20),
(217, 'Hotel The Royal Plaza', '\"(A Unit of Hotel Queen Road Pvt. Ltd.)19, Ashoka Road, New Delhi-110001, DELHI\"', 'DELHI', 1143555555, 1143555556, 'reservations@hoteltheroyalplaza.com/info@hoteltheroyalplaza.com', 'www.hoteltheroyalplaza.com', '4 Star', 419),
(218, 'Hotel City Park', '\"3/4, K/P BLOCK PITAMPURA, New Delhi, DELHI\"', 'DELHI', 1125468230, 1127310110, 'hotelcitypark@vsnl.net', 'NA', '4 Star', 58),
(219, 'Hotel Diplomat', '\"9, Sardar Patel MargDiplomatic Enclave, New Delhi, DELHI\"', 'DELHI', 1123010204, 1123018605, '', 'NA', '4 Star', 25),
(220, 'Maidens Hotel', '\"7Sham Nath Marg, New Delhi - 110054, DELHI\"', 'DELHI', 11, 11, 'reservations@oberoigroup.com', 'www.maidenshotel.com', '4 Star', 55),
(221, 'The Connaught', '\"37Shaheed Bhagat Singh Marg, New Delhi - 110001, DELHI\"', 'DELHI', 11, 11, 'theconnaughtnewdelhi@yahoo.com', 'www.theconnaughtnewdelhi.com', '4 Star', 79),
(222, 'Hotel Vikram', '\"Ring Road, Lajpat Nagar, New Delhi, DELHI\"', 'DELHI', 1146515151, 1146515152, 'info@hotelvikram.com', 'NA', '4 Star', 68),
(223, 'Lazylagoon Sarovar Portico Suites', '\"(Unit of Aqua Resorts & Spa Pvt. Ltd.)Baga - Arpora, Bardez - 403518, GOA\"', 'GOA', 832, 832, 'gmgpo@sarovarhotels.com', 'www.sarovarhotels.com', '4 Star', 39),
(224, 'Sun Village Resort', '\"SaquawadiBaga-Arpora Bardez, GOA\"', 'GOA', 2147483647, 2147483647, 'sun-village@desouzahotels.com', 'NA', '4 Star', 135),
(225, 'WHISPERING PALMS BEACH RESORT', '\"SINQUERIM BEACH, WADDICANDOLIM, BARDEZ-GOA, GOA\"', 'GOA', 2147483647, 2147483647, 'info@whisperingpalms.com', 'NA', '4 Star', 197),
(226, 'The Metropole Hotel', '\"(Unit of Majestic Projects Pvt. Ltd.)Near R.T.O. Circle, Subhash Bridge Corner, Ahmedabad - 380027, \"', 'GUJARAT', 79, 79, 'info@themetropolehotel.co.in', 'www.themetropolehotel.co.in', '4 Star', 70),
(227, 'Hotel Fortune Palace', '\"Near Digjam CircleAirport Road, Jamnagar - 361 008, GUJARAT\"', 'GUJARAT', 288, 288, 'hotelfortunepalace@yahoo.com', 'www.hotelfortunepalace.in', '4 Star', 45),
(228, 'Fortune Inn Haveli', '\"Plot No. 235,Sector - 11, Gandhinagar, GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'haveli@fortunehotels.in', 'www.fortunehotels.in', '4 Star', 84),
(229, 'Hotel The Grand Bhagwati', '\"Opp. GurudwaraBodakdev, S.G. Highway, Ahmedabad - 380 054, GUJARAT\"', 'GUJARAT', 2147483647, 2147483647, 'info@thegrandbhagwati.com', 'www.thegrandbhagwati.com', '4 Star', 37),
(230, 'Optus Sarovar Premiere Hotel', '\"SCO 43-47Sector - 28, City Centre, Gurgaon - 122002, \"', 'HARYANA', 124, 124, 'spg@sarovarhotels.com', 'www.sarovarhotels.com', '4 Star', 80),
(231, 'Park Premier', '\"359-357Sector - 29, Gurgaon - 122 001, HARYANA\"', 'HARYANA', 124, 124, 'info@parkpremierhotels.com', 'www.parkpremierhotels.com', '4 Star', 94),
(232, 'The Bella Vista', '\"SM 8, City Centre,Sector 5, Panchkula, HARYANA\"', 'HARYANA', 1725064848, 1725023802, 'sales@bellavista.in', 'NA', '4 Star', 49),
(233, 'Fortune Select Global', '\"2nd Floor, Global ArcadeM.G. Road, Gurgaon, HARYANA\"', 'HARYANA', 124, 124, 'global@fortunehotels.in', 'www.fortunehotelsin', '4 Star', 83),
(234, 'Courtyard By Marriott', '\"Plot No. 27 BSector Road, Sushant Lok - 1, Sector - 27, Gurgaon - 122 002, HARYANA\"', 'HARYANA', 124, 124, 'www.courtyardmarriottgurgaon.com', 'NA', '4 Star', 198),
(235, 'Fortune Park J.P.Celestial', '\"No 5/43, Seshadri RoadNear Race Course Road, Bangalore-09, KARNATAKA\"', 'KARNATAKA', 2147483647, 2147483647, 'jpcelestial@fortunehotels.in', 'www.fortunehotels.in', '4 Star', 130),
(236, 'The Gatwway Hotel - Chikmagalur', '\"KM RoadJyothi Nagar, Chikmagalur - 577102, KARNATAKA\"', 'KARNATAKA', 8262, 8262, 'gateway.chikmagalur@tajhotels.com', 'www.thegatewayhotels.com', '4 Star', 29),
(237, 'Raj Residency', '\"Near New bus standAlamipally, Kanhangad, KERALA\"', 'KERALA', 2147483647, 2147483647, 'rajgrouphotels@gmail.com', 'rajgrouphotels.com', '4 Star', 198),
(238, 'Hotel Maurya Rajadhani', '\"Stat GL,Hospital Road Statue, Trivandrum, KERALA\"', 'KERALA', 2147483647, 2147483647, 'maurya@rajadhanihotels.com', 'NA', '4 Star', 39),
(239, 'Keys Hotels', '\"Sy. No. 2863/1Opp. Fire & Rescue Services Housing Board junction, Trivandrum, KERALA\"', 'KERALA', 2147483647, 2147483647, 'reservations.thiruvananthapuram@keyshotels.com', 'keyshotels.com', '4 Star', 101),
(240, 'Hotel Blue Nile', '\"S.N. Park Road, Kannur - 670 001, KERALA\"', 'KERALA', 497, 497, 'mail@hotelbluenile.com', 'www.hotelbluenile.com', '4 Star', 39),
(241, 'Hotel Amruthaa International', '\"No. CC 41/2884St. Benedict Road, Ernakulam, Kochi - 682 018, KERALA\"', 'KERALA', 484, 484, 'amruthaainternational@gmail.com', 'NA', '4 Star', 26),
(242, 'Fragrant Nature Retreat and Resort Pvt. Ltd.', '\"Building No. CPI/07-20A,Nedungolam P.O., Paravur, Kollam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'enquiries@fragrantnature.com', 'www.fragrantnature.com', '4 Star', 18),
(243, 'Hotel Presidency', '\"Paramara Road Ernakulam Town, Kochi, KERALA\"', 'KERALA', 2147483647, 2147483647, 'presid@vsnl.com', 'NA', '4 Star', 49),
(244, 'Hotel Raj Regency', '\"Chelakkara road,Pazhayannur, Thrissur, KERALA\"', 'KERALA', 2147483647, 2147483647, 'rajregencypnr@gmail.com', 'NA', '4 Star', 10),
(245, 'ATS Residency', '\"Yakkara Branch RoadNear D.P Office, Palakkad, KERALA\"', 'KERALA', 2147483647, 2147483647, 'info@atshotels.com', 'atsresidency.com', '4 Star', 20),
(246, 'The Royale Gardens', '\"Nangiarkulangara P.O.Haripad - Alleppey District, Kerala - 690513, KERALA\"', 'KERALA', 479, 479, 'info@theroyalegardens.com', 'www.theroyalegardens.com', '4 Star', 34),
(247, 'Hotel Srivatsa Regency', '\"Pittupeedika, Main Road,Koduvayur, Palakkad, KERALA\"', 'KERALA', 2147483647, 2147483647, 'hotelsrivatsaregency@gmail.com', 'www.hotelsrivatsaregency.com', '4 Star', 12),
(248, 'Hotel Hills Park', '\"Kumbazha Road,Pathanamthitta,District, Kerala, KERALA\"', 'KERALA', 2147483647, 0, 'hotelhillspark@gmail.com', 'NA', '4 Star', 15),
(249, 'Neelamabari Suite', '\"Villanchira,Thalakkodu P.O.Neriyamangalam, Ernakulam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'infor@neelabarisuite.com', 'neelabarisuite.com', '4 Star', 22),
(250, 'Excalibur Hotels & Resorts', '\"Carithas Junction,MC Road,Thellakon, Kottayam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'hotel.excalibur@gmail.com', 'www.excalibur.in', '4 Star', 20),
(251, 'Raj Residency', '\"Near New bus standAlamipally, Kanhangad, KERALA\"', 'KERALA', 2147483647, 2147483647, 'rajgrouphotels@gmail.com', 'rajgrouphotels.com', '4 Star', 198),
(252, 'Muthoot Cardamom County Resort', '\"Kumily (PO)Thekkady, Idukki (Dist.) - 685536, KERALA\"', 'KERALA', 4869, 4869, 'reservations@muthoothotels.com', 'www.raxacollective.com', '4 Star', 44),
(253, 'Hotel White Dammar International', '\"Pappanamcode, Trivandrum - 695 018, KERALA\"', 'KERALA', 2147483647, 2147483647, 'whitedammar@gmail.com', 'hotelwhitedammar@gmail.com', '4 Star', 12),
(254, 'Hotel SP Grand Days', '\"Panavila JnThycaud P.O., Thiruvananthapuram - 695014, KERALA\"', 'KERALA', 471, 471, 'mail@spgranddays.com', 'www.spgranddays.com', '4 Star', 69),
(255, 'Hotel Peninsula Park Residency', '\"Motel and Resorts Pvt. Ltd.Parakode, Adoor, Pathanamthitta Dist., KERALA\"', 'KERALA', 2147483647, 2147483647, 'parkresidency.park@gmail.com', 'NA', '4 Star', 20),
(256, 'Hotel Indraprastha', '\"Pattazhi P.O.Pathanapuram, Kollam Dist.-691522, KERALA\"', 'KERALA', 2147483647, 2147483647, 'indraprasthapattazhi@yahoo.com', 'NA', '4 Star', 14),
(257, 'Hotel Mangala Towers', '\"Paliyam RoadNear Bus Stand, Thrissur - 680001, KERALA\"', 'KERALA', 2147483647, 2147483647, 'mangalatowers@gmail.com', 'www.hotelmangalatowers.com', '4 Star', 24),
(258, 'Hotel Soorya Regency', '\"Calicut By-Pass RoadKavungal, Malappuram - 676505, KERALA\"', 'KERALA', 483, 483, 'sooryaregency@gmail.com', 'www.sooryaregency.com', '4 Star', 13);
INSERT INTO `hotels` (`id`, `name`, `address`, `state`, `phone`, `fax`, `email`, `website`, `type`, `rooms`) VALUES
(259, 'Hotel Moonlit Regency', '\"4, Lane JunctionVengallor Muvatupuzha Road, Thodupuzha Idukki District-685584, KERALA\"', 'KERALA', 4862, 4862, 'info@moonlitregency.com/hotelmoonlit@ymail.com', 'NA', '4 Star', 22),
(260, 'Hotel Sky Pearl', '\"Chovva, Kannur - 670006, KERALA\"', 'KERALA', 479, 479, 'hotelskypearl@gmail.com', 'NA', '4 Star', 28),
(261, 'The Royal Fort', '\"Hospital JunctionKundara P.O., Kollam Dist. - 691501, KERALA\"', 'KERALA', 474, 474, 'info@theroyalfort.com', 'www.theroyalfort.com', '4 Star', 12),
(262, 'Hotel Soorya Galaxy', '\"(A Unit of Sreebala Divelopers & Hotel Pvt. Ltd.)13/158 A, Calicut Road, Cheruvannur, P.O. Feroke, Calicut - 673731, KERALA\"', 'KERALA', 495, 495, 'sooryagalaxy@gmail.com', 'NA', '4 Star', 12),
(263, 'Cochin Seaport Hotel', '\"Thekken MalipuramVypin, Cochin - 682 508, KERALA\"', 'KERALA', 2147483647, 484, 'seaporthotels@gmail.com', 'www.cochinseaporthotel.com', '4 Star', 25),
(264, 'The Avenue Regent', '\"39/2026,M.G. Road, Kochi, KERALA\"', 'KERALA', 2147483647, 484237529, 'avenueregent@avenuehotels.in', 'NA', '4 Star', 55),
(265, 'Spice Village', '\"Thekkady - Kumily Road, Thekkady - 685536, KERALA\"', 'KERALA', 4869, 4869, 'spicevillage@cghearth.com', 'www.cghearth.com', '4 Star', 52),
(266, 'Hotel Midhila Regency', '\"Midhila Regncy Cherplassery Hotels Pvt.Ltd.Pattambi road, Cherpulassery Palakkad Dist., kerala, KERALA\"', 'KERALA', 0, 0, 'maltidutta50@yahoo.com', 'NA', '4 Star', 10),
(267, 'Hotel Soorya Swagat', '\"Pudussery EastPalakkad, Walayar, KERALA\"', 'KERALA', 2147483647, 2147483647, 'www.sooryaswagath.in', 'NA', '4 Star', 14),
(268, 'The Hotel Elegance', '\"Karuvanchal POThalimapram, Kannur, KERALA\"', 'KERALA', 2147483647, 460247400, 'maltidutta50@yahoo.com', 'NA', '4 Star', 13),
(269, 'K R Grand Residency', '\"Parayil Market RoadKunnamkulam, Thrissur, KERALA\"', 'KERALA', 2147483647, 0, 'maltidutta50@yahoo.com', 'NA', '4 Star', 14),
(270, 'Hotel Dona Castle', '\"(Unit of Sunny Jacob Builders & Developers Pvt. Ltd.)Kottamukku, Kollam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'donacastle@gmail.com', 'www.hoteldonacastle.com', '4 Star', 31),
(271, 'Hotel Fairmont', '\"S.H. Mount,M.C. Road, Kottayam, KERALA\"', 'KERALA', 2147483647, 2147483647, 'info@hotelfairmont.in', 'www.hotelfairmont.in', '4 Star', 30),
(272, 'Hotel Anandha Inn Pvt. Ltd.', '\"NO-154S.V PATEL ROAD, PONDICHERRY, KERALA\"', 'KERALA', 2147483647, 2147483647, 'checkin@anandhainn.com', 'www.anandhainn.com', '4 Star', 70),
(273, 'Niya Regency', '\"Elthuruth Junction,Chettupuzha P.O., Thrissur, KERALA\"', 'KERALA', 2147483647, 2147483647, 'niyaregency@gmail.com', 'www.niyaregency.com', '4 Star', 20),
(274, 'The South Park', '\"(Unit of Kerala Hotels Pvt. Ltd.)M.G. Road, Trivandrum - 695 034, KERALA\"', 'KERALA', 471, 471, 'reservations@thesouthpark.com', 'www.thesouthpark.com', '4 Star', 82),
(275, 'Uday Samudra Leisure Beach Hotel', '\"G.V.Raja Road,Samudra Beach Kovalam, Trivandrum, KERALA\"', 'KERALA', 1246563228, 1246563174, 'toshali@nde.vsnal.net.in', 'www.toshalinet.com', '4 Star', 50),
(276, 'SEASONS SERVICE APARTMENTS', '\"S. NO-128/2/3/6/7/2/2/128/A1,SANEWADI AUNDH, PUNE, Malad, MAHARASHTRA\"', 'MAHARASHTRA', 2040009999, 2040009888, 'info@seasonsaundh.com', 'NA', '4 Star', 46),
(277, 'HOTEL BAWA INTERNATIONAL', '\"NEHRU ROAD EXTN.NEAR DOMESTIC AIRPORT VILE PARLE (E), Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'mail.bawaintl@vsnl.com', 'NA', '4 Star', 76),
(278, 'Hotel Courtyard By Marriott', '\"International Airport,CTS No. 215, Andheri Kurla Road, Andheri (East), Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'reservations.mumbai@courtyard.com', 'NA', '4 Star', 282),
(279, 'Hotel Midtown Pritam', '\"DharamputraPritam Estate Dr.Ambedkar Road, Dadar T.T, Mumbai-400014, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations@pritamhotels.com', 'www.pritamhotels.com', '4 Star', 60),
(280, 'Hotel Trident', '\"C-56, G-Block,Bandra Kurla Complex, Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'reservations@tridenthotels.com', 'tridenthotels.com', '4 Star', 436),
(281, 'Hotel Tunga Regale', '\"Plot No. 31, Phase IIMIDC, Central Road, Andheri (East), Mumbai - 400093, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'regale@tungahotels.com', 'www.tungahotels.com', '4 Star', 54),
(282, 'Ramee Guestline Hotel', '\"Plot No. 3Kohinoor Road, Dadar (East), Mumbai - 400014, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'mumbai.dadar@rameeguestlinehotels.com', 'www.ramee-group.com', '4 Star', 58),
(283, 'K. Raheja Corp. Pvt. Ltd. \"The Resort\"', '\"11,Aksa Beach,Malad (West), Mumbai - 400 095, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'resv@theresortmumbai.com/the_resort@vsnl.com', 'NA', '4 Star', 94),
(284, 'Hotel Sagar Plaza', '\"1Bund Garden Road, Pune - 411001, MAHARASHTRA\"', 'MAHARASHTRA', 20, 20, 'reservations@hotelsagarplaza.com/info@hotelsagarplaza.com', 'www.hotelsagarplaza.com', '4 Star', 76),
(285, 'The Central Park Hotel', '\"Bund Garden RoadNear Council Hall, Pune - 411 001, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'reservations@thecentralparkhotel.com', 'www.thecentralparkhotel.com', '4 Star', 74),
(286, 'Holiday Inn Mumbai International Airport', '\"721/1,721/A,721/B of Mohali VillageAndhri Kurla Road, Sakinaka junction, Mumbai, MAHARASHTRA\"', 'MAHARASHTRA', 2147483647, 2147483647, 'maltidutta50@yahoo.com', 'NA', '4 Star', 225),
(287, 'The Emerald', '\"(Hotel & Executive Apartment)Mumbai Next to Juhu Tara Road, Opp. Hotel Sea Princess, B.R. Chopra\'s Bungalow, Santacruz (West), Mumbai-400049, MAHARASHTRA\"', 'MAHARASHTRA', 22, 22, 'info@theemerald.com', 'www.theemerald.com', '4 Star', 56),
(288, 'Hotel Polo Tower', '\"Oakland RoadPolo Grounds, Shillong - 793001, MEGHALAYA\"', 'MEGHALAYA', 364, 364, 'hptfo@rediffmail.com', 'www.hotelpolotowers.com', '4 Star', 50),
(289, 'M.K.HOTEL', '\"DISTRICT SHOPPING CENTRE,RANJIT AVENUE, Amritsar, PUNJAB\"', 'PUNJAB', 1832504610, 1832507910, 'MKHOTEL123@SANCHARNET.IN', 'www.mkhotel.com', '4 Star', 75),
(290, 'THE MAYA HOTEL (Maya Inns Ltd.)', '\"JALANDHAR CITYEH-178,CIVIL LINES,NEAR BMC CROSSIN, JALANDHAR CITY-144001, PUNJAB\"', 'PUNJAB', 181, 1812452301, 'mayajal@mayahotels.in', 'http://www.mayahotels.in', '4 Star', 53),
(291, 'Hotel Ritz Plaza', '\"45The Mall, Amritsar - 143001, PUNJAB\"', 'PUNJAB', 183, 183, 'ritzhotel@vsnl.com/info@ritzhotel.in', 'www.titzhotel.in', '4 Star', 41),
(292, 'Country In & Suites, Ajmer', '\"Ansal\'s Sushant City, Village Gegalkishangarh-Ajmer Road, Ajmer, RAJASTHAN\"', 'RAJASTHAN', 1456623456, 1456623466, 'maltidutta50@yahoo.com', 'NA', '4 Star', 71),
(293, 'The Royal Plaza', '\"Shyari - GangtokEast sikkim, Gangtok -737102, SIKKIM\"', 'SIKKIM', 3592, 3592, 'trp@sarovarhotels.com', 'www.theroyalplazahotel.com', '4 Star', 58),
(294, 'The Residency Towers', '\"Sir Thyagaraya RoadT. Nagar, Chennai - 600 017, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'restowers@vsnl.net', 'www.theresidency.com', '4 Star', 174),
(295, 'Hotel Sangam ', '\"Collectors Office Road , Tiruchirapalli , TAMIL NADU\"', 'TAMIL NADU', 2147483647, 431241779, 'hotelsangam@vsnl.com', 'www.hotelsangam.com', '4 Star', 76),
(296, 'Quality Inn Sabari', '\"29,Thirumalai Pillai RoadT. Nagar, Chennai, TAMIL NADU\"', 'TAMIL NADU', 2147483647, 2147483647, 'sabariinn@sabarihotels.com', 'NA', '4 Star', 72),
(297, 'The Savera Hotel', '\"No. 146, Dr. Radhakrishnan SalaiMylapore, Chennai - 600 004, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'hotsave@md2.vsnl.net.in', 'www.saverahotel.com', '4 Star', 230),
(298, 'Hotel Raj Park (P) Ltd.', '\"180, T.T.K. Road Alwarpet,Chennai - 600018, TAMIL NADU\"', 'TAMIL NADU', 44, 44, 'reservation@rajparkchennai.com', 'www.rajpark.com', '4 Star', 89),
(299, 'Fortune Inn Grazia', '\"(Unit of Angel Baby Products Pvt. Ltd) Plot NO.1 A, Block - 1Sector - 27 Noida, UTTAR PRADESH\"', 'UTTAR PRADESH', 1203988444, 1203380144, 'gm.roc.nm@royalorchidhotels.com', 'royalorchidhotels.com', '4 Star', 42),
(300, 'Country Inn & Suites by Carlson - Haridwar', '\"( Unit of Sens Udyog Pvt. Ltd.)Haripurkalan, Raiwala, Motichur, Haridwar - Rishikesh Highway, Haridwar, Dist. Dehradun - 249205, UTTARAKHAND\"', 'UTTARAKHAND', 135, 135, 'reservations@cisharidwar.com', 'NA', '4 Star', 56),
(301, 'The Peerless Inn', '\"12J. L. Nehru Road, Kolkata - 700 013, WEST BENGAL\"', 'WEST BENGAL', 33, 33, 'pik@sarovarhotels.com', 'www.peerlesshotels.com', '4 Star', 122);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

CREATE TABLE `rooms` (
  `hotel_id` int(5) NOT NULL,
  `room_id` int(5) NOT NULL,
  `type` varchar(10) NOT NULL,
  `date_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `last_name`, `address`) VALUES
(7, 'Jose2', 'josemklegustala', 'Jose', 'mk', 'casadejose'),
(8, 'Jose2', 'josemklegustala', 'Jose', 'mk', 'casadejose'),
(9, 'Jose2', 'josemklegustala', 'Jose', 'mk', 'casadejose'),
(10, 'Jose2', 'josemklegustala', 'Jose', 'mk', 'casadejose');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`date_id`);

--
-- Indices de la tabla `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `date`
--
ALTER TABLE `date`
  MODIFY `date_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT de la tabla `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
