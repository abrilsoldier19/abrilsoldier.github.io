-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 07:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemaalumnos9`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `IdAlumnos` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `materia` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `maestro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `semestre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `calificacion_final` double NOT NULL,
  `carrera` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`IdAlumnos`, `nombre`, `correo`, `materia`, `maestro`, `semestre`, `calificacion_final`, `carrera`) VALUES
(1, 'Abril Mejia Rangel', 'avril.rock1471@gmail.com', 'Redes', 'Aguilar Covarrubias Norma Aracely', '2do Semestre', 9, 'Ing. Informática'),
(2, 'Abril Mejia Rangel', 'avril.rock1471@gmail.com', 'Base De Datos', 'Aldape Suárez Miguel', '2do Semestre', 8.4166666666667, 'Ing. Informática'),
(4, 'Luis', 'luis19@outlook.com', 'Programación Orientada A Objetos', 'Aguilera Mancilla Héctor', '2do Semestre', 8, '	\r\nIng. Informática');

-- --------------------------------------------------------

--
-- Table structure for table `alumno_reprobados`
--

CREATE TABLE `alumno_reprobados` (
  `IdAlumno_reprobados` bigint(20) UNSIGNED NOT NULL,
  `Alumno_id` bigint(20) UNSIGNED NOT NULL,
  `Materia_id` bigint(20) UNSIGNED NOT NULL,
  `Calif_Final_id` bigint(20) UNSIGNED NOT NULL,
  `Maestro_id` bigint(20) UNSIGNED NOT NULL,
  `Semestre_id` bigint(20) UNSIGNED NOT NULL,
  `Año_id` bigint(20) UNSIGNED NOT NULL,
  `carrera_id` bigint(20) UNSIGNED NOT NULL,
  `turnos` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `salones` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumno_reprobados`
--

INSERT INTO `alumno_reprobados` (`IdAlumno_reprobados`, `Alumno_id`, `Materia_id`, `Calif_Final_id`, `Maestro_id`, `Semestre_id`, `Año_id`, `carrera_id`, `turnos`, `salones`) VALUES
(1, 8, 1, 39, 1, 2, 1, 1, 'Matutino', 'Salon A'),
(2, 6, 2, 38, 38, 2, 1, 1, 'Matutino', 'Salon B'),
(3, 1, 87, 72, 72, 1, 1, 5, 'Matutino', 'Salon A');

-- --------------------------------------------------------

--
-- Table structure for table `archivos`
--

CREATE TABLE `archivos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Alumno_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archivos`
--

