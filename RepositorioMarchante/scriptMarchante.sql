-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2025 a las 15:04:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombre`) VALUES
(1, 'Ciencia Ficción'),
(2, 'Fantasía'),
(3, 'Manga'),
(4, 'Bibliografía'),
(5, 'Poesía'),
(6, 'Terror'),
(7, 'Misterio'),
(8, 'Romance'),
(9, 'Históricos'),
(10, 'Aventura'),
(11, 'Realismo mágico'),
(12, 'Divulgación científica'),
(13, 'Filosofía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fechaCreacion` datetime DEFAULT current_timestamp(),
  `editorial` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idLibro`, `titulo`, `fechaCreacion`, `editorial`, `descripcion`, `foto`, `idCategoria`) VALUES
(5, 'Orgullo y prejuicio', '2025-02-01 13:09:38', 'Secker &amp; Warburg', 'Historia de amor y conflictos sociales entre Elizabeth Bennet y Mr. Darcy.', '1738411778_orgulloyprejuicio.jpg', 8),
(6, 'Harry Potter y la piedra filosofal', '2025-02-01 17:33:07', 'Bloomsbury', 'Un niño descubre su legado mágico y asiste a la escuela Hogwarts.', '1738427587_descarga.jpg', 2),
(9, 'Crónica del pájaro que da cuerda al mundo', '2025-02-03 20:34:15', 'Tusquets Editores', 'Historia surrealista sobre un hombre que busca a su esposa y su gato perdido.', '1738611255_f419014f854396ab82722b492b8ae629_XXL.jpg', 11),
(10, '1984', '2025-02-04 12:00:28', 'Secker &amp; Warburg', 'Distopía sobre un régimen totalitario y vigilancia masiva.', '1738666855_1984.jpg', 1),
(11, 'El código Da Vinci', '2025-02-04 12:02:08', 'Doubleday', 'Thriller que combina arte, religión y conspiración.', '1738666928_davinci.jpg', 7),
(12, 'Los juegos del hambre', '2025-02-04 12:03:19', 'Scholastic', 'En un futuro distópico, adolescentes luchan a muerte en un reality show.', '1738666999_71BUB4ubNEL._UF1000,1000_QL80_.jpg', 1),
(13, 'El nombre del viento', '2025-02-04 12:04:48', 'DAW Books', 'Relato de la vida del legendario mago Kvothe, desde su infancia hasta la fama', '1738667088_elnombredelviento.jpg', 9),
(14, 'El alquimista', '2025-02-04 12:05:49', 'HarperCollins', 'Un pastor viaja en busca de un tesoro y descubre el lenguaje del universo.', '1738667149_elalquimista.jpg', 13),
(15, 'Asesino de brujas', '2025-02-10 19:24:19', 'Puck', 'La historia sigue a Louise le Blanc, una joven bruja que, tras huir de su aquelarre, se refugia en la ciudad de Cesarine, renunciando a la magia y sobreviviendo como ladrona. En Cesarine, las brujas son temidas y perseguidas por los chasseurs, cazadores de la Iglesia dedicados a erradicarlas. Lou se ve obligada a casarse con Reid Diggory, el capitán de los chasseurs, quien desconoce la verdadera identidad de Lou. Esta unión forzada pone a prueba sus creencias y sentimientos, mientras Lou lucha por mantener su secreto y Reid enfrenta sus propios prejuicios.', '1739211859_LibroAsesinoBrujas.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `devuelto` tinyint(1) DEFAULT 0,
  `fecha_prestamo` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idPrestamo`, `idLibro`, `idUsuario`, `devuelto`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(6, 10, 2, 0, '2025-02-04 18:57:25', '2025-02-04 18:57:25'),
(7, 6, 7, 1, '2025-02-10 19:26:00', '2025-02-10 19:26:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha_reserva` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `idLibro`, `idUsuario`, `fecha_reserva`) VALUES
(10, 14, 3, '2025-02-04 18:50:02'),
(11, 9, 2, '2025-02-04 18:50:22'),
(15, 13, 6, '2025-02-10 19:16:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `fotoDNI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `email`, `password`, `admin`, `fotoDNI`) VALUES
(1, 'admin@gmail.com', '$2y$10$3hLCfA0TadBt71B02ZrMo.zbORrF/axnWBzXWiDU3oED5VpA2XRxm', 1, ''),
(2, 'pablo@gmail.com', '$2y$10$3hLCfA0TadBt71B02ZrMo.zbORrF/axnWBzXWiDU3oED5VpA2XRxm', 0, 'adfqsdf'),
(3, 'andres@gmail.com', '$2y$10$UKuAaIBItAEMU7Y6.Jrxj.NVnUWS0CZokF8EmwolG2AGGgIWri6La', 0, '1738598453_modelo_relacional_bar.png'),
(4, 'dory@gmail.com', '$2y$10$ao/PHIMMc2E.N8Cs/lAi4uBtz7KCbWkGz7CVlZAAPVBSqjlDOdnQq', 0, '1738599042_9788437604947-cien-anos-de-soledad.jpg'),
(5, 'isa@gmail.com', '$2y$10$1QqNT42hnZTR4s.dFceClOpuACfkbeEl6P/O/1u4CsRp6UnYUfC5G', 0, '1738927887_Marchante de libros.jpeg'),
(6, 'ejemplo@gmail.com', '$2y$10$GOpOHSJ62UMgFmc2ZNYPKeG7FR.itLStMOiCn.yS0qUL5huNaAF3m', 0, '1739211276_FotoDNI.jpg'),
(7, 'ejemplo1@gmail.com', '$2y$10$WjfcQIQDOlQoq1rUSDkHf.MX0HWuJa8nA3zwYzdNNI.IAec89EyUO', 0, '1739211630_FotoDNI.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idLibro`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `idLibro` (`idLibro`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD UNIQUE KEY `idLibro` (`idLibro`,`idUsuario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
