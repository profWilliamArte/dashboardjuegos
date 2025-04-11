-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-11-2024 a las 14:19:32
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `playlist2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `idtipousuario` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `idestatus`, `idtipousuario`, `nombre`, `correo`, `clave`, `fecha`) VALUES
(1, 1, 3, 'Flor 3', 'flor@gmail.com', 'Flor', '2024-11-12'),
(2, 1, 2, 'Teresa', 'correo@gmail.com', '2', '2024-10-30'),
(3, 1, 2, 'Margarita', 'correo@gmail.com', '3', '2024-10-30'),
(4, 1, 1, 'William Arteaga', 'correo@gmail.com', 'williamarte', '2024-11-12'),
(5, 1, 2, 'Donald', 'correo@gmail.com', '5', '2024-10-30'),
(6, 1, 2, 'Angela', 'correo@gmail.com', '6', '2024-10-30'),
(7, 1, 2, 'Monica', 'correo@gmail.com', '7', '2024-10-30'),
(8, 1, 2, 'Maria', 'correo@gmail.com', '8', '2024-10-30'),
(9, 1, 2, 'Kenji', 'correo@gmail.com', '9', '2024-10-30'),
(10, 1, 2, 'Emi', 'correo@gmail.com', '10', '2024-10-30'),
(11, 1, 2, 'Jessica', 'correo@gmail.com', '11', '2024-10-30'),
(12, 1, 2, 'Nahomi', 'correo@gmail.com', '12', '2024-10-30'),
(13, 1, 2, 'Johana', 'correo@gmail.com', '13', '2024-10-30'),
(14, 1, 2, 'Nidia', 'correo@gmail.com', '14', '2024-10-30'),
(15, 1, 2, 'Zoraida', 'correo@gmail.com', '15', '2024-10-30'),
(16, 1, 2, 'Luisda', 'correo@gmail.com', '16', '2024-10-30'),
(17, 1, 2, 'Willson', 'correo@gmail.com', '17', '2024-10-30'),
(18, 1, 2, 'Willy', 'correo@gmail.com', '18', '2024-10-30'),
(19, 1, 2, 'Neylu', 'correo@gmail.com', '19', '2024-10-30'),
(20, 1, 2, 'Reynaldo Rivas', 'correo@gmail.com', '20', '2024-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `id` int NOT NULL,
  `idautor` int DEFAULT NULL,
  `idgenero` int DEFAULT NULL,
  `interprete` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `coverImage` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `duration` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`id`, `idautor`, `idgenero`, `interprete`, `titulo`, `url`, `coverImage`, `duration`) VALUES
(1, 1, 10, 'Andrea Bocelli', 'Vivo por ella', 'https://www.youtube.com/watch?v=m5UcZ9thgPI', 'https://i.ytimg.com/vi/m5UcZ9thgPI/hqdefault.jpg', 255600),
(2, 1, 1, 'Tom Jones', 'Delilah on The Ed Sullivan Show', 'https://www.youtube.com/watch?v=m_ofAZVXw_E', 'https://i.ytimg.com/vi/MIIU9xkGAMs/maxresdefault.jpg', 188400),
(3, 1, 1, 'Jay & The Americans', 'Cara Mia', 'https://www.youtube.com/watch?v=0Jm4p_HCwKA', 'https://img.discogs.com/ms5qIVQTb2WsFPDOWVCUS28O1ts=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-6968958-1430651114-9650.jpeg.jpg', 137400),
(4, 1, 9, 'The Mamas & the Papas', 'California Dreamin', 'https://www.youtube.com/watch?v=YsGIFm03fFo', 'https://img.discogs.com/fa-Ub71c8LS1aWhPQeANIFq1_IM=/fit-in/600x590/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2771067-1300311817.jpeg.jpg', 146400),
(5, 2, 10, 'Marco Antonio Solís', 'Si No Te Hubieras Ido', 'https://www.youtube.com/watch?v=2PeNDt3bZmI', 'https://i.ytimg.com/vi/gH8oCh1nn88/maxresdefault.jpg', 382200),
(6, 2, 10, 'Cristian Castro', 'Cristian Castro Mix', 'https://www.youtube.com/watch?v=i3RgXh2sgVk', 'https://i.ytimg.com/vi/9Aqzo79zsUY/maxresdefault.jpg', 1620000),
(7, 2, 10, 'Guillermo Davila & Kiara', 'Tesoro Mio', 'https://www.youtube.com/watch?v=Y_TaNoGQG7g', 'https://i.ytimg.com/vi/Obb_feODleI/maxresdefault.jpg', 199800),
(8, 2, 9, 'Millie', 'De Hoy En Adelante', 'https://www.youtube.com/watch?v=xHkIUl-skOc', 'https://i.ytimg.com/vi/xChQXtk7GrI/hqdefault.jpg', 248400),
(9, 2, 10, 'HAASH & Primera Fila', 'Te Dejo en Libertad', 'https://www.youtube.com/watch?v=WHMV9nyUisA', 'https://i.ytimg.com/vi/WHMV9nyUisA/maxresdefault.jpg', 246000),
(10, 2, 10, 'Arthur Hanlon & HAASH', 'Lo Aprendí de Ti', 'https://www.youtube.com/watch?v=jko-2WoLKq8', 'https://i.ytimg.com/vi/D3UvkIScauU/maxresdefault.jpg', 205200),
(11, 2, 10, 'Thalía', 'Tómame O Déjame Habítame Siempre', 'https://www.youtube.com/watch?v=TDnSxbaJ48I', 'https://i.ytimg.com/vi/1GWpqrv5C5g/maxresdefault.jpg', 255000),
(12, 3, 2, 'The Beatles', 'Oh Darling', 'https://www.youtube.com/watch?v=2ecBCpfgH_E', 'https://i.ytimg.com/vi/Cxf8UX5aDfc/maxresdefault.jpg', 196200),
(13, 3, 1, 'George Harrison', 'My Sweet Lord', 'https://www.youtube.com/watch?v=SP9wms6oEMo', 'https://progrography.com/wp-content/uploads/2018/09/mysweetlord.jpg', 253800),
(14, 3, 9, 'Turley Richards', 'Heard the Voice of Jesus', 'https://www.youtube.com/watch?v=GSVWrvQ8exI', 'https://i.ytimg.com/vi/46Ujrlm4EWQ/hqdefault.jpg', 390000),
(15, 3, 1, 'Michael Jackson', 'Maria (You Were The Only One)', 'https://www.youtube.com/watch?v=Xt_GrBM6cGU', 'https://img.discogs.com/nL9ryI6XmeJLAcRE9NLvdnC3ZoE=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-5478174-1394387755-2361.jpeg.jpg', 207000),
(16, 3, 2, 'Elvis Presley', 'Jailhouse Rock', 'https://www.youtube.com/watch?v=gj0Rz-uP4Mk', 'https://images-na.ssl-images-amazon.com/images/I/619w+WxNtYL._SL1200_.jpg', 145800),
(17, 3, 3, 'Oscar D\'León', 'El Baile Del Suavito', 'https://www.youtube.com/watch?v=GtpXLVhGOmw', 'https://i.ytimg.com/vi/Y3zjIRitufY/maxresdefault.jpg', 309000),
(18, 3, 3, 'Bobby Cruz', 'Jala Jala', 'https://www.youtube.com/watch?v=wZqa_jYCxi0', 'https://3.bp.blogspot.com/-9YWw-KFiMOg/Wp7UeOIXb_I/AAAAAAAAI8s/DhJtgxXuImAFsyVapLn3_8A8sd6Zgq7MQCLcBGAs/s1600/Frontal.jpg', 305400),
(19, 3, 1, 'Gianni Morandi', 'Occhi di ragazza', 'https://www.youtube.com/watch?v=wE6ztdkadng', 'http://ring.cdandlp.com/paskale/photo_grande/114873821.jpg', 151200),
(20, 3, 9, 'Edith Piaf', 'Non Je ne regrette rien', 'https://www.youtube.com/watch?v=rzy2wZSg5ZM', 'https://images-na.ssl-images-amazon.com/images/I/71SdrSZd5wL._SL1200_.jpg', 133200),
(21, 3, 1, 'Gigliola Cinquetti', 'Dio Come Ti Amo', 'https://www.youtube.com/watch?v=AaKhIY6jPPk', 'https://img.discogs.com/SbwxsgewyVLCMjgDwFTTjiAURpA=/fit-in/489x500/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-3171065-1318977134-1318977134.jpeg.jpg', 187800),
(22, 3, 4, 'Dread Mar I', 'Tu Sin Mi', 'https://www.youtube.com/watch?v=aQo2HWqF1Vs', 'http://i.ytimg.com/vi/a5fHoAx12DY/maxresdefault.jpg', 247800),
(23, 4, 6, 'MERENGUE ÉXITOS MIX', 'PROYECTO UNO ILEGALES CALLE CIEGA SANDY PAPO', 'https://music.youtube.com/watch?v=GQIec4MEoqI', 'https://i.ytimg.com/vi/GQIec4MEoqI/maxresdefault.jpg', 3600000),
(24, 4, 6, 'MERENGUE DOMINICANO', 'MERENGUE RÁPIDO PARA BAILAR SIN PARAR', 'https://www.youtube.com/watch?v=SvS3u5KHBz4', 'https://i.ytimg.com/vi/SvS3u5KHBz4/maxresdefault.jpg', 2400000),
(25, 4, 3, 'SALSA ERÓTICA', 'LAS 40 MÁS ESCUCHADAS', 'https://www.youtube.com/watch?v=iEP7VOQB-BE', 'https://i.ytimg.com/vi/iEP7VOQB-BE/maxresdefault.jpg', 3060000),
(27, 4, 4, 'CHANGA VIEJA MIX', 'CHANGA DEL PASADO PARA BAILAR', 'https://www.youtube.com/watch?v=JCGCNhGelaA', 'https://i.ytimg.com/vi/JCGCNhGelaA/maxresdefault.jpg', 3300000),
(29, 8, 2, 'Queen', 'Best Songs Of All Time', 'https://www.youtube.com/watch?v=P5aCBIY3ZeA&ab_channel=ClassicRockSongs', 'https://i.ytimg.com/vi/NdosTTS24Fo/maxresdefault.jpg', 7200000),
(30, 8, 2, 'Sting And Shaggy w', 'NPR Music Tiny Desk Concert', 'https://www.youtube.com/watch?v=bdneye4pzMw&ab_channel=NPRMusic', 'https://i.ytimg.com/vi/bdneye4pzMw/maxresdefault.jpg', 900000),
(31, 8, 2, 'Dua Lipa', 'Tiny Desk (Home) Concert', 'https://www.npr.org/2020/12/04/942186930/dua-lipa-tiny-desk-home-concert', 'https://i.ytimg.com/vi/Qz7gqzOcPUw/maxresdefault.jpg', 960000),
(32, 5, 9, 'Simon Garfunkel', 'The Sound of Silence', 'https://www.youtube.com/watch?v=6ukmjBSQY-c', 'https://i.ytimg.com/vi/6ukmjBSQY-c/maxresdefault.jpg', 214800),
(33, 5, 1, 'Lady Gaga & Bradley Cooper', 'Shallow from A Star Is Born', 'https://music.youtube.com/watch?v=bo_efYhYU2A', 'https://i.ytimg.com/vi/bo_efYhYU2A/maxresdefault.jpg', 201600),
(34, 5, 11, 'Un Solo Pueblo 1986', 'Woman Del Callao', 'https://www.youtube.com/watch?v=1brkXsph10w', 'https://i.ytimg.com/vi/A3yR5fxiIoM/hqdefault.jpg', 208200),
(35, 5, 11, 'Grupo Daiquiri', 'Chamo Candela', 'https://www.youtube.com/watch?v=TcOBAwydS9Q', 'https://i.ytimg.com/vi/TcOBAwydS9Q/maxresdefault.jpg', 208200),
(36, 5, 6, 'Chichi Peralta', 'Procura', 'https://www.youtube.com/watch?v=BgwO5u-h41w', 'https://i.ytimg.com/vi/S3UJlpsXbQc/maxresdefault.jpg', 260400),
(37, 5, 6, 'Sergio Vargas', 'La Quiero a Morir', 'https://www.youtube.com/watch?v=6OduTWB0mI4', 'https://i.ytimg.com/vi/T2IjUlrxemE/maxresdefault.jpg', 303600),
(38, 5, 2, 'Maná', 'En El Muelle De San Blás', 'https://www.youtube.com/watch?v=teprNzF6J1I', 'https://i.ytimg.com/vi/teprNzF6J1I/hqdefault.jpg', 331200),
(39, 5, 6, 'Roberto Antonio', 'Noches de Fantasía', 'https://www.youtube.com/watch?v=WVUluqnII5E', 'https://i.ytimg.com/vi/r5KtrGy-V_M/maxresdefault.jpg', 212400),
(40, 5, 12, 'Pedro Capó & Farruko', 'Calma', 'https://www.youtube.com/watch?v=86kKFYmAMxA', 'https://static.billboard.com/files/media/Pedro-Capo-Farruko-Calma-2019-billboard-1548-compressed.jpg', 212400),
(41, 6, 9, 'Lionel Richie', 'Stuck On You', 'https://www.youtube.com/watch?v=8K-bHm5jI6U', 'https://img.discogs.com/orZ5V-oRY_0d9cSy0iRyrb_ohLQ=/fit-in/600x646/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-5684413-1539528232-9057.jpeg.jpg', 187200),
(42, 6, 9, 'Lionel Richie', 'Say You Say Me', 'https://www.youtube.com/watch?v=GFu03UMc0Rk', 'https://img.discogs.com/Q-JjvjUDuRTAUsgUYTJBZU72k0U=/fit-in/600x598/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1203727-1318903810.jpeg.jpg', 240600),
(43, 7, 1, 'Carlos Rivera Raphael', 'Estar Enamorado', 'https://www.youtube.com/watch?v=RvL3SWD9ak0', 'https://img.youtube.com/vi/RvL3SWD9ak0/hqdefault.jpg', 266400),
(44, 7, 3, 'Willie Colón', 'Gitana', 'https://www.youtube.com/watch?v=CoWfU6C9tnY', 'https://img.youtube.com/vi/CoWfU6C9tnY/hqdefault.jpg', 427800),
(45, 7, 1, 'Miriam y Las Chicas', 'La Loba', 'https://www.youtube.com/watch?v=yCRemlLy2Do', 'https://img.youtube.com/vi/yCRemlLy2Do/hqdefault.jpg', 210000),
(46, 7, 4, 'Dread', 'Así Fue', 'https://www.youtube.com/watch?v=csx53ZqoQqI', 'https://img.youtube.com/vi/csx53ZqoQqI/hqdefault.jpg', 480000),
(47, 7, 1, 'Servando y Florentino', 'Rumba en mi Corazón', 'https://www.youtube.com/watch?v=SjsIaIT51FA', 'https://img.youtube.com/vi/SjsIaIT51FA/hqdefault.jpg', 247200),
(48, 7, 1, 'Kalimba', 'Si Me Dejas Ahora', 'https://www.youtube.com/watch?v=wbEQF94wENk', 'https://i.ytimg.com/vi/wbEQF94wENk/hqdefault.jpg', 260400),
(49, 7, 1, 'Mijares feat Lucero', 'El Privilegio de Amar', 'https://www.youtube.com/watch?v=zHSaj7KSZ5s', 'https://i.ytimg.com/vi/zHSaj7KSZ5s/hqdefault.jpg', 272400),
(50, 7, 1, 'Yuridia Primera Fila', 'Ya Te Olvidé', 'https://www.youtube.com/watch?v=S1eERLOZ2rw', 'https://i.ytimg.com/vi/S1eERLOZ2rw/hqdefault.jpg', 201600),
(51, 9, 2, 'No Doubt', 'Don\'t Speak', 'https://www.youtube.com/watch?v=NrmVkLNG6uA', 'https://i.ytimg.com/vi/NrmVkLNG6uA/hqdefault.jpg', 258600),
(52, 9, 2, '4 Non Blondes', 'What\'s Up', 'https://www.youtube.com/watch?v=iZb1xalWidQ', 'https://i.ytimg.com/vi/iZb1xalWidQ/hqdefault.jpg', 271200),
(53, 9, 2, 'Red Hot Chili Peppers', 'Scar Tissue', 'https://www.youtube.com/watch?v=mzJj5-lubeM', 'https://i.ytimg.com/vi/mzJj5-lubeM/hqdefault.jpg', 204000),
(54, 9, 2, 'Nirvana', 'Come As You Are', 'https://www.youtube.com/watch?v=lL2SFvHy_m4', 'https://i.ytimg.com/vi/lL2SFvHy_m4/hqdefault.jpg', 204000),
(55, 9, 2, 'U2', 'One', 'https://www.youtube.com/watch?v=ftjEcrrf7r0', 'https://i.ytimg.com/vi/ftjEcrrf7r0/hqdefault.jpg', 204000),
(56, 9, 2, 'Guns N Roses', 'November Rain', 'https://www.youtube.com/watch?v=8SbUC-UaAxE', 'https://i.ytimg.com/vi/8SbUC-UaAxE/hqdefault.jpg', 549600),
(57, 9, 1, 'GIANLUCA GRIGNANI', 'Mi Historia Entre Tus Dedos', 'https://www.youtube.com/watch?v=0WqJqDs4AwI', 'https://i.ytimg.com/vi/0WqJqDs4AwI/hqdefault.jpg', 303600),
(58, 9, 2, 'Metallica', 'Nothing Else Matters', 'https://www.youtube.com/watch?v=tAGnKpE4NCI', 'https://i.ytimg.com/vi/tAGnKpE4NCI/hqdefault.jpg', 375000),
(59, 9, 3, 'Gilberto Santa Rosa', 'Perdóname', 'https://www.youtube.com/watch?v=COSF2Vj7nXo', 'https://i.ytimg.com/vi/COSF2Vj7nXo/hqdefault.jpg', 628200),
(60, 9, 1, 'Emily Galaviz', 'Popurri 01', 'https://music.youtube.com/watch?v=gOvcHHOKC8g', 'https://i.ytimg.com/vi/gOvcHHOKC8g/hqdefault.jpg', 695400),
(61, 9, 1, 'REMIOROMEN', 'SUMMER LIVE', 'https://music.youtube.com/watch?v=D8KqMVKACiE', 'https://i.ytimg.com/vi/D8KqMVKACiE/hqdefault.jpg', 315000),
(62, 10, 2, 'Maná', 'Rayando El Sol', 'https://www.youtube.com/watch?v=8lbsQyMhMT8', 'https://i.ytimg.com/vi/8lbsQyMhMT8/hqdefault.jpg', 247200),
(63, 10, 10, 'Andrea Bocelli & Matteo Bocelli', 'Ven a Mi', 'https://www.youtube.com/watch?v=1tzZrY0L9WU', 'https://i.ytimg.com/vi/1tzZrY0L9WU/hqdefault.jpg', 254400),
(64, 10, 1, 'Bruno Mars', 'Just The Way You Are', 'https://www.youtube.com/watch?v=LjhCEhWiKXk', 'https://i.ytimg.com/vi/LjhCEhWiKXk/hqdefault.jpg', 213600),
(65, 10, 1, 'Eros Ramazzotti', 'La Cosa Mas Bella', 'https://www.youtube.com/watch?v=91baRH23nd8', 'https://i.ytimg.com/vi/91baRH23nd8/hqdefault.jpg', 255000),
(66, 10, 10, 'Sarah Brightman & Andrea Bocelli', 'Por ti volare', 'https://www.youtube.com/watch?v=QpAvfmomw2I', 'https://i.ytimg.com/vi/QpAvfmomw2I/hqdefault.jpg', 301800),
(67, 10, 1, 'Bacilos', 'Mi Primer Millon', 'https://www.youtube.com/watch?v=F5-oCyBQW8k', 'https://i.ytimg.com/vi/F5-oCyBQW8k/hqdefault.jpg', 212400),
(68, 10, 3, 'Grupo Niche', 'Nuestro Sueño', 'https://www.youtube.com/watch?v=x5DvEWNkNJ0', 'https://i.ytimg.com/vi/x5DvEWNkNJ0/hqdefault.jpg', 335400),
(69, 10, 1, 'Ricardo Montaner', 'La Cima del Cielo', 'https://www.youtube.com/watch?v=jrkNik4AHTU', 'https://i.ytimg.com/vi/jrkNik4AHTU/hqdefault.jpg', 272400),
(70, 10, 8, 'Luis Silva', 'Venezuela', 'https://www.youtube.com/watch?v=Yca0rmsLG4U', 'https://i.ytimg.com/vi/Yca0rmsLG4U/hqdefault.jpg', 272400),
(71, 10, 7, 'Barrio Obrero', 'Esa es mi gaita', 'https://www.youtube.com/watch?v=nK1M-RGbUdQ', 'https://i.ytimg.com/vi/nK1M-RGbUdQ/hqdefault.jpg', 201000),
(72, 10, 3, 'Sandy y Papo', 'Es Hora de Bailar', 'https://www.youtube.com/watch?v=y14snpXXW8A', 'https://i.ytimg.com/vi/y14snpXXW8A/hqdefault.jpg', 388200),
(73, 10, 2, '3 Doors Down', 'Here Without You', 'https://www.youtube.com/watch?v=kPBzTxZQG5Q', 'https://i.ytimg.com/vi/kPBzTxZQG5Q/hqdefault.jpg', 213000),
(74, 11, 1, 'ELENA ROSE', 'ME LO MEREZCO', 'https://www.youtube.com/watch?v=BLnvFHAeILE', 'https://i.ytimg.com/vi/BLnvFHAeILE/hqdefault.jpg', 151200),
(75, 11, 11, 'Gepe', 'Hablar de ti', 'https://www.youtube.com/watch?v=-uQPd8wtm1M', 'https://i.ytimg.com/vi/-uQPd8wtm1M/hqdefault.jpg', 151200),
(76, 11, 1, 'Rawayana Danny Ocean', 'Binikini', 'https://www.youtube.com/watch?v=8d8xxasOzQc', 'https://i.ytimg.com/vi/8d8xxasOzQc/hqdefault.jpg', 240000),
(77, 11, 1, 'Kapo Waie', 'UWAIE (You Are Welcome To My Eye)', 'https://www.youtube.com/watch?v=spbagny8OjM', 'https://i.ytimg.com/vi/spbagny8OjM/hqdefault.jpg', 240000),
(78, 11, 15, 'Vicente Fernández', 'Para Siempre', 'https://www.youtube.com/watch?v=ZKnjfdN5x6I', 'https://i.ytimg.com/vi/ZKnjfdN5x6I/hqdefault.jpg', 240000),
(79, 11, 1, 'Kany García', 'DPM De Pxta Madre', 'https://www.youtube.com/watch?v=30bpKbrhqek', 'https://i.ytimg.com/vi/30bpKbrhqek/hqdefault.jpg', 240000),
(80, 11, 12, 'Carin León Bolela', 'Aviso Importante', 'https://www.youtube.com/watch?v=i3KBwUQ63O4', 'https://i.ytimg.com/vi/i3KBwUQ63O4/hqdefault.jpg', 240000),
(81, 11, 1, 'Miranda Lali', 'Yo Te Diré', 'https://www.youtube.com/watch?v=uyzRf9hvyE8', 'https://i.ytimg.com/vi/uyzRf9hvyE8/hqdefault.jpg', 240000),
(82, 11, 12, 'Stailok ft Khali Polo', 'Lúcete', 'https://www.youtube.com/watch?v=x3nzwUnFsEk', 'https://i.ytimg.com/vi/x3nzwUnFsEk/hqdefault.jpg', 240000),
(83, 11, 12, 'Moral Distraída', 'El Menú', 'https://www.youtube.com/watch?v=NDUz5j1izoc', 'https://i.ytimg.com/vi/NDUz5j1izoc/hqdefault.jpg', 435600),
(84, 11, 12, 'Beatriz Luengo feat Jesus Navarro', 'Ley De Newton', 'https://www.youtube.com/watch?v=30bpKbrhqek', 'https://i.ytimg.com/vi/30bpKbrhqek/hqdefault.jpg', 264000),
(85, 11, 12, 'Beatriz Luengo', 'Chicas De Revista', 'https://www.youtube.com/watch?v=-0f5T6FZ4es', 'https://i.ytimg.com/vi/-0f5T6FZ4es/hqdefault.jpg', 210000),
(86, 11, 12, 'Vicente Garcia', 'Te Soñé', 'https://www.youtube.com/watch?v=4vtPF9YBXRo', 'https://i.ytimg.com/vi/4vtPF9YBXRo/hqdefault.jpg', 210000),
(87, 12, 4, 'Cuarto Poder', 'Arenita Playita', 'https://www.youtube.com/watch?v=tiUUV2oMVcY', 'https://i.ytimg.com/vi/tiUUV2oMVcY/hqdefault.jpg', 275400),
(88, 12, 2, 'Son By Four', 'A Puro Dolor', 'https://www.youtube.com/watch?v=kAKVT1HWNsg', 'https://i.ytimg.com/vi/kAKVT1HWNsg/hqdefault.jpg', 247200),
(89, 13, 1, 'Matt Simons', 'Catch & Release (Deepend Remix)', 'https://www.youtube.com/watch?v=puOoZB_uqY4', 'https://i.ytimg.com/vi/puOoZB_uqY4/hqdefault.jpg', 200400),
(90, 13, 1, 'U2', 'I\'ll Go Crazy If I Don\'t Go Crazy Tonight', 'https://www.youtube.com/watch?v=llHlZ9FT7VU', 'https://i.ytimg.com/vi/llHlZ9FT7VU/hqdefault.jpg', 247800),
(91, 13, 1, 'Benson Boone', 'Beautiful Things', 'https://www.youtube.com/watch?v=Gq-ekgeVGaA', 'https://i.ytimg.com/vi/Gq-ekgeVGaA/hqdefault.jpg', 187200),
(92, 13, 6, 'Juan Luis Guerra', 'La Bilirrubina', 'https://www.youtube.com/watch?v=45uU0lY2FGE', 'https://i.ytimg.com/vi/45uU0lY2FGE/hqdefault.jpg', 241800),
(93, 13, 1, 'Eros Ramazzotti', 'Più Bella Cosa', 'https://www.youtube.com/watch?v=UojBaKX5Vz4', 'https://i.ytimg.com/vi/UojBaKX5Vz4/hqdefault.jpg', 255600),
(94, 13, 1, 'Danny Ocean', 'Volare', 'https://www.youtube.com/watch?v=GGAcqZUOwRE', 'https://i.ytimg.com/vi/GGAcqZUOwRE/hqdefault.jpg', 140400),
(95, 13, 4, 'King Changó', 'Sin Ti', 'https://www.youtube.com/watch?v=hi3Y949WiUk', 'https://i.ytimg.com/vi/hi3Y949WiUk/hqdefault.jpg', 268200),
(96, 13, 2, 'Muse', 'Starlight', 'https://www.youtube.com/watch?v=pEyj2qvRwso', 'https://i.ytimg.com/vi/pEyj2qvRwso/hqdefault.jpg', 242400),
(97, 13, 6, 'Proyecto Uno', '25 Horas', 'https://www.youtube.com/watch?v=BsLFipYMh-o', 'https://i.ytimg.com/vi/BsLFipYMh-o/hqdefault.jpg', 202200),
(98, 13, 1, 'Natalia Lafourcade', 'Hasta la Raíz', 'https://www.youtube.com/watch?v=IKmPci5VXz0', 'https://i.ytimg.com/vi/IKmPci5VXz0/hqdefault.jpg', 205200),
(99, 13, 10, 'Modà', 'Non è mai abbastanza', 'https://www.youtube.com/watch?v=7NRQgnsKl9Q', 'https://i.ytimg.com/vi/7NRQgnsKl9Q/hqdefault.jpg', 246600),
(100, 13, 9, 'Ed Sheeran', 'Perfect', 'https://www.youtube.com/watch?v=kPhpHvnnn0Q', 'https://i.ytimg.com/vi/kPhpHvnnn0Q/hqdefault.jpg', 246600),
(118, 4, 9, 'CHATARRITAS MIX', 'CHATARRITAS MIX INGLES', 'https://www.youtube.com/watch?v=qwLPJY6YL54&t=481s&ab_channel=DjDarrelElapoderado', 'https://img.youtube.com/vi/qwLPJY6YL54/hqdefault.jpg', NULL),
(119, 14, 1, 'Alphaville', 'Big In Japan', 'https://www.youtube.com/watch?v=sjGl-pq4RxQ&ab_channel=MontagStudiosGmbH', 'https://img.youtube.com/vi/sjGl-pq4RxQ/hqdefault.jpg', 32000),
(121, 14, 9, 'Air Supply', 'Making Love out nothing at all', 'https://www.youtube.com/watch?v=h0u8OW4kEek&ab_channel=Oceanerouses', 'https://img.youtube.com/vi/h0u8OW4kEek/hqdefault.jpg', NULL),
(122, 14, 9, 'Tracy Chapman', 'Baby Can I Hold You', 'https://www.youtube.com/watch?v=DqoLMGSBGYc&ab_channel=TracyChapman', 'https://img.youtube.com/vi/DqoLMGSBGYc/hqdefault.jpg', NULL),
(123, 14, 9, 'Eagles', 'Hotel California', 'https://www.youtube.com/watch?v=09839DpTctU&ab_channel=Eagles', 'https://img.youtube.com/vi/09839DpTctU/hqdefault.jpg', NULL),
(125, 14, 2, 'Linkin Park', 'In The End', 'https://www.youtube.com/watch?v=eVTXPUF4Oz4&ab_channel=LinkinPark', 'https://img.youtube.com/vi/eVTXPUF4Oz4/hqdefault.jpg', NULL),
(126, 14, 9, 'Chicago', 'Hard To Say Im Sorry', 'https://www.youtube.com/watch?v=NnQT4Vc8jWw&ab_channel=GIGS', 'https://img.youtube.com/vi/ZN8IxFiRZx0/hqdefault.jpg', NULL),
(127, 14, 9, 'Richard Marx', 'Right Here Waiting', 'https://www.youtube.com/watch?v=9igyfbtJM-s&ab_channel=Novelty', 'https://img.youtube.com/vi/9igyfbtJM-s/hqdefault.jpg', NULL),
(128, 14, 9, 'Whitney Houston', 'I Have Nothing', 'https://www.youtube.com/watch?v=lMOm-voInJo&ab_channel=UniqueSound', 'https://img.youtube.com/vi/wZPAntqCpHE/hqdefault.jpg', NULL),
(129, 14, 9, 'Kenny Rogers & Lionel Richie', 'Lady', 'https://www.youtube.com/watch?v=SVT5kCqJ_Hg&ab_channel=SumeetDhamija', 'https://img.youtube.com/vi/j-HYaFi2Spg/hqdefault.jpg', NULL),
(130, 14, 9, 'Lionel Richie &amp; Diana Ross', 'My Endless Love', 'https://www.youtube.com/watch?v=NDNlYho3A2Y&ab_channel=DianaRossTV', 'https://img.youtube.com/vi/rqdm4RX8hr0/hqdefault.jpg', NULL),
(131, 4, 1, 'Lionel Richie', 'All Night Long', 'https://www.youtube.com/watch?v=nqAvFx3NxUM&list=RDEMHyV8bQLvu_fQlGLcPayfRw&start_radio=1&rv=NDNlYho3A2Y&ab_channel=LionelRichieVEVO', 'https://img.youtube.com/vi/nqAvFx3NxUM/hqdefault.jpg', NULL),
(132, 14, 9, 'Barbra Streisand', 'Woman In Love', 'https://www.youtube.com/watch?v=hQLGCX8D-1Y&ab_channel=barbrastreisandVEVO', 'https://img.youtube.com/vi/xOQPzN2g9KQ/hqdefault.jpg', NULL),
(133, 14, 1, 'Vico C', 'Lo Grande Que Es Perdonar', 'https://www.youtube.com/watch?v=_kzbd56qpf8&ab_channel=VicoC-Topic', 'https://img.youtube.com/vi/_kzbd56qpf8/hqdefault.jpg', NULL),
(134, 14, 10, 'Kany García, Alejandro Sanz', 'Muero', 'https://www.youtube.com/watch?v=XK6hxcSPg-E&ab_channel=RadioReggaeton', 'https://img.youtube.com/vi/XK6hxcSPg-E/hqdefault.jpg', NULL),
(135, 14, 10, 'Ana y Víctor', 'No sé por qué te quiero', 'https://www.youtube.com/watch?v=vOB8a9uDBzg&ab_channel=SajoPC', 'https://img.youtube.com/vi/vOB8a9uDBzg/hqdefault.jpg', NULL),
(136, 4, 8, 'Simón Díaz', 'Tonada del Cabestrero', 'https://www.youtube.com/watch?v=GqlIBF0ygJs', 'https://img.youtube.com/vi/GqlIBF0ygJs/hqdefault.jpg', NULL),
(137, 4, 8, 'Simón Díaz', 'El Alcaraván', 'https://www.youtube.com/watch?v=uBIf47Ujqho', 'https://img.youtube.com/vi/uBIf47Ujqho/hqdefault.jpg', NULL),
(138, 4, 8, 'Simón Díaz', 'Pasaje Del Olvido', 'https://www.youtube.com/watch?v=4bxyRpukzF8', 'https://img.youtube.com/vi/4bxyRpukzF8/hqdefault.jpg', NULL),
(139, 4, 8, 'Simón Díaz', 'Al Niño Jesús Llanero', 'https://www.youtube.com/watch?v=b4-jUflYuNc', 'https://img.youtube.com/vi/b4-jUflYuNc/hqdefault.jpg', NULL),
(140, 4, 8, 'Simón Díaz', 'Tonada Del Tormento', 'https://www.youtube.com/watch?v=Yqdv88JIprE', 'https://img.youtube.com/vi/Yqdv88JIprE/hqdefault.jpg', NULL),
(141, 4, 8, 'Simón Díaz', 'El Becerrito', 'https://www.youtube.com/watch?v=GE7o1UHiAVI', 'https://img.youtube.com/vi/GE7o1UHiAVI/hqdefault.jpg', NULL),
(142, 4, 8, 'Simón Díaz', 'Garcita', 'https://www.youtube.com/watch?v=DApEN-aXdlY', 'https://img.youtube.com/vi/DApEN-aXdlY/hqdefault.jpg', NULL),
(143, 4, 8, 'Simón Díaz', 'Sabana', 'https://www.youtube.com/watch?v=XvCH0knExHA', 'https://img.youtube.com/vi/XvCH0knExHA/hqdefault.jpg', NULL),
(144, 4, 8, 'Simón Díaz', 'Mi Querencia', 'https://www.youtube.com/watch?v=NXpkBhteGIQ', 'https://img.youtube.com/vi/NXpkBhteGIQ/hqdefault.jpg', NULL),
(145, 4, 8, 'Simón Díaz', 'Tonada De Las Espigas', 'https://www.youtube.com/watch?v=QKYF6Q8aS_g', 'https://img.youtube.com/vi/QKYF6Q8aS_g/hqdefault.jpg', NULL),
(146, 4, 8, 'Simón Díaz', 'Todo Este Campo Es Mío', 'https://www.youtube.com/watch?v=n5JjYyyiLWA', 'https://img.youtube.com/vi/n5JjYyyiLWA/hqdefault.jpg', NULL),
(147, 4, 8, 'Simón Díaz', 'Arbolito Sabanero|Clavelito Colorado', 'https://www.youtube.com/watch?v=oh_dqp7P6M', 'https://img.youtube.com/vi/oh_dqp7P6M8/hqdefault.jpg', NULL),
(148, 4, 8, 'Simón Díaz', 'El Loco Juan Carabina', 'https://www.youtube.com/watch?v=hzyNpM-rpb4', 'https://img.youtube.com/vi/hzyNpM-rpb4/hqdefault.jpg', NULL),
(149, 4, 8, 'Simón Díaz', 'Contrapunteo', 'https://www.youtube.com/watch?v=xvEFCOsPJzU', 'https://img.youtube.com/vi/xvEFCOsPJzU/hqdefault.jpg', NULL),
(150, 4, 8, 'Simón Díaz', 'Caballo Viejo', 'https://www.youtube.com/watch?v=LPQi8M6AFeg', 'https://img.youtube.com/vi/LPQi8M6AFeg/hqdefault.jpg', NULL),
(151, 14, 9, 'Tony Braxton', 'Unbreak My Heart', 'https://youtu.be/pU2LzuVrqLQ?si=VGKbk063wPSbrVxr', 'https://img.youtube.com/vi/pU2LzuVrqLQ/hqdefault.jpg', NULL),
(153, 4, 4, 'Daiquirí', 'Agua Que No Has de Beber', 'https://www.youtube.com/watch?v=9-wrbyJco_s&ab_channel=Daiquir%C3%AD-Topic', 'https://img.youtube.com/vi/9-wrbyJco_s/hqdefault.jpg', NULL),
(154, 4, 4, 'Daiquirí', 'Chamo Candela', 'https://www.youtube.com/watch?v=jHKCggplZt0&list=OLAK5uy_mx4hY6zXxfPEp72PEeL3vxzuB8wUiQgVk&ab_channel=Daiquir%C3%AD-Topic', 'https://img.youtube.com/vi/jHKCggplZt0/hqdefault.jpg', NULL),
(155, 4, 4, 'Daiquirí', 'Casa Del Ritmo', 'https://www.youtube.com/watch?v=eVnDROrK9d4&ab_channel=Daiquir%C3%AD-Topic', 'https://img.youtube.com/vi/eVnDROrK9d4/hqdefault.jpg', NULL),
(156, 4, 4, 'Daiquirí', 'Desde Que Te Fuiste', 'https://www.youtube.com/watch?v=pTLHo0qzU-k&ab_channel=Daiquir%C3%AD-Topic', 'https://img.youtube.com/vi/pTLHo0qzU-k/hqdefault.jpg', NULL),
(157, 4, 4, 'Elisa Rego', 'SELVA', 'https://www.youtube.com/watch?v=ii_yBm5UuvA&ab_channel=EnzoGD-Contribution', 'https://img.youtube.com/vi/ii_yBm5UuvA/hqdefault.jpg', NULL),
(158, 14, 10, 'Alejandro sanz', 'El Trato', 'https://youtube.com/watch?v=3XxNC30EN4I&si=8W309ddmVvMN1x7c', 'https://img.youtube.com/vi/3XxNC30EN4I/hqdefault.jpg', NULL),
(159, 14, 10, 'Robert Carlos', 'Cóncavo y convexo', 'https://youtu.be/iMve1GTn9FI?si=aWNDHG6ZEjpG_1KU', 'https://img.youtube.com/vi/iMve1GTn9FI/hqdefault.jpg', NULL),
(160, 4, 10, 'YORDANO', 'Manantial de corazón', 'https://www.youtube.com/watch?v=-J43wtaQ_0c&ab_channel=RafaelGonz%C3%A1lezC', 'https://img.youtube.com/vi/-J43wtaQ_0c/hqdefault.jpg', NULL),
(161, 4, 10, 'YORDANO', 'Locos de amor', 'https://www.youtube.com/watch?v=iwhy-98Qhbk&ab_channel=RafaelGonz%C3%A1lezC', 'https://img.youtube.com/vi/iwhy-98Qhbk/hqdefault.jpg', NULL),
(162, 14, 10, 'Roberto Carlos y Erika Ender', 'Despacito', 'https://youtu.be/-bCoFRsKpww?si=ZT0Xzkr8jBF0Z0rH', 'https://img.youtube.com/vi/-bCoFRsKpww/hqdefault.jpg', NULL),
(163, 4, 1, 'YORDANO', 'Por Estas Calles', 'https://www.youtube.com/watch?v=8vSS1Twwypc&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/8vSS1Twwypc/hqdefault.jpg', NULL),
(164, 4, 1, 'YORDANO', 'Madera Fina', 'https://www.youtube.com/watch?v=Pp-NPXSjR5E&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/Pp-NPXSjR5E/hqdefault.jpg', NULL),
(165, 4, 1, 'YORDANO', 'A la Hora Que Sea', 'https://www.youtube.com/watch?v=20aEkEeJeps&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/20aEkEeJeps/hqdefault.jpg', NULL),
(166, 4, 1, 'YORDANO', 'Bailando Tan Cerca', 'https://www.youtube.com/watch?v=pzQqg-9hP1E&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/pzQqg-9hP1E/hqdefault.jpg', NULL),
(167, 4, 10, 'YORDANO', 'Días de Junio', 'https://www.youtube.com/watch?v=tFFdbIaLqGw&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/tFFdbIaLqGw/hqdefault.jpg', NULL),
(168, 4, 10, 'YORDANO', 'Hoy Vamos a Salir', 'https://www.youtube.com/watch?v=0fdksWAxpO4&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/0fdksWAxpO4/hqdefault.jpg', NULL),
(169, 4, 10, 'YORDANO', 'Algo Bueno Tiene Que Pasar', 'https://www.youtube.com/watch?v=yGkPcwOJuG4&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/yGkPcwOJuG4/hqdefault.jpg', NULL),
(170, 14, 10, 'La oreja de van Gogh FT Abel Pinto', 'Deseos de cosas imposibles', 'https://youtu.be/zpSBU0eUmmw?si=HF61JEsBoFxAwfs7', 'https://img.youtube.com/vi/zpSBU0eUmmw/hqdefault.jpg', NULL),
(171, 4, 10, 'YORDANO', 'Aquel Lugar Secreto', 'https://www.youtube.com/watch?v=8KLCMilx_10&ab_channel=Yordano-Topic', 'https://img.youtube.com/vi/8KLCMilx_10/hqdefault.jpg', NULL),
(172, 4, 1, 'YORDANO', 'Chatarra de Amor', 'https://www.youtube.com/watch?v=cfQcfcptZgk', 'https://img.youtube.com/vi/cfQcfcptZgk/hqdefault.jpg', NULL),
(173, 4, 10, 'YORDANO', 'Robando Azules', 'https://www.youtube.com/watch?v=oGLNTxkWowo', 'https://img.youtube.com/vi/oGLNTxkWowo/hqdefault.jpg', NULL),
(174, 14, 1, 'Michael Jackson', 'Heal the World', 'https://youtu.be/BWf-eARnf6U?si=W2nT-jQ7b713iYEz', 'https://img.youtube.com/vi/BWf-eARnf6U/hqdefault.jpg', NULL),
(175, 14, 1, 'Miley Cyrus', 'Flowers', 'https://youtu.be/PSC4TcLJfAg?si=C2yi4mM_mmgB1ymW', 'https://img.youtube.com/vi/PSC4TcLJfAg/hqdefault.jpg', NULL),
(176, 4, 10, 'Franco De Vita', 'Un Buen Perdedor', 'https://www.youtube.com/watch?v=O7OrckGRlAs&ab_channel=FrancodeVita-Topic', 'https://img.youtube.com/vi/O7OrckGRlAs/hqdefault.jpg', NULL),
(177, 4, 10, 'Franco De Vita', 'Tú De Que Vas', 'https://www.youtube.com/watch?v=6hRlvcy3V9k&ab_channel=FrancodeVitaVEVO', 'https://img.youtube.com/vi/6hRlvcy3V9k/hqdefault.jpg', NULL),
(178, 4, 10, 'Franco De Vita', 'Si la Ves', 'https://www.youtube.com/watch?v=p30wrDgT-kc&ab_channel=FrancodeVitaVEVO', 'https://img.youtube.com/vi/p30wrDgT-kc/hqdefault.jpg', NULL),
(179, 4, 10, 'Franco De Vita', 'No Basta', 'https://www.youtube.com/watch?v=02OB35a9DPc&ab_channel=FrancoDeVita', 'https://img.youtube.com/vi/02OB35a9DPc/hqdefault.jpg', NULL),
(180, 4, 10, 'Franco De Vita', 'Te Pienso Sin Querer', 'https://www.youtube.com/watch?v=w4iGUWTkAvk&ab_channel=FrancodeVitaVEVO', 'https://img.youtube.com/vi/w4iGUWTkAvk/hqdefault.jpg', NULL),
(181, 4, 1, 'Franco De Vita', 'Louis', 'https://www.youtube.com/watch?v=GxZOEtFdZXc&ab_channel=FrancoDeVita', 'https://img.youtube.com/vi/GxZOEtFdZXc/hqdefault.jpg', NULL),
(182, 4, 10, 'Franco De Vita', 'Si La Ves', 'https://www.youtube.com/watch?v=ELYTVlv9azg&ab_channel=FrancodeVitaVEVO', 'https://img.youtube.com/vi/ELYTVlv9azg/hqdefault.jpg', NULL),
(183, 4, 10, 'Franco De Vita', 'Cuando Tus Ojos Me Miran', 'https://www.youtube.com/watch?v=LSR1BNxdT8A&ab_channel=FrancodeVitaVEVO', 'https://img.youtube.com/vi/LSR1BNxdT8A/hqdefault.jpg', NULL),
(184, 4, 10, 'Franco De Vita', 'Te Amo', 'https://www.youtube.com/watch?v=hNDtsPMX7p0&ab_channel=FrancoDeVita', 'https://img.youtube.com/vi/hNDtsPMX7p0/hqdefault.jpg', NULL),
(185, 4, 10, 'Franco De Vita', 'Dónde Está El Amor', 'https://www.youtube.com/watch?v=SaNouUJvUCU', 'https://img.youtube.com/vi/SaNouUJvUCU/hqdefault.jpg', NULL),
(186, 14, 2, 'Queen', 'Ga ga', 'https://youtu.be/o-0ygW-B_gI?si=617hPXP2qvNdTMwj', 'https://img.youtube.com/vi/o-0ygW-B_gI/hqdefault.jpg', NULL),
(187, 4, 1, 'Franco De Vita', 'Al Norte del Sur', 'https://www.youtube.com/watch?v=zEtfxDByXRQ', 'https://img.youtube.com/vi/zEtfxDByXRQ/hqdefault.jpg', NULL),
(188, 4, 10, 'Franco De Vita', 'Será', 'https://www.youtube.com/watch?v=DeDwc4O83Vw', 'https://img.youtube.com/vi/DeDwc4O83Vw/hqdefault.jpg', NULL),
(189, 4, 10, 'Franco De Vita', 'A Medio Vivir', 'https://www.youtube.com/watch?v=LV-_fUJc6GA', 'https://img.youtube.com/vi/LV-_fUJc6GA/hqdefault.jpg', NULL),
(190, 4, 10, 'Franco De Vita', 'Tengo', 'https://www.youtube.com/watch?v=Rn3RqbWyjcY', 'https://img.youtube.com/vi/Rn3RqbWyjcY/hqdefault.jpg', NULL),
(191, 4, 10, 'Franco De Vita', 'Y Tú Te Vas', 'https://www.youtube.com/watch?v=V8VVbAn-ods', 'https://img.youtube.com/vi/V8VVbAn-ods/hqdefault.jpg', NULL),
(192, 4, 2, 'Franco De Vita', 'Latino', 'https://www.youtube.com/watch?v=m91SgEe1ePU', 'https://img.youtube.com/vi/m91SgEe1ePU/hqdefault.jpg', NULL),
(193, 4, 2, 'Franco De Vita', 'Traigo una Pena', 'https://www.youtube.com/watch?v=cdNUjNCICcw', 'https://img.youtube.com/vi/cdNUjNCICcw/hqdefault.jpg', NULL),
(194, 14, 1, 'Sinead & Higgins Connor', 'Nothing', 'https://youtu.be/NAOKzvL8dgk?si=DmpWRgJRhggOXUYk', 'https://img.youtube.com/vi/NAOKzvL8dgk/hqdefault.jpg', NULL),
(195, 14, 1, 'Michael Jackson', 'Earth song', 'https://youtu.be/_tz3UcG2RRg?si=DIATB8CqZ9Cw-5br', 'https://img.youtube.com/vi/_tz3UcG2RRg/hqdefault.jpg', NULL),
(196, 4, 10, 'Franco De Vita', 'UN BUEN PERDEDOR', 'https://www.youtube.com/watch?v=yWvuMVr9-WE', 'https://img.youtube.com/vi/yWvuMVr9-WE/hqdefault.jpg', NULL),
(197, 14, 10, 'Carla Morrison', 'Disfruto', 'https://youtu.be/jwP1HRmDVII?si=YvE9RYbYDN-a31ik', 'https://img.youtube.com/vi/jwP1HRmDVII/hqdefault.jpg', NULL),
(198, 4, 1, 'Franco De Vita', 'Mi Amigo Sebastian', 'https://www.youtube.com/watch?v=YDrITIrfUUY', 'https://img.youtube.com/vi/YDrITIrfUUY/hqdefault.jpg', NULL),
(199, 4, 10, 'Franco De Vita', 'Fuera De Este Mundo', 'https://www.youtube.com/watch?v=6kYL_On0XKA', 'https://img.youtube.com/vi/6kYL_On0XKA/hqdefault.jpg', NULL),
(200, 4, 1, 'Franco De Vita', 'Si Tú No Estás', 'https://www.youtube.com/watch?v=rmYqj_zL-p0', 'https://img.youtube.com/vi/rmYqj_zL-p0/hqdefault.jpg', NULL),
(201, 4, 10, 'Franco De Vita', 'Esta Vez', 'https://www.youtube.com/watch?v=LukJkTiBgEQ', 'https://img.youtube.com/vi/LukJkTiBgEQ/hqdefault.jpg', NULL),
(202, 4, 10, 'Franco De Vita', 'Sólo Importas Tú', 'https://www.youtube.com/watch?v=T0MOvyvZfSk', 'https://img.youtube.com/vi/T0MOvyvZfSk/hqdefault.jpg', NULL),
(203, 4, 2, 'Franco De Vita', 'Que No Muera La Esperanza', 'https://www.youtube.com/watch?v=JYR3h-urLJM', 'https://img.youtube.com/vi/JYR3h-urLJM/hqdefault.jpg', NULL),
(204, 4, 10, 'Franco De Vita', 'Contra Vientos Y Mareas', 'https://www.youtube.com/watch?v=X4wzQy8KU2I', 'https://img.youtube.com/vi/X4wzQy8KU2I/hqdefault.jpg', NULL),
(205, 4, 2, 'Franco De Vita', 'Sexo', 'https://www.youtube.com/watch?v=tJwIEYeYRnE', 'https://img.youtube.com/vi/tJwIEYeYRnE/hqdefault.jpg', NULL),
(206, 4, 2, 'Franco De Vita', 'Barco A La Deriva', 'https://www.youtube.com/watch?v=DHW-lLBAsLw', 'https://img.youtube.com/vi/DHW-lLBAsLw/hqdefault.jpg', NULL),
(208, 4, 10, 'Franco De Vita', 'Aquí Estas Otra Vez', 'https://www.youtube.com/watch?v=OJUTD_6UXUM', 'https://img.youtube.com/vi/OJUTD_6UXUM/hqdefault.jpg', NULL),
(209, 4, 2, 'Franco De Vita', 'Extranjero', 'https://www.youtube.com/watch?v=R6FE2yMLjf8', 'https://img.youtube.com/vi/R6FE2yMLjf8/hqdefault.jpg', NULL),
(210, 4, 10, 'Franco De Vita', 'Y Te Pienso', 'https://www.youtube.com/watch?v=iOhU3gOKTww', 'https://img.youtube.com/vi/iOhU3gOKTww/hqdefault.jpg', NULL),
(211, 4, 1, 'Franco De Vita', 'Cálido y Frío', 'https://www.youtube.com/watch?v=PQbi7kZMqpQ', 'https://img.youtube.com/vi/PQbi7kZMqpQ/hqdefault.jpg', NULL),
(212, 4, 1, 'Franco De Vita', 'Los Hijos De La Oscuridad', 'https://www.youtube.com/watch?v=m9uqzPQyppw', 'https://img.youtube.com/vi/m9uqzPQyppw/hqdefault.jpg', NULL),
(213, 4, 1, 'Franco De Vita', 'No Lo Había Pensado', 'https://www.youtube.com/watch?v=eskSq3SXiS8', 'https://img.youtube.com/vi/eskSq3SXiS8/hqdefault.jpg', NULL),
(214, 4, 10, 'Franco De Vita', 'Ya lo habia vivido', 'https://www.youtube.com/watch?v=dYSGoSU0jd0', 'https://img.youtube.com/vi/dYSGoSU0jd0/hqdefault.jpg', NULL),
(215, 4, 10, 'Franco De Vita', 'Te Veo Venir Soledad', 'https://www.youtube.com/watch?v=vUQAqTlTm24', 'https://img.youtube.com/vi/vUQAqTlTm24/hqdefault.jpg', NULL),
(216, 4, 1, 'Franco De Vita', 'Ella Esta Loca por Mi', 'https://www.youtube.com/watch?v=YYuXlSKqyJk', 'https://img.youtube.com/vi/YYuXlSKqyJk/hqdefault.jpg', NULL),
(217, 4, 1, 'Franco De Vita', 'Quien Lo Iba A Saber', 'https://www.youtube.com/watch?v=nzUSIK6LKDc', 'https://img.youtube.com/vi/nzUSIK6LKDc/hqdefault.jpg', NULL),
(218, 4, 1, 'Franco De Vita', 'Cálido y Frío', 'https://www.youtube.com/watch?v=PQbi7kZMqpQ', 'https://img.youtube.com/vi/PQbi7kZMqpQ/hqdefault.jpg', NULL),
(219, 5, 10, 'Yordano', 'Perla Negra', 'https://youtu.be/KCY7rUTUV2Y?si=Mbp2-VoxCs_sHr2L', 'https://img.youtube.com/vi/KCY7rUTUV2Y/hqdefault.jpg', NULL),
(220, 4, 9, 'Grover Washington', 'Just the Two of Us', 'https://www.youtube.com/watch?v=KYwA5k00p2I', 'https://img.youtube.com/vi/KYwA5k00p2I/hqdefault.jpg', NULL),
(221, 4, 3, 'Adolescentes', 'Virgen', 'https://www.youtube.com/watch?v=pz9O3UeM_o0', 'https://img.youtube.com/vi/pz9O3UeM_o0/hqdefault.jpg', NULL),
(222, 4, 3, 'Adolescentes', 'Persona Ideal', 'https://www.youtube.com/watch?v=d9bRnGo2gjk', 'https://img.youtube.com/vi/d9bRnGo2gjk/hqdefault.jpg', NULL),
(223, 4, 3, 'Adolescentes', 'Aquel Lugar', 'https://www.youtube.com/watch?v=RC5i3uPscz4', 'https://img.youtube.com/vi/RC5i3uPscz4/hqdefault.jpg', NULL),
(224, 4, 3, 'Adolescentes', 'Recuerdos', 'https://www.youtube.com/watch?v=b93WU7LpXlk', 'https://img.youtube.com/vi/b93WU7LpXlk/hqdefault.jpg', NULL),
(225, 4, 3, 'Adolescentes', 'Se Acabó el Amor', 'https://www.youtube.com/watch?v=hqDj3O_gu78', 'https://img.youtube.com/vi/hqDj3O_gu78/hqdefault.jpg', NULL),
(226, 4, 3, 'Adolescentes', 'Arrepentida', 'https://www.youtube.com/watch?v=FO5i4STK_tU', 'https://img.youtube.com/vi/FO5i4STK_tU/hqdefault.jpg', NULL),
(227, 4, 3, 'Adolescentes', 'Hoy Aprendí', 'https://www.youtube.com/watch?v=nM6DEuG7V_0', 'https://img.youtube.com/vi/nM6DEuG7V_0/hqdefault.jpg', NULL),
(228, 4, 3, 'Adolescentes', 'Me Tengo Que Ir', 'https://www.youtube.com/watch?v=IHhg2xO3hAw', 'https://img.youtube.com/vi/IHhg2xO3hAw/hqdefault.jpg', NULL),
(229, 4, 3, 'Adolescentes', 'Cuerpo Sin Alma', 'https://www.youtube.com/watch?v=wh3aFMSXZ0U', 'https://img.youtube.com/vi/wh3aFMSXZ0U/hqdefault.jpg', NULL),
(230, 4, 3, 'Adolescentes', 'Dame Un Poco Más', 'https://www.youtube.com/watch?v=f8wJ7kdy2Xk', 'https://img.youtube.com/vi/f8wJ7kdy2Xk/hqdefault.jpg', NULL),
(231, 4, 3, 'Adolescentes', 'Búscame', 'https://www.youtube.com/watch?v=HZZTzF201j8', 'https://img.youtube.com/vi/HZZTzF201j8/hqdefault.jpg', NULL),
(232, 4, 3, 'Adolescentes', 'Corazón, Corazón', 'https://www.youtube.com/watch?v=6LRXWCbX3kg', 'https://img.youtube.com/vi/6LRXWCbX3kg/hqdefault.jpg', NULL),
(233, 4, 3, 'Adolescentes', 'Fanático', 'https://www.youtube.com/watch?v=SmfwHtpKMLo', 'https://img.youtube.com/vi/SmfwHtpKMLo/hqdefault.jpg', NULL),
(234, 4, 3, 'Adolescentes', 'Amiga', 'https://www.youtube.com/watch?v=SQufVvc1vYw', 'https://img.youtube.com/vi/SQufVvc1vYw/hqdefault.jpg', NULL),
(235, 4, 3, 'Adolescentes', 'Dame una Oportunidad', 'https://www.youtube.com/watch?v=uL95nurqcf0', 'https://img.youtube.com/vi/uL95nurqcf0/hqdefault.jpg', NULL),
(236, 4, 3, 'Adolescentes', 'Cruel Decisión', 'https://www.youtube.com/watch?v=q_Y5orNvm2Q', 'https://img.youtube.com/vi/q_Y5orNvm2Q/hqdefault.jpg', NULL),
(237, 4, 3, 'Fernandito Villalona', 'No Podrás', 'https://www.youtube.com/watch?v=BzRWixHlkeY', 'https://img.youtube.com/vi/BzRWixHlkeY/hqdefault.jpg', NULL),
(238, 4, 8, 'Reynaldo Armas', 'Decisión', 'https://www.youtube.com/watch?v=Yp-5yfZob7E', 'https://img.youtube.com/vi/Yp-5yfZob7E/hqdefault.jpg', NULL),
(239, 4, 8, 'Reynaldo Armas', 'Patria Chica', 'https://www.youtube.com/watch?v=p1egX4WljWA', 'https://img.youtube.com/vi/p1egX4WljWA/hqdefault.jpg', NULL),
(240, 4, 8, 'Reynaldo Armas', 'Tres Contra El Mundo', 'https://www.youtube.com/watch?v=aQ96x69Gi_A', 'https://img.youtube.com/vi/aQ96x69Gi_A/hqdefault.jpg', NULL),
(241, 4, 8, 'Reynaldo Armas', 'El Amor Más Grande', 'https://www.youtube.com/watch?v=moZhL5FCqWo', 'https://img.youtube.com/vi/moZhL5FCqWo/hqdefault.jpg', NULL),
(242, 4, 8, 'Reynaldo Armas', 'La Felicidad De Un Pensador', 'https://www.youtube.com/watch?v=t7WuyFKY7Pw', 'https://img.youtube.com/vi/t7WuyFKY7Pw/hqdefault.jpg', NULL),
(243, 4, 8, 'Reynaldo Armas', 'Morichal Amigo', 'https://www.youtube.com/watch?v=QfeybMSxwN4', 'https://img.youtube.com/vi/QfeybMSxwN4/hqdefault.jpg', NULL),
(244, 4, 8, 'Reynaldo Armas', 'Me Quieren Quitar La Vida', 'https://www.youtube.com/watch?v=SWNXdo1kg9w', 'https://img.youtube.com/vi/SWNXdo1kg9w/hqdefault.jpg', NULL),
(245, 4, 8, 'Reynaldo Armas', 'Que Dios La Bendiga', 'https://www.youtube.com/watch?v=pfYIG15Rkxc', 'https://img.youtube.com/vi/pfYIG15Rkxc/hqdefault.jpg', NULL),
(246, 4, 8, 'Reynaldo Armas', 'Sin Querer Queriendo', 'https://www.youtube.com/watch?v=8I8mLpBHVzQ', 'https://img.youtube.com/vi/8I8mLpBHVzQ/hqdefault.jpg', NULL),
(247, 4, 8, 'Reynaldo Armas', 'Un Amigo Verdadero', 'https://www.youtube.com/watch?v=50FxyF_67p4', 'https://img.youtube.com/vi/50FxyF_67p4/hqdefault.jpg', NULL),
(248, 4, 8, 'Reynaldo Armas', 'A Boca Cerrada', 'https://www.youtube.com/watch?v=TMLxDnqLOzQ', 'https://img.youtube.com/vi/TMLxDnqLOzQ/hqdefault.jpg', NULL),
(249, 4, 8, 'Reynaldo Armas', 'A Sogamoso', 'https://www.youtube.com/watch?v=tCjg8ttXX-Y', 'https://img.youtube.com/vi/tCjg8ttXX-Y/hqdefault.jpg', NULL),
(250, 4, 8, 'Reynaldo Armas', 'Las dos caras de Juana', 'https://www.youtube.com/watch?v=uL0CDnhX5sY', 'https://img.youtube.com/vi/uL0CDnhX5sY/hqdefault.jpg', NULL),
(251, 4, 8, 'Reynaldo Armas', 'El amor y la envidia', 'https://www.youtube.com/watch?v=vjaPzyh6Tz0', 'https://img.youtube.com/vi/vjaPzyh6Tz0/hqdefault.jpg', NULL),
(252, 4, 8, 'Reynaldo Armas', 'Te quiero como a ninguna', 'https://www.youtube.com/watch?v=9-5OMnjDKio', 'https://img.youtube.com/vi/9-5OMnjDKio/hqdefault.jpg', NULL),
(253, 4, 8, 'Reynaldo Armas', 'Compadre José del Carmen', 'https://www.youtube.com/watch?v=xx3NrBqUIZo', 'https://img.youtube.com/vi/xx3NrBqUIZo/hqdefault.jpg', NULL),
(254, 4, 8, 'Reynaldo Armas', 'Valencia con cariño', 'https://www.youtube.com/watch?v=aTtmEXOCrQM', 'https://img.youtube.com/vi/aTtmEXOCrQM/hqdefault.jpg', NULL),
(255, 4, 8, 'Reynaldo Armas', 'El rey del mundo', 'https://www.youtube.com/watch?v=H2SjAvcP0WM', 'https://img.youtube.com/vi/H2SjAvcP0WM/hqdefault.jpg', NULL),
(256, 4, 8, 'Reynaldo Armas', 'Perdiendo también se gana', 'https://www.youtube.com/watch?v=Wv1uy9Ax8AE', 'https://img.youtube.com/vi/Wv1uy9Ax8AE/hqdefault.jpg', NULL),
(257, 4, 8, 'Reynaldo Armas', 'A la mujer Calaboceña', 'https://www.youtube.com/watch?v=pfYqOTWEleo', 'https://img.youtube.com/vi/pfYqOTWEleo/hqdefault.jpg', NULL),
(258, 4, 8, 'Reynaldo Armas', 'Carta para una ingrata', 'https://www.youtube.com/watch?v=DFR2UPDwt40', 'https://img.youtube.com/vi/DFR2UPDwt40/hqdefault.jpg', NULL),
(259, 4, 8, 'Reynaldo Armas', 'El último heredero', 'https://www.youtube.com/watch?v=qIkUigiZZ0E', 'https://img.youtube.com/vi/qIkUigiZZ0E/hqdefault.jpg', NULL),
(260, 4, 8, 'Reynaldo Armas', 'Mi Más Hermoso Motivo', 'https://www.youtube.com/watch?v=7fOdsEJLNdo', 'https://img.youtube.com/vi/7fOdsEJLNdo/hqdefault.jpg', NULL),
(261, 4, 8, 'Reynaldo Armas', 'Lamento Bolivariano', 'https://www.youtube.com/watch?v=kb2qGiuT4EE', 'https://img.youtube.com/vi/kb2qGiuT4EE/hqdefault.jpg', NULL),
(262, 4, 8, 'Reynaldo Armas', 'Vestido Azul', 'https://www.youtube.com/watch?v=8anB0xxh2ZQ', 'https://img.youtube.com/vi/8anB0xxh2ZQ/hqdefault.jpg', NULL),
(263, 4, 8, 'Reynaldo Armas', 'Mi Credo', 'https://www.youtube.com/watch?v=Bwu-2Hnwp5Q', 'https://img.youtube.com/vi/Bwu-2Hnwp5Q/hqdefault.jpg', NULL),
(264, 4, 8, 'Reynaldo Armas', 'Una Parte de Mi Patria', 'https://www.youtube.com/watch?v=hL5nBeeiUdg', 'https://img.youtube.com/vi/hL5nBeeiUdg/hqdefault.jpg', NULL),
(265, 4, 8, 'Reynaldo Armas', 'A Usted', 'https://www.youtube.com/watch?v=SQG3nKp9CwY', 'https://img.youtube.com/vi/SQG3nKp9CwY/hqdefault.jpg', NULL),
(266, 4, 8, 'Reynaldo Armas', 'El Cuarto de los Recuerdos', 'https://www.youtube.com/watch?v=d86TtTUjwnc', 'https://img.youtube.com/vi/d86TtTUjwnc/hqdefault.jpg', NULL),
(267, 4, 8, 'Reynaldo Armas', 'Arauca Rio y Pueblo', 'https://www.youtube.com/watch?v=mahfGRYA3j4', 'https://img.youtube.com/vi/mahfGRYA3j4/hqdefault.jpg', NULL),
(268, 4, 8, 'Reynaldo Armas', 'Ni Tu, Ni Ella', 'https://www.youtube.com/watch?v=KTNlMS_jSfg', 'https://img.youtube.com/vi/KTNlMS_jSfg/hqdefault.jpg', NULL),
(269, 4, 8, 'Reynaldo Armas', 'Capoteando Mi Nostalgia', 'https://www.youtube.com/watch?v=-oEz6IvgCaQ', 'https://img.youtube.com/vi/-oEz6IvgCaQ/hqdefault.jpg', NULL),
(270, 4, 8, 'Reynaldo Armas', 'Cantor Poeta y Pintor', 'https://www.youtube.com/watch?v=alKCQZHEk9c', 'https://img.youtube.com/vi/alKCQZHEk9c/hqdefault.jpg', NULL),
(271, 4, 8, 'Reynaldo Armas', 'Laguna Vieja', 'https://www.youtube.com/watch?v=Rl0RvAD1Adk', 'https://img.youtube.com/vi/Rl0RvAD1Adk/hqdefault.jpg', NULL),
(272, 4, 8, 'Reynaldo Armas', 'Carta Malvada', 'https://www.youtube.com/watch?v=Q0yhybGb3Eo', 'https://img.youtube.com/vi/Q0yhybGb3Eo/hqdefault.jpg', NULL),
(273, 4, 8, 'Reynaldo Armas', 'El Beso Robado', 'https://www.youtube.com/watch?v=BxNeU548q7Q', 'https://img.youtube.com/vi/BxNeU548q7Q/hqdefault.jpg', NULL),
(274, 4, 8, 'Reynaldo Armas', 'Mi Amigo el Camino', 'https://www.youtube.com/watch?v=tJESMDqb4fs', 'https://img.youtube.com/vi/tJESMDqb4fs/hqdefault.jpg', NULL),
(275, 4, 8, 'Reynaldo Armas', 'Gracias a Diós', 'https://www.youtube.com/watch?v=mYMYlNM1T-k', 'https://img.youtube.com/vi/mYMYlNM1T-k/hqdefault.jpg', NULL),
(276, 4, 8, 'Reynaldo Armas', 'DIOS BENDIGA', 'https://www.youtube.com/watch?v=az2gw2eBa_o', 'https://img.youtube.com/vi/az2gw2eBa_o/hqdefault.jpg', NULL),
(277, 4, 8, 'Reynaldo Armas', 'La Caída de un Cristal', 'https://www.youtube.com/watch?v=1CTW8ietNlU', 'https://img.youtube.com/vi/1CTW8ietNlU/hqdefault.jpg', NULL),
(278, 4, 8, 'Reynaldo Armas', 'El Juego del Amor', 'https://www.youtube.com/watch?v=xFJ79Xufvqs', 'https://img.youtube.com/vi/xFJ79Xufvqs/hqdefault.jpg', NULL),
(279, 4, 8, 'Reynaldo Armas', 'Pesadilla Entre Las Flores', 'https://www.youtube.com/watch?v=rv7gjRYfFU8', 'https://img.youtube.com/vi/rv7gjRYfFU8/hqdefault.jpg', NULL),
(280, 4, 8, 'Reynaldo Armas', 'Pa Que Te Acuerdes de Mi', 'https://www.youtube.com/watch?v=y6luyekFc38', 'https://img.youtube.com/vi/y6luyekFc38/hqdefault.jpg', NULL),
(281, 4, 8, 'Reynaldo Armas', 'ENAMORAMIENTO', 'https://www.youtube.com/watch?v=jFz_ptRihbY', 'https://img.youtube.com/vi/jFz_ptRihbY/hqdefault.jpg', NULL),
(282, 4, 6, 'Proyecto Uno', 'Tiburón', 'https://www.youtube.com/watch?v=4Qy0vs80T5M', 'https://img.youtube.com/vi/4Qy0vs80T5M/hqdefault.jpg', NULL),
(283, 4, 6, 'Proyecto Uno', '25 horas', 'https://www.youtube.com/watch?v=4iBwipKkX6k', 'https://img.youtube.com/vi/4iBwipKkX6k/hqdefault.jpg', NULL),
(284, 4, 6, 'Proyecto Uno', 'Esta PEGAO', 'https://www.youtube.com/watch?v=AhGe1rsLuQQ', 'https://img.youtube.com/vi/AhGe1rsLuQQ/hqdefault.jpg', NULL),
(285, 4, 6, 'Proyecto Uno', 'Brinca', 'https://www.youtube.com/watch?v=thzHDR0PSB0', 'https://img.youtube.com/vi/thzHDR0PSB0/hqdefault.jpg', NULL),
(286, 4, 6, 'Proyecto Uno', 'Another NIGHT', 'https://www.youtube.com/watch?v=uG_g1DYcOV4', 'https://img.youtube.com/vi/uG_g1DYcOV4/hqdefault.jpg', NULL),
(287, 4, 6, 'Proyecto Uno', 'Pumpin', 'https://www.youtube.com/watch?v=ZfhFvFSPbAA', 'https://img.youtube.com/vi/ZfhFvFSPbAA/hqdefault.jpg', NULL),
(288, 4, 6, 'Proyecto Uno', 'El Grillero', 'https://www.youtube.com/watch?v=CokWGmuYduM', 'https://img.youtube.com/vi/CokWGmuYduM/hqdefault.jpg', NULL),
(289, 4, 6, 'Proyecto Uno', 'Tan Interesada', 'https://www.youtube.com/watch?v=de1MFhipW_E', 'https://img.youtube.com/vi/de1MFhipW_E/hqdefault.jpg', NULL),
(290, 4, 6, 'Proyecto Uno', 'Cuarto De Hotel', 'https://www.youtube.com/watch?v=RZf8E6phfxs', 'https://img.youtube.com/vi/RZf8E6phfxs/hqdefault.jpg', NULL),
(291, 4, 6, 'Sandy & Papo', 'Huelepega', 'https://www.youtube.com/watch?v=fwkDegMzl30', 'https://img.youtube.com/vi/fwkDegMzl30/hqdefault.jpg', NULL),
(292, 4, 6, 'Sandy & Papo', 'La Hora De Bailar', 'https://www.youtube.com/watch?v=y14snpXXW8A', 'https://img.youtube.com/vi/y14snpXXW8A/hqdefault.jpg', NULL),
(293, 4, 6, 'Sandy & Papo', 'El Alacrán', 'https://www.youtube.com/watch?v=gdbDRfu3cPk', 'https://img.youtube.com/vi/gdbDRfu3cPk/hqdefault.jpg', NULL),
(294, 4, 6, 'Sandy & Papo', 'La Fiesta', 'https://www.youtube.com/watch?v=DXmU_9Yt96A', 'https://img.youtube.com/vi/DXmU_9Yt96A/hqdefault.jpg', NULL),
(295, 4, 6, 'Sandy & Papo', 'Mueve Mueve', 'https://www.youtube.com/watch?v=AJ_OX-w7G_Q', 'https://img.youtube.com/vi/AJ_OX-w7G_Q/hqdefault.jpg', NULL),
(296, 4, 6, 'Sandy & Papo', 'Madre', 'https://www.youtube.com/watch?v=3OsAnWmqyyI', 'https://img.youtube.com/vi/3OsAnWmqyyI/hqdefault.jpg', NULL),
(297, 4, 6, 'Sandy & Papo', 'La Movida', 'https://www.youtube.com/watch?v=Oi4EyABHv1U', 'https://img.youtube.com/vi/Oi4EyABHv1U/hqdefault.jpg', NULL),
(298, 4, 6, 'Sandy & Papo', 'La Chica Sexy', 'https://www.youtube.com/watch?v=Uc5zbIr5cKw', 'https://img.youtube.com/vi/Uc5zbIr5cKw/hqdefault.jpg', NULL),
(299, 4, 6, 'Sandy & Papo', 'Bueno Pa Goza', 'https://www.youtube.com/watch?v=MVDtZkAuMbw', 'https://img.youtube.com/vi/MVDtZkAuMbw/hqdefault.jpg', NULL),
(300, 4, 6, 'Sandy & Papo', 'Homenaje A Papo', 'https://www.youtube.com/watch?v=SkDTZaW_t44', 'https://img.youtube.com/vi/SkDTZaW_t44/hqdefault.jpg', NULL),
(301, 4, 6, 'Ilegales', 'Mix Ilegales', 'https://www.youtube.com/watch?v=qVONqb2tAiw', 'https://img.youtube.com/vi/qVONqb2tAiw/hqdefault.jpg', NULL),
(302, 4, 6, 'Ilegales', 'El Taqui Taqui', 'https://www.youtube.com/watch?v=JPU1_MNLZ1Y', 'https://img.youtube.com/vi/JPU1_MNLZ1Y/hqdefault.jpg', NULL),
(303, 4, 6, 'Ilegales', 'Sueño Contigo', 'https://www.youtube.com/watch?v=fO9G_o0SOgg', 'https://img.youtube.com/vi/fO9G_o0SOgg/hqdefault.jpg', NULL),
(304, 4, 6, 'Ilegales', 'Como Un Trueno', 'https://www.youtube.com/watch?v=ge67kyM9ELU', 'https://img.youtube.com/vi/ge67kyM9ELU/hqdefault.jpg', NULL),
(305, 4, 6, 'Ilegales', 'Rebotando', 'https://www.youtube.com/watch?v=d_FCOrzQL_U', 'https://img.youtube.com/vi/d_FCOrzQL_U/hqdefault.jpg', NULL),
(306, 4, 6, 'Ilegales', 'El Lobo', 'https://www.youtube.com/watch?v=iD-uge-Stds', 'https://img.youtube.com/vi/iD-uge-Stds/hqdefault.jpg', NULL),
(307, 4, 6, 'Ilegales', 'Dame D Eso', 'https://www.youtube.com/watch?v=JmXb-MndnwM', 'https://img.youtube.com/vi/JmXb-MndnwM/hqdefault.jpg', NULL),
(308, 4, 6, 'Rubby Pérez', 'Buscando Tus Besos', 'https://www.youtube.com/watch?v=StktAMadxvQ', 'https://img.youtube.com/vi/StktAMadxvQ/hqdefault.jpg', NULL),
(309, 4, 6, 'Rubby Pérez', 'Volvere', 'https://www.youtube.com/watch?v=OIq77rWeDYc', 'https://img.youtube.com/vi/OIq77rWeDYc/hqdefault.jpg', NULL),
(310, 4, 6, 'Rubby Pérez', 'cuando estes con el', 'https://www.youtube.com/watch?v=XXqDHmKYrJQ', 'https://img.youtube.com/vi/XXqDHmKYrJQ/hqdefault.jpg', NULL),
(311, 4, 6, 'Rubby Pérez', 'Hipocrecia', 'https://www.youtube.com/watch?v=scg2ptSMUPg', 'https://img.youtube.com/vi/scg2ptSMUPg/hqdefault.jpg', NULL),
(312, 4, 6, 'Rubby Pérez', 'Se fue', 'https://www.youtube.com/watch?v=VFBRlq_gpwA', 'https://img.youtube.com/vi/VFBRlq_gpwA/hqdefault.jpg', NULL),
(313, 4, 6, 'Rubby Pérez', 'Esa Mujer', 'https://www.youtube.com/watch?v=dvmncUN9i8I', 'https://img.youtube.com/vi/dvmncUN9i8I/hqdefault.jpg', NULL),
(314, 4, 6, 'Rubby Pérez', 'sufrir para que', 'https://www.youtube.com/watch?v=Vnp6Z8vgLEc', 'https://img.youtube.com/vi/Vnp6Z8vgLEc/hqdefault.jpg', NULL),
(315, 4, 6, 'Las Chicas del Can', 'Juana la Cubana', 'https://www.youtube.com/watch?v=_gGwBmmnYls', 'https://img.youtube.com/vi/_gGwBmmnYls/hqdefault.jpg', NULL),
(316, 4, 6, 'Las Chicas del Can', 'Celoso', 'https://www.youtube.com/watch?v=y6RgVNxsuMk', 'https://img.youtube.com/vi/y6RgVNxsuMk/hqdefault.jpg', NULL),
(317, 4, 6, 'Las Chicas del Can', 'Las Pequeñas Cosas', 'https://www.youtube.com/watch?v=vrXTkBLBfPA', 'https://img.youtube.com/vi/vrXTkBLBfPA/hqdefault.jpg', NULL),
(318, 4, 6, 'Las Chicas del Can', 'Tas Pillao', 'https://www.youtube.com/watch?v=BMzIUUCvJJQ', 'https://img.youtube.com/vi/BMzIUUCvJJQ/hqdefault.jpg', NULL),
(322, 4, 6, 'Las Chicas del Can', 'Youlin', 'https://www.youtube.com/watch?v=4zqHZnGTSgg', 'https://img.youtube.com/vi/4zqHZnGTSgg/hqdefault.jpg', NULL),
(323, 4, 6, 'Las Chicas del Can', 'Mientras Te Amo', 'https://www.youtube.com/watch?v=D1Bmt-7-Cpw', 'https://img.youtube.com/vi/D1Bmt-7-Cpw/hqdefault.jpg', NULL),
(324, 4, 6, 'Las Chicas del Can', 'El Negro No Puede', 'https://www.youtube.com/watch?v=yGvStabyqIE', 'https://img.youtube.com/vi/yGvStabyqIE/hqdefault.jpg', NULL),
(325, 4, 6, 'Las Chicas del Can', 'Pepe', 'https://www.youtube.com/watch?v=JtWBn4OQwDM', 'https://img.youtube.com/vi/JtWBn4OQwDM/hqdefault.jpg', NULL),
(326, 4, 6, 'Las Chicas del Can', 'Besos Callejeros', 'https://www.youtube.com/watch?v=cCIiTvbIYyI', 'https://img.youtube.com/vi/cCIiTvbIYyI/hqdefault.jpg', NULL),
(327, 4, 6, 'Las Chicas del Can', 'Pegando Fuego', 'https://www.youtube.com/watch?v=aAmhRx_4qGY', 'https://img.youtube.com/vi/aAmhRx_4qGY/hqdefault.jpg', NULL),
(328, 4, 6, 'Las Chicas del Can', 'Fiebre', 'https://www.youtube.com/watch?v=nd_8xui-OL4', 'https://img.youtube.com/vi/nd_8xui-OL4/hqdefault.jpg', NULL),
(329, 4, 6, 'Diveana', 'Papachongo', 'https://www.youtube.com/watch?v=CGqQ53SaTIk', 'https://img.youtube.com/vi/CGqQ53SaTIk/hqdefault.jpg', NULL),
(330, 4, 6, 'Las Chicas del Can', 'SUKAINA', 'https://www.youtube.com/watch?v=kE9du0LXB9U', 'https://img.youtube.com/vi/kE9du0LXB9U/hqdefault.jpg', NULL),
(331, 4, 6, 'Las Chicas del Can', 'Sin Compromiso', 'https://www.youtube.com/watch?v=VbvMhODd9RE', 'https://img.youtube.com/vi/VbvMhODd9RE/hqdefault.jpg', NULL);
INSERT INTO `canciones` (`id`, `idautor`, `idgenero`, `interprete`, `titulo`, `url`, `coverImage`, `duration`) VALUES
(332, 4, 6, 'Las Chicas del Can', 'Culeca', 'https://www.youtube.com/watch?v=3dOIdzCEAaw', 'https://img.youtube.com/vi/3dOIdzCEAaw/hqdefault.jpg', NULL),
(333, 4, 6, 'Las Chicas del Can', 'Hacer El Amor Con Otro', 'https://www.youtube.com/watch?v=3Gb0Tw7gv2o', 'https://img.youtube.com/vi/3Gb0Tw7gv2o/hqdefault.jpg', NULL),
(334, 4, 6, 'Las Chicas del Can', 'TE QUIERO VER', 'https://www.youtube.com/watch?v=LN8UIh_xD_0', 'https://img.youtube.com/vi/LN8UIh_xD_0/hqdefault.jpg', NULL),
(335, 4, 6, 'THE NEW YORK BAND', 'Nadie Como Tú', 'https://www.youtube.com/watch?v=_o5IAbvtkUM', 'https://img.youtube.com/vi/_o5IAbvtkUM/hqdefault.jpg', NULL),
(336, 4, 6, 'THE NEW YORK BAND', 'si tu eres mi hombre y yo tu mujer', 'https://www.youtube.com/watch?v=EPBW5wqtY1o', 'https://img.youtube.com/vi/EPBW5wqtY1o/hqdefault.jpg', NULL),
(337, 4, 6, 'THE NEW YORK BAND', 'Dame Vida', 'https://www.youtube.com/watch?v=erpXblvZeCM', 'https://img.youtube.com/vi/erpXblvZeCM/hqdefault.jpg', NULL),
(338, 4, 6, 'THE NEW YORK BAND', 'Cole', 'https://www.youtube.com/watch?v=xEZ9JyCzIxM', 'https://img.youtube.com/vi/xEZ9JyCzIxM/hqdefault.jpg', NULL),
(339, 4, 6, 'THE NEW YORK BAND', 'Soltera', 'https://www.youtube.com/watch?v=1GqSWB9SMp0', 'https://img.youtube.com/vi/1GqSWB9SMp0/hqdefault.jpg', NULL),
(340, 4, 6, 'THE NEW YORK BAND', 'Dancing Mood', 'https://www.youtube.com/watch?v=tP72HC-bRbY', 'https://img.youtube.com/vi/tP72HC-bRbY/hqdefault.jpg', NULL),
(341, 4, 6, 'Diveana', 'Tus Ojos', 'https://www.youtube.com/watch?v=Ho7sIg1FPwI', 'https://img.youtube.com/vi/Ho7sIg1FPwI/hqdefault.jpg', NULL),
(342, 4, 6, 'Diveana', 'Me Falta Todo', 'https://www.youtube.com/watch?v=Gju4cUIxtxY', 'https://img.youtube.com/vi/Gju4cUIxtxY/hqdefault.jpg', NULL),
(343, 4, 6, 'Diveana', 'Noches de Media Luna', 'https://www.youtube.com/watch?v=5tDJ2c83cFM', 'https://img.youtube.com/vi/5tDJ2c83cFM/hqdefault.jpg', NULL),
(344, 4, 6, 'Diveana', 'Buena Suerte', 'https://www.youtube.com/watch?v=sJqeAt5Cww0', 'https://img.youtube.com/vi/sJqeAt5Cww0/hqdefault.jpg', NULL),
(345, 4, 6, 'Diveana', 'Tengo', 'https://www.youtube.com/watch?v=U-fRnjlCwEQ', 'https://img.youtube.com/vi/U-fRnjlCwEQ/hqdefault.jpg', NULL),
(346, 4, 6, 'Diveana', 'Frìo Y Distante', 'https://www.youtube.com/watch?v=MYzzkPXLFzQ', 'https://img.youtube.com/vi/MYzzkPXLFzQ/hqdefault.jpg', NULL),
(347, 4, 6, 'Diveana', 'Por Que', 'https://www.youtube.com/watch?v=azh17-fCeVs', 'https://img.youtube.com/vi/azh17-fCeVs/hqdefault.jpg', NULL),
(348, 4, 6, 'Diveana', 'Boca Loca', 'https://www.youtube.com/watch?v=Pgfr4T2eSkg', 'https://img.youtube.com/vi/Pgfr4T2eSkg/hqdefault.jpg', NULL),
(349, 4, 6, 'Diveana', 'Furiosa', 'https://www.youtube.com/watch?v=RMjv6j4V7ek', 'https://img.youtube.com/vi/RMjv6j4V7ek/hqdefault.jpg', NULL),
(350, 4, 6, 'Diveana', 'Por Quererte Tanto', 'https://www.youtube.com/watch?v=UaATAfdH1z8', 'https://img.youtube.com/vi/UaATAfdH1z8/hqdefault.jpg', NULL),
(351, 4, 6, 'Diveana', 'Que Rico', 'https://www.youtube.com/watch?v=xveJGRiX0zE', 'https://img.youtube.com/vi/xveJGRiX0zE/hqdefault.jpg', NULL),
(352, 4, 6, 'Diveana', 'Sola', 'https://www.youtube.com/watch?v=n4gEXE5W78s', 'https://img.youtube.com/vi/n4gEXE5W78s/hqdefault.jpg', NULL),
(353, 4, 6, 'Diveana', 'Tabu', 'https://www.youtube.com/watch?v=GPVFNYhU-uA', 'https://img.youtube.com/vi/GPVFNYhU-uA/hqdefault.jpg', NULL),
(354, 4, 6, 'Lisa M', 'Tu Pum Pum', 'https://www.youtube.com/watch?v=rjVsjl6QUi8', 'https://img.youtube.com/vi/rjVsjl6QUi8/hqdefault.jpg', NULL),
(355, 4, 6, 'Lisa M', 'Every body dancing Now', 'https://www.youtube.com/watch?v=xtxVg4RjEas', 'https://img.youtube.com/vi/xtxVg4RjEas/hqdefault.jpg', NULL),
(356, 4, 6, 'Lisa M', 'MENEALO', 'https://www.youtube.com/watch?v=stcF-RiRzZU', 'https://img.youtube.com/vi/stcF-RiRzZU/hqdefault.jpg', NULL),
(357, 4, 6, 'Lisa M', 'Súbeme el Radio', 'https://www.youtube.com/watch?v=QIoHioUGtGM', 'https://img.youtube.com/vi/QIoHioUGtGM/hqdefault.jpg', NULL),
(358, 4, 6, 'Lisa M', 'Ponte el sombrero', 'https://www.youtube.com/watch?v=bbQITiS9C9o', 'https://img.youtube.com/vi/bbQITiS9C9o/hqdefault.jpg', NULL),
(359, 4, 6, 'Lisa M', 'El Bigote', 'https://www.youtube.com/watch?v=zwFD2_vqnQ4', 'https://img.youtube.com/vi/zwFD2_vqnQ4/hqdefault.jpg', NULL),
(360, 4, 6, 'Lisa M', 'Inventes Papito', 'https://www.youtube.com/watch?v=vM3o9JUu8K0', 'https://img.youtube.com/vi/vM3o9JUu8K0/hqdefault.jpg', NULL),
(361, 4, 6, 'Natusha', 'El La Engaño', 'https://www.youtube.com/watch?v=5ad_pksNBAY', 'https://img.youtube.com/vi/5ad_pksNBAY/hqdefault.jpg', NULL),
(362, 4, 6, 'Natusha', 'Sin Ti', 'https://www.youtube.com/watch?v=IsjUTwHgPfc', 'https://img.youtube.com/vi/IsjUTwHgPfc/hqdefault.jpg', NULL),
(363, 4, 6, 'Natusha', 'Rumba Lambada', 'https://www.youtube.com/watch?v=dIppmaaW6m0', 'https://img.youtube.com/vi/dIppmaaW6m0/hqdefault.jpg', NULL),
(364, 4, 6, 'Natusha', 'Tu La Tienes Que Pagar', 'https://www.youtube.com/watch?v=eRTeYqw781E', 'https://img.youtube.com/vi/eRTeYqw781E/hqdefault.jpg', NULL),
(365, 4, 6, 'Natusha', 'Camaleón', 'https://www.youtube.com/watch?v=65bvcvG5AEQ', 'https://img.youtube.com/vi/65bvcvG5AEQ/hqdefault.jpg', NULL),
(366, 4, 6, 'Natusha', 'Dame un Besito', 'https://www.youtube.com/watch?v=hvgwPWYmdUs', 'https://img.youtube.com/vi/hvgwPWYmdUs/hqdefault.jpg', NULL),
(367, 4, 6, 'Natusha', 'Sombras', 'https://www.youtube.com/watch?v=ScP8ihaWC3E', 'https://img.youtube.com/vi/ScP8ihaWC3E/hqdefault.jpg', NULL),
(368, 4, 6, 'Natusha', 'El meneíto', 'https://www.youtube.com/watch?v=ran1oh7Bmc0', 'https://img.youtube.com/vi/ran1oh7Bmc0/hqdefault.jpg', NULL),
(369, 4, 6, 'Lisa M', 'SEGUNDA CITA', 'https://www.youtube.com/watch?v=MYssmS6vLKo', 'https://img.youtube.com/vi/MYssmS6vLKo/hqdefault.jpg', NULL),
(370, 4, 13, 'Vico C', 'Me acuerdo', 'https://www.youtube.com/watch?v=0CCEi4VDUZM', 'https://img.youtube.com/vi/0CCEi4VDUZM/hqdefault.jpg', NULL),
(371, 4, 13, 'Vico C', 'Lo Grande Que Es Perdonar', 'https://www.youtube.com/watch?v=_kzbd56qpf8', 'https://img.youtube.com/vi/_kzbd56qpf8/hqdefault.jpg', NULL),
(372, 4, 13, 'Vico C', 'Desahogo', 'https://www.youtube.com/watch?v=It6BDtMFg0Y', 'https://img.youtube.com/vi/It6BDtMFg0Y/hqdefault.jpg', NULL),
(373, 4, 13, 'Vico C', 'Quieren', 'https://www.youtube.com/watch?v=CY3e72rgUzY', 'https://img.youtube.com/vi/CY3e72rgUzY/hqdefault.jpg', NULL),
(374, 4, 13, 'Vico C', 'Dandote Vida', 'https://www.youtube.com/watch?v=N_pdOM6W9sI', 'https://img.youtube.com/vi/N_pdOM6W9sI/hqdefault.jpg', NULL),
(375, 4, 13, 'Vico C', 'Yerba Mala', 'https://www.youtube.com/watch?v=SpOjoUXNiAU', 'https://img.youtube.com/vi/SpOjoUXNiAU/hqdefault.jpg', NULL),
(376, 4, 13, 'Vico C', 'Tony Presidio', 'https://www.youtube.com/watch?v=knggwDbB9gE', 'https://img.youtube.com/vi/knggwDbB9gE/hqdefault.jpg', NULL),
(377, 4, 13, 'Vico C', 'Aquel Que Habia Muerto', 'https://www.youtube.com/watch?v=xXeAu7CcPLM', 'https://img.youtube.com/vi/xXeAu7CcPLM/hqdefault.jpg', NULL),
(378, 4, 13, 'Vico C', '5 De Septiembre', 'https://www.youtube.com/watch?v=MpRbXiYSsC8', 'https://img.youtube.com/vi/MpRbXiYSsC8/hqdefault.jpg', NULL),
(379, 4, 13, 'Vico C', 'Pregúntale a Tu Papá Por Mi', 'https://www.youtube.com/watch?v=bZ5hZMc5uOQ', 'https://img.youtube.com/vi/bZ5hZMc5uOQ/hqdefault.jpg', NULL),
(380, 4, 13, 'Vico C', 'Voy', 'https://www.youtube.com/watch?v=lSrJaBhu5vE', 'https://img.youtube.com/vi/lSrJaBhu5vE/hqdefault.jpg', NULL),
(381, 4, 13, 'Vico C', 'Se Escaman', 'https://www.youtube.com/watch?v=WQ6r5rV0oQI', 'https://img.youtube.com/vi/WQ6r5rV0oQI/hqdefault.jpg', NULL),
(382, 4, 13, 'Vico C', 'La vecinita', 'https://www.youtube.com/watch?v=0cR8XCftyXc', 'https://img.youtube.com/vi/0cR8XCftyXc/hqdefault.jpg', NULL),
(383, 4, 13, 'Vico C', 'El bueno el malo y el feo', 'https://www.youtube.com/watch?v=L5Ws7pKWOVw', 'https://img.youtube.com/vi/L5Ws7pKWOVw/hqdefault.jpg', NULL),
(384, 4, 13, 'Vico C', 'Bomba para afincar', 'https://www.youtube.com/watch?v=P48-JZu4Fvc', 'https://img.youtube.com/vi/P48-JZu4Fvc/hqdefault.jpg', NULL),
(385, 4, 13, 'Vico C', 'Mendigo', 'https://www.youtube.com/watch?v=14oU3vuRpo8', 'https://img.youtube.com/vi/14oU3vuRpo8/hqdefault.jpg', NULL),
(386, 4, 13, 'Vico C', 'Babilla', 'https://www.youtube.com/watch?v=YUKG8LdOPT0', 'https://img.youtube.com/vi/YUKG8LdOPT0/hqdefault.jpg', NULL),
(387, 4, 13, 'Vico C', 'En Honor A La Verdad', 'https://www.youtube.com/watch?v=oUBzyRbfygc', 'https://img.youtube.com/vi/oUBzyRbfygc/hqdefault.jpg', NULL),
(388, 13, 1, 'Gorillaz', 'On melancholy Hill', 'https://www.youtube.com/watch?v=c58r3x9o6B0&list=RDc58r3x9o6B0&start_radio=1', 'https://img.youtube.com/vi/c58r3x9o6B0/hqdefault.jpg', NULL),
(389, 13, 1, 'Alfa', 'Il filo rosso', 'https://www.youtube.com/watch?v=jYcaxxbiwUo', 'https://img.youtube.com/vi/jYcaxxbiwUo/hqdefault.jpg', NULL),
(390, 9, 10, 'Aditus', 'Cada minuto cada hora', 'https://www.youtube.com/watch?v=xKyaYwldbVw', 'https://img.youtube.com/vi/xKyaYwldbVw/hqdefault.jpg', NULL),
(391, 4, 12, 'Shakira', 'Soltera', 'https://www.youtube.com/watch?v=oBofuVYDoG4', 'https://img.youtube.com/vi/oBofuVYDoG4/hqdefault.jpg', NULL),
(392, 4, 16, 'Romeo Santos', 'Propuesta Indecente (Official Video)', 'https://www.youtube.com/watch?v=QFs3PIZb3js', 'https://img.youtube.com/vi/QFs3PIZb3js/hqdefault.jpg', NULL),
(393, 4, 16, 'Aventura', 'Dime si te gusto', 'https://www.youtube.com/watch?v=rSsKNgcKlAs', 'https://img.youtube.com/vi/rSsKNgcKlAs/hqdefault.jpg', NULL),
(394, 4, 3, 'Oscar de Leon', 'Yo Quisiera saber', 'https://www.youtube.com/watch?v=hJjGZwFj7xE', 'https://img.youtube.com/vi/hJjGZwFj7xE/hqdefault.jpg', NULL),
(395, 4, 8, 'El Cazador Novato', 'El Yerbatero', 'https://www.youtube.com/watch?v=SaBoNNygHpc&ab_channel=ElCazadorNovato-Topic', 'https://img.youtube.com/vi/SaBoNNygHpc/hqdefault.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `id` int NOT NULL,
  `autor` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`id`, `autor`, `nombre`, `fecha`, `descripcion`, `imagen`) VALUES
(1, '', '33', '2024-09-29', '3333', '927d537c7e13d5d8183d3b1dc99a393f.jpg'),
(2, '', '33', '2024-09-29', '3333', 'c280075f9c59b3b95436c19f29a692ff.jpg'),
(3, '', 'prueba 1', '2024-09-29', 'esta es una prueba', '2ab00cc0fbc0257e4119cc59f04f07ba.jpg'),
(4, 'Nelida', '2232323', '2024-10-07', '23232323', 'e916b5bd546d355292b6b48d3b58b94c.jpg'),
(5, 'Nelida', '323', '2024-10-20', '232323', 'b4591bb0cf8711a2ea1bcd39ff717bb0.jpg'),
(6, 'Nelida', 'prueba', '2024-10-27', 'prueba', 'cffd5ae60f0abde9e50a409fd7af5f39.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(30, '23d23d23233'),
(16, 'Bachata33'),
(14, 'Changa'),
(10, 'Chatarrita Esp'),
(9, 'Chatarrita Ing'),
(18, 'clasicas'),
(7, 'Gaita'),
(11, 'Latino'),
(8, 'Llaneras'),
(15, 'Mariachi'),
(6, 'Merengue'),
(1, 'Pop'),
(17, 'prueba'),
(13, 'Rap/Hip Hop'),
(4, 'Reggae'),
(12, 'Reguetón'),
(2, 'Rock'),
(5, 'Romántica'),
(3, 'Salsa'),
(26, 'wewewew');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reproducciones`
--