INSERT INTO `archivos` (`id`, `Alumno_id`, `file_path`, `created_at`, `updated_at`) VALUES
(21, 6, 'Abril_Mejia_Rangel_19052155.pdf', '2023-06-08 23:30:36', '2023-06-09 04:40:08'),
(23, 2, 'Jesus_22054456.pdf', '2023-06-08 23:30:47', '2023-06-09 04:47:27'),
(24, 2, 'Jesus_22054456.pdf', '2023-06-09 05:37:38', '2023-06-09 05:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `año_semestres`
--

CREATE TABLE `año_semestres` (
  `IdAño_semestres` bigint(20) UNSIGNED NOT NULL,
  `Año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `año_semestres`
--

INSERT INTO `año_semestres` (`IdAño_semestres`, `Año`) VALUES
(1, '2022'),
(2, '2023');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(191) NOT NULL,
  `contenido` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `titulo`, `contenido`, `created_at`, `updated_at`) VALUES
(1, 'Hola', 'Nota admin', '2023-04-13 13:18:31', '2023-04-13 13:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `calificacions`
--

CREATE TABLE `calificacions` (
  `IdCalificacions` bigint(20) UNSIGNED NOT NULL,
  `Alumno_id` bigint(20) UNSIGNED NOT NULL,
  `Materia_id` bigint(20) UNSIGNED NOT NULL,
  `comentarios` text DEFAULT NULL,
  `U1` double NOT NULL,
  `U2` double NOT NULL,
  `U3` double NOT NULL,
  `U4` double NOT NULL,
  `U5` double NOT NULL,
  `U6` double NOT NULL,
  `U7` double NOT NULL,
  `U8` double NOT NULL,
  `U9` double NOT NULL,
  `U10` double NOT NULL,
  `U11` double NOT NULL,
  `U12` double NOT NULL,
  `Calificacion_Final` double NOT NULL,
  `Semester` varchar(191) NOT NULL,
  `Maestro` varchar(191) NOT NULL,
  `Añosemestre` year(4) NOT NULL,
  `Carrera_id` bigint(20) UNSIGNED NOT NULL,
  `turno` varchar(255) NOT NULL,
  `salon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `calificacions`
--

INSERT INTO `calificacions` (`IdCalificacions`, `Alumno_id`, `Materia_id`, `comentarios`, `U1`, `U2`, `U3`, `U4`, `U5`, `U6`, `U7`, `U8`, `U9`, `U10`, `U11`, `U12`, `Calificacion_Final`, `Semester`, `Maestro`, `Añosemestre`, `Carrera_id`, `turno`, `salon`) VALUES
(1, 6, 1, 'buena', 9, 9, 8, 8, 8, 8, 0, 0, 0, 0, 0, 0, 8.3333333333333, '2do Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon D'),
(37, 6, 9, 'excelente', 9, 6, 7, 7, 6, 6, 8, 8, 6, 7, 6, 8, 7, '2do Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon C'),
(38, 6, 15, NULL, 6, 6, 7, 5, 6, 8, 9, 7, 7, 6, 7, 6, 6.6666666666667, '2do Semestre', 'Aranda Alarcón Graciela', '2022', 1, 'Matutino', 'Salon B'),
(39, 8, 9, NULL, 5, 7, 8, 7, 6, 6, 6, 7, 8, 6, 7, 7, 6.6666666666667, '2do Semestre', 'Aranda Alarcón Graciela', '2022', 1, 'Matutino', 'Salon A'),
(68, 6, 4, 'regular', 7, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 5.5, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon A'),
(69, 6, 2, 'buena', 7, 8, 7, 8, 9, 8, 9, 6, 9, 9, 9, 9, 7.8333333333333, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon A'),
(70, 6, 5, 'excelente', 6, 5, 7, 6, 5, 4, 6, 6, 4, 4, 5, 4, 5.5, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon A'),
(71, 2, 97, 'buen alumno', 8, 9, 8, 9, 7, 6, 0, 0, 0, 0, 0, 0, 3.9166666666667, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2023', 5, 'Matutino', 'Salon A'),
(72, 2, 84, 'siempre entrega todo', 9, 9, 9, 9, 9, 5, 6, 8, 9, 9, 9, 8, 8.3333333333333, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2023', 5, 'Matutino', 'Salon A'),
(73, 8, 1, 'falta regularmente a clase', 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, '1er Semestre', 'Aguilar Covarrubias Norma Aracely', '2022', 1, 'Matutino', 'Salon A'),
(74, 76, 16, NULL, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, '3er Semestre', 'Aranda Alarcón Graciela', '2023', 1, 'Matutino', 'Salon A');

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `IdCarreras` bigint(20) UNSIGNED NOT NULL,
  `NombreCarrera` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`IdCarreras`, `NombreCarrera`) VALUES
(1, 'Ing. Informática'),
(2, 'Ing. Electrónica'),
(3, 'Ing. En Gestión Empresarial'),
(4, 'Ing. Industrial'),
(5, 'Ing. Mecánica'),
(6, 'Ing. En Energías Renovables');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formatoanexo14`
--

CREATE TABLE `formatoanexo14` (
  `IdFormato14` bigint(20) NOT NULL,
  `Alumno_id` bigint(20) UNSIGNED NOT NULL,
  `Materia_id` bigint(20) UNSIGNED NOT NULL,
  `Maestro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Semestre_id` bigint(20) UNSIGNED NOT NULL,
  `Carrera_id` bigint(20) UNSIGNED NOT NULL,
  `Turno` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Salon` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `U1` double NOT NULL,
  `U2` double NOT NULL,
  `U3` double NOT NULL,
  `U4` double NOT NULL,
  `U5` double NOT NULL,
  `U6` double NOT NULL,
  `U7` double NOT NULL,
  `U8` double NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formatoanexo14`
--

INSERT INTO `formatoanexo14` (`IdFormato14`, `Alumno_id`, `Materia_id`, `Maestro`, `Semestre_id`, `Carrera_id`, `Turno`, `Salon`, `U1`, `U2`, `U3`, `U4`, `U5`, `U6`, `U7`, `U8`, `observaciones`) VALUES
(1, 6, 1, 'Aguilar Covarrubias Norma Aracely', 1, 1, 'Matutino', 'D', 9, 9, 8, 8, 8, 8, 8, 9, NULL),
(2, 6, 2, 'Aguilar Covarrubias Norma Aracely', 1, 1, 'Matutino', 'A', 8, 8, 8, 9, 9, 9, 9, 9, NULL),
(3, 6, 3, '1', 1, 1, 'Matutino', 'A', 88, 99, 77, 78, 92, 90, 87, 94, NULL),
(4, 2, 1, 'Aguilar Covarrubias Norma Aracely', 1, 1, 'Matutino', 'A', 8, 8, 8, 8, 8, 8, 8, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `formatoanexo19`
--

CREATE TABLE `formatoanexo19` (
  `IdFormatoAnexo19` bigint(20) UNSIGNED NOT NULL,
  `Alumno` bigint(20) UNSIGNED NOT NULL,
  `Materia` bigint(20) UNSIGNED NOT NULL,
  `Carrera` bigint(20) UNSIGNED NOT NULL,
  `Maestro` varchar(191) NOT NULL,
  `Semestre` varchar(191) NOT NULL,
  `turno` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `salon` varchar(255) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `checkpoint1` tinyint(1) NOT NULL DEFAULT 0,
  `checkpoint2` tinyint(1) NOT NULL DEFAULT 0,
  `checkpoint3` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formatoanexo19`
--

INSERT INTO `formatoanexo19` (`IdFormatoAnexo19`, `Alumno`, `Materia`, `Carrera`, `Maestro`, `Semestre`, `turno`, `created_at`, `updated_at`, `salon`, `comentarios`, `checkpoint1`, `checkpoint2`, `checkpoint3`) VALUES
(1, 2, 97, 5, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'Asesorias', 0, 1, 0),
(2, 6, 2, 1, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'ASESORIAS', 0, 1, 0),
(3, 8, 1, 1, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'No ASESORIAS', 0, 1, 0),
(4, 6, 15, 1, 'Aranda Alarcón Graciela', '2do Semestre', 'Matutino', NULL, NULL, 'Salón B', 'psicologia', 1, 0, 0),
(5, 8, 9, 1, 'Aranda Alarcón Graciela', '2do Semestre', 'Matutino', NULL, NULL, 'Salón A', 'Asesoria', 0, 1, 0),
(6, 76, 16, 1, 'Aranda Alarcón Graciela', '3er Semestre', 'Matutino', NULL, NULL, 'Salón A', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `formatoanexomensual19`
--

CREATE TABLE `formatoanexomensual19` (
  `Alumno_id` bigint(20) UNSIGNED NOT NULL,
  `NombreAlumno` bigint(20) UNSIGNED NOT NULL,
  `NombreMateria` bigint(20) UNSIGNED NOT NULL,
  `NombreCarrera` bigint(20) UNSIGNED NOT NULL,
  `NombreMaestro` varchar(191) NOT NULL,
  `Semestre` varchar(191) NOT NULL,
  `turno` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `salon` varchar(255) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `checkpoint1` tinyint(1) NOT NULL DEFAULT 0,
  `checkpoint2` tinyint(1) NOT NULL DEFAULT 0,
  `checkpoint3` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formatoanexomensual19`
--

INSERT INTO `formatoanexomensual19` (`Alumno_id`, `NombreAlumno`, `NombreMateria`, `NombreCarrera`, `NombreMaestro`, `Semestre`, `turno`, `created_at`, `updated_at`, `salon`, `comentarios`, `checkpoint1`, `checkpoint2`, `checkpoint3`) VALUES
(1, 2, 97, 5, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'Asesorias', 1, 1, 1),
(2, 6, 2, 1, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'ASESORIAS', 0, 1, 0),
(3, 8, 1, 1, 'Aguilar Covarrubias Norma Aracely', '1er Semestre', 'Matutino', NULL, NULL, 'Salón A', 'No ASESORIAS', 1, 1, 0),
(4, 6, 15, 1, 'Aranda Alarcón Graciela', '2do Semestre', 'Matutino', NULL, NULL, 'Salón B', 'psicologia', 1, 1, 0),
(5, 8, 9, 1, 'Aranda Alarcón Graciela', '2do Semestre', 'Matutino', NULL, NULL, 'Salón A', 'Asesoria', 0, 1, 0),
(6, 76, 16, 1, 'Aranda Alarcón Graciela', '3er Semestre', 'Matutino', NULL, NULL, 'Salón A', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `formatos`
--

CREATE TABLE `formatos` (
  `IdFormatos` bigint(20) NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `calificacion_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formatos`
--

INSERT INTO `formatos` (`IdFormatos`, `observaciones`, `calificacion_id`) VALUES
(5, 'hello', 1),
(6, 'bien hecho', 37),
(7, 'falto a clase', 38),
(8, 'falto a clase', 39),
(9, 'no fue a clase', 68),
(10, 'Comentario 1', 1),
(11, 'Comentario 2', 37),
(12, 'Comentario 3', 38),
(13, 'Comentario 4', 39),
(14, 'Comentario 5', 68),
(15, 'Comentario 1', 1),
(16, 'Comentario 2', 37),
(17, 'Comentario 3', 38),
(18, 'Comentario 4', 39),
(19, 'Comentario 5', 68),
(20, 'Comentario 1', 1),
(21, 'Comentario 2', 37),
(22, 'Comentario 3', 38),
(23, 'Comentario 4', 39),
(24, 'Comentario 5', 68);

-- --------------------------------------------------------

--
-- Table structure for table `maestros`
--

CREATE TABLE `maestros` (
  `IdMaestros` bigint(20) UNSIGNED NOT NULL,
  `NombreMaestro` varchar(255) NOT NULL,
  `Correos` varchar(255) NOT NULL,
  `carrera_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `maestros`
--

INSERT INTO `maestros` (`IdMaestros`, `NombreMaestro`, `Correos`, `carrera_id`) VALUES
(1, 'Aguilar Covarrubias Norma Aracely', '1. norma.ac@tec.com.mx', 6),
(2, 'Aguilera Mancilla Héctor', '2. hector.am@tec.com.mx', 2),
(3, 'Aldape Suárez Miguel', '3. miguel.as@tec.com.mx', 4),
(4, 'Aranda Alarcón Graciela', '4. graciela.aa@tec.com.mx', 6),
(5, 'Asís Cipriano Karime', '5. karime.ac@tec.com.mx', 2),
(6, ' Baltierra Costeira Gabriela', '6. gabriela.bc@tec.com.mx', 6),
(7, 'Botello Reyes Mario Alan', '7. mario.alan.br@tec.com.mx', 6),
(8, 'Coronado Ríos Reyes', '8. reyes.cr@tec.com.mx', 6),
(9, 'Cortes Guerrero David', '9. david.cg@tec.com.mx', 6),
(10, 'Cortez Del Valle Homero', '10. homero.cdelv@tec.com.mx', 6),
(11, 'De Hoyos Valdés Jaime', '11. jaime.hv@tec.com.mx', 2),
(12, 'De Los Santos Flores Hugo Alberto', '12. hugo.alberto.sf@tec.com.mx', 2),
(13, 'Díaz Blanco Deniss Itzhel', '13. itzhel.deniss.db@tec.com.mx', 6),
(14, 'Díaz Menchaca José Raúl', '14. jose.raul.dm@tec.com.mx', 3),
(15, 'Duarte Sánchez Ricardo Fidel', '15. fidel.ricardo.ds@tec.com.mx', 3),
(16, 'Escoto Sánchez Héctor Javier', '16. hector.javier.es@tec.com.mx', 6),
(17, 'Flores Flores Irasema', '17. irasema.flores@tec.com.mx', 2),
(18, 'Flores Peña Enrique', '18. enrique.fp@tec.com.mx', 3),
(19, 'Franco Cuellar Mónica Patricia', '19. monica.patricia.fc@tec.com.mx', 6),
(20, 'Fuentes Puente Edna Marcela', '20. edna.marcela.fp@tec.com.mx', 2),
(21, 'Garcia Vazquez Victor Alfonso', '21. victor.alfonso.gv@tec.com.mx', 2),
(22, 'Garcia Plata Maria Antonieta', '22. antonieta.maria.gp@tec.com.mx', 5),
(23, 'González Escobedo Carmina', '23. carmina.ge@tec.com.mx', 1),
(24, 'González Puente Isaac', '24. isaac.gp@tec.com.mx', 2),
(25, 'González Puente Zaida Aydeé', '25. zaida.aydee.gp@tec.com.mx', 3),
(26, 'Gonzalez Rodriguez Laura Elena', '26. laura.elena.gr@tec.com.mx', 3),
(27, 'González Treviño Gibran Jalil', '27. gilbran.jalil.gt@tec.com.mx', 3),
(28, 'González Zamarripa Gregorio', '28. gregorio.gz@tec.com.mx', 6),
(29, 'Hernández Córdova Adriana', '29. adriana.hc@tec.com.mx', 6),
(30, 'Homero', 'arroba@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `materias` (
  `IdMaterias` bigint(20) UNSIGNED NOT NULL,
  `NombreMateria` varchar(191) NOT NULL,
  `carrera_id` bigint(20) UNSIGNED NOT NULL,
  `semestre_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `materias`
--

INSERT INTO `materias` (`IdMaterias`, `NombreMateria`, `carrera_id`, `semestre_id`) VALUES
(1, 'Administración para informática', 1, 1),
(2, 'Fundamentos de investigación', 1, 1),
(3, 'Fundamentos de programación', 1, 1),
(4, 'Taller de ética', 1, 1),
(5, 'Cálculo diferencial', 1, 1),
(6, 'Desarrollo sustentable', 1, 1),
(7, 'Administración de los recursos y función informática', 1, 2),
(8, 'Física para informática', 1, 2),
(9, 'Programación orientada a objetos', 1, 2),
(10, 'Contabilidad financiera', 1, 2),
(11, 'Cálculo integral', 1, 2),
(12, 'Matemáticas discretas', 1, 2),
(13, 'Fundamentos de sistemas de información', 1, 3),
(14, 'Sistemas electrónicos para informática', 1, 3),
(15, 'Estructura de datos', 1, 3),
(16, 'Costos empresariales', 1, 3),
(17, 'Álgebra lineal', 1, 3),
(18, 'Probabilidad y estadística', 1, 3),
(19, 'Taller de investigación I', 1, 4),
(20, 'Arquitectura de computadoras', 1, 4),
(21, 'Administración y organización de datos', 1, 4),
(22, 'Fundamentos de telecomunicaciones', 1, 4),
(23, 'Sistemas operativos I', 1, 4),
(24, 'Investigación de operaciones', 1, 4),
(25, 'Cálculo diferencial', 2, 1),
(26, 'Mecánica clásica', 2, 1),
(27, 'Química', 2, 1),
(28, 'Taller de ética', 2, 1),
(29, 'Fundamentos de investigación', 2, 1),
(30, 'Comunicación humana', 2, 1),
(31, 'Cálculo integral', 2, 2),
(32, 'Probabilidad y estadística', 2, 2),
(33, 'Desarrollo sustentable', 2, 2),
(34, 'Mediciones eléctricas', 2, 2),
(35, 'Tópicos selectos de física', 2, 2),
(36, 'Desarrollo humano', 2, 2),
(37, 'Cálculo vectorial', 2, 3),
(38, 'Electromagnetismo', 2, 3),
(39, 'Álgebra lineal', 2, 3),
(40, 'Física de semiconductores', 2, 3),
(41, 'Programación estructurada', 2, 3),
(42, 'Ecuaciones diferenciales', 2, 4),
(43, 'Circuitos eléctricos I', 2, 4),
(44, 'Marco legal de la empresa', 2, 4),
(45, 'Análisis numérico', 2, 4),
(46, 'Diseño digital', 2, 4),
(47, 'Programación visual', 2, 4),
(48, 'Fundamentos de investigación', 3, 1),
(49, 'Cálculo diferencial', 3, 1),
(50, 'Desarrollo humano', 3, 1),
(51, 'Fundamentos de gestión empresarial', 3, 1),
(52, 'Fundamentos de física', 3, 1),
(53, 'Fundamentos de química', 3, 1),
(54, 'Software de aplicación ejecutivo', 3, 2),
(55, 'Cálculo integral', 3, 2),
(56, 'Contabilidad orientada a los negocios', 3, 2),
(57, 'Dinámica social', 3, 2),
(58, 'Taller de ética', 3, 2),
(59, 'Legislación laboral', 3, 2),
(60, 'Marco legal de las organizaciones', 3, 3),
(61, 'Probabilidad y estadística descriptiva', 3, 3),
(62, 'Costos empresariales', 3, 3),
(63, 'Habilidades directivas I', 3, 3),
(64, 'Economía empresarial', 3, 3),
(65, 'Álgebra lineal', 3, 3),
(66, 'Ingeniería económica', 3, 4),
(67, 'Estadística inferencial I', 3, 4),
(68, 'Instrumentos de presupuestación empresarial', 3, 4),
(69, 'Habilidades directivas II', 3, 4),
(70, 'Entorno macroeconómico', 3, 4),
(71, 'Investigación de operaciones', 3, 4),
(72, 'Fundamentos de investigación', 4, 1),
(73, 'Taller de ética', 4, 1),
(74, 'Cálculo diferencial', 4, 1),
(75, 'Taller de herramientas intelectuales', 4, 1),
(76, 'Química', 4, 1),
(77, 'Dibujo industrial', 4, 1),
(78, 'Electricidad y electrónica industrial', 4, 2),
(79, 'Propiedades de los materiales', 4, 2),
(80, 'Cálculo integral', 4, 2),
(81, 'Probabilidad y estadística', 4, 2),
(82, 'Análisis de la realidad nacional', 4, 2),
(83, 'Taller de liderazgo', 4, 2),
(84, 'Metrología y normalización', 4, 3),
(85, 'Álgebra lineal', 4, 3),
(86, 'Cálculo vectorial', 4, 3),
(87, 'Economía', 4, 3),
(88, 'Estadística inferencial I', 4, 3),
(89, 'Estudio del trabajo I', 4, 3),
(90, 'Procesos de fabricación', 4, 4),
(91, 'Física', 4, 4),
(92, 'Algoritmos y lenguajes de programación', 4, 4),
(93, 'Investigación de operaciones I', 4, 4),
(94, 'Estadística inferencial II', 4, 4),
(95, 'Estudio del trabajo II', 4, 4),
(96, 'Higiene y seguridad industrial', 4, 4),
(97, 'Dibujo Mecánico', 5, 1),
(98, 'Cálculo diferencial', 5, 1),
(99, 'Metrología y normalización', 5, 1),
(100, 'Química', 5, 1),
(101, 'Taller de ética', 5, 1),
(102, 'Fundamentos de investigación', 5, 1),
(103, 'Probabilidad y estadística', 5, 2),
(104, 'Cálculo integral', 5, 2),
(105, 'Álgebra lineal', 5, 2),
(106, 'Ingeniería de Materiales Metálicos', 5, 2),
(107, 'Algoritmos y Programación', 5, 2),
(108, 'Proceso Administrativo', 5, 2),
(109, 'Estática', 5, 3),
(110, 'Cálculo vectorial', 5, 3),
(111, 'Calidad', 5, 3),
(112, 'Ingeniería de Materiales no Metálicos', 5, 3),
(113, 'Electromagnetismo', 5, 3),
(114, 'Contabilidad y Costos', 5, 3),
(115, 'Mecánica de Materiales I', 5, 4),
(116, 'Ecuaciones diferenciales', 5, 4),
(117, 'Dinámica', 5, 4),
(118, 'Procesos de Manufactura', 5, 4),
(119, 'Sistemas Electrónicos', 5, 4),
(120, 'Métodos Numéricos', 5, 4),
(121, 'Química', 6, 1),
(122, 'Programación', 6, 1),
(123, 'Cálculo diferencial', 6, 1),
(124, 'Fundamentos de investigación', 6, 1),
(125, 'Dibujo', 6, 1),
(126, 'Fuentes Renovables de Energía', 6, 1),
(127, 'Bioquímica', 6, 2),
(128, 'Tecnología e Ingeniería de Materiales', 6, 2),
(129, 'Cálculo vectorial', 6, 2),
(130, 'Cálculo integral', 6, 2),
(131, 'Taller de ética', 6, 2),
(132, 'Estadística y Diseño de Experimentos', 6, 2),
(133, 'Microbiología', 6, 3),
(134, 'Taller de Sistemas de Información Geográfica', 6, 3),
(135, 'Electromagnetismo', 6, 3),
(136, 'Estática y Dinámica', 6, 3),
(137, 'Álgebra lineal', 6, 3),
(138, 'Metrología Mecánica y Eléctrica', 6, 3),
(139, 'Resistencia de Materiales', 6, 4),
(140, 'Termodinámica', 6, 4),
(141, 'Comportamiento Humano en las Organizaciones', 6, 4),
(142, 'Óptica y Semiconductores', 6, 4),
(143, 'Ecuaciones diferenciales', 6, 4),
(144, 'Circuitos eléctricos I', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_08_22_012813_create_permission_tables', 1),
(6, '2021_08_22_020736_create_blogs_table', 1),
(7, '2023_01_07_072042_create_carreras_table', 2),
(8, '2023_01_07_072124_create_semestres_table', 3),
(9, '2023_01_12_052959_create_maestros_table', 4),
(10, '2023_01_14_214503_create_año_semestres_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(5, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 76),
(5, 'App\\Models\\User', 77),
(5, 'App\\Models\\User', 84),
(5, 'App\\Models\\User', 85),
(7, 'App\\Models\\User', 5),
(7, 'App\\Models\\User', 9),
(7, 'App\\Models\\User', 10),
(7, 'App\\Models\\User', 11),
(7, 'App\\Models\\User', 12),
(7, 'App\\Models\\User', 13),
(7, 'App\\Models\\User', 14),
(7, 'App\\Models\\User', 15),
(7, 'App\\Models\\User', 16),
(7, 'App\\Models\\User', 17),
(7, 'App\\Models\\User', 18),
(7, 'App\\Models\\User', 19),
(7, 'App\\Models\\User', 20),
(7, 'App\\Models\\User', 21),
(7, 'App\\Models\\User', 22),
(7, 'App\\Models\\User', 23),
(7, 'App\\Models\\User', 24),
(7, 'App\\Models\\User', 25),
(7, 'App\\Models\\User', 26),
(7, 'App\\Models\\User', 27),
(7, 'App\\Models\\User', 28),
(7, 'App\\Models\\User', 29),
(7, 'App\\Models\\User', 30),
(7, 'App\\Models\\User', 31),
(7, 'App\\Models\\User', 32),
(7, 'App\\Models\\User', 33),
(7, 'App\\Models\\User', 34),
(7, 'App\\Models\\User', 35),
(7, 'App\\Models\\User', 36),
(7, 'App\\Models\\User', 37),
(7, 'App\\Models\\User', 38),
(7, 'App\\Models\\User', 39),
(7, 'App\\Models\\User', 40),
(7, 'App\\Models\\User', 41),
(7, 'App\\Models\\User', 42),
(7, 'App\\Models\\User', 43),
(7, 'App\\Models\\User', 44),
(7, 'App\\Models\\User', 45),
(7, 'App\\Models\\User', 46),
(7, 'App\\Models\\User', 47),
(7, 'App\\Models\\User', 48),
(7, 'App\\Models\\User', 50),
(7, 'App\\Models\\User', 51),
(7, 'App\\Models\\User', 52),
(7, 'App\\Models\\User', 53),
(7, 'App\\Models\\User', 54),
(7, 'App\\Models\\User', 55),
(7, 'App\\Models\\User', 56),
(7, 'App\\Models\\User', 57),
(7, 'App\\Models\\User', 58),
(7, 'App\\Models\\User', 59),
(7, 'App\\Models\\User', 60),
(7, 'App\\Models\\User', 61),
(7, 'App\\Models\\User', 62),
(7, 'App\\Models\\User', 63),
(7, 'App\\Models\\User', 64),
(7, 'App\\Models\\User', 65),
(7, 'App\\Models\\User', 66),
(7, 'App\\Models\\User', 67),
(7, 'App\\Models\\User', 68),
(7, 'App\\Models\\User', 69),
(7, 'App\\Models\\User', 70),
(7, 'App\\Models\\User', 71),
(7, 'App\\Models\\User', 72),
(7, 'App\\Models\\User', 73),
(7, 'App\\Models\\User', 74),
(7, 'App\\Models\\User', 75),
(8, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ver-rol', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(2, 'crear-rol', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(3, 'editar-rol', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(4, 'borrar-rol', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(5, 'ver-blog', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(6, 'crear-blog', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(7, 'editar-blog', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(8, 'borrar-blog', 'web', '2022-11-25 13:55:58', '2022-11-25 13:55:58'),
(9, 'Alumno-rol', 'web', '2023-01-13 02:10:58', '2023-01-13 02:10:58'),
(10, 'Maestro-rol', 'web', '2023-01-15 05:26:58', '2023-01-15 05:26:58'),
(11, 'Administrador-rol', 'web', '2023-04-25 01:16:18', '2023-04-25 01:16:18'),
(12, 'gestionar-propia-calificacion', 'web', '2023-04-25 10:39:17', '2023-04-25 10:39:17'),
(13, 'ver-calificaciones', 'web', '2023-04-25 10:57:25', '2023-04-25 10:57:25'),
(14, 'ver-maestros', 'web', '2023-04-25 10:57:33', '2023-04-25 10:57:33'),
(15, 'ver-materias', 'web', '2023-04-25 10:57:46', '2023-04-25 10:57:46'),
(16, 'agregar-calificacion', 'web', '2023-04-25 11:00:57', '2023-04-25 11:00:57'),
(17, 'editar-calificacion', 'web', '2023-04-25 11:01:20', '2023-04-25 11:01:20'),
(18, 'borrar-calificacion', 'web', '2023-04-25 11:01:42', '2023-04-25 11:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5, 'Alumno', 'web', '2023-01-16 18:52:53', '2023-01-16 18:52:53'),
(7, 'Maestro', 'web', '2023-01-16 18:53:11', '2023-01-16 18:53:11'),
(8, 'Administrador', 'web', '2023-01-16 18:53:59', '2023-01-16 18:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 7),
(1, 8),
(2, 5),
(2, 7),
(2, 8),
(3, 5),
(3, 7),
(3, 8),
(4, 5),
(4, 7),
(4, 8),
(5, 8),
(6, 8),
(7, 8),
(8, 8),
(9, 5),
(10, 7),
(11, 8),
(13, 5),
(13, 7),
(13, 8),
(14, 7),
(14, 8),
(15, 7),
(15, 8),
(16, 5),
(16, 7),
(16, 8),
(17, 5),
(17, 7),
(17, 8),
(18, 5),
(18, 7),
(18, 8);

-- --------------------------------------------------------

--
-- Table structure for table `semestres`
--

CREATE TABLE `semestres` (
  `IdSemestres` bigint(20) UNSIGNED NOT NULL,
  `Semestre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `semestres`
--

INSERT INTO `semestres` (`IdSemestres`, `Semestre`) VALUES
(1, '1er Semestre'),
(2, '2do Semestre'),
(3, '3er Semestre'),
(4, '4to Semestre'),
(5, '5to Semestre'),
(6, '6to Semestre'),
(7, '7mo Semestre'),
(8, '8vo Semestre');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jesus', 'admin@admin.com', NULL, '$2y$10$3FdDPsR9suStXWkL0vUtn.ao1/gok.EPytZSFamNKVG7LFL2MfNrG', NULL, '2023-01-16 10:24:40', '2023-04-19 19:56:32'),
(2, 'jesus', 'jesus@tec.com.mx', NULL, '$2y$10$B9y/HrFxkRXdzwpW7ttPBumiBotIi6wicWu5pWnDpjwoCuGjaz1D6', NULL, '2023-01-16 12:08:55', '2023-01-16 12:08:55'),
(4, 'Pepito', 'pepito@tec.com.mx', NULL, '$2y$10$jbb4lGKVQm75CKAnoAQsQ.tYiEEZSUN.8BSR9/uyweM1azZkP9/Te', NULL, '2023-02-11 05:05:34', '2023-02-11 05:05:34'),
(5, 'Homero', 'homero@tec.com.mx', NULL, '$2y$10$Y5p4D1fBZIwOR1BkMaEzFOkGwTFkq0zAIc6muUSgaUKLu0LNquOmC', NULL, '2023-04-14 08:57:48', '2023-04-14 08:57:48'),
(6, 'Abril Mejia Rangel', 'avril.rock1471@gmail.com', NULL, '$2y$10$69.oEaVical94wTOiitZreLcogr9p2fsFCAs6mY3JKG03OjB8wkH.', NULL, '2023-04-18 14:12:53', '2023-04-18 14:12:53'),
(8, 'Luis', 'luis19@outlook.com', NULL, '$2y$10$JAW599bfQVaPUVQM80VPSei8T/udKCfu8nZn66AM48mPsSKbw3xwO', NULL, '2023-04-20 02:19:45', '2023-04-20 02:19:45'),
(9, 'Aguilar Covarrubias Norma Aracely', 'norma.ac@tec.com.mx', NULL, '$2y$10$yF83Nw24SfvfW1dijdDdDuXp1rHnLQrCsGNGbqchCFbzn6Rl9Bxw6', NULL, '2023-04-22 15:25:25', '2023-04-22 15:25:25'),
(10, 'Aguilera Mancilla Héctor', 'hector.am@tec.com.mx', NULL, '$2y$10$WpkOAmn18O3FkcEuYgOeZOPA8rNUJMUQKlkeVQ2VIHCExfQDjAYta', NULL, '2023-04-22 15:26:28', '2023-04-22 15:26:28'),
(11, 'Aldape Suárez Miguel', 'miguel.as@tec.com.mx', NULL, '$2y$10$sQHN0vr9S.4s2y4zF2TonObQO7fgxOy/3fEpfI5daQWa86Z2p6MJ.', NULL, '2023-04-22 15:27:54', '2023-04-22 15:27:54'),
(12, 'Aranda Alarcón Graciela', 'graciela.aa@tec.com.mx', NULL, '$2y$10$.rNycZ3X1JTli9NIlIrjouyBFeR0knp6jEVUZGMwO/vxvd524nYX2', NULL, '2023-04-22 15:28:44', '2023-04-22 15:28:44'),
(13, 'Asís Cipriano Karime', 'karime.ac@tec.com.mx', NULL, '$2y$10$D6J4/P.S/Ue8Ns6E57rf4.b40NHuPvs0s7JhyGdeyDrcS/K0L9tnC', NULL, '2023-04-22 15:29:37', '2023-04-22 15:29:37'),
(14, 'Baltierra Costeira Gabriela', 'gabriela.bc@tec.com.mx', NULL, '$2y$10$PIAJtgyC4h/Wlf4hMnx7J.OxNYh4fUHduui4vZbe0GN5qciaE/Rny', NULL, '2023-04-22 15:30:43', '2023-04-22 15:30:43'),
(15, 'Botello Reyes Mario Alan', 'mario.alan.br@tec.com.mx', NULL, '$2y$10$xSNVbi.VnHWrSpuD04oUs.hxV6TxJSY/dPrkbORKomK1uvt4dblOu', NULL, '2023-04-22 15:32:41', '2023-04-22 15:32:41'),
(16, 'Coronado Ríos Reyes', 'reyes.cr@tec.com.mx', NULL, '$2y$10$I/nqZk8Y9JzLoWRRrM2O7eiSzFzEiIPppdWCKvkY6Zjtr.j6G25gW', NULL, '2023-04-22 15:34:49', '2023-04-22 15:34:49'),
(17, 'Cortes Guerrero David', 'david.cg@tec.com.mx', NULL, '$2y$10$93Vw05zC.U8nX6QlIJmykO0KMBvWCb88LPrK6EPqtrm0Nn4kZpsUO', NULL, '2023-04-22 15:36:32', '2023-04-22 15:36:32'),
(18, 'Cortez Del Valle Homero', 'homero.cdelv@tec.com.mx', NULL, '$2y$10$qWOGdCDsJEcZh/6zFogeHexEOl13CBzRxd.qUfSNlDxDN9gs9LqWC', NULL, '2023-04-22 15:39:15', '2023-04-22 15:39:15'),
(19, 'De Hoyos Valdés Jaime', 'jaime.hv@tec.com.mx', NULL, '$2y$10$TubemhR7vuvEz2.5RD2V7eG2HO5GLbRulsgAILet3GfsxQLrDmwuG', NULL, '2023-04-22 15:41:12', '2023-04-22 15:41:12'),
(20, 'De Los Santos Flores Hugo Alberto', 'hugo.alberto.sf@tec.com.mx', NULL, '$2y$10$0IUwmcnr.64wC1Kpl8Vje.4DPCsXXnBvzNg/g.HvtBmmUNdBiHgf.', NULL, '2023-04-22 15:41:52', '2023-04-22 15:41:52'),
(21, 'Díaz Blanco Deniss Itzhel', 'itzhel.deniss.db@tec.com.mx', NULL, '$2y$10$UTJgLEQxNvBxP1l0GbVpI.TAa2MlZNyATxlOu/ERr32O80gJPoXc2', NULL, '2023-04-22 15:44:34', '2023-04-22 15:44:34'),
(22, 'Díaz Menchaca José Raúl', 'jose.raul.dm@tec.com.mx', NULL, '$2y$10$1F1T0lU3l/Oj2v6vGLpc0etLT36EogKigZAetz6Ohme3EoCdem836', NULL, '2023-04-22 15:45:12', '2023-04-22 15:45:12'),
(23, 'Duarte Sánchez Ricardo Fidel', 'fidel.ricardo.ds@tec.com.mx', NULL, '$2y$10$upICSoAO7yLKtf514yBPkOW4INLkgZmuRRHLvQDumpSmUgSzj0rvG', NULL, '2023-04-22 15:45:56', '2023-04-22 15:45:56'),
(24, 'Escoto Sánchez Héctor Javier', 'hector.javier.es@tec.com.mx', NULL, '$2y$10$.KPUyNvc2hDElxgVh1x8vOEYVKL9IudLDOM7ZR2fvaOiCcvOl8UX.', NULL, '2023-04-22 15:46:39', '2023-04-22 15:46:39'),
(25, 'Flores Flores Irasema', 'irasema.flores@tec.com.mx', NULL, '$2y$10$EhQfLTRUxwCOmoibDW/Exu62amQGLRTVi6Y.EFsOEWG8i.FOBfxjy', NULL, '2023-04-22 15:47:16', '2023-04-22 15:47:16'),
(26, 'Flores Peña Enrique', 'enrique.fp@tec.com.mx', NULL, '$2y$10$J08dc8CFYLE/MaCy.r4OEODm1a/af.D/MnQNQvJLl8Xsv7dAWKQlG', NULL, '2023-04-22 15:49:13', '2023-04-22 15:49:13'),
(27, 'Franco Cuellar Mónica Patricia', 'monica.patricia.fc@tec.com.mx', NULL, '$2y$10$g.67RtlxhGLM72Ehruo3M./rPWjlFT4uYkkGN7SjZDThG5MPFmoeO', NULL, '2023-04-22 15:50:24', '2023-04-22 15:50:24'),
(28, 'Fuentes Puente Edna Marcela', 'edna.marcela.fp@tec.com.mx', NULL, '$2y$10$GjRj3yjYVTfrBYcxvETPAO8x20TUQHLP1FoLwrjPGRYZ3bwTRU0Ja', NULL, '2023-04-22 15:51:23', '2023-04-22 15:51:23'),
(29, 'Garcia Vazquez Victor Alfonso', 'victor.alfonso.gv@tec.com.mx', NULL, '$2y$10$YvyarOdvsbT4eVVgWq1NKuIQMcP4PZ6q19SNQOVM3pDuG8MTUgLl.', NULL, '2023-04-22 15:52:04', '2023-04-22 15:52:04'),
(30, 'Garcia Plata Maria Antonieta', 'antonieta.maria.gp@tec.com.mx', NULL, '$2y$10$zCm10h41OxcRdeRCuNpDVexnLKqLa0KGUZADAKbNJX.S1dU0U0S.6', NULL, '2023-04-22 15:53:12', '2023-04-22 15:53:12'),
(31, 'González Escobedo Carmina', 'carmina.ge@tec.com.mx', NULL, '$2y$10$nR2n6OnLQO/0iEVyPyokb.sSKsCTP2ADN1cF1eh7jJ1jGA112f1qS', NULL, '2023-04-22 15:53:44', '2023-04-22 15:53:44'),
(32, 'González Puente Isaac', 'isaac.gp@tec.com.mx', NULL, '$2y$10$BfpjV6ipgUuJGg5BoWUcrO34G0u0qGHp7iMyIeMVhD1819SGzyPqa', NULL, '2023-04-22 15:54:49', '2023-04-22 15:54:49'),
(33, 'González Puente Zaida Aydeé', 'zaida.aydee.gp@tec.com.mx', NULL, '$2y$10$.zU6/MZhy1Rks5vrIm4.VuOWqqPi3rPlr3McEq6PS7.38rjeiY6CS', NULL, '2023-04-22 15:55:58', '2023-04-22 15:55:58'),
(34, 'Gonzalez Rodriguez Laura Elena', 'laura.elena.gr@tec.com.mx', NULL, '$2y$10$EfZZu53n4DZ6KPwQx6S70Op4tOOpN9hZU7wYie1kdCJsXGQtPQYyO', NULL, '2023-04-22 15:56:42', '2023-04-22 15:56:42'),
(35, 'González Treviño Gibran Jalil', 'gilbran.jalil.gt@tec.com.mx', NULL, '$2y$10$PFGM7X7IPU/SK8d.VNX6UOjibRxKUGj6rgTdznHnaV7TTvpCx64UC', NULL, '2023-04-22 15:57:17', '2023-04-22 15:57:17'),
(36, 'González Zamarripa Gregorio', 'gregorio.gz@tec.com.mx', NULL, '$2y$10$Z6wPX.4l50UQFoZA0KM/t.IKn/2TxRKZKNjgBj4RydMryd24vQnpS', NULL, '2023-04-22 16:00:29', '2023-04-22 16:00:29'),
(37, 'Hernández Córdova Adriana', 'adriana.hc@tec.com.mx', NULL, '$2y$10$PoCcQrAToUd9ASMRggW1xOSFiqerXYD.BvxJQyHlg3r3SI3WVC/jK', NULL, '2023-04-22 16:06:31', '2023-04-22 16:06:31'),
(38, 'Hernandez Rodriguez Héctor', 'hector.hr@tec.com.mx', NULL, '$2y$10$fP5eE6dTQ5LYLehaa1Bk3uT7PsnAeK35FJuDi/L.oNtRHgkhZF5YG', NULL, '2023-04-22 16:07:55', '2023-04-22 16:07:55'),
(39, 'Hernändez Treviño José Mario', 'jose.mario.ht@tec.com.mx', NULL, '$2y$10$rvVlLTMZkFLckpIRxfcAde5jTzIRhwXB0KqPLqdaz9pXcRMtyw2JS', NULL, '2023-04-22 16:14:51', '2023-04-22 16:14:51'),
(40, 'Herrera Valdez Ernesto', 'ernesto.hv@tec.com.mx', NULL, '$2y$10$6MO7cUJAlUMIIZDrrjyM4ugm6zwa4FnETt4JAepg6CPy8.u5JYJjq', NULL, '2023-04-22 16:15:30', '2023-04-22 16:15:30'),
(41, 'Jasso Ibarra Sandra Lilia', 'sandra.lilia.ji@tec.com.mx', NULL, '$2y$10$JJRq1TcXT7HLGUm7o4e3tuubIocPb8AwT.LV/OCRyBsz24dvw9Wbe', NULL, '2023-04-22 16:16:42', '2023-04-22 16:16:42'),
(42, 'Jiménez Zavala Felipe', 'felipe.jz@tec.com.mx', NULL, '$2y$10$pBd47WZRCN8vENv5FAvImOBRJTOPPErAy6m61lZzHTGcxlQo63PCe', NULL, '2023-04-22 16:17:26', '2023-04-22 16:17:26'),
(43, 'Jordán Marmolejo Luís Gerardo', 'luis.gerardo.jm@tec.com.mx', NULL, '$2y$10$6yvliydvrWLDLKyccKyGGO2PYjWVHmwDhIa/i8AlBjLb1/Pf60S1W', NULL, '2023-04-22 16:20:28', '2023-04-22 16:20:28'),
(44, 'López Cepeda Jonathan', 'joanathan.lc@tec.com.mx', NULL, '$2y$10$fnZVnibMyR6TcdgXy1FvOe5zJ1W1OQ0D0Ekbd2GKSqpNIC77Cdu3O', NULL, '2023-04-22 16:21:33', '2023-04-22 16:21:33'),
(45, 'Martínez Flores Rocío', 'rocio.mf@tec.com.mx', NULL, '$2y$10$JNb25tOgerFVB4bZAASTIeDmDPh2S4zbKAZOOxGdVGvs4/QOphpay', NULL, '2023-04-22 16:23:15', '2023-04-22 16:23:15'),
(46, 'Martínez García Ruth Margarita', 'ruth.margarita.mg@tec.com.mx', NULL, '$2y$10$4YTuv0O3p9RGomEwvbMvz.IHwUOUhg.IBJv3brzCicgY.h.0ZB/HG', NULL, '2023-04-22 16:28:03', '2023-04-22 16:28:03'),
(47, 'Martínez Narvaez Jorge Alberto', 'jorge.alberto.mn@tec.com.mx', NULL, '$2y$10$6el6CSYQ.o862URS9YPb4O/NQuI/PGQQdr/aswCppHzaSOfNDwE7y', NULL, '2023-04-22 16:28:50', '2023-04-22 16:28:50'),
(48, 'Martinez Campos Javier', 'javier.mc@tec.com.mx', NULL, '$2y$10$ZqETEmUjy0LyNo3kg7BTqek2t3tjVF.prg/9oVvjZhuDhGKxJ06Y6', NULL, '2023-04-22 16:29:43', '2023-04-22 16:29:43'),
(50, 'Martínez Vela Verónica', 'veronica.mv@tec.com.mx', NULL, '$2y$10$55Jeu.qrosgUL9EqQQWDXOUgyMij9ahdBiycoOTf9kqMX8UXzUYO6', NULL, '2023-04-22 16:30:56', '2023-04-22 16:30:56'),
(51, 'Medina Guzmán Laura', 'laura.mg@tec.com.mx', NULL, '$2y$10$fO9PsZ6V6t63T3Us8HLPVeYObWhqxiIzVglhwAjPVZ8gt0ZnAdt5K', NULL, '2023-04-22 16:31:55', '2023-04-22 16:31:55'),
(52, 'Meléndez López Edith Margot', 'edith.margot.ml@tec.com.mx', NULL, '$2y$10$7TNgNPvq8eXWzN5R1zHGv.9BzpuL1igKd3NRjQqMcrykYf0Gs1QQu', NULL, '2023-04-22 16:32:53', '2023-04-22 16:32:53'),
(53, 'Morales Medina José Luís', 'jose.luis.mm@tec.com.mx', NULL, '$2y$10$PRrW9xPwWFv0aedcCFwLHum7Q2gJoR91p.7MRCzZQASRHg84K7.Bi', NULL, '2023-04-22 16:35:47', '2023-04-22 16:35:47'),
(54, 'Morte Real Lorena', 'lorena.mr@tec.com.mx', NULL, '$2y$10$Q/t2nwE4gOE38Ix5TzwYmu6L6iOU6MQeQtHSGd8oniPecWKU09wL.', NULL, '2023-04-22 16:36:19', '2023-04-22 16:36:19'),
(55, 'Moreno Rodriguez Jairo Cristopher Hassan', 'cris.hassan.mrj@tec.com.mx', NULL, '$2y$10$pVklZewN3pC3RmmoZ3.1suj4/tSA.GMQTBLIl961rYTVzwkKlSFuK', NULL, '2023-04-22 16:37:38', '2023-04-22 16:37:38'),
(56, 'Narváez García Francisco Javier', 'francisco.javier.ng@tec.com.mx', NULL, '$2y$10$31lx9ipoiJW5vS6A5FkL4.npUwwFF/VCwP4LevUoTzKlQkLLW6E8y', NULL, '2023-04-22 16:38:36', '2023-04-22 16:38:36'),
(57, 'Olvera Pecina Ismael', 'ismael.op@tec.com.mx', NULL, '$2y$10$/I.1Tyry6yXbiOxOINZ7YeOR7PTe1Z59LjTwjP7VOvdXIP52cyorG', NULL, '2023-04-22 16:39:10', '2023-04-22 16:39:10'),
(58, 'Ortiz Valdez Andres Eduardo', 'andres.eduardo.ov@tec.com.mx', NULL, '$2y$10$85kncIodyY/HXEhbBeobd.wkhsn2uLli6W8iuwdaMIwZXBW3ME3PK', NULL, '2023-04-22 16:41:16', '2023-04-22 16:41:16'),
(59, 'Picazo Rodríguez Nallely Guadalupe', 'nallely.guadalupe.pr@tec.com.mx', NULL, '$2y$10$gSq1q2uLTFPCIPtx.VhiUeglyDZQRQEZ6C/LBRgl797L53DhcZ2Q2', NULL, '2023-04-22 16:42:07', '2023-04-22 16:42:07'),
(60, 'Ramos Arellano Juan de Dios', 'juan.ra@tec.com.mx', NULL, '$2y$10$S9Xn5/svzRkD.Pgz309dDeJ/eDDgNsuxpCedrdBaUzB8YGENQcaWq', NULL, '2023-04-22 16:42:49', '2023-04-22 16:42:49'),
(61, 'Razo Vazquez Axel Sebastian', 'ax.sebastian.rv@tec.com.mx', NULL, '$2y$10$B9UEubypUzs7PfC5x63Ose27RsiAquEM0r4r1rYsLUImDisrbJV16', NULL, '2023-04-22 16:44:49', '2023-04-22 16:44:49'),
(62, 'Renteria Avilez Martha Elena', 'martha.elena.ra@tec.com.mx', NULL, '$2y$10$d99Wk46VMUnSWHtCzmjPRu/er57TSMz1SGWUbLvX84n/1I02W0VyK', NULL, '2023-04-22 16:45:36', '2023-04-22 16:45:36'),
(63, 'Riojas Rodríguez Guillermo', 'guillermo.rdgz@tec.com.mx', NULL, '$2y$10$3qmNIlm/1iT12b8vllEdxuJ932Gnv0hnpXAng6LhL9tPPCRyI4Gmi', NULL, '2023-04-22 16:47:18', '2023-04-22 16:47:18'),
(64, 'Riojas Rodríguez Rubén Miguel', 'ruben.miguel.rdgz@tec.com.mx', NULL, '$2y$10$Jok/.lq1H1AmeeOBH1I3cewiPHLQGCw0TjsuQo5EqCA2H1eSS.qWS', NULL, '2023-04-22 16:48:05', '2023-04-22 16:48:05'),
(65, 'Rivas Aguilar Antonio', 'antonio.ra@tec.com.mx', NULL, '$2y$10$MRmPV9tqTGQQek1MbXJ6DuFIqDaaDhFRQlQFiD7hkTuWYeJ2M.Hki', NULL, '2023-04-22 16:49:50', '2023-04-22 16:49:50'),
(66, 'Rodríguez Campos Alejandro', 'alejandro.rc@tec.com.mx', NULL, '$2y$10$xCgzfvp4UkFzgAdpKROGaOzncl9DoqnD9DwJ6iiuQgr/V6tvPyiPe', NULL, '2023-04-22 16:50:35', '2023-04-22 16:50:35'),
(67, 'Rodríguez Campos Claudia', 'claudia.rc@tec.com.mx', NULL, '$2y$10$nyywI1a7ckV9r8RKxdKyjuxoPhN2thX9a.7fH/FemuQpkXXtSUyXK', NULL, '2023-04-22 16:51:20', '2023-04-22 16:51:20'),
(68, 'Romero Peña Jesús Manuel', 'manuel.jesus.rp@tec.com.mx', NULL, '$2y$10$Qrjk8JCKCBCAOb7lJWt5V.vzQ6FwLS8ArtjNXwaQteTwa3VsKLq7m', NULL, '2023-04-22 16:53:54', '2023-04-22 16:53:54'),
(69, 'Salas Torres Luis Horacio', 'luis.horacio.st@tec.com.mx', NULL, '$2y$10$fm5O8bPgtMHKlbnXWgS5C.1eoCwyHeTQNZ5ztq3wLXXPbxCllfCrG', NULL, '2023-04-22 16:54:38', '2023-04-22 16:54:38'),
(70, 'Sánchez Esquivel César', 'cesar.se@tec.com.mx', NULL, '$2y$10$Cd9QIUZmUBQNLSCZBYsuDuox/zrqEvMvUwLzpP.babSHZO3ns7uo.', NULL, '2023-04-22 16:58:05', '2023-04-22 16:58:05'),
(71, 'Sánchez Hernández Raúl de Jesús', 'raul.jesus.sh@tec.com.mx', NULL, '$2y$10$P.0qeZSvcAgxXyAtZm4wbeycXLVsJfhRZF8e4aOk/qK5/gFq8Cagy', NULL, '2023-04-22 16:58:45', '2023-04-22 16:58:45'),
(72, 'Sánchez Montemayor Jesús', 'jesus.sm@tec.com.mx', NULL, '$2y$10$I2gH3NFg39oHJgjtAqRIvewoIZeAdmjTOdKEjjHVwihxHEa.pKFei', NULL, '2023-04-22 16:59:20', '2023-04-22 16:59:20'),
(73, 'Sánchez Uribe Jesus Adolfo', 'jesus.adolf.su@tec.com.mx', NULL, '$2y$10$eeJm8MpAboK4jaVI.R.GcOMREDhZ2lsCj1/6AFc6XwohJGz/7lpJ2', NULL, '2023-04-22 17:00:02', '2023-04-22 17:00:02'),
(74, 'Valadez Zamarron Mayela del Carmen', 'maye.carmen.vz@tec.com.mx', NULL, '$2y$10$o4OfkaD.1AMsSGK7jaNcaOPjTNdq4e905LZHiVQuQVfzivnb4MRii', NULL, '2023-04-22 17:00:34', '2023-04-22 17:00:34'),
(75, 'Zertuche Zuñiga Homero', 'homero.z@tec.com.mx', NULL, '$2y$10$izvLOHkqGn0RIpe.r.J1TucBPZOvH2z5tDGbf80ShJVyUJm4KRSGK', NULL, '2023-04-22 17:01:20', '2023-04-22 17:01:20'),
(76, 'Pancho', 'pancho@tec.com.mx', NULL, '$2y$10$BWxcgMTSxzjBQe0pXurLcOKSuVYmPpoZVOqsmN4ObiIuJ6tOdh2LG', NULL, '2023-07-04 11:26:53', '2023-07-04 11:27:38'),
(77, 'Jose Luis', 'jose@tec.com.mx', NULL, '$2y$10$kbkgKpE6zoIMQJj356t3Ue/pfxa9IY0oxUht7SQuAf.s8MHiX3rSe', NULL, '2023-07-28 13:39:10', '2023-07-28 13:39:10'),
(85, 'Jonathan', 'jonathan@tec.com.mx', NULL, '$2y$10$i/bu6/n50imOM38xoeFNfuhiJKcWcM8iM05hp2ZIKWNIAOSJ1Xweu', NULL, '2023-07-29 06:18:32', '2023-07-29 06:18:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`IdAlumnos`);

--
-- Indexes for table `alumno_reprobados`
--
ALTER TABLE `alumno_reprobados`
  ADD PRIMARY KEY (`IdAlumno_reprobados`),
  ADD KEY `alumno_reprobados_alumno_id_foreign` (`Alumno_id`),
  ADD KEY `alumno_reprobados_materia_id_foreign` (`Materia_id`),
  ADD KEY `alumno_reprobados_calif_final_id_foreign` (`Calif_Final_id`),
  ADD KEY `alumno_reprobados_maestro_id_foreign` (`Maestro_id`),
  ADD KEY `alumno_reprobados_semestre_id_foreign` (`Semestre_id`),
  ADD KEY `alumno_reprobados_año_semestre_id_foreign` (`Año_id`),
  ADD KEY `alumno_reprobados_carrera_id_foreign` (`carrera_id`);

--
-- Indexes for table `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `archivos_alumno_id_foreign` (`Alumno_id`);

--
-- Indexes for table `año_semestres`
--
ALTER TABLE `año_semestres`
  ADD PRIMARY KEY (`IdAño_semestres`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calificacions`
--
ALTER TABLE `calificacions`
  ADD PRIMARY KEY (`IdCalificacions`),
  ADD KEY `calificacions_alumno_id_foreign` (`Alumno_id`),
  ADD KEY `calificacions_carrera_id_foreign` (`Carrera_id`),
  ADD KEY `calificacions_materia_id_foreign` (`Materia_id`);

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`IdCarreras`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `formatoanexo14`
--
ALTER TABLE `formatoanexo14`
  ADD PRIMARY KEY (`IdFormato14`) USING BTREE,
  ADD KEY `formatoanexo14_alumno_id_foreign` (`Alumno_id`),
  ADD KEY `formatoanexo14_carrera_id_foreign` (`Carrera_id`),
  ADD KEY `formatoanexo14_semestre_id_foreign` (`Semestre_id`),
  ADD KEY `formatoanexo14_materia_id_foreign` (`Materia_id`);

--
-- Indexes for table `formatoanexo19`
--
ALTER TABLE `formatoanexo19`
  ADD PRIMARY KEY (`IdFormatoAnexo19`),
  ADD KEY `formatoanexo19_alumno_id_foreign` (`Alumno`),
  ADD KEY `formatoanexo19_carrera_id_foreign` (`Carrera`),
  ADD KEY `formatoanexo19_materia_id_foreign` (`Materia`);

--
-- Indexes for table `formatoanexomensual19`
--
ALTER TABLE `formatoanexomensual19`
  ADD PRIMARY KEY (`Alumno_id`),
  ADD KEY `formatoanexoMensual19_alumno_id_foreign` (`NombreAlumno`),
  ADD KEY `formatoanexoMensual19_carrera_id_foreign` (`NombreCarrera`),
  ADD KEY `formatoanexoMensual19_materia_id_foreign` (`NombreMateria`);

--
-- Indexes for table `formatos`
--
ALTER TABLE `formatos`
  ADD PRIMARY KEY (`IdFormatos`),
  ADD KEY `calificacion_id` (`calificacion_id`);

--
-- Indexes for table `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`IdMaestros`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`IdMaterias`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `semestre_id` (`semestre_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`IdSemestres`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `IdAlumnos` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `alumno_reprobados`
--
ALTER TABLE `alumno_reprobados`
  MODIFY `IdAlumno_reprobados` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `año_semestres`
--
ALTER TABLE `año_semestres`
  MODIFY `IdAño_semestres` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `calificacions`
--
ALTER TABLE `calificacions`
  MODIFY `IdCalificacions` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `carreras`
--
ALTER TABLE `carreras`
  MODIFY `IdCarreras` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formatoanexo14`
--
ALTER TABLE `formatoanexo14`
  MODIFY `IdFormato14` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `formatoanexo19`
--
ALTER TABLE `formatoanexo19`
  MODIFY `IdFormatoAnexo19` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `formatoanexomensual19`
--
ALTER TABLE `formatoanexomensual19`
  MODIFY `Alumno_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `formatos`
--
ALTER TABLE `formatos`
  MODIFY `IdFormatos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `maestros`
--
ALTER TABLE `maestros`
  MODIFY `IdMaestros` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `materias`
  MODIFY `IdMaterias` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `semestres`
--
ALTER TABLE `semestres`
  MODIFY `IdSemestres` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumno_reprobados`
--
ALTER TABLE `alumno_reprobados`
  ADD CONSTRAINT `alumno_reprobados_alumno_id_foreign` FOREIGN KEY (`Alumno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_año_semestre_id_foreign` FOREIGN KEY (`Año_id`) REFERENCES `año_semestres` (`IdAño_semestres`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_calif_final_id_foreign` FOREIGN KEY (`Calif_Final_id`) REFERENCES `calificacions` (`IdCalificacions`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_carrera_id_foreign` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_maestro_id_foreign` FOREIGN KEY (`Maestro_id`) REFERENCES `calificacions` (`IdCalificacions`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_materia_id_foreign` FOREIGN KEY (`Materia_id`) REFERENCES `materias` (`IdMaterias`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_reprobados_semestre_id_foreign` FOREIGN KEY (`Semestre_id`) REFERENCES `semestres` (`IdSemestres`) ON DELETE CASCADE;

--
-- Constraints for table `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_alumno_id_foreign` FOREIGN KEY (`Alumno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `calificacions`
--
ALTER TABLE `calificacions`
  ADD CONSTRAINT `calificacions_alumno_id_foreign` FOREIGN KEY (`Alumno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calificacions_carrera_id_foreign` FOREIGN KEY (`Carrera_id`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificacions_materia_id_foreign` FOREIGN KEY (`Materia_id`) REFERENCES `materias` (`IdMaterias`) ON DELETE CASCADE;

--
-- Constraints for table `formatoanexo14`
--
ALTER TABLE `formatoanexo14`
  ADD CONSTRAINT `formatoanexo14_alumno_id_foreign` FOREIGN KEY (`Alumno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formatoanexo14_carrera_id_foreign` FOREIGN KEY (`Carrera_id`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `formatoanexo14_materia_id_foreign` FOREIGN KEY (`Materia_id`) REFERENCES `materias` (`IdMaterias`) ON DELETE CASCADE,
  ADD CONSTRAINT `formatoanexo14_semestre_id_foreign` FOREIGN KEY (`Semestre_id`) REFERENCES `semestres` (`IdSemestres`);

--
-- Constraints for table `formatoanexo19`
--
ALTER TABLE `formatoanexo19`
  ADD CONSTRAINT `formatoanexo19_alumno_id_foreign` FOREIGN KEY (`Alumno`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formatoanexo19_carrera_id_foreign	` FOREIGN KEY (`Carrera`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `formatoanexo19_materia_id_foreign` FOREIGN KEY (`Materia`) REFERENCES `materias` (`IdMaterias`) ON DELETE CASCADE;

--
-- Constraints for table `formatoanexomensual19`
--
ALTER TABLE `formatoanexomensual19`
  ADD CONSTRAINT `formatoanexoMensual19_alumno_id_foreign` FOREIGN KEY (`NombreAlumno`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formatoanexoMensual19_carrera_id_foreign	` FOREIGN KEY (`NombreCarrera`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `formatoanexoMensual19_materia_id_foreign` FOREIGN KEY (`NombreMateria`) REFERENCES `materias` (`IdMaterias`) ON DELETE CASCADE;

--
-- Constraints for table `formatos`
--
ALTER TABLE `formatos`
  ADD CONSTRAINT `formatos_calificacion_id` FOREIGN KEY (`calificacion_id`) REFERENCES `calificacions` (`IdCalificacions`) ON DELETE CASCADE;

--
-- Constraints for table `maestros`
--
ALTER TABLE `maestros`
  ADD CONSTRAINT `maestros_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE;

--
-- Constraints for table `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`IdCarreras`) ON DELETE CASCADE,
  ADD CONSTRAINT `materias_semestre_id` FOREIGN KEY (`semestre_id`) REFERENCES `semestres` (`IdSemestres`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