CREATE TABLE `reproducciones` (
  `id` int NOT NULL,
  `cancion` varchar(50) NOT NULL,
  `contador` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `reproducciones`
--

INSERT INTO `reproducciones` (`id`, `cancion`, `contador`) VALUES
(1, 'Luis Silva', 1),
(2, 'Kany García, Alejandro Sanz', 1),
(3, 'Tony Braxton', 11),
(5, 'Simón Díaz', 1),
(6, 'Unbreak My Heart', 17),
(7, 'Sting And Shaggy w', 5),
(8, 'Daiquirí', 7),
(9, 'Sting', 10),
(10, 'Ana y Víctor', 2),
(11, 'Lo Grande Que Es Perdonar', 4),
(12, 'Agua Que No Has de Beber', 1),
(13, 'Chamo Candela', 5),
(14, 'Air Supply', 1),
(16, 'Cóncavo y convexo', 3),
(17, 'Despacito', 3),
(18, 'Hoy Vamos a Salir', 1),
(19, 'Manantial de corazón', 2),
(20, 'SELVA', 2),
(21, 'Heal the World', 4),
(22, 'Flowers', 4),
(23, 'Ga ga', 4),
(24, 'Nothing', 4),
(25, 'Disfruto', 8),
(26, 'Delilah on The Ed Sullivan Show', 1),
(27, 'Tonada del Cabestrero', 2),
(28, 'Just the Two of Us', 2),
(29, 'Persona Ideal', 2),
(30, 'Arrepentida', 2),
(31, 'No Podrás', 4),
(32, 'Robando Azules', 1),
(33, 'Shallow from A Star Is Born', 1),
(34, 'Madre', 1),
(35, 'La Movida', 2),
(36, 'Buscando Tus Besos', 1),
(37, 'Homenaje A Papo', 4),
(38, 'Bueno Pa Goza', 7),
(39, 'Mueve Mueve', 2),
(40, 'Pegando Fuego', 1),
(41, 'Hablar de ti', 2),
(42, 'Extranjero', 4),
(43, 'Dame un Besito', 1),
(44, 'El meneíto', 2),
(45, 'Sombras', 2),
(46, 'Cuarto De Hotel', 3),
(47, 'Tan Interesada', 1),
(48, 'La Hora De Bailar', 2),
(49, 'Ponte el sombrero', 1),
(50, 'Tu Pum Pum', 2),
(51, 'Esta PEGAO', 3),
(52, 'Nadie Como Tú', 2),
(53, '5 De Septiembre', 1),
(54, 'Tony Presidio', 1),
(55, 'Al Norte del Sur', 4),
(56, 'Traigo una Pena', 4),
(57, 'TE QUIERO VER', 1),
(58, 'Juana la Cubana', 1),
(59, 'Culeca', 1),
(60, 'La Chica Sexy', 1),
(61, 'Desahogo', 1),
(62, 'Se fue', 1),
(63, 'Hipocrecia', 1),
(64, 'cuando estes con el', 1),
(65, 'Volvere', 1),
(66, 'Dame Vida', 1),
(67, 'si tu eres mi hombre y yo tu mujer', 1),
(68, 'Cole', 1),
(69, 'On melancholy Hill', 12),
(70, 'Perfect', 1),
(71, 'Non è mai abbastanza', 1),
(72, 'Hasta la Raíz', 3),
(73, '25 Horas', 2),
(74, 'Starlight', 2),
(75, 'Sin Ti', 2),
(76, 'Volare', 2),
(77, 'Più Bella Cosa', 2),
(78, 'La Bilirrubina', 2),
(79, 'Beautiful Things', 2),
(80, 'I\'ll Go Crazy If I Don\'t Go Crazy Tonight', 1),
(81, 'Catch & Release (Deepend Remix)', 2),
(82, 'Por Que', 1),
(83, 'Tiny Desk (Home) Concert', 2),
(84, 'NPR Music Tiny Desk Concert', 3),
(85, 'Best Songs Of All Time', 1),
(86, 'Perla Negra', 1),
(87, 'Calma', 1),
(88, 'Noches de Fantasía', 1),
(89, 'En El Muelle De San Blás', 1),
(90, 'La Quiero a Morir', 1),
(91, 'Procura', 1),
(92, 'Arráncame', 1),
(93, 'Earth song', 6),
(94, 'Deseos de cosas imposibles', 2),
(95, 'No sé por qué te quiero', 2),
(96, 'Muero', 1),
(97, 'Woman In Love', 4),
(98, 'My Endless Love', 1),
(99, 'Lady', 1),
(100, 'I Have Nothing', 1),
(101, 'Right Here Waiting', 1),
(102, 'Hard To Say Im Sorry', 4),
(103, 'In The End', 1),
(104, 'Caballo Viejo', 3),
(105, 'Hotel California', 1),
(106, 'Contrapunteo', 3),
(107, 'Baby Can I Hold You', 3),
(108, 'El Loco Juan Carabina', 2),
(109, 'Arbolito Sabanero|Clavelito Colorado', 3),
(110, 'En Honor A La Verdad', 5),
(111, 'Mendigo', 2),
(112, 'Cálido y Frío', 8),
(113, 'Quien Lo Iba A Saber', 5),
(114, 'Ella Esta Loca por Mi', 5),
(115, 'Yo Te Diré', 2),
(116, 'DPM De Pxta Madre', 2),
(117, 'UWAIE (You Are Welcome To My Eye)', 1),
(118, 'Binikini', 1),
(119, 'ME LO MEREZCO', 1),
(120, 'La Cima del Cielo', 1),
(121, 'Mi Primer Millon', 1),
(122, 'Il filo rosso', 6),
(123, 'Te Veo Venir Soledad', 4),
(124, 'Ya lo habia vivido', 4),
(125, 'Babilla', 2),
(126, 'Pregúntale a Tu Papá Por Mi', 1),
(127, 'No Lo Había Pensado', 4),
(128, 'Los Hijos De La Oscuridad', 3),
(129, 'Y Te Pienso', 3),
(130, 'Aquí Estas Otra Vez', 3),
(131, 'Barco A La Deriva', 3),
(132, 'Sexo', 3),
(133, 'Contra Vientos Y Mareas', 3),
(134, 'Que No Muera La Esperanza', 3),
(135, 'Sólo Importas Tú', 3),
(136, 'Esta Vez', 3),
(137, 'Si Tú No Estás', 3),
(138, 'Fuera De Este Mundo', 3),
(139, 'Mi Amigo Sebastian', 3),
(140, 'UN BUEN PERDEDOR', 6),
(141, 'Latino', 3),
(142, 'Cada minuto cada hora', 12),
(143, 'Y Tú Te Vas', 3),
(144, 'Tengo', 3),
(145, 'A Medio Vivir', 3),
(146, 'Será', 3),
(147, 'Dónde Está El Amor', 3),
(148, 'Te Amo', 3),
(149, 'Cuando Tus Ojos Me Miran', 3),
(150, 'Si La Ves', 6),
(151, 'Louis', 3),
(152, 'Te Pienso Sin Querer', 3),
(153, 'No Basta', 3),
(154, 'Tú De Que Vas', 3),
(155, 'El Becerrito', 2),
(156, 'Cruel Decisión', 3),
(157, 'Soltera', 5),
(158, 'Propuesta Indecente (Official Video)', 5),
(159, 'Dime si te gusto', 2),
(160, 'Yo Quisiera saber', 4),
(161, 'Búscame', 2),
(162, 'Bomba para afincar', 2),
(163, 'El bueno el malo y el feo', 3),
(164, 'SEGUNDA CITA', 2),
(165, 'Every body dancing Now', 1),
(166, 'Tabu', 1),
(167, 'Sola', 3),
(168, 'Que Rico', 1),
(169, 'Noches de Media Luna', 1),
(170, 'Tus Ojos', 1),
(171, 'Me Falta Todo', 1),
(172, 'ENAMORAMIENTO', 1),
(173, 'Pa Que Te Acuerdes de Mi', 1),
(174, 'Pesadilla Entre Las Flores', 1),
(175, 'La Caída de un Cristal', 1),
(176, 'Big In Japan', 1),
(177, 'Making Love out nothing at all', 1),
(178, 'Say You Say Me', 3),
(179, 'Lúcete', 4),
(180, 'LAS 40 MÁS ESCUCHADAS', 3),
(181, 'El Yerbatero', 2),
(182, 'Todo Este Campo Es Mío', 1),
(183, 'Tonada De Las Espigas', 1),
(184, 'Mi Querencia', 1),
(185, 'Sabana', 1),
(186, 'Garcita', 1),
(187, 'Tonada Del Tormento', 1),
(188, 'Al Niño Jesús Llanero', 1),
(189, 'Pasaje Del Olvido', 1),
(190, 'El Alcaraván', 1),
(191, 'Venezuela', 1),
(192, 'Se Escaman', 1),
(193, 'Dame una Oportunidad', 1),
(194, 'Amiga', 1),
(195, 'Fanático', 1),
(196, 'Corazón, Corazón', 1),
(197, 'Dame Un Poco Más', 1),
(198, 'Cuerpo Sin Alma', 1),
(199, 'Me Tengo Que Ir', 1),
(200, 'Hoy Aprendí', 1),
(201, 'Se Acabó el Amor', 1),
(202, 'Recuerdos', 1),
(203, 'Aquel Lugar', 1),
(204, 'Te Soñé', 1),
(205, 'Chicas De Revista', 1),
(206, 'Ley De Newton', 1),
(207, 'El Menú', 1),
(208, 'Aviso Importante', 1),
(209, 'Si Me Dejas Ahora', 1),
(210, 'Rumba en mi Corazón', 1),
(211, 'SUMMER LIVE', 3),
(212, 'Huelepega', 1),
(213, 'Aquel Que Habia Muerto', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Operador'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitantes`
--

CREATE TABLE `visitantes` (
  `ip` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `ultima_actividad` datetime DEFAULT CURRENT_TIMESTAMP,
  `numvisitas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `visitantes`
--

INSERT INTO `visitantes` (`ip`, `fecha`, `pais`, `ciudad`, `ultima_actividad`, `numvisitas`) VALUES
('101.142.242.225', '2024-10-17 18:11:55', 'Japan', 'Ōtsu', '2024-10-19 10:09:20', 4),
('106.133.96.183', '2024-10-10 08:30:51', 'Japan', 'Osaka', '2024-10-10 08:31:05', 4),
('106.133.98.211', '2024-10-09 18:27:10', 'Japan', 'Osaka', '2024-10-09 18:47:47', 2),
('106.146.72.169', '2024-10-07 18:12:16', 'Japan', 'Osaka', '2024-10-07 19:13:07', 4),
('106.146.73.145', '2024-10-07 16:11:20', 'Japan', 'Osaka', '2024-10-07 16:11:53', 2),
('106.146.81.181', '2024-10-16 23:08:10', 'Japan', 'Chiyoda', '2024-10-16 23:08:14', 2),
('106.146.83.4', '2024-10-17 07:24:26', 'Japan', 'Chiyoda', '2024-10-17 07:24:26', 1),
('106.146.84.125', '2024-10-09 02:02:15', 'Japan', 'Konan', '2024-10-09 02:03:46', 5),
('106.146.86.208', '2024-10-08 18:23:55', 'Japan', 'Ōyama', '2024-10-08 18:23:55', 1),
('106.146.87.239', '2024-10-20 18:48:05', 'Japan', 'Chiyoda', '2024-10-20 18:48:05', 1),
('138.84.33.104', '2024-10-09 07:02:49', 'Chile', 'Santiago', '2024-10-09 10:48:53', 2),
('138.84.33.12', '2024-10-17 06:33:19', 'Chile', 'Santiago', '2024-10-17 06:33:19', 1),
('138.84.33.221', '2024-10-10 06:43:22', 'Chile', 'Santiago', '2024-10-10 10:24:14', 3),
('138.84.33.58', '2024-10-11 06:50:18', 'Chile', 'Santiago', '2024-10-14 06:48:20', 4),
('138.84.34.68', '2024-10-18 06:59:04', 'Chile', 'Santiago', '2024-10-21 06:49:08', 2),
('138.84.35.66', '2024-10-16 07:01:15', 'Chile', 'Santiago', '2024-10-16 07:20:18', 2),
('138.84.35.96', '2024-10-08 16:53:59', 'Chile', 'Santiago', '2024-10-08 16:53:59', 1),
('175.132.158.110', '2024-10-07 16:45:47', 'Japan', 'Takasago', '2024-10-08 08:56:54', 2),
('179.60.69.153', '2024-10-07 13:07:06', 'Chile', 'Santiago', '2024-10-15 12:48:38', 13),
('18.217.208.164', '2024-10-21 14:06:46', 'United States', 'Dublin', '2024-10-21 14:11:12', 2),
('186.156.240.182', '2024-10-10 19:39:51', 'Chile', 'Santiago', '2024-10-16 06:11:36', 21),
('186.167.213.66', '2024-10-20 19:27:15', 'Venezuela', 'San Carlos del Zulia', '2024-10-20 19:27:15', 1),
('186.185.139.177', '2024-10-17 13:40:42', 'Venezuela', 'Barquisimeto', '2024-10-17 13:40:42', 1),
('186.189.100.184', '2024-10-08 13:45:39', 'Chile', 'Santiago', '2024-10-08 23:03:04', 2),
('186.189.78.228', '2024-10-07 15:33:52', 'Chile', 'Santiago', '2024-10-07 15:33:52', 1),
('186.24.172.216', '2024-10-17 13:41:23', 'Venezuela', 'Barquisimeto', '2024-10-17 13:41:23', 1),
('190.120.248.230', '2024-10-12 08:27:39', 'Venezuela', 'Valencia', '2024-10-20 01:32:07', 12),
('190.120.249.66', '2024-10-16 08:51:06', 'Venezuela', 'Valencia', '2024-10-16 08:51:06', 1),
('190.142.251.52', '2024-10-07 11:55:44', 'Venezuela', 'Valencia', '2024-10-21 16:51:02', 258),
('190.199.226.44', '2024-10-07 21:41:53', 'Venezuela', 'Caracas', '2024-10-08 20:31:15', 8),
('190.199.230.37', '2024-10-09 20:10:11', 'Venezuela', 'Caracas', '2024-10-09 20:10:11', 1),
('190.205.250.51', '2024-10-11 14:42:46', 'Venezuela', 'Valencia', '2024-10-11 14:42:46', 1),
('190.22.133.105', '2024-10-08 17:53:40', 'Chile', 'Santiago', '2024-10-11 13:52:19', 9),
('190.22.140.113', '2024-10-17 14:11:16', 'Chile', 'Santiago', '2024-10-17 14:11:16', 1),
('190.45.168.31', '2024-10-09 18:54:01', 'Chile', 'Santiago', '2024-10-20 12:48:17', 4),
('200.112.22.99', '2024-10-09 13:40:15', 'Chile', 'Santiago', '2024-10-10 11:42:29', 3),
('200.112.24.30', '2024-10-14 09:40:14', 'Chile', 'Santiago', '2024-10-14 17:21:53', 2),
('200.112.30.182', '2024-10-15 12:19:49', 'Chile', 'Santiago', '2024-10-16 16:44:29', 37),
('200.82.174.53', '2024-10-11 09:10:26', 'Venezuela', 'Ciudad Ojeda', '2024-10-11 09:10:26', 1),
('200.90.68.133', '2024-10-17 20:28:13', 'Venezuela', 'Caracas', '2024-10-20 12:00:06', 5),
('200.93.6.46', '2024-10-08 21:32:15', 'Venezuela', 'Caracas', '2024-10-17 19:23:40', 20),
('201.214.114.35', '2024-10-08 04:56:21', 'Chile', 'Viña del Mar', '2024-10-08 04:56:21', 1),
('38.156.230.197', '2024-10-15 21:17:26', 'Colombia', 'Medellín', '2024-10-16 02:22:45', 2),
('38.41.9.18', '2024-10-18 09:55:08', 'Venezuela', 'Anaco', '2024-10-18 09:55:08', 1),
('45.164.239.20', '2024-10-07 12:05:22', 'Mexico', 'Ciudad Mante', '2024-10-19 16:48:48', 48),
('58.70.193.211', '2024-10-07 12:10:34', 'Japan', 'Shiga', '2024-10-17 07:47:32', 9),
('58.70.91.228', '2024-10-20 03:10:14', 'Japan', 'Hikone', '2024-10-20 03:10:14', 1),
('61.25.140.122', '2024-10-13 03:48:07', 'Japan', 'Tokyo', '2024-10-13 03:48:07', 1),
('65.49.248.23', '2024-10-07 12:32:24', 'United States', 'Portage', '2024-10-07 21:02:38', 1),
('66.249.83.100', '2024-10-07 22:18:15', 'United States', 'Mountain View', '2024-10-07 22:18:15', 1),
('66.249.83.99', '2024-10-11 14:42:50', 'United States', 'Mountain View', '2024-10-19 18:42:30', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` int NOT NULL,
  `views` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `views`) VALUES
(1, 538);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `reproducciones`
--
ALTER TABLE `reproducciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitantes`
--
ALTER TABLE `visitantes`
  ADD PRIMARY KEY (`ip`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `canciones`
--
ALTER TABLE `canciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reproducciones`
--
ALTER TABLE `reproducciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
