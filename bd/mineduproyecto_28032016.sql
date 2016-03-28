-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2016 a las 11:26:17
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mineduproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE IF NOT EXISTS `actividad` (
  `id` int(11) NOT NULL,
  `objetivo_especifico_id` int(11) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `resultado_esperado` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_copia`
--

CREATE TABLE IF NOT EXISTS `actividad_copia` (
  `id` int(11) NOT NULL,
  `objetivo_especifico_id` int(11) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `resultado_esperado` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asunto`
--

CREATE TABLE IF NOT EXISTS `asunto` (
  `id` int(11) NOT NULL DEFAULT '0',
  `descripcion_cabecera` varchar(250) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `descripcion_larga` varchar(1000) DEFAULT NULL,
  `descripcion_corta` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asunto`
--

INSERT INTO `asunto` (`id`, `descripcion_cabecera`, `estado`, `padre_id`, `descripcion_larga`, `descripcion_corta`) VALUES
(1, 'No somos rebeldes, somos adolescentes', 1, 1, 'Existen ciertos mitos sobre cómo somos nosotros. Dicen que somos de tal modo y que actuamos de tal forma; como si todos fuéramos iguales, como si nos hubieran sacado de un solo molde. Creemos que ya es hora de romper esas falsas creencias y hablar de lo que realmente significa ser adolescente. ', 'Estereotipos sobre los adolescentes'),
(2, 'Mujeres y varones sin etiquetas', 1, 1, 'La sociedad quiere imponer ciertos comportamientos, capacidades y atributos a los varones y mujeres. Si salimos de esa dirección se nos trata perjudicialmente distinto. Si un varón es muy sensible o si una mujer es hábil con las herramientas parece que todos se les vienen encima. ¿Pero acaso debemos actuar como nos imponen que actuemos?', 'Discriminación por género'),
(3, 'Soy cultura viva, respétame', 1, 1, 'En nuestro territorio existen diversas culturas autóctonas. Cuando pertenecemos a alguna de ellas o cuando nos involucramos con sus problemas, descubrimos que no siempre reciben el respeto que merecen, a veces se les da un trato diferenciado o excluyente, como si las miraran por encima del hombro, y eso impide que hagan valer sus derechos en el campo político, económico, social y cultural. ', 'Discriminación por etnia'),
(4, 'No me llamo ni pituco, ni piraña, ni cholo, ni gringo', 1, 1, 'Algunos lo llaman clasismo o diferencia de clases. Básicamente nos clasifican de acuerdo a nuestros ingresos, la ocupación de nuestra familia, el nivel de estudio que tenemos y  si  podemos o no podemos comprar ciertas cosas. Esto lo hacen sin preocuparse por las distintas realidades que viven nuestras familias. Luego se da un trato desigual entre los más y menos favorecidos.', 'Discriminación por condición social'),
(5, '¡Las dificultades no son impedimentos! ', 1, 1, 'Que algunas personas tengan dificultades físicas, mentales, intelectuales o sensoriales a largo plazo, no significa que no pueden tener una vida plena. ¿Quién de nosotros no quiere una vida plena? ¿Acaso no es nuestro derecho? Sin embargo, la sociedad crea barreras que impiden  que estas personas gocen, como cualquier ciudadano, de los espacios y actividades de la vida social.', 'Discriminación por habilidades diferentes'),
(6, 'Tenemos el derecho de ser mejores', 1, 1, 'Una serie de circunstancias adversas pueden llevar a que tomemos malas decisiones, como cometer un acto infractor que nos pone en problemas con la ley.  En esas circunstancias pareciera que de golpe se derrumban nuestros sueños. Pero no debe ser así, no nos deben poner la cruz, es nuestro derecho recibir ayuda para reinsertarnos en la sociedad y desarrollarnos como ciudadanos.', 'Adolescentes en conflicto con la ley penal'),
(7, 'Sin vicios ni drogas', 1, 1, 'Nos resulta fácil pegarnos a algo, en ocasiones a cosas buenas, como la música, el deporte, etc.; pero en otras nos pegamos a cosas que o bien son malas de plano, como el alcohol u otras drogas o bien se vuelven malas cuando abusamos de ellas, como los videojuegos o el internet. Entonces las cosas resultan mal, nos volvemos en contra de nosotros mismos y de los que amamos.', 'Problemas de adicción'),
(8, '¿Trabajar o no trabajar? ', 1, 1, '¿Cuándo podemos comenzar a trabajar? ¿Cuál es la diferencia entre trabajar en la casa y trabajar fuera? ¿Es bueno que contemos con nuestro propio dinero? ¿Qué nos protege del trabajo forzoso y la explotación? Seguramente muchos expertos quieren dar respuesta, nosotros también; pero además queremos dialogar para ver lo bueno y lo malo del trabajo y cómo marchan las cosas.', 'Trabajo adolescente: riesgos y beneficios'),
(9, '¡Termine el cole!... ¿y ahora?', 1, 1, '¿Qué es lo que nos espera después de la escuela? ¿Acaso las mejores  oportunidades están ahí esperándonos o será que deberemos trazarnos un camino por nosotros mismos? ¿Tendremos las mismas oportunidades que todos? Sabemos que por lo general nos esperan dos cosas: trabajo o estudio; pero  ¿qué significa cada una de estos destinos?    ', 'Oportunidades de estudio y de trabajo'),
(10, 'Hablemos de sexo sin paltas ni roche', 1, 1, 'Los adolescentes hace tiempo que hablamos de sexo entre nosotros, pero no siempre sabemos si lo que escuchamos o hacemos es lo adecuado. De hecho que a veces tenemos dudas, y otras veces nos arriesgamos. Pero queremos conversar porque deseamos vivir nuestra sexualidad plenamente. Algunos adultos están dispuestos a hablar, pero otros más parece que quieren tapar ese tema.', 'Sexualidad en adolescentes'),
(11, 'Ser mamá y papá sin terminar el cole aún', 1, 1, 'Dicen que no debería suceder, pero sucede, incluso les pudo pasar a nuestros padres. A veces, los adolescentes nos convertimos en papá y mamá a pesar de los riesgos. Entonces todos, como si creyeran que controlamos el tiempo, nos hablan de lo que callaron. Mejor conversemos desde un inicio sobre lo que implica ser padres adolescentes, los peligros, las responsabilidades, las emociones, etc.', 'La responsabilidad de ser madres y padres en la adolescencia'),
(12, 'Nativos de la tecnología', 1, 1, 'Cuando los jóvenes tenemos acceso al internet y a la tecnología es como si se integraran a nuestro cuerpo; por eso nos llaman nativos tecnológicos, el internet y la tecnología son como nuestros otros mundos y los exploramos. Claro que hay cosas peligrosas, terrenos complicados; de hecho que a veces necesitamos a alguien que nos acompañe o a quien pedir consejo.', 'El uso de la tecnología, la internet y las redes sociales'),
(13, 'Tarjeta roja al bullying ', 1, 2, 'En la escuela pueden haber momento tranquilos, pero a veces la cosa anda fea. No falta alguien que se pone violento: habla como gritando, dice cosas hirientes, incluso hasta golpea a alguien (y mira que no siempre somos los alumnos). Entonces o bien enfrentamos el problema o bien las cosas se ponen peor. ¿Pero cómo hacemos eso?', 'Violencia escolar'),
(14, 'Participa, actúa y cambia tu escuela', 1, 2, 'Algunas escuelas parecen hechas para otros, pero no debe ser así. Nosotros tenemos derecho a tener una escuela diseñada a nuestra medida, que de verdad tome en cuenta lo que somos y pensamos; nada de escucharnos solo para cumplir. Por eso es importante organizarnos y  participar en nuestra educación. ¿Quién más que nosotros podría saber qué queremos y qué necesitamos? ', 'Participación y organización estudiantil en la escuela'),
(15, 'Participa, actúa y juégatela por tu comunidad', 1, 2, 'Nosotros los estudiantes somos los actores principales de la comunidad educativa, pero no los únicos. Los docentes, el director, el personal de la escuela, padres de familia, instituciones de la comunidad son también actores que participan en el mejoramiento de la escuela, ya sea en proyectos particulares o en la construcción de una educación integral que venza el espacio físico del colegio.', 'Participación de los actores de la comunidad educativa'),
(16, 'Construimos nuestras normas en la escuela', 1, 2, 'Para que las cosas marchen bien en nuestra escuela, tenemos que discutir y elaborar algunas normas y acuerdos. No se trata de que nos los impongan, se trata de construirlos en conjunto porque de otro modo no los sentiremos nuestros y no nos comprometeremos con ellos. Por eso nuestra disposición en seguirlas depende de cómo fueron construidas.', 'Construcción de normas y acuerdos en la escuela'),
(17, 'Con- VIVE y haz tuya la escuela', 1, 2, 'Hay ciertos temas que los estudiantes los aprendemos viviéndolos directamente, como la convivencia. Con tanto tiempo que pasamos en la escuela es normal que surjan distintos situaciones que debemos manejar adecuadamente para sentirnos a gusto. Puede resultar difícil, pero vale la pena trabajar para lograr un lugar donde todos podamos dialogar, respetarnos y sentirnos bien.', 'Convivencia en la escuela'),
(18, '¡Somos comunidad, somos solución!', 1, 2, 'Por supuesto que nos preocupa nuestra comunidad. Como no hacerlo si somos parte de ella, ¿acaso a nosotros no nos afectan sus problemas? Pues claro que sí.  Es más, tenemos algunas ideas para resolverlos y otras para mejorar la comunidad. Solo hay que encontrar la forma y oportunidad para llevarlas a la realidad; las ganas ya las tenemos.', 'Posibilidades de aporte a la comunidad'),
(19, 'Aprendizajes para la vida', 1, 2, '¿Qué tal si comienzan por preguntarnos qué es lo que queremos y necesitamos aprender? Quizás así lleguemos a un acuerdo. Como ustedes dicen “vivimos tiempos distintos”, y aunque nosotros debemos ceder en algunos puntos porque su experiencia es mayor y sabemos que quieren nuestro bien, también ustedes deben escucharnos y adaptarse a nosotros, a nuestro tiempo y a nuestras prioridades.', 'Necesidades educativas de los estudiantes'),
(20, 'Con Secundaria completa sí la hacemos', 1, 2, 'Para algunos de nosotros resulta un reto terminar la escuela. Existen circunstancias diversas en nuestra comunidad, en nuestra familia o en la propia escuela que nos empujan hacia afuera. Cuando vemos a un compañero que se retira sentimos que esa pérdida es de todos, nos preguntamos ¿qué será de él? ¿Qué es lo que va mal en nuestra comunidad escolar?', 'Deserción escolar'),
(21, 'Nuestros derechos se respetan', 1, 3, 'Los niños, niñas y adolescentes tenemos un conjunto de derechos que nadie puede pasar por encima o al menos eso es lo que dice la ley. Pero la realidad es otra, nosotros seguimos siendo uno de los sectores más vulnerables de la población. Para evitar que esto pase debemos conocer nuestros derechos y buscar formas para asegurar que se respeten.', 'Derechos de niños, niñas y adolescentes'),
(22, '¡Yo decido! Mi cuerpo, mis derechos ', 1, 3, 'Nuestro cuerpo es nuestro territorio individual, por eso las decisiones que tengan que ver con él solo pueden ser tomadas por nosotros mismos. Una serie de derechos nos protegen en materia de nuestra sexualidad y reproducción, nadie más que nosotros manda ahí. Lamentablemente, algunos sectores de la sociedad creen que las costumbres están por encima de los derechos.', 'Derechos sexuales y reproductivos'),
(23, 'Ciudadanos en acción', 1, 3, 'La mayoría de personas parecen que fueran ciudadanos en modo “apagado”. Son pocos los que  buscan el bien común y se comprometen con lo público participando en el fortalecimiento de las instituciones de la democracia. Pocos están dispuestos a enfrentar una sociedad autoritaria, discriminadora, desigual, etc. No obstante, es necesario que nos activemos e involucremos para lograr una sociedad más justa y humana. ', 'Ejercicio ciudadano '),
(24, 'Dale calidad a tu vida', 1, 3, 'Muchas personas piensan que la calidad de vida se relaciona con sus ingresos y  la tranquilidad social, otras piensan que se trata del acceso a  bienes y servicios que el Estado debe asegurar; incluso hay quienes creen que depende del bienestar mental y emocional. Cada quien parece tener un concepto distinto, ¿guardarán estos alguna relación?', 'Calidad de vida'),
(25, 'Túmbate a la corrupción', 1, 3, 'Pareciera que la gente ya se ha acostumbrado a la corrupción, incluso algunos la aceptan como normal y no la combaten. ¡Qué contradictorio con lo que nos quieren inculcar! Será acaso que la corrupción ha aprendido a camuflar lo que produce: obras públicas mal hechas, malos conductores con licencia, delincuentes impunes,  pérdida del dinero público, etc.', 'La problemática de la corrupción'),
(26, 'Sismos, huaycos, heladas, inundaciones… ¿Estás preparado? ', 1, 3, 'En nuestro país se dan varios fenómenos naturales, tales como sismos, inundaciones, heladas, huaicos, etc. Por lo que resulta importante prever y considerar los peligros a los que se enfrenta la población para tomar decisiones y actuar antes de que ocurran los desastres. Para esto, también  se necesita la organización de distintos actores y acciones.', 'Gestión del riesgo de desastres'),
(27, 'Camina seguro, camina sin miedos… ¿es posible?', 1, 3, 'Pasear sin preocupación y temor por los lugares públicos debería ser algo común; sin embargo actualmente las medidas para evitar los delitos y asegurar el bienestar de los ciudadanos no han dado frutos. Pero las acciones de seguridad ciudadana no solo las debe llevar a cabo el Estado, sino que deben colaborar también otras organizaciones y nosotros, la ciudadanía.', 'Seguridad ciudadana'),
(28, 'Para tus hijos, y los hijos de tus hijos', 1, 3, 'Sabemos que detrás de nosotros vienen nuevas generaciones que también necesitarán satisfacer sus necesidades, por eso resulta importante procurar que la naturaleza pueda renovarse y revierta los efectos de nuestras actividades de manera simultánea. Además, para lograr la prosperidad de las generaciones futuras, debemos asegurar la calidad de vida de todas las personas y su bienestar social.', 'Desarrollo sostenible'),
(29, 'No se compra, no se vende', 1, 3, 'Las personas no somos objetos a los que se les puede comprar, vender o usar. Sin embargo, algunos piensan que pueden hacer eso, y violando los derechos fundamentales de las personas comercian con ellas como si fueran mercancía. Muchas veces las víctimas facilitan su propia desgracia al caer en engaños, creer en falsas promesas y no conocer sus derechos.', 'La trata de personas  '),
(30, 'Somos país, somos culturas. ', 1, 3, 'Cuando hablamos con personas que provienen de un lugar distinto al nuestro, nos llevamos sorpresas, descubrimos que tienen costumbres distintas, incluso algunos hablan otro idioma. Entonces, comprendemos que vamos a tener opiniones diferentes en algunas cosas, ya que las contemplamos de modo distinto, según nuestra cultura. ¿Será posible una convivencia armónica entre personas provenientes de distintas culturas?', '•	Desafíos de la convivencia intercultural'),
(31, 'Gobiernos descentralizados en la lupa', 1, 3, 'Mi familia dice que hace algunos años en el Perú no se hacía nada si el gobierno central no lo ordenaba. Si se necesitaba algo o había un problema, se tenía que esperar que el gobierno central lo resolviera. Eso sí que era centralismo. Por suerte, ahora hay gobiernos locales  que toman decisiones y acciones en nuestra región, descentralización lo llaman. ¿Estos gobiernos locales estarán haciendo bien su trabajo? ¿Nos está favoreciendo su gestión?', '•	Centralismo y descentralización'),
(32, 'Peatones y conductores en rutas seguras', 1, 3, 'Cuando nos topamos con una autopista que suele ser descrita como peligrosa, entendemos lo importante que resulta conocer y aprender de educación vial. Las pistas y vías públicas son parte de nuestra cotidianeidad, no pueden convertirse en un lugar al que temer. Por ello, debemos conocer sus peligros y aprehender las medidas para prevenir accidentes.', '•	Educación en seguridad vial'),
(33, 'Deja de gritar, educa sin violencia', 1, 3, 'A veces los lugares en los que deberíamos sentirnos más seguros, resultan peligrosos. Nuestros hogares tendrían que ser un refugio de tranquilidad y amor, pero en algunos casos la violencia es la que se impone entre los miembros de la familia; gritos, hostigamiento, intimidación, incluso golpes destruyen la armonía, el respeto y la dignidad.', '•	Violencia familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_spanish2_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrador', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_spanish2_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_spanish2_ci,
  `rule_name` varchar(64) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `data` text COLLATE utf8_spanish2_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrador', 4, NULL, NULL, NULL, NULL, NULL),
('alumno', 3, NULL, NULL, NULL, NULL, NULL),
('integrante', 2, NULL, NULL, NULL, NULL, NULL),
('lider', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_spanish2_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_spanish2_ci NOT NULL,
  `data` text COLLATE utf8_spanish2_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE IF NOT EXISTS `cronograma` (
  `id` int(11) NOT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma_copia`
--

CREATE TABLE IF NOT EXISTS `cronograma_copia` (
  `id` int(11) NOT NULL,
  `actividad_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE IF NOT EXISTS `encuesta` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `p1_1` varchar(250) DEFAULT NULL COMMENT '¿De qué manera planeas acceder a la plataforma?',
  `p1_2` varchar(250) DEFAULT NULL COMMENT '¿De qué manera planeas acceder a la plataforma?',
  `p1_3` varchar(250) DEFAULT NULL COMMENT '¿De qué manera planeas acceder a la plataforma?',
  `p1_4` varchar(250) DEFAULT NULL COMMENT '¿De qué manera planeas acceder a la plataforma?',
  `p2` varchar(11) DEFAULT NULL COMMENT 'Has desarrollado un proyecto participativo antes?',
  `p3_1` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p3_2` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p3_3` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p3_4` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p3_5` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p3_6` varchar(250) DEFAULT NULL COMMENT '¿De qué manera contribuyó el Proyecto participativo?',
  `p4_1` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p4_2` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p4_3` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p4_4` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p4_5` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p4_6` varchar(250) DEFAULT NULL COMMENT '¿Por qué quieres participar del concurso?',
  `p5_1` varchar(250) DEFAULT NULL COMMENT '¿Dónde planeas trabajar con tu equipo de trabajo?',
  `p5_2` varchar(250) DEFAULT NULL COMMENT '¿Dónde planeas trabajar con tu equipo de trabajo?',
  `p6_1` varchar(250) DEFAULT NULL COMMENT '¿Cuándo vas a trabajar con tu equipo de trabajo?',
  `p6_2` varchar(250) DEFAULT NULL COMMENT '¿Cuándo vas a trabajar con tu equipo de trabajo?',
  `p6_3` varchar(250) DEFAULT NULL COMMENT '¿Cuándo vas a trabajar con tu equipo de trabajo?',
  `p6_4` varchar(250) DEFAULT NULL COMMENT '¿Cuándo vas a trabajar con tu equipo de trabajo?'
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL,
  `asunto_id` int(11) NOT NULL,
  `descripcion_equipo` varchar(250) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `id` int(11) NOT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `nombres_apellidos` varchar(250) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `fecha_nac` datetime DEFAULT NULL,
  `email` varchar(150) NOT NULL DEFAULT '',
  `celular` varchar(9) DEFAULT NULL,
  `grado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapa`
--

CREATE TABLE IF NOT EXISTS `etapa` (
  `id` int(11) NOT NULL,
  `etapa` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `etapa`
--

INSERT INTO `etapa` (`id`, `etapa`, `estado`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `evaluacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE IF NOT EXISTS `institucion` (
  `id` int(11) NOT NULL,
  `denominacion` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `ruc` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ubigeo_id` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `codigo_modular` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `unidad_gestion_educativa_local_id` int(11) DEFAULT NULL,
  `tipo_institucion` int(11) DEFAULT NULL,
  `ruta_escale` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `jec` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1607 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(1, 'JOSEFA CARRILLO Y ALBORNOZ', NULL, NULL, NULL, '140112', '0340372', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340372&anexo=0', 2015),
(2, 'MAYOR PIP FELIX ROMAN TELLO ROJAS', NULL, NULL, NULL, '140110', '0692467', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0692467&anexo=0', 2015),
(3, 'NUESTRA SEÃ‘ORA DE LA SABIDURIA', NULL, NULL, NULL, '140112', '0340380', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340380&anexo=0', 2015),
(4, 'PABLO PATRON', NULL, NULL, NULL, '140112', '0245704', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245704&anexo=0', 2015),
(5, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '140139', '0692459', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0692459&anexo=0', 2015),
(6, '6005 GENERAL EMILIO SOYER CABERO', NULL, NULL, NULL, '140108', '0504993', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0504993&anexo=0', 2015),
(7, '6049 RICARDO PALMA', NULL, NULL, NULL, '140131', '0325464', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0325464&anexo=0', 2015),
(8, 'ALCIDES VIGO HURTADO', NULL, NULL, NULL, '140130', '0583203', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583203&anexo=0', 2015),
(9, 'LOS EDUCADORES', NULL, NULL, NULL, '140138', '0649897', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0649897&anexo=0', 2015),
(10, 'TECNICO FAP MANUEL POLO JIMENEZ', NULL, NULL, NULL, '140130', '0325662', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0325662&anexo=0', 2015),
(11, '4001 DOS DE MAYO', NULL, NULL, NULL, '141101', '0209304', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0209304&anexo=0', 2015),
(12, 'MILITAR LEONCIO PRADO', NULL, NULL, NULL, '141105', '0209973', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0209973&anexo=0', 2015),
(13, '5138', NULL, NULL, NULL, '141106', '1381896', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1381896&anexo=0', 2015),
(14, 'SAN JUAN BAUTISTA', NULL, NULL, NULL, '190115', '0355883', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355883&anexo=0', 2015),
(15, 'LAS CAPULLANAS', NULL, NULL, NULL, '190601', '0355966', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355966&anexo=0', 2015),
(16, 'SEÃ‘OR CAUTIVO', NULL, NULL, NULL, '190201', '0356014', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356014&anexo=0', 2015),
(17, 'INIF 48', NULL, NULL, NULL, '190601', '0356782', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356782&anexo=0', 2015),
(18, 'ERNESTO MERINO RIVERA', NULL, NULL, NULL, '190204', '0490169', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0490169&anexo=0', 2015),
(19, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '190210', '0512343', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0512343&anexo=0', 2015),
(20, 'LIZARDO OTERO ALCAS', NULL, NULL, NULL, '190605', '0535203', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535203&anexo=0', 2015),
(21, 'ANDRES AVELINO CACERES', NULL, NULL, NULL, '190604', '0536904', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0536904&anexo=0', 2015),
(22, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '190106', '0571166', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571166&anexo=0', 2015),
(23, 'SAN FRANCISCO DE CHOCAN', NULL, NULL, NULL, '190606', '0571257', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571257&anexo=0', 2015),
(24, 'COMPLEJO EDUCATIVO SANTA SOFIA', NULL, NULL, NULL, '190608', '0571513', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571513&anexo=0', 2015),
(25, 'JIBITO SAN ANTONIO DE PADUA', NULL, NULL, NULL, '190605', '0708446', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0708446&anexo=0', 2015),
(26, '14791', NULL, NULL, NULL, '190601', '0750513', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0750513&anexo=0', 2015),
(27, 'MANUEL SCORZA', NULL, NULL, NULL, '190103', '1018282', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1018282&anexo=0', 2015),
(28, 'MAYOR PNP (F) ROBERTO VICENTE MORALES ROJAS', NULL, NULL, NULL, '190601', '1138221', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1138221&anexo=0', 2015),
(29, 'SAN VICENTE', NULL, NULL, NULL, '190205', '0719476', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0719476&anexo=0', 2015),
(30, 'LA UNION', NULL, NULL, NULL, '190106', '0938829', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0938829&anexo=0', 2015),
(31, 'CORONEL JOSE JOAQUIN INCLAN', NULL, NULL, NULL, '190101', '1096981', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1096981&anexo=0', 2015),
(32, 'NUESTRA SEÃ‘ORA DEL PERPETUO SOCORRO', NULL, NULL, NULL, '190115', '0355875', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355875&anexo=0', 2015),
(33, 'CIRO ALEGRIA', NULL, NULL, NULL, '190402', '0356279', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356279&anexo=0', 2015),
(34, 'SAN LORENZO', NULL, NULL, NULL, '190109', '0356352', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356352&anexo=0', 2015),
(35, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '190208', '0356832', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356832&anexo=0', 2015),
(36, 'HORACIO ZEVALLOS GAMEZ', NULL, NULL, NULL, '190109', '0490474', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0490474&anexo=0', 2015),
(37, 'SAPILLICA', NULL, NULL, NULL, '190206', '0493619', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0493619&anexo=0', 2015),
(38, 'SAN MIGUEL ARCANGEL', NULL, NULL, NULL, '190307', '0511840', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0511840&anexo=0', 2015),
(39, 'MILITAR PEDRO RUIZ GALLO', NULL, NULL, NULL, '190103', '0512251', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0512251&anexo=0', 2015),
(40, 'FE Y ALEGRIA 15', NULL, NULL, NULL, '190103', '0535195', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535195&anexo=0', 2015),
(41, 'JOSE CARLOS MARIATEGUI LACHIRA', NULL, NULL, NULL, '190104', '0635615', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635615&anexo=0', 2015),
(42, 'ATAHUALPA', NULL, NULL, NULL, '190109', '0635755', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635755&anexo=0', 2015),
(43, 'LOS ALGARROBOS', NULL, NULL, NULL, '190101', '0674374', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674374&anexo=0', 2015),
(44, '15434 JESUS DE NAZARETH', NULL, NULL, NULL, '190109', '0675074', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0675074&anexo=0', 2015),
(45, '14926', NULL, NULL, NULL, '190107', '0535005', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535005&anexo=0', 2015),
(46, '15117 VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '190107', '0613901', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0613901&anexo=0', 2015),
(47, 'CHIPILLICO', NULL, NULL, NULL, '190107', '0675066', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0675066&anexo=0', 2015),
(48, '14146', NULL, NULL, NULL, '190109', '0719005', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0719005&anexo=0', 2015),
(49, 'AREAS TECNICAS', NULL, NULL, NULL, '190303', '1095546', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1095546&anexo=0', 2015),
(50, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '190301', '0356022', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356022&anexo=0', 2015),
(51, 'INCA PACHACUTEC', NULL, NULL, NULL, '190301', '0356030', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356030&anexo=0', 2015),
(52, 'AGROPECUARIO 13', NULL, NULL, NULL, '190301', '0356626', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356626&anexo=0', 2015),
(53, 'AGROPECUARIO 07', NULL, NULL, NULL, '190103', '0356634', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356634&anexo=0', 2015),
(54, 'VIRGEN DE LA ASUNCION', NULL, NULL, NULL, '190304', '0490284', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0490284&anexo=0', 2015),
(55, 'BERNAL', NULL, NULL, NULL, '190803', '0512228', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0512228&anexo=0', 2015),
(56, 'ALMIRANTE MIGUEL GRAU Y SEMINARIO', NULL, NULL, NULL, '190306', '0513747', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0513747&anexo=0', 2015),
(57, 'RICARDO PALMA', NULL, NULL, NULL, '190105', '0571315', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571315&anexo=0', 2015),
(58, 'ALEJANDRO SANCHEZ ARTEAGA', NULL, NULL, NULL, '190105', '0576868', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576868&anexo=0', 2015),
(59, 'PEDRO POTENCIANO CHOQUEHUANCA', NULL, NULL, NULL, '190305', '0635672', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635672&anexo=0', 2015),
(60, 'FEDERICO VILLARREAL', NULL, NULL, NULL, '190113', '0674358', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674358&anexo=0', 2015),
(61, 'COLEGIO TECNICO DE APLICACION', NULL, NULL, NULL, '190105', '0938647', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0938647&anexo=0', 2015),
(62, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '190202', '0626564', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0626564&anexo=0', 2015),
(63, 'FAP ALF SAMUEL ORDOÃ‘EZ VELASQUEZ', NULL, NULL, NULL, '190103', '1206911', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1206911&anexo=0', 2015),
(64, '14093 ABRAHAM RUIZ NUNURA', NULL, NULL, NULL, '190802', '1207083', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1207083&anexo=0', 2015),
(65, 'FE Y ALEGRIA 49', NULL, NULL, NULL, '190115', '1553726', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1553726&anexo=0', 2015),
(66, '14079', NULL, NULL, NULL, '190801', '1606698', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1606698&anexo=0', 2015),
(67, 'LA INMACULADA', NULL, NULL, NULL, '190701', '0355933', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355933&anexo=0', 2015),
(68, 'ENRIQUE LOPEZ ALBUJAR', NULL, NULL, NULL, '190101', '0356071', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356071&anexo=0', 2015),
(69, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '190404', '0356147', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356147&anexo=0', 2015),
(70, 'AUGUSTO SALAZAR BONDY', NULL, NULL, NULL, '190706', '0356162', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356162&anexo=0', 2015),
(71, 'MANUEL PIO DE ZUÃ‘IGA Y RAMIREZ', NULL, NULL, NULL, '190504', '0356212', 1, 6, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356212&anexo=0', 2015),
(72, 'MARISCAL CASTILLA', NULL, NULL, NULL, '190505', '0356220', 1, 6, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356220&anexo=0', 2015),
(73, 'LA BREA', NULL, NULL, NULL, '190703', '0356253', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356253&anexo=0', 2015),
(74, 'TUPAC AMARU', NULL, NULL, NULL, '190202', '0356303', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356303&anexo=0', 2015),
(75, 'SANTA RITA', NULL, NULL, NULL, '190404', '0356451', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356451&anexo=0', 2015),
(76, 'JOSE PARDO Y BARREDA', NULL, NULL, NULL, '190703', '0490383', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0490383&anexo=0', 2015),
(77, 'JORGE BASADRE', NULL, NULL, NULL, '190205', '0514448', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0514448&anexo=0', 2015),
(78, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '190506', '0570986', 1, 6, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0570986&anexo=0', 2015),
(79, 'SAN JOSE', NULL, NULL, NULL, '190504', '0674556', 1, 6, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674556&anexo=0', 2015),
(80, '14036 SAN MIGUEL ARCANGEL', NULL, NULL, NULL, '190104', '0938407', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0938407&anexo=0', 2015),
(81, '15508 DOMINGO SAVIO', NULL, NULL, NULL, '190701', '1137421', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1137421&anexo=0', 2015),
(82, 'CAP. FAP JOSE EMILIO VELARDE VARGAS', NULL, NULL, NULL, '190701', '1180199', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1180199&anexo=0', 2015),
(83, 'FELIX CIPRIANOCORONEL ZEGARRA', NULL, NULL, NULL, '190702', '0356246', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356246&anexo=0', 2015),
(84, 'SAN RAMON', NULL, NULL, NULL, '190401', '0356048', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356048&anexo=0', 2015),
(85, 'MARIA AUXILIADORA', NULL, NULL, NULL, '190401', '0356139', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356139&anexo=0', 2015),
(86, 'SAN FERNANDO', NULL, NULL, NULL, '190403', '0356287', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356287&anexo=0', 2015),
(87, 'SANTA ANA', NULL, NULL, NULL, '190303', '0356444', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356444&anexo=0', 2015),
(88, 'MAURO REYNALDO GIRALDO ROMERO', NULL, NULL, NULL, '190407', '0356709', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356709&anexo=0', 2015),
(89, 'JOSE MARIA ARGUEDAS ALTAMIRANO', NULL, NULL, NULL, '190401', '0515171', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0515171&anexo=0', 2015),
(90, 'SAN AGUSTIN', NULL, NULL, NULL, '190408', '0523449', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523449&anexo=0', 2015),
(91, 'SAN JOSE', NULL, NULL, NULL, '190409', '0523944', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523944&anexo=0', 2015),
(92, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '190410', '0570895', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0570895&anexo=0', 2015),
(93, 'CESAR VALLEJO', NULL, NULL, NULL, '190405', '0571133', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571133&anexo=0', 2015),
(94, 'JOSE PINTADO BERRU', NULL, NULL, NULL, '190401', '0572479', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0572479&anexo=0', 2015),
(95, 'JOSE GALVEZ EGUSQUIZA', NULL, NULL, NULL, '190401', '0576827', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576827&anexo=0', 2015),
(96, 'VICUS', NULL, NULL, NULL, '190401', '0674499', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674499&anexo=0', 2015),
(97, 'IGNACIO ESCUDERO', NULL, NULL, NULL, '190401', '1097104', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1097104&anexo=0', 2015),
(98, 'AGROPECUARIO 33 AMAUTA', NULL, NULL, NULL, '190401', '0356642', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356642&anexo=0', 2015),
(99, 'DOS DE MAYO', NULL, NULL, NULL, '190401', '0576843', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576843&anexo=0', 2015),
(100, 'HORACIO ZEVALLOS GAMEZ', NULL, NULL, NULL, '190408', '0674507', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674507&anexo=0', 2015),
(101, '20037 SANTISIMA CRUZ', NULL, NULL, NULL, '190401', '1560382', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1560382&anexo=0', 2015),
(102, 'Santo Toribio', NULL, NULL, NULL, '210501', '0562462', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0562462&anexo=0', 2015),
(103, 'Marcelino ChÃ¡vez Villaverde', NULL, NULL, NULL, '210504', '0273896', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273896&anexo=0', 2015),
(104, 'BilingÃ¼e', NULL, NULL, NULL, '210509', '0603399', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0603399&anexo=0', 2015),
(105, 'San Fernando', NULL, NULL, NULL, '210507', '0638072', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0638072&anexo=0', 2015),
(106, 'Augusto Salazar Bondy', NULL, NULL, NULL, '210505', '0657783', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0657783&anexo=0', 2015),
(107, 'Wilfredo Ezequiel Ponce Chirinos', NULL, NULL, NULL, '210503', '0707653', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0707653&anexo=0', 2015),
(108, 'Santiago Antunes de Mayolo', NULL, NULL, NULL, '210505', '0761882', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0761882&anexo=0', 2015),
(109, '00110 Linorio ChÃ¡vez HernÃ¡ndez', NULL, NULL, NULL, '210509', '1120096', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1120096&anexo=0', 2015),
(110, '00884 Los Olivos', NULL, NULL, NULL, '210505', '1217439', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1217439&anexo=0', 2015),
(111, '00903 San Juan Bautista', NULL, NULL, NULL, '210505', '1242965', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1242965&anexo=0', 2015),
(112, '00804', NULL, NULL, NULL, '210101', '1118777', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1118777&anexo=0', 2015),
(113, 'Clemente LÃ³pez MontalvÃ¡n', NULL, NULL, NULL, '210102', '0548834', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548834&anexo=0', 2015),
(114, 'Ignacia VelÃ¡squez', NULL, NULL, NULL, '210101', '0273524', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273524&anexo=0', 2015),
(115, 'JesÃºs Alberto Miranda Calle', NULL, NULL, NULL, '210101', '0481184', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0481184&anexo=0', 2015),
(116, 'Dionisio Ocampo ChÃ¡vez', NULL, NULL, NULL, '210106', '0637983', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637983&anexo=0', 2015),
(117, '00172 JosÃ© Luis Purizaca Aldana', NULL, NULL, NULL, '210101', '1118819', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1118819&anexo=0', 2015),
(118, 'Juan Velasco Alvarado', NULL, NULL, NULL, '210104', '1242882', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1242882&anexo=0', 2015),
(119, 'JosÃ© Faustino SÃ¡nchez CarriÃ³n', NULL, NULL, NULL, '210315', '0676155', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0676155&anexo=0', 2015),
(120, 'O773', NULL, NULL, NULL, '210303', '0547125', 1, 90, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547125&anexo=0', 2015),
(121, 'JosÃ© Carlos MariÃ¡tegui La Chira', NULL, NULL, NULL, '210907', '0536789', 1, 93, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0536789&anexo=0', 2015),
(122, '0020 Ernesto ChÃ¡vez Tamariz', NULL, NULL, NULL, '210201', '0639971', 1, 89, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0639971&anexo=0', 2015),
(123, 'Cahuide', NULL, NULL, NULL, '210403', '0273623', 1, 91, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273623&anexo=0', 2015),
(124, '0755 Horacio Zevallos GÃ¡mez', NULL, NULL, NULL, '210402', '0548719', 1, 91, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548719&anexo=0', 2015),
(125, 'Arturo Bartra GarcÃ­a', NULL, NULL, NULL, '210405', '0789016', 1, 91, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0789016&anexo=0', 2015),
(126, 'Manuel Scorza', NULL, NULL, NULL, '210801', '1078922', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1078922&anexo=0', 2015),
(127, 'O633 ', NULL, NULL, NULL, '210803', '0726703', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0726703&anexo=0', 2015),
(128, 'Victor RaÃºl Haya De La Torre ', NULL, NULL, NULL, '210803', '0676023', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0676023&anexo=0', 2015),
(129, '0463 Gustavo Rivera Rivera', NULL, NULL, NULL, '210805', '1594555', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1594555&anexo=0', 2015),
(130, '0641 Ricardo Palma Soriano', NULL, NULL, NULL, '210805', '1079888', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1079888&anexo=0', 2015),
(131, '0426 Inmaculada ConcepciÃ³n', NULL, NULL, NULL, '210805', '1079805', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1079805&anexo=0', 2015),
(132, 'Nicanor ReÃ¡tegui Del Ãguila', NULL, NULL, NULL, '210802', '0273649', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273649&anexo=0', 2015),
(133, 'JosÃ© GÃ¡lvez Barrenechea', NULL, NULL, NULL, '210805', '0273631', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273631&anexo=0', 2015),
(134, 'SANTIAGO ANTÃšNEZ DE MAYOLO', NULL, NULL, NULL, '010101', '0678615', 1, 14, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0678615&anexo=0', 2015),
(135, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '010109', '0568071', 1, 14, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0568071&anexo=0', 2015),
(136, '18207 SAN NICOLÃS', NULL, NULL, NULL, '010501', '1130236', 1, 17, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1130236&anexo=0', 2015),
(137, 'ALONSO DE ALVARADO', NULL, NULL, NULL, '010701', '0263020', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263020&anexo=0', 2015),
(138, 'JORGE BASADRE', NULL, NULL, NULL, '010706', '0527531', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0527531&anexo=0', 2015),
(139, 'SAN JUAN', NULL, NULL, NULL, '010702', '0583344', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583344&anexo=0', 2015),
(140, 'RAMÃ“N CASTILLA', NULL, NULL, NULL, '010701', '0583559', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583559&anexo=0', 2015),
(141, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '010702', '0583583', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583583&anexo=0', 2015),
(142, 'ZENOBIO ZUMAETA', NULL, NULL, NULL, '010702', '0583708', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583708&anexo=0', 2015),
(143, 'JOSE OLAYA BALANDRA', NULL, NULL, NULL, '010702', '0623587', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0623587&anexo=0', 2015),
(144, '17047 JUAN BLAS VALERA', NULL, NULL, NULL, '010705', '0658450', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0658450&anexo=0', 2015),
(145, 'RAMÃ“N CASTILLA', NULL, NULL, NULL, '010409', '0262279', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262279&anexo=0', 2015),
(146, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '010405', '0643635', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643635&anexo=0', 2015),
(147, 'PABLO VISALOT', NULL, NULL, NULL, '010301', '0262220', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262220&anexo=0', 2015),
(148, 'PEDRO RUIZ GALLO', NULL, NULL, NULL, '010312', '0504662', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0504662&anexo=0', 2015),
(149, 'JOSÃ‰ CARLOS MARIÃTEGUI', NULL, NULL, NULL, '010306', '0567925', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0567925&anexo=0', 2015),
(150, 'AGROPECUARIO TORIBIO R. DE MENDOZA', NULL, NULL, NULL, '010205', '0263103', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263103&anexo=0', 2015),
(151, 'LA INMACULADA', NULL, NULL, NULL, '010205', '0521013', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521013&anexo=0', 2015),
(152, 'AMAZONAS', NULL, NULL, NULL, '010202', '0521500', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521500&anexo=0', 2015),
(153, 'SAGRADO CORAZÃ“N DE JESÃšS', NULL, NULL, NULL, '010203', '0583377', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583377&anexo=0', 2015),
(154, 'NUESTRA SEÃ‘ORA DE GUADALUPE FE Y ALEGRÃA 31', NULL, NULL, NULL, '010201', '0658427', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0658427&anexo=0', 2015),
(155, 'TECNICO INDUSTRIAL BAGUA', NULL, NULL, NULL, '010205', '0926527', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0926527&anexo=0', 2015),
(156, '16192', NULL, NULL, NULL, '010205', '1401678', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1401678&anexo=0', 2015),
(157, 'SAN SIMÃ“N', NULL, NULL, NULL, '010412', '0522870', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522870&anexo=0', 2015),
(158, 'CÃ‰SAR ALCIDES DE LA CRUZ D.', NULL, NULL, NULL, '010402', '0643650', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643650&anexo=0', 2015),
(159, 'CÃ‰SAR VALLEJO', NULL, NULL, NULL, '010423', '0913889', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0913889&anexo=0', 2015),
(160, 'FE Y ALEGRÃA 55 VELENTÃN SALEGUI', NULL, NULL, NULL, '010206', '0263111', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263111&anexo=0', 2015),
(161, 'ALBERTO ACOSTA HERRERA', NULL, NULL, NULL, '010206', '0489609', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489609&anexo=0', 2015),
(162, 'SANTO TOMAS', NULL, NULL, NULL, '010420', '0536318', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0536318&anexo=0', 2015),
(163, 'CESAR ABRAHAM VALLEJO MENDOZA', NULL, NULL, NULL, '010703', '0521203', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521203&anexo=0', 2015),
(164, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '010703', '0623447', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0623447&anexo=0', 2015),
(165, 'FE Y ALEGRÃA 38', NULL, NULL, NULL, '010701', '0767350', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0767350&anexo=0', 2015),
(166, 'NIEVA', NULL, NULL, NULL, '010601', '0491811', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0491811&anexo=0', 2015),
(167, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '010601', '0926006', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0926006&anexo=0', 2015),
(168, 'TECNICO INDUSTRIAL TUPAC AMARU', NULL, NULL, NULL, '010206', '0593947', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0593947&anexo=0', 2015),
(169, 'SANTA ROSA', NULL, NULL, NULL, '160101', '0233270', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233270&anexo=0', 2015),
(170, 'GUILLERMO BILLINGHURST', NULL, NULL, NULL, '160101', '0236182', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236182&anexo=0', 2015),
(171, 'DOS DE MAYO', NULL, NULL, NULL, '160302', '0236497', 1, 19, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236497&anexo=0', 2015),
(172, 'SIMON BOLIVAR', NULL, NULL, NULL, '160102', '0579367', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579367&anexo=0', 2015),
(173, 'JAVIER HERAUD', NULL, NULL, NULL, '160104', '0688291', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0688291&anexo=0', 2015),
(174, 'CAP. FAP JOSE ABELARDO QUIÃ‘ONES', NULL, NULL, NULL, '160101', '0935692', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0935692&anexo=0', 2015),
(175, 'LA PASTORA', NULL, NULL, NULL, '160101', '1543917', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1543917&anexo=0', 2015),
(176, 'SAN JUAN DE LA VIRGEN', NULL, NULL, NULL, '230106', '0467142', 1, 87, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0467142&anexo=0', 2015),
(177, 'SAN PEDRO', NULL, NULL, NULL, '230203', '0572552', 1, 86, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0572552&anexo=0', 2015),
(178, '035 HORACIO ZEVALLOS GAMEZ', NULL, NULL, NULL, '230104', '0733311', 1, 87, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0733311&anexo=0', 2015),
(179, 'SO1 PNP.CARLOS TEODORO PUELL MENDOZA', NULL, NULL, NULL, '230101', '1136993', 1, 87, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1136993&anexo=0', 2015),
(180, 'GRAL.DIV.EP JUAN VELASCO ALVARADO', NULL, NULL, NULL, '230303', '1138551', 1, 88, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1138551&anexo=0', 2015),
(181, 'SAN JACINTO', NULL, NULL, NULL, '230105', '1599109', 1, 87, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1599109&anexo=0', 2015),
(182, 'PROCERES DE LA INDEPENDENCIA', NULL, NULL, NULL, '100201', '0275461', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275461&anexo=0', 2015),
(183, 'SIMON BOLIVAR', NULL, NULL, NULL, '100207', '0275693', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275693&anexo=0', 2015),
(184, 'NUESTRA SEÃ‘ORA DEL CARMEN', '', '', NULL, '100204', '0275701', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275701&anexo=0', 2015),
(185, 'CIRO ALEGRIA', NULL, NULL, NULL, '100209', '0553909', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0553909&anexo=0', 2015),
(186, 'ABRAHAM VALDELOMAR', NULL, NULL, NULL, '100104', '0275487', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275487&anexo=0', 2015),
(187, 'FRAY RAMON ROJAS', NULL, NULL, NULL, '100109', '0275560', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275560&anexo=0', 2015),
(188, 'CATALINA BUENDIA DE PECHO', NULL, NULL, NULL, '100107', '0275735', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275735&anexo=0', 2015),
(189, 'GABINO CHACALTANA HERNANDEZ', NULL, NULL, NULL, '100105', '0553321', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0553321&anexo=0', 2015),
(190, 'JOSE GREGORIO HUAMAN GIRAO', NULL, NULL, NULL, '100103', '0553529', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0553529&anexo=0', 2015),
(191, 'FERMIN TANGUIS', NULL, NULL, NULL, '100101', '0564252', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0564252&anexo=0', 2015),
(192, 'ADELA LENGUA DE CALDERON', NULL, NULL, NULL, '100109', '0580985', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580985&anexo=0', 2015),
(193, '22346 SAN MARTIN DE PORRAS', NULL, NULL, NULL, '100109', '0581017', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581017&anexo=0', 2015),
(194, 'JOSE MANUEL MEZA', NULL, NULL, NULL, '100303', '0275743', 1, 168, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275743&anexo=0', 2015),
(195, '22419 JOSE ABELARDO QUIÃ‘ONES GONZALES', NULL, NULL, NULL, '100301', '1423714', 1, 168, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1423714&anexo=0', 2015),
(196, 'FERMIN TANGUIS A.T.', NULL, NULL, NULL, '100501', '0580894', 1, 169, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580894&anexo=0', 2015),
(197, 'JOSE DE SAN MARTIN', NULL, NULL, NULL, '100401', '0275446', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275446&anexo=0', 2015),
(198, '22451 BEATITA DE HUMAY', NULL, NULL, NULL, '100403', '0554204', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0554204&anexo=0', 2015),
(199, 'INDEPENDENCIA', NULL, NULL, NULL, '100404', '0554303', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0554303&anexo=0', 2015),
(200, '22445 GERARDO R. MENDOZA ESCATE', NULL, NULL, NULL, '100404', '1302892', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1302892&anexo=0', 2015),
(201, 'FE Y ALEGRIA 68', NULL, NULL, NULL, '100407', '1367366', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1367366&anexo=0', 2015),
(202, 'JUAN AURICH PASTOR', NULL, NULL, NULL, '130204', '0452920', 1, 172, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452920&anexo=0', 2015),
(203, 'JORGE CHAVEZ', NULL, NULL, NULL, '130310', '0453043', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453043&anexo=0', 2015),
(204, 'RAMON CASTILLA', NULL, NULL, NULL, '130119', '0524728', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0524728&anexo=0', 2015),
(205, '10360 - SAN MARCOS', NULL, NULL, NULL, '130308', '0544411', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544411&anexo=0', 2015),
(206, '10165 MIGUEL GRAU SEMINARIO', NULL, NULL, NULL, '130306', '0544916', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544916&anexo=0', 2015),
(207, 'JOSE OLAYA BALANDRA', NULL, NULL, NULL, '130113', '0545509', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0545509&anexo=0', 2015),
(208, 'FELIPE SANTIAGO SALAVERRY', NULL, NULL, NULL, '130109', '0574459', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0574459&anexo=0', 2015),
(209, 'JOSE JIMENEZ BORJA', NULL, NULL, NULL, '130102', '0587626', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0587626&anexo=0', 2015),
(210, '10082 SAGRADO CORAZON DE JESUS', NULL, NULL, NULL, '130202', '0621912', 1, 172, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621912&anexo=0', 2015),
(211, 'SAN MARTIN', NULL, NULL, NULL, '130301', '0626374', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0626374&anexo=0', 2015),
(212, '10177 EL PUENTE', NULL, NULL, NULL, '130308', '0672469', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0672469&anexo=0', 2015),
(213, 'LUIS FELIPE DE LAS CASAS', NULL, NULL, NULL, '130204', '0753285', 1, 172, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0753285&anexo=0', 2015),
(214, '10232 HORACIO ZEBALLOS GAMEZ', NULL, NULL, NULL, '130312', '0753376', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0753376&anexo=0', 2015),
(215, 'MANUEL SEOANE CORRALES', NULL, NULL, NULL, '130304', '0753434', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0753434&anexo=0', 2015),
(216, 'LUIS NEGREIROS VEGA', NULL, NULL, NULL, '130117', '1159037', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1159037&anexo=0', 2015),
(217, 'FAUSTINO MALDONADO', NULL, NULL, NULL, '250101', '0242271', 1, 67, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0242271&anexo=0', 2015),
(218, 'NUEVA REQUENA', NULL, NULL, NULL, '250106', '0595025', 1, 67, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0595025&anexo=0', 2015),
(219, 'CURIMANA', NULL, NULL, NULL, '250203', '0612697', 1, 68, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0612697&anexo=0', 2015),
(220, 'ELIAS AGUIRRE', NULL, NULL, NULL, '250201', '0666388', 1, 68, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0666388&anexo=0', 2015),
(221, 'HORACIO ZEBALLOS GAMEZ', NULL, NULL, NULL, '250102', '0923482', 1, 67, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0923482&anexo=0', 2015),
(222, 'CHAMPAGNAT', NULL, NULL, NULL, '220101', '0309823', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309823&anexo=0', 2015),
(223, 'MANUEL FLORES CALVO', NULL, NULL, NULL, '220109', '0309898', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309898&anexo=0', 2015),
(224, 'MODESTO BASADRE', NULL, NULL, NULL, '220101', '0310516', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310516&anexo=0', 2015),
(225, '42044 ALFONSO UGARTE', NULL, NULL, NULL, '220101', '0568733', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0568733&anexo=0', 2015),
(226, '42054 CTA JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '220302', '0646042', 1, 157, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0646042&anexo=0', 2015),
(227, 'GUILLERMO AUZA ARCE', NULL, NULL, NULL, '220111', '0744870', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0744870&anexo=0', 2015),
(228, '42241 HERMOGENES ARENAS YAÃ‘EZ', NULL, NULL, NULL, '220101', '1215532', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1215532&anexo=0', 2015),
(229, 'DR. JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, NULL, '220113', '1596402', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1596402&anexo=0', 2015),
(230, 'SANTA CRUZ', NULL, NULL, NULL, '220113', '1596410', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1596410&anexo=0', 2015),
(231, '42255 SANTA TERESITA DEL NIÃ‘O JESUS', NULL, NULL, NULL, '220113', '1618271', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1618271&anexo=0', 2015),
(232, 'SIMON BOLIVAR', NULL, NULL, NULL, '170101', '0309781', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309781&anexo=0', 2015),
(233, 'SANTA FORTUNATA', NULL, NULL, NULL, '170106', '0309807', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309807&anexo=0', 2015),
(234, 'CARLOS A. VELASQUEZ', NULL, NULL, NULL, '170303', '0310565', 1, 96, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310565&anexo=0', 2015),
(235, 'CORONEL MANUEL C. DE LA TORRE', NULL, NULL, NULL, '170101', '0524637', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0524637&anexo=0', 2015),
(236, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '170105', '0550319', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0550319&anexo=0', 2015),
(237, 'JUAN BAUTISTA SCARSI VALDIVIA', NULL, NULL, NULL, '170106', '0591065', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591065&anexo=0', 2015),
(238, 'MARISCAL DOMINGO NIETO', NULL, NULL, NULL, '170101', '1126861', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1126861&anexo=0', 2015),
(239, 'AMERICO GARIBALDI GHERSI', NULL, NULL, NULL, '170303', '1210186', 1, 96, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1210186&anexo=0', 2015),
(240, 'FE Y ALEGRIA 52', NULL, NULL, NULL, '170301', '1276120', 1, 96, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1276120&anexo=0', 2015),
(241, 'SEÃ‘OR DE LOS MILAGROS', NULL, NULL, NULL, '170101', '1423946', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1423946&anexo=0', 2015),
(242, 'FERNANDO BELAUNDE TERRY', NULL, NULL, NULL, '170101', '1545763', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1545763&anexo=0', 2015),
(243, 'ANDAHUASI', NULL, NULL, NULL, '140513', '0685545', 1, 61, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0685545&anexo=0', 2015),
(244, '20827 MERCEDES INDACOCHEA LOZANO', NULL, NULL, NULL, '140501', '0285817', 1, 61, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0285817&anexo=0', 2015),
(245, '20849 JOSE FAUSTINO SANCHEZ CARRION', NULL, NULL, NULL, '140513', '0584268', 1, 61, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0584268&anexo=0', 2015),
(246, '21554 JOSE OLAYA', NULL, NULL, NULL, '140804', '0583682', 1, 62, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583682&anexo=0', 2015),
(247, '20386 JORGE BASADRE', NULL, NULL, NULL, '140804', '0583716', 1, 62, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583716&anexo=0', 2015),
(248, '20066 SIMON BOLIVAR', NULL, NULL, NULL, '141001', '1524263', 1, 64, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1524263&anexo=0', 2015),
(249, 'JOSE OLAYA BALANDRA', NULL, NULL, NULL, '140905', '0522813', 1, 66, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522813&anexo=0', 2015),
(250, '20506 JOSE A ENCINAS FRANCO', NULL, NULL, NULL, '140903', '0638965', 1, 66, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0638965&anexo=0', 2015),
(251, 'PEDRO RUIZ GALLO', NULL, NULL, NULL, '140905', '0875708', 1, 66, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0875708&anexo=0', 2015),
(252, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '140406', '0286286', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286286&anexo=0', 2015),
(253, 'GERARDO SALOMON MEJIA SACO', NULL, NULL, NULL, '140403', '0286369', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286369&anexo=0', 2015),
(254, 'MARISCAL BENAVIDES', NULL, NULL, NULL, '140407', '0286377', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286377&anexo=0', 2015),
(255, 'AUGUSTO B. LEGUIA', NULL, NULL, NULL, '140409', '0584714', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0584714&anexo=0', 2015),
(256, 'SANTA ROSA DE YANGAS', NULL, NULL, NULL, '140307', '0523019', 1, 63, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523019&anexo=0', 2015),
(257, 'SAN MATEO DE HUANCHOR', NULL, NULL, NULL, '140621', '0245126', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245126&anexo=0', 2015),
(258, 'JULIO CESAR TELLO', NULL, NULL, NULL, '140601', '0286500', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286500&anexo=0', 2015),
(259, 'SIMON BOLIVAR', NULL, NULL, NULL, '140625', '0584110', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0584110&anexo=0', 2015),
(260, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '180112', '0427765', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427765&anexo=0', 2015),
(261, '34618 REMIGIO MORALES BERMUDEZ', NULL, NULL, NULL, '180304', '0427799', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427799&anexo=0', 2015),
(262, 'LEOPOLDO KRAUSE', NULL, NULL, NULL, '180305', '0427807', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427807&anexo=0', 2015),
(263, 'TUPAC AMARU', NULL, NULL, NULL, '180306', '0427856', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427856&anexo=0', 2015),
(264, 'AUGUSTO SALAZAR BONDY', NULL, NULL, NULL, '180106', '0427864', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427864&anexo=0', 2015),
(265, 'TUPAC AMARU', NULL, NULL, NULL, '180207', '0550848', 1, 21, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0550848&anexo=0', 2015),
(266, 'JOSE GALVEZ BARRENECHEA', NULL, NULL, NULL, '180103', '0575951', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575951&anexo=0', 2015),
(267, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '180201', '0576405', 1, 21, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576405&anexo=0', 2015),
(268, '31756 RICARDO PALMA', NULL, NULL, NULL, '180101', '0576439', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576439&anexo=0', 2015),
(269, '34233 NUESTRA SEÃ‘ORA DEL ROSARIO', NULL, NULL, NULL, '180305', '0635037', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635037&anexo=0', 2015),
(270, 'MANUEL SCORZA', NULL, NULL, NULL, '180114', '0658716', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0658716&anexo=0', 2015),
(271, 'DIVINA PASTORA', NULL, NULL, NULL, '180301', '1161397', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1161397&anexo=0', 2015),
(272, '34228 PEDRO PAULET MOSTAJO', NULL, NULL, NULL, '180304', '0596346', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0596346&anexo=0', 2015),
(273, 'JULIO VERA GUTIERREZ', NULL, NULL, NULL, '180308', '1161009', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1161009&anexo=0', 2015),
(274, '80036 SAN MARTIN DE PORRES', NULL, NULL, NULL, '120111', '0577833', 1, 41, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577833&anexo=0', 2015),
(275, 'CESAR VALLEJO', NULL, NULL, NULL, '120602', '0545954', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0545954&anexo=0', 2015),
(276, 'JANANSAYA', NULL, NULL, NULL, '201103', '1026350', 1, 193, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1026350&anexo=0', 2015),
(277, 'HUATASANI', NULL, NULL, NULL, '200511', '0485854', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0485854&anexo=0', 2015),
(278, 'SEIS DE AGOSTO', NULL, NULL, NULL, '110401', '0372664', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372664&anexo=0', 2015),
(279, 'JOSE FAUSTINO SANCHEZ CARRION', NULL, NULL, NULL, '110113', '0697045', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697045&anexo=0', 2015),
(280, 'DOS DE MAYO', NULL, NULL, NULL, '080110', '0571737', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571737&anexo=0', 2015),
(281, 'Daniel Hernandez', NULL, NULL, NULL, '080501', '0217281', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0217281&anexo=0', 2015),
(282, 'SANTA RITA DE SIGUAS', NULL, NULL, NULL, '040118', '0617456', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617456&anexo=0', 2015),
(283, 'VICENTE GUERRERO PALACIOS', NULL, NULL, NULL, '020206', '0597336', 1, 98, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0597336&anexo=0', 2015),
(284, '86453 JUAN VELASCO ALVARADO', NULL, NULL, NULL, '021701', '1101070', 1, 103, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1101070&anexo=0', 2015),
(285, 'OCTAVIO CASAVERDE MARIN', NULL, NULL, NULL, '030403', '0621771', 1, 55, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621771&anexo=0', 2015),
(286, 'SEÃ‘OR DE LOS MILAGROS', NULL, NULL, NULL, '050401', '1423185', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1423185&anexo=0', 2015),
(287, '9 DE DICIEMBRE', NULL, NULL, NULL, '050401', '0424630', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424630&anexo=0', 2015),
(288, 'DOS DE MAYO', NULL, NULL, NULL, '050402', '0573816', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0573816&anexo=0', 2015),
(289, 'NERY GARCIA ZARATE', NULL, NULL, NULL, '050402', '0574319', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0574319&anexo=0', 2015),
(290, 'LEONCIO PRADO', NULL, NULL, NULL, '050405', '0579920', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579920&anexo=0', 2015),
(291, 'MARISCAL LA MAR', NULL, NULL, NULL, '050403', '0629527', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0629527&anexo=0', 2015),
(292, 'HUMBERTO SANCHEZ DEL PINO', NULL, NULL, NULL, '050206', '1162122', 1, 174, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1162122&anexo=0', 2015),
(293, 'RAMON CASTILLA', NULL, NULL, NULL, '050204', '0424648', 1, 174, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424648&anexo=0', 2015),
(294, 'LOS MOROCHUCOS', NULL, NULL, NULL, '050206', '0538751', 1, 174, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0538751&anexo=0', 2015),
(295, 'FELIPE PARDO Y ALIAGA', NULL, NULL, NULL, '050207', '0579946', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579946&anexo=0', 2015),
(296, 'JUAN PABLO VIZCARDO Y GUZMAN', NULL, NULL, NULL, '050208', '0538850', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0538850&anexo=0', 2015),
(297, 'CORAZON DE JESUS', NULL, NULL, NULL, '050907', '1160506', 1, 182, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1160506&anexo=0', 2015),
(298, 'GENERAL CORDOVA', NULL, NULL, NULL, '050901', '0424622', 1, 182, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424622&anexo=0', 2015),
(299, 'VICTOR ANDRES BELAUNDE', NULL, NULL, NULL, '050902', '0424655', 1, 182, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424655&anexo=0', 2015),
(300, 'HAYA DE LA TORRE', NULL, NULL, NULL, '050109', '1345388', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1345388&anexo=0', 2015),
(301, 'MARISCAL ANTONIO JOSE DE SUCRE', NULL, NULL, NULL, '050114', '1345404', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1345404&anexo=0', 2015),
(302, 'VILLA SAN CRISTOBAL', NULL, NULL, NULL, '050115', '1345859', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1345859&anexo=0', 2015),
(303, 'ANDRES AVELINO CACERES', NULL, NULL, NULL, '050113', '0472019', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0472019&anexo=0', 2015),
(304, 'MARISCAL GUILLERMO MILLER', NULL, NULL, NULL, '050102', '0579821', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579821&anexo=0', 2015),
(305, 'LIBERTAD DE AMERICA', NULL, NULL, NULL, '050105', '0579839', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579839&anexo=0', 2015),
(306, 'COLEGIO ESTATAL JOSE DE SAN MARTIN', NULL, NULL, NULL, '050109', '0579854', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579854&anexo=0', 2015),
(307, 'SAN CRISTOBAL', NULL, NULL, NULL, '050112', '0592345', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0592345&anexo=0', 2015),
(308, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '030703', '1331339', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1331339&anexo=0', 2015),
(309, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '030702', '1205996', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1205996&anexo=0', 2015),
(310, 'RICARDO PALMA', NULL, NULL, NULL, '030705', '1206119', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1206119&anexo=0', 2015),
(311, 'JOSE ANTONIO ENCINAS', NULL, NULL, NULL, '030405', '0645564', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0645564&anexo=0', 2015),
(312, 'MICAELA BASTIDAS', NULL, NULL, NULL, '030601', '0620799', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0620799&anexo=0', 2015);
INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(313, 'TUPAC AMARU II', NULL, NULL, NULL, '030605', '0645507', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0645507&anexo=0', 2015),
(314, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '051004', '0581678', 1, 180, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581678&anexo=0', 2015),
(315, 'MARIANO MELGAR', NULL, NULL, NULL, '051001', '0362715', 1, 180, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362715&anexo=0', 2015),
(316, '9 DE DICIEMBRE', NULL, NULL, NULL, '050601', '0362822', 1, 179, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362822&anexo=0', 2015),
(317, 'INDUSTRIAL 12 CRISTO REY', NULL, NULL, NULL, '050601', '0599886', 1, 179, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0599886&anexo=0', 2015),
(318, 'NUESTRA SEÃ‘ORA DE LAS NIEVES', NULL, NULL, NULL, '050601', '0362681', 1, 179, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362681&anexo=0', 2015),
(319, 'MANUEL PRADO', NULL, NULL, NULL, '050501', '0362814', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362814&anexo=0', 2015),
(320, 'JOSE OLAYA', NULL, NULL, NULL, '050532', '0678037', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0678037&anexo=0', 2015),
(321, 'VENTURA CCALAMAQUI', NULL, NULL, NULL, '050508', '0362863', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362863&anexo=0', 2015),
(322, 'MANUEL SEOANE CORRALES', NULL, NULL, NULL, '050503', '0362871', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0362871&anexo=0', 2015),
(323, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '050501', '0489872', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489872&anexo=0', 2015),
(324, 'GLORIOSO AMAUTA', NULL, NULL, NULL, '050504', '0489914', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489914&anexo=0', 2015),
(325, 'SAN ANTONIO DE PADUA', NULL, NULL, NULL, '050506', '0505537', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0505537&anexo=0', 2015),
(326, 'APOSTOL SANTIAGO DE LUCANAS', NULL, NULL, NULL, '050513', '0581587', 1, 178, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581587&anexo=0', 2015),
(327, 'BASILIO AUQUI', NULL, NULL, NULL, '050701', '0424598', 1, 181, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424598&anexo=0', 2015),
(328, 'NUESTRA SEÃ‘ORA DE ASUNCION', NULL, NULL, NULL, '050713', '0670943', 1, 181, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670943&anexo=0', 2015),
(329, 'SAN AGUSTIN', NULL, NULL, NULL, '050704', '0671057', 1, 181, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0671057&anexo=0', 2015),
(330, 'PEDRO RUIZ GALLO', NULL, NULL, NULL, '050309', '0670976', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670976&anexo=0', 2015),
(331, 'SAN LUIS GONZAGA', NULL, NULL, NULL, '050704', '1348507', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1348507&anexo=0', 2015),
(332, 'HUANTA', NULL, NULL, NULL, '050301', '1411180', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1411180&anexo=0', 2015),
(333, 'JOSE FELIX IGUAIN', NULL, NULL, NULL, '050305', '0579813', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579813&anexo=0', 2015),
(334, 'GERVASIO SANTILLANA', NULL, NULL, NULL, '050308', '0573758', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0573758&anexo=0', 2015),
(335, 'SAN JUAN DE LA FRONTERA', NULL, NULL, NULL, '050303', '0579805', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579805&anexo=0', 2015),
(336, 'JOSE SANTOS FIGUEROA', NULL, NULL, NULL, '050307', '0593293', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0593293&anexo=0', 2015),
(337, 'MANUEL JESUS URBINA CARDENAS', NULL, NULL, NULL, '050308', '0670877', 1, 176, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670877&anexo=0', 2015),
(338, 'DIVINO MAESTRO', NULL, NULL, NULL, '050406', '0670992', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670992&anexo=0', 2015),
(339, 'SAN FRANCISCO', NULL, NULL, NULL, '050403', '1162445', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1162445&anexo=0', 2015),
(340, 'SAN MARTIN DE PORRAS TAMBO', NULL, NULL, NULL, '050406', '1162528', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1162528&anexo=0', 2015),
(341, 'MIRTHA JERI DE AÃ‘AÃ‘OS', NULL, NULL, NULL, '050401', '1348994', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1348994&anexo=0', 2015),
(342, '16024', NULL, NULL, NULL, '060812', '0523308', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523308&anexo=0', 2015),
(343, '16499', NULL, NULL, NULL, '061103', '0582692', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582692&anexo=0', 2015),
(344, '16040 MARIANO MELGAR', NULL, NULL, NULL, '060811', '0520510', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0520510&anexo=0', 2015),
(345, '16093 JOSE GALVEZ', NULL, NULL, NULL, '060803', '0537852', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537852&anexo=0', 2015),
(346, '16116 MANUEL GONZALES PRADA', NULL, NULL, NULL, '060804', '0669044', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0669044&anexo=0', 2015),
(347, '16478 PEDRO RUIZ GALLO', NULL, NULL, NULL, '061105', '0722975', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0722975&anexo=0', 2015),
(348, '16479 CRISTO REY', NULL, NULL, NULL, '061105', '0917591', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0917591&anexo=0', 2015),
(349, '16487 SAN PEDRO', NULL, NULL, NULL, '061102', '0669028', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0669028&anexo=0', 2015),
(350, '16506 SAN JOSE', NULL, NULL, NULL, '061103', '0669051', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0669051&anexo=0', 2015),
(351, '16509 JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '061104', '0495804', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495804&anexo=0', 2015),
(352, '16536 SAN MIGUEL', NULL, NULL, NULL, '061107', '0586180', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0586180&anexo=0', 2015),
(353, '16538 VIRGEN DE LAS MERCEDES', NULL, NULL, NULL, '061107', '0582759', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582759&anexo=0', 2015),
(354, 'ALFONSO VILLANUEVA PINILLOS', NULL, NULL, NULL, '060801', '0263095', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263095&anexo=0', 2015),
(355, 'ANTENOR ORREGO', NULL, NULL, NULL, '060802', '0262972', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262972&anexo=0', 2015),
(356, 'CESAR ABRAHAM VALLEJO', NULL, NULL, NULL, '061105', '0525022', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525022&anexo=0', 2015),
(357, 'CIRO ALEGRIA', NULL, NULL, NULL, '060810', '0520817', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0520817&anexo=0', 2015),
(358, 'DOCE DE OCTUBRE', NULL, NULL, NULL, '060804', '0263012', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263012&anexo=0', 2015),
(359, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '061102', '0496000', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0496000&anexo=0', 2015),
(360, 'MARIA INMACULADA', NULL, NULL, NULL, '060806', '0262998', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262998&anexo=0', 2015),
(361, 'SAN FELIPE SANTIAGO', NULL, NULL, NULL, '060808', '0520916', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0520916&anexo=0', 2015),
(362, 'SAGRADO CORAZÃ“N', NULL, NULL, NULL, '060801', '0262949', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262949&anexo=0', 2015),
(363, 'SAN JUAN', NULL, NULL, NULL, '060807', '0537753', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537753&anexo=0', 2015),
(364, '22 DE OCTUBRE', NULL, NULL, NULL, '060501', '0611491', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0611491&anexo=0', 2015),
(365, 'TOMAS P.GALVEZ QUISPE', NULL, NULL, NULL, '060501', '0641803', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0641803&anexo=0', 2015),
(366, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '060506', '0263046', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0263046&anexo=0', 2015),
(367, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '060505', '0611947', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0611947&anexo=0', 2015),
(368, 'CARLOS MATTA RIVERA', NULL, NULL, NULL, '060501', '1051598', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1051598&anexo=0', 2015),
(369, 'SANTO DOMINGO', NULL, NULL, NULL, '060512', '0580365', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580365&anexo=0', 2015),
(370, 'DANIEL ALCIDES CARRION', NULL, NULL, NULL, '060510', '0524827', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0524827&anexo=0', 2015),
(371, 'JOSE BRUNO RUIZ NUÃ‘EZ', NULL, NULL, NULL, '060703', '0611756', 1, 126, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0611756&anexo=0', 2015),
(372, 'JOAQUIN BERNAL', NULL, NULL, NULL, '060703', '0390716', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390716&anexo=0', 2015),
(373, 'JUAN Z.MONTENEGRO', NULL, NULL, NULL, '060507', '0453050', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453050&anexo=0', 2015),
(374, 'ANDRES A.CACERES', NULL, NULL, NULL, '060703', '0640623', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0640623&anexo=0', 2015),
(375, 'GRAN GUZMANGO CAPAC', NULL, NULL, NULL, '060401', '0390666', 1, 132, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390666&anexo=0', 2015),
(376, 'DAVID LEON', NULL, NULL, NULL, '060401', '0391128', 1, 134, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0391128&anexo=0', 2015),
(377, 'ABEL ALVA', NULL, NULL, NULL, '060401', '0390732', 1, 134, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390732&anexo=0', 2015),
(378, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '060703', '0503672', 1, 126, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0503672&anexo=0', 2015),
(379, 'CESAR VALLEJO', NULL, NULL, NULL, '060703', '1112937', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1112937&anexo=0', 2015),
(380, 'EL CUMBE', NULL, NULL, NULL, '060502', '0741025', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0741025&anexo=0', 2015),
(381, 'FE Y ALEGRIA 69', NULL, NULL, NULL, '060501', '1366632', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1366632&anexo=0', 2015),
(382, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '060703', '0714717', 1, 126, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0714717&anexo=0', 2015),
(383, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '060703', '0760678', 1, 126, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0760678&anexo=0', 2015),
(384, 'RAMON CASTILLA', NULL, NULL, NULL, '060612', '0453100', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453100&anexo=0', 2015),
(385, 'INDOAMERICANO', NULL, NULL, NULL, '060901', '1112663', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1112663&anexo=0', 2015),
(386, 'JOSE ANTONIO ENCINAS', NULL, NULL, NULL, '060609', '0640748', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0640748&anexo=0', 2015),
(387, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '060905', '0580456', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580456&anexo=0', 2015),
(388, 'JOSE DEL C.CABREJOS', NULL, NULL, NULL, '060910', '0493023', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0493023&anexo=0', 2015),
(389, 'CIRILO SANCHEZ CABREJOS', NULL, NULL, NULL, '060901', '1112580', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1112580&anexo=0', 2015),
(390, 'EZEQUIEL SANCHEZ GUERRERO', NULL, NULL, NULL, '060608', '0452961', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452961&anexo=0', 2015),
(391, 'JOSE GABRIEL CONDORCANQUI NOGUERA', NULL, NULL, NULL, '060909', '0494005', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0494005&anexo=0', 2015),
(392, 'JOSE MARIA MONZON HERNANDEZ', NULL, NULL, NULL, '060619', '0640714', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0640714&anexo=0', 2015),
(393, 'ABEL CARBAJAL PEREZ', NULL, NULL, NULL, '060601', '1110311', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1110311&anexo=0', 2015),
(394, 'ALBERTO TURPAUD', NULL, NULL, NULL, '061011', '0641043', 1, 144, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0641043&anexo=0', 2015),
(395, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '060601', '0453530', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453530&anexo=0', 2015),
(396, 'ANAXIMANDRO VEGA', NULL, NULL, NULL, '060609', '0453019', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453019&anexo=0', 2015),
(397, 'ANDRES A.CACERES', NULL, NULL, NULL, '060615', '0610956', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610956&anexo=0', 2015),
(398, 'JUAN UGAZ', NULL, NULL, NULL, '060901', '0452615', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452615&anexo=0', 2015),
(399, 'SAN AGUSTIN', NULL, NULL, NULL, '060902', '0759142', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0759142&anexo=0', 2015),
(400, 'SAN JOSE', NULL, NULL, NULL, '060601', '0759720', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0759720&anexo=0', 2015),
(401, 'SAN JUAN DE DIOS', NULL, NULL, NULL, '061006', '0390906', 1, 144, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390906&anexo=0', 2015),
(402, 'SAN JUAN DE UDIMA', NULL, NULL, NULL, '060902', '1232198', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1232198&anexo=0', 2015),
(403, 'SENOR DE LOS MILAGROS', NULL, NULL, NULL, '060905', '0453084', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453084&anexo=0', 2015),
(404, 'VICTOR ANTONIO HERRERA DELGADO', NULL, NULL, NULL, '060615', '0452904', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452904&anexo=0', 2015),
(405, 'AGROPECUARIO CHUQUIBAMBA', NULL, NULL, NULL, '060201', '1107093', 1, 127, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1107093&anexo=0', 2015),
(407, 'CRISTO RAMOS', NULL, NULL, NULL, '060101', '1108802', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1108802&anexo=0', 2015),
(408, 'Cristo Rey', NULL, NULL, NULL, '060101', '0390617', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390617&anexo=0', 2015),
(409, 'FERNANDO BELAUNDE TERRY', NULL, NULL, NULL, '060101', '1111343', 1, 131, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1111343&anexo=0', 2015),
(410, 'GONZALO PACIFICO CABRERA BARDALES', NULL, NULL, NULL, '060101', '0390757', 1, 141, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390757&anexo=0', 2015),
(411, 'HNO MIGUEL CARDUCCI RIPIANI', NULL, NULL, NULL, '060101', '0649483', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0649483&anexo=0', 2015),
(412, 'JESUS DE NAZARET', NULL, NULL, NULL, '060101', '0695890', 1, 139, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695890&anexo=0', 2015),
(413, 'JORGE BASADRE', NULL, NULL, NULL, '060201', '0521591', 1, 146, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521591&anexo=0', 2015),
(414, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '060101', '0504878', 1, 136, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0504878&anexo=0', 2015),
(415, 'JOSE GALVEZ', NULL, NULL, NULL, '060201', '0390674', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390674&anexo=0', 2015),
(416, 'JOSE OLAYA', NULL, NULL, NULL, '060201', '0522995', 1, 127, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522995&anexo=0', 2015),
(417, 'JULIO RAMON RIBEYRO', NULL, NULL, NULL, '060101', '1211390', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1211390&anexo=0', 2015),
(418, 'LUIS ALBERTO SANCHEZ', NULL, NULL, NULL, '060101', '0728899', 1, 136, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0728899&anexo=0', 2015),
(419, 'MANUEL DE PIEROLA CASTRO', NULL, NULL, NULL, '060301', '0391086', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0391086&anexo=0', 2015),
(420, 'MICAELA BASTIDAS', NULL, NULL, NULL, '060201', '0391102', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0391102&anexo=0', 2015),
(421, 'NUESTRA SEÃ‘ORA DEL ROSARIO', NULL, NULL, NULL, '060201', '0390682', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390682&anexo=0', 2015),
(422, 'PEDRO VILLANUEVA ESPINOZA', NULL, NULL, NULL, '060101', '0727743', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0727743&anexo=0', 2015),
(423, 'SAN JUAN BAUTISTA', NULL, NULL, NULL, '060101', '0641225', 1, 139, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0641225&anexo=0', 2015),
(424, 'SAN MARCOS', NULL, NULL, NULL, '061201', '0390765', 1, 143, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390765&anexo=0', 2015),
(425, 'SAN VICENTE DE PAUL', NULL, NULL, NULL, '060101', '0606483', 1, 140, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0606483&anexo=0', 2015),
(426, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '070603', '0207381', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0207381&anexo=0', 2015),
(427, 'MARIANO SANTOS', NULL, NULL, NULL, '071201', '0233106', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233106&anexo=0', 2015),
(428, 'LA CONVENCION', NULL, NULL, NULL, '070901', '0233221', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233221&anexo=0', 2015),
(429, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '071201', '0233239', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233239&anexo=0', 2015),
(430, 'TOMASA TTITO CONDEMAYTA', NULL, NULL, NULL, '070201', '0236430', 1, 24, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236430&anexo=0', 2015),
(431, 'HERMANOS AYAR', NULL, NULL, NULL, '071001', '0236463', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236463&anexo=0', 2015),
(432, 'CORONEL LADISLAO ESPINAR', NULL, NULL, NULL, '070801', '0236646', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236646&anexo=0', 2015),
(433, 'JOSE GABRIEL CONDORCANQUI', NULL, NULL, NULL, '070501', '0236653', 1, 27, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236653&anexo=0', 2015),
(434, 'SANTO TOMAS', NULL, NULL, NULL, '070701', '0236661', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236661&anexo=0', 2015),
(435, 'NUESTRA SEÃ‘ORA DEL ROSARIO FE Y ALEGRIA 21', NULL, NULL, NULL, '070104', '0236786', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236786&anexo=0', 2015),
(436, '28', NULL, NULL, NULL, '070401', '0236901', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236901&anexo=0', 2015),
(437, 'INA 67', NULL, NULL, NULL, '070901', '0236919', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236919&anexo=0', 2015),
(438, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '071212', '0488866', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0488866&anexo=0', 2015),
(439, 'ACCHA', NULL, NULL, NULL, '071002', '0495069', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495069&anexo=0', 2015),
(440, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '071209', '0495309', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495309&anexo=0', 2015),
(441, 'JOSE OLAYA', NULL, NULL, NULL, '070908', '0497552', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0497552&anexo=0', 2015),
(442, 'LUIS VALLEJOS SANTONI', NULL, NULL, NULL, '071202', '0497677', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0497677&anexo=0', 2015),
(443, 'ANDRES ALENCASTRE GUTIERREZ', NULL, NULL, NULL, '070503', '0517581', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0517581&anexo=0', 2015),
(444, 'SAN JUAN BAUTISTA', NULL, NULL, NULL, '070402', '0517995', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0517995&anexo=0', 2015),
(445, 'HECTOR TEJADA', NULL, NULL, NULL, '070805', '0518282', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0518282&anexo=0', 2015),
(446, 'AUDAZ DEL CASTILLO', NULL, NULL, NULL, '070504', '0519678', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0519678&anexo=0', 2015),
(447, 'LIBERTADOR SIMON BOLIVAR', NULL, NULL, NULL, '070606', '0535856', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535856&anexo=0', 2015),
(448, 'MARIA DE LA MERCED', NULL, NULL, NULL, '070108', '0579177', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579177&anexo=0', 2015),
(449, 'SEÃ‘OR DE HUANCA', NULL, NULL, NULL, '070406', '0579292', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579292&anexo=0', 2015),
(450, 'SEÃ‘OR DE EXALTACION', NULL, NULL, NULL, '070507', '0579425', 1, 27, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579425&anexo=0', 2015),
(451, 'LA MERCED', NULL, NULL, NULL, '070703', '0587204', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0587204&anexo=0', 2015),
(452, 'VIVA EL PERU', NULL, NULL, NULL, '070106', '0591164', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591164&anexo=0', 2015),
(453, 'ANCAHUASI', NULL, NULL, NULL, '070309', '0591602', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591602&anexo=0', 2015),
(454, 'SEÃ‘OR DE CCOYLLOR RITTY', NULL, NULL, NULL, '071210', '0592485', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0592485&anexo=0', 2015),
(455, 'EUSEBIO CORAZAO', NULL, NULL, NULL, '070403', '0616128', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0616128&anexo=0', 2015),
(456, 'INCA RIPAQ', NULL, NULL, NULL, '070105', '0616185', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0616185&anexo=0', 2015),
(457, 'TUPAC AMARU', NULL, NULL, NULL, '070803', '0617779', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617779&anexo=0', 2015),
(458, 'LAS AMERICAS', NULL, NULL, NULL, '070702', '0617829', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617829&anexo=0', 2015),
(459, 'ANTONIO RAYMONDI', NULL, NULL, NULL, '070107', '0621300', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621300&anexo=0', 2015),
(460, 'RONDOCAN', NULL, NULL, NULL, '070205', '0621391', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621391&anexo=0', 2015),
(461, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '071003', '0621573', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621573&anexo=0', 2015),
(462, 'HUANOQUITE', NULL, NULL, NULL, '071005', '0647446', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0647446&anexo=0', 2015),
(463, 'TENIENTE CORONEL PEDRO RUIZ GALLO', NULL, NULL, NULL, '070801', '0680082', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0680082&anexo=0', 2015),
(464, 'DANIEL ALCIDES CARRION', NULL, NULL, NULL, '070704', '0680124', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0680124&anexo=0', 2015),
(465, 'MANUEL SEOANE CORRALES', NULL, NULL, NULL, '070103', '0730481', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0730481&anexo=0', 2015),
(466, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '070105', '0730515', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0730515&anexo=0', 2015),
(467, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '070803', '0783225', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0783225&anexo=0', 2015),
(468, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '070706', '0783704', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0783704&anexo=0', 2015),
(469, 'ANTONIO RAYMONDI', NULL, NULL, NULL, '070704', '0783720', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0783720&anexo=0', 2015),
(470, 'RAMIRO PRIALE PRIALE', NULL, NULL, NULL, '071104', '0791319', 1, 34, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0791319&anexo=0', 2015),
(471, 'JUSTO BARRIONUEVO ALVAREZ', NULL, NULL, NULL, '071211', '0929638', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929638&anexo=0', 2015),
(472, 'TUPAC AMARU II', NULL, NULL, NULL, '070601', '0930859', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0930859&anexo=0', 2015),
(473, 'NUESTRA SEÃ‘ORA DE BELEN', NULL, NULL, NULL, '070401', '0932087', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932087&anexo=0', 2015),
(474, 'SAGRADO CORAZON DE JESUS', NULL, NULL, NULL, '070401', '0932178', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932178&anexo=0', 2015),
(475, 'REVOLUCIONARIO JUAN VELASCO ALVARADO', NULL, NULL, NULL, '071212', '0933754', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0933754&anexo=0', 2015),
(476, 'DANIEL ESTRADA PEREZ', NULL, NULL, NULL, '070701', '0933846', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0933846&anexo=0', 2015),
(477, '56191 INDEPENDENCIA AMERICANA', NULL, NULL, NULL, '070805', '1062397', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1062397&anexo=0', 2015),
(478, 'SAN IGNACIO DE LOYOLA FE Y ALEGRIA 44', NULL, NULL, NULL, '071202', '1200906', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1200906&anexo=0', 2015),
(479, 'AMAUTA', NULL, NULL, NULL, '070405', '1389279', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1389279&anexo=0', 2015),
(480, 'LUIS NIETO MIRANDA', NULL, NULL, NULL, '070604', '1390525', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1390525&anexo=0', 2015),
(481, '56275', NULL, NULL, NULL, '070708', '1392125', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1392125&anexo=0', 2015),
(482, '56289', NULL, NULL, NULL, '070705', '1392141', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1392141&anexo=0', 2015),
(483, '57004 ROSA DE AMERICA', NULL, NULL, NULL, '070701', '1392224', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1392224&anexo=0', 2015),
(484, 'CPED - 50853', NULL, NULL, NULL, '071210', '1397777', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1397777&anexo=0', 2015),
(485, 'TECNICO AGROPECUARIO', NULL, NULL, NULL, '070601', '0207373', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0207373&anexo=0', 2015),
(486, 'JOSE CARLOS .MARIATEGUI', NULL, NULL, NULL, '070902', '0495226', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495226&anexo=0', 2015),
(487, 'YAURISQUE', NULL, NULL, NULL, '071007', '0495325', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495325&anexo=0', 2015),
(488, '50421 AUGUSTO SALAZAR BONDY', NULL, NULL, NULL, '071103', '0579300', 1, 34, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579300&anexo=0', 2015),
(489, 'ARTURO PALOMINO RODRIGUEZ', NULL, NULL, NULL, '070108', '0591198', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591198&anexo=0', 2015),
(490, 'MIGUEL GRAU', NULL, NULL, NULL, '070902', '0621540', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621540&anexo=0', 2015),
(491, 'GENERAL OLLANTA', NULL, NULL, NULL, '070701', '0783787', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0783787&anexo=0', 2015),
(492, 'INDEPENDENCIA AMERICANA', NULL, NULL, NULL, '070501', '0791525', 1, 27, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0791525&anexo=0', 2015),
(493, 'HAMPATURA', NULL, NULL, NULL, '070501', '0931857', 1, 27, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0931857&anexo=0', 2015),
(494, 'LA INMACULADA', NULL, NULL, NULL, '070901', '0932707', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932707&anexo=0', 2015),
(495, 'ANTAPALLPA', NULL, NULL, NULL, '071006', '0932996', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932996&anexo=0', 2015),
(496, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '071205', '0933721', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0933721&anexo=0', 2015),
(497, 'SAGRADO CORAZON DE JESUS', NULL, NULL, NULL, '071210', '1201052', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1201052&anexo=0', 2015),
(498, '56394 CESAR VALLEJO', NULL, NULL, NULL, '070801', '1343789', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1343789&anexo=0', 2015),
(499, 'HORACIO ZEVALLOS GAMEZ', NULL, NULL, NULL, '070505', '1390491', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1390491&anexo=0', 2015),
(500, 'GABRIEL AGUILAR NALVARTE', NULL, NULL, NULL, '090106', '0575589', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575589&anexo=0', 2015),
(501, 'NUESTRA SEÃ‘ORA DE LOURDES', NULL, NULL, NULL, '090102', '0575647', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575647&anexo=0', 2015),
(502, 'HORACIO ZEBALLOS GAMES', NULL, NULL, NULL, '090102', '0625061', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0625061&anexo=0', 2015),
(503, 'DANIEL ALOMIAS ROBLES', NULL, NULL, NULL, '090112', '0712737', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0712737&anexo=0', 2015),
(504, 'MICAELA BASTIDAS', NULL, NULL, NULL, '090103', '0713271', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0713271&anexo=0', 2015),
(505, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090105', '1220326', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1220326&anexo=0', 2015),
(506, 'GREGORIO CARTAGENA', NULL, NULL, NULL, '090205', '0290858', 1, 147, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290858&anexo=0', 2015),
(507, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '090207', '0576090', 1, 147, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576090&anexo=0', 2015),
(508, 'RICARDO FLORES GUTIERREZ', NULL, NULL, NULL, '090208', '0576157', 1, 147, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576157&anexo=0', 2015),
(509, 'LA SAGRADA FAMILIA FE Y ALEGRIA 64', NULL, NULL, NULL, '090601', '0290809', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290809&anexo=0', 2015),
(510, 'AGROPECUARIO NARANJILLO', NULL, NULL, NULL, '090604', '0290841', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290841&anexo=0', 2015),
(511, 'MARIANO DAMASO BERAUN', NULL, NULL, NULL, '090605', '0575670', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575670&anexo=0', 2015),
(512, 'PUMAHUASI', NULL, NULL, NULL, '090602', '0610485', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610485&anexo=0', 2015),
(513, 'ANTONIO RAYMONDI', NULL, NULL, NULL, '090602', '1417419', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1417419&anexo=0', 2015),
(514, 'TOURNAVISTA', NULL, NULL, NULL, '090804', '0238824', 1, 155, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0238824&anexo=0', 2015),
(515, 'COLEGIO NACIONAL CODO DEL POZUZO', NULL, NULL, NULL, '090803', '1177344', 1, 155, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1177344&anexo=0', 2015),
(516, 'AURELIO CARDENAS PACHAS', NULL, NULL, NULL, '090301', '0290577', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290577&anexo=0', 2015),
(517, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090316', '0550855', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0550855&anexo=0', 2015),
(518, 'MANUEL SCORSA', NULL, NULL, NULL, '090307', '0609487', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0609487&anexo=0', 2015),
(519, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090322', '0610444', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610444&anexo=0', 2015),
(520, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '090323', '0610451', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610451&anexo=0', 2015),
(521, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090312', '0751966', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0751966&anexo=0', 2015),
(522, 'ESTEBAN PAVLETICH TRUJILLO', NULL, NULL, NULL, '091101', '0290668', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290668&anexo=0', 2015),
(523, 'INCA PACHACUTEC', NULL, NULL, NULL, '091106', '0290684', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290684&anexo=0', 2015),
(524, 'GARU', NULL, NULL, NULL, '091108', '0609685', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0609685&anexo=0', 2015),
(525, 'RICARDO PALMA SORIANO', NULL, NULL, NULL, '091102', '0609693', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0609693&anexo=0', 2015),
(526, 'CESAR VALLEJO MENDOZA', NULL, NULL, NULL, '091103', '0609750', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0609750&anexo=0', 2015),
(527, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '091105', '0712760', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0712760&anexo=0', 2015),
(528, 'TRES DE MAYO', NULL, NULL, NULL, '091002', '0290692', 1, 152, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290692&anexo=0', 2015),
(529, 'JOSE VARALLANOS', NULL, NULL, NULL, '091001', '0290700', 1, 152, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290700&anexo=0', 2015),
(530, 'JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, NULL, '091006', '0290866', 1, 152, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290866&anexo=0', 2015),
(531, 'PEDRO ARBUES BERNARDO PEÃ‘A', NULL, NULL, NULL, '091007', '0610337', 1, 152, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610337&anexo=0', 2015),
(532, 'FILOTHER MENDOZA CAMPOS', NULL, NULL, NULL, '091005', '0576033', 1, 152, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576033&anexo=0', 2015),
(533, 'VICTOR E. VIVAR', NULL, NULL, NULL, '090401', '0290718', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290718&anexo=0', 2015),
(534, 'JAVIER PEREZ DE CUELLAR', NULL, NULL, NULL, '090407', '0290742', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290742&anexo=0', 2015),
(535, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090408', '0575852', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575852&anexo=0', 2015),
(536, 'ANTONIO RAIMONDI', NULL, NULL, NULL, '090407', '0576272', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576272&anexo=0', 2015),
(537, 'MARINO ADRIAN MEZA ROSALES', NULL, NULL, NULL, '090404', '0609495', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0609495&anexo=0', 2015),
(538, 'I E LEONCIO PRADO GUTIERREZ', NULL, NULL, NULL, '090706', '0610402', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610402&anexo=0', 2015),
(539, 'JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, NULL, '090702', '0610477', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610477&anexo=0', 2015),
(540, 'COLEGIO NACIONAL', NULL, NULL, NULL, '090706', '1419670', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1419670&anexo=0', 2015),
(541, 'LEONCIO PRADO', NULL, NULL, NULL, '090903', '0666099', 1, 149, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0666099&anexo=0', 2015),
(542, '6020', NULL, NULL, NULL, '140132', '0493841', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0493841&anexo=0', 2015),
(543, '6021', NULL, NULL, NULL, '140405', '0705061', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0705061&anexo=0', 2015),
(544, '7100', NULL, NULL, NULL, '140136', '0773846', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0773846&anexo=0', 2015),
(545, '6016 JESUS SALVADOR', NULL, NULL, NULL, '140116', '0742122', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0742122&anexo=0', 2015),
(546, '6019 MARIANO MELGAR', NULL, NULL, NULL, '140132', '0694588', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0694588&anexo=0', 2015),
(547, '6037 INCA PACHACUTEC', NULL, NULL, NULL, '140136', '0773788', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0773788&anexo=0', 2015),
(548, '6045 DOLORES CAVERO DE GRAU', NULL, NULL, NULL, '140136', '0502104', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0502104&anexo=0', 2015),
(549, '6063 JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '140141', '0500348', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0500348&anexo=0', 2015),
(550, '6073 JORGE BASADRE', NULL, NULL, NULL, '140132', '0643171', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643171&anexo=0', 2015),
(551, '6080 ROSA DE AMERICA', NULL, NULL, NULL, '140141', '0643163', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643163&anexo=0', 2015),
(552, '6099 PERU ESPAÃ‘A', NULL, NULL, NULL, '140141', '0647172', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0647172&anexo=0', 2015),
(553, '7072 SAN MARTIN DE PORRES', NULL, NULL, NULL, '140141', '0481903', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0481903&anexo=0', 2015),
(554, '7094 SASAKAWA', NULL, NULL, NULL, '140141', '1053669', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1053669&anexo=0', 2015),
(555, '7215 NACIONES UNIDAS', NULL, NULL, NULL, '140141', '1272822', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1272822&anexo=0', 2015),
(556, '7226-562 JOSE OLAYA BALANDRA', NULL, NULL, NULL, '140132', '1475318', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1475318&anexo=0', 2015),
(557, '7261 SANTA ROSA DE COLLANAC', NULL, NULL, NULL, '140116', '1241678', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1241678&anexo=0', 2015),
(558, 'CESAR VALLEJO', NULL, NULL, NULL, '140136', '0482042', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0482042&anexo=0', 2015),
(559, 'MANUEL CALVO Y PEREZ', NULL, NULL, NULL, '140118', '0325654', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0325654&anexo=0', 2015),
(560, 'PADRE ILUMINATO', NULL, NULL, NULL, '140136', '0704809', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0704809&anexo=0', 2015),
(561, 'SAN JOSE', NULL, NULL, NULL, '140121', '0643221', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643221&anexo=0', 2015),
(562, 'VICTOR MORON MUÃ‘OZ', NULL, NULL, NULL, '140123', '0325712', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0325712&anexo=0', 2015),
(563, '3051', NULL, NULL, NULL, '140134', '0581777', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581777&anexo=0', 2015),
(564, '2052 MARIA AUXILIADORA', NULL, NULL, NULL, '140134', '0565119', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0565119&anexo=0', 2015),
(565, '2088 REPUBLICA FEDERAL DE ALEMANIA', NULL, NULL, NULL, '140126', '0663120', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0663120&anexo=0', 2015),
(566, '3039 JAVIER HERAUD', NULL, NULL, NULL, '140126', '0581892', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581892&anexo=0', 2015),
(567, 'CARLOS PAREJA PAZ SOLDAN', NULL, NULL, NULL, '140122', '0437210', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437210&anexo=0', 2015),
(568, 'ISABEL CHIMPU OCLLO', NULL, NULL, NULL, '140126', '0437285', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437285&anexo=0', 2015),
(569, 'LIBERTADOR SAN MARTÃN', NULL, NULL, NULL, '140134', '0437327', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437327&anexo=0', 2015),
(570, 'JOSE HECTOR RODRIGUEZ TRIGOSO', NULL, NULL, NULL, '140126', '0523423', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523423&anexo=0', 2015),
(571, 'MERCEDES CABELLO DE CARBONERA', NULL, NULL, NULL, '140122', '0334706', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334706&anexo=0', 2015),
(572, 'PALMAS REALES', NULL, NULL, NULL, '140142', '1009844', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1009844&anexo=0', 2015),
(573, 'RICARDO BENTIN', NULL, NULL, NULL, '140122', '0437244', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437244&anexo=0', 2015),
(574, 'SAN VICENTE FERRER', NULL, NULL, NULL, '140142', '1248392', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1248392&anexo=0', 2015),
(575, '0001 MARIA AUXILIADORA', NULL, NULL, NULL, '140101', '0466730', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0466730&anexo=0', 2015),
(576, '0040 HIPOLITO UNANUE', NULL, NULL, NULL, '140101', '0334656', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334656&anexo=0', 2015),
(577, '103 LUIS ARMANDO CABELLO HURTADO', NULL, NULL, NULL, '140101', '0556332', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0556332&anexo=0', 2015),
(578, '105 PEDRO CORONADO ARRASCUE', NULL, NULL, NULL, '140101', '0336511', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0336511&anexo=0', 2015),
(579, '1070 MELITON CARVAJAL', NULL, NULL, NULL, '140111', '0245647', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245647&anexo=0', 2015),
(580, '1071 ALFONSO UGARTE', NULL, NULL, NULL, '140124', '0340224', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340224&anexo=0', 2015),
(581, '1105 LA SAGRADA FAMILIA', NULL, NULL, NULL, '140109', '0535666', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535666&anexo=0', 2015),
(582, '1157 JULIO CESAR TELLO ROJAS', NULL, NULL, NULL, '140101', '0763771', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0763771&anexo=0', 2015),
(583, '24 ROSA IRENE INFANTES DE CANALES', NULL, NULL, NULL, '140127', '0337766', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0337766&anexo=0', 2015),
(584, 'ANGELICA PALMA ROMAN', NULL, NULL, NULL, '140109', '0340331', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340331&anexo=0', 2015),
(585, 'BARTOLOME HERRERA', NULL, NULL, NULL, '140127', '0334649', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334649&anexo=0', 2015),
(586, 'ISABEL LA CATOLICA', NULL, NULL, NULL, '140109', '0245662', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245662&anexo=0', 2015),
(587, 'MARIANO MELGAR', NULL, NULL, NULL, '140104', '0334664', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334664&anexo=0', 2015),
(588, 'MICAELA BASTIDAS', NULL, NULL, NULL, '140104', '0334714', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334714&anexo=0', 2015),
(589, 'MIGUEL GRAU', NULL, NULL, NULL, '140114', '0245670', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245670&anexo=0', 2015),
(590, 'NUESTRA SEÃ‘ORA DE GUADALUPE', NULL, NULL, NULL, '140101', '0336495', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0336495&anexo=0', 2015),
(591, 'PEDRO GALVEZ EGUSQUIZA', NULL, NULL, NULL, '140101', '0334680', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0334680&anexo=0', 2015),
(592, 'REPÃšBLICA DE CANADÃ', NULL, NULL, NULL, '140106', '0566158', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0566158&anexo=0', 2015),
(593, '8168 LOS ANGELES DE NARANJAL', NULL, NULL, NULL, '140105', '0763169', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0763169&anexo=0', 2015),
(594, '8170 CESAR VALLEJO', NULL, NULL, NULL, '140106', '0832345', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0832345&anexo=0', 2015),
(595, 'CORONEL JOSE GALVEZ', NULL, NULL, NULL, '140106', '0437335', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437335&anexo=0', 2015),
(596, 'DEMOCRACIA Y LIBERTAD', NULL, NULL, NULL, '140105', '1497825', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1497825&anexo=0', 2015),
(597, 'TUNGASUCA', NULL, NULL, NULL, '140105', '0775874', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0775874&anexo=0', 2015),
(598, '0143 SOLIDARIDAD II', NULL, NULL, NULL, '140137', '0900829', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0900829&anexo=0', 2015),
(599, '157 CAPITAN F.A.P. JOSE ABELARDO QU', NULL, NULL, NULL, '140137', '0777714', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0777714&anexo=0', 2015),
(600, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '140135', '0336586', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0336586&anexo=0', 2015),
(601, 'SOLIDARIDAD III', NULL, NULL, NULL, '140137', '0901082', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0901082&anexo=0', 2015),
(602, '0028 JESUS Y MARIA', NULL, NULL, NULL, '140110', '0582411', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582411&anexo=0', 2015),
(603, '0051 JOSE F. SANCHEZ CARRION', NULL, NULL, NULL, '140112', '0705459', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0705459&anexo=0', 2015),
(604, '0053 SAN VICENTE DE PAUL', NULL, NULL, NULL, '140107', '1039676', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1039676&anexo=0', 2015),
(605, '0055 MANUEL GONZALES PRADA', NULL, NULL, NULL, '140112', '0582387', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582387&anexo=0', 2015),
(606, '0074 FERNANDO BELAUNDE TERRY', NULL, NULL, NULL, '140103', '0690008', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0690008&anexo=0', 2015),
(607, '1212 GRUMETE MEDINA', NULL, NULL, NULL, '140103', '0650036', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0650036&anexo=0', 2015),
(608, '1218 SAN LUIS MARIA DE MONTFORT', NULL, NULL, NULL, '140107', '0743831', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0743831&anexo=0', 2015),
(609, '1260 EL AMAUTA', NULL, NULL, NULL, '140103', '1309392', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1309392&anexo=0', 2015),
(610, '6018 INMACULADA CONCEPCION - HUARANGAL', NULL, NULL, NULL, '140139', '0778027', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0778027&anexo=0', 2015),
(611, '787 ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '140107', '0643783', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0643783&anexo=0', 2015),
(612, 'FAP JOSE ABELARDO QUIÃ‘ONES', NULL, NULL, NULL, '140110', '0325639', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0325639&anexo=0', 2015),
(613, 'JESUS SACRAMENTADO', NULL, NULL, NULL, '140139', '0546002', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546002&anexo=0', 2015),
(614, 'DEAN SAAVEDRA', NULL, NULL, NULL, '120102', '0394445', 1, 42, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394445&anexo=0', 2015),
(615, '81524', NULL, NULL, NULL, '120103', '1170760', 1, 40, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1170760&anexo=0', 2015),
(616, '80664 SAN IGNACIO DE LOYOLA', NULL, NULL, NULL, '120410', '0758060', 1, 40, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0758060&anexo=0', 2015),
(617, '81024 MIGUEL GRAU SEMINARIO', NULL, NULL, NULL, '120105', '1171081', 1, 43, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1171081&anexo=0', 2015),
(618, '80075', NULL, NULL, NULL, '121201', '0587923', 1, 52, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0587923&anexo=0', 2015),
(619, '80272 TEOFILO BENITES GIL', NULL, NULL, NULL, '120411', '0394239', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394239&anexo=0', 2015),
(620, '81028 JUAN ALVARADO', NULL, NULL, NULL, '120401', '1166529', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1166529&anexo=0', 2015),
(621, 'SANTA TERESA DE LA INMACULADA', NULL, NULL, NULL, '120501', '0395301', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395301&anexo=0', 2015),
(622, 'ANTONIO RAIMONDI', NULL, NULL, NULL, '120506', '0395418', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395418&anexo=0', 2015),
(623, 'JOSE ANDRES RAZURI', NULL, NULL, NULL, '120501', '0395293', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395293&anexo=0', 2015),
(624, 'JESUS NAZARENO', NULL, NULL, NULL, '120803', '0395194', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395194&anexo=0', 2015);
INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(625, 'CESAR A. VALLEJO MENDOZA', NULL, NULL, NULL, '120804', '0578088', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578088&anexo=0', 2015),
(626, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '120110', '0394288', 1, 40, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394288&anexo=0', 2015),
(627, '80825 VIRGEN DEL CARMEN', NULL, NULL, NULL, '120109', '0544759', 1, 40, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544759&anexo=0', 2015),
(628, 'ABEL TORO CONTRERAS', NULL, NULL, NULL, '120902', '0394452', 1, 45, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394452&anexo=0', 2015),
(629, '89 ALBUJAR Y GUARNIZ', NULL, NULL, NULL, '120503', '0394759', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394759&anexo=0', 2015),
(630, '35 EDUVIGIS NORIEGA DE LAFORA', NULL, NULL, NULL, '120503', '0394791', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394791&anexo=0', 2015),
(631, 'MARIA GORETTI', NULL, NULL, NULL, '120506', '0395426', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395426&anexo=0', 2015),
(632, 'INMACULADA VIRGEN DE LA PUERTA', NULL, NULL, NULL, '120401', '0576561', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576561&anexo=0', 2015),
(633, '80826', NULL, NULL, NULL, '120404', '0544460', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544460&anexo=0', 2015),
(634, '80278 SAN MIGUEL', NULL, NULL, NULL, '120411', '0578146', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578146&anexo=0', 2015),
(635, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '120508', '0690362', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0690362&anexo=0', 2015),
(636, '80057 INMACULADA COMCEPCION', NULL, NULL, NULL, '120806', '0823112', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0823112&anexo=0', 2015),
(637, 'JOSE ANDRES RAZURI', NULL, NULL, NULL, '120807', '0394270', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394270&anexo=0', 2015),
(638, '80878', NULL, NULL, NULL, '120806', '1165372', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1165372&anexo=0', 2015),
(639, '80140 JOSE F. SANCHEZ CARRION', NULL, NULL, NULL, '120304', '0475640', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0475640&anexo=0', 2015),
(640, '80147 ABELARDO GAMARRA', NULL, NULL, NULL, '120307', '0545566', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0545566&anexo=0', 2015),
(641, '81542 ANDRES AVELINO CACERES', NULL, NULL, NULL, '120304', '0578070', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578070&anexo=0', 2015),
(642, '80143 TORIBIO RODRIGUEZ DE MENDOZA', NULL, NULL, NULL, '120305', '0622480', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0622480&anexo=0', 2015),
(643, '80138 ABELARDO GAMARRA RONDO', NULL, NULL, NULL, '120303', '0475798', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0475798&anexo=0', 2015),
(644, 'FLORENCIA DE MORA', NULL, NULL, NULL, '120301', '0395368', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395368&anexo=0', 2015),
(645, '80163', NULL, NULL, NULL, '120301', '1456607', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1456607&anexo=0', 2015),
(646, '80454 ANDRES AVELINO CACERES', NULL, NULL, NULL, '120608', '0509372', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0509372&anexo=0', 2015),
(647, '80437 EUSEBIO ROMERO VASQUEZ', NULL, NULL, NULL, '120603', '1250976', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1250976&anexo=0', 2015),
(648, 'SAN PEDRO DE SICCHAL', NULL, NULL, NULL, '121003', '0396473', 1, 46, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0396473&anexo=0', 2015),
(649, '80553', NULL, NULL, NULL, '121003', '1167592', 1, 46, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1167592&anexo=0', 2015),
(650, 'JAVIER HERAUD', NULL, NULL, NULL, '120708', '0475376', 1, 51, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0475376&anexo=0', 2015),
(651, 'JUAN BUSTAMANTE', NULL, NULL, NULL, '200601', '0239525', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239525&anexo=0', 2015),
(652, 'NICASIO', NULL, NULL, NULL, '200604', '0474973', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0474973&anexo=0', 2015),
(653, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '200609', '0548081', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548081&anexo=0', 2015),
(654, 'INAI CABANILLA', NULL, NULL, NULL, '200602', '0616854', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0616854&anexo=0', 2015),
(655, 'POLITECNICO NACIONAL', NULL, NULL, NULL, '200601', '1028133', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1028133&anexo=0', 2015),
(656, 'INDUSTRIAL SANTA LUCIA', NULL, NULL, NULL, '200609', '1028158', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1028158&anexo=0', 2015),
(657, 'TUPAC AMARU', NULL, NULL, NULL, '200706', '0239517', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239517&anexo=0', 2015),
(658, '108', NULL, NULL, NULL, '200708', '0239749', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239749&anexo=0', 2015),
(659, '27 SANTA LUCIA FE Y ALEGRIA', NULL, NULL, NULL, '200705', '0239905', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239905&anexo=0', 2015),
(660, 'UMACHIRI', NULL, NULL, NULL, '200709', '0522805', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522805&anexo=0', 2015),
(661, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '200707', '0548594', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548594&anexo=0', 2015),
(662, 'ANTAUTA', NULL, NULL, NULL, '200702', '0581470', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581470&anexo=0', 2015),
(663, 'AGROPECUARIO LARIMAYO', NULL, NULL, NULL, '200702', '1024025', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024025&anexo=0', 2015),
(664, 'NUÃ‘OA', NULL, NULL, NULL, '200706', '1025055', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1025055&anexo=0', 2015),
(665, 'ROQUE SAENZ PEÃ‘A', NULL, NULL, NULL, '200701', '1028349', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1028349&anexo=0', 2015),
(666, 'JORGE BASADRE', NULL, NULL, NULL, '200707', '1154616', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1154616&anexo=0', 2015),
(667, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '200704', '1260603', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1260603&anexo=0', 2015),
(668, 'MIGUEL GRAU', NULL, NULL, NULL, '200704', '0581454', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581454&anexo=0', 2015),
(669, '151', NULL, NULL, NULL, '200705', '0716860', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0716860&anexo=0', 2015),
(670, 'LA SALLE', NULL, NULL, NULL, '200708', '1024843', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024843&anexo=0', 2015),
(671, 'DOMINGO SAVIO', NULL, NULL, NULL, '200706', '1580182', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1580182&anexo=0', 2015),
(672, 'TARACO', NULL, NULL, NULL, '200508', '0239558', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239558&anexo=0', 2015),
(673, 'JOSE ABELARDO QUIÃ‘ONES GONZALES', NULL, NULL, NULL, '201301', '0239533', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239533&anexo=0', 2015),
(674, 'AGRO INDUSTRIAL 128', NULL, NULL, NULL, '201302', '0239764', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239764&anexo=0', 2015),
(675, 'TILALI', NULL, NULL, NULL, '201303', '0475012', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0475012&anexo=0', 2015),
(676, 'OCCOPAMPA', NULL, NULL, NULL, '201301', '0578666', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578666&anexo=0', 2015),
(677, 'AGROINDUSTRIAL POMAOCA', NULL, NULL, NULL, '201301', '0578674', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578674&anexo=0', 2015),
(678, 'ENRIQUE TORRES BELON', NULL, NULL, NULL, '200104', '0239723', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239723&anexo=0', 2015),
(679, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '200104', '0474452', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0474452&anexo=0', 2015),
(680, 'SAN JUAN', NULL, NULL, NULL, '200107', '0522193', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522193&anexo=0', 2015),
(681, 'SUCASCO', NULL, NULL, NULL, '200105', '1023688', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1023688&anexo=0', 2015),
(682, 'SAN AGUSTIN', NULL, NULL, NULL, '200105', '0578955', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578955&anexo=0', 2015),
(683, 'QUILCAPUNCU', NULL, NULL, NULL, '201103', '0618017', 1, 193, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0618017&anexo=0', 2015),
(684, 'EL CENTENARIO', NULL, NULL, NULL, '201101', '1026301', 1, 193, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1026301&anexo=0', 2015),
(685, 'TELESFORO CATACORA', NULL, NULL, NULL, '200401', '0240200', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240200&anexo=0', 2015),
(686, 'MARIA ASUNCION GALINDO', NULL, NULL, NULL, '200401', '0240275', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240275&anexo=0', 2015),
(687, 'TAWANTINSUYO', NULL, NULL, NULL, '200402', '0240333', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240333&anexo=0', 2015),
(688, 'ANDRES AVELINO CACERES', NULL, NULL, NULL, '200410', '0474536', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0474536&anexo=0', 2015),
(689, 'PERU BIRF INDUSTRIAL', NULL, NULL, NULL, '200401', '0537266', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537266&anexo=0', 2015),
(690, 'MOLINO', NULL, NULL, NULL, '200401', '0578831', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578831&anexo=0', 2015),
(691, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '200410', '0578872', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578872&anexo=0', 2015),
(692, 'SIMON BOLIVAR', NULL, NULL, NULL, '200407', '0701383', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0701383&anexo=0', 2015),
(693, 'EMANUEL', NULL, NULL, NULL, '200407', '1028885', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1028885&anexo=0', 2015),
(694, 'TECNICO COMERCIAL', NULL, NULL, NULL, '200402', '1029362', 1, 185, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1029362&anexo=0', 2015),
(695, 'HORACIO ZEVALLOS GAMES', NULL, NULL, NULL, '201201', '0578898', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578898&anexo=0', 2015),
(696, 'MICAELA BASTIDAS', NULL, NULL, NULL, '201202', '0701532', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0701532&anexo=0', 2015),
(697, 'SAN ANTONIO', NULL, NULL, NULL, '201201', '1027804', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1027804&anexo=0', 2015),
(698, 'JOSE DOMINGO CHOQUEHUANCA', NULL, NULL, NULL, '200207', '0239491', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239491&anexo=0', 2015),
(699, '125', NULL, NULL, NULL, '200206', '0239756', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239756&anexo=0', 2015),
(700, 'SAN JERONIMO', NULL, NULL, NULL, '200204', '0240366', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240366&anexo=0', 2015),
(701, 'PEDRO VILCAPAZA', NULL, NULL, NULL, '200201', '0478008', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0478008&anexo=0', 2015),
(702, 'SAN AGUSTIN', NULL, NULL, NULL, '200212', '0485763', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0485763&anexo=0', 2015),
(703, 'SAN MIGUEL', NULL, NULL, NULL, '200202', '0500645', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0500645&anexo=0', 2015),
(704, 'SAN JOSE', NULL, NULL, NULL, '200214', '0522508', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522508&anexo=0', 2015),
(705, 'SAN ANTON', NULL, NULL, NULL, '200213', '0547398', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547398&anexo=0', 2015),
(706, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '200215', '0581421', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581421&anexo=0', 2015),
(707, 'YAJCHATA', NULL, NULL, NULL, '200201', '0581439', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581439&anexo=0', 2015),
(708, 'JOSE ANTONIO ENCINAS', NULL, NULL, NULL, '200204', '0581462', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581462&anexo=0', 2015),
(709, 'CAMINACA', NULL, NULL, NULL, '200205', '0581496', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581496&anexo=0', 2015),
(710, 'TUPAC AMARU II', NULL, NULL, NULL, '200217', '0581504', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581504&anexo=0', 2015),
(711, 'CHOCCO', NULL, NULL, NULL, '200206', '0581546', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581546&anexo=0', 2015),
(712, 'CARLOS GUTIERREZ ZAMORA', NULL, NULL, NULL, '200210', '0632091', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0632091&anexo=0', 2015),
(713, 'CHUCARIPO', NULL, NULL, NULL, '200212', '0700948', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0700948&anexo=0', 2015),
(714, 'CAÃ‘ICUTO', NULL, NULL, NULL, '200213', '0729350', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0729350&anexo=0', 2015),
(715, 'AGROPECUARIO', NULL, NULL, NULL, '200201', '1023944', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1023944&anexo=0', 2015),
(716, 'EZEQUIEL URVIOLA Y RIVERO', NULL, NULL, NULL, '200208', '1024017', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024017&anexo=0', 2015),
(717, 'ASILLO', NULL, NULL, NULL, '200204', '1024058', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024058&anexo=0', 2015),
(718, 'SILLOTA', NULL, NULL, NULL, '200204', '1024066', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024066&anexo=0', 2015),
(719, 'SIMON BOLIVAR', NULL, NULL, NULL, '200207', '1024108', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024108&anexo=0', 2015),
(720, 'JOSE MACEDO MENDOZA', NULL, NULL, NULL, '200301', '0698043', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0698043&anexo=0', 2015),
(721, 'SIERVOS DE DIOS', NULL, NULL, NULL, '200306', '1025006', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1025006&anexo=0', 2015),
(722, 'VARONES', NULL, NULL, NULL, '200501', '0478073', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0478073&anexo=0', 2015),
(723, 'CESAR VALLEJO', NULL, NULL, NULL, '200501', '0478081', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0478081&anexo=0', 2015),
(724, 'ROSASPATA', NULL, NULL, NULL, '200507', '0502500', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0502500&anexo=0', 2015),
(725, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '200501', '0526129', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0526129&anexo=0', 2015),
(726, 'PUSI', NULL, NULL, NULL, '200506', '0547380', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547380&anexo=0', 2015),
(727, 'INCHUPALLA', NULL, NULL, NULL, '200504', '0547786', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547786&anexo=0', 2015),
(728, 'LEONCIO PRADO', NULL, NULL, NULL, '200508', '0634345', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0634345&anexo=0', 2015),
(729, 'SACASCO', NULL, NULL, NULL, '200508', '0634311', 1, 188, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0634311&anexo=0', 2015),
(730, 'PHARA', NULL, NULL, NULL, '200805', '0546697', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546697&anexo=0', 2015),
(731, 'CARLOS OQUENDO DE AMAT', NULL, NULL, NULL, '200803', '0547984', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547984&anexo=0', 2015),
(732, 'SIMON BOLIVAR', NULL, NULL, NULL, '200812', '0578716', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578716&anexo=0', 2015),
(733, 'SAN LUIS GONZAGA', NULL, NULL, NULL, '200804', '0578765', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578765&anexo=0', 2015),
(734, 'JORGE BASADRE GROHMANN', NULL, NULL, NULL, '200811', '0618090', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0618090&anexo=0', 2015),
(735, 'CENTENARIO PATAMBUCO', NULL, NULL, NULL, '200806', '0633404', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0633404&anexo=0', 2015),
(736, 'DANTE NAVA', NULL, NULL, NULL, '200806', '1028950', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1028950&anexo=0', 2015),
(737, 'SAN JUAN BOSCO', NULL, NULL, NULL, '200101', '0239798', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239798&anexo=0', 2015),
(738, 'SANTA ROSA', NULL, NULL, NULL, '200101', '0240259', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240259&anexo=0', 2015),
(739, 'SAN ANDRES', NULL, NULL, NULL, '200103', '0507533', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0507533&anexo=0', 2015),
(740, 'CARLOS DANTE NAVA', NULL, NULL, NULL, '200102', '0579029', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579029&anexo=0', 2015),
(741, 'JUAN BUSTAMENTE DUEÃ‘AS', NULL, NULL, NULL, '200113', '0631333', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0631333&anexo=0', 2015),
(742, 'EDUARDO BENIGNO LUQUE ROMERO', NULL, NULL, NULL, '200110', '0489963', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489963&anexo=0', 2015),
(743, 'CABANILLAS', NULL, NULL, NULL, '200903', '0239566', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239566&anexo=0', 2015),
(744, 'DANIEL ALCIDES CARRION', NULL, NULL, NULL, '200904', '0746156', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0746156&anexo=0', 2015),
(745, 'INCA GARCILAZO DE LA VEGA', NULL, NULL, NULL, '200901', '1027184', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1027184&anexo=0', 2015),
(746, 'HORACIO ZEVALLOS GAMEZ', NULL, NULL, NULL, '200901', '1582063', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1582063&anexo=0', 2015),
(747, 'JOSE GALVEZ', NULL, NULL, NULL, '201001', '0240192', 1, 196, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240192&anexo=0', 2015),
(748, 'MICAELA BASTIDAS', NULL, NULL, NULL, '201001', '0474411', 1, 196, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0474411&anexo=0', 2015),
(749, 'MIGUEL GRAU', NULL, NULL, NULL, '201006', '0572982', 1, 196, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0572982&anexo=0', 2015),
(750, 'COPANI', NULL, NULL, NULL, '201004', '1029321', 1, 196, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1029321&anexo=0', 2015),
(751, 'MISIONAL GORETTI', NULL, NULL, NULL, '150206', '1265768', 1, 36, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1265768&anexo=0', 2015),
(752, 'SAN JUAN BAUTISTA DE LA SALLE', NULL, NULL, NULL, '150401', '1155274', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1155274&anexo=0', 2015),
(753, 'PADRE AGUSTIN LOPEZ PARDO', NULL, NULL, NULL, '150401', '0302869', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0302869&anexo=0', 2015),
(754, 'MARIA INMACULADA', NULL, NULL, NULL, '150401', '0302877', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0302877&anexo=0', 2015),
(755, 'PADRE SEVERINO DESHAIES', NULL, NULL, NULL, '150103', '0304394', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0304394&anexo=0', 2015),
(756, '60087 LUCILLE GAGNE PELLERIN', NULL, NULL, NULL, '150106', '0521419', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521419&anexo=0', 2015),
(757, 'NUESTRA SEÃ‘ORA DE LA SALUD', NULL, NULL, NULL, '150111', '0682229', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0682229&anexo=0', 2015),
(758, '6010156 ANDRES AVELINO CACERES', NULL, NULL, NULL, '150101', '1147651', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1147651&anexo=0', 2015),
(759, 'NUESTRA SEÃ‘ORA DE LORETO', NULL, NULL, NULL, '150301', '0302851', 1, 37, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0302851&anexo=0', 2015),
(760, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '110301', '0372532', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372532&anexo=0', 2015),
(761, 'JOSE GALVEZ BARRENECHEA', NULL, NULL, NULL, '110610', '0372573', 1, 125, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372573&anexo=0', 2015),
(762, 'LA ASUNCION', NULL, NULL, NULL, '110101', '0372698', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372698&anexo=0', 2015),
(763, 'AMALIA ESPINOZA', NULL, NULL, NULL, '110610', '0372714', 1, 125, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372714&anexo=0', 2015),
(764, 'HEROINAS TOLEDO', NULL, NULL, NULL, '110201', '0372730', 1, 116, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372730&anexo=0', 2015),
(765, 'SAN VICENTE DE PAUL', NULL, NULL, NULL, '110301', '0372748', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372748&anexo=0', 2015),
(766, 'LA VICTORIA DE JUNIN', NULL, NULL, NULL, '110401', '0372789', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372789&anexo=0', 2015),
(767, 'SANTA ROSA', NULL, NULL, NULL, '110402', '0372797', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372797&anexo=0', 2015),
(768, 'JOSE SANTOS CHOCANO', NULL, NULL, NULL, '110609', '0372847', 1, 125, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372847&anexo=0', 2015),
(769, 'RICARDO PALMA', NULL, NULL, NULL, '110605', '0372854', 1, 125, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372854&anexo=0', 2015),
(770, 'CHINCHAYSUYO', NULL, NULL, NULL, '110133', '0372870', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372870&anexo=0', 2015),
(771, 'PACHACUTEC', NULL, NULL, NULL, '110109', '0372888', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372888&anexo=0', 2015),
(772, 'AMAUTA', NULL, NULL, NULL, '110902', '0372912', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372912&anexo=0', 2015),
(773, 'JOSE OLAYA', NULL, NULL, NULL, '110116', '0372946', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372946&anexo=0', 2015),
(774, 'SANTIAGO LEON', NULL, NULL, NULL, '110903', '0372961', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372961&anexo=0', 2015),
(775, '27 DE MAYO', NULL, NULL, NULL, '110126', '0372987', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372987&anexo=0', 2015),
(776, 'MARISCAL ANDRES AVELINO CACERES', NULL, NULL, NULL, '110124', '0372995', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372995&anexo=0', 2015),
(777, 'APU INCA', NULL, NULL, NULL, '110204', '0373027', 1, 116, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373027&anexo=0', 2015),
(778, 'SAN MIGUEL', NULL, NULL, NULL, '110502', '0373126', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373126&anexo=0', 2015),
(779, 'SAN JUAN', NULL, NULL, NULL, '110504', '0373134', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373134&anexo=0', 2015),
(780, 'VICTOR ANDRES BELAUNDE', NULL, NULL, NULL, '110508', '0373159', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373159&anexo=0', 2015),
(781, 'SAN CRISTOBAL', NULL, NULL, NULL, '110507', '0373167', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373167&anexo=0', 2015),
(782, 'JORGE CHAVEZ DARTNELL', NULL, NULL, NULL, '110402', '0373183', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373183&anexo=0', 2015),
(783, 'FRANCISCO IRAZOLA', NULL, NULL, NULL, '110701', '0373191', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373191&anexo=0', 2015),
(784, 'POLITECNICO PERU BIRF- S.DOMINGO', NULL, NULL, NULL, '110134', '0373522', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373522&anexo=0', 2015),
(785, 'SAN MIGUEL', NULL, NULL, NULL, '110404', '0373563', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373563&anexo=0', 2015),
(786, 'AUGUSTO SALAZAR BONDY', NULL, NULL, NULL, '110215', '0525428', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525428&anexo=0', 2015),
(787, 'SAGRADO CORAZON DE JESUS', NULL, NULL, NULL, '110113', '0566927', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0566927&anexo=0', 2015),
(788, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, NULL, '110805', '0580076', 1, 121, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580076&anexo=0', 2015),
(789, 'CAHUIDE', NULL, NULL, NULL, '110909', '0580290', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580290&anexo=0', 2015),
(790, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '110108', '0580977', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580977&anexo=0', 2015),
(791, 'SANTO DOMINGO DE GUZMAN', NULL, NULL, NULL, '110506', '0581249', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581249&anexo=0', 2015),
(792, 'JOSE FAUSTINO SANCHEZ CARRION', NULL, NULL, NULL, '110306', '0590737', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0590737&anexo=0', 2015),
(793, 'HEROES DE LA BREÃ‘A', NULL, NULL, NULL, '110905', '0590919', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0590919&anexo=0', 2015),
(794, 'NUESTRA SEÃ‘ORA DE LAS MERCEDES', NULL, NULL, NULL, '110801', '0599175', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0599175&anexo=0', 2015),
(795, 'SALESIANO DON BOSCO', NULL, NULL, NULL, '110113', '0667022', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0667022&anexo=0', 2015),
(796, 'JUAN MAXIMO VILLAR', NULL, NULL, NULL, '110301', '0667063', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0667063&anexo=0', 2015),
(797, 'MARIA AUXILIADORA', NULL, NULL, NULL, '110801', '0692814', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0692814&anexo=0', 2015),
(798, 'ALIPIO PONCE VASQUEZ', NULL, NULL, NULL, '110326', '0748962', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0748962&anexo=0', 2015),
(799, 'LIBERTADOR SIMON BOLIVAR', NULL, NULL, NULL, '110401', '0936765', 1, 119, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0936765&anexo=0', 2015),
(800, 'LOS ANGELES', NULL, NULL, NULL, '110805', '0937326', 1, 121, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0937326&anexo=0', 2015),
(801, 'SAN RAMON', NULL, NULL, NULL, '110706', '1036532', 1, 120, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1036532&anexo=0', 2015),
(802, '31511 LORENZO ALCALA POMALAZA', NULL, NULL, NULL, '110201', '1099852', 1, 116, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1099852&anexo=0', 2015),
(803, 'SANTA ROSA', NULL, NULL, NULL, '110802', '1214410', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1214410&anexo=0', 2015),
(804, 'JOSE GALVEZ', NULL, NULL, NULL, '110707', '0598839', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0598839&anexo=0', 2015),
(805, 'JAVIER HERAUD', NULL, NULL, NULL, '110118', '0697003', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697003&anexo=0', 2015),
(806, 'HEROES DEL CENEPA', NULL, NULL, NULL, '110113', '0697029', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697029&anexo=0', 2015),
(807, 'PUCHARINI', NULL, NULL, NULL, '110806', '0738799', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0738799&anexo=0', 2015),
(808, 'LA INMACULADA', NULL, NULL, NULL, '110708', '1100171', 1, 122, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1100171&anexo=0', 2015),
(809, '31886', NULL, NULL, NULL, '110806', '1434232', 1, 121, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1434232&anexo=0', 2015),
(810, 'DIVINO NIÃ‘O JESUS', NULL, NULL, NULL, '110701', '1439413', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1439413&anexo=0', 2015),
(811, 'SAN DANIEL', NULL, NULL, NULL, '110706', '1439835', 1, 120, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1439835&anexo=0', 2015),
(812, 'INCA GARCILASO', NULL, NULL, NULL, '110302', '0372623', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372623&anexo=0', 2015),
(813, 'PERENE', NULL, NULL, NULL, '110806', '0373290', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373290&anexo=0', 2015),
(814, 'NUESTRA SEÃ‘ORA DE LOURDES', NULL, NULL, NULL, '080501', '0372805', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372805&anexo=0', 2015),
(815, 'ANTONIO RAIMONDI', NULL, NULL, NULL, '080701', '0373217', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373217&anexo=0', 2015),
(816, 'NUESTRA SEÃ‘ORA DE LA ASUNCION', NULL, NULL, NULL, '080502', '0373225', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373225&anexo=0', 2015),
(817, 'SAN FRANCISCO', NULL, NULL, NULL, '080707', '0373241', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373241&anexo=0', 2015),
(818, 'RAUL PORRAS BARRENECHEA', NULL, NULL, NULL, '080517', '0373258', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373258&anexo=0', 2015),
(819, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, NULL, '080506', '0373266', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373266&anexo=0', 2015),
(820, 'MARISCAL AGUSTIN GAMARRA', NULL, NULL, NULL, '080120', '0421263', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421263&anexo=0', 2015),
(821, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '080201', '0421271', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421271&anexo=0', 2015),
(822, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '080301', '0421297', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421297&anexo=0', 2015),
(823, 'MANUEL ASCENCIO SEGURA', NULL, NULL, NULL, '080109', '0421305', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421305&anexo=0', 2015),
(824, 'NUESTRA SEÃ‘ORA DE COCHARCAS', NULL, NULL, NULL, '080206', '0421321', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421321&anexo=0', 2015),
(825, 'JESUS NAZARENO', NULL, NULL, NULL, '080308', '0421354', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421354&anexo=0', 2015),
(826, 'TUPAC AMARU', NULL, NULL, NULL, '080115', '0421362', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421362&anexo=0', 2015),
(827, 'AUGUSTO SALAZAR BONDY', NULL, NULL, NULL, '080512', '0499269', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0499269&anexo=0', 2015),
(828, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '080704', '0499749', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0499749&anexo=0', 2015),
(829, 'ANDRES AVELINO CACERES', NULL, NULL, NULL, '080311', '0508077', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0508077&anexo=0', 2015),
(830, 'RICARDO PALMA', NULL, NULL, NULL, '080106', '0525626', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525626&anexo=0', 2015),
(831, 'RICARDO PALMA', NULL, NULL, NULL, '080301', '0571554', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571554&anexo=0', 2015),
(832, 'MANUEL GONZALES PRADA', NULL, NULL, NULL, '080114', '0571760', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571760&anexo=0', 2015),
(833, 'CIRO ALEGRIA BAZAN', NULL, NULL, NULL, '080202', '0579979', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579979&anexo=0', 2015),
(834, 'JORGE CHAVEZ', NULL, NULL, NULL, '080207', '0579987', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579987&anexo=0', 2015),
(835, 'SANTIAGO', NULL, NULL, NULL, '080512', '0580381', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580381&anexo=0', 2015),
(836, 'SANTA ROSA', NULL, NULL, NULL, '080511', '0580415', 1, 75, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580415&anexo=0', 2015),
(837, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, NULL, '080301', '0600783', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0600783&anexo=0', 2015),
(838, 'JOSE MARIA ARGUEDAS ALTAMIRANO', NULL, NULL, NULL, '080503', '0637314', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637314&anexo=0', 2015),
(839, 'INCA GARCILAZO DE LA VEGA', NULL, NULL, NULL, '080208', '0637371', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637371&anexo=0', 2015),
(840, 'JAVIER HERAUD', NULL, NULL, NULL, '080709', '0637611', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637611&anexo=0', 2015),
(841, 'MICAELA BASTIDAS PUYUCAHUA', NULL, NULL, NULL, '080506', '0687731', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0687731&anexo=0', 2015),
(842, 'SAN MIGUEL', NULL, NULL, NULL, '080504', '0687772', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0687772&anexo=0', 2015),
(843, '37510 JOSE ABELARDO QUIÃ‘ONES GONZALES', NULL, NULL, NULL, '080709', '0687897', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0687897&anexo=0', 2015),
(844, 'JORGE BASADRE GROHMANN', NULL, NULL, NULL, '080519', '0697680', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697680&anexo=0', 2015),
(845, 'TUPAC AMARU II', NULL, NULL, NULL, '080509', '0743302', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0743302&anexo=0', 2015),
(846, 'ANDRES AVELINO CACERES', NULL, NULL, NULL, '080711', '0770727', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0770727&anexo=0', 2015),
(847, 'SAN PABLO', NULL, NULL, NULL, '080302', '0802033', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0802033&anexo=0', 2015),
(848, '1 DE MAYO', NULL, NULL, NULL, '080312', '0802041', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0802041&anexo=0', 2015),
(849, 'ANTONIO RAYMONDI', NULL, NULL, NULL, '080118', '0829754', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0829754&anexo=0', 2015),
(850, 'MIGUEL GRAU SEMINARIO', NULL, NULL, NULL, '080206', '1058288', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1058288&anexo=0', 2015),
(851, 'AMERICA', NULL, NULL, NULL, '080119', '1058312', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1058312&anexo=0', 2015),
(852, 'DANIEL ALCIDES CARRION', NULL, NULL, NULL, '080208', '1059203', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059203&anexo=0', 2015),
(853, 'ENRIQUETA SAMANEZ DE HERMOZA', NULL, NULL, NULL, '080506', '1059419', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059419&anexo=0', 2015),
(854, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '080301', '1059849', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059849&anexo=0', 2015),
(855, 'CORAS', NULL, NULL, NULL, '080204', '1060276', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1060276&anexo=0', 2015),
(856, 'JOSE GALVEZ BARRENECHEA', NULL, NULL, NULL, '080302', '1246503', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1246503&anexo=0', 2015),
(857, 'JOSE ABELARDO QUIÃ‘ONES GONZALES', NULL, NULL, NULL, '080202', '1246586', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1246586&anexo=0', 2015),
(858, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '080523', '1350792', 1, 75, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1350792&anexo=0', 2015),
(859, 'MARISCAL CACERES', NULL, NULL, NULL, '080509', '1407592', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1407592&anexo=0', 2015),
(860, 'SAN PEDRO', NULL, NULL, NULL, '080523', '0489906', 1, 75, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489906&anexo=0', 2015),
(861, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '080118', '0552232', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0552232&anexo=0', 2015),
(862, 'CHONTACANCHA', NULL, NULL, NULL, '080302', '1403443', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1403443&anexo=0', 2015),
(863, 'G.U.E.MARIANO MELGAR VALDIVIESO', NULL, NULL, NULL, '040126', '0309187', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309187&anexo=0', 2015),
(864, 'INDEPENDENCIA AMERICANA', NULL, NULL, NULL, '040101', '0309229', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309229&anexo=0', 2015),
(865, 'SAN LUIS GONZAGA', NULL, NULL, NULL, '040601', '0309286', 1, 83, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309286&anexo=0', 2015),
(866, 'ANDREA VALDIVIESO DE MELGAR', NULL, NULL, NULL, '040126', '0309336', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309336&anexo=0', 2015),
(867, 'NUESTRA SEÃ‘ORA DE LA CANDELARIA', NULL, NULL, NULL, '040308', '0309351', 1, 79, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309351&anexo=0', 2015),
(868, 'NUESTRA SEÃ‘ORA DE LA ASUNCION', NULL, NULL, NULL, '040101', '0309385', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309385&anexo=0', 2015),
(869, 'CORAZON DE MARIA', NULL, NULL, NULL, '040601', '0309419', 1, 83, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309419&anexo=0', 2015),
(870, 'ANGEL FRANCISCO ALI GUILLEN', NULL, NULL, NULL, '040104', '0309443', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309443&anexo=0', 2015),
(871, 'SAN MARTIN DE SOCABAYA', NULL, NULL, NULL, '040119', '0309468', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309468&anexo=0', 2015),
(872, 'VICTOR MANUEL TORRES CACERES', NULL, NULL, NULL, '040706', '0309484', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309484&anexo=0', 2015),
(873, 'FRANCISCO JAVIER DE LUNA PIZARRO', NULL, NULL, NULL, '040107', '0309526', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309526&anexo=0', 2015),
(874, 'INDEPENDENCIA DEL PERU', NULL, NULL, NULL, '040401', '0309534', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309534&anexo=0', 2015),
(875, 'HIPOLITO SANCHEZ TRUJILLO', NULL, NULL, NULL, '040203', '0309559', 1, 82, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309559&anexo=0', 2015),
(876, 'FRANCISCO GARCIA CALDERON', NULL, NULL, NULL, '040201', '0309567', 1, 82, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309567&anexo=0', 2015),
(877, '40017 NUESTRA SEÃ‘ORA DE LOURDES', NULL, NULL, NULL, '040101', '0309633', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309633&anexo=0', 2015),
(878, 'MIGUEL GRAU', NULL, NULL, NULL, '040403', '0309716', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309716&anexo=0', 2015),
(879, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, NULL, '040122', '0309724', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309724&anexo=0', 2015),
(880, '40479 MIGUEL GRAU', NULL, NULL, NULL, '040704', '0309740', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309740&anexo=0', 2015),
(881, 'JOSE MARIA MORANTE', NULL, NULL, NULL, '040306', '0309757', 1, 79, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309757&anexo=0', 2015),
(882, 'FRANCISCO LOPEZ DE ROMAÃ‘A', NULL, NULL, NULL, '040703', '0310169', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310169&anexo=0', 2015),
(883, 'FAUSTINO B. FRANCO', NULL, NULL, NULL, '040308', '0310417', 1, 79, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310417&anexo=0', 2015),
(884, 'JUAN PABLO VIZCARDO Y GUZMAN', NULL, NULL, NULL, '040510', '0310433', 1, 81, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310433&anexo=0', 2015),
(885, '40074 JOSE L.BUSTAMANTE Y RIVERO', NULL, NULL, NULL, '040114', '0498881', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0498881&anexo=0', 2015),
(886, '40326 JUAN VELASCO ALVARADO', NULL, NULL, NULL, '040106', '0501486', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0501486&anexo=0', 2015),
(887, 'SANTA ROSA DE LIMA (CIRCA)', NULL, NULL, NULL, '040128', '0515668', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0515668&anexo=0', 2015),
(888, '40065 GLORIOSO HEROES DEL CENEPA', NULL, NULL, NULL, '040106', '0517565', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0517565&anexo=0', 2015),
(889, 'SAN PEDRO DE YAUCA', NULL, NULL, NULL, '040413', '0517979', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0517979&anexo=0', 2015),
(890, '40197 FELIPE SANTIAGO SALAVERRY', NULL, NULL, NULL, '040119', '0579649', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579649&anexo=0', 2015),
(891, 'CIRO ALEGRIA BAZAN', NULL, NULL, NULL, '040703', '0579771', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579771&anexo=0', 2015),
(892, 'GRAN LIBERTADOR SIMON BOLIVAR', NULL, NULL, NULL, '040204', '0589804', 1, 82, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0589804&anexo=0', 2015),
(893, 'CHUCARAPI', NULL, NULL, NULL, '040702', '0610659', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0610659&anexo=0', 2015),
(894, 'GRAN PACHACUTEC', NULL, NULL, NULL, '040103', '0612945', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0612945&anexo=0', 2015),
(895, 'CORAZON DE JESUS (CIRCA)', NULL, NULL, NULL, '040126', '0617209', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617209&anexo=0', 2015),
(896, 'NUESTRA SRA.DE LOURDES (CIRCA)', NULL, NULL, NULL, '040109', '0617233', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617233&anexo=0', 2015),
(897, '40494 JOSE ABELARDO QUIÃ‘ONES', NULL, NULL, NULL, '040705', '0617548', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617548&anexo=0', 2015),
(898, 'SAN ANTONIO MARIA CLARET (CIRCA)', NULL, NULL, NULL, '040127', '0636217', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0636217&anexo=0', 2015),
(899, 'LEON XIII (CIRCA)', NULL, NULL, NULL, '040102', '0637306', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637306&anexo=0', 2015),
(900, 'NUESTRA SEÃ‘ORA DE LAS PEÃ‘AS', NULL, NULL, NULL, '040501', '0679027', 1, 81, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0679027&anexo=0', 2015),
(901, '40122 MANUEL SCORZA TORRES', NULL, NULL, NULL, '040129', '0695288', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695288&anexo=0', 2015),
(902, '7 DE AGOSTO', NULL, NULL, NULL, '040129', '0695312', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695312&anexo=0', 2015),
(903, 'EL CRUCE', NULL, NULL, NULL, '040106', '0695320', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695320&anexo=0', 2015),
(904, '40201 TECNICO AGROPECUARIO LA COLINA', NULL, NULL, NULL, '040220', '0698308', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0698308&anexo=0', 2015),
(905, '40211', NULL, NULL, NULL, '040109', '0723486', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0723486&anexo=0', 2015),
(906, '40594 JUAN VELASCO A.', NULL, NULL, NULL, '040220', '0745968', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0745968&anexo=0', 2015),
(907, '40058 IGNACIO ALVAREZ THOMAS', NULL, NULL, NULL, '040103', '0749358', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0749358&anexo=0', 2015),
(908, 'CIUDAD DE DIOS', NULL, NULL, NULL, '040125', '0749366', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0749366&anexo=0', 2015),
(909, 'SEÃ‘OR DE LOS MILAGROS (CIRCA)', NULL, NULL, NULL, '040125', '0794412', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0794412&anexo=0', 2015),
(910, '40284 PEDRO PAULET MOSTAJO', NULL, NULL, NULL, '040220', '0794552', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0794552&anexo=0', 2015),
(911, '40220 HEROES DEL CENEPA', NULL, NULL, NULL, '040109', '0895516', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0895516&anexo=0', 2015),
(912, 'SANTO TOMAS DE AQUINO (CIRCA)', NULL, NULL, NULL, '040103', '0897819', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0897819&anexo=0', 2015),
(913, '40625 CORAZON DE JESUS', NULL, NULL, NULL, '040220', '0897942', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0897942&anexo=0', 2015),
(914, '41061 JOSE ANTONIO ENCINAS', NULL, NULL, NULL, '040220', '0898007', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0898007&anexo=0', 2015),
(915, '40052 EL PERUANO DEL MILENIO ALMIRANTE MIGUEL GRAU', NULL, NULL, NULL, '040102', '0899039', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899039&anexo=0', 2015),
(916, '40300 MIGUEL GRAU', NULL, NULL, NULL, '040109', '0899237', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899237&anexo=0', 2015),
(917, '40033 SAN AGUSTIN DE HUNTER', NULL, NULL, NULL, '040127', '0899294', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899294&anexo=0', 2015),
(918, 'CRISTO MORADO', NULL, NULL, NULL, '040103', '0899369', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899369&anexo=0', 2015),
(919, '40172', NULL, NULL, NULL, '040119', '1031582', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1031582&anexo=0', 2015),
(920, '40222 DIEGO THOMSON', NULL, NULL, NULL, '040128', '1031640', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1031640&anexo=0', 2015),
(921, 'LA CAMPIÃ‘A', NULL, NULL, NULL, '040119', '1259381', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1259381&anexo=0', 2015),
(922, '40670 EL EDEN FE Y ALEGRIA 51', NULL, NULL, NULL, '040103', '1261189', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1261189&anexo=0', 2015),
(923, 'EL GRAN MAESTRO', NULL, NULL, NULL, '040119', '1327824', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1327824&anexo=0', 2015),
(924, 'CASA DE CARIDAD ARTES Y OFICIOS', NULL, NULL, NULL, '040103', '1334473', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1334473&anexo=0', 2015),
(925, 'HORTENCIA PARDO MANCEBO', NULL, NULL, NULL, '040407', '0309583', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309583&anexo=0', 2015),
(926, 'NEPTALI VALDERRAMA AMPUERO', NULL, NULL, NULL, '040109', '0525725', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525725&anexo=0', 2015),
(927, 'SIMON BOLIVAR', NULL, NULL, NULL, '040408', '0892091', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0892091&anexo=0', 2015),
(928, 'SAN PEDRO Y SAN PABLO (CIRCA)', NULL, NULL, NULL, '040109', '1032184', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1032184&anexo=0', 2015),
(929, 'ANGEL DE LA GUARDA', NULL, NULL, NULL, '040308', '1442979', 1, 79, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1442979&anexo=0', 2015),
(930, 'GABINO URIBE ANTUNEZ', NULL, NULL, NULL, '020201', '0411785', 1, 98, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411785&anexo=0', 2015),
(931, 'JULIO C. TELLO', NULL, NULL, NULL, '021604', '0411868', 1, 99, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411868&anexo=0', 2015),
(932, '86211 CORONEL BOLOGNESI', NULL, NULL, NULL, '020301', '0411793', 1, 101, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411793&anexo=0', 2015),
(933, '20850 MARISCAL CACERES', NULL, NULL, NULL, '020323', '0577270', 1, 101, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577270&anexo=0', 2015),
(934, 'JOSE CARLOS MARIATEGUI', NULL, NULL, NULL, '020325', '1101849', 1, 101, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1101849&anexo=0', 2015),
(935, '32226 RAUL CORDOVA ALVARADO', NULL, NULL, NULL, '020325', '1431790', 1, 101, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1431790&anexo=0', 2015),
(936, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '020406', '0495606', 1, 102, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495606&anexo=0', 2015),
(937, 'PEDRO PABLO ATUSPARIA', NULL, NULL, NULL, '020406', '0665919', 1, 102, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0665919&anexo=0', 2015);
INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(938, '86280 RICARDO PALMA', NULL, NULL, NULL, '020402', '0906685', 1, 102, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0906685&anexo=0', 2015),
(939, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, NULL, '020411', '0597922', 1, 102, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0597922&anexo=0', 2015),
(940, '86031 NUESTRA SEÃ‘ORA DE LA ASUNCION', NULL, NULL, NULL, '020102', '0577395', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577395&anexo=0', 2015),
(941, '86030 NIÃ‘O JESUS DE PRAGA', NULL, NULL, NULL, '020102', '0577460', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577460&anexo=0', 2015),
(942, '86043 VIRGEN DE LAS MERCEDES', NULL, NULL, NULL, '020106', '0665885', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0665885&anexo=0', 2015),
(943, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '020110', '0411827', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411827&anexo=0', 2015),
(944, '86495 SAN JUAN BAUTISTA', NULL, NULL, NULL, '020707', '0577643', 1, 106, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577643&anexo=0', 2015),
(945, '86559 LIBERTADOR SAN MARTIN', NULL, NULL, NULL, '021201', '0411702', 1, 110, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411702&anexo=0', 2015),
(946, '86568 NUESTRA SEÃ‘ORA DEL PILAR', NULL, NULL, NULL, '021208', '0411710', 1, 110, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411710&anexo=0', 2015),
(947, '86577 CESAR VALLEJO MENDOZA', NULL, NULL, NULL, '021210', '0577437', 1, 110, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577437&anexo=0', 2015),
(948, 'INMACULADA DE LA MERCED', NULL, NULL, NULL, '021301', '0359356', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359356&anexo=0', 2015),
(949, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, NULL, '021307', '0359398', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359398&anexo=0', 2015),
(950, 'MICAELA BASTIDAS', NULL, NULL, NULL, '021301', '0359596', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359596&anexo=0', 2015),
(951, 'LA LIBERTAD', NULL, NULL, NULL, '021301', '0359612', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359612&anexo=0', 2015),
(952, '88331', NULL, NULL, NULL, '021307', '0546523', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546523&anexo=0', 2015),
(953, 'R. F. S. DE YUGOSLAVIA', NULL, NULL, NULL, '021309', '0570291', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0570291&anexo=0', 2015),
(954, '88066 RENE SALAZAR MAGUIÃ‘A', NULL, NULL, NULL, '021301', '0605899', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0605899&anexo=0', 2015),
(955, '88319', NULL, NULL, NULL, '021307', '0606434', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0606434&anexo=0', 2015),
(956, '88039 JAVIER HERAUD', NULL, NULL, NULL, '021307', '0686519', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0686519&anexo=0', 2015),
(957, '88021 ALFONSO UGARTE', NULL, NULL, NULL, '021309', '1002096', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1002096&anexo=0', 2015),
(958, 'SAN ROQUE MANCOS', NULL, NULL, NULL, '021503', '0411694', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411694&anexo=0', 2015),
(959, '86026 SANTA INES', NULL, NULL, NULL, '021501', '0577494', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577494&anexo=0', 2015),
(960, '86692 JUAN BAUTISTA DE LA SALLE', NULL, NULL, NULL, '021503', '0577502', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577502&anexo=0', 2015),
(961, 'CESAR VALLEJO MENDOZA', NULL, NULL, NULL, '020807', '0577569', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577569&anexo=0', 2015),
(962, 'HORACIO ZEBALLOS GAMEZ', NULL, NULL, NULL, '020810', '0577676', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577676&anexo=0', 2015),
(963, 'ELEAZAR GUZMAN BARRON', NULL, NULL, NULL, '020816', '0577700', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577700&anexo=0', 2015),
(964, 'SANTIAGO ANTUNES DE MAYOLO', NULL, NULL, NULL, '020813', '0849307', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0849307&anexo=0', 2015),
(965, '86344 JAVIER HERAUD PEREZ', NULL, NULL, NULL, '021802', '0680991', 1, 100, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0680991&anexo=0', 2015),
(966, 'CARLOS FERMIN FITZCARRALD', NULL, NULL, NULL, '021701', '0411884', 1, 103, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411884&anexo=0', 2015),
(967, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '021702', '0577767', 1, 103, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577767&anexo=0', 2015),
(968, 'MARISCAL LUZURIAGA', NULL, NULL, NULL, '020901', '0392340', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0392340&anexo=0', 2015),
(969, 'JULIA OLIVAS ESCUDERO', NULL, NULL, NULL, '020905', '0535062', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535062&anexo=0', 2015),
(970, 'SAN ANTONIO DE PADUA', NULL, NULL, NULL, '020902', '0566737', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0566737&anexo=0', 2015),
(971, 'JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, NULL, '020903', '1043793', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1043793&anexo=0', 2015),
(972, 'MONSEÃ‘OR FIDEL OLIVAS ESCUDERO', NULL, NULL, NULL, '021101', '0391573', 1, 109, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0391573&anexo=0', 2015),
(973, 'EFRAIN ROCA GAMBINI', NULL, NULL, NULL, '021102', '0521781', 1, 109, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521781&anexo=0', 2015),
(974, 'LUIS TARAZONA NEGREIROS', NULL, NULL, NULL, '021103', '0575225', 1, 109, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575225&anexo=0', 2015),
(975, 'VIRGEN DEL SOCORRO', NULL, NULL, NULL, '021101', '0632711', 1, 109, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0632711&anexo=0', 2015),
(976, 'CAPITAN MARCELINO VALVERDE SOLORZANO', NULL, NULL, NULL, '021401', '0391912', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0391912&anexo=0', 2015),
(977, 'MANUEL SCORZA', NULL, NULL, NULL, '021407', '0520791', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0520791&anexo=0', 2015),
(978, 'APOSTOL SANTIAGO', NULL, NULL, NULL, '021001', '0359455', 1, 108, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359455&anexo=0', 2015),
(979, 'AGROPECUARIO 47', NULL, NULL, NULL, '021008', '0359588', 1, 108, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359588&anexo=0', 2015),
(980, '88156 SAN AGUSTIN', NULL, NULL, NULL, '021009', '0545723', 1, 108, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0545723&anexo=0', 2015),
(981, 'MARIA PARADO DE BELLIDO - HUANCARAMA', NULL, NULL, NULL, '030304', '0929810', 1, 59, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929810&anexo=0', 2015),
(982, 'RICARDO PALMA', NULL, NULL, NULL, '030307', '0725127', 1, 59, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0725127&anexo=0', 2015),
(983, 'ANTONIO OCAMPO', NULL, NULL, NULL, '030103', '0236505', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236505&anexo=0', 2015),
(984, 'TRANCAPATA', NULL, NULL, NULL, '030103', '0615898', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0615898&anexo=0', 2015),
(985, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '030105', '0535617', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535617&anexo=0', 2015),
(986, 'FRANCISCO MONTUFAR PINTO', NULL, NULL, NULL, '030108', '0575399', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575399&anexo=0', 2015),
(987, 'LIBERTADORES DE AMERICA', NULL, NULL, NULL, '030201', '0236208', 1, 56, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236208&anexo=0', 2015),
(988, 'FEDERICO VILLARREAL', NULL, NULL, NULL, '030301', '0667428', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0667428&anexo=0', 2015),
(989, 'AGROPECUARIO N 8', NULL, NULL, NULL, '030310', '0236943', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236943&anexo=0', 2015),
(990, 'GREGORIO MARTINELLY', NULL, NULL, NULL, '030311', '0236570', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236570&anexo=0', 2015),
(991, 'SAN FRANCISCO DE ASIS', NULL, NULL, NULL, '030302', '0535716', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535716&anexo=0', 2015),
(992, 'JOSE MARIA ARGUEDAS', NULL, NULL, NULL, '030306', '0701797', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0701797&anexo=0', 2015),
(993, 'JOSE OLAYA BALANDRA', NULL, NULL, NULL, '030313', '0575480', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575480&anexo=0', 2015),
(994, 'SAN MARTIN DE PORRES', NULL, NULL, NULL, '030310', '1330539', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1330539&anexo=0', 2015),
(995, 'LEONCIO PRADO', NULL, NULL, NULL, '030310', '1089614', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1089614&anexo=0', 2015),
(996, 'FRANCISCO BOLOGNESI CERVANTES', NULL, NULL, NULL, '030318', '1089655', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1089655&anexo=0', 2015),
(997, 'TRILCE', NULL, NULL, NULL, '030315', '0620674', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0620674&anexo=0', 2015),
(998, 'JUAN VELASCO ALVARADO', NULL, NULL, NULL, '030315', '1089416', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1089416&anexo=0', 2015),
(999, 'GUILLERMO PINTO ISMODES', NULL, NULL, NULL, '030315', '0575241', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575241&anexo=0', 2015),
(1000, 'JUAN ANTONIO LIGARDA PINEDA', NULL, NULL, NULL, '030312', '0645622', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0645622&anexo=0', 2015),
(1001, '16040 SAN JOSE', NULL, NULL, 'CALLE AMERICA 113', '010202', '1307560', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1307560&anexo=0', 2016),
(1002, '16714 SUWIKAI TSAKIM MIYAN', NULL, NULL, 'PAANTAM S/N', '010206', '0926535', 1, 12, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0926535&anexo=0', 2016),
(1003, '18084 LA VILLA', NULL, NULL, 'CALLE NESTOR VELIZ GUTIERREZ S/N', '010312', '1303346', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1303346&anexo=0', 2016),
(1004, 'JOSE DE SAN MARTIN', NULL, NULL, 'AUTOPISTA FERNADO BELAUNDE TERRY S/N', '010311', '0593996', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0593996&anexo=0', 2016),
(1005, 'TORIBIO RODRIGUEZ DE MENDOZA', NULL, NULL, 'AUTOPISTA FERNANDO BELAUNDE TERRY KM 345,7', '010311', '1187996', 1, 13, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1187996&anexo=0', 2016),
(1006, 'WEEPIU YUU KUYU', NULL, NULL, 'URAKUSA S/N', '010601', '0767673', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0767673&anexo=0', 2016),
(1007, 'HILARIO CHUIN BASHUTAT', NULL, NULL, 'KUSU KUBAIM', '010603', '1493188', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1493188&anexo=0', 2016),
(1008, 'PUERTO GALILEA', NULL, NULL, 'PUERTO GALILEA S/N', '010602', '0582841', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582841&anexo=0', 2016),
(1009, 'SIMON PEZO ISMIÃ‘O', NULL, NULL, 'COMUNIDAD DE BELEN S/N', '010602', '1332881', 1, 15, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1332881&anexo=0', 2016),
(1010, 'BLAS VALERA', NULL, NULL, 'AVENIDA BLAS VALERA 756', '010401', '0262246', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262246&anexo=0', 2016),
(1011, 'CRISTOBAL BENQUE', NULL, NULL, 'COLCAMAR', '010404', '0567982', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0567982&anexo=0', 2016),
(1012, 'AUGUSTO SALAZAR BONDY', NULL, NULL, 'CHUQUIMAL', '010413', '1435262', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1435262&anexo=0', 2016),
(1013, 'SAN JUAN', NULL, NULL, 'SAN JUAN', '010413', '0657403', 1, 16, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0657403&anexo=0', 2016),
(1014, 'TORIBIO RODRIGUEZ DE MENDOZA', NULL, NULL, 'AVENIDA JUAN PARDO DE MIGUEL 502', '010501', '0262253', 1, 17, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262253&anexo=0', 2016),
(1015, 'SAN FRANCISCO', NULL, NULL, 'JIRON SANTO TORIBIO S/N', '010505', '0522771', 1, 17, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522771&anexo=0', 2016),
(1016, 'JORGE CHAVEZ BERTNELLI', NULL, NULL, 'MANUEL GONZALES PRADA S/N', '010701', '0583468', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583468&anexo=0', 2016),
(1017, 'ANTONIO RAYMONDI', NULL, NULL, 'CALLE MIGUEL GRAU', '010702', '0623371', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0623371&anexo=0', 2016),
(1018, 'RICARDO PALMA', NULL, NULL, 'JIRON SANTA ROSA S/N', '010705', '0532960', 1, 18, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0532960&anexo=0', 2016),
(1019, '86035 SAN CRISTOBAL', NULL, NULL, 'PARIA WILLCAHUAIN', '020102', '0577379', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577379&anexo=0', 2016),
(1020, '86128 CORONEL LEONCIO PRADO', NULL, NULL, 'YUPASH', '020111', '0906404', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0906404&anexo=0', 2016),
(1021, '86049 JOSE CARLOS MARIATEGUI', NULL, NULL, 'CARRETERA HUARAZ CARHUAZ KM 15', '020112', '0577361', 1, 104, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577361&anexo=0', 2016),
(1022, 'SANTA ISABEL', NULL, NULL, 'JIRON JOSE CARLOS MARIATEGUI S/N', '021605', '0577593', 1, 99, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577593&anexo=0', 2016),
(1023, 'MARIA AUXILIADORA', NULL, NULL, 'SAPCHA', '021802', '0577668', 1, 100, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577668&anexo=0', 2016),
(1024, '86214 GUILLERMO BRACALE RAMOS', NULL, NULL, 'CALLE SANCHEZ DULANTO 700', '020301', '1042985', 1, 101, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1042985&anexo=0', 2016),
(1025, '86291 SAN JUAN BAUTISTA', NULL, NULL, 'SHILLA', '020409', '0681486', 1, 102, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0681486&anexo=0', 2016),
(1026, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, 'SAN NICOLAS', '021703', '0577759', 1, 103, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577759&anexo=0', 2016),
(1027, 'AGROPECUARIO YAUTAN', NULL, NULL, 'AVENIDA HUARAZ S/N', '020505', '0359570', 1, 197, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359570&anexo=0', 2016),
(1028, '86350', NULL, NULL, 'MACHAC S/N', '020803', '0681494', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0681494&anexo=0', 2016),
(1029, 'CARLOS ALBERTO IZAGUIRRE', NULL, NULL, 'JIRON 17 DE ENERO 464', '020803', '0411819', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411819&anexo=0', 2016),
(1030, 'JUAN VELASCO ALVARADO', NULL, NULL, 'JIRON 28 DE JULIO S/N', '020805', '0577692', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577692&anexo=0', 2016),
(1031, 'PACHACUTEC', NULL, NULL, 'AVENIDA FRANCISCO BOLOGNESI S/N', '020813', '0411801', 1, 105, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0411801&anexo=0', 2016),
(1032, '86548 JOSE MARIA VELAZ', NULL, NULL, 'PICHIU', '020706', '1315084', 1, 106, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1315084&anexo=0', 2016),
(1033, 'ANDRES AVELINO CACERES', NULL, NULL, 'JIRON CENTENARIO S/N', '020906', '0566760', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0566760&anexo=0', 2016),
(1034, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'YURMA', '020906', '0575258', 1, 107, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575258&anexo=0', 2016),
(1035, 'CONCHUCOS', NULL, NULL, 'JIRON LA BANDA S/N', '021003', '0359463', 1, 108, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359463&anexo=0', 2016),
(1036, 'EUGENIO MORENO ALVAREZ', NULL, NULL, 'CONOPA', '021101', '1043082', 1, 109, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1043082&anexo=0', 2016),
(1037, '88031 REPUBLICA PERUANA', NULL, NULL, 'MZ P-O-Ã‘-L', '021301', '0544049', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544049&anexo=0', 2016),
(1038, '88050', NULL, NULL, 'JIRON ALFONSO UGARTE 251', '021302', '0502120', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0502120&anexo=0', 2016),
(1039, 'MARCOS EVARISTO VILLACRE', NULL, NULL, 'CALLE TERESA GONZALES DE FANNING S/N', '021305', '0461061', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0461061&anexo=0', 2016),
(1040, '88058', NULL, NULL, 'AVENIDA SAN FRANCISCO DE ASIS S/N', '021306', '1003771', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1003771&anexo=0', 2016),
(1041, '88049', NULL, NULL, 'CASCAJAL BAJO LA CUADRA', '021307', '0577163', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577163&anexo=0', 2016),
(1042, '88017 CESAR VALLEJO', NULL, NULL, 'MZ A LOTE 07', '021309', '0577122', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577122&anexo=0', 2016),
(1043, 'VILLA MARIA', NULL, NULL, 'JIRON INDEPENDENCIA MZ W', '021309', '0359380', 1, 111, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0359380&anexo=0', 2016),
(1044, '84165 ASTERIA CASTRO PAREJA', NULL, NULL, 'JIRON BOLOGNESI 265', '021401', '1324292', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1324292&anexo=0', 2016),
(1045, 'JOSE MARIA EGUREN', NULL, NULL, 'PASACANCHA S/N', '021408', '0632141', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0632141&anexo=0', 2016),
(1046, 'SAN PEDRO', NULL, NULL, 'JIRON BOLOGNESI S/N', '021404', '0575282', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575282&anexo=0', 2016),
(1047, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, 'SANTA CLARA', '021404', '0632265', 1, 112, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0632265&anexo=0', 2016),
(1048, '86616 MARTIR JOSE OLAYA', NULL, NULL, 'CARRETERA HUANUQUILLO PAMPA S/N', '021501', '0577528', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577528&anexo=0', 2016),
(1049, '86620 SANTA FE', NULL, NULL, 'TUMPA', '021501', '0577510', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577510&anexo=0', 2016),
(1050, '88381 IGNACIO AMADEO RAMOS OLIVERA', NULL, NULL, 'CARRETERA YUNGAY - LLANGANUCO', '021501', '1316777', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1316777&anexo=0', 2016),
(1051, 'SANTO DOMINGO DE GUZMAN', NULL, NULL, 'CARRETERA HUARAZ - CARAZ S/N', '021501', '0717975', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0717975&anexo=0', 2016),
(1052, '86645 RICARDO PALAMA', NULL, NULL, 'AVENIDA EL PROGRESO S/N', '021505', '0577296', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577296&anexo=0', 2016),
(1053, '86662 FRANCISCO BOLOGNESI', NULL, NULL, 'HUAMAS-YANAMA', '021508', '0793224', 1, 113, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0793224&anexo=0', 2016),
(1054, 'LA SALLE', NULL, NULL, 'AVENIDA HUASCAR S/N', '030101', '0724815', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0724815&anexo=0', 2016),
(1055, 'MANUEL JESUS SIERRA AGUILAR', NULL, NULL, 'JIRON DIAZ BARCENAS S/N', '030101', '1326115', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1326115&anexo=0', 2016),
(1056, 'MIGUEL GRAU', NULL, NULL, 'AVENIDA SEOANE', '030101', '0233064', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233064&anexo=0', 2016),
(1057, 'SAN FRANCISCO SOLANO', NULL, NULL, 'JIRON MAYTA CAPAC S/N', '030101', '1326008', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1326008&anexo=0', 2016),
(1058, 'SANTA ROSA', NULL, NULL, 'AVENIDA ELIAS 120', '030101', '0233288', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233288&anexo=0', 2016),
(1059, 'SAYWITE', NULL, NULL, 'SAYWITE', '030103', '0928994', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0928994&anexo=0', 2016),
(1060, 'GUILLERMO VILADEGUT FERRUFINO', NULL, NULL, 'LAMBRAMA', '030106', '0535815', 1, 53, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535815&anexo=0', 2016),
(1061, 'BELEN DE OSMA Y PARDO', NULL, NULL, 'AVENIDA PERU 710', '030301', '0236323', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236323&anexo=0', 2016),
(1062, 'JOSE ANTONIO ENCINAS', NULL, NULL, 'SACCLAYA', '030301', '1330489', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1330489&anexo=0', 2016),
(1063, 'DOS DE MAYO', NULL, NULL, 'JIRON PROGRESO S/N', '030305', '0236539', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236539&anexo=0', 2016),
(1064, 'JOSE MANUEL OCAMPO', NULL, NULL, 'CALLE MOLINO PAMPA S/N', '030308', '0508119', 1, 54, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0508119&anexo=0', 2016),
(1065, 'BENJAMIN HERENCIA Z.', NULL, NULL, 'CARRETERA TINTAY', '030213', '0236604', 1, 56, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236604&anexo=0', 2016),
(1066, '501208 APLICACION', NULL, NULL, 'TAMBOBAMBA S/N', '030501', '1342963', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1342963&anexo=0', 2016),
(1067, 'ERASMO DELGADO VIVANCO', NULL, NULL, 'PARQUE PLAZA DE ARMAS S/N', '030501', '0236455', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236455&anexo=0', 2016),
(1068, 'ANTONIO RAYMONDI - INA 103', NULL, NULL, 'AVENIDA COYLLURQUI S/N', '030502', '0207399', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0207399&anexo=0', 2016),
(1069, 'CEMA Ã‘AHUINLLA', NULL, NULL, 'Ã‘AHUINLLA', '030502', '0929794', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929794&anexo=0', 2016),
(1070, '50634 JOSE MARIA ARGUEDAS', NULL, NULL, 'ESTADIUM LUNA', '030504', '1396357', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1396357&anexo=0', 2016),
(1071, 'CEMA PATAN', NULL, NULL, 'PATAN', '030504', '0929851', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929851&anexo=0', 2016),
(1072, 'CESAR VALLEJO', NULL, NULL, 'CALLE HUISTAC S/N', '030504', '0579334', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579334&anexo=0', 2016),
(1073, 'CEMA MARA', NULL, NULL, 'RICARDO PALMA', '030505', '0579326', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579326&anexo=0', 2016),
(1074, 'MARIO VARGAS LLOSA', NULL, NULL, 'PISACCASA', '030505', '0929885', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929885&anexo=0', 2016),
(1075, 'CEMA TAMBULLA', NULL, NULL, 'TAMBULLA', '030506', '0929919', 1, 198, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0929919&anexo=0', 2016),
(1076, 'TUPAC AMARU', NULL, NULL, 'AVENIDA EL ESTUDIANTE', '030701', '1090307', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1090307&anexo=0', 2016),
(1077, 'ANDRES AVELLINO CACERES', NULL, NULL, 'HUARAPARI', '030706', '1141225', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1141225&anexo=0', 2016),
(1078, 'CESAR VALLEJO', NULL, NULL, 'JIRON LOS PINOS S/N', '030706', '1205871', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1205871&anexo=0', 2016),
(1079, 'JOSE MARIA FLORES', NULL, NULL, 'JIRON JOSE CARLOS MARIATEGUI S/N', '030706', '1090380', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1090380&anexo=0', 2016),
(1080, 'JUAN VELASCO ALVARADO', NULL, NULL, 'HUANCALLO BAJO', '030703', '1206275', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1206275&anexo=0', 2016),
(1081, 'LOS LIBERTADORES', NULL, NULL, 'JIRON LOS LIBERTADORES S/N', '030708', '1206077', 1, 57, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1206077&anexo=0', 2016),
(1082, 'JOSE MARIA ARGUEDAS', NULL, NULL, 'CALLE SANTA ELENA S/N', '030601', '0236612', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236612&anexo=0', 2016),
(1083, 'CCONCCACCA', NULL, NULL, 'HACIENDA RECORD', '030607', '1329671', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1329671&anexo=0', 2016),
(1084, 'FRAY DIEGO ORTIZ', NULL, NULL, 'PROGRESO', '030607', '0535914', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535914&anexo=0', 2016),
(1085, 'JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, 'JIRON JAHUAPAMPA S/N', '030611', '0536011', 1, 58, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0536011&anexo=0', 2016),
(1086, '40165 SAN JUAN BAUTISTA DE LA SALLE', NULL, NULL, 'CALLE JOSE MARIA ARGUEDAS S/N', '040101', '0518241', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0518241&anexo=0', 2016),
(1087, 'JUANA CERVANTES DE BOLOGNESI', NULL, NULL, 'VALLECITO', '040101', '0309302', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309302&anexo=0', 2016),
(1088, 'NUESTRA SRA.DE GUADALUPE (CIRCA)', NULL, NULL, 'CALLE MEXICO 101', '040128', '1253863', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1253863&anexo=0', 2016),
(1089, 'SAN MARTIN DE PORRES (CIRCA)', NULL, NULL, 'AVENIDA ATLANTIDA 401', '040128', '0895482', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0895482&anexo=0', 2016),
(1090, 'EL PIONERO G-2', NULL, NULL, 'MZ G SECTOR 2', '040102', '0899096', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899096&anexo=0', 2016),
(1091, 'JOSE CARUANA', NULL, NULL, 'UPIS RAFAEL BELAUNDE N-13', '040102', '1308204', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1308204&anexo=0', 2016),
(1092, 'JOSE LUIS BUSTAMANTE Y RIVERO', NULL, NULL, 'CARRETERA AREQUIPA - YURA KM. 10 SECTOR III', '040103', '1371095', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1371095&anexo=0', 2016),
(1093, 'CARLOS W. SUTTON', NULL, NULL, 'JIRON 2 DE MAYO S/N', '040106', '0309542', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309542&anexo=0', 2016),
(1094, 'RAFAEL LOAYZA GUEVARA', NULL, NULL, 'AVENIDA JESUS CUADRA 5 S/N', '040126', '0636019', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0636019&anexo=0', 2016),
(1095, '40009 SAN MARTIN DE PORRES', NULL, NULL, 'AVENIDA SAN MARTIN DE PORRES 206', '040109', '0579631', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579631&anexo=0', 2016),
(1096, '40010 JULIO C.TELLO', NULL, NULL, 'AVENIDA REVOLUCION 1100', '040109', '0579599', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579599&anexo=0', 2016),
(1097, '40163 BENIGNO BALLON FARFAN', NULL, NULL, 'AVENIDA BRASIL 300', '040109', '0579698', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579698&anexo=0', 2016),
(1098, '40315 JOSE MARIA ARGUEDAS', NULL, NULL, 'AVENIDA REVOLUCION S/N', '040109', '0617191', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617191&anexo=0', 2016),
(1099, 'JUAN XXIII (CIRCA)', NULL, NULL, 'AVENIDA AREQUIPA 7MA CUADRA S/N', '040109', '0617217', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617217&anexo=0', 2016),
(1100, 'SANTA ROSA DE LIMA', NULL, NULL, 'CALLE CESAR VALLEJO 104', '040109', '0695262', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695262&anexo=0', 2016),
(1101, 'NUESTRA SEÃ‘ORA DE LA ASUNCIÃ“N', NULL, NULL, '', '060101', '0452698', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452698&anexo=0', 2016),
(1102, '40083 FRANKLIN ROOSEVELT', NULL, NULL, 'CALLE PROGRESO S/N', '040120', '0899187', 1, 77, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0899187&anexo=0', 2016),
(1103, '40038 JORGE BASADRE GROHMANN', NULL, NULL, 'CALLE SANGARARA 100', '040129', '0492769', 1, 78, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0492769&anexo=0', 2016),
(1104, 'NICOLAS DE PIEROLA', NULL, NULL, 'CALLE GRAL. ORBEGOSO S/N', '040402', '0309591', 1, 80, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309591&anexo=0', 2016),
(1105, 'LIBERTADOR CASTILLA', NULL, NULL, 'AVENIDA 21 DE MARZO 109', '040501', '0309245', 1, 81, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309245&anexo=0', 2016),
(1106, 'MIXTO CORIRE', NULL, NULL, 'AVENIDA JOSE CARLOS MARIATEGUI S/N', '040512', '0310425', 1, 81, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0310425&anexo=0', 2016),
(1107, '40629 DIVINO NIÃ‘O JESUS', NULL, NULL, 'ASENTAMIENTO MZ C LOTE 2', '040220', '1333210', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1333210&anexo=0', 2016),
(1108, '40661 ISABEL KRIEGER BEATO', NULL, NULL, 'ASENTAMIENTO', '040220', '1271691', 1, 85, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1271691&anexo=0', 2016),
(1109, 'SAN VICENTE DE PAUL', NULL, NULL, 'CALLE COMERCIO 1014', '040701', '0309328', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309328&anexo=0', 2016),
(1110, 'MARIANO E.RIVERO Y USTARIZ', NULL, NULL, 'AVENIDA PROGRESO 1200', '040702', '0309476', 1, 84, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309476&anexo=0', 2016),
(1111, 'MARISCAL ORBEGOSO', NULL, NULL, 'CALLE MERCADO', '040801', '0309294', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309294&anexo=0', 2016),
(1112, '40531 HONOFRE BENAVIDES', NULL, NULL, 'PLAZA DE ARMAS', '040810', '0612507', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0612507&anexo=0', 2016),
(1113, 'REPUBLICA BOLIVARIANA DE VENEZUELA', NULL, NULL, 'JIRON 29 DE MARZO S/N', '050101', '1346204', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1346204&anexo=0', 2016),
(1114, 'LOS ANGELES DE LA PAZ', NULL, NULL, 'YANAMA', '050103', '1443928', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1443928&anexo=0', 2016),
(1115, 'GUSTAVO ESCUDERO OTERO', NULL, NULL, 'PARQUE PLAZA PRINCIPAL S/N', '050110', '0670901', 1, 175, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670901&anexo=0', 2016),
(1116, 'MARIA PARADO DE BELLIDO', NULL, NULL, 'AVENIDA VICTOR FAJARDO S/N', '050201', '0424531', 1, 174, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0424531&anexo=0', 2016),
(1117, 'FELIPE SANTIAGO SALAVERRY', NULL, NULL, 'NINABAMBA', '050401', '0670984', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0670984&anexo=0', 2016),
(1118, 'LUIS ALBERTO SANCHEZ SANCHEZ', NULL, NULL, 'PLAZA PRINCIPAL', '050401', '1348804', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1348804&anexo=0', 2016),
(1119, 'ANDRES AVELINO CACERES', NULL, NULL, 'PARQUE PLAZA PRINCIPAL - ISOQASA', '050402', '1348796', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1348796&anexo=0', 2016),
(1120, 'CESAR VALLEJO', NULL, NULL, 'PLAZA PRINCIPAL', '050402', '0629618', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0629618&anexo=0', 2016),
(1121, 'FERNANDO BELAUNDE TERRY', NULL, NULL, 'AVENIDA PRINCIPAL S/N.', '050403', '1348861', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1348861&anexo=0', 2016),
(1122, 'JOSE GALVEZ', NULL, NULL, 'SANTA ROSA', '050408', '0592675', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0592675&anexo=0', 2016),
(1123, 'SAN JOSE', NULL, NULL, 'MARISCAL CACERES', '050409', '0671040', 1, 177, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0671040&anexo=0', 2016),
(1124, 'NESTOR BERROCAL FALCONI', NULL, NULL, 'JIRON PROGRESO S/N Y JR. CONTISUYO S/N', '050605', '0537167', 1, 179, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537167&anexo=0', 2016),
(1125, 'FELIPE GUAMAN POMA DE AYALA', NULL, NULL, 'AVENIDA MARISCAL CACERES 638', '051101', '0210799', 1, 199, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0210799&anexo=0', 2016),
(1126, 'JOSE MARIA ARGUEDAS', NULL, NULL, 'AVENIDA HATUN SORAS S/N', '051108', '0210781', 1, 199, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0210781&anexo=0', 2016),
(1127, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'JIRON JOSE CARLOS MARIATEGUI S/N', '050708', '0472027', 1, 181, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0472027&anexo=0', 2016),
(1128, 'DIVINO MAESTRO', NULL, NULL, 'AGOCUCHO', '060101', '0581306', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581306&anexo=0', 2016),
(1129, 'DOS DE MAYO', NULL, NULL, 'AVENIDA LA PAZ 123', '060101', '0390690', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390690&anexo=0', 2016),
(1130, 'SAN RAMON', NULL, NULL, 'JIRON 13 DE JULIO 275', '060101', '0390591', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390591&anexo=0', 2015),
(1131, 'MANUEL GONZALES PRADA', NULL, NULL, 'JIRON LIMA 520', '060102', '0390914', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390914&anexo=0', 2016),
(1132, 'CRISTO REDENTOR', NULL, NULL, 'YANACANCHA BAJA', '060105', '0695692', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0695692&anexo=0', 2016),
(1133, 'SANTA ROSA', NULL, NULL, 'JIRON JUAN VELASCO ALVARADO S/N', '060111', '0522896', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522896&anexo=0', 2016),
(1134, 'SAN JUAN BAUTISTA', NULL, NULL, 'SAN JUAN', '060112', '0523092', 1, 129, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523092&anexo=0', 2016),
(1135, 'JOSE A.SABOGAL DIEGUEZ', NULL, NULL, 'PARUBAMBA S/N', '060201', '0544007', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0544007&anexo=0', 2016),
(1136, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'JIRON RICARDO PALMA S/N', '060203', '0581298', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581298&anexo=0', 2016),
(1137, 'MARISCAL RAMON CASTILLA', NULL, NULL, 'MALCAS S/N', '060203', '0727768', 1, 128, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0727768&anexo=0', 2016),
(1138, 'HIPOLITO UNANUE', NULL, NULL, 'CHIMUCH S/N', '060302', '0576058', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576058&anexo=0', 2016),
(1139, 'JOSE GALVEZ', NULL, NULL, 'JIRON MARAÃ‘ON 640', '060306', '0390815', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390815&anexo=0', 2016),
(1140, 'OXAMARCA', NULL, NULL, 'OXAMARCA', '060308', '0771972', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0771972&anexo=0', 2016),
(1141, 'DAVID SANCHEZ INFANTE', NULL, NULL, 'JIRON 2 DE MAYO S/N', '060309', '0390823', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390823&anexo=0', 2016),
(1142, 'SAN JOSE', NULL, NULL, 'JIRON CLODOMIRO CHAVEZ S/N', '060310', '0390807', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390807&anexo=0', 2016),
(1143, 'SAN JUAN BAUTISTA', NULL, NULL, 'JIRON CELENDIN S/N', '060312', '0581348', 1, 130, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581348&anexo=0', 2016),
(1144, 'JORGE CHAVEZ DARTNELL', NULL, NULL, 'JIRON MANUEL JESUS CORONADO S/N', '060601', '1110675', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1110675&anexo=0', 2016),
(1145, 'SAGRADO CORAZON DE JESUS', NULL, NULL, 'JIRON SAGRADO CORAZON DE JESUS 231', '060601', '0452680', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452680&anexo=0', 2016),
(1146, 'SANTA RAFAELA MARIA ANEXO AL ISP', NULL, NULL, 'CALLE SAN MARTIN 176', '060601', '1366004', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1366004&anexo=0', 2016),
(1147, 'SEÃ‘OR DE LOS MILAGROS', NULL, NULL, 'NEGROPAMPA', '060601', '0697888', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697888&anexo=0', 2016),
(1148, 'FRANCISCO VILLEGAS COTRINA', NULL, NULL, 'CHUGUR', '060602', '1110550', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1110550&anexo=0', 2016),
(1149, 'SAN FRANCISCO', NULL, NULL, 'CHOROPAMPA', '060618', '0582858', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582858&anexo=0', 2016),
(1150, 'ANAXIMANDRO VEGA MATEOLA', NULL, NULL, 'JIRON LIMA S/N', '060603', '0452979', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452979&anexo=0', 2016),
(1151, 'ANIBAL DIAZ BAZAN', NULL, NULL, 'CHETILLA', '060604', '1110352', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1110352&anexo=0', 2016),
(1152, 'SAN LORENZO', NULL, NULL, 'JIRON SIMON BOLIVAR 567', '060610', '0453068', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453068&anexo=0', 2016),
(1153, 'ANTENOR ORREGO', NULL, NULL, 'CALLE JORGE BERRIOS S/N', '060614', '0640862', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0640862&anexo=0', 2016),
(1154, 'TUPAC AMARU', NULL, NULL, 'CALLE PAISES ESCANDINAVOS S/N', '060614', '0452987', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452987&anexo=0', 2016),
(1155, 'FELIPE H.TIRAVANTI', NULL, NULL, 'CARRETERA EL VERDE S/N', '060619', '0611046', 1, 133, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0611046&anexo=0', 2016),
(1156, 'SAN ISIDRO', NULL, NULL, 'JIRON JUNIN 315', '060408', '0390658', 1, 134, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390658&anexo=0', 2016),
(1157, 'CRISTO REY', NULL, NULL, 'CALLE MARIA ELENA MEDINA S/N', '060501', '1051564', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1051564&anexo=0', 2016),
(1158, 'TORIBIO CASANOVA', NULL, NULL, 'JIRON ICA S/N', '060501', '0452607', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452607&anexo=0', 2016),
(1159, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'PASAJE MARAVILLA S/N', '060508', '0492959', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0492959&anexo=0', 2016),
(1160, 'FRAY MARTIN', NULL, NULL, 'SANTA CRUZ DE LA SUCCHA', '060509', '0917013', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0917013&anexo=0', 2016),
(1161, 'SAN LORENZO', NULL, NULL, 'CALLE CARLOS FISHER S/N', '060514', '0452706', 1, 135, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452706&anexo=0', 2016),
(1162, 'DIVINO CORAZON DE JESUS', NULL, NULL, 'EL CUMBE S/N', '060701', '1368836', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1368836&anexo=0', 2016),
(1163, 'NUESTRA SEÃ‘ORA DE LOURDES', NULL, NULL, 'JIRON SIMON BOLIVAR 350', '060701', '0390864', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390864&anexo=0', 2016),
(1164, 'SAN MARCOS', NULL, NULL, 'LUCMACUCHO S/N', '060701', '1368679', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1368679&anexo=0', 2016),
(1165, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, 'CALLE SAN ANTONIO S/N', '060701', '0611780', 1, 137, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0611780&anexo=0', 2016),
(1166, 'JAEN DE BRACAMOROS', NULL, NULL, 'CALLE RAYMONDI 551', '060801', '0262931', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262931&anexo=0', 2016),
(1167, '16119 JOSE OLAYA', NULL, NULL, 'AVENIDA JOSE OLAYA S/N', '060804', '0641688', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0641688&anexo=0', 2016),
(1168, 'SAN MARTIN DE TOURS', NULL, NULL, 'CALLE VIDES 107', '060805', '0491969', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0491969&anexo=0', 2016),
(1169, 'PAKAMUROS-16188', NULL, NULL, 'CALLE EL SABER S/N', '060810', '0680678', 1, 138, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0680678&anexo=0', 2016),
(1170, 'TITO CUSY YUPANQUI', NULL, NULL, 'AVENIDA SAN IGNACIO 250', '061101', '0262964', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0262964&anexo=0', 2016),
(1171, '16488', NULL, NULL, 'CALLE CAJAMARCA S/N', '061102', '1106368', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1106368&anexo=0', 2016),
(1172, '16634', NULL, NULL, 'CORDILLERA ANDINA', '061102', '1377886', 1, 142, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1377886&anexo=0', 2016),
(1173, '24 DE JUNIO', NULL, NULL, 'JIRON EL MAESTRO 112', '061201', '1107812', 1, 143, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1107812&anexo=0', 2016),
(1174, 'LA GRAMA', NULL, NULL, 'LA GRAMA', '061205', '0581397', 1, 143, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581397&anexo=0', 2016),
(1175, 'SAN JOSE', NULL, NULL, 'JIRON ULLILLIN S/N', '061203', '0581322', 1, 143, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581322&anexo=0', 2016),
(1176, 'AMALIA PUGA DE LOZADA', NULL, NULL, 'JIRON GONZALES PRADA S/N', '061202', '0390773', 1, 143, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390773&anexo=0', 2016),
(1177, 'SAN MIGUEL', NULL, NULL, 'CALLE NICOLAS SARABIA 264', '061001', '0390724', 1, 144, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0390724&anexo=0', 2016),
(1178, 'CHANCAY BAÃ‘OS', NULL, NULL, 'AVENIDA LOS MAESTROS S/N', '060903', '0556001', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0556001&anexo=0', 2016),
(1179, 'VENCEDORES 2 DE MAYO', NULL, NULL, 'AVENIDA PULAN', '060906', '0759167', 1, 145, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0759167&anexo=0', 2016),
(1180, 'AGUSTIN DE HIPONA', NULL, NULL, 'AVENIDA RAMIRO PRIALE - ANTENOR ORREGO', '141101', '1085810', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1085810&anexo=0', 2016),
(1181, 'HEROINAS TOLEDO', NULL, NULL, 'AVENIDA MIGUEL GRAU 1176', '141101', '0209387', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0209387&anexo=0', 2016),
(1182, 'REPUBLICA DE VENEZUELA', NULL, NULL, 'AVENIDA ARGENTINA 1030', '141101', '0522318', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522318&anexo=0', 2016),
(1183, 'SAN MIGUEL', NULL, NULL, 'CALLE TIWINZA S/N', '141101', '1342609', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1342609&anexo=0', 2016),
(1184, '5022 FRANCISCO IZQUIERDO RIOS', NULL, NULL, 'JIRON NICOLAS DE PIEROLA 110', '141102', '0582833', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582833&anexo=0', 2016),
(1185, '4005 ALMTE. MIGUEL GRAU SEMINARIO', NULL, NULL, 'AVENIDA LA PAZ 1000', '141105', '0582981', 1, 69, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582981&anexo=0', 2016),
(1186, '3720 NUESTRA SEÃ‘ORA DE LA MISERICORDIA', NULL, NULL, 'CARRETERA PANAMERICANA NORTE', '141106', '0599365', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0599365&anexo=0', 2016),
(1187, '5130-3 VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, 'AVENIDA 11 DE AGOSTO S/N', '141106', '1381334', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1381334&anexo=0', 2016),
(1188, '5142 VIRGEN DE GUADALUPE', NULL, NULL, 'MZ C LOTE 01', '141106', '1364975', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1364975&anexo=0', 2016),
(1189, 'ESCUELA HOGAR COMUNITARIA REGIONAL SAGRADA FAMILIA', NULL, NULL, 'AVENIDA PACHACUTEC Y JR. LOS FAISANES MZ U1 LOTE 9', '141106', '1438035', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1438035&anexo=0', 2016),
(1190, 'FE Y ALEGRIA 59', NULL, NULL, 'CALLE NICARAGUA S/N MZ G1 LOTE 1A', '141106', '1335637', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1335637&anexo=0', 2016),
(1191, 'SAN MARTIN DE PACHACUTEC', NULL, NULL, 'MZ Q2 LOTE 1 SECTOR B', '141106', '1608074', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1608074&anexo=0', 2016),
(1192, 'SANTA MARIA ASUNTA AL CIELO', NULL, NULL, 'MZ C LOTE 1 SECTOR F PROY. ESP. CIUD.PACHACUT', '141106', '1520287', 1, 70, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1520287&anexo=0', 2016),
(1193, 'SANTA ROSA', NULL, NULL, 'CALLE SAN ANDRES 414', '070101', '0236232', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236232&anexo=0', 2016),
(1194, 'FE Y ALEGRIA 20', NULL, NULL, 'CALLE ROCOPATA 451', '070106', '0236778', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236778&anexo=0', 2016),
(1195, 'SIMON BOLIVAR', NULL, NULL, 'AVENIDA DE LOS REYES S/N', '070204', '0481119', 1, 24, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0481119&anexo=0', 2016),
(1196, 'LIBERTADORES DE AMERICA', NULL, NULL, 'PARQUE PLAZA DE ARMAS S/N', '070206', '0579342', 1, 24, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579342&anexo=0', 2016),
(1197, '50100 LA NAVAL', NULL, NULL, 'AVENIDA LOS ANDES S/N', '070301', '1321322', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1321322&anexo=0', 2016),
(1198, 'AGUSTIN GAMARRA', NULL, NULL, 'ANTA S/N', '070301', '0236422', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236422&anexo=0', 2016),
(1199, 'SAGRADO CORAZON DE JESUS', NULL, NULL, 'PLAZA DE ARMAS S/N', '070301', '0931329', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0931329&anexo=0', 2016),
(1200, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'JIRON 12 DE OCTUBRE 095', '070308', '0579250', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579250&anexo=0', 2016),
(1201, 'JULIO CESAR BENAVENTE DIAZ', NULL, NULL, 'JIRON SALLAC S/N', '070303', '0489120', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489120&anexo=0', 2016),
(1202, 'LIMATAMBO', NULL, NULL, 'CALLE RIMAC PAMPA S/N', '070304', '0489146', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489146&anexo=0', 2016),
(1203, 'MARISCAL RAMON CASTILLA', NULL, NULL, 'PLAZA DE ARMAS S/N', '070306', '0579276', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579276&anexo=0', 2016),
(1204, '118', NULL, NULL, 'ZURITE', '070307', '0207407', 1, 25, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0207407&anexo=0', 2016),
(1205, 'HUMBERTO LUNA', NULL, NULL, 'CALLE ESPINAR 401', '070401', '0233114', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0233114&anexo=0', 2016),
(1206, 'CESAR VALLEJO', NULL, NULL, 'LARES S/N', '070404', '0616177', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0616177&anexo=0', 2016),
(1207, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, 'QUEBRADA', '070408', '0495408', 1, 26, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495408&anexo=0', 2016),
(1208, 'VICTOR PORCEL ESQUIVEL', NULL, NULL, 'CALLE MARISCAL GAMARRA S/N', '070503', '1374438', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1374438&anexo=0', 2016),
(1209, 'FERNANDO TUPAC AMARU', NULL, NULL, 'AVENIDA TUPAC AMARU S/N', '070508', '0579391', 1, 27, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579391&anexo=0', 2016),
(1210, 'JERONIMO ZAVALA', NULL, NULL, 'CALLE VELAZCO ASTETE S/N', '070602', '0236638', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236638&anexo=0', 2016),
(1211, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, 'CCOBAMBA', '070604', '0579466', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579466&anexo=0', 2016),
(1212, 'EMANCIPACION AMERICANA', NULL, NULL, 'JUNTUMA S/N', '070608', '0499368', 1, 28, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0499368&anexo=0', 2016),
(1213, 'ANTERO EFRAIN UGARTE VIZCARRA', NULL, NULL, 'PULPERA', '070701', '0934141', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0934141&anexo=0', 2016),
(1214, 'JUAN DE DIOS VALENCIA', NULL, NULL, 'CALLE PLAZA DE ARMAS S/N', '070708', '0518084', 1, 29, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0518084&anexo=0', 2016),
(1215, '56207 RICARDO PALMA SORIANO', NULL, NULL, 'CALLE LEONCIO PRADO S/N', '070801', '0931469', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0931469&anexo=0', 2016),
(1216, '56435', NULL, NULL, 'CALLE MIRAFLORES S/N', '070801', '1579325', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1579325&anexo=0', 2016),
(1217, 'BARTOLOME DE LAS CASAS', NULL, NULL, 'HUAYHUAHUASI', '070803', '0617787', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617787&anexo=0', 2016),
(1218, 'PICHIGUA', NULL, NULL, 'CALLE MELGAR S/N', '070806', '0579441', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579441&anexo=0', 2016),
(1219, 'GRAL JUAN VELASCO ALVARADO', NULL, NULL, 'JIRON CUSCO S/N', '070808', '0617837', 1, 31, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0617837&anexo=0', 2016),
(1220, '51027 JUAN DE LA CRUZ MONTES SALAS', NULL, NULL, 'JIRON INDEPENDENCIA S/N', '070901', '1394121', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1394121&anexo=0', 2016),
(1221, 'JAVIER PEREZ DE CUELLAR', NULL, NULL, 'KEPASHIATO S/N', '070902', '0932822', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932822&anexo=0', 2016),
(1222, 'JOSE MARIA ARGUEDAS', NULL, NULL, 'AVENIDA JOSE MARIA ARGUEDAS S/N', '070902', '0236398', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236398&anexo=0', 2016),
(1223, 'JOSE PIO AZA', NULL, NULL, 'KORIBENI', '070902', '0713826', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0713826&anexo=0', 2016);
INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(1224, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'AVENIDA JOSE CARLOS MARIATEGUI S/N', '070903', '0236380', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236380&anexo=0', 2016),
(1225, 'MICAELA BASTIDAS', NULL, NULL, 'AVENIDA REVOLUCION S/N', '070904', '0236372', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236372&anexo=0', 2016),
(1226, 'SEÃ‘OR DE LOS MILAGROS', NULL, NULL, 'SANTA MARIA - MARANURA S/N', '070904', '0489153', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0489153&anexo=0', 2016),
(1227, 'INKA PACHAKUTEQ', NULL, NULL, 'PIRHUA', '070905', '0621698', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621698&anexo=0', 2016),
(1228, '38704', NULL, NULL, 'TAHUANTINSUYO LOBO S/N', '070909', '1062553', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1062553&anexo=0', 2016),
(1229, '501349 PROGRESO', NULL, NULL, 'PROGRESO S/N', '070909', '1347111', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1347111&anexo=0', 2016),
(1230, 'DIVINO MAESTRO', NULL, NULL, 'KIMBIRI S/N', '070909', '0933077', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0933077&anexo=0', 2016),
(1231, 'JOSE BERNARDO ALCEDO', NULL, NULL, 'SAN JUAN UNDARA S/N', '070907', '0621458', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621458&anexo=0', 2016),
(1232, 'MANCO INCA', NULL, NULL, 'PUCYURA S/N', '070907', '0481101', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0481101&anexo=0', 2016),
(1233, 'MIGUEL GRAU', NULL, NULL, 'VILCABAMBA S/N', '070907', '0621482', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0621482&anexo=0', 2016),
(1234, 'SAN MARTIN', NULL, NULL, 'URBANIZACIÃ“N SAN MARTIN', '070907', '0495291', 1, 32, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0495291&anexo=0', 2016),
(1235, '38990-A MARAVILLA', NULL, NULL, 'AVENIDA PROGRESO 138', '070910', '1387141', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1387141&anexo=0', 2016),
(1236, 'CESAR VALLEJO', NULL, NULL, 'CCATUN RUMI S/N', '070910', '0932988', 1, 30, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0932988&anexo=0', 2016),
(1237, '50803', NULL, NULL, 'SAHUA SAHUA', '071006', '1396191', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1396191&anexo=0', 2016),
(1238, 'OSCCOLLOPATA', NULL, NULL, 'CARRETERA OSCCOLLOPATA S/N', '071006', '1396225', 1, 33, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1396225&anexo=0', 2016),
(1239, 'SATURNINO HUILCA Q.', NULL, NULL, 'CALLE HUANCARANI S/N', '071106', '0591255', 1, 34, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591255&anexo=0', 2016),
(1240, '50430', NULL, NULL, 'AVENIDA CORONEL FERNANDEZ S/N', '071105', '0497537', 1, 34, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0497537&anexo=0', 2016),
(1241, 'SEÃ‘OR DE TAYANCANI', NULL, NULL, 'PLAZA DE ARMAS S/N', '071204', '1397652', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1397652&anexo=0', 2016),
(1242, 'HUARAHUARA', NULL, NULL, 'HUARAHUARA S/N', '071205', '1397926', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1397926&anexo=0', 2016),
(1243, 'TUPAC AMARU II', NULL, NULL, 'CALLE ALIPIO YABAR S/N', '071206', '0497586', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0497586&anexo=0', 2016),
(1244, 'NARCISO ARESTEGUI', NULL, NULL, 'CALLE SAN MARTIN S/N', '071207', '0591107', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591107&anexo=0', 2016),
(1245, 'JUAN PABLO II', NULL, NULL, 'CARRETERA PINCHIMURO S/N', '071210', '1343854', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1343854&anexo=0', 2016),
(1246, 'MAJESTUOSO AUSANGATE', NULL, NULL, 'LLULLUCHA S/N', '071210', '1397728', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1397728&anexo=0', 2016),
(1247, 'ANILMAYO', NULL, NULL, 'ANILMAYO S/N', '071212', '1397876', 1, 35, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1397876&anexo=0', 2016),
(1248, 'AGROPECUARIO', NULL, NULL, 'CHARCAHUAYLLA', '071301', '0236927', 1, 200, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236927&anexo=0', 2016),
(1249, 'GENERAL OLLANTA', NULL, NULL, 'AVENIDA SR TORRECHAYOC 620', '071301', '0236158', 1, 200, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236158&anexo=0', 2016),
(1250, 'INKA TUPAQ YUPANQUI', NULL, NULL, 'AVENIDA MATEO PUMACAHUA S/N. CHCINCHERO', '071302', '0236489', 1, 200, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0236489&anexo=0', 2016),
(1251, 'NUESTRA SEÃ‘ORA DE NATIVIDAD', NULL, NULL, 'LA PLAYA', '071303', '0503557', 1, 200, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0503557&anexo=0', 2016),
(1252, 'SANTO DOMINGO SAVIO', NULL, NULL, 'PARQUE CRUZPATA', '071305', '0791574', 1, 200, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0791574&anexo=0', 2016),
(1253, 'ISOLINA CLOTET DE FERNANDINI', NULL, NULL, 'AVENIDA AUGUSTO B LEGUIA 335', '080101', '1058353', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1058353&anexo=0', 2016),
(1254, '7 DE JUNIO', NULL, NULL, 'VISTA ALEGRE S/N', '080103', '0687855', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0687855&anexo=0', 2016),
(1255, 'JOSE GALVEZ EGUSQUIZA', NULL, NULL, 'BAYLON', '080103', '0421289', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421289&anexo=0', 2016),
(1256, 'LEONCIO PRADO GUTIERREZ', NULL, NULL, 'JIRON ANDRES AVELINO CACERES S/N', '080103', '0537803', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537803&anexo=0', 2016),
(1257, 'DANIEL ALCIDES CARRION', NULL, NULL, 'QUINTA VILLENA S/N', '080112', '0535013', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535013&anexo=0', 2016),
(1258, 'SAN MIGUEL', NULL, NULL, 'UMAS S/N', '080113', '0421339', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0421339&anexo=0', 2016),
(1259, 'ANDRES BELLO', NULL, NULL, 'PERU S/N', '080118', '1106145', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1106145&anexo=0', 2016),
(1260, 'CCOLLPACCASA', NULL, NULL, 'PLAZA PRINCIPAL', '080118', '1400092', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1400092&anexo=0', 2016),
(1261, 'JAVIER HERAUD PEREZ', NULL, NULL, 'PLAZA PRINCIPAL S/N', '080118', '1059906', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059906&anexo=0', 2016),
(1262, 'MARIANO MELGAR VALDIVIESO', NULL, NULL, 'PLAZA PRINCIPAL S/N', '080118', '1058122', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1058122&anexo=0', 2016),
(1263, 'LA UNION', NULL, NULL, 'CARRETERA LLALLAS ALTA S/N', '080120', '1106467', 1, 74, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1106467&anexo=0', 2016),
(1264, 'NUESTRA SEÃ‘ORA DE LA CANDELARIA', NULL, NULL, 'AVENIDA MANUEL CANDAMO S/N', '080201', '0600692', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0600692&anexo=0', 2016),
(1265, 'JOSE ANTONIO ENCINAS FRANCO', NULL, NULL, 'MAYUNMARCA S/N', '080203', '1106707', 1, 71, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1106707&anexo=0', 2016),
(1266, 'JUAN VELASCO ALVARADO', NULL, NULL, 'PARCO ALTO', '080302', '1104892', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1104892&anexo=0', 2016),
(1267, 'SEÃ‘OR DE HUAYLLAY', NULL, NULL, 'PLAZA PRINCIPAL', '080306', '0740472', 1, 72, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0740472&anexo=0', 2016),
(1268, 'LOS LIBERTADORES', NULL, NULL, 'CALLE SAN JOSE S/N', '080428', '0275669', 1, 201, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275669&anexo=0', 2016),
(1269, 'SEÃ‘OR DE ATOCCASA', NULL, NULL, 'JIRON SANTOS CHOCANO S/N', '080701', '1369214', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1369214&anexo=0', 2016),
(1270, 'AMAUTA', NULL, NULL, 'MANZANAYOCC S/N', '080702', '1059880', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059880&anexo=0', 2016),
(1271, 'LA ESMERALDA', NULL, NULL, 'AVENIDA AYACUCHO S/N', '080702', '0802272', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0802272&anexo=0', 2016),
(1272, 'INGENIO', NULL, NULL, 'PANAC S/N', '080703', '0569251', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0569251&anexo=0', 2016),
(1273, 'JOSE SANTOS CHOCANO', NULL, NULL, 'JIRON JESUS SEDANO BALDEON S/N', '080704', '0802298', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0802298&anexo=0', 2016),
(1274, 'RAUL JIMENEZ CHAVEZ', NULL, NULL, 'CARRETERA COBRIZA-HUANCAYO KM 40', '080707', '1244664', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1244664&anexo=0', 2016),
(1275, 'RICARDO PALMA', NULL, NULL, 'CAMINO AL CEMENTERIO S/N', '080707', '0770719', 1, 73, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0770719&anexo=0', 2016),
(1276, 'SAN JUAN BAUTISTA', NULL, NULL, 'AVENIDA EL SOL 230', '080604', '0275636', 1, 202, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275636&anexo=0', 2016),
(1277, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'AVENIDA LOS LIBERTADORES S/N', '080607', '0511071', 1, 202, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0511071&anexo=0', 2016),
(1278, 'MANUEL GONZALES PRADA', NULL, NULL, 'PARQUE PLAZA PRINCIPAL S/N', '080610', '1105931', 1, 202, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1105931&anexo=0', 2016),
(1279, 'ALFONSO UGARTE Y VERNAL', NULL, NULL, 'JIRON SAN CRISTOBAL S/N', '080501', '1416437', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1416437&anexo=0', 2016),
(1280, 'SAN JOSE', NULL, NULL, 'JIRON MARISCAL CASTILLA S/N', '080515', '1059658', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1059658&anexo=0', 2016),
(1281, 'ALEJANDRO TOLEDO MANRIQUE', NULL, NULL, 'AVENIDA MARISCAL CACERES S/N', '080518', '1407436', 1, 76, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1407436&anexo=0', 2016),
(1282, 'SAN JOSE', NULL, NULL, 'PLAZA PRINCIPAL', '080525', '0637520', 1, 75, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0637520&anexo=0', 2016),
(1283, 'COLEGIO NACIONAL', NULL, NULL, 'MAYOBAMBA', '090102', '1189711', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1189711&anexo=0', 2016),
(1284, 'COLEGIO NACIONAL', NULL, NULL, 'TAMBOGAN S/N', '090103', '0289272', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0289272&anexo=0', 2016),
(1285, 'TUPAC AMARU II', NULL, NULL, 'CHAULAN', '090107', '1223973', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1223973&anexo=0', 2016),
(1286, 'SANTA ROSA DE LIMA', NULL, NULL, 'SIRABAMBA', '090108', '1410299', 1, 151, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1410299&anexo=0', 2016),
(1287, 'SAN LORENZO', NULL, NULL, 'CALLE CONCHAMARCA S/N', '090204', '0576066', 1, 147, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576066&anexo=0', 2016),
(1288, 'SIMON BOLIVAR', NULL, NULL, 'ANGASMARCA S/N', '090205', '1175330', 1, 147, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1175330&anexo=0', 2016),
(1289, 'SEÃ‘OR DE LA UNIDAD', NULL, NULL, 'LA UNION', '090301', '1413434', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1413434&anexo=0', 2016),
(1290, 'ENRIQUE LOPEZ ALBUJAR', NULL, NULL, 'PACHAS', '090314', '0290676', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290676&anexo=0', 2016),
(1291, 'JOSE ANTONIO ENCINAS', NULL, NULL, 'BELLAVISTA', '090314', '1189877', 1, 148, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1189877&anexo=0', 2016),
(1292, 'SIMON BOLIVAR', NULL, NULL, 'RONDOBAMBA', '090901', '0666073', 1, 149, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0666073&anexo=0', 2016),
(1293, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'COCHABAMBA', '090904', '0666081', 1, 149, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0666081&anexo=0', 2016),
(1294, 'CESAR VALLEJO', NULL, NULL, 'HUARACILLO', '090902', '0713248', 1, 149, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0713248&anexo=0', 2016),
(1295, 'DANIEL ALOMIA ROBLES', NULL, NULL, 'AVENIDA PINRA S/N', '090902', '0520999', 1, 149, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0520999&anexo=0', 2016),
(1296, 'COLEGIO NACIONAL', NULL, NULL, 'JIRON PAMPAS DEL CARMEN S/N', '090401', '0840900', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0840900&anexo=0', 2016),
(1297, 'JAPON', NULL, NULL, 'JIRON JORGE CHAVEZ 167', '090401', '0623967', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0623967&anexo=0', 2016),
(1298, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'CORICANCHA', '090401', '0532770', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0532770&anexo=0', 2016),
(1299, 'COLEGIO NACIONAL', NULL, NULL, 'CHAVIN DE PARIARCA', '090403', '0576215', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576215&anexo=0', 2016),
(1300, 'COLEGIO NACIONAL', NULL, NULL, 'QUIPRAN', '090403', '0747782', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0747782&anexo=0', 2016),
(1301, 'COLEGIO NACIONAL', NULL, NULL, 'POQUE', '090409', '1416023', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1416023&anexo=0', 2016),
(1302, 'MAGLORIO R. PADILLA CAQUI', NULL, NULL, 'PUÃ‘OS', '090409', '0575886', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575886&anexo=0', 2016),
(1303, 'COLEGIO NACIONAL', NULL, NULL, 'JIRON SANTA ROSA S/N', '090411', '0290734', 1, 150, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290734&anexo=0', 2016),
(1304, 'SAN ISIDRO', NULL, NULL, 'CARRETERA SAN ISIDRO', '090603', '0697300', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697300&anexo=0', 2016),
(1305, 'ANDRES AVELINO CACERES DORREGARAY', NULL, NULL, 'RAMON CASTILLA 232', '090606', '1220482', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1220482&anexo=0', 2016),
(1306, 'HANS VICTOR LANGEMAK MICHELSEN', NULL, NULL, 'LOS PROCERES', '090606', '1247295', 1, 153, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1247295&anexo=0', 2016),
(1307, 'FAUSTINO CIMAROLLI ZANINELLI', NULL, NULL, 'HUAYCHAO', '090501', '0672824', 1, 203, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0672824&anexo=0', 2016),
(1308, 'HUAYNA CAPAC', NULL, NULL, 'AVENIDA 28 DE JULIO S/N', '090501', '0384222', 1, 203, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0384222&anexo=0', 2016),
(1309, 'GUAMAN POMA DE AYALA', NULL, NULL, 'JIRON MAYRO S/N', '090701', '1370667', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1370667&anexo=0', 2016),
(1310, 'TUPAC AMARU II', NULL, NULL, 'JIRON LIMA S/N', '090701', '0290775', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0290775&anexo=0', 2016),
(1311, 'CALLAGAN', NULL, NULL, 'JIRON PACHITEA S/N', '090704', '1247170', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1247170&anexo=0', 2016),
(1312, 'COLEGIO NACIONAL', NULL, NULL, 'HUARICHACA S/N', '090704', '1175181', 1, 154, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1175181&anexo=0', 2016),
(1313, 'AGROPECUARIO DE PUERTO SUNGARO', NULL, NULL, 'CARRETERA FERNANDO BELAUNDE TERRY', '090802', '1177062', 1, 155, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1177062&anexo=0', 2016),
(1314, 'LUIS BENJAMIN CISNEROS', NULL, NULL, 'JIRON FERNANDO BELAUNDE S/N', '090802', '0238741', 1, 155, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0238741&anexo=0', 2016),
(1315, '32231 HIPOLITO UNANUE', NULL, NULL, 'JIRON AYACUCHO S/N', '091106', '1320688', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1320688&anexo=0', 2016),
(1316, 'SAN LUCAS', NULL, NULL, 'PAMPAMARCA S/N', '091107', '0751974', 1, 156, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0751974&anexo=0', 2016),
(1317, 'ANTONIA MORENO DE CACERES', NULL, NULL, 'AVENIDA CUTERVO S/N', '100101', '0275545', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0275545&anexo=0', 2016),
(1318, 'MAXIMO DE LA CRUZ SOLORZANO', NULL, NULL, 'CALLE JOSE OLAYA S/N', '100101', '0886309', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0886309&anexo=0', 2016),
(1319, '22526 MEDARDO APARCANA HERNANDEZ', NULL, NULL, 'NUEVO', '100114', '0494187', 1, 167, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0494187&anexo=0', 2016),
(1320, 'SAN PEDRO', NULL, NULL, 'AVENIDA SIMON BOLIVAR S/N', '100203', '1405323', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1405323&anexo=0', 2016),
(1321, 'HORACIO ZEBALLOS GAMEZ', NULL, NULL, 'SANTA ROSA', '100210', '0679654', 1, 166, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0679654&anexo=0', 2016),
(1322, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, 'AVENIDA LOS NOGALES S/N', '100304', '0580688', 1, 168, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580688&anexo=0', 2016),
(1323, 'CAP.FAP. JOSE ABELARDO QUIÃ‘ONES GONZALES', NULL, NULL, 'AVENIDA TUPAC AMARU S/N', '100503', '0276030', 1, 169, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0276030&anexo=0', 2016),
(1324, '22454 MIGUEL GRAU SEMINARIO', NULL, NULL, 'AVENIDA GARCILAZO DE LA VEGA 144', '100401', '0714394', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0714394&anexo=0', 2016),
(1325, '22469 SAN MIGUEL', NULL, NULL, 'CALLE SAN JOSE 275', '100401', '0553024', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0553024&anexo=0', 2016),
(1326, 'JUAN VELAZCO ALVARADO', NULL, NULL, 'AVENIDA LA MARINA S/N', '100403', '0608935', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0608935&anexo=0', 2016),
(1327, '22468 MARIA PARADO DE BELLIDO', NULL, NULL, 'AVENIDA MIRAFLORES 609', '100407', '0581041', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581041&anexo=0', 2016),
(1328, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'AVENIDA LIBERTADORES 720', '100407', '0554105', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0554105&anexo=0', 2016),
(1329, 'FE Y ALEGRIA 77', NULL, NULL, 'CALLE 06 Y 09 INTERSECCION', '100408', '1393594', 1, 170, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1393594&anexo=0', 2016),
(1330, 'ALMIRANTE MIGUEL GRAU', NULL, NULL, 'CALLE MANCO CAPAC S/N', '110112', '0667089', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0667089&anexo=0', 2016),
(1331, '17 SETIEMBRE', NULL, NULL, 'CALLE LOS MANZANOS 309', '110113', '0922054', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0922054&anexo=0', 2016),
(1332, 'FRANCISCO DE ZELA', NULL, NULL, 'CALLE ROSARIO 632', '110113', '0919308', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0919308&anexo=0', 2016),
(1333, 'ALFONSO UGARTE', NULL, NULL, 'PASAJE ALFONSO UGARTE S/N', '110118', '0567107', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0567107&anexo=0', 2016),
(1334, 'ANDRES BELLO', NULL, NULL, 'CALLE HUAMACHUCO 200', '110123', '0525220', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525220&anexo=0', 2016),
(1335, 'ESTEBAN SANABRIA MARAVI', NULL, NULL, 'CARRETERA CENTRAL KM-15 5 S/N', '110128', '0372938', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372938&anexo=0', 2016),
(1336, 'COMANDANTE PNP HORACIO PATIÃ‘O CRUZATTI', NULL, NULL, 'CALLE SAN FRANCISCO S/N', '110132', '0498667', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0498667&anexo=0', 2016),
(1337, 'JULIO C. TELLO', NULL, NULL, 'AVENIDA MANCO CAPAC 193', '110136', '0569152', 1, 117, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0569152&anexo=0', 2016),
(1338, 'SAN ISIDRO', NULL, NULL, 'CALLE SUCRE S/N', '110202', '0373001', 1, 116, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373001&anexo=0', 2016),
(1339, '2 DE MAYO', NULL, NULL, 'CARRETERA CHUPACA YAUYOS KM 12', '110206', '0525329', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0525329&anexo=0', 2016),
(1340, 'JOAQUIN CAPELO', NULL, NULL, 'CALLE LOS CAUCHOS S/N', '110801', '0373142', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373142&anexo=0', 2016),
(1341, 'POLITECNICO SELVA CENTRAL', NULL, NULL, 'AVENIDA CESAR VALLEJO S/N', '110801', '0937136', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0937136&anexo=0', 2016),
(1342, 'SANTA ANA', NULL, NULL, 'CALLE JUAN MAURICIO S/N', '110806', '0937045', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0937045&anexo=0', 2016),
(1343, 'AGROPECUARIO 018', NULL, NULL, 'AVENIDA JUAN SANTOS ATAHUALPA 1062', '110802', '0373571', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373571&anexo=0', 2016),
(1344, 'SAGRADO CORAZON DE JESUS', NULL, NULL, 'CALLE URIARTE 237', '110802', '0372771', 1, 114, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0372771&anexo=0', 2016),
(1345, 'INCA PACHACUTEC', NULL, NULL, 'AVENIDA INCA PACHACUTEC S/N', '110311', '0373068', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373068&anexo=0', 2016),
(1346, 'SANTIAGO ANTUNEZ DE MAYOLO', NULL, NULL, 'JIRON ANDAHUAYLAS S/N', '110328', '0537407', 1, 118, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537407&anexo=0', 2016),
(1347, 'JOSE OLAYA', NULL, NULL, 'JIRON 1 DE NOVIEMBRE 575', '110701', '1103647', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1103647&anexo=0', 2016),
(1348, 'RAFAEL GASTELUA', NULL, NULL, 'CALLE JUNIN 450', '110701', '1214576', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1214576&anexo=0', 2016),
(1349, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'AVENIDA PERU S/N', '110704', '0373399', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373399&anexo=0', 2016),
(1350, 'JOSE ANTONIO ENCINAS', NULL, NULL, 'C.N. YAVIRIRONI', '110707', '1103803', 1, 123, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1103803&anexo=0', 2016),
(1351, 'EMILIO RIOS ANITA', NULL, NULL, 'POYENI', '110708', '0921213', 1, 122, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0921213&anexo=0', 2016),
(1352, 'SANTA TERESA', NULL, NULL, 'AVENIDA PACHECO 142', '110501', '0373696', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0373696&anexo=0', 2016),
(1353, 'SAN MARTIN DE PORRAS', NULL, NULL, 'CARRETERA PRINCIPAL', '110504', '0924670', 1, 124, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0924670&anexo=0', 2016),
(1354, 'JOSE MARIA ARGUEDAS', NULL, NULL, 'CARRETERA MARCAVALLE S/N', '110610', '1102078', 1, 125, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1102078&anexo=0', 2016),
(1355, 'SAN MIGUEL', NULL, NULL, 'JIRON PEDRO DAVILA S/N', '110901', '0697060', 1, 115, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697060&anexo=0', 2016),
(1356, '80026 HORACIO ZEVALLOS GAMEZ', NULL, NULL, 'JIRON JOSE OLAYA - SECTOR CENTRAL BARRIO 1 1729', '120110', '0577908', 1, 40, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0577908&anexo=0', 2016),
(1357, 'RAMON CASTILLA', NULL, NULL, 'JIRON GRAU 942', '120801', '0394197', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0394197&anexo=0', 2016),
(1358, 'INCA GARCILAZO DE LA VEGA', NULL, NULL, 'AVENIDA LARCO S/N', '120802', '0395483', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395483&anexo=0', 2016),
(1359, '81516 LIBERTAD', NULL, NULL, 'MIGUEL GRAU S/N ETAPA II', '120808', '0822015', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0822015&anexo=0', 2016),
(1360, 'VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, '', '120808', '0395145', 1, 44, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395145&anexo=0', 2016),
(1361, 'SAN SALVADOR', NULL, NULL, 'JIRON BOLIVAR 512', '120201', '0395392', 1, 204, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395392&anexo=0', 2016),
(1362, 'JAVIER HERAUD', NULL, NULL, 'AVENIDA FERNANDO BELAUNDE TERRY S/N', '120204', '0578021', 1, 204, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578021&anexo=0', 2016),
(1363, 'CARLOS GUTIERREZ NORIEGA', NULL, NULL, 'AVENIDA 28 DE JULIO', '120901', '0395434', 1, 45, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395434&anexo=0', 2016),
(1364, 'SANTA ROSA', NULL, NULL, 'ESPERANZA', '120903', '0635458', 1, 45, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635458&anexo=0', 2016),
(1365, '80249 LUIS FELIPE DE LA PUENTE', NULL, NULL, 'AVENIDA 28 DE JULIO 116', '121001', '1167311', 1, 46, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1167311&anexo=0', 2016),
(1366, 'TECNICO SAN JUAN BAUTISTA', NULL, NULL, 'CALLE LA CULTURA 305', '121001', '1167519', 1, 46, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1167519&anexo=0', 2016),
(1367, '80288', NULL, NULL, 'SAN ISIDRO S/N', '120401', '1416627', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1416627&anexo=0', 2016),
(1368, 'SIMON BOLIVAR', NULL, NULL, 'CALLE LIMA 251', '120401', '0541656', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0541656&anexo=0', 2016),
(1369, '81550', NULL, NULL, 'CHOTA', '120402', '0724666', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0724666&anexo=0', 2016),
(1370, 'SIMON BOLIVAR', NULL, NULL, 'AVENIDA LOS INCAS S/N', '120413', '0475566', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0475566&anexo=0', 2016),
(1371, '80371 ALFONSO ROBLES DE LA CRUZ', NULL, NULL, 'BARRO NEGRO S/N', '120411', '0737007', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0737007&anexo=0', 2016),
(1372, '80710 JORGE BASADRE', NULL, NULL, 'HUACAMOCHAL S/N', '120411', '1166412', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1166412&anexo=0', 2016),
(1373, '80795', NULL, NULL, 'CAPACHIQUE', '120411', '1169663', 1, 47, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1169663&anexo=0', 2016),
(1374, 'SANTA MAGDALENA', NULL, NULL, 'TUPAC AMARU MZ M', '120503', '1157288', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1157288&anexo=0', 2016),
(1375, 'SAN JOSE', NULL, NULL, 'CALLE LIMA 446', '120508', '0395319', 1, 48, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395319&anexo=0', 2016),
(1376, '81939 JOSE MARIA ARGUEDAS', NULL, NULL, 'CALLE CESAR VALLEJO', '120601', '1251453', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1251453&anexo=0', 2016),
(1377, 'SANTO TORIBIO', NULL, NULL, 'AVENIDA ALFONSO UGARTE 121', '120601', '0395376', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0395376&anexo=0', 2016),
(1378, 'JUAN ACEVEDO ARCE', NULL, NULL, 'JIRON MIRAFLORES', '120603', '0545855', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0545855&anexo=0', 2016),
(1379, '80452', NULL, NULL, 'USCA', '120606', '1251214', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1251214&anexo=0', 2016),
(1380, '80456 JOSE CARLOS MARIATEGUI', NULL, NULL, 'JIRON LA CANTUTA 006', '120608', '0546051', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546051&anexo=0', 2016),
(1381, 'CESAR VALLEJO', NULL, NULL, 'AVENIDA ALFONSO UGARTE S/N', '120612', '0546671', 1, 49, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546671&anexo=0', 2016),
(1382, '80132 NESTOR GASTAÃ‘ADUI SANCHEZ', NULL, NULL, 'SHIRACMACA', '120301', '0724674', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0724674&anexo=0', 2016),
(1383, '80152', NULL, NULL, 'PUENTE PIEDRA', '120301', '1322908', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1322908&anexo=0', 2016),
(1384, '80136 HORACIO ZEVALLOS GAMES', NULL, NULL, 'ARICAPAMPA', '120302', '1166701', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1166701&anexo=0', 2016),
(1385, '80199', NULL, NULL, 'CHAQUILBAMBA', '120305', '0802736', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0802736&anexo=0', 2016),
(1386, '80144', NULL, NULL, 'SANAGORAN', '120306', '0578187', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578187&anexo=0', 2016),
(1387, '80214', NULL, NULL, 'CERPAQUINO', '120307', '1252253', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1252253&anexo=0', 2016),
(1388, '80150', NULL, NULL, 'LA VICTORIA', '120308', '1252097', 1, 50, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1252097&anexo=0', 2016),
(1389, '80528 JOSE NESTOR ESQUIVEL NUÃ‘EZ', NULL, NULL, 'HUARAN ALTO', '120701', '1458132', 1, 51, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1458132&anexo=0', 2016),
(1390, '81700 VICTOR RAUL HAYA DE LA TORRE', NULL, NULL, 'MZ 10 LOTE 1', '121201', '1416536', 1, 52, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1416536&anexo=0', 2016),
(1391, 'MANUEL GONZALES PRADA', NULL, NULL, 'CALLE BAYOVAR S/N', '130110', '0452862', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0452862&anexo=0', 2016),
(1392, 'ANTONIO RAIMONDI DELL ACQUA', NULL, NULL, 'AVENIDA POMALCA 94', '130114', '0580605', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0580605&anexo=0', 2016),
(1393, 'GREGORIO ODAR MORE', NULL, NULL, 'AVENIDA TUPAC AMARU S/N', '130117', '1158492', 1, 171, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1158492&anexo=0', 2016),
(1394, '10068', NULL, NULL, 'HUACAPAMPA', '130203', '0582973', 1, 172, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0582973&anexo=0', 2016),
(1395, 'AMALIA CAMPOS DE BELEVAN', NULL, NULL, 'GARCILAZO DE LA VEGA S/N', '130204', '0574780', 1, 172, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0574780&anexo=0', 2016),
(1396, 'JORGE BASADRE GROHMANN', NULL, NULL, 'CALLE BELAUNDE TERRY S/N MZ E LOTE 01', '130306', '0620187', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0620187&anexo=0', 2016),
(1397, 'SAN PABLO', NULL, NULL, 'CALLE SAN PABLO 658', '130309', '0453001', 1, 173, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0453001&anexo=0', 2016),
(1398, '022 REPUBLICA DE GUATEMALA', NULL, NULL, 'JIRON MANUEL PARDO 225', '140101', '0337741', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0337741&anexo=0', 2016),
(1399, 'JUAN PABLO VIZCARDO Y GUZMAN', NULL, NULL, 'AVENIDA NICOLAS DUEÃ‘AS 555', '140101', '0336594', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0336594&anexo=0', 2016),
(1400, '1270 JUAN EL BAUTISTA', NULL, NULL, 'AVENIDA LOTE 80 ZONA M UCV 171-B', '140103', '1507532', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1507532&anexo=0', 2016),
(1401, 'NUESTRA SEÃ‘ORA DE LA ESPERANZA', NULL, NULL, 'CALLE BAYOVAR S/N', '140103', '0690024', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0690024&anexo=0', 2016),
(1402, 'TERESA GONZALES DE FANNING', NULL, NULL, '', '140101', '0245688', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0245688&anexo=0', 2016),
(1403, '1188 JUAN PABLO II', NULL, NULL, 'AVENIDA UNION KM 21', '140107', '0692707', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0692707&anexo=0', 2016),
(1404, '1217 JORGE BASADRE', NULL, NULL, 'CALLE AZUCENAS 246', '140107', '0765362', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0765362&anexo=0', 2016),
(1405, 'TUPAC AMARU II', NULL, NULL, 'AVENIDA SANTA ROSA S/N', '140108', '0583328', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583328&anexo=0', 2016),
(1406, 'JUAN PABLO VIZCARDO Y GUZMAN', NULL, NULL, 'JIRON LA UNION S/N', '140106', '0567743', 1, 162, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0567743&anexo=0', 2016),
(1407, 'DIEGO FERRE', NULL, NULL, 'AVENIDA GENERAL GARZON 925', '140133', '0601492', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0601492&anexo=0', 2016),
(1408, 'GRAL FELIPE SANTIAGO SALAVERRY', NULL, NULL, 'JIRON MANUEL CISNEROS 595', '140109', '0340463', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340463&anexo=0', 2016),
(1409, 'TUPAC AMARU', NULL, NULL, 'AVENIDA DEL AIRE 601', '140109', '0340364', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340364&anexo=0', 2016),
(1410, 'REPUBLICA DE CHILE', NULL, NULL, 'JIRON RISSO 477', '140111', '0644690', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0644690&anexo=0', 2016),
(1411, 'CORAZON DE JESUS DE JICAMARCA', NULL, NULL, 'CALLE MONTEVIDEO MZ O LOTE 31', '140112', '1595347', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1595347&anexo=0', 2016),
(1412, 'FE Y ALEGRIA 58 MARY WARD', NULL, NULL, 'AVENIDA MODESTO REYNOSO S/N', '140112', '1364264', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1364264&anexo=0', 2016),
(1413, 'PLANTELES DE APLICACION DE UNE', NULL, NULL, 'AVENIDA ENRIQUE GUZMAN Y VALLE S/N', '140112', '0340422', 1, 164, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340422&anexo=0', 2016),
(1414, '7266 LAS MERCEDES', NULL, NULL, 'MZ Z LOTE 05 SECTOR LAS MERCEDES', '140116', '1393453', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1393453&anexo=0', 2016),
(1415, '6030 VICTOR A BELAUNDE DIEZ CANSECO', NULL, NULL, 'AVENIDA GASTON GARCIA RADA CUADRA 1', '140120', '0869198', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0869198&anexo=0', 2016),
(1417, '0161 MOISES COLONIA TRINIDAD', NULL, NULL, 'MZ Q MZ Q', '140137', '0778761', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0778761&anexo=0', 2016),
(1418, '110 SAN MARCOS', NULL, NULL, 'PASAJE LOS COLIBRIS S/N', '140137', '0665265', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0665265&anexo=0', 2016),
(1419, '117 SIGNOS DE FE', NULL, NULL, 'HUASCAR MZ B, LOTE 01', '140137', '1501451', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1501451&anexo=0', 2016),
(1420, '1178 JAVIER HERAUD', NULL, NULL, 'JIRON AREQUIPA S/N', '140137', '0336578', 1, 163, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0336578&anexo=0', 2016),
(1421, 'FE Y ALEGRIA 65', NULL, NULL, 'EL MIRADOR II S/N', '140136', '1376854', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1376854&anexo=0', 2016),
(1422, '1128 SAN LUIS', NULL, NULL, 'CALLE FRANCISCO VIDAL DE LAOS 601', '140138', '0340448', 1, 165, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0340448&anexo=0', 2016),
(1423, 'JOSE GRANDA', NULL, NULL, 'AVENIDA UNIVERSITARIA S/N', '140126', '0437236', 1, 160, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0437236&anexo=0', 2016),
(1424, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, 'AVENIDA LIBERTAD 2021', '140127', '0337717', 1, 161, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0337717&anexo=0', 2016),
(1425, '6067 JUAN VELASCO ALVARADO', NULL, NULL, 'AVENIDA CENTRAL /TALARA S/N SECTOR 3', '140141', '0607143', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0607143&anexo=0', 2016),
(1426, '7224 ELIAS REMIGIO AGUIRRE ROMERO', NULL, NULL, 'BARRIO 2 ETAPA IV', '140141', '1195221', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1195221&anexo=0', 2016),
(1427, '7234', NULL, NULL, 'AVENIDA LAS PALMERAS Y LOS ALAMOS', '140141', '1476464', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1476464&anexo=0', 2016),
(1428, '7236 MAX UHLE', NULL, NULL, 'BRISAS DE PACHACAMAC SECTOR 2', '140141', '1474964', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1474964&anexo=0', 2016),
(1429, '7238 SOLIDARIDAD PERU ALEMANIA', NULL, NULL, 'MZ E SECTOR 9', '140141', '1475086', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1475086&anexo=0', 2016),
(1430, '7073', NULL, NULL, 'AVENIDA MARIA PARADO DE BELLIDO', '140132', '0493742', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0493742&anexo=0', 2016),
(1432, 'SANTA MARIA DE LOS ANDES', NULL, NULL, 'AVENIDA DEL EJERCITO S/N LOTE 07', '140132', '1558725', 1, 159, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1558725&anexo=0', 2016),
(1433, '20504 SAN JERONIMO', NULL, NULL, 'AVENIDA REP DE VENEZUELA S/N', '140903', '0761627', 1, 66, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0761627&anexo=0', 2016),
(1434, 'JOSE PARDO Y BARREDA', NULL, NULL, 'AVENIDA AZUCENA S/N', '140903', '0600387', 1, 66, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0600387&anexo=0', 2016),
(1435, 'GABRIEL MORENO', NULL, NULL, 'AVENIDA 26 DE JUNIO S/N', '140301', '0217778', 1, 63, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0217778&anexo=0', 2016),
(1436, '20123', NULL, NULL, 'AVENIDA LOS INCAS 400', '140416', '0583856', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0583856&anexo=0', 2016),
(1437, '20158 DOS DE MAYO', NULL, NULL, 'CALLE BOLOGNESI S/N', '140408', '0769265', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0769265&anexo=0', 2016),
(1438, 'SAN LUIS', NULL, NULL, 'CALLE COMERCIO S/N', '140413', '0286427', 1, 60, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286427&anexo=0', 2016),
(1439, '20395 NUESTRA SEÃ‘ORA DE FATIMA', NULL, NULL, 'AVENIDA FRANCISCO BOLOGNESI KM 4.5 LOTE 54', '140805', '0638932', 1, 62, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0638932&anexo=0', 2016),
(1440, 'SANTA CRUZ', NULL, NULL, 'JIRON LIMA S/N', '140609', '0286534', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286534&anexo=0', 2016),
(1441, '20955-15', NULL, NULL, 'LOS INCAS MZ A', '140615', '1524883', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1524883&anexo=0', 2016),
(1442, '20955-23 ANTENOR ORREGO ESPINOZA', NULL, NULL, 'EL VALLE S/N', '140615', '1524909', 1, 65, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1524909&anexo=0', 2016),
(1443, '20356  JESUS OBRERO', NULL, NULL, 'AVENIDA EZEQUIEL GAGO S/N', '140516', '0584508', 1, 61, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0584508&anexo=0', 2016),
(1444, 'FRAY MELCHOR APONTE', NULL, NULL, 'AVENIDA LOS LIBERTADORES S/N', '140516', '0286476', 1, 61, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0286476&anexo=0', 2016),
(1445, '601582 AGUSTIN RIVAS VASQUEZ', NULL, NULL, 'CALLE ALAYZA PAZ SOLDAN', '150103', '1274125', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1274125&anexo=0', 2016),
(1446, 'SANTA MARIA DEL AMAZONAS', NULL, NULL, 'CALLE GONZALES PRADA 400', '150103', '0302919', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0302919&anexo=0', 2016),
(1447, '60066 VIRGEN DE LOURDES', NULL, NULL, 'QUEBRADA YANASHI - RIO AMAZONAS', '150104', '0473603', 1, 38, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0473603&anexo=0', 2016),
(1448, 'NUESTRA SEÃ‘ORA DE GUADALUPE', NULL, NULL, 'CARRETERA HAYA DE LA TORRE S/N', '150201', '0579094', 1, 36, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579094&anexo=0', 2016),
(1449, 'SAN PABLO APOSTOL', NULL, NULL, 'RIO PARANAPURA', '150202', '0800342', 1, 36, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0800342&anexo=0', 2016),
(1450, 'JEBEROS', NULL, NULL, 'CALLE PASTAZA S/N', '150205', '0635342', 1, 36, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0635342&anexo=0', 2016),
(1451, '60528 HERMANOS PALLA', NULL, NULL, 'PASAJE LUQUE HERRERA S/N', '150303', '0548057', 1, 37, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548057&anexo=0', 2016),
(1452, '60078 - PEVAS', NULL, NULL, 'CALLE PEVAS S/N', '150602', '1539485', 1, 206, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1539485&anexo=0', 2016),
(1453, '60276 - EUGENIO RIVERA LOPEZ - ISLANDIA', NULL, NULL, 'PROGRESO', '150603', '0685065', 1, 206, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0685065&anexo=0', 2016),
(1454, 'PADRE NICOLAS GINER', NULL, NULL, 'CALLE PROLONGACIONSAN ANTONIO S/N', '150401', '0685081', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0685081&anexo=0', 2016),
(1455, 'NARCISO GIRBAL', NULL, NULL, 'CALLE JESUS DE PRAGA S/N', '150403', '0302976', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0302976&anexo=0', 2016),
(1456, 'GUARDA MARINA', NULL, NULL, 'RIO UCAYALI', '150404', '1231612', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1231612&anexo=0', 2016),
(1457, 'BRETAÃ‘A', NULL, NULL, 'RIO PUINAHUA', '150406', '0548552', 1, 39, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548552&anexo=0', 2016),
(1458, 'JUANCITO', NULL, NULL, 'CALLE SAN JUAN S/N', '150505', '0526020', 1, 207, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0526020&anexo=0', 2016),
(1459, 'TIERRA BLANCA', NULL, NULL, 'JIRON LIBERTAD S/N', '150505', '0521047', 1, 207, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0521047&anexo=0', 2016),
(1460, '62032', NULL, NULL, 'CALLE AMAZONAS 458', '150701', '1534916', 1, 205, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1534916&anexo=0', 2016),
(1461, 'JESUS NAZARENO', NULL, NULL, 'JIRON MARAÃ‘ON 1170', '150701', '0547950', 1, 205, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547950&anexo=0', 2016),
(1462, 'SAN LORENZO', NULL, NULL, 'CALLE ALFONSO VALCARCEL A S/N', '150701', '1150572', 1, 205, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1150572&anexo=0', 2016),
(1463, 'ANDRES AVELINO CACERES', NULL, NULL, 'RIO MARAÃ‘ON', '150704', '1275841', 1, 205, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1275841&anexo=0', 2016),
(1464, 'SAN PEDRO', NULL, NULL, 'RIO PASTAZA', '150706', '1148121', 1, 205, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1148121&anexo=0', 2016),
(1465, 'HEROES DE ILLAMPU', NULL, NULL, 'CARRETERA MALDONADO - IBERIA KM 80', '160103', '0688309', 1, 20, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0688309&anexo=0', 2016),
(1466, 'HORACIO ZEBALLOS GAMES', NULL, NULL, 'AVENIDA INDEPENDENCIA S/N', '160204', '0934422', 1, 19, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0934422&anexo=0', 2016),
(1467, 'MARISCAL DOMINGO NIETO', NULL, NULL, 'CALLE TRES DE ABRIL 404', '170201', '0309609', 1, 208, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309609&anexo=0', 2016),
(1468, 'MARISCAL RAMON CASTILLA', NULL, NULL, 'CALLE MOQUEGUA S/N', '170204', '0591099', 1, 97, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0591099&anexo=0', 2016),
(1469, 'ALMTE. MIGUEL GRAU SEMINARIO', NULL, NULL, 'AVENIDA PROMUVI II - PAMPA INALAMBRICA S/N', '170301', '1125707', 1, 96, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1125707&anexo=0', 2016),
(1470, 'DANIEL ALCIDES CARRION', NULL, NULL, 'TUPAC AMARU', '180101', '0427690', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427690&anexo=0', 2016),
(1471, 'SAN JUAN BAUTISTA', NULL, NULL, 'JIRON PROGRESO 100', '180104', '0427815', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427815&anexo=0', 2016),
(1472, 'ANTONIO ALVAREZ DE ARENALES', NULL, NULL, 'CALLE 2 DE MAYO S/N', '180105', '0427849', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427849&anexo=0', 2016),
(1473, 'AGROINDUSTRIAL 34024', NULL, NULL, 'JIRON RICARDO LA JARA S/N', '180108', '1161678', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1161678&anexo=0', 2016),
(1474, 'ALFONSO UGARTE', NULL, NULL, 'JIRON FRATERNIDAD 252', '180108', '0427781', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427781&anexo=0', 2016),
(1475, '31774 SAN ANDRES', NULL, NULL, 'PASAJE CAMPAMENTO SAN ANDRES S/N', '180110', '0576363', 1, 23, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576363&anexo=0', 2016),
(1476, 'INCA GARCILASO DE LA VEGA', NULL, NULL, 'PILLAO S/N', '180205', '0550947', 1, 21, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0550947&anexo=0', 2016),
(1477, '34622 LIBERTADOR MARISCAL CASTILLA', NULL, NULL, 'JIRON LIBERTADOR MARISCAL CASTILLA S/N', '180301', '0427740', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0427740&anexo=0', 2016),
(1478, '35005 RVDO. PADRE BARDO BAYERLE', NULL, NULL, 'JIRON MULLEMBRUCK CUADRA 6', '180301', '1251271', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1251271&anexo=0', 2016),
(1479, '34232 PEDRO RUIZ GALLO', NULL, NULL, 'AVENIDA PUERTO BERMUDEZ 618', '180305', '1161736', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1161736&anexo=0', 2016),
(1480, '34418 SANTA APOLONIA', NULL, NULL, 'AVENIDA LEOPOLDO KRAUSE 1101', '180305', '1551217', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1551217&anexo=0', 2016),
(1481, '34350 LOS LIBERTADORES', NULL, NULL, 'CIUDAD CONSTITUCIONAL', '180308', '0697466', 1, 22, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0697466&anexo=0', 2016),
(1482, '14102', NULL, NULL, 'CARRETERA EJIDOS DE HUAN', '190101', '1017367', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1017367&anexo=0', 2016),
(1483, 'JAVIER HERAUD', NULL, NULL, 'CARRETERA SAN JUAN DE CURUMUY', '190101', '0535906', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535906&anexo=0', 2016),
(1484, 'SAN PEDRO', NULL, NULL, 'AVENIDA CARACAS S/N', '190101', '0718718', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0718718&anexo=0', 2016),
(1485, '15014 MANUEL HIDALGO CARNERO', NULL, NULL, 'CALLE LOS INCAS S/N', '190103', '1017391', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1017391&anexo=0', 2016),
(1486, 'TENIENTE MIGUEL CORTES DEL CASTILLO', NULL, NULL, 'AVENIDA PROGRESO 1734', '190103', '0356089', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356089&anexo=0', 2016),
(1487, 'MANUEL SCORZA', NULL, NULL, 'CARRETERA PANAMERICANA SUR KM 953', '190114', '0700872', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0700872&anexo=0', 2016),
(1488, '14127 DORA JACINTA ZAPATA DE ZEGARRA', NULL, NULL, 'RIO VIEJO NORTE', '190105', '1557339', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1557339&anexo=0', 2016),
(1489, 'DIVINO MAESTRO', NULL, NULL, 'CALLE COMERCIO S/N', '190105', '0938670', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0938670&anexo=0', 2016),
(1490, 'JOSE ANTONIO ENCINAS', NULL, NULL, 'LOMA NEGRA', '190105', '0938613', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0938613&anexo=0', 2016),
(1491, 'GENERAL JUAN VELASCO ALVARADO', NULL, NULL, 'CANIZAL CHICO', '190106', '0674325', 1, 4, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674325&anexo=0', 2016),
(1492, '15262', NULL, NULL, 'EL PAPAYO', '190109', '0576801', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0576801&anexo=0', 2016),
(1493, 'TECNICO MARIA TERESA DE JESUS GERHARDINGER', NULL, NULL, 'CENTRO POBLADO TEJEDORES', '190109', '1236397', 1, 11, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1236397&anexo=0', 2016),
(1494, 'COM. EDUC. INGNACIA DEL CARMEN POZO ARIAS', NULL, NULL, 'SAMANGUILLA', '190201', '1139310', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1139310&anexo=0', 2016),
(1495, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'SOCCHABAMBA', '190201', '0653246', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0653246&anexo=0', 2016),
(1496, 'AMAUTA', NULL, NULL, 'CARRETERA SILAHUA', '190202', '1095538', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1095538&anexo=0', 2016),
(1497, 'LAGUNAS', NULL, NULL, 'CALLE SAN MARTIN S/N', '190203', '0626275', 1, 1, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0626275&anexo=0', 2016),
(1498, 'PEDRO VALDIVIEZO CARAMANTIN', NULL, NULL, 'EL LUCUMO', '190203', '1136829', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1136829&anexo=0', 2016),
(1499, '14373', NULL, NULL, 'CUMBICUS ALTO', '190205', '1515444', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1515444&anexo=0', 2016),
(1500, 'NANGAY', NULL, NULL, 'NANGAY DE MATALACAS S/N', '190205', '0537100', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537100&anexo=0', 2016),
(1501, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'JUZGARA', '190301', '0915215', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0915215&anexo=0', 2016),
(1502, '14458 SAN ANTONIO DE PADUA', NULL, NULL, 'SAN ANTONIO', '190306', '0915249', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0915249&anexo=0', 2016),
(1503, '14578', NULL, NULL, 'SANTA TERESA', '190303', '1275510', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1275510&anexo=0', 2016),
(1504, '14580 HORACIO ZEVALLOS GAMEZ', NULL, NULL, 'HINTON', '190303', '1095629', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1095629&anexo=0', 2016),
(1505, 'FRAY MARTIN DE PORRES', NULL, NULL, 'AVENIDA SAN FRANCISCO DE ASIS 108', '190303', '1228048', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1228048&anexo=0', 2016),
(1506, 'MANUEL ANTONIO MESONES MURO', NULL, NULL, 'CARRETERA LIMON DE PORCUYA KM. 38', '190303', '0002212', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0002212&anexo=0', 2016);
INSERT INTO `institucion` (`id`, `denominacion`, `ruc`, `telefono`, `direccion`, `ubigeo_id`, `codigo_modular`, `estado`, `unidad_gestion_educativa_local_id`, `tipo_institucion`, `ruta_escale`, `jec`) VALUES
(1507, 'NUESTRA SEÃ‘ORA DEL CARMEN', NULL, NULL, 'RODEOPAMPA', '190303', '0674440', 1, 7, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674440&anexo=0', 2016),
(1508, 'SAN JUAN BAUTISTA', NULL, NULL, 'AVENIDA SANTUARIO S/N', '190305', '0571042', 1, 3, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571042&anexo=0', 2016),
(1509, 'MIGUEL GRAU', NULL, NULL, 'LA ENCANTADA', '190401', '0674515', 1, 2, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0674515&anexo=0', 2016),
(1510, 'JORGE BASADRE', NULL, NULL, 'AVENIDA RICARDO PALMA S/N', '190405', '0575498', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0575498&anexo=0', 2016),
(1511, 'SAN JUAN', NULL, NULL, 'CALLE COMERCIO 136', '190407', '0356295', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356295&anexo=0', 2016),
(1512, 'JESUS NAZARENO', NULL, NULL, 'TAMBOYA S/N', '190409', '0571331', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571331&anexo=0', 2016),
(1513, 'SAN JUAN BAUTISTA', NULL, NULL, 'CHOCO S/N', '190409', '1016732', 1, 5, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1016732&anexo=0', 2016),
(1514, 'SIMON RODRIGUEZ', NULL, NULL, 'CALLE SAN MARTIN S/N', '190502', '0356154', 1, 6, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356154&anexo=0', 2016),
(1515, '14781 HIDEBRANDO CASTRO POZO', NULL, NULL, 'CHALACALA BAJA', '190601', '0571349', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0571349&anexo=0', 2016),
(1516, '15079', NULL, NULL, 'VILLA MARIA', '190601', '1139153', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1139153&anexo=0', 2016),
(1517, '15285 MARIA AUXILIADORA', NULL, NULL, 'AVENIDA PROLONGACION AV. JOSE DE LAMA S/N', '190601', '0355974', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355974&anexo=0', 2016),
(1518, 'PEDRO RUIZ GALLO', NULL, NULL, 'CALLE UNIVERSIDAD S/N', '190608', '0570929', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0570929&anexo=0', 2016),
(1519, 'ROSA CARDO DE GUARDERAS', NULL, NULL, 'PANAMERICANA NORTE KM 1030', '190604', '0523746', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0523746&anexo=0', 2016),
(1520, '19 DE JUNIO', NULL, NULL, 'CALLE BOLOGNESI 999', '190607', '0356170', 1, 9, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356170&anexo=0', 2016),
(1521, '14902', NULL, NULL, 'AVENIDA SAN MARTIN S/N', '190701', '1206382', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1206382&anexo=0', 2016),
(1522, 'CRNL.FAP VICTOR MALDONADO BEGAZO', NULL, NULL, 'LUIS NEGREIROS VEGA', '190701', '0807958', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0807958&anexo=0', 2016),
(1523, 'IGNACIO MERINO', NULL, NULL, 'AVENIDA IGNACIO MERINO S/N', '190701', '0355925', 1, 10, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0355925&anexo=0', 2016),
(1524, '14917 MICAELA BASTIDAS', NULL, NULL, 'CALLE MICAELA BASTIDAS S/N', '190705', '1137009', 1, 86, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1137009&anexo=0', 2016),
(1525, 'SAN MARTIN', NULL, NULL, 'CALLE CESAR PINGLO 777', '190801', '0356196', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0356196&anexo=0', 2016),
(1526, 'SAN CRISTO', NULL, NULL, 'CALLE LIBERTAD - SANCHEZ CERRO S/N', '190805', '0536508', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0536508&anexo=0', 2016),
(1527, 'JOSE OLAYA BALANDRA', NULL, NULL, 'CALLE SANTA ROSA S/N', '190802', '1018068', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1018068&anexo=0', 2016),
(1528, 'SAN JACINTO', NULL, NULL, 'CALLE MIGUEL F. CERRO S/N', '190802', '0535500', 1, 8, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0535500&anexo=0', 2016),
(1530, 'ALFONSO TORRES LUNA', NULL, NULL, 'JIRON ANTONIO RAYMONDI 135', '200102', '0240341', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240341&anexo=0', 2016),
(1531, 'MIGUEL GRAU', NULL, NULL, 'LAMPAYUNI', '200115', '0631135', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0631135&anexo=0', 2016),
(1532, 'TAQUILE', NULL, NULL, 'QUINUA PATA', '200115', '1025394', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1025394&anexo=0', 2016),
(1533, 'EMILIO ROMERO PADILLA', NULL, NULL, 'JIRON TRUCOS 460', '200106', '0240358', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0240358&anexo=0', 2016),
(1534, 'MAÃ‘AZO', NULL, NULL, 'AVENIDA LA CULTURA S/N', '200108', '0474569', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0474569&anexo=0', 2016),
(1535, 'TUPAC AMARU', NULL, NULL, 'JIRON CAHUIDE 260', '200109', '0522292', 1, 192, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522292&anexo=0', 2016),
(1536, 'AGROPECUARIO', NULL, NULL, 'HANAJQUIA', '200201', '0581413', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581413&anexo=0', 2016),
(1537, 'TUPAC AMARU', NULL, NULL, 'CURAYLLO', '200203', '0581520', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0581520&anexo=0', 2016),
(1538, 'MUÃ‘ANI', NULL, NULL, 'AVENIDA JOSE C MARIATEGUI S/N', '200208', '0548099', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548099&anexo=0', 2016),
(1539, 'POTONI', NULL, NULL, 'AVENIDA PERU S/N', '200210', '0810622', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0810622&anexo=0', 2016),
(1540, 'SAN JUAN', NULL, NULL, 'QUEJON MOCCO', '200212', '0746289', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0746289&anexo=0', 2016),
(1541, 'SANTIAGO DE PUPUJA', NULL, NULL, 'PARQUE PLAZA BOLOGNESI S/N', '200216', '0239855', 1, 183, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239855&anexo=0', 2016),
(1542, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'AVENIDA AREQUIPA S/N', '200302', '1024652', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024652&anexo=0', 2016),
(1543, 'AYAPATA', NULL, NULL, 'CALLE CULTURA 141', '200303', '0549188', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0549188&anexo=0', 2016),
(1544, 'HANAC AYLLU', NULL, NULL, 'HANAC AYLLU SECTOR IÃ‘A', '200303', '1575042', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1575042&anexo=0', 2016),
(1545, 'KANA', NULL, NULL, 'KANA', '200303', '1024660', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024660&anexo=0', 2016),
(1546, 'COAZA', NULL, NULL, 'TUPAC AMARU S/N', '200304', '0546598', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546598&anexo=0', 2016),
(1547, 'MARTIN JERONIMO CHAMBI JIMENEZ', NULL, NULL, 'JIRON INAMBARI Y VISTA ALEGRE S/N', '200304', '1436658', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1436658&anexo=0', 2016),
(1548, 'AGRO INDUSTRIAL', NULL, NULL, 'JIRON CARABAYA S/N', '200306', '0546895', 1, 186, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546895&anexo=0', 2016),
(1549, 'UPINA', NULL, NULL, 'UPINA', '200307', '1024702', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1024702&anexo=0', 2016),
(1550, 'OLLACHEA', NULL, NULL, 'JIRON OLLACHEA S/N', '200308', '0568923', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0568923&anexo=0', 2016),
(1551, 'SAN GABAN', NULL, NULL, 'AVENIDA 15 DE OCTUBRE S/N', '200309', '0612374', 1, 184, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0612374&anexo=0', 2016),
(1552, 'JORGE BASADRE', NULL, NULL, 'CAMICACHI S/N', '201201', '0522490', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0522490&anexo=0', 2016),
(1553, 'MARIANO MELGAR', NULL, NULL, 'CCALLATA', '201201', '0579011', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579011&anexo=0', 2016),
(1554, 'TUPAC AMARU II', NULL, NULL, 'JIRON INDEPENDENCIA S/N', '201205', '0579045', 1, 187, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0579045&anexo=0', 2016),
(1555, 'HORACIO ZEVALLOS GAMEZ', NULL, NULL, 'JIRON PROLONGACION DEL JR ANTONIO RAYMONDI S/N', '200606', '0578625', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578625&anexo=0', 2016),
(1556, 'PUCARA', NULL, NULL, 'JIRON JUNIN S/N', '200608', '0239012', 1, 189, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239012&anexo=0', 2016),
(1557, '72', NULL, NULL, 'JIRON 2 DE MAYO', '200701', '0239707', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0239707&anexo=0', 2016),
(1558, 'AGROPECUARIO', NULL, NULL, 'QUISHUARA', '200705', '0612432', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0612432&anexo=0', 2016),
(1559, 'VILLA DE ORURILLO', NULL, NULL, 'JIRON AYACUCHO S/N', '200707', '1580091', 1, 190, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1580091&anexo=0', 2016),
(1560, 'NINANTAYA', NULL, NULL, 'NINANTAYA', '201301', '1188952', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1188952&anexo=0', 2016),
(1561, 'LOS HEROES DEL CENEPA', NULL, NULL, 'AVENIDA 13 DE MAYO S/N', '201304', '0578658', 1, 191, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578658&anexo=0', 2016),
(1562, 'AGROINDUSTRIAL', NULL, NULL, 'SANTIAGO GIRALDO', '201101', '1026293', 1, 193, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1026293&anexo=0', 2016),
(1563, 'SINA', NULL, NULL, 'CARRETERA SINA', '201105', '1026400', 1, 193, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1026400&anexo=0', 2016),
(1564, 'JOSE CARLOS MARIATEGUI', NULL, NULL, 'ISLA', '200901', '0727008', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0727008&anexo=0', 2016),
(1565, 'SANTA ROSA DE LIMA', NULL, NULL, 'JIRON CARACOTO 140', '200901', '1155464', 1, 194, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1155464&anexo=0', 2016),
(1566, 'YANAHUAYA', NULL, NULL, 'URBANIZACIÃ“N SANTA ISABEL YANAHUAYA', '200810', '0578708', 1, 195, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0578708&anexo=0', 2016),
(1567, 'CESAR VALLEJO', NULL, NULL, 'AVENIDA 28 DE JULIO 563', '201001', '1029222', 1, 196, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1029222&anexo=0', 2016),
(1568, 'SERAFIN FILOMENO', NULL, NULL, 'JIRON CORONEL SECADA 212', '210101', '0273516', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273516&anexo=0', 2016),
(1569, 'JENARO ERNESTO HERRERA TORRES', NULL, NULL, 'CARRETERA MARGINAL KM 22', '210104', '0878082', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0878082&anexo=0', 2016),
(1570, 'CORPUS CHRISTE', NULL, NULL, 'CARRETERA DEL CANAL DE RIEGO', '210702', '1352160', 1, 209, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1352160&anexo=0', 2016),
(1571, 'RAMON CASTILLA', NULL, NULL, 'JIRON PROGRESO CUADRA 6', '211002', '0548438', 1, 210, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0548438&anexo=0', 2016),
(1572, 'ALFONSO UGARTE', NULL, NULL, 'JIRON JUAN CLAUDIO CHUMBE CUADRA 2', '211003', '0537480', 1, 210, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0537480&anexo=0', 2016),
(1573, '0005 ANTONIO RAYMONDI', NULL, NULL, 'PASAJE LEONARDO SOTO S/N', '210201', '0273540', 1, 89, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273540&anexo=0', 2016),
(1574, '0600 AUGUSTO SALAZAR BONDY', NULL, NULL, 'JIRON BOLOGNESI 660', '210205', '0847392', 1, 89, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0847392&anexo=0', 2016),
(1575, 'MARTIN DE LA RIVA Y HERRERA', NULL, NULL, 'JIRON SAN MARTIN 2193', '210301', '0273565', 1, 90, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273565&anexo=0', 2016),
(1576, 'VENCEDORES DE COMAINA', NULL, NULL, 'JIRON JOSE A VARGAS 235', '210315', '0564286', 1, 92, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0564286&anexo=0', 2016),
(1577, '0013 MAXIMINO CEREZO BARREDO', NULL, NULL, 'CARRETERA FERNANDO BELAUNDE TERRY KM 1.5', '210401', '0789040', 1, 91, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0789040&anexo=0', 2016),
(1578, '444', NULL, NULL, 'JIRON LIBERTAD S/N', '210405', '1238773', 1, 91, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1238773&anexo=0', 2016),
(1579, '0713 NUEVO CHANCHAMAYO', NULL, NULL, 'CARRETERA PICOTA - NUEVO CHANCHAMAYO', '210901', '1322437', 1, 93, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1322437&anexo=0', 2016),
(1580, 'ALBERTO LEVEAU GARCIA', NULL, NULL, 'CARRETERA FERNANDO BELAUNDE TERRY', '210901', '0273748', 1, 93, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273748&anexo=0', 2016),
(1581, 'ABILIA OCAMPO', NULL, NULL, 'JIRON JULIO C ARANA 580', '210501', '0273664', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0273664&anexo=0', 2016),
(1582, '925', NULL, NULL, 'JIRON IQUITOS S/N', '210505', '1244086', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1244086&anexo=0', 2016),
(1583, 'ABRAHAN VALDELOMAR PINTO', NULL, NULL, 'JIRON SAN ISIDRO S/N', '210508', '1118504', 1, 94, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1118504&anexo=0', 2016),
(1584, 'JOSE MARIA ARGUEDAS', NULL, NULL, 'JIRON SAN MARTIN S/N', '210604', '0546846', 1, 211, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0546846&anexo=0', 2016),
(1585, '775', NULL, NULL, 'JIRON ABANCAY CUADRA 4', '210609', '0547828', 1, 211, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0547828&anexo=0', 2016),
(1586, '413', NULL, NULL, 'JIRON JORGE CHAVEZ CUADRA 8', '210801', '1080712', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1080712&anexo=0', 2016),
(1587, '0456 HORACIO ZEBALLOS GAMEZ', NULL, NULL, 'JIRON TUPAC AMARU', '210802', '1205640', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1205640&anexo=0', 2016),
(1588, 'CIRO ALEGRIA BAZAN', NULL, NULL, 'CARRETERA CARRETERA FERNANDO BELAUNDE TERRY S/N', '210802', '1332568', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1332568&anexo=0', 2016),
(1589, 'VICTOR ANDRES BELAUNDE', NULL, NULL, 'JIRON SANTA ROSA S/N', '210803', '0676031', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0676031&anexo=0', 2016),
(1590, '0778 MANUEL ROMERO SEMINARIO', NULL, NULL, 'AVENIDA AVIACION', '210805', '1080670', 1, 95, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1080670&anexo=0', 2016),
(1591, '42010 SANTISIMA NIÃ‘A MARIA', NULL, NULL, 'CALLE PIURA 136', '220101', '0614990', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0614990&anexo=0', 2016),
(1592, 'MIGUEL PRO', NULL, NULL, 'CIUDAD DE DIOS MZ G LOTE 33', '220101', '1126911', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1126911&anexo=0', 2016),
(1593, '42250 CESAR COHAILA TAMAYO', NULL, NULL, 'AVENIDA MARIANO NECOCHEA 1444', '220112', '1216464', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=1216464&anexo=0', 2016),
(1594, '42032 JOSE JOAQUIN INCLAN', NULL, NULL, 'AVENIDA PRINCIPAL S/N', '220104', '0876557', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0876557&anexo=0', 2016),
(1595, 'FEDERICO BARRETO', NULL, NULL, 'AVENIDA INDUSTRIAL 2710', '220109', '0309856', 1, 158, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0309856&anexo=0', 2016),
(1596, '042 ALIPIO ROSALES CAMACHO', NULL, NULL, 'AVENIDA ALIPIO ROSALES CAMACHO S/N', '230104', '0467126', 1, 87, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0467126&anexo=0', 2016),
(1597, 'ANTONIO RAIMONDI', NULL, NULL, 'SAN MIGUEL', '230303', '0572651', 1, 88, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0572651&anexo=0', 2016),
(1598, 'AUGUSTO SALAZAR BONDY', NULL, NULL, 'JIRON LOS ESTUDIANTES 232', '250104', '0238758', 1, 67, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0238758&anexo=0', 2016),
(1599, 'SAN FERNANDO', NULL, NULL, 'AVENIDA SAN FERNANDO MZ 0 LOTE 33', '250107', '0238683', 1, 67, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0238683&anexo=0', 2016),
(1600, 'SAN FRANCISCO DE ASIS', NULL, NULL, 'JIRON RAYMONDI S/N', '250301', '0923128', 1, 212, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0923128&anexo=0', 2016),
(1601, 'PADRE FRANCISCO ALVAREZ', NULL, NULL, 'COMUNIDAD NATIVA DE SEPAHUA', '250304', '0614370', 1, 212, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0614370&anexo=0', 2016),
(1602, 'FRANCISCO BOLOGNESI', NULL, NULL, 'JIRON LAS FLORES S/N', '250302', '0500926', 1, 212, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0500926&anexo=0', 2016),
(1603, 'PILOTO PAMPA YURAC', NULL, NULL, 'CARRETERA FEDERICO BASADRE KM 164.5', '250201', '0915355', 1, 68, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0915355&anexo=0', 2016),
(1604, 'JULIO C. TELLO', NULL, NULL, 'CARRETERA FEDERICO BASADRE KM 111', '250202', '0502518', 1, 68, NULL, 'http://escale.minedu.gob.pe/PadronWeb/info/ce?cod_mod=0502518&anexo=0', 2016),
(1605, 'MARIA AUXILIADORA', NULL, NULL, 'JIRON LAMBAYEQUE 591', NULL, '0240267', 1, NULL, NULL, NULL, 2016),
(1606, '6052 JOSE MARIA EGUREN', NULL, NULL, 'AVENIDA MANUEL DE LA FUENTE 506', NULL, '0325456', 1, NULL, NULL, NULL, 2016);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante`
--

CREATE TABLE IF NOT EXISTS `integrante` (
  `id` int(11) NOT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitacion`
--

CREATE TABLE IF NOT EXISTS `invitacion` (
  `id` int(11) NOT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `estudiante_invitado_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_invitacion` datetime DEFAULT NULL,
  `fecha_aceptacion` datetime DEFAULT NULL,
  `fecha_rechazo` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivo_especifico`
--

CREATE TABLE IF NOT EXISTS `objetivo_especifico` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivo_especifico_copia`
--

CREATE TABLE IF NOT EXISTS `objetivo_especifico_copia` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_presupuestal`
--

CREATE TABLE IF NOT EXISTS `plan_presupuestal` (
  `id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  `recurso` int(11) DEFAULT NULL,
  `como_conseguirlo` int(11) DEFAULT NULL,
  `precio_unitario` double(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double(11,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_presupuestal_copia`
--

CREATE TABLE IF NOT EXISTS `plan_presupuestal_copia` (
  `id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  `recurso` int(11) DEFAULT NULL,
  `como_conseguirlo` int(11) DEFAULT NULL,
  `precio_unitario` double(11,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double(11,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum`
--

CREATE TABLE IF NOT EXISTS `pre_forum` (
  `id` int(12) NOT NULL,
  `forum_name` char(32) NOT NULL,
  `forum_desc` text NOT NULL,
  `forum_url` char(32) NOT NULL,
  `user_id` int(12) NOT NULL,
  `created_at` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `forum_icon` char(26) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pre_forum`
--

INSERT INTO `pre_forum` (`id`, `forum_name`, `forum_desc`, `forum_url`, `user_id`, `created_at`, `status`, `forum_icon`, `proyecto_id`) VALUES
(1, 'Asuntos Públicos', 'foro de prueba', '1', 1, 0, 1, '', NULL),
(2, 'Asuntos Privados', 'foro de prueba', '2', 1, 1456178687, 1, 'default/11.png', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum_board`
--

CREATE TABLE IF NOT EXISTS `pre_forum_board` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` char(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `columns` tinyint(4) NOT NULL DEFAULT '1',
  `updated_at` int(10) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pre_forum_board`
--

INSERT INTO `pre_forum_board` (`id`, `parent_id`, `name`, `description`, `columns`, `updated_at`, `updated_by`, `forum_id`, `user_id`) VALUES
(1, 1, 'Asuntos Públicos', 'basico', 1, 1458574919, 31, 1, 1),
(2, 1, 'Asuntos Privados', 'Prueba', 1, 1459129143, 31, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum_broadcast`
--

CREATE TABLE IF NOT EXISTS `pre_forum_broadcast` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `created_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum_follow`
--

CREATE TABLE IF NOT EXISTS `pre_forum_follow` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum_post`
--

CREATE TABLE IF NOT EXISTS `pre_forum_post` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_forum_thread`
--

CREATE TABLE IF NOT EXISTS `pre_forum_thread` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `post_count` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_home_feed`
--

CREATE TABLE IF NOT EXISTS `pre_home_feed` (
  `id` int(11) NOT NULL,
  `type` char(50) NOT NULL,
  `content` text NOT NULL,
  `template` text NOT NULL,
  `comment_count` int(11) NOT NULL,
  `repost_count` int(11) NOT NULL,
  `feed_data` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_home_post`
--

CREATE TABLE IF NOT EXISTS `pre_home_post` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `tags` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `status` char(10) NOT NULL,
  `explore_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_user_data`
--

CREATE TABLE IF NOT EXISTS `pre_user_data` (
  `user_id` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `feed_count` int(11) NOT NULL,
  `following_count` int(11) NOT NULL,
  `follower_count` int(11) NOT NULL,
  `unread_notice_count` int(11) NOT NULL,
  `unread_message_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_user_follow`
--

CREATE TABLE IF NOT EXISTS `pre_user_follow` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_user_notice`
--

CREATE TABLE IF NOT EXISTS `pre_user_notice` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `source_url` varchar(255) NOT NULL COMMENT '来源链接，序列化数组',
  `created_at` int(10) NOT NULL,
  `is_read` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息提示通知';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_user_notice_type`
--

CREATE TABLE IF NOT EXISTS `pre_user_notice_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_title` varchar(255) NOT NULL,
  `type_content` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pre_user_notice_type`
--

INSERT INTO `pre_user_notice_type` (`id`, `type`, `type_title`, `type_content`) VALUES
(1, 'MENTION_ME', 'mentioned you', 'Your colleagues {name} just mentioned you in the following content: {content}.<a href="{url}" target="_blank">Go to the website>></a>'),
(2, 'NEW_COMMENT', 'comment you {title}', 'You received a new comment {content}. <a href="{url}" target="_blank">Go to the website>></a>.'),
(3, 'NEW_MESSAGE', 'You received a new message', 'You received a new private message.{content}.<a href="{url}" target="_blank">Go to the website>></a>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `resumen` varchar(2500) DEFAULT NULL,
  `objetivo_general` varchar(300) DEFAULT NULL,
  `beneficiario` varchar(2500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asunto_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_copia`
--

CREATE TABLE IF NOT EXISTS `proyecto_copia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `resumen` varchar(2500) DEFAULT NULL,
  `objetivo_general` varchar(300) DEFAULT NULL,
  `beneficiario` varchar(2500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asunto_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reflexion`
--

CREATE TABLE IF NOT EXISTS `reflexion` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reflexion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE IF NOT EXISTS `resultados` (
  `id` int(11) NOT NULL,
  `asunto_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo`
--

CREATE TABLE IF NOT EXISTS `ubigeo` (
  `id` int(11) NOT NULL,
  `department_id` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `province_id` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `district_id` varchar(6) CHARACTER SET utf8 NOT NULL,
  `department` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitud` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ubigeo`
--

INSERT INTO `ubigeo` (`id`, `department_id`, `province_id`, `district_id`, `department`, `province`, `district`, `latitude`, `longitud`) VALUES
(1, '01', '0101', '010101', 'AMAZONAS', 'CHACHAPOYAS', 'CHACHAPOYAS', 0, 0),
(2, '01', '0101', '010102', 'AMAZONAS', 'CHACHAPOYAS', 'ASUNCION', 0, 0),
(3, '01', '0101', '010103', 'AMAZONAS', 'CHACHAPOYAS', 'BALSAS', 0, 0),
(4, '01', '0101', '010104', 'AMAZONAS', 'CHACHAPOYAS', 'CHETO', 0, 0),
(5, '01', '0101', '010105', 'AMAZONAS', 'CHACHAPOYAS', 'CHILIQUIN', 0, 0),
(6, '01', '0101', '010106', 'AMAZONAS', 'CHACHAPOYAS', 'CHUQUIBAMBA', 0, 0),
(7, '01', '0101', '010107', 'AMAZONAS', 'CHACHAPOYAS', 'GRANADA', 0, 0),
(8, '01', '0101', '010108', 'AMAZONAS', 'CHACHAPOYAS', 'HUANCAS', 0, 0),
(9, '01', '0101', '010109', 'AMAZONAS', 'CHACHAPOYAS', 'LA JALCA', 0, 0),
(10, '01', '0101', '010110', 'AMAZONAS', 'CHACHAPOYAS', 'LEIMEBAMBA', 0, 0),
(11, '01', '0101', '010111', 'AMAZONAS', 'CHACHAPOYAS', 'LEVANTO', 0, 0),
(12, '01', '0101', '010112', 'AMAZONAS', 'CHACHAPOYAS', 'MAGDALENA', 0, 0),
(13, '01', '0101', '010113', 'AMAZONAS', 'CHACHAPOYAS', 'MARISCAL CASTILLA', 0, 0),
(14, '01', '0101', '010114', 'AMAZONAS', 'CHACHAPOYAS', 'MOLINOPAMPA', 0, 0),
(15, '01', '0101', '010115', 'AMAZONAS', 'CHACHAPOYAS', 'MONTEVIDEO', 0, 0),
(16, '01', '0101', '010116', 'AMAZONAS', 'CHACHAPOYAS', 'OLLEROS', 0, 0),
(17, '01', '0101', '010117', 'AMAZONAS', 'CHACHAPOYAS', 'QUINJALCA', 0, 0),
(18, '01', '0101', '010118', 'AMAZONAS', 'CHACHAPOYAS', 'SAN FRANCISCO DE DAGUAS', 0, 0),
(19, '01', '0101', '010119', 'AMAZONAS', 'CHACHAPOYAS', 'SAN ISIDRO DE MAINO', 0, 0),
(20, '01', '0101', '010120', 'AMAZONAS', 'CHACHAPOYAS', 'SOLOCO', 0, 0),
(21, '01', '0101', '010121', 'AMAZONAS', 'CHACHAPOYAS', 'SONCHE', 0, 0),
(22, '01', '0102', '010201', 'AMAZONAS', 'BAGUA', 'LA PECA', 0, 0),
(23, '01', '0102', '010202', 'AMAZONAS', 'BAGUA', 'ARAMANGO', 0, 0),
(24, '01', '0102', '010203', 'AMAZONAS', 'BAGUA', 'COPALLIN', 0, 0),
(25, '01', '0102', '010204', 'AMAZONAS', 'BAGUA', 'EL PARCO', 0, 0),
(26, '01', '0102', '010205', 'AMAZONAS', 'BAGUA', 'BAGUA', 0, 0),
(27, '01', '0102', '010206', 'AMAZONAS', 'BAGUA', 'IMAZA', 0, 0),
(28, '01', '0103', '010301', 'AMAZONAS', 'BONGARA', 'JUMBILLA', 0, 0),
(29, '01', '0103', '010302', 'AMAZONAS', 'BONGARA', 'COROSHA', 0, 0),
(30, '01', '0103', '010303', 'AMAZONAS', 'BONGARA', 'CUISPES', 0, 0),
(31, '01', '0103', '010304', 'AMAZONAS', 'BONGARA', 'CHISQUILLA', 0, 0),
(32, '01', '0103', '010305', 'AMAZONAS', 'BONGARA', 'CHURUJA', 0, 0),
(33, '01', '0103', '010306', 'AMAZONAS', 'BONGARA', 'FLORIDA', 0, 0),
(34, '01', '0103', '010307', 'AMAZONAS', 'BONGARA', 'RECTA', 0, 0),
(35, '01', '0103', '010308', 'AMAZONAS', 'BONGARA', 'SAN CARLOS', 0, 0),
(36, '01', '0103', '010309', 'AMAZONAS', 'BONGARA', 'SHIPASBAMBA', 0, 0),
(37, '01', '0103', '010310', 'AMAZONAS', 'BONGARA', 'VALERA', 0, 0),
(38, '01', '0103', '010311', 'AMAZONAS', 'BONGARA', 'YAMBRASBAMBA', 0, 0),
(39, '01', '0103', '010312', 'AMAZONAS', 'BONGARA', 'JAZAN', 0, 0),
(40, '01', '0104', '010401', 'AMAZONAS', 'LUYA', 'LAMUD', 0, 0),
(41, '01', '0104', '010402', 'AMAZONAS', 'LUYA', 'CAMPORREDONDO', 0, 0),
(42, '01', '0104', '010403', 'AMAZONAS', 'LUYA', 'COCABAMBA', 0, 0),
(43, '01', '0104', '010404', 'AMAZONAS', 'LUYA', 'COLCAMAR', 0, 0),
(44, '01', '0104', '010405', 'AMAZONAS', 'LUYA', 'CONILA', 0, 0),
(45, '01', '0104', '010406', 'AMAZONAS', 'LUYA', 'INGUILPATA', 0, 0),
(46, '01', '0104', '010407', 'AMAZONAS', 'LUYA', 'LONGUITA', 0, 0),
(47, '01', '0104', '010408', 'AMAZONAS', 'LUYA', 'LONYA CHICO', 0, 0),
(48, '01', '0104', '010409', 'AMAZONAS', 'LUYA', 'LUYA', 0, 0),
(49, '01', '0104', '010410', 'AMAZONAS', 'LUYA', 'LUYA VIEJO', 0, 0),
(50, '01', '0104', '010411', 'AMAZONAS', 'LUYA', 'MARIA', 0, 0),
(51, '01', '0104', '010412', 'AMAZONAS', 'LUYA', 'OCALLI', 0, 0),
(52, '01', '0104', '010413', 'AMAZONAS', 'LUYA', 'OCUMAL', 0, 0),
(53, '01', '0104', '010414', 'AMAZONAS', 'LUYA', 'PISUQUIA', 0, 0),
(54, '01', '0104', '010415', 'AMAZONAS', 'LUYA', 'SAN CRISTOBAL', 0, 0),
(55, '01', '0104', '010416', 'AMAZONAS', 'LUYA', 'SAN FRANCISCO DE YESO', 0, 0),
(56, '01', '0104', '010417', 'AMAZONAS', 'LUYA', 'SAN JERONIMO', 0, 0),
(57, '01', '0104', '010418', 'AMAZONAS', 'LUYA', 'SAN JUAN DE LOPECANCHA', 0, 0),
(58, '01', '0104', '010419', 'AMAZONAS', 'LUYA', 'SANTA CATALINA', 0, 0),
(59, '01', '0104', '010420', 'AMAZONAS', 'LUYA', 'SANTO TOMAS', 0, 0),
(60, '01', '0104', '010421', 'AMAZONAS', 'LUYA', 'TINGO', 0, 0),
(61, '01', '0104', '010422', 'AMAZONAS', 'LUYA', 'TRITA', 0, 0),
(62, '01', '0104', '010423', 'AMAZONAS', 'LUYA', 'PROVIDENCIA', 0, 0),
(63, '01', '0105', '010501', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SAN NICOLAS', 0, 0),
(64, '01', '0105', '010502', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'COCHAMAL', 0, 0),
(65, '01', '0105', '010503', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'CHIRIMOTO', 0, 0),
(66, '01', '0105', '010504', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'HUAMBO', 0, 0),
(67, '01', '0105', '010505', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LIMABAMBA', 0, 0),
(68, '01', '0105', '010506', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LONGAR', 0, 0),
(69, '01', '0105', '010507', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MILPUCC', 0, 0),
(70, '01', '0105', '010508', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MARISCAL BENAVIDES', 0, 0),
(71, '01', '0105', '010509', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'OMIA', 0, 0),
(72, '01', '0105', '010510', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SANTA ROSA', 0, 0),
(73, '01', '0105', '010511', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'TOTORA', 0, 0),
(74, '01', '0105', '010512', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'VISTA ALEGRE', 0, 0),
(75, '01', '0106', '010601', 'AMAZONAS', 'CONDORCANQUI', 'NIEVA', 0, 0),
(76, '01', '0106', '010602', 'AMAZONAS', 'CONDORCANQUI', 'RIO SANTIAGO', 0, 0),
(77, '01', '0106', '010603', 'AMAZONAS', 'CONDORCANQUI', 'EL CENEPA', 0, 0),
(78, '01', '0107', '010701', 'AMAZONAS', 'UTCUBAMBA', 'BAGUA GRANDE', 0, 0),
(79, '01', '0107', '010702', 'AMAZONAS', 'UTCUBAMBA', 'CAJARURO', 0, 0),
(80, '01', '0107', '010703', 'AMAZONAS', 'UTCUBAMBA', 'CUMBA', 0, 0),
(81, '01', '0107', '010704', 'AMAZONAS', 'UTCUBAMBA', 'EL MILAGRO', 0, 0),
(82, '01', '0107', '010705', 'AMAZONAS', 'UTCUBAMBA', 'JAMALCA', 0, 0),
(83, '01', '0107', '010706', 'AMAZONAS', 'UTCUBAMBA', 'LONYA GRANDE', 0, 0),
(84, '01', '0107', '010707', 'AMAZONAS', 'UTCUBAMBA', 'YAMON', 0, 0),
(85, '02', '0201', '020101', 'ANCASH', 'HUARAZ', 'HUARAZ', 0, 0),
(86, '02', '0201', '020102', 'ANCASH', 'HUARAZ', 'INDEPENDENCIA', 0, 0),
(87, '02', '0201', '020103', 'ANCASH', 'HUARAZ', 'COCHABAMBA', 0, 0),
(88, '02', '0201', '020104', 'ANCASH', 'HUARAZ', 'COLCABAMBA', 0, 0),
(89, '02', '0201', '020105', 'ANCASH', 'HUARAZ', 'HUANCHAY', 0, 0),
(90, '02', '0201', '020106', 'ANCASH', 'HUARAZ', 'JANGAS', 0, 0),
(91, '02', '0201', '020107', 'ANCASH', 'HUARAZ', 'LA LIBERTAD', 0, 0),
(92, '02', '0201', '020108', 'ANCASH', 'HUARAZ', 'OLLEROS', 0, 0),
(93, '02', '0201', '020109', 'ANCASH', 'HUARAZ', 'PAMPAS GRANDE', 0, 0),
(94, '02', '0201', '020110', 'ANCASH', 'HUARAZ', 'PARIACOTO', 0, 0),
(95, '02', '0201', '020111', 'ANCASH', 'HUARAZ', 'PIRA', 0, 0),
(96, '02', '0201', '020112', 'ANCASH', 'HUARAZ', 'TARICA', 0, 0),
(97, '02', '0202', '020201', 'ANCASH', 'AIJA', 'AIJA', 0, 0),
(98, '02', '0202', '020203', 'ANCASH', 'AIJA', 'CORIS', 0, 0),
(99, '02', '0202', '020205', 'ANCASH', 'AIJA', 'HUACLLAN', 0, 0),
(100, '02', '0202', '020206', 'ANCASH', 'AIJA', 'LA MERCED', 0, 0),
(101, '02', '0202', '020208', 'ANCASH', 'AIJA', 'SUCCHA', 0, 0),
(102, '02', '0203', '020301', 'ANCASH', 'BOLOGNESI', 'CHIQUIAN', 0, 0),
(103, '02', '0203', '020302', 'ANCASH', 'BOLOGNESI', 'ABELARDO PARDO LEZAMETA', 0, 0),
(104, '02', '0203', '020304', 'ANCASH', 'BOLOGNESI', 'AQUIA', 0, 0),
(105, '02', '0203', '020305', 'ANCASH', 'BOLOGNESI', 'CAJACAY', 0, 0),
(106, '02', '0203', '020310', 'ANCASH', 'BOLOGNESI', 'HUAYLLACAYAN', 0, 0),
(107, '02', '0203', '020311', 'ANCASH', 'BOLOGNESI', 'HUASTA', 0, 0),
(108, '02', '0203', '020313', 'ANCASH', 'BOLOGNESI', 'MANGAS', 0, 0),
(109, '02', '0203', '020315', 'ANCASH', 'BOLOGNESI', 'PACLLON', 0, 0),
(110, '02', '0203', '020317', 'ANCASH', 'BOLOGNESI', 'SAN MIGUEL DE CORPANQUI', 0, 0),
(111, '02', '0203', '020320', 'ANCASH', 'BOLOGNESI', 'TICLLOS', 0, 0),
(112, '02', '0203', '020321', 'ANCASH', 'BOLOGNESI', 'ANTONIO RAIMONDI', 0, 0),
(113, '02', '0203', '020322', 'ANCASH', 'BOLOGNESI', 'CANIS', 0, 0),
(114, '02', '0203', '020323', 'ANCASH', 'BOLOGNESI', 'COLQUIOC', 0, 0),
(115, '02', '0203', '020324', 'ANCASH', 'BOLOGNESI', 'LA PRIMAVERA', 0, 0),
(116, '02', '0203', '020325', 'ANCASH', 'BOLOGNESI', 'HUALLANCA', 0, 0),
(117, '02', '0204', '020401', 'ANCASH', 'CARHUAZ', 'CARHUAZ', 0, 0),
(118, '02', '0204', '020402', 'ANCASH', 'CARHUAZ', 'ACOPAMPA', 0, 0),
(119, '02', '0204', '020403', 'ANCASH', 'CARHUAZ', 'AMASHCA', 0, 0),
(120, '02', '0204', '020404', 'ANCASH', 'CARHUAZ', 'ANTA', 0, 0),
(121, '02', '0204', '020405', 'ANCASH', 'CARHUAZ', 'ATAQUERO', 0, 0),
(122, '02', '0204', '020406', 'ANCASH', 'CARHUAZ', 'MARCARA', 0, 0),
(123, '02', '0204', '020407', 'ANCASH', 'CARHUAZ', 'PARIAHUANCA', 0, 0),
(124, '02', '0204', '020408', 'ANCASH', 'CARHUAZ', 'SAN MIGUEL DE ACO', 0, 0),
(125, '02', '0204', '020409', 'ANCASH', 'CARHUAZ', 'SHILLA', 0, 0),
(126, '02', '0204', '020410', 'ANCASH', 'CARHUAZ', 'TINCO', 0, 0),
(127, '02', '0204', '020411', 'ANCASH', 'CARHUAZ', 'YUNGAR', 0, 0),
(128, '02', '0205', '020501', 'ANCASH', 'CASMA', 'CASMA', 0, 0),
(129, '02', '0205', '020502', 'ANCASH', 'CASMA', 'BUENA VISTA ALTA', 0, 0),
(130, '02', '0205', '020503', 'ANCASH', 'CASMA', 'COMANDANTE NOEL', 0, 0),
(131, '02', '0205', '020505', 'ANCASH', 'CASMA', 'YAUTAN', 0, 0),
(132, '02', '0206', '020601', 'ANCASH', 'CORONGO', 'CORONGO', 0, 0),
(133, '02', '0206', '020602', 'ANCASH', 'CORONGO', 'ACO', 0, 0),
(134, '02', '0206', '020603', 'ANCASH', 'CORONGO', 'BAMBAS', 0, 0),
(135, '02', '0206', '020604', 'ANCASH', 'CORONGO', 'CUSCA', 0, 0),
(136, '02', '0206', '020605', 'ANCASH', 'CORONGO', 'LA PAMPA', 0, 0),
(137, '02', '0206', '020606', 'ANCASH', 'CORONGO', 'YANAC', 0, 0),
(138, '02', '0206', '020607', 'ANCASH', 'CORONGO', 'YUPAN', 0, 0),
(139, '02', '0207', '020701', 'ANCASH', 'HUAYLAS', 'CARAZ', 0, 0),
(140, '02', '0207', '020702', 'ANCASH', 'HUAYLAS', 'HUALLANCA', 0, 0),
(141, '02', '0207', '020703', 'ANCASH', 'HUAYLAS', 'HUATA', 0, 0),
(142, '02', '0207', '020704', 'ANCASH', 'HUAYLAS', 'HUAYLAS', 0, 0),
(143, '02', '0207', '020705', 'ANCASH', 'HUAYLAS', 'MATO', 0, 0),
(144, '02', '0207', '020706', 'ANCASH', 'HUAYLAS', 'PAMPAROMAS', 0, 0),
(145, '02', '0207', '020707', 'ANCASH', 'HUAYLAS', 'PUEBLO LIBRE', 0, 0),
(146, '02', '0207', '020708', 'ANCASH', 'HUAYLAS', 'SANTA CRUZ', 0, 0),
(147, '02', '0207', '020709', 'ANCASH', 'HUAYLAS', 'YURACMARCA', 0, 0),
(148, '02', '0207', '020710', 'ANCASH', 'HUAYLAS', 'SANTO TORIBIO', 0, 0),
(149, '02', '0208', '020801', 'ANCASH', 'HUARI', 'HUARI', 0, 0),
(150, '02', '0208', '020802', 'ANCASH', 'HUARI', 'CAJAY', 0, 0),
(151, '02', '0208', '020803', 'ANCASH', 'HUARI', 'CHAVIN DE HUANTAR', 0, 0),
(152, '02', '0208', '020804', 'ANCASH', 'HUARI', 'HUACACHI', 0, 0),
(153, '02', '0208', '020805', 'ANCASH', 'HUARI', 'HUACHIS', 0, 0),
(154, '02', '0208', '020806', 'ANCASH', 'HUARI', 'HUACCHIS', 0, 0),
(155, '02', '0208', '020807', 'ANCASH', 'HUARI', 'HUANTAR', 0, 0),
(156, '02', '0208', '020808', 'ANCASH', 'HUARI', 'MASIN', 0, 0),
(157, '02', '0208', '020809', 'ANCASH', 'HUARI', 'PAUCAS', 0, 0),
(158, '02', '0208', '020810', 'ANCASH', 'HUARI', 'PONTO', 0, 0),
(159, '02', '0208', '020811', 'ANCASH', 'HUARI', 'RAHUAPAMPA', 0, 0),
(160, '02', '0208', '020812', 'ANCASH', 'HUARI', 'RAPAYAN', 0, 0),
(161, '02', '0208', '020813', 'ANCASH', 'HUARI', 'SAN MARCOS', 0, 0),
(162, '02', '0208', '020814', 'ANCASH', 'HUARI', 'SAN PEDRO DE CHANA', 0, 0),
(163, '02', '0208', '020815', 'ANCASH', 'HUARI', 'UCO', 0, 0),
(164, '02', '0208', '020816', 'ANCASH', 'HUARI', 'ANRA', 0, 0),
(165, '02', '0209', '020901', 'ANCASH', 'MARISCAL LUZURIAGA', 'PISCOBAMBA', 0, 0),
(166, '02', '0209', '020902', 'ANCASH', 'MARISCAL LUZURIAGA', 'CASCA', 0, 0),
(167, '02', '0209', '020903', 'ANCASH', 'MARISCAL LUZURIAGA', 'LUCMA', 0, 0),
(168, '02', '0209', '020904', 'ANCASH', 'MARISCAL LUZURIAGA', 'FIDEL OLIVAS ESCUDERO', 0, 0),
(169, '02', '0209', '020905', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLAMA', 0, 0),
(170, '02', '0209', '020906', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLUMPA', 0, 0),
(171, '02', '0209', '020907', 'ANCASH', 'MARISCAL LUZURIAGA', 'MUSGA', 0, 0),
(172, '02', '0209', '020908', 'ANCASH', 'MARISCAL LUZURIAGA', 'ELEAZAR GUZMAN BARRON', 0, 0),
(173, '02', '0210', '021001', 'ANCASH', 'PALLASCA', 'CABANA', 0, 0),
(174, '02', '0210', '021002', 'ANCASH', 'PALLASCA', 'BOLOGNESI', 0, 0),
(175, '02', '0210', '021003', 'ANCASH', 'PALLASCA', 'CONCHUCOS', 0, 0),
(176, '02', '0210', '021004', 'ANCASH', 'PALLASCA', 'HUACASCHUQUE', 0, 0),
(177, '02', '0210', '021005', 'ANCASH', 'PALLASCA', 'HUANDOVAL', 0, 0),
(178, '02', '0210', '021006', 'ANCASH', 'PALLASCA', 'LACABAMBA', 0, 0),
(179, '02', '0210', '021007', 'ANCASH', 'PALLASCA', 'LLAPO', 0, 0),
(180, '02', '0210', '021008', 'ANCASH', 'PALLASCA', 'PALLASCA', 0, 0),
(181, '02', '0210', '021009', 'ANCASH', 'PALLASCA', 'PAMPAS', 0, 0),
(182, '02', '0210', '021010', 'ANCASH', 'PALLASCA', 'SANTA ROSA', 0, 0),
(183, '02', '0210', '021011', 'ANCASH', 'PALLASCA', 'TAUCA', 0, 0),
(184, '02', '0211', '021101', 'ANCASH', 'POMABAMBA', 'POMABAMBA', 0, 0),
(185, '02', '0211', '021102', 'ANCASH', 'POMABAMBA', 'HUAYLLAN', 0, 0),
(186, '02', '0211', '021103', 'ANCASH', 'POMABAMBA', 'PAROBAMBA', 0, 0),
(187, '02', '0211', '021104', 'ANCASH', 'POMABAMBA', 'QUINUABAMBA', 0, 0),
(188, '02', '0212', '021201', 'ANCASH', 'RECUAY', 'RECUAY', 0, 0),
(189, '02', '0212', '021202', 'ANCASH', 'RECUAY', 'COTAPARACO', 0, 0),
(190, '02', '0212', '021203', 'ANCASH', 'RECUAY', 'HUAYLLAPAMPA', 0, 0),
(191, '02', '0212', '021204', 'ANCASH', 'RECUAY', 'MARCA', 0, 0),
(192, '02', '0212', '021205', 'ANCASH', 'RECUAY', 'PAMPAS CHICO', 0, 0),
(193, '02', '0212', '021206', 'ANCASH', 'RECUAY', 'PARARIN', 0, 0),
(194, '02', '0212', '021207', 'ANCASH', 'RECUAY', 'TAPACOCHA', 0, 0),
(195, '02', '0212', '021208', 'ANCASH', 'RECUAY', 'TICAPAMPA', 0, 0),
(196, '02', '0212', '021209', 'ANCASH', 'RECUAY', 'LLACLLIN', 0, 0),
(197, '02', '0212', '021210', 'ANCASH', 'RECUAY', 'CATAC', 0, 0),
(198, '02', '0213', '021301', 'ANCASH', 'SANTA', 'CHIMBOTE', 0, 0),
(199, '02', '0213', '021302', 'ANCASH', 'SANTA', 'CACERES DEL PERU', 0, 0),
(200, '02', '0213', '021303', 'ANCASH', 'SANTA', 'MACATE', 0, 0),
(201, '02', '0213', '021304', 'ANCASH', 'SANTA', 'MORO', 0, 0),
(202, '02', '0213', '021305', 'ANCASH', 'SANTA', 'NEPE', 0, 0),
(203, '02', '0213', '021306', 'ANCASH', 'SANTA', 'SAMANCO', 0, 0),
(204, '02', '0213', '021307', 'ANCASH', 'SANTA', 'SANTA', 0, 0),
(205, '02', '0213', '021308', 'ANCASH', 'SANTA', 'COISHCO', 0, 0),
(206, '02', '0213', '021309', 'ANCASH', 'SANTA', 'NUEVO CHIMBOTE', 0, 0),
(207, '02', '0214', '021401', 'ANCASH', 'SIHUAS', 'SIHUAS', 0, 0),
(208, '02', '0214', '021402', 'ANCASH', 'SIHUAS', 'ALFONSO UGARTE', 0, 0),
(209, '02', '0214', '021403', 'ANCASH', 'SIHUAS', 'CHINGALPO', 0, 0),
(210, '02', '0214', '021404', 'ANCASH', 'SIHUAS', 'HUAYLLABAMBA', 0, 0),
(211, '02', '0214', '021405', 'ANCASH', 'SIHUAS', 'QUICHES', 0, 0),
(212, '02', '0214', '021406', 'ANCASH', 'SIHUAS', 'SICSIBAMBA', 0, 0),
(213, '02', '0214', '021407', 'ANCASH', 'SIHUAS', 'ACOBAMBA', 0, 0),
(214, '02', '0214', '021408', 'ANCASH', 'SIHUAS', 'CASHAPAMPA', 0, 0),
(215, '02', '0214', '021409', 'ANCASH', 'SIHUAS', 'RAGASH', 0, 0),
(216, '02', '0214', '021410', 'ANCASH', 'SIHUAS', 'SAN JUAN', 0, 0),
(217, '02', '0215', '021501', 'ANCASH', 'YUNGAY', 'YUNGAY', 0, 0),
(218, '02', '0215', '021502', 'ANCASH', 'YUNGAY', 'CASCAPARA', 0, 0),
(219, '02', '0215', '021503', 'ANCASH', 'YUNGAY', 'MANCOS', 0, 0),
(220, '02', '0215', '021504', 'ANCASH', 'YUNGAY', 'MATACOTO', 0, 0),
(221, '02', '0215', '021505', 'ANCASH', 'YUNGAY', 'QUILLO', 0, 0),
(222, '02', '0215', '021506', 'ANCASH', 'YUNGAY', 'RANRAHIRCA', 0, 0),
(223, '02', '0215', '021507', 'ANCASH', 'YUNGAY', 'SHUPLUY', 0, 0),
(224, '02', '0215', '021508', 'ANCASH', 'YUNGAY', 'YANAMA', 0, 0),
(225, '02', '0216', '021601', 'ANCASH', 'ANTONIO RAIMONDI', 'LLAMELLIN', 0, 0),
(226, '02', '0216', '021602', 'ANCASH', 'ANTONIO RAIMONDI', 'ACZO', 0, 0),
(227, '02', '0216', '021603', 'ANCASH', 'ANTONIO RAIMONDI', 'CHACCHO', 0, 0),
(228, '02', '0216', '021604', 'ANCASH', 'ANTONIO RAIMONDI', 'CHINGAS', 0, 0),
(229, '02', '0216', '021605', 'ANCASH', 'ANTONIO RAIMONDI', 'MIRGAS', 0, 0),
(230, '02', '0216', '021606', 'ANCASH', 'ANTONIO RAIMONDI', 'SAN JUAN DE RONTOY', 0, 0),
(231, '02', '0217', '021701', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN LUIS', 0, 0),
(232, '02', '0217', '021702', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'YAUYA', 0, 0),
(233, '02', '0217', '021703', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN NICOLAS', 0, 0),
(234, '02', '0218', '021801', 'ANCASH', 'ASUNCION', 'CHACAS', 0, 0),
(235, '02', '0218', '021802', 'ANCASH', 'ASUNCION', 'ACOCHACA', 0, 0),
(236, '02', '0219', '021901', 'ANCASH', 'HUARMEY', 'HUARMEY', 0, 0),
(237, '02', '0219', '021902', 'ANCASH', 'HUARMEY', 'COCHAPETI', 0, 0),
(238, '02', '0219', '021903', 'ANCASH', 'HUARMEY', 'HUAYAN', 0, 0),
(239, '02', '0219', '021904', 'ANCASH', 'HUARMEY', 'MALVAS', 0, 0),
(240, '02', '0219', '021905', 'ANCASH', 'HUARMEY', 'CULEBRAS', 0, 0),
(241, '02', '0220', '022001', 'ANCASH', 'OCROS', 'ACAS', 0, 0),
(242, '02', '0220', '022002', 'ANCASH', 'OCROS', 'CAJAMARQUILLA', 0, 0),
(243, '02', '0220', '022003', 'ANCASH', 'OCROS', 'CARHUAPAMPA', 0, 0),
(244, '02', '0220', '022004', 'ANCASH', 'OCROS', 'COCHAS', 0, 0),
(245, '02', '0220', '022005', 'ANCASH', 'OCROS', 'CONGAS', 0, 0),
(246, '02', '0220', '022006', 'ANCASH', 'OCROS', 'LLIPA', 0, 0),
(247, '02', '0220', '022007', 'ANCASH', 'OCROS', 'OCROS', 0, 0),
(248, '02', '0220', '022008', 'ANCASH', 'OCROS', 'SAN CRISTOBAL DE RAJAN', 0, 0),
(249, '02', '0220', '022009', 'ANCASH', 'OCROS', 'SAN PEDRO', 0, 0),
(250, '02', '0220', '022010', 'ANCASH', 'OCROS', 'SANTIAGO DE CHILCAS', 0, 0),
(251, '03', '0301', '030101', 'APURIMAC', 'ABANCAY', 'ABANCAY', 0, 0),
(252, '03', '0301', '030102', 'APURIMAC', 'ABANCAY', 'CIRCA', 0, 0),
(253, '03', '0301', '030103', 'APURIMAC', 'ABANCAY', 'CURAHUASI', 0, 0),
(254, '03', '0301', '030104', 'APURIMAC', 'ABANCAY', 'CHACOCHE', 0, 0),
(255, '03', '0301', '030105', 'APURIMAC', 'ABANCAY', 'HUANIPACA', 0, 0),
(256, '03', '0301', '030106', 'APURIMAC', 'ABANCAY', 'LAMBRAMA', 0, 0),
(257, '03', '0301', '030107', 'APURIMAC', 'ABANCAY', 'PICHIRHUA', 0, 0),
(258, '03', '0301', '030108', 'APURIMAC', 'ABANCAY', 'SAN PEDRO DE CACHORA', 0, 0),
(259, '03', '0301', '030109', 'APURIMAC', 'ABANCAY', 'TAMBURCO', 0, 0),
(260, '03', '0302', '030201', 'APURIMAC', 'AYMARAES', 'CHALHUANCA', 0, 0),
(261, '03', '0302', '030202', 'APURIMAC', 'AYMARAES', 'CAPAYA', 0, 0),
(262, '03', '0302', '030203', 'APURIMAC', 'AYMARAES', 'CARAYBAMBA', 0, 0),
(263, '03', '0302', '030204', 'APURIMAC', 'AYMARAES', 'COLCABAMBA', 0, 0),
(264, '03', '0302', '030205', 'APURIMAC', 'AYMARAES', 'COTARUSE', 0, 0),
(265, '03', '0302', '030206', 'APURIMAC', 'AYMARAES', 'CHAPIMARCA', 0, 0),
(266, '03', '0302', '030207', 'APURIMAC', 'AYMARAES', 'HUAYLLO', 0, 0),
(267, '03', '0302', '030208', 'APURIMAC', 'AYMARAES', 'LUCRE', 0, 0),
(268, '03', '0302', '030209', 'APURIMAC', 'AYMARAES', 'POCOHUANCA', 0, 0),
(269, '03', '0302', '030210', 'APURIMAC', 'AYMARAES', 'SA', 0, 0),
(270, '03', '0302', '030211', 'APURIMAC', 'AYMARAES', 'SORAYA', 0, 0),
(271, '03', '0302', '030212', 'APURIMAC', 'AYMARAES', 'TAPAIRIHUA', 0, 0),
(272, '03', '0302', '030213', 'APURIMAC', 'AYMARAES', 'TINTAY', 0, 0),
(273, '03', '0302', '030214', 'APURIMAC', 'AYMARAES', 'TORAYA', 0, 0),
(274, '03', '0302', '030215', 'APURIMAC', 'AYMARAES', 'YANACA', 0, 0),
(275, '03', '0302', '030216', 'APURIMAC', 'AYMARAES', 'SAN JUAN DE CHAC', 0, 0),
(276, '03', '0302', '030217', 'APURIMAC', 'AYMARAES', 'JUSTO APU SAHUARAURA', 0, 0),
(277, '03', '0303', '030301', 'APURIMAC', 'ANDAHUAYLAS', 'ANDAHUAYLAS', 0, 0),
(278, '03', '0303', '030302', 'APURIMAC', 'ANDAHUAYLAS', 'ANDARAPA', 0, 0),
(279, '03', '0303', '030303', 'APURIMAC', 'ANDAHUAYLAS', 'CHIARA', 0, 0),
(280, '03', '0303', '030304', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAMA', 0, 0),
(281, '03', '0303', '030305', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAY', 0, 0),
(282, '03', '0303', '030306', 'APURIMAC', 'ANDAHUAYLAS', 'KISHUARA', 0, 0),
(283, '03', '0303', '030307', 'APURIMAC', 'ANDAHUAYLAS', 'PACOBAMBA', 0, 0),
(284, '03', '0303', '030308', 'APURIMAC', 'ANDAHUAYLAS', 'PAMPACHIRI', 0, 0),
(285, '03', '0303', '030309', 'APURIMAC', 'ANDAHUAYLAS', 'SAN ANTONIO DE CACHI', 0, 0),
(286, '03', '0303', '030310', 'APURIMAC', 'ANDAHUAYLAS', 'SAN JERONIMO', 0, 0),
(287, '03', '0303', '030311', 'APURIMAC', 'ANDAHUAYLAS', 'TALAVERA', 0, 0),
(288, '03', '0303', '030312', 'APURIMAC', 'ANDAHUAYLAS', 'TURPO', 0, 0),
(289, '03', '0303', '030313', 'APURIMAC', 'ANDAHUAYLAS', 'PACUCHA', 0, 0),
(290, '03', '0303', '030314', 'APURIMAC', 'ANDAHUAYLAS', 'POMACOCHA', 0, 0),
(291, '03', '0303', '030315', 'APURIMAC', 'ANDAHUAYLAS', 'SANTA MARIA DE CHICMO', 0, 0),
(292, '03', '0303', '030316', 'APURIMAC', 'ANDAHUAYLAS', 'TUMAY HUARACA', 0, 0),
(293, '03', '0303', '030317', 'APURIMAC', 'ANDAHUAYLAS', 'HUAYANA', 0, 0),
(294, '03', '0303', '030318', 'APURIMAC', 'ANDAHUAYLAS', 'SAN MIGUEL DE CHACCRAMPA', 0, 0),
(295, '03', '0303', '030319', 'APURIMAC', 'ANDAHUAYLAS', 'KAQUIABAMBA', 0, 0),
(296, '03', '0304', '030401', 'APURIMAC', 'ANTABAMBA', 'ANTABAMBA', 0, 0),
(297, '03', '0304', '030402', 'APURIMAC', 'ANTABAMBA', 'EL ORO', 0, 0),
(298, '03', '0304', '030403', 'APURIMAC', 'ANTABAMBA', 'HUAQUIRCA', 0, 0),
(299, '03', '0304', '030404', 'APURIMAC', 'ANTABAMBA', 'JUAN ESPINOZA MEDRANO', 0, 0),
(300, '03', '0304', '030405', 'APURIMAC', 'ANTABAMBA', 'OROPESA', 0, 0),
(301, '03', '0304', '030406', 'APURIMAC', 'ANTABAMBA', 'PACHACONAS', 0, 0),
(302, '03', '0304', '030407', 'APURIMAC', 'ANTABAMBA', 'SABAINO', 0, 0),
(303, '03', '0305', '030501', 'APURIMAC', 'COTABAMBAS', 'TAMBOBAMBA', 0, 0),
(304, '03', '0305', '030502', 'APURIMAC', 'COTABAMBAS', 'COYLLURQUI', 0, 0),
(305, '03', '0305', '030503', 'APURIMAC', 'COTABAMBAS', 'COTABAMBAS', 0, 0),
(306, '03', '0305', '030504', 'APURIMAC', 'COTABAMBAS', 'HAQUIRA', 0, 0),
(307, '03', '0305', '030505', 'APURIMAC', 'COTABAMBAS', 'MARA', 0, 0),
(308, '03', '0305', '030506', 'APURIMAC', 'COTABAMBAS', 'CHALLHUAHUACHO', 0, 0),
(309, '03', '0306', '030601', 'APURIMAC', 'GRAU', 'CHUQUIBAMBILLA', 0, 0),
(310, '03', '0306', '030602', 'APURIMAC', 'GRAU', 'CURPAHUASI', 0, 0),
(311, '03', '0306', '030603', 'APURIMAC', 'GRAU', 'HUAILLATI', 0, 0),
(312, '03', '0306', '030604', 'APURIMAC', 'GRAU', 'MAMARA', 0, 0),
(313, '03', '0306', '030605', 'APURIMAC', 'GRAU', 'MARISCAL GAMARRA', 0, 0),
(314, '03', '0306', '030606', 'APURIMAC', 'GRAU', 'MICAELA BASTIDAS', 0, 0),
(315, '03', '0306', '030607', 'APURIMAC', 'GRAU', 'PROGRESO', 0, 0),
(316, '03', '0306', '030608', 'APURIMAC', 'GRAU', 'PATAYPAMPA', 0, 0),
(317, '03', '0306', '030609', 'APURIMAC', 'GRAU', 'SAN ANTONIO', 0, 0),
(318, '03', '0306', '030610', 'APURIMAC', 'GRAU', 'TURPAY', 0, 0),
(319, '03', '0306', '030611', 'APURIMAC', 'GRAU', 'VILCABAMBA', 0, 0),
(320, '03', '0306', '030612', 'APURIMAC', 'GRAU', 'VIRUNDO', 0, 0),
(321, '03', '0306', '030613', 'APURIMAC', 'GRAU', 'SANTA ROSA', 0, 0),
(322, '03', '0306', '030614', 'APURIMAC', 'GRAU', 'CURASCO', 0, 0),
(323, '03', '0307', '030701', 'APURIMAC', 'CHINCHEROS', 'CHINCHEROS', 0, 0),
(324, '03', '0307', '030702', 'APURIMAC', 'CHINCHEROS', 'ONGOY', 0, 0),
(325, '03', '0307', '030703', 'APURIMAC', 'CHINCHEROS', 'OCOBAMBA', 0, 0),
(326, '03', '0307', '030704', 'APURIMAC', 'CHINCHEROS', 'COCHARCAS', 0, 0),
(327, '03', '0307', '030705', 'APURIMAC', 'CHINCHEROS', 'ANCO HUALLO', 0, 0),
(328, '03', '0307', '030706', 'APURIMAC', 'CHINCHEROS', 'HUACCANA', 0, 0),
(329, '03', '0307', '030707', 'APURIMAC', 'CHINCHEROS', 'URANMARCA', 0, 0),
(330, '03', '0307', '030708', 'APURIMAC', 'CHINCHEROS', 'RANRACANCHA', 0, 0),
(331, '04', '0401', '040101', 'AREQUIPA', 'AREQUIPA', 'AREQUIPA', 0, 0),
(332, '04', '0401', '040102', 'AREQUIPA', 'AREQUIPA', 'CAYMA', 0, 0),
(333, '04', '0401', '040103', 'AREQUIPA', 'AREQUIPA', 'CERRO COLORADO', 0, 0),
(334, '04', '0401', '040104', 'AREQUIPA', 'AREQUIPA', 'CHARACATO', 0, 0),
(335, '04', '0401', '040105', 'AREQUIPA', 'AREQUIPA', 'CHIGUATA', 0, 0),
(336, '04', '0401', '040106', 'AREQUIPA', 'AREQUIPA', 'LA JOYA', 0, 0),
(337, '04', '0401', '040107', 'AREQUIPA', 'AREQUIPA', 'MIRAFLORES', 0, 0),
(338, '04', '0401', '040108', 'AREQUIPA', 'AREQUIPA', 'MOLLEBAYA', 0, 0),
(339, '04', '0401', '040109', 'AREQUIPA', 'AREQUIPA', 'PAUCARPATA', 0, 0),
(340, '04', '0401', '040110', 'AREQUIPA', 'AREQUIPA', 'POCSI', 0, 0),
(341, '04', '0401', '040111', 'AREQUIPA', 'AREQUIPA', 'POLOBAYA', 0, 0),
(342, '04', '0401', '040112', 'AREQUIPA', 'AREQUIPA', 'QUEQUE', 0, 0),
(343, '04', '0401', '040113', 'AREQUIPA', 'AREQUIPA', 'SABANDIA', 0, 0),
(344, '04', '0401', '040114', 'AREQUIPA', 'AREQUIPA', 'SACHACA', 0, 0),
(345, '04', '0401', '040115', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE SIGUAS', 0, 0),
(346, '04', '0401', '040116', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE TARUCANI', 0, 0),
(347, '04', '0401', '040117', 'AREQUIPA', 'AREQUIPA', 'SANTA ISABEL DE SIGUAS', 0, 0),
(348, '04', '0401', '040118', 'AREQUIPA', 'AREQUIPA', 'SANTA RITA DE SIHUAS', 0, 0),
(349, '04', '0401', '040119', 'AREQUIPA', 'AREQUIPA', 'SOCABAYA', 0, 0),
(350, '04', '0401', '040120', 'AREQUIPA', 'AREQUIPA', 'TIABAYA', 0, 0),
(351, '04', '0401', '040121', 'AREQUIPA', 'AREQUIPA', 'UCHUMAYO', 0, 0),
(352, '04', '0401', '040122', 'AREQUIPA', 'AREQUIPA', 'VITOR', 0, 0),
(353, '04', '0401', '040123', 'AREQUIPA', 'AREQUIPA', 'YANAHUARA', 0, 0),
(354, '04', '0401', '040124', 'AREQUIPA', 'AREQUIPA', 'YARABAMBA', 0, 0),
(355, '04', '0401', '040125', 'AREQUIPA', 'AREQUIPA', 'YURA', 0, 0),
(356, '04', '0401', '040126', 'AREQUIPA', 'AREQUIPA', 'MARIANO MELGAR', 0, 0),
(357, '04', '0401', '040127', 'AREQUIPA', 'AREQUIPA', 'JACOBO HUNTER', 0, 0),
(358, '04', '0401', '040128', 'AREQUIPA', 'AREQUIPA', 'ALTO SELVA ALEGRE', 0, 0),
(359, '04', '0401', '040129', 'AREQUIPA', 'AREQUIPA', 'JOSE LUIS BUSTAMANTE Y RIVERO', 0, 0),
(360, '04', '0402', '040201', 'AREQUIPA', 'CAYLLOMA', 'CHIVAY', 0, 0),
(361, '04', '0402', '040202', 'AREQUIPA', 'CAYLLOMA', 'ACHOMA', 0, 0),
(362, '04', '0402', '040203', 'AREQUIPA', 'CAYLLOMA', 'CABANACONDE', 0, 0),
(363, '04', '0402', '040204', 'AREQUIPA', 'CAYLLOMA', 'CAYLLOMA', 0, 0),
(364, '04', '0402', '040205', 'AREQUIPA', 'CAYLLOMA', 'CALLALLI', 0, 0),
(365, '04', '0402', '040206', 'AREQUIPA', 'CAYLLOMA', 'COPORAQUE', 0, 0),
(366, '04', '0402', '040207', 'AREQUIPA', 'CAYLLOMA', 'HUAMBO', 0, 0),
(367, '04', '0402', '040208', 'AREQUIPA', 'CAYLLOMA', 'HUANCA', 0, 0),
(368, '04', '0402', '040209', 'AREQUIPA', 'CAYLLOMA', 'ICHUPAMPA', 0, 0),
(369, '04', '0402', '040210', 'AREQUIPA', 'CAYLLOMA', 'LARI', 0, 0),
(370, '04', '0402', '040211', 'AREQUIPA', 'CAYLLOMA', 'LLUTA', 0, 0),
(371, '04', '0402', '040212', 'AREQUIPA', 'CAYLLOMA', 'MACA', 0, 0),
(372, '04', '0402', '040213', 'AREQUIPA', 'CAYLLOMA', 'MADRIGAL', 0, 0),
(373, '04', '0402', '040214', 'AREQUIPA', 'CAYLLOMA', 'SAN ANTONIO DE CHUCA', 0, 0),
(374, '04', '0402', '040215', 'AREQUIPA', 'CAYLLOMA', 'SIBAYO', 0, 0),
(375, '04', '0402', '040216', 'AREQUIPA', 'CAYLLOMA', 'TAPAY', 0, 0),
(376, '04', '0402', '040217', 'AREQUIPA', 'CAYLLOMA', 'TISCO', 0, 0),
(377, '04', '0402', '040218', 'AREQUIPA', 'CAYLLOMA', 'TUTI', 0, 0),
(378, '04', '0402', '040219', 'AREQUIPA', 'CAYLLOMA', 'YANQUE', 0, 0),
(379, '04', '0402', '040220', 'AREQUIPA', 'CAYLLOMA', 'MAJES', 0, 0),
(380, '04', '0403', '040301', 'AREQUIPA', 'CAMANA', 'CAMANA', 0, 0),
(381, '04', '0403', '040302', 'AREQUIPA', 'CAMANA', 'JOSE MARIA QUIMPER', 0, 0),
(382, '04', '0403', '040303', 'AREQUIPA', 'CAMANA', 'MARIANO NICOLAS VALCARCEL', 0, 0),
(383, '04', '0403', '040304', 'AREQUIPA', 'CAMANA', 'MARISCAL CACERES', 0, 0),
(384, '04', '0403', '040305', 'AREQUIPA', 'CAMANA', 'NICOLAS DE PIEROLA', 0, 0),
(385, '04', '0403', '040306', 'AREQUIPA', 'CAMANA', 'OCO', 0, 0),
(386, '04', '0403', '040307', 'AREQUIPA', 'CAMANA', 'QUILCA', 0, 0),
(387, '04', '0403', '040308', 'AREQUIPA', 'CAMANA', 'SAMUEL PASTOR', 0, 0),
(388, '04', '0404', '040401', 'AREQUIPA', 'CARAVELI', 'CARAVELI', 0, 0),
(389, '04', '0404', '040402', 'AREQUIPA', 'CARAVELI', 'ACARI', 0, 0),
(390, '04', '0404', '040403', 'AREQUIPA', 'CARAVELI', 'ATICO', 0, 0),
(391, '04', '0404', '040404', 'AREQUIPA', 'CARAVELI', 'ATIQUIPA', 0, 0),
(392, '04', '0404', '040405', 'AREQUIPA', 'CARAVELI', 'BELLA UNION', 0, 0),
(393, '04', '0404', '040406', 'AREQUIPA', 'CARAVELI', 'CAHUACHO', 0, 0),
(394, '04', '0404', '040407', 'AREQUIPA', 'CARAVELI', 'CHALA', 0, 0),
(395, '04', '0404', '040408', 'AREQUIPA', 'CARAVELI', 'CHAPARRA', 0, 0),
(396, '04', '0404', '040409', 'AREQUIPA', 'CARAVELI', 'HUANUHUANU', 0, 0),
(397, '04', '0404', '040410', 'AREQUIPA', 'CARAVELI', 'JAQUI', 0, 0),
(398, '04', '0404', '040411', 'AREQUIPA', 'CARAVELI', 'LOMAS', 0, 0),
(399, '04', '0404', '040412', 'AREQUIPA', 'CARAVELI', 'QUICACHA', 0, 0),
(400, '04', '0404', '040413', 'AREQUIPA', 'CARAVELI', 'YAUCA', 0, 0),
(401, '04', '0405', '040501', 'AREQUIPA', 'CASTILLA', 'APLAO', 0, 0),
(402, '04', '0405', '040502', 'AREQUIPA', 'CASTILLA', 'ANDAGUA', 0, 0),
(403, '04', '0405', '040503', 'AREQUIPA', 'CASTILLA', 'AYO', 0, 0),
(404, '04', '0405', '040504', 'AREQUIPA', 'CASTILLA', 'CHACHAS', 0, 0),
(405, '04', '0405', '040505', 'AREQUIPA', 'CASTILLA', 'CHILCAYMARCA', 0, 0),
(406, '04', '0405', '040506', 'AREQUIPA', 'CASTILLA', 'CHOCO', 0, 0),
(407, '04', '0405', '040507', 'AREQUIPA', 'CASTILLA', 'HUANCARQUI', 0, 0),
(408, '04', '0405', '040508', 'AREQUIPA', 'CASTILLA', 'MACHAGUAY', 0, 0),
(409, '04', '0405', '040509', 'AREQUIPA', 'CASTILLA', 'ORCOPAMPA', 0, 0),
(410, '04', '0405', '040510', 'AREQUIPA', 'CASTILLA', 'PAMPACOLCA', 0, 0),
(411, '04', '0405', '040511', 'AREQUIPA', 'CASTILLA', 'TIPAN', 0, 0),
(412, '04', '0405', '040512', 'AREQUIPA', 'CASTILLA', 'URACA', 0, 0),
(413, '04', '0405', '040513', 'AREQUIPA', 'CASTILLA', 'U', 0, 0),
(414, '04', '0405', '040514', 'AREQUIPA', 'CASTILLA', 'VIRACO', 0, 0),
(415, '04', '0406', '040601', 'AREQUIPA', 'CONDESUYOS', 'CHUQUIBAMBA', 0, 0),
(416, '04', '0406', '040602', 'AREQUIPA', 'CONDESUYOS', 'ANDARAY', 0, 0),
(417, '04', '0406', '040603', 'AREQUIPA', 'CONDESUYOS', 'CAYARANI', 0, 0),
(418, '04', '0406', '040604', 'AREQUIPA', 'CONDESUYOS', 'CHICHAS', 0, 0),
(419, '04', '0406', '040605', 'AREQUIPA', 'CONDESUYOS', 'IRAY', 0, 0),
(420, '04', '0406', '040606', 'AREQUIPA', 'CONDESUYOS', 'SALAMANCA', 0, 0),
(421, '04', '0406', '040607', 'AREQUIPA', 'CONDESUYOS', 'YANAQUIHUA', 0, 0),
(422, '04', '0406', '040608', 'AREQUIPA', 'CONDESUYOS', 'RIO GRANDE', 0, 0),
(423, '04', '0407', '040701', 'AREQUIPA', 'ISLAY', 'MOLLENDO', 0, 0),
(424, '04', '0407', '040702', 'AREQUIPA', 'ISLAY', 'COCACHACRA', 0, 0),
(425, '04', '0407', '040703', 'AREQUIPA', 'ISLAY', 'DEAN VALDIVIA', 0, 0),
(426, '04', '0407', '040704', 'AREQUIPA', 'ISLAY', 'ISLAY', 0, 0),
(427, '04', '0407', '040705', 'AREQUIPA', 'ISLAY', 'MEJIA', 0, 0),
(428, '04', '0407', '040706', 'AREQUIPA', 'ISLAY', 'PUNTA DE BOMBON', 0, 0),
(429, '04', '0408', '040801', 'AREQUIPA', 'LA UNION', 'COTAHUASI', 0, 0),
(430, '04', '0408', '040802', 'AREQUIPA', 'LA UNION', 'ALCA', 0, 0),
(431, '04', '0408', '040803', 'AREQUIPA', 'LA UNION', 'CHARCANA', 0, 0),
(432, '04', '0408', '040804', 'AREQUIPA', 'LA UNION', 'HUAYNACOTAS', 0, 0),
(433, '04', '0408', '040805', 'AREQUIPA', 'LA UNION', 'PAMPAMARCA', 0, 0),
(434, '04', '0408', '040806', 'AREQUIPA', 'LA UNION', 'PUYCA', 0, 0),
(435, '04', '0408', '040807', 'AREQUIPA', 'LA UNION', 'QUECHUALLA', 0, 0),
(436, '04', '0408', '040808', 'AREQUIPA', 'LA UNION', 'SAYLA', 0, 0),
(437, '04', '0408', '040809', 'AREQUIPA', 'LA UNION', 'TAURIA', 0, 0),
(438, '04', '0408', '040810', 'AREQUIPA', 'LA UNION', 'TOMEPAMPA', 0, 0),
(439, '04', '0408', '040811', 'AREQUIPA', 'LA UNION', 'TORO', 0, 0),
(440, '05', '0501', '050101', 'AYACUCHO', 'HUAMANGA', 'AYACUCHO', 0, 0),
(441, '05', '0501', '050102', 'AYACUCHO', 'HUAMANGA', 'ACOS VINCHOS', 0, 0),
(442, '05', '0501', '050103', 'AYACUCHO', 'HUAMANGA', 'CARMEN ALTO', 0, 0),
(443, '05', '0501', '050104', 'AYACUCHO', 'HUAMANGA', 'CHIARA', 0, 0),
(444, '05', '0501', '050105', 'AYACUCHO', 'HUAMANGA', 'QUINUA', 0, 0),
(445, '05', '0501', '050106', 'AYACUCHO', 'HUAMANGA', 'SAN JOSE DE TICLLAS', 0, 0),
(446, '05', '0501', '050107', 'AYACUCHO', 'HUAMANGA', 'SAN JUAN BAUTISTA', 0, 0),
(447, '05', '0501', '050108', 'AYACUCHO', 'HUAMANGA', 'SANTIAGO DE PISCHA', 0, 0),
(448, '05', '0501', '050109', 'AYACUCHO', 'HUAMANGA', 'VINCHOS', 0, 0),
(449, '05', '0501', '050110', 'AYACUCHO', 'HUAMANGA', 'TAMBILLO', 0, 0),
(450, '05', '0501', '050111', 'AYACUCHO', 'HUAMANGA', 'ACOCRO', 0, 0),
(451, '05', '0501', '050112', 'AYACUCHO', 'HUAMANGA', 'SOCOS', 0, 0),
(452, '05', '0501', '050113', 'AYACUCHO', 'HUAMANGA', 'OCROS', 0, 0),
(453, '05', '0501', '050114', 'AYACUCHO', 'HUAMANGA', 'PACAYCASA', 0, 0),
(454, '05', '0501', '050115', 'AYACUCHO', 'HUAMANGA', 'JESUS NAZARENO', 0, 0),
(455, '05', '0502', '050201', 'AYACUCHO', 'CANGALLO', 'CANGALLO', 0, 0),
(456, '05', '0502', '050204', 'AYACUCHO', 'CANGALLO', 'CHUSCHI', 0, 0),
(457, '05', '0502', '050206', 'AYACUCHO', 'CANGALLO', 'LOS MOROCHUCOS', 0, 0),
(458, '05', '0502', '050207', 'AYACUCHO', 'CANGALLO', 'PARAS', 0, 0),
(459, '05', '0502', '050208', 'AYACUCHO', 'CANGALLO', 'TOTOS', 0, 0),
(460, '05', '0502', '050211', 'AYACUCHO', 'CANGALLO', 'MARIA PARADO DE BELLIDO', 0, 0),
(461, '05', '0503', '050301', 'AYACUCHO', 'HUANTA', 'HUANTA', 0, 0),
(462, '05', '0503', '050302', 'AYACUCHO', 'HUANTA', 'AYAHUANCO', 0, 0),
(463, '05', '0503', '050303', 'AYACUCHO', 'HUANTA', 'HUAMANGUILLA', 0, 0),
(464, '05', '0503', '050304', 'AYACUCHO', 'HUANTA', 'IGUAIN', 0, 0),
(465, '05', '0503', '050305', 'AYACUCHO', 'HUANTA', 'LURICOCHA', 0, 0),
(466, '05', '0503', '050307', 'AYACUCHO', 'HUANTA', 'SANTILLANA', 0, 0),
(467, '05', '0503', '050308', 'AYACUCHO', 'HUANTA', 'SIVIA', 0, 0),
(468, '05', '0503', '050309', 'AYACUCHO', 'HUANTA', 'LLOCHEGUA', 0, 0),
(469, '05', '0504', '050401', 'AYACUCHO', 'LA MAR', 'SAN MIGUEL', 0, 0),
(470, '05', '0504', '050402', 'AYACUCHO', 'LA MAR', 'ANCO', 0, 0),
(471, '05', '0504', '050403', 'AYACUCHO', 'LA MAR', 'AYNA', 0, 0),
(472, '05', '0504', '050404', 'AYACUCHO', 'LA MAR', 'CHILCAS', 0, 0),
(473, '05', '0504', '050405', 'AYACUCHO', 'LA MAR', 'CHUNGUI', 0, 0),
(474, '05', '0504', '050406', 'AYACUCHO', 'LA MAR', 'TAMBO', 0, 0),
(475, '05', '0504', '050407', 'AYACUCHO', 'LA MAR', 'LUIS CARRANZA', 0, 0),
(476, '05', '0504', '050408', 'AYACUCHO', 'LA MAR', 'SANTA ROSA', 0, 0),
(477, '05', '0504', '050409', 'AYACUCHO', 'LA MAR', 'SAMUGARI', 0, 0),
(478, '05', '0505', '050501', 'AYACUCHO', 'LUCANAS', 'PUQUIO', 0, 0),
(479, '05', '0505', '050502', 'AYACUCHO', 'LUCANAS', 'AUCARA', 0, 0),
(480, '05', '0505', '050503', 'AYACUCHO', 'LUCANAS', 'CABANA', 0, 0),
(481, '05', '0505', '050504', 'AYACUCHO', 'LUCANAS', 'CARMEN SALCEDO', 0, 0),
(482, '05', '0505', '050506', 'AYACUCHO', 'LUCANAS', 'CHAVI', 0, 0),
(483, '05', '0505', '050508', 'AYACUCHO', 'LUCANAS', 'CHIPAO', 0, 0),
(484, '05', '0505', '050510', 'AYACUCHO', 'LUCANAS', 'HUAC-HUAS', 0, 0),
(485, '05', '0505', '050511', 'AYACUCHO', 'LUCANAS', 'LARAMATE', 0, 0),
(486, '05', '0505', '050512', 'AYACUCHO', 'LUCANAS', 'LEONCIO PRADO', 0, 0),
(487, '05', '0505', '050513', 'AYACUCHO', 'LUCANAS', 'LUCANAS', 0, 0),
(488, '05', '0505', '050514', 'AYACUCHO', 'LUCANAS', 'LLAUTA', 0, 0),
(489, '05', '0505', '050516', 'AYACUCHO', 'LUCANAS', 'OCA', 0, 0),
(490, '05', '0505', '050517', 'AYACUCHO', 'LUCANAS', 'OTOCA', 0, 0),
(491, '05', '0505', '050520', 'AYACUCHO', 'LUCANAS', 'SANCOS', 0, 0),
(492, '05', '0505', '050521', 'AYACUCHO', 'LUCANAS', 'SAN JUAN', 0, 0),
(493, '05', '0505', '050522', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO', 0, 0),
(494, '05', '0505', '050524', 'AYACUCHO', 'LUCANAS', 'SANTA ANA DE HUAYCAHUACHO', 0, 0),
(495, '05', '0505', '050525', 'AYACUCHO', 'LUCANAS', 'SANTA LUCIA', 0, 0),
(496, '05', '0505', '050529', 'AYACUCHO', 'LUCANAS', 'SAISA', 0, 0),
(497, '05', '0505', '050531', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO DE PALCO', 0, 0),
(498, '05', '0505', '050532', 'AYACUCHO', 'LUCANAS', 'SAN CRISTOBAL', 0, 0),
(499, '05', '0506', '050601', 'AYACUCHO', 'PARINACOCHAS', 'CORACORA', 0, 0),
(500, '05', '0506', '050604', 'AYACUCHO', 'PARINACOCHAS', 'CORONEL CASTA', 0, 0),
(501, '05', '0506', '050605', 'AYACUCHO', 'PARINACOCHAS', 'CHUMPI', 0, 0),
(502, '05', '0506', '050608', 'AYACUCHO', 'PARINACOCHAS', 'PACAPAUSA', 0, 0),
(503, '05', '0506', '050611', 'AYACUCHO', 'PARINACOCHAS', 'PULLO', 0, 0),
(504, '05', '0506', '050612', 'AYACUCHO', 'PARINACOCHAS', 'PUYUSCA', 0, 0),
(505, '05', '0506', '050615', 'AYACUCHO', 'PARINACOCHAS', 'SAN FRANCISCO DE RAVACAYCO', 0, 0),
(506, '05', '0506', '050616', 'AYACUCHO', 'PARINACOCHAS', 'UPAHUACHO', 0, 0),
(507, '05', '0507', '050701', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCAPI', 0, 0),
(508, '05', '0507', '050702', 'AYACUCHO', 'VICTOR FAJARDO', 'ALCAMENCA', 0, 0),
(509, '05', '0507', '050703', 'AYACUCHO', 'VICTOR FAJARDO', 'APONGO', 0, 0),
(510, '05', '0507', '050704', 'AYACUCHO', 'VICTOR FAJARDO', 'CANARIA', 0, 0),
(511, '05', '0507', '050706', 'AYACUCHO', 'VICTOR FAJARDO', 'CAYARA', 0, 0),
(512, '05', '0507', '050707', 'AYACUCHO', 'VICTOR FAJARDO', 'COLCA', 0, 0),
(513, '05', '0507', '050708', 'AYACUCHO', 'VICTOR FAJARDO', 'HUALLA', 0, 0),
(514, '05', '0507', '050709', 'AYACUCHO', 'VICTOR FAJARDO', 'HUAMANQUIQUIA', 0, 0),
(515, '05', '0507', '050710', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCARAYLLA', 0, 0),
(516, '05', '0507', '050713', 'AYACUCHO', 'VICTOR FAJARDO', 'SARHUA', 0, 0),
(517, '05', '0507', '050714', 'AYACUCHO', 'VICTOR FAJARDO', 'VILCANCHOS', 0, 0),
(518, '05', '0507', '050715', 'AYACUCHO', 'VICTOR FAJARDO', 'ASQUIPATA', 0, 0),
(519, '05', '0508', '050801', 'AYACUCHO', 'HUANCA SANCOS', 'SANCOS', 0, 0),
(520, '05', '0508', '050802', 'AYACUCHO', 'HUANCA SANCOS', 'SACSAMARCA', 0, 0),
(521, '05', '0508', '050803', 'AYACUCHO', 'HUANCA SANCOS', 'SANTIAGO DE LUCANAMARCA', 0, 0),
(522, '05', '0508', '050804', 'AYACUCHO', 'HUANCA SANCOS', 'CARAPO', 0, 0),
(523, '05', '0509', '050901', 'AYACUCHO', 'VILCAS HUAMAN', 'VILCAS HUAMAN', 0, 0),
(524, '05', '0509', '050902', 'AYACUCHO', 'VILCAS HUAMAN', 'VISCHONGO', 0, 0),
(525, '05', '0509', '050903', 'AYACUCHO', 'VILCAS HUAMAN', 'ACCOMARCA', 0, 0),
(526, '05', '0509', '050904', 'AYACUCHO', 'VILCAS HUAMAN', 'CARHUANCA', 0, 0),
(527, '05', '0509', '050905', 'AYACUCHO', 'VILCAS HUAMAN', 'CONCEPCION', 0, 0),
(528, '05', '0509', '050906', 'AYACUCHO', 'VILCAS HUAMAN', 'HUAMBALPA', 0, 0),
(529, '05', '0509', '050907', 'AYACUCHO', 'VILCAS HUAMAN', 'SAURAMA', 0, 0),
(530, '05', '0509', '050908', 'AYACUCHO', 'VILCAS HUAMAN', 'INDEPENDENCIA', 0, 0),
(531, '05', '0510', '051001', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PAUSA', 0, 0),
(532, '05', '0510', '051002', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'COLTA', 0, 0),
(533, '05', '0510', '051003', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'CORCULLA', 0, 0),
(534, '05', '0510', '051004', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'LAMPA', 0, 0),
(535, '05', '0510', '051005', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'MARCABAMBA', 0, 0),
(536, '05', '0510', '051006', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'OYOLO', 0, 0),
(537, '05', '0510', '051007', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PARARCA', 0, 0),
(538, '05', '0510', '051008', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JAVIER DE ALPABAMBA', 0, 0),
(539, '05', '0510', '051009', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JOSE DE USHUA', 0, 0),
(540, '05', '0510', '051010', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SARA SARA', 0, 0),
(541, '05', '0511', '051101', 'AYACUCHO', 'SUCRE', 'QUEROBAMBA', 0, 0),
(542, '05', '0511', '051102', 'AYACUCHO', 'SUCRE', 'BELEN', 0, 0),
(543, '05', '0511', '051103', 'AYACUCHO', 'SUCRE', 'CHALCOS', 0, 0),
(544, '05', '0511', '051104', 'AYACUCHO', 'SUCRE', 'SAN SALVADOR DE QUIJE', 0, 0),
(545, '05', '0511', '051105', 'AYACUCHO', 'SUCRE', 'PAICO', 0, 0),
(546, '05', '0511', '051106', 'AYACUCHO', 'SUCRE', 'SANTIAGO DE PAUCARAY', 0, 0),
(547, '05', '0511', '051107', 'AYACUCHO', 'SUCRE', 'SAN PEDRO DE LARCAY', 0, 0),
(548, '05', '0511', '051108', 'AYACUCHO', 'SUCRE', 'SORAS', 0, 0),
(549, '05', '0511', '051109', 'AYACUCHO', 'SUCRE', 'HUACA', 0, 0),
(550, '05', '0511', '051110', 'AYACUCHO', 'SUCRE', 'CHILCAYOC', 0, 0),
(551, '05', '0511', '051111', 'AYACUCHO', 'SUCRE', 'MORCOLLA', 0, 0),
(552, '06', '0601', '060101', 'CAJAMARCA', 'CAJAMARCA', 'CAJAMARCA', 0, 0),
(553, '06', '0601', '060102', 'CAJAMARCA', 'CAJAMARCA', 'ASUNCION', 0, 0),
(554, '06', '0601', '060103', 'CAJAMARCA', 'CAJAMARCA', 'COSPAN', 0, 0),
(555, '06', '0601', '060104', 'CAJAMARCA', 'CAJAMARCA', 'CHETILLA', 0, 0),
(556, '06', '0601', '060105', 'CAJAMARCA', 'CAJAMARCA', 'ENCA', 0, 0),
(557, '06', '0601', '060106', 'CAJAMARCA', 'CAJAMARCA', 'JESUS', 0, 0),
(558, '06', '0601', '060107', 'CAJAMARCA', 'CAJAMARCA', 'LOS BA', 0, 0),
(559, '06', '0601', '060108', 'CAJAMARCA', 'CAJAMARCA', 'LLACANORA', 0, 0),
(560, '06', '0601', '060109', 'CAJAMARCA', 'CAJAMARCA', 'MAGDALENA', 0, 0),
(561, '06', '0601', '060110', 'CAJAMARCA', 'CAJAMARCA', 'MATARA', 0, 0),
(562, '06', '0601', '060111', 'CAJAMARCA', 'CAJAMARCA', 'NAMORA', 0, 0),
(563, '06', '0601', '060112', 'CAJAMARCA', 'CAJAMARCA', 'SAN JUAN', 0, 0),
(564, '06', '0602', '060201', 'CAJAMARCA', 'CAJABAMBA', 'CAJABAMBA', 0, 0),
(565, '06', '0602', '060202', 'CAJAMARCA', 'CAJABAMBA', 'CACHACHI', 0, 0),
(566, '06', '0602', '060203', 'CAJAMARCA', 'CAJABAMBA', 'CONDEBAMBA', 0, 0),
(567, '06', '0602', '060205', 'CAJAMARCA', 'CAJABAMBA', 'SITACOCHA', 0, 0),
(568, '06', '0603', '060301', 'CAJAMARCA', 'CELENDIN', 'CELENDIN', 0, 0),
(569, '06', '0603', '060302', 'CAJAMARCA', 'CELENDIN', 'CORTEGANA', 0, 0),
(570, '06', '0603', '060303', 'CAJAMARCA', 'CELENDIN', 'CHUMUCH', 0, 0),
(571, '06', '0603', '060304', 'CAJAMARCA', 'CELENDIN', 'HUASMIN', 0, 0),
(572, '06', '0603', '060305', 'CAJAMARCA', 'CELENDIN', 'JORGE CHAVEZ', 0, 0),
(573, '06', '0603', '060306', 'CAJAMARCA', 'CELENDIN', 'JOSE GALVEZ', 0, 0),
(574, '06', '0603', '060307', 'CAJAMARCA', 'CELENDIN', 'MIGUEL IGLESIAS', 0, 0),
(575, '06', '0603', '060308', 'CAJAMARCA', 'CELENDIN', 'OXAMARCA', 0, 0),
(576, '06', '0603', '060309', 'CAJAMARCA', 'CELENDIN', 'SOROCHUCO', 0, 0),
(577, '06', '0603', '060310', 'CAJAMARCA', 'CELENDIN', 'SUCRE', 0, 0),
(578, '06', '0603', '060311', 'CAJAMARCA', 'CELENDIN', 'UTCO', 0, 0),
(579, '06', '0603', '060312', 'CAJAMARCA', 'CELENDIN', 'LA LIBERTAD DE PALLAN', 0, 0),
(580, '06', '0604', '060401', 'CAJAMARCA', 'CONTUMAZA', 'CONTUMAZA', 0, 0),
(581, '06', '0604', '060403', 'CAJAMARCA', 'CONTUMAZA', 'CHILETE', 0, 0),
(582, '06', '0604', '060404', 'CAJAMARCA', 'CONTUMAZA', 'GUZMANGO', 0, 0),
(583, '06', '0604', '060405', 'CAJAMARCA', 'CONTUMAZA', 'SAN BENITO', 0, 0),
(584, '06', '0604', '060406', 'CAJAMARCA', 'CONTUMAZA', 'CUPISNIQUE', 0, 0),
(585, '06', '0604', '060407', 'CAJAMARCA', 'CONTUMAZA', 'TANTARICA', 0, 0),
(586, '06', '0604', '060408', 'CAJAMARCA', 'CONTUMAZA', 'YONAN', 0, 0),
(587, '06', '0604', '060409', 'CAJAMARCA', 'CONTUMAZA', 'SANTA CRUZ DE TOLED', 0, 0),
(588, '06', '0605', '060501', 'CAJAMARCA', 'CUTERVO', 'CUTERVO', 0, 0),
(589, '06', '0605', '060502', 'CAJAMARCA', 'CUTERVO', 'CALLAYUC', 0, 0),
(590, '06', '0605', '060503', 'CAJAMARCA', 'CUTERVO', 'CUJILLO', 0, 0),
(591, '06', '0605', '060504', 'CAJAMARCA', 'CUTERVO', 'CHOROS', 0, 0),
(592, '06', '0605', '060505', 'CAJAMARCA', 'CUTERVO', 'LA RAMADA', 0, 0),
(593, '06', '0605', '060506', 'CAJAMARCA', 'CUTERVO', 'PIMPINGOS', 0, 0),
(594, '06', '0605', '060507', 'CAJAMARCA', 'CUTERVO', 'QUEROCOTILLO', 0, 0),
(595, '06', '0605', '060508', 'CAJAMARCA', 'CUTERVO', 'SAN ANDRES DE CUTERVO', 0, 0),
(596, '06', '0605', '060509', 'CAJAMARCA', 'CUTERVO', 'SAN JUAN DE CUTERVO', 0, 0),
(597, '06', '0605', '060510', 'CAJAMARCA', 'CUTERVO', 'SAN LUIS DE LUCMA', 0, 0),
(598, '06', '0605', '060511', 'CAJAMARCA', 'CUTERVO', 'SANTA CRUZ', 0, 0),
(599, '06', '0605', '060512', 'CAJAMARCA', 'CUTERVO', 'SANTO DOMINGO DE LA CAPILLA', 0, 0),
(600, '06', '0605', '060513', 'CAJAMARCA', 'CUTERVO', 'SANTO TOMAS', 0, 0),
(601, '06', '0605', '060514', 'CAJAMARCA', 'CUTERVO', 'SOCOTA', 0, 0),
(602, '06', '0605', '060515', 'CAJAMARCA', 'CUTERVO', 'TORIBIO CASANOVA', 0, 0),
(603, '06', '0606', '060601', 'CAJAMARCA', 'CHOTA', 'CHOTA', 0, 0),
(604, '06', '0606', '060602', 'CAJAMARCA', 'CHOTA', 'ANGUIA', 0, 0),
(605, '06', '0606', '060603', 'CAJAMARCA', 'CHOTA', 'COCHABAMBA', 0, 0),
(606, '06', '0606', '060604', 'CAJAMARCA', 'CHOTA', 'CONCHAN', 0, 0),
(607, '06', '0606', '060605', 'CAJAMARCA', 'CHOTA', 'CHADIN', 0, 0),
(608, '06', '0606', '060606', 'CAJAMARCA', 'CHOTA', 'CHIGUIRIP', 0, 0),
(609, '06', '0606', '060607', 'CAJAMARCA', 'CHOTA', 'CHIMBAN', 0, 0),
(610, '06', '0606', '060608', 'CAJAMARCA', 'CHOTA', 'HUAMBOS', 0, 0),
(611, '06', '0606', '060609', 'CAJAMARCA', 'CHOTA', 'LAJAS', 0, 0),
(612, '06', '0606', '060610', 'CAJAMARCA', 'CHOTA', 'LLAMA', 0, 0),
(613, '06', '0606', '060611', 'CAJAMARCA', 'CHOTA', 'MIRACOSTA', 0, 0),
(614, '06', '0606', '060612', 'CAJAMARCA', 'CHOTA', 'PACCHA', 0, 0),
(615, '06', '0606', '060613', 'CAJAMARCA', 'CHOTA', 'PION', 0, 0),
(616, '06', '0606', '060614', 'CAJAMARCA', 'CHOTA', 'QUEROCOTO', 0, 0),
(617, '06', '0606', '060615', 'CAJAMARCA', 'CHOTA', 'TACABAMBA', 0, 0),
(618, '06', '0606', '060616', 'CAJAMARCA', 'CHOTA', 'TOCMOCHE', 0, 0),
(619, '06', '0606', '060617', 'CAJAMARCA', 'CHOTA', 'SAN JUAN DE LICUPIS', 0, 0),
(620, '06', '0606', '060618', 'CAJAMARCA', 'CHOTA', 'CHOROPAMPA', 0, 0),
(621, '06', '0606', '060619', 'CAJAMARCA', 'CHOTA', 'CHALAMARCA', 0, 0),
(622, '06', '0607', '060701', 'CAJAMARCA', 'HUALGAYOC', 'BAMBAMARCA', 0, 0),
(623, '06', '0607', '060702', 'CAJAMARCA', 'HUALGAYOC', 'CHUGUR', 0, 0),
(624, '06', '0607', '060703', 'CAJAMARCA', 'HUALGAYOC', 'HUALGAYOC', 0, 0),
(625, '06', '0608', '060801', 'CAJAMARCA', 'JAEN', 'JAEN', 0, 0),
(626, '06', '0608', '060802', 'CAJAMARCA', 'JAEN', 'BELLAVISTA', 0, 0),
(627, '06', '0608', '060803', 'CAJAMARCA', 'JAEN', 'COLASAY', 0, 0),
(628, '06', '0608', '060804', 'CAJAMARCA', 'JAEN', 'CHONTALI', 0, 0),
(629, '06', '0608', '060805', 'CAJAMARCA', 'JAEN', 'POMAHUACA', 0, 0),
(630, '06', '0608', '060806', 'CAJAMARCA', 'JAEN', 'PUCARA', 0, 0),
(631, '06', '0608', '060807', 'CAJAMARCA', 'JAEN', 'SALLIQUE', 0, 0),
(632, '06', '0608', '060808', 'CAJAMARCA', 'JAEN', 'SAN FELIPE', 0, 0),
(633, '06', '0608', '060809', 'CAJAMARCA', 'JAEN', 'SAN JOSE DEL ALTO', 0, 0),
(634, '06', '0608', '060810', 'CAJAMARCA', 'JAEN', 'SANTA ROSA', 0, 0),
(635, '06', '0608', '060811', 'CAJAMARCA', 'JAEN', 'LAS PIRIAS', 0, 0),
(636, '06', '0608', '060812', 'CAJAMARCA', 'JAEN', 'HUABAL', 0, 0),
(637, '06', '0609', '060901', 'CAJAMARCA', 'SANTA CRUZ', 'SANTA CRUZ', 0, 0),
(638, '06', '0609', '060902', 'CAJAMARCA', 'SANTA CRUZ', 'CATACHE', 0, 0),
(639, '06', '0609', '060903', 'CAJAMARCA', 'SANTA CRUZ', 'CHANCAYBA', 0, 0),
(640, '06', '0609', '060904', 'CAJAMARCA', 'SANTA CRUZ', 'LA ESPERANZA', 0, 0),
(641, '06', '0609', '060905', 'CAJAMARCA', 'SANTA CRUZ', 'NINABAMBA', 0, 0),
(642, '06', '0609', '060906', 'CAJAMARCA', 'SANTA CRUZ', 'PULAN', 0, 0),
(643, '06', '0609', '060907', 'CAJAMARCA', 'SANTA CRUZ', 'SEXI', 0, 0),
(644, '06', '0609', '060908', 'CAJAMARCA', 'SANTA CRUZ', 'UTICYACU', 0, 0),
(645, '06', '0609', '060909', 'CAJAMARCA', 'SANTA CRUZ', 'YAUYUCAN', 0, 0),
(646, '06', '0609', '060910', 'CAJAMARCA', 'SANTA CRUZ', 'ANDABAMBA', 0, 0),
(647, '06', '0609', '060911', 'CAJAMARCA', 'SANTA CRUZ', 'SAUCEPAMPA', 0, 0),
(648, '06', '0610', '061001', 'CAJAMARCA', 'SAN MIGUEL', 'SAN MIGUEL', 0, 0),
(649, '06', '0610', '061002', 'CAJAMARCA', 'SAN MIGUEL', 'CALQUIS', 0, 0),
(650, '06', '0610', '061003', 'CAJAMARCA', 'SAN MIGUEL', 'LA FLORIDA', 0, 0),
(651, '06', '0610', '061004', 'CAJAMARCA', 'SAN MIGUEL', 'LLAPA', 0, 0),
(652, '06', '0610', '061005', 'CAJAMARCA', 'SAN MIGUEL', 'NANCHOC', 0, 0),
(653, '06', '0610', '061006', 'CAJAMARCA', 'SAN MIGUEL', 'NIEPOS', 0, 0),
(654, '06', '0610', '061007', 'CAJAMARCA', 'SAN MIGUEL', 'SAN GREGORIO', 0, 0),
(655, '06', '0610', '061008', 'CAJAMARCA', 'SAN MIGUEL', 'SAN SILVESTRE DE COCHAN', 0, 0),
(656, '06', '0610', '061009', 'CAJAMARCA', 'SAN MIGUEL', 'EL PRADO', 0, 0),
(657, '06', '0610', '061010', 'CAJAMARCA', 'SAN MIGUEL', 'UNION AGUA BLANCA', 0, 0),
(658, '06', '0610', '061011', 'CAJAMARCA', 'SAN MIGUEL', 'TONGOD', 0, 0),
(659, '06', '0610', '061012', 'CAJAMARCA', 'SAN MIGUEL', 'CATILLUC', 0, 0),
(660, '06', '0610', '061013', 'CAJAMARCA', 'SAN MIGUEL', 'BOLIVAR', 0, 0),
(661, '06', '0611', '061101', 'CAJAMARCA', 'SAN IGNACIO', 'SAN IGNACIO', 0, 0),
(662, '06', '0611', '061102', 'CAJAMARCA', 'SAN IGNACIO', 'CHIRINOS', 0, 0),
(663, '06', '0611', '061103', 'CAJAMARCA', 'SAN IGNACIO', 'HUARANGO', 0, 0),
(664, '06', '0611', '061104', 'CAJAMARCA', 'SAN IGNACIO', 'NAMBALLE', 0, 0),
(665, '06', '0611', '061105', 'CAJAMARCA', 'SAN IGNACIO', 'LA COIPA', 0, 0),
(666, '06', '0611', '061106', 'CAJAMARCA', 'SAN IGNACIO', 'SAN JOSE DE LOURDES', 0, 0),
(667, '06', '0611', '061107', 'CAJAMARCA', 'SAN IGNACIO', 'TABACONAS', 0, 0),
(668, '06', '0612', '061201', 'CAJAMARCA', 'SAN MARCOS', 'PEDRO GALVEZ', 0, 0),
(669, '06', '0612', '061202', 'CAJAMARCA', 'SAN MARCOS', 'ICHOCAN', 0, 0),
(670, '06', '0612', '061203', 'CAJAMARCA', 'SAN MARCOS', 'GREGORIO PITA', 0, 0),
(671, '06', '0612', '061204', 'CAJAMARCA', 'SAN MARCOS', 'JOSE MANUEL QUIROZ', 0, 0),
(672, '06', '0612', '061205', 'CAJAMARCA', 'SAN MARCOS', 'EDUARDO VILLANUEVA', 0, 0),
(673, '06', '0612', '061206', 'CAJAMARCA', 'SAN MARCOS', 'JOSE SABOGAL', 0, 0),
(674, '06', '0612', '061207', 'CAJAMARCA', 'SAN MARCOS', 'CHANCAY', 0, 0),
(675, '06', '0613', '061301', 'CAJAMARCA', 'SAN PABLO', 'SAN PABLO', 0, 0),
(676, '06', '0613', '061302', 'CAJAMARCA', 'SAN PABLO', 'SAN BERNARDINO', 0, 0),
(677, '06', '0613', '061303', 'CAJAMARCA', 'SAN PABLO', 'SAN LUIS', 0, 0),
(678, '06', '0613', '061304', 'CAJAMARCA', 'SAN PABLO', 'TUMBADEN', 0, 0),
(679, '07', '0701', '070101', 'CUSCO', 'CUSCO', 'CUSCO', 0, 0),
(680, '07', '0701', '070102', 'CUSCO', 'CUSCO', 'CCORCA', 0, 0),
(681, '07', '0701', '070103', 'CUSCO', 'CUSCO', 'POROY', 0, 0),
(682, '07', '0701', '070104', 'CUSCO', 'CUSCO', 'SAN JERONIMO', 0, 0),
(683, '07', '0701', '070105', 'CUSCO', 'CUSCO', 'SAN SEBASTIAN', 0, 0),
(684, '07', '0701', '070106', 'CUSCO', 'CUSCO', 'SANTIAGO', 0, 0),
(685, '07', '0701', '070107', 'CUSCO', 'CUSCO', 'SAYLLA', 0, 0),
(686, '07', '0701', '070108', 'CUSCO', 'CUSCO', 'WANCHAQ', 0, 0),
(687, '07', '0702', '070201', 'CUSCO', 'ACOMAYO', 'ACOMAYO', 0, 0),
(688, '07', '0702', '070202', 'CUSCO', 'ACOMAYO', 'ACOPIA', 0, 0),
(689, '07', '0702', '070203', 'CUSCO', 'ACOMAYO', 'ACOS', 0, 0),
(690, '07', '0702', '070204', 'CUSCO', 'ACOMAYO', 'POMACANCHI', 0, 0),
(691, '07', '0702', '070205', 'CUSCO', 'ACOMAYO', 'RONDOCAN', 0, 0),
(692, '07', '0702', '070206', 'CUSCO', 'ACOMAYO', 'SANGARARA', 0, 0),
(693, '07', '0702', '070207', 'CUSCO', 'ACOMAYO', 'MOSOC LLACTA', 0, 0),
(694, '07', '0703', '070301', 'CUSCO', 'ANTA', 'ANTA', 0, 0);
INSERT INTO `ubigeo` (`id`, `department_id`, `province_id`, `district_id`, `department`, `province`, `district`, `latitude`, `longitud`) VALUES
(695, '07', '0703', '070302', 'CUSCO', 'ANTA', 'CHINCHAYPUJIO', 0, 0),
(696, '07', '0703', '070303', 'CUSCO', 'ANTA', 'HUAROCONDO', 0, 0),
(697, '07', '0703', '070304', 'CUSCO', 'ANTA', 'LIMATAMBO', 0, 0),
(698, '07', '0703', '070305', 'CUSCO', 'ANTA', 'MOLLEPATA', 0, 0),
(699, '07', '0703', '070306', 'CUSCO', 'ANTA', 'PUCYURA', 0, 0),
(700, '07', '0703', '070307', 'CUSCO', 'ANTA', 'ZURITE', 0, 0),
(701, '07', '0703', '070308', 'CUSCO', 'ANTA', 'CACHIMAYO', 0, 0),
(702, '07', '0703', '070309', 'CUSCO', 'ANTA', 'ANCAHUASI', 0, 0),
(703, '07', '0704', '070401', 'CUSCO', 'CALCA', 'CALCA', 0, 0),
(704, '07', '0704', '070402', 'CUSCO', 'CALCA', 'COYA', 0, 0),
(705, '07', '0704', '070403', 'CUSCO', 'CALCA', 'LAMAY', 0, 0),
(706, '07', '0704', '070404', 'CUSCO', 'CALCA', 'LARES', 0, 0),
(707, '07', '0704', '070405', 'CUSCO', 'CALCA', 'PISAC', 0, 0),
(708, '07', '0704', '070406', 'CUSCO', 'CALCA', 'SAN SALVADOR', 0, 0),
(709, '07', '0704', '070407', 'CUSCO', 'CALCA', 'TARAY', 0, 0),
(710, '07', '0704', '070408', 'CUSCO', 'CALCA', 'YANATILE', 0, 0),
(711, '07', '0705', '070501', 'CUSCO', 'CANAS', 'YANAOCA', 0, 0),
(712, '07', '0705', '070502', 'CUSCO', 'CANAS', 'CHECCA', 0, 0),
(713, '07', '0705', '070503', 'CUSCO', 'CANAS', 'KUNTURKANKI', 0, 0),
(714, '07', '0705', '070504', 'CUSCO', 'CANAS', 'LANGUI', 0, 0),
(715, '07', '0705', '070505', 'CUSCO', 'CANAS', 'LAYO', 0, 0),
(716, '07', '0705', '070506', 'CUSCO', 'CANAS', 'PAMPAMARCA', 0, 0),
(717, '07', '0705', '070507', 'CUSCO', 'CANAS', 'QUEHUE', 0, 0),
(718, '07', '0705', '070508', 'CUSCO', 'CANAS', 'TUPAC AMARU', 0, 0),
(719, '07', '0706', '070601', 'CUSCO', 'CANCHIS', 'SICUANI', 0, 0),
(720, '07', '0706', '070602', 'CUSCO', 'CANCHIS', 'COMBAPATA', 0, 0),
(721, '07', '0706', '070603', 'CUSCO', 'CANCHIS', 'CHECACUPE', 0, 0),
(722, '07', '0706', '070604', 'CUSCO', 'CANCHIS', 'MARANGANI', 0, 0),
(723, '07', '0706', '070605', 'CUSCO', 'CANCHIS', 'PITUMARCA', 0, 0),
(724, '07', '0706', '070606', 'CUSCO', 'CANCHIS', 'SAN PABLO', 0, 0),
(725, '07', '0706', '070607', 'CUSCO', 'CANCHIS', 'SAN PEDRO', 0, 0),
(726, '07', '0706', '070608', 'CUSCO', 'CANCHIS', 'TINTA', 0, 0),
(727, '07', '0707', '070701', 'CUSCO', 'CHUMBIVILCAS', 'SANTO TOMAS', 0, 0),
(728, '07', '0707', '070702', 'CUSCO', 'CHUMBIVILCAS', 'CAPACMARCA', 0, 0),
(729, '07', '0707', '070703', 'CUSCO', 'CHUMBIVILCAS', 'COLQUEMARCA', 0, 0),
(730, '07', '0707', '070704', 'CUSCO', 'CHUMBIVILCAS', 'CHAMACA', 0, 0),
(731, '07', '0707', '070705', 'CUSCO', 'CHUMBIVILCAS', 'LIVITACA', 0, 0),
(732, '07', '0707', '070706', 'CUSCO', 'CHUMBIVILCAS', 'LLUSCO', 0, 0),
(733, '07', '0707', '070707', 'CUSCO', 'CHUMBIVILCAS', 'QUI', 0, 0),
(734, '07', '0707', '070708', 'CUSCO', 'CHUMBIVILCAS', 'VELILLE', 0, 0),
(735, '07', '0708', '070801', 'CUSCO', 'ESPINAR', 'ESPINAR', 0, 0),
(736, '07', '0708', '070802', 'CUSCO', 'ESPINAR', 'CONDOROMA', 0, 0),
(737, '07', '0708', '070803', 'CUSCO', 'ESPINAR', 'COPORAQUE', 0, 0),
(738, '07', '0708', '070804', 'CUSCO', 'ESPINAR', 'OCORURO', 0, 0),
(739, '07', '0708', '070805', 'CUSCO', 'ESPINAR', 'PALLPATA', 0, 0),
(740, '07', '0708', '070806', 'CUSCO', 'ESPINAR', 'PICHIGUA', 0, 0),
(741, '07', '0708', '070807', 'CUSCO', 'ESPINAR', 'SUYCKUTAMBO', 0, 0),
(742, '07', '0708', '070808', 'CUSCO', 'ESPINAR', 'ALTO PICHIGUA', 0, 0),
(743, '07', '0709', '070901', 'CUSCO', 'LA CONVENCION', 'SANTA ANA', 0, 0),
(744, '07', '0709', '070902', 'CUSCO', 'LA CONVENCION', 'ECHARATE', 0, 0),
(745, '07', '0709', '070903', 'CUSCO', 'LA CONVENCION', 'HUAYOPATA', 0, 0),
(746, '07', '0709', '070904', 'CUSCO', 'LA CONVENCION', 'MARANURA', 0, 0),
(747, '07', '0709', '070905', 'CUSCO', 'LA CONVENCION', 'OCOBAMBA', 0, 0),
(748, '07', '0709', '070906', 'CUSCO', 'LA CONVENCION', 'SANTA TERESA', 0, 0),
(749, '07', '0709', '070907', 'CUSCO', 'LA CONVENCION', 'VILCABAMBA', 0, 0),
(750, '07', '0709', '070908', 'CUSCO', 'LA CONVENCION', 'QUELLOUNO', 0, 0),
(751, '07', '0709', '070909', 'CUSCO', 'LA CONVENCION', 'KIMBIRI', 0, 0),
(752, '07', '0709', '070910', 'CUSCO', 'LA CONVENCION', 'PICHARI', 0, 0),
(753, '07', '0710', '071001', 'CUSCO', 'PARURO', 'PARURO', 0, 0),
(754, '07', '0710', '071002', 'CUSCO', 'PARURO', 'ACCHA', 0, 0),
(755, '07', '0710', '071003', 'CUSCO', 'PARURO', 'CCAPI', 0, 0),
(756, '07', '0710', '071004', 'CUSCO', 'PARURO', 'COLCHA', 0, 0),
(757, '07', '0710', '071005', 'CUSCO', 'PARURO', 'HUANOQUITE', 0, 0),
(758, '07', '0710', '071006', 'CUSCO', 'PARURO', 'OMACHA', 0, 0),
(759, '07', '0710', '071007', 'CUSCO', 'PARURO', 'YAURISQUE', 0, 0),
(760, '07', '0710', '071008', 'CUSCO', 'PARURO', 'PACCARITAMBO', 0, 0),
(761, '07', '0710', '071009', 'CUSCO', 'PARURO', 'PILLPINTO', 0, 0),
(762, '07', '0711', '071101', 'CUSCO', 'PAUCARTAMBO', 'PAUCARTAMBO', 0, 0),
(763, '07', '0711', '071102', 'CUSCO', 'PAUCARTAMBO', 'CAICAY', 0, 0),
(764, '07', '0711', '071103', 'CUSCO', 'PAUCARTAMBO', 'COLQUEPATA', 0, 0),
(765, '07', '0711', '071104', 'CUSCO', 'PAUCARTAMBO', 'CHALLABAMBA', 0, 0),
(766, '07', '0711', '071105', 'CUSCO', 'PAUCARTAMBO', 'KOS', 0, 0),
(767, '07', '0711', '071106', 'CUSCO', 'PAUCARTAMBO', 'HUANCARANI', 0, 0),
(768, '07', '0712', '071201', 'CUSCO', 'QUISPICANCHI', 'URCOS', 0, 0),
(769, '07', '0712', '071202', 'CUSCO', 'QUISPICANCHI', 'ANDAHUAYLILLAS', 0, 0),
(770, '07', '0712', '071203', 'CUSCO', 'QUISPICANCHI', 'CAMANTI', 0, 0),
(771, '07', '0712', '071204', 'CUSCO', 'QUISPICANCHI', 'CCARHUAYO', 0, 0),
(772, '07', '0712', '071205', 'CUSCO', 'QUISPICANCHI', 'CCATCA', 0, 0),
(773, '07', '0712', '071206', 'CUSCO', 'QUISPICANCHI', 'CUSIPATA', 0, 0),
(774, '07', '0712', '071207', 'CUSCO', 'QUISPICANCHI', 'HUARO', 0, 0),
(775, '07', '0712', '071208', 'CUSCO', 'QUISPICANCHI', 'LUCRE', 0, 0),
(776, '07', '0712', '071209', 'CUSCO', 'QUISPICANCHI', 'MARCAPATA', 0, 0),
(777, '07', '0712', '071210', 'CUSCO', 'QUISPICANCHI', 'OCONGATE', 0, 0),
(778, '07', '0712', '071211', 'CUSCO', 'QUISPICANCHI', 'OROPESA', 0, 0),
(779, '07', '0712', '071212', 'CUSCO', 'QUISPICANCHI', 'QUIQUIJANA', 0, 0),
(780, '07', '0713', '071301', 'CUSCO', 'URUBAMBA', 'URUBAMBA', 0, 0),
(781, '07', '0713', '071302', 'CUSCO', 'URUBAMBA', 'CHINCHERO', 0, 0),
(782, '07', '0713', '071303', 'CUSCO', 'URUBAMBA', 'HUAYLLABAMBA', 0, 0),
(783, '07', '0713', '071304', 'CUSCO', 'URUBAMBA', 'MACHUPICCHU', 0, 0),
(784, '07', '0713', '071305', 'CUSCO', 'URUBAMBA', 'MARAS', 0, 0),
(785, '07', '0713', '071306', 'CUSCO', 'URUBAMBA', 'OLLANTAYTAMBO', 0, 0),
(786, '07', '0713', '071307', 'CUSCO', 'URUBAMBA', 'YUCAY', 0, 0),
(787, '08', '0801', '080101', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANCAVELICA', 0, 0),
(788, '08', '0801', '080102', 'HUANCAVELICA', 'HUANCAVELICA', 'ACOBAMBILLA', 0, 0),
(789, '08', '0801', '080103', 'HUANCAVELICA', 'HUANCAVELICA', 'ACORIA', 0, 0),
(790, '08', '0801', '080104', 'HUANCAVELICA', 'HUANCAVELICA', 'CONAYCA', 0, 0),
(791, '08', '0801', '080105', 'HUANCAVELICA', 'HUANCAVELICA', 'CUENCA', 0, 0),
(792, '08', '0801', '080106', 'HUANCAVELICA', 'HUANCAVELICA', 'HUACHOCOLPA', 0, 0),
(793, '08', '0801', '080108', 'HUANCAVELICA', 'HUANCAVELICA', 'HUAYLLAHUARA', 0, 0),
(794, '08', '0801', '080109', 'HUANCAVELICA', 'HUANCAVELICA', 'IZCUCHACA', 0, 0),
(795, '08', '0801', '080110', 'HUANCAVELICA', 'HUANCAVELICA', 'LARIA', 0, 0),
(796, '08', '0801', '080111', 'HUANCAVELICA', 'HUANCAVELICA', 'MANTA', 0, 0),
(797, '08', '0801', '080112', 'HUANCAVELICA', 'HUANCAVELICA', 'MARISCAL CACERES', 0, 0),
(798, '08', '0801', '080113', 'HUANCAVELICA', 'HUANCAVELICA', 'MOYA', 0, 0),
(799, '08', '0801', '080114', 'HUANCAVELICA', 'HUANCAVELICA', 'NUEVO OCCORO', 0, 0),
(800, '08', '0801', '080115', 'HUANCAVELICA', 'HUANCAVELICA', 'PALCA', 0, 0),
(801, '08', '0801', '080116', 'HUANCAVELICA', 'HUANCAVELICA', 'PILCHACA', 0, 0),
(802, '08', '0801', '080117', 'HUANCAVELICA', 'HUANCAVELICA', 'VILCA', 0, 0),
(803, '08', '0801', '080118', 'HUANCAVELICA', 'HUANCAVELICA', 'YAULI', 0, 0),
(804, '08', '0801', '080119', 'HUANCAVELICA', 'HUANCAVELICA', 'ASCENSION', 0, 0),
(805, '08', '0801', '080120', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANDO', 0, 0),
(806, '08', '0802', '080201', 'HUANCAVELICA', 'ACOBAMBA', 'ACOBAMBA', 0, 0),
(807, '08', '0802', '080202', 'HUANCAVELICA', 'ACOBAMBA', 'ANTA', 0, 0),
(808, '08', '0802', '080203', 'HUANCAVELICA', 'ACOBAMBA', 'ANDABAMBA', 0, 0),
(809, '08', '0802', '080204', 'HUANCAVELICA', 'ACOBAMBA', 'CAJA', 0, 0),
(810, '08', '0802', '080205', 'HUANCAVELICA', 'ACOBAMBA', 'MARCAS', 0, 0),
(811, '08', '0802', '080206', 'HUANCAVELICA', 'ACOBAMBA', 'PAUCARA', 0, 0),
(812, '08', '0802', '080207', 'HUANCAVELICA', 'ACOBAMBA', 'POMACOCHA', 0, 0),
(813, '08', '0802', '080208', 'HUANCAVELICA', 'ACOBAMBA', 'ROSARIO', 0, 0),
(814, '08', '0803', '080301', 'HUANCAVELICA', 'ANGARAES', 'LIRCAY', 0, 0),
(815, '08', '0803', '080302', 'HUANCAVELICA', 'ANGARAES', 'ANCHONGA', 0, 0),
(816, '08', '0803', '080303', 'HUANCAVELICA', 'ANGARAES', 'CALLANMARCA', 0, 0),
(817, '08', '0803', '080304', 'HUANCAVELICA', 'ANGARAES', 'CONGALLA', 0, 0),
(818, '08', '0803', '080305', 'HUANCAVELICA', 'ANGARAES', 'CHINCHO', 0, 0),
(819, '08', '0803', '080306', 'HUANCAVELICA', 'ANGARAES', 'HUALLAY-GRANDE', 0, 0),
(820, '08', '0803', '080307', 'HUANCAVELICA', 'ANGARAES', 'HUANCA-HUANCA', 0, 0),
(821, '08', '0803', '080308', 'HUANCAVELICA', 'ANGARAES', 'JULCAMARCA', 0, 0),
(822, '08', '0803', '080309', 'HUANCAVELICA', 'ANGARAES', 'SAN ANTONIO DE ANTAPARCO', 0, 0),
(823, '08', '0803', '080310', 'HUANCAVELICA', 'ANGARAES', 'SANTO TOMAS DE PATA', 0, 0),
(824, '08', '0803', '080311', 'HUANCAVELICA', 'ANGARAES', 'SECCLLA', 0, 0),
(825, '08', '0803', '080312', 'HUANCAVELICA', 'ANGARAES', 'CCOCHACCASA', 0, 0),
(826, '08', '0804', '080401', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CASTROVIRREYNA', 0, 0),
(827, '08', '0804', '080402', 'HUANCAVELICA', 'CASTROVIRREYNA', 'ARMA', 0, 0),
(828, '08', '0804', '080403', 'HUANCAVELICA', 'CASTROVIRREYNA', 'AURAHUA', 0, 0),
(829, '08', '0804', '080405', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CAPILLAS', 0, 0),
(830, '08', '0804', '080406', 'HUANCAVELICA', 'CASTROVIRREYNA', 'COCAS', 0, 0),
(831, '08', '0804', '080408', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CHUPAMARCA', 0, 0),
(832, '08', '0804', '080409', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUACHOS', 0, 0),
(833, '08', '0804', '080410', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUAMATAMBO', 0, 0),
(834, '08', '0804', '080414', 'HUANCAVELICA', 'CASTROVIRREYNA', 'MOLLEPAMPA', 0, 0),
(835, '08', '0804', '080422', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SAN JUAN', 0, 0),
(836, '08', '0804', '080427', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TANTARA', 0, 0),
(837, '08', '0804', '080428', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TICRAPO', 0, 0),
(838, '08', '0804', '080429', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SANTA ANA', 0, 0),
(839, '08', '0805', '080501', 'HUANCAVELICA', 'TAYACAJA', 'PAMPAS', 0, 0),
(840, '08', '0805', '080502', 'HUANCAVELICA', 'TAYACAJA', 'ACOSTAMBO', 0, 0),
(841, '08', '0805', '080503', 'HUANCAVELICA', 'TAYACAJA', 'ACRAQUIA', 0, 0),
(842, '08', '0805', '080504', 'HUANCAVELICA', 'TAYACAJA', 'AHUAYCHA', 0, 0),
(843, '08', '0805', '080506', 'HUANCAVELICA', 'TAYACAJA', 'COLCABAMBA', 0, 0),
(844, '08', '0805', '080509', 'HUANCAVELICA', 'TAYACAJA', 'DANIEL HERNANDEZ', 0, 0),
(845, '08', '0805', '080511', 'HUANCAVELICA', 'TAYACAJA', 'HUACHOCOLPA', 0, 0),
(846, '08', '0805', '080512', 'HUANCAVELICA', 'TAYACAJA', 'HUARIBAMBA', 0, 0),
(847, '08', '0805', '080515', 'HUANCAVELICA', 'TAYACAJA', '', 0, 0),
(848, '08', '0805', '080517', 'HUANCAVELICA', 'TAYACAJA', 'PAZOS', 0, 0),
(849, '08', '0805', '080518', 'HUANCAVELICA', 'TAYACAJA', 'QUISHUAR', 0, 0),
(850, '08', '0805', '080519', 'HUANCAVELICA', 'TAYACAJA', 'SALCABAMBA', 0, 0),
(851, '08', '0805', '080520', 'HUANCAVELICA', 'TAYACAJA', 'SAN MARCOS DE ROCCHAC', 0, 0),
(852, '08', '0805', '080523', 'HUANCAVELICA', 'TAYACAJA', 'SURCUBAMBA', 0, 0),
(853, '08', '0805', '080525', 'HUANCAVELICA', 'TAYACAJA', 'TINTAY PUNCU', 0, 0),
(854, '08', '0805', '080526', 'HUANCAVELICA', 'TAYACAJA', 'SALCAHUASI', 0, 0),
(855, '08', '0806', '080601', 'HUANCAVELICA', 'HUAYTARA', 'AYAVI', 0, 0),
(856, '08', '0806', '080602', 'HUANCAVELICA', 'HUAYTARA', 'CORDOVA', 0, 0),
(857, '08', '0806', '080603', 'HUANCAVELICA', 'HUAYTARA', 'HUAYACUNDO ARMA', 0, 0),
(858, '08', '0806', '080604', 'HUANCAVELICA', 'HUAYTARA', 'HUAYTARA', 0, 0),
(859, '08', '0806', '080605', 'HUANCAVELICA', 'HUAYTARA', 'LARAMARCA', 0, 0),
(860, '08', '0806', '080606', 'HUANCAVELICA', 'HUAYTARA', 'OCOYO', 0, 0),
(861, '08', '0806', '080607', 'HUANCAVELICA', 'HUAYTARA', 'PILPICHACA', 0, 0),
(862, '08', '0806', '080608', 'HUANCAVELICA', 'HUAYTARA', 'QUERCO', 0, 0),
(863, '08', '0806', '080609', 'HUANCAVELICA', 'HUAYTARA', 'QUITO ARMA', 0, 0),
(864, '08', '0806', '080610', 'HUANCAVELICA', 'HUAYTARA', 'SAN ANTONIO DE CUSICANCHA', 0, 0),
(865, '08', '0806', '080611', 'HUANCAVELICA', 'HUAYTARA', 'SAN FRANCISCO DE SANGAYAICO', 0, 0),
(866, '08', '0806', '080612', 'HUANCAVELICA', 'HUAYTARA', 'SAN ISIDRO', 0, 0),
(867, '08', '0806', '080613', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE CHOCORVOS', 0, 0),
(868, '08', '0806', '080614', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE QUIRAHUARA', 0, 0),
(869, '08', '0806', '080615', 'HUANCAVELICA', 'HUAYTARA', 'SANTO DOMINGO DE CAPILLAS', 0, 0),
(870, '08', '0806', '080616', 'HUANCAVELICA', 'HUAYTARA', 'TAMBO', 0, 0),
(871, '08', '0807', '080701', 'HUANCAVELICA', 'CHURCAMPA', 'CHURCAMPA', 0, 0),
(872, '08', '0807', '080702', 'HUANCAVELICA', 'CHURCAMPA', 'ANCO', 0, 0),
(873, '08', '0807', '080703', 'HUANCAVELICA', 'CHURCAMPA', 'CHINCHIHUASI', 0, 0),
(874, '08', '0807', '080704', 'HUANCAVELICA', 'CHURCAMPA', 'EL CARMEN', 0, 0),
(875, '08', '0807', '080705', 'HUANCAVELICA', 'CHURCAMPA', 'LA MERCED', 0, 0),
(876, '08', '0807', '080706', 'HUANCAVELICA', 'CHURCAMPA', 'LOCROJA', 0, 0),
(877, '08', '0807', '080707', 'HUANCAVELICA', 'CHURCAMPA', 'PAUCARBAMBA', 0, 0),
(878, '08', '0807', '080708', 'HUANCAVELICA', 'CHURCAMPA', 'SAN MIGUEL DE MAYOCC', 0, 0),
(879, '08', '0807', '080709', 'HUANCAVELICA', 'CHURCAMPA', 'SAN PEDRO DE CORIS', 0, 0),
(880, '08', '0807', '080710', 'HUANCAVELICA', 'CHURCAMPA', 'PACHAMARCA', 0, 0),
(881, '08', '0807', '080711', 'HUANCAVELICA', 'CHURCAMPA', 'COSME', 0, 0),
(882, '09', '0901', '090101', 'HUANUCO', 'HUANUCO', 'HUANUCO', 0, 0),
(883, '09', '0901', '090102', 'HUANUCO', 'HUANUCO', 'CHINCHAO', 0, 0),
(884, '09', '0901', '090103', 'HUANUCO', 'HUANUCO', 'CHURUBAMBA', 0, 0),
(885, '09', '0901', '090104', 'HUANUCO', 'HUANUCO', 'MARGOS', 0, 0),
(886, '09', '0901', '090105', 'HUANUCO', 'HUANUCO', 'QUISQUI', 0, 0),
(887, '09', '0901', '090106', 'HUANUCO', 'HUANUCO', 'SAN FRANCISCO DE CAYRAN', 0, 0),
(888, '09', '0901', '090107', 'HUANUCO', 'HUANUCO', 'SAN PEDRO DE CHAULAN', 0, 0),
(889, '09', '0901', '090108', 'HUANUCO', 'HUANUCO', 'SANTA MARIA DEL VALLE', 0, 0),
(890, '09', '0901', '090109', 'HUANUCO', 'HUANUCO', 'YARUMAYO', 0, 0),
(891, '09', '0901', '090110', 'HUANUCO', 'HUANUCO', 'AMARILIS', 0, 0),
(892, '09', '0901', '090111', 'HUANUCO', 'HUANUCO', 'PILLCO MARCA', 0, 0),
(893, '09', '0901', '090112', 'HUANUCO', 'HUANUCO', 'YACUS', 0, 0),
(894, '09', '0902', '090201', 'HUANUCO', 'AMBO', 'AMBO', 0, 0),
(895, '09', '0902', '090202', 'HUANUCO', 'AMBO', 'CAYNA', 0, 0),
(896, '09', '0902', '090203', 'HUANUCO', 'AMBO', 'COLPAS', 0, 0),
(897, '09', '0902', '090204', 'HUANUCO', 'AMBO', 'CONCHAMARCA', 0, 0),
(898, '09', '0902', '090205', 'HUANUCO', 'AMBO', 'HUACAR', 0, 0),
(899, '09', '0902', '090206', 'HUANUCO', 'AMBO', 'SAN FRANCISCO', 0, 0),
(900, '09', '0902', '090207', 'HUANUCO', 'AMBO', 'SAN RAFAEL', 0, 0),
(901, '09', '0902', '090208', 'HUANUCO', 'AMBO', 'TOMAY-KICHWA', 0, 0),
(902, '09', '0903', '090301', 'HUANUCO', 'DOS DE MAYO', 'LA UNION', 0, 0),
(903, '09', '0903', '090307', 'HUANUCO', 'DOS DE MAYO', 'CHUQUIS', 0, 0),
(904, '09', '0903', '090312', 'HUANUCO', 'DOS DE MAYO', 'MARIAS', 0, 0),
(905, '09', '0903', '090314', 'HUANUCO', 'DOS DE MAYO', 'PACHAS', 0, 0),
(906, '09', '0903', '090316', 'HUANUCO', 'DOS DE MAYO', 'QUIVILLA', 0, 0),
(907, '09', '0903', '090317', 'HUANUCO', 'DOS DE MAYO', 'RIPAN', 0, 0),
(908, '09', '0903', '090321', 'HUANUCO', 'DOS DE MAYO', 'SHUNQUI', 0, 0),
(909, '09', '0903', '090322', 'HUANUCO', 'DOS DE MAYO', 'SILLAPATA', 0, 0),
(910, '09', '0903', '090323', 'HUANUCO', 'DOS DE MAYO', 'YANAS', 0, 0),
(911, '09', '0904', '090401', 'HUANUCO', 'HUAMALIES', 'LLATA', 0, 0),
(912, '09', '0904', '090402', 'HUANUCO', 'HUAMALIES', 'ARANCAY', 0, 0),
(913, '09', '0904', '090403', 'HUANUCO', 'HUAMALIES', 'CHAVIN DE PARIARCA', 0, 0),
(914, '09', '0904', '090404', 'HUANUCO', 'HUAMALIES', 'JACAS GRANDE', 0, 0),
(915, '09', '0904', '090405', 'HUANUCO', 'HUAMALIES', 'JIRCAN', 0, 0),
(916, '09', '0904', '090406', 'HUANUCO', 'HUAMALIES', 'MIRAFLORES', 0, 0),
(917, '09', '0904', '090407', 'HUANUCO', 'HUAMALIES', 'MONZON', 0, 0),
(918, '09', '0904', '090408', 'HUANUCO', 'HUAMALIES', 'PUNCHAO', 0, 0),
(919, '09', '0904', '090409', 'HUANUCO', 'HUAMALIES', 'PU', 0, 0),
(920, '09', '0904', '090410', 'HUANUCO', 'HUAMALIES', 'SINGA', 0, 0),
(921, '09', '0904', '090411', 'HUANUCO', 'HUAMALIES', 'TANTAMAYO', 0, 0),
(922, '09', '0905', '090501', 'HUANUCO', 'MARA', 'HUACRACHUCO', 0, 0),
(923, '09', '0905', '090502', 'HUANUCO', 'MARA', 'CHOLON', 0, 0),
(924, '09', '0905', '090505', 'HUANUCO', 'MARA', 'SAN BUENAVENTURA', 0, 0),
(925, '09', '0906', '090601', 'HUANUCO', 'LEONCIO PRADO', 'RUPA-RUPA', 0, 0),
(926, '09', '0906', '090602', 'HUANUCO', 'LEONCIO PRADO', 'DANIEL ALOMIA ROBLES', 0, 0),
(927, '09', '0906', '090603', 'HUANUCO', 'LEONCIO PRADO', 'HERMILIO VALDIZAN', 0, 0),
(928, '09', '0906', '090604', 'HUANUCO', 'LEONCIO PRADO', 'LUYANDO', 0, 0),
(929, '09', '0906', '090605', 'HUANUCO', 'LEONCIO PRADO', 'MARIANO DAMASO BERAUN', 0, 0),
(930, '09', '0906', '090606', 'HUANUCO', 'LEONCIO PRADO', 'JOSE CRESPO Y CASTILLO', 0, 0),
(931, '09', '0907', '090701', 'HUANUCO', 'PACHITEA', 'PANAO', 0, 0),
(932, '09', '0907', '090702', 'HUANUCO', 'PACHITEA', 'CHAGLLA', 0, 0),
(933, '09', '0907', '090704', 'HUANUCO', 'PACHITEA', 'MOLINO', 0, 0),
(934, '09', '0907', '090706', 'HUANUCO', 'PACHITEA', 'UMARI', 0, 0),
(935, '09', '0908', '090801', 'HUANUCO', 'PUERTO INCA', 'HONORIA', 0, 0),
(936, '09', '0908', '090802', 'HUANUCO', 'PUERTO INCA', 'PUERTO INCA', 0, 0),
(937, '09', '0908', '090803', 'HUANUCO', 'PUERTO INCA', 'CODO DEL POZUZO', 0, 0),
(938, '09', '0908', '090804', 'HUANUCO', 'PUERTO INCA', 'TOURNAVISTA', 0, 0),
(939, '09', '0908', '090805', 'HUANUCO', 'PUERTO INCA', 'YUYAPICHIS', 0, 0),
(940, '09', '0909', '090901', 'HUANUCO', 'HUACAYBAMBA', 'HUACAYBAMBA', 0, 0),
(941, '09', '0909', '090902', 'HUANUCO', 'HUACAYBAMBA', 'PINRA', 0, 0),
(942, '09', '0909', '090903', 'HUANUCO', 'HUACAYBAMBA', 'CANCHABAMBA', 0, 0),
(943, '09', '0909', '090904', 'HUANUCO', 'HUACAYBAMBA', 'COCHABAMBA', 0, 0),
(944, '09', '0910', '091001', 'HUANUCO', 'LAURICOCHA', 'JESUS', 0, 0),
(945, '09', '0910', '091002', 'HUANUCO', 'LAURICOCHA', 'BA', 0, 0),
(946, '09', '0910', '091003', 'HUANUCO', 'LAURICOCHA', 'SAN FRANCISCO DE ASIS', 0, 0),
(947, '09', '0910', '091004', 'HUANUCO', 'LAURICOCHA', 'QUEROPALCA', 0, 0),
(948, '09', '0910', '091005', 'HUANUCO', 'LAURICOCHA', 'SAN MIGUEL DE CAURI', 0, 0),
(949, '09', '0910', '091006', 'HUANUCO', 'LAURICOCHA', 'RONDOS', 0, 0),
(950, '09', '0910', '091007', 'HUANUCO', 'LAURICOCHA', 'JIVIA', 0, 0),
(951, '09', '0911', '091101', 'HUANUCO', 'YAROWILCA', 'CHAVINILLO', 0, 0),
(952, '09', '0911', '091102', 'HUANUCO', 'YAROWILCA', 'APARICIO POMARES', 0, 0),
(953, '09', '0911', '091103', 'HUANUCO', 'YAROWILCA', 'CAHUAC', 0, 0),
(954, '09', '0911', '091104', 'HUANUCO', 'YAROWILCA', 'CHACABAMBA', 0, 0),
(955, '09', '0911', '091105', 'HUANUCO', 'YAROWILCA', 'JACAS CHICO', 0, 0),
(956, '09', '0911', '091106', 'HUANUCO', 'YAROWILCA', 'OBAS', 0, 0),
(957, '09', '0911', '091107', 'HUANUCO', 'YAROWILCA', 'PAMPAMARCA', 0, 0),
(958, '09', '0911', '091108', 'HUANUCO', 'YAROWILCA', 'CHORAS', 0, 0),
(959, '10', '1001', '100101', 'ICA', 'ICA', 'ICA', 0, 0),
(960, '10', '1001', '100102', 'ICA', 'ICA', 'LA TINGUI', 0, 0),
(961, '10', '1001', '100103', 'ICA', 'ICA', 'LOS AQUIJES', 0, 0),
(962, '10', '1001', '100104', 'ICA', 'ICA', 'PARCONA', 0, 0),
(963, '10', '1001', '100105', 'ICA', 'ICA', 'PUEBLO NUEVO', 0, 0),
(964, '10', '1001', '100106', 'ICA', 'ICA', 'SALAS', 0, 0),
(965, '10', '1001', '100107', 'ICA', 'ICA', 'SAN JOSE DE LOS MOLINOS', 0, 0),
(966, '10', '1001', '100108', 'ICA', 'ICA', 'SAN JUAN BAUTISTA', 0, 0),
(967, '10', '1001', '100109', 'ICA', 'ICA', 'SANTIAGO', 0, 0),
(968, '10', '1001', '100110', 'ICA', 'ICA', 'SUBTANJALLA', 0, 0),
(969, '10', '1001', '100111', 'ICA', 'ICA', 'YAUCA DEL ROSARIO', 0, 0),
(970, '10', '1001', '100112', 'ICA', 'ICA', 'TATE', 0, 0),
(971, '10', '1001', '100113', 'ICA', 'ICA', 'PACHACUTEC', 0, 0),
(972, '10', '1001', '100114', 'ICA', 'ICA', 'OCUCAJE', 0, 0),
(973, '10', '1002', '100201', 'ICA', 'CHINCHA', 'CHINCHA ALTA', 0, 0),
(974, '10', '1002', '100202', 'ICA', 'CHINCHA', 'CHAVIN', 0, 0),
(975, '10', '1002', '100203', 'ICA', 'CHINCHA', 'CHINCHA BAJA', 0, 0),
(976, '10', '1002', '100204', 'ICA', 'CHINCHA', 'EL CARMEN', 0, 0),
(977, '10', '1002', '100205', 'ICA', 'CHINCHA', 'GROCIO PRADO', 0, 0),
(978, '10', '1002', '100206', 'ICA', 'CHINCHA', 'SAN PEDRO DE HUACARPANA', 0, 0),
(979, '10', '1002', '100207', 'ICA', 'CHINCHA', 'SUNAMPE', 0, 0),
(980, '10', '1002', '100208', 'ICA', 'CHINCHA', 'TAMBO DE MORA', 0, 0),
(981, '10', '1002', '100209', 'ICA', 'CHINCHA', 'ALTO LARAN', 0, 0),
(982, '10', '1002', '100210', 'ICA', 'CHINCHA', 'PUEBLO NUEVO', 0, 0),
(983, '10', '1002', '100211', 'ICA', 'CHINCHA', 'SAN JUAN DE YANAC', 0, 0),
(984, '10', '1003', '100301', 'ICA', 'NAZCA', 'NAZCA', 0, 0),
(985, '10', '1003', '100302', 'ICA', 'NAZCA', 'CHANGUILLO', 0, 0),
(986, '10', '1003', '100303', 'ICA', 'NAZCA', 'EL INGENIO', 0, 0),
(987, '10', '1003', '100304', 'ICA', 'NAZCA', 'MARCONA', 0, 0),
(988, '10', '1003', '100305', 'ICA', 'NAZCA', 'VISTA ALEGRE', 0, 0),
(989, '10', '1004', '100401', 'ICA', 'PISCO', 'PISCO', 0, 0),
(990, '10', '1004', '100402', 'ICA', 'PISCO', 'HUANCANO', 0, 0),
(991, '10', '1004', '100403', 'ICA', 'PISCO', 'HUMAY', 0, 0),
(992, '10', '1004', '100404', 'ICA', 'PISCO', 'INDEPENDENCIA', 0, 0),
(993, '10', '1004', '100405', 'ICA', 'PISCO', 'PARACAS', 0, 0),
(994, '10', '1004', '100406', 'ICA', 'PISCO', 'SAN ANDRES', 0, 0),
(995, '10', '1004', '100407', 'ICA', 'PISCO', 'SAN CLEMENTE', 0, 0),
(996, '10', '1004', '100408', 'ICA', 'PISCO', 'TUPAC AMARU INCA', 0, 0),
(997, '10', '1005', '100501', 'ICA', 'PALPA', 'PALPA', 0, 0),
(998, '10', '1005', '100502', 'ICA', 'PALPA', 'LLIPATA', 0, 0),
(999, '10', '1005', '100503', 'ICA', 'PALPA', 'RIO GRANDE', 0, 0),
(1000, '10', '1005', '100504', 'ICA', 'PALPA', 'SANTA CRUZ', 0, 0),
(1001, '10', '1005', '100505', 'ICA', 'PALPA', 'TIBILLO', 0, 0),
(1002, '11', '1101', '110101', 'JUNIN', 'HUANCAYO', 'HUANCAYO', 0, 0),
(1003, '11', '1101', '110103', 'JUNIN', 'HUANCAYO', 'CARHUACALLANGA', 0, 0),
(1004, '11', '1101', '110104', 'JUNIN', 'HUANCAYO', 'COLCA', 0, 0),
(1005, '11', '1101', '110105', 'JUNIN', 'HUANCAYO', 'CULLHUAS', 0, 0),
(1006, '11', '1101', '110106', 'JUNIN', 'HUANCAYO', 'CHACAPAMPA', 0, 0),
(1007, '11', '1101', '110107', 'JUNIN', 'HUANCAYO', 'CHICCHE', 0, 0),
(1008, '11', '1101', '110108', 'JUNIN', 'HUANCAYO', 'CHILCA', 0, 0),
(1009, '11', '1101', '110109', 'JUNIN', 'HUANCAYO', 'CHONGOS ALTO', 0, 0),
(1010, '11', '1101', '110112', 'JUNIN', 'HUANCAYO', 'CHUPURO', 0, 0),
(1011, '11', '1101', '110113', 'JUNIN', 'HUANCAYO', 'EL TAMBO', 0, 0),
(1012, '11', '1101', '110114', 'JUNIN', 'HUANCAYO', 'HUACRAPUQUIO', 0, 0),
(1013, '11', '1101', '110116', 'JUNIN', 'HUANCAYO', 'HUALHUAS', 0, 0),
(1014, '11', '1101', '110118', 'JUNIN', 'HUANCAYO', 'HUANCAN', 0, 0),
(1015, '11', '1101', '110119', 'JUNIN', 'HUANCAYO', 'HUASICANCHA', 0, 0),
(1016, '11', '1101', '110120', 'JUNIN', 'HUANCAYO', 'HUAYUCACHI', 0, 0),
(1017, '11', '1101', '110121', 'JUNIN', 'HUANCAYO', 'INGENIO', 0, 0),
(1018, '11', '1101', '110122', 'JUNIN', 'HUANCAYO', 'PARIAHUANCA', 0, 0),
(1019, '11', '1101', '110123', 'JUNIN', 'HUANCAYO', 'PILCOMAYO', 0, 0),
(1020, '11', '1101', '110124', 'JUNIN', 'HUANCAYO', 'PUCARA', 0, 0),
(1021, '11', '1101', '110125', 'JUNIN', 'HUANCAYO', 'QUICHUAY', 0, 0),
(1022, '11', '1101', '110126', 'JUNIN', 'HUANCAYO', 'QUILCAS', 0, 0),
(1023, '11', '1101', '110127', 'JUNIN', 'HUANCAYO', 'SAN AGUSTIN', 0, 0),
(1024, '11', '1101', '110128', 'JUNIN', 'HUANCAYO', 'SAN JERONIMO DE TUNAN', 0, 0),
(1025, '11', '1101', '110131', 'JUNIN', 'HUANCAYO', 'SANTO DOMINGO DE ACOBAMBA', 0, 0),
(1026, '11', '1101', '110132', 'JUNIN', 'HUANCAYO', 'SA', 0, 0),
(1027, '11', '1101', '110133', 'JUNIN', 'HUANCAYO', 'SAPALLANGA', 0, 0),
(1028, '11', '1101', '110134', 'JUNIN', 'HUANCAYO', 'SICAYA', 0, 0),
(1029, '11', '1101', '110136', 'JUNIN', 'HUANCAYO', 'VIQUES', 0, 0),
(1030, '11', '1102', '110201', 'JUNIN', 'CONCEPCION', 'CONCEPCION', 0, 0),
(1031, '11', '1102', '110202', 'JUNIN', 'CONCEPCION', 'ACO', 0, 0),
(1032, '11', '1102', '110203', 'JUNIN', 'CONCEPCION', 'ANDAMARCA', 0, 0),
(1033, '11', '1102', '110204', 'JUNIN', 'CONCEPCION', 'COMAS', 0, 0),
(1034, '11', '1102', '110205', 'JUNIN', 'CONCEPCION', 'COCHAS', 0, 0),
(1035, '11', '1102', '110206', 'JUNIN', 'CONCEPCION', 'CHAMBARA', 0, 0),
(1036, '11', '1102', '110207', 'JUNIN', 'CONCEPCION', 'HEROINAS TOLEDO', 0, 0),
(1037, '11', '1102', '110208', 'JUNIN', 'CONCEPCION', 'MANZANARES', 0, 0),
(1038, '11', '1102', '110209', 'JUNIN', 'CONCEPCION', 'MARISCAL CASTILLA', 0, 0),
(1039, '11', '1102', '110210', 'JUNIN', 'CONCEPCION', 'MATAHUASI', 0, 0),
(1040, '11', '1102', '110211', 'JUNIN', 'CONCEPCION', 'MITO', 0, 0),
(1041, '11', '1102', '110212', 'JUNIN', 'CONCEPCION', 'NUEVE DE JULIO', 0, 0),
(1042, '11', '1102', '110213', 'JUNIN', 'CONCEPCION', 'ORCOTUNA', 0, 0),
(1043, '11', '1102', '110214', 'JUNIN', 'CONCEPCION', 'SANTA ROSA DE OCOPA', 0, 0),
(1044, '11', '1102', '110215', 'JUNIN', 'CONCEPCION', 'SAN JOSE DE QUERO', 0, 0),
(1045, '11', '1103', '110301', 'JUNIN', 'JAUJA', 'JAUJA', 0, 0),
(1046, '11', '1103', '110302', 'JUNIN', 'JAUJA', 'ACOLLA', 0, 0),
(1047, '11', '1103', '110303', 'JUNIN', 'JAUJA', 'APATA', 0, 0),
(1048, '11', '1103', '110304', 'JUNIN', 'JAUJA', 'ATAURA', 0, 0),
(1049, '11', '1103', '110305', 'JUNIN', 'JAUJA', 'CANCHAYLLO', 0, 0),
(1050, '11', '1103', '110306', 'JUNIN', 'JAUJA', 'EL MANTARO', 0, 0),
(1051, '11', '1103', '110307', 'JUNIN', 'JAUJA', 'HUAMALI', 0, 0),
(1052, '11', '1103', '110308', 'JUNIN', 'JAUJA', 'HUARIPAMPA', 0, 0),
(1053, '11', '1103', '110309', 'JUNIN', 'JAUJA', 'HUERTAS', 0, 0),
(1054, '11', '1103', '110310', 'JUNIN', 'JAUJA', 'JANJAILLO', 0, 0),
(1055, '11', '1103', '110311', 'JUNIN', 'JAUJA', 'JULCAN', 0, 0),
(1056, '11', '1103', '110312', 'JUNIN', 'JAUJA', 'LEONOR ORDO', 0, 0),
(1057, '11', '1103', '110313', 'JUNIN', 'JAUJA', 'LLOCLLAPAMPA', 0, 0),
(1058, '11', '1103', '110314', 'JUNIN', 'JAUJA', 'MARCO', 0, 0),
(1059, '11', '1103', '110315', 'JUNIN', 'JAUJA', 'MASMA', 0, 0),
(1060, '11', '1103', '110316', 'JUNIN', 'JAUJA', 'MOLINOS', 0, 0),
(1061, '11', '1103', '110317', 'JUNIN', 'JAUJA', 'MONOBAMBA', 0, 0),
(1062, '11', '1103', '110318', 'JUNIN', 'JAUJA', 'MUQUI', 0, 0),
(1063, '11', '1103', '110319', 'JUNIN', 'JAUJA', 'MUQUIYAUYO', 0, 0),
(1064, '11', '1103', '110320', 'JUNIN', 'JAUJA', 'PACA', 0, 0),
(1065, '11', '1103', '110321', 'JUNIN', 'JAUJA', 'PACCHA', 0, 0),
(1066, '11', '1103', '110322', 'JUNIN', 'JAUJA', 'PANCAN', 0, 0),
(1067, '11', '1103', '110323', 'JUNIN', 'JAUJA', 'PARCO', 0, 0),
(1068, '11', '1103', '110324', 'JUNIN', 'JAUJA', 'POMACANCHA', 0, 0),
(1069, '11', '1103', '110325', 'JUNIN', 'JAUJA', 'RICRAN', 0, 0),
(1070, '11', '1103', '110326', 'JUNIN', 'JAUJA', 'SAN LORENZO', 0, 0),
(1071, '11', '1103', '110327', 'JUNIN', 'JAUJA', 'SAN PEDRO DE CHUNAN', 0, 0),
(1072, '11', '1103', '110328', 'JUNIN', 'JAUJA', 'SINCOS', 0, 0),
(1073, '11', '1103', '110329', 'JUNIN', 'JAUJA', 'TUNAN MARCA', 0, 0),
(1074, '11', '1103', '110330', 'JUNIN', 'JAUJA', 'YAULI', 0, 0),
(1075, '11', '1103', '110331', 'JUNIN', 'JAUJA', 'CURICACA', 0, 0),
(1076, '11', '1103', '110332', 'JUNIN', 'JAUJA', 'MASMA CHICCHE', 0, 0),
(1077, '11', '1103', '110333', 'JUNIN', 'JAUJA', 'SAUSA', 0, 0),
(1078, '11', '1103', '110334', 'JUNIN', 'JAUJA', 'YAUYOS', 0, 0),
(1079, '11', '1104', '110401', 'JUNIN', 'JUNIN', 'JUNIN', 0, 0),
(1080, '11', '1104', '110402', 'JUNIN', 'JUNIN', 'CARHUAMAYO', 0, 0),
(1081, '11', '1104', '110403', 'JUNIN', 'JUNIN', 'ONDORES', 0, 0),
(1082, '11', '1104', '110404', 'JUNIN', 'JUNIN', 'ULCUMAYO', 0, 0),
(1083, '11', '1105', '110501', 'JUNIN', 'TARMA', 'TARMA', 0, 0),
(1084, '11', '1105', '110502', 'JUNIN', 'TARMA', 'ACOBAMBA', 0, 0),
(1085, '11', '1105', '110503', 'JUNIN', 'TARMA', 'HUARICOLCA', 0, 0),
(1086, '11', '1105', '110504', 'JUNIN', 'TARMA', 'HUASAHUASI', 0, 0),
(1087, '11', '1105', '110505', 'JUNIN', 'TARMA', 'LA UNION', 0, 0),
(1088, '11', '1105', '110506', 'JUNIN', 'TARMA', 'PALCA', 0, 0),
(1089, '11', '1105', '110507', 'JUNIN', 'TARMA', 'PALCAMAYO', 0, 0),
(1090, '11', '1105', '110508', 'JUNIN', 'TARMA', 'SAN PEDRO DE CAJAS', 0, 0),
(1091, '11', '1105', '110509', 'JUNIN', 'TARMA', 'TAPO', 0, 0),
(1092, '11', '1106', '110601', 'JUNIN', 'YAULI', 'LA OROYA', 0, 0),
(1093, '11', '1106', '110602', 'JUNIN', 'YAULI', 'CHACAPALPA', 0, 0),
(1094, '11', '1106', '110603', 'JUNIN', 'YAULI', 'HUAY HUAY', 0, 0),
(1095, '11', '1106', '110604', 'JUNIN', 'YAULI', 'MARCAPOMACOCHA', 0, 0),
(1096, '11', '1106', '110605', 'JUNIN', 'YAULI', 'MOROCOCHA', 0, 0),
(1097, '11', '1106', '110606', 'JUNIN', 'YAULI', 'PACCHA', 0, 0),
(1098, '11', '1106', '110607', 'JUNIN', 'YAULI', 'SANTA BARBARA DE CARHUACAYAN', 0, 0),
(1099, '11', '1106', '110608', 'JUNIN', 'YAULI', 'SUITUCANCHA', 0, 0),
(1100, '11', '1106', '110609', 'JUNIN', 'YAULI', 'YAULI', 0, 0),
(1101, '11', '1106', '110610', 'JUNIN', 'YAULI', 'SANTA ROSA DE SACCO', 0, 0),
(1102, '11', '1107', '110701', 'JUNIN', 'SATIPO', 'SATIPO', 0, 0),
(1103, '11', '1107', '110702', 'JUNIN', 'SATIPO', 'COVIRIALI', 0, 0),
(1104, '11', '1107', '110703', 'JUNIN', 'SATIPO', 'LLAYLLA', 0, 0),
(1105, '11', '1107', '110704', 'JUNIN', 'SATIPO', 'MAZAMARI', 0, 0),
(1106, '11', '1107', '110705', 'JUNIN', 'SATIPO', 'PAMPA HERMOSA', 0, 0),
(1107, '11', '1107', '110706', 'JUNIN', 'SATIPO', 'PANGOA', 0, 0),
(1108, '11', '1107', '110707', 'JUNIN', 'SATIPO', 'RIO NEGRO', 0, 0),
(1109, '11', '1107', '110708', 'JUNIN', 'SATIPO', 'RIO TAMBO', 0, 0),
(1110, '11', '1108', '110801', 'JUNIN', 'CHANCHAMAYO', 'CHANCHAMAYO', 0, 0),
(1111, '11', '1108', '110802', 'JUNIN', 'CHANCHAMAYO', 'SAN RAMON', 0, 0),
(1112, '11', '1108', '110803', 'JUNIN', 'CHANCHAMAYO', 'VITOC', 0, 0),
(1113, '11', '1108', '110804', 'JUNIN', 'CHANCHAMAYO', 'SAN LUIS DE SHUARO', 0, 0),
(1114, '11', '1108', '110805', 'JUNIN', 'CHANCHAMAYO', 'PICHANAQUI', 0, 0),
(1115, '11', '1108', '110806', 'JUNIN', 'CHANCHAMAYO', 'PERENE', 0, 0),
(1116, '11', '1109', '110901', 'JUNIN', 'CHUPACA', 'CHUPACA', 0, 0),
(1117, '11', '1109', '110902', 'JUNIN', 'CHUPACA', 'AHUAC', 0, 0),
(1118, '11', '1109', '110903', 'JUNIN', 'CHUPACA', 'CHONGOS BAJO', 0, 0),
(1119, '11', '1109', '110904', 'JUNIN', 'CHUPACA', 'HUACHAC', 0, 0),
(1120, '11', '1109', '110905', 'JUNIN', 'CHUPACA', 'HUAMANCACA CHICO', 0, 0),
(1121, '11', '1109', '110906', 'JUNIN', 'CHUPACA', 'SAN JUAN DE YSCOS', 0, 0),
(1122, '11', '1109', '110907', 'JUNIN', 'CHUPACA', 'SAN JUAN DE JARPA', 0, 0),
(1123, '11', '1109', '110908', 'JUNIN', 'CHUPACA', 'TRES DE DICIEMBRE', 0, 0),
(1124, '11', '1109', '110909', 'JUNIN', 'CHUPACA', 'YANACANCHA', 0, 0),
(1125, '12', '1201', '120101', 'LA LIBERTAD', 'TRUJILLO', 'TRUJILLO', 0, 0),
(1126, '12', '1201', '120102', 'LA LIBERTAD', 'TRUJILLO', 'HUANCHACO', 0, 0),
(1127, '12', '1201', '120103', 'LA LIBERTAD', 'TRUJILLO', 'LAREDO', 0, 0),
(1128, '12', '1201', '120104', 'LA LIBERTAD', 'TRUJILLO', 'MOCHE', 0, 0),
(1129, '12', '1201', '120105', 'LA LIBERTAD', 'TRUJILLO', 'SALAVERRY', 0, 0),
(1130, '12', '1201', '120106', 'LA LIBERTAD', 'TRUJILLO', 'SIMBAL', 0, 0),
(1131, '12', '1201', '120107', 'LA LIBERTAD', 'TRUJILLO', 'VICTOR LARCO HERRERA', 0, 0),
(1132, '12', '1201', '120109', 'LA LIBERTAD', 'TRUJILLO', 'POROTO', 0, 0),
(1133, '12', '1201', '120110', 'LA LIBERTAD', 'TRUJILLO', 'EL PORVENIR', 0, 0),
(1134, '12', '1201', '120111', 'LA LIBERTAD', 'TRUJILLO', 'LA ESPERANZA', 0, 0),
(1135, '12', '1201', '120112', 'LA LIBERTAD', 'TRUJILLO', 'FLORENCIA DE MORA', 0, 0),
(1136, '12', '1202', '120201', 'LA LIBERTAD', 'BOLIVAR', 'BOLIVAR', 0, 0),
(1137, '12', '1202', '120202', 'LA LIBERTAD', 'BOLIVAR', 'BAMBAMARCA', 0, 0),
(1138, '12', '1202', '120203', 'LA LIBERTAD', 'BOLIVAR', 'CONDORMARCA', 0, 0),
(1139, '12', '1202', '120204', 'LA LIBERTAD', 'BOLIVAR', 'LONGOTEA', 0, 0),
(1140, '12', '1202', '120205', 'LA LIBERTAD', 'BOLIVAR', 'UCUNCHA', 0, 0),
(1141, '12', '1202', '120206', 'LA LIBERTAD', 'BOLIVAR', 'UCHUMARCA', 0, 0),
(1142, '12', '1203', '120301', 'LA LIBERTAD', 'SANCHEZ CARRION', 'HUAMACHUCO', 0, 0),
(1143, '12', '1203', '120302', 'LA LIBERTAD', 'SANCHEZ CARRION', 'COCHORCO', 0, 0),
(1144, '12', '1203', '120303', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CURGOS', 0, 0),
(1145, '12', '1203', '120304', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CHUGAY', 0, 0),
(1146, '12', '1203', '120305', 'LA LIBERTAD', 'SANCHEZ CARRION', 'MARCABAL', 0, 0),
(1147, '12', '1203', '120306', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SANAGORAN', 0, 0),
(1148, '12', '1203', '120307', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARIN', 0, 0),
(1149, '12', '1203', '120308', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARTIMBAMBA', 0, 0),
(1150, '12', '1204', '120401', 'LA LIBERTAD', 'OTUZCO', 'OTUZCO', 0, 0),
(1151, '12', '1204', '120402', 'LA LIBERTAD', 'OTUZCO', 'AGALLPAMPA', 0, 0),
(1152, '12', '1204', '120403', 'LA LIBERTAD', 'OTUZCO', 'CHARAT', 0, 0),
(1153, '12', '1204', '120404', 'LA LIBERTAD', 'OTUZCO', 'HUARANCHAL', 0, 0),
(1154, '12', '1204', '120405', 'LA LIBERTAD', 'OTUZCO', 'LA CUESTA', 0, 0),
(1155, '12', '1204', '120408', 'LA LIBERTAD', 'OTUZCO', 'PARANDAY', 0, 0),
(1156, '12', '1204', '120409', 'LA LIBERTAD', 'OTUZCO', 'SALPO', 0, 0),
(1157, '12', '1204', '120410', 'LA LIBERTAD', 'OTUZCO', 'SINSICAP', 0, 0),
(1158, '12', '1204', '120411', 'LA LIBERTAD', 'OTUZCO', 'USQUIL', 0, 0),
(1159, '12', '1204', '120413', 'LA LIBERTAD', 'OTUZCO', 'MACHE', 0, 0),
(1160, '12', '1205', '120501', 'LA LIBERTAD', 'PACASMAYO', 'SAN PEDRO DE LLOC', 0, 0),
(1161, '12', '1205', '120503', 'LA LIBERTAD', 'PACASMAYO', 'GUADALUPE', 0, 0),
(1162, '12', '1205', '120504', 'LA LIBERTAD', 'PACASMAYO', 'JEQUETEPEQUE', 0, 0),
(1163, '12', '1205', '120506', 'LA LIBERTAD', 'PACASMAYO', 'PACASMAYO', 0, 0),
(1164, '12', '1205', '120508', 'LA LIBERTAD', 'PACASMAYO', 'SAN JOSE', 0, 0),
(1165, '12', '1206', '120601', 'LA LIBERTAD', 'PATAZ', 'TAYABAMBA', 0, 0),
(1166, '12', '1206', '120602', 'LA LIBERTAD', 'PATAZ', 'BULDIBUYO', 0, 0),
(1167, '12', '1206', '120603', 'LA LIBERTAD', 'PATAZ', 'CHILLIA', 0, 0),
(1168, '12', '1206', '120604', 'LA LIBERTAD', 'PATAZ', 'HUAYLILLAS', 0, 0),
(1169, '12', '1206', '120605', 'LA LIBERTAD', 'PATAZ', 'HUANCASPATA', 0, 0),
(1170, '12', '1206', '120606', 'LA LIBERTAD', 'PATAZ', 'HUAYO', 0, 0),
(1171, '12', '1206', '120607', 'LA LIBERTAD', 'PATAZ', 'ONGON', 0, 0),
(1172, '12', '1206', '120608', 'LA LIBERTAD', 'PATAZ', 'PARCOY', 0, 0),
(1173, '12', '1206', '120609', 'LA LIBERTAD', 'PATAZ', 'PATAZ', 0, 0),
(1174, '12', '1206', '120610', 'LA LIBERTAD', 'PATAZ', 'PIAS', 0, 0),
(1175, '12', '1206', '120611', 'LA LIBERTAD', 'PATAZ', 'TAURIJA', 0, 0),
(1176, '12', '1206', '120612', 'LA LIBERTAD', 'PATAZ', 'URPAY', 0, 0),
(1177, '12', '1206', '120613', 'LA LIBERTAD', 'PATAZ', 'SANTIAGO DE CHALLAS', 0, 0),
(1178, '12', '1207', '120701', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTIAGO DE CHUCO', 0, 0),
(1179, '12', '1207', '120702', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'CACHICADAN', 0, 0),
(1180, '12', '1207', '120703', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEBAMBA', 0, 0),
(1181, '12', '1207', '120704', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEPATA', 0, 0),
(1182, '12', '1207', '120705', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'QUIRUVILCA', 0, 0),
(1183, '12', '1207', '120706', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTA CRUZ DE CHUCA', 0, 0),
(1184, '12', '1207', '120707', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SITABAMBA', 0, 0),
(1185, '12', '1207', '120708', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'ANGASMARCA', 0, 0),
(1186, '12', '1208', '120801', 'LA LIBERTAD', 'ASCOPE', 'ASCOPE', 0, 0),
(1187, '12', '1208', '120802', 'LA LIBERTAD', 'ASCOPE', 'CHICAMA', 0, 0),
(1188, '12', '1208', '120803', 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE', 0, 0),
(1189, '12', '1208', '120804', 'LA LIBERTAD', 'ASCOPE', 'SANTIAGO DE CAO', 0, 0),
(1190, '12', '1208', '120805', 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO', 0, 0),
(1191, '12', '1208', '120806', 'LA LIBERTAD', 'ASCOPE', 'PAIJAN', 0, 0),
(1192, '12', '1208', '120807', 'LA LIBERTAD', 'ASCOPE', 'RAZURI', 0, 0),
(1193, '12', '1208', '120808', 'LA LIBERTAD', 'ASCOPE', 'CASA GRANDE', 0, 0),
(1194, '12', '1209', '120901', 'LA LIBERTAD', 'CHEPEN', 'CHEPEN', 0, 0),
(1195, '12', '1209', '120902', 'LA LIBERTAD', 'CHEPEN', 'PACANGA', 0, 0),
(1196, '12', '1209', '120903', 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO', 0, 0),
(1197, '12', '1210', '121001', 'LA LIBERTAD', 'JULCAN', 'JULCAN', 0, 0),
(1198, '12', '1210', '121002', 'LA LIBERTAD', 'JULCAN', 'CARABAMBA', 0, 0),
(1199, '12', '1210', '121003', 'LA LIBERTAD', 'JULCAN', 'CALAMARCA', 0, 0),
(1200, '12', '1210', '121004', 'LA LIBERTAD', 'JULCAN', 'HUASO', 0, 0),
(1201, '12', '1211', '121101', 'LA LIBERTAD', 'GRAN CHIMU', 'CASCAS', 0, 0),
(1202, '12', '1211', '121102', 'LA LIBERTAD', 'GRAN CHIMU', 'LUCMA', 0, 0),
(1203, '12', '1211', '121103', 'LA LIBERTAD', 'GRAN CHIMU', 'MARMOT', 0, 0),
(1204, '12', '1211', '121104', 'LA LIBERTAD', 'GRAN CHIMU', 'SAYAPULLO', 0, 0),
(1205, '12', '1212', '121201', 'LA LIBERTAD', 'VIRU', 'VIRU', 0, 0),
(1206, '12', '1212', '121202', 'LA LIBERTAD', 'VIRU', 'CHAO', 0, 0),
(1207, '12', '1212', '121203', 'LA LIBERTAD', 'VIRU', 'GUADALUPITO', 0, 0),
(1208, '13', '1301', '130101', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 0, 0),
(1209, '13', '1301', '130102', 'LAMBAYEQUE', 'CHICLAYO', 'CHONGOYAPE', 0, 0),
(1210, '13', '1301', '130103', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN', 0, 0),
(1211, '13', '1301', '130104', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN PUERTO', 0, 0),
(1212, '13', '1301', '130105', 'LAMBAYEQUE', 'CHICLAYO', 'LAGUNAS', 0, 0),
(1213, '13', '1301', '130106', 'LAMBAYEQUE', 'CHICLAYO', 'MONSEFU', 0, 0),
(1214, '13', '1301', '130107', 'LAMBAYEQUE', 'CHICLAYO', 'NUEVA ARICA', 0, 0),
(1215, '13', '1301', '130108', 'LAMBAYEQUE', 'CHICLAYO', 'OYOTUN', 0, 0),
(1216, '13', '1301', '130109', 'LAMBAYEQUE', 'CHICLAYO', 'PICSI', 0, 0),
(1217, '13', '1301', '130110', 'LAMBAYEQUE', 'CHICLAYO', 'PIMENTEL', 0, 0),
(1218, '13', '1301', '130111', 'LAMBAYEQUE', 'CHICLAYO', 'REQUE', 0, 0),
(1219, '13', '1301', '130112', 'LAMBAYEQUE', 'CHICLAYO', 'JOSE LEONARDO ORTIZ', 0, 0),
(1220, '13', '1301', '130113', 'LAMBAYEQUE', 'CHICLAYO', 'SANTA ROSA', 0, 0),
(1221, '13', '1301', '130114', 'LAMBAYEQUE', 'CHICLAYO', 'SA', 0, 0),
(1222, '13', '1301', '130115', 'LAMBAYEQUE', 'CHICLAYO', 'LA VICTORIA', 0, 0),
(1223, '13', '1301', '130116', 'LAMBAYEQUE', 'CHICLAYO', 'CAYALTI', 0, 0),
(1224, '13', '1301', '130117', 'LAMBAYEQUE', 'CHICLAYO', 'PATAPO', 0, 0),
(1225, '13', '1301', '130118', 'LAMBAYEQUE', 'CHICLAYO', 'POMALCA', 0, 0),
(1226, '13', '1301', '130119', 'LAMBAYEQUE', 'CHICLAYO', 'PUCALA', 0, 0),
(1227, '13', '1301', '130120', 'LAMBAYEQUE', 'CHICLAYO', 'TUMAN', 0, 0),
(1228, '13', '1302', '130201', 'LAMBAYEQUE', 'FERRE', 'FERRE', 0, 0),
(1229, '13', '1302', '130202', 'LAMBAYEQUE', 'FERRE', 'INCAHUASI', 0, 0),
(1230, '13', '1302', '130203', 'LAMBAYEQUE', 'FERRE', 'CA', 0, 0),
(1231, '13', '1302', '130204', 'LAMBAYEQUE', 'FERRE', 'PITIPO', 0, 0),
(1232, '13', '1302', '130205', 'LAMBAYEQUE', 'FERRE', 'PUEBLO NUEVO', 0, 0),
(1233, '13', '1302', '130206', 'LAMBAYEQUE', 'FERRE', 'MANUEL ANTONIO MESONES MURO', 0, 0),
(1234, '13', '1303', '130301', 'LAMBAYEQUE', 'LAMBAYEQUE', 'LAMBAYEQUE', 0, 0),
(1235, '13', '1303', '130302', 'LAMBAYEQUE', 'LAMBAYEQUE', 'CHOCHOPE', 0, 0),
(1236, '13', '1303', '130303', 'LAMBAYEQUE', 'LAMBAYEQUE', 'ILLIMO', 0, 0),
(1237, '13', '1303', '130304', 'LAMBAYEQUE', 'LAMBAYEQUE', 'JAYANCA', 0, 0),
(1238, '13', '1303', '130305', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOCHUMI', 0, 0),
(1239, '13', '1303', '130306', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MORROPE', 0, 0),
(1240, '13', '1303', '130307', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOTUPE', 0, 0),
(1241, '13', '1303', '130308', 'LAMBAYEQUE', 'LAMBAYEQUE', 'OLMOS', 0, 0),
(1242, '13', '1303', '130309', 'LAMBAYEQUE', 'LAMBAYEQUE', 'PACORA', 0, 0),
(1243, '13', '1303', '130310', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SALAS', 0, 0),
(1244, '13', '1303', '130311', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SAN JOSE', 0, 0),
(1245, '13', '1303', '130312', 'LAMBAYEQUE', 'LAMBAYEQUE', 'TUCUME', 0, 0),
(1246, '14', '1401', '140101', 'LIMA', 'LIMA', 'LIMA', 0, 0),
(1247, '14', '1401', '140102', 'LIMA', 'LIMA', 'ANCON', 0, 0),
(1248, '14', '1401', '140103', 'LIMA', 'LIMA', 'ATE', 0, 0),
(1249, '14', '1401', '140104', 'LIMA', 'LIMA', 'BRE', 0, 0),
(1250, '14', '1401', '140105', 'LIMA', 'LIMA', 'CARABAYLLO', 0, 0),
(1251, '14', '1401', '140106', 'LIMA', 'LIMA', 'COMAS', 0, 0),
(1252, '14', '1401', '140107', 'LIMA', 'LIMA', 'CHACLACAYO', 0, 0),
(1253, '14', '1401', '140108', 'LIMA', 'LIMA', 'CHORRILLOS', 0, 0),
(1254, '14', '1401', '140109', 'LIMA', 'LIMA', 'LA VICTORIA', 0, 0),
(1255, '14', '1401', '140110', 'LIMA', 'LIMA', 'LA MOLINA', 0, 0),
(1256, '14', '1401', '140111', 'LIMA', 'LIMA', 'LINCE', 0, 0),
(1257, '14', '1401', '140112', 'LIMA', 'LIMA', 'LURIGANCHO', 0, 0),
(1258, '14', '1401', '140113', 'LIMA', 'LIMA', 'LURIN', 0, 0),
(1259, '14', '1401', '140114', 'LIMA', 'LIMA', 'MAGDALENA DEL MAR', 0, 0),
(1260, '14', '1401', '140115', 'LIMA', 'LIMA', 'MIRAFLORES', 0, 0),
(1261, '14', '1401', '140116', 'LIMA', 'LIMA', 'PACHACAMAC', 0, 0),
(1262, '14', '1401', '140117', 'LIMA', 'LIMA', 'PUEBLO LIBRE', 0, 0),
(1263, '14', '1401', '140118', 'LIMA', 'LIMA', 'PUCUSANA', 0, 0),
(1264, '14', '1401', '140119', 'LIMA', 'LIMA', 'PUENTE PIEDRA', 0, 0),
(1265, '14', '1401', '140120', 'LIMA', 'LIMA', 'PUNTA HERMOSA', 0, 0),
(1266, '14', '1401', '140121', 'LIMA', 'LIMA', 'PUNTA NEGRA', 0, 0),
(1267, '14', '1401', '140122', 'LIMA', 'LIMA', 'RIMAC', 0, 0),
(1268, '14', '1401', '140123', 'LIMA', 'LIMA', 'SAN BARTOLO', 0, 0),
(1269, '14', '1401', '140124', 'LIMA', 'LIMA', 'SAN ISIDRO', 0, 0),
(1270, '14', '1401', '140125', 'LIMA', 'LIMA', 'BARRANCO', 0, 0),
(1271, '14', '1401', '140126', 'LIMA', 'LIMA', 'SAN MARTIN DE PORRES', 0, 0),
(1272, '14', '1401', '140127', 'LIMA', 'LIMA', 'SAN MIGUEL', 0, 0),
(1273, '14', '1401', '140128', 'LIMA', 'LIMA', 'SANTA MARIA DEL MAR', 0, 0),
(1274, '14', '1401', '140129', 'LIMA', 'LIMA', 'SANTA ROSA', 0, 0),
(1275, '14', '1401', '140130', 'LIMA', 'LIMA', 'SANTIAGO DE SURCO', 0, 0),
(1276, '14', '1401', '140131', 'LIMA', 'LIMA', 'SURQUILLO', 0, 0),
(1277, '14', '1401', '140132', 'LIMA', 'LIMA', 'VILLA MARIA DEL TRIUNFO', 0, 0),
(1278, '14', '1401', '140133', 'LIMA', 'LIMA', 'JESUS MARIA', 0, 0),
(1279, '14', '1401', '140134', 'LIMA', 'LIMA', 'INDEPENDENCIA', 0, 0),
(1280, '14', '1401', '140135', 'LIMA', 'LIMA', 'EL AGUSTINO', 0, 0),
(1281, '14', '1401', '140136', 'LIMA', 'LIMA', 'SAN JUAN DE MIRAFLORES', 0, 0),
(1282, '14', '1401', '140137', 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO', 0, 0),
(1283, '14', '1401', '140138', 'LIMA', 'LIMA', 'SAN LUIS', 0, 0),
(1284, '14', '1401', '140139', 'LIMA', 'LIMA', 'CIENEGUILLA', 0, 0),
(1285, '14', '1401', '140140', 'LIMA', 'LIMA', 'SAN BORJA', 0, 0),
(1286, '14', '1401', '140141', 'LIMA', 'LIMA', 'VILLA EL SALVADOR', 0, 0),
(1287, '14', '1401', '140142', 'LIMA', 'LIMA', 'LOS OLIVOS', 0, 0),
(1288, '14', '1401', '140143', 'LIMA', 'LIMA', 'SANTA ANITA', 0, 0),
(1289, '14', '1402', '140201', 'LIMA', 'CAJATAMBO', 'CAJATAMBO', 0, 0),
(1290, '14', '1402', '140205', 'LIMA', 'CAJATAMBO', 'COPA', 0, 0),
(1291, '14', '1402', '140206', 'LIMA', 'CAJATAMBO', 'GORGOR', 0, 0),
(1292, '14', '1402', '140207', 'LIMA', 'CAJATAMBO', 'HUANCAPON', 0, 0),
(1293, '14', '1402', '140208', 'LIMA', 'CAJATAMBO', 'MANAS', 0, 0),
(1294, '14', '1403', '140301', 'LIMA', 'CANTA', 'CANTA', 0, 0),
(1295, '14', '1403', '140302', 'LIMA', 'CANTA', 'ARAHUAY', 0, 0),
(1296, '14', '1403', '140303', 'LIMA', 'CANTA', 'HUAMANTANGA', 0, 0),
(1297, '14', '1403', '140304', 'LIMA', 'CANTA', 'HUAROS', 0, 0),
(1298, '14', '1403', '140305', 'LIMA', 'CANTA', 'LACHAQUI', 0, 0),
(1299, '14', '1403', '140306', 'LIMA', 'CANTA', 'SAN BUENAVENTURA', 0, 0),
(1300, '14', '1403', '140307', 'LIMA', 'CANTA', 'SANTA ROSA DE QUIVES', 0, 0),
(1301, '14', '1404', '140401', 'LIMA', 'CA', 'SAN VICENTE DE CA', 0, 0),
(1302, '14', '1404', '140402', 'LIMA', 'CA', 'CALANGO', 0, 0),
(1303, '14', '1404', '140403', 'LIMA', 'CA', 'CERRO AZUL', 0, 0),
(1304, '14', '1404', '140404', 'LIMA', 'CA', 'COAYLLO', 0, 0),
(1305, '14', '1404', '140405', 'LIMA', 'CA', 'CHILCA', 0, 0),
(1306, '14', '1404', '140406', 'LIMA', 'CA', 'IMPERIAL', 0, 0),
(1307, '14', '1404', '140407', 'LIMA', 'CA', 'LUNAHUANA', 0, 0),
(1308, '14', '1404', '140408', 'LIMA', 'CA', 'MALA', 0, 0),
(1309, '14', '1404', '140409', 'LIMA', 'CA', 'NUEVO IMPERIAL', 0, 0),
(1310, '14', '1404', '140410', 'LIMA', 'CA', 'PACARAN', 0, 0),
(1311, '14', '1404', '140411', 'LIMA', 'CA', 'QUILMANA', 0, 0),
(1312, '14', '1404', '140412', 'LIMA', 'CA', 'SAN ANTONIO', 0, 0),
(1313, '14', '1404', '140413', 'LIMA', 'CA', 'SAN LUIS', 0, 0),
(1314, '14', '1404', '140414', 'LIMA', 'CA', 'SANTA CRUZ DE FLORES', 0, 0),
(1315, '14', '1404', '140415', 'LIMA', 'CA', 'ZU', 0, 0),
(1316, '14', '1404', '140416', 'LIMA', 'CA', 'ASIA', 0, 0),
(1317, '14', '1405', '140501', 'LIMA', 'HUAURA', 'HUACHO', 0, 0),
(1318, '14', '1405', '140502', 'LIMA', 'HUAURA', 'AMBAR', 0, 0),
(1319, '14', '1405', '140504', 'LIMA', 'HUAURA', 'CALETA DE CARQUIN', 0, 0),
(1320, '14', '1405', '140505', 'LIMA', 'HUAURA', 'CHECRAS', 0, 0),
(1321, '14', '1405', '140506', 'LIMA', 'HUAURA', 'HUALMAY', 0, 0),
(1322, '14', '1405', '140507', 'LIMA', 'HUAURA', 'HUAURA', 0, 0),
(1323, '14', '1405', '140508', 'LIMA', 'HUAURA', 'LEONCIO PRADO', 0, 0),
(1324, '14', '1405', '140509', 'LIMA', 'HUAURA', 'PACCHO', 0, 0),
(1325, '14', '1405', '140511', 'LIMA', 'HUAURA', 'SANTA LEONOR', 0, 0),
(1326, '14', '1405', '140512', 'LIMA', 'HUAURA', 'SANTA MARIA', 0, 0),
(1327, '14', '1405', '140513', 'LIMA', 'HUAURA', 'SAYAN', 0, 0),
(1328, '14', '1405', '140516', 'LIMA', 'HUAURA', 'VEGUETA', 0, 0),
(1329, '14', '1406', '140601', 'LIMA', 'HUAROCHIRI', 'MATUCANA', 0, 0),
(1330, '14', '1406', '140602', 'LIMA', 'HUAROCHIRI', 'ANTIOQUIA', 0, 0),
(1331, '14', '1406', '140603', 'LIMA', 'HUAROCHIRI', 'CALLAHUANCA', 0, 0),
(1332, '14', '1406', '140604', 'LIMA', 'HUAROCHIRI', 'CARAMPOMA', 0, 0),
(1333, '14', '1406', '140605', 'LIMA', 'HUAROCHIRI', 'CASTA', 0, 0),
(1334, '14', '1406', '140606', 'LIMA', 'HUAROCHIRI', 'SAN JOSE DE LOS CHORRILLOS', 0, 0),
(1335, '14', '1406', '140607', 'LIMA', 'HUAROCHIRI', 'CHICLA', 0, 0),
(1336, '14', '1406', '140608', 'LIMA', 'HUAROCHIRI', 'HUANZA', 0, 0),
(1337, '14', '1406', '140609', 'LIMA', 'HUAROCHIRI', 'HUAROCHIRI', 0, 0),
(1338, '14', '1406', '140610', 'LIMA', 'HUAROCHIRI', 'LAHUAYTAMBO', 0, 0),
(1339, '14', '1406', '140611', 'LIMA', 'HUAROCHIRI', 'LANGA', 0, 0),
(1340, '14', '1406', '140612', 'LIMA', 'HUAROCHIRI', 'MARIATANA', 0, 0),
(1341, '14', '1406', '140613', 'LIMA', 'HUAROCHIRI', 'RICARDO PALMA', 0, 0),
(1342, '14', '1406', '140614', 'LIMA', 'HUAROCHIRI', 'SAN ANDRES DE TUPICOCHA', 0, 0),
(1343, '14', '1406', '140615', 'LIMA', 'HUAROCHIRI', 'SAN ANTONIO', 0, 0),
(1344, '14', '1406', '140616', 'LIMA', 'HUAROCHIRI', 'SAN BARTOLOME', 0, 0),
(1345, '14', '1406', '140617', 'LIMA', 'HUAROCHIRI', 'SAN DAMIAN', 0, 0),
(1346, '14', '1406', '140618', 'LIMA', 'HUAROCHIRI', 'SANGALLAYA', 0, 0),
(1347, '14', '1406', '140619', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE TANTARANCHE', 0, 0),
(1348, '14', '1406', '140620', 'LIMA', 'HUAROCHIRI', 'SAN LORENZO DE QUINTI', 0, 0),
(1349, '14', '1406', '140621', 'LIMA', 'HUAROCHIRI', 'SAN MATEO', 0, 0),
(1350, '14', '1406', '140622', 'LIMA', 'HUAROCHIRI', 'SAN MATEO DE OTAO', 0, 0),
(1351, '14', '1406', '140623', 'LIMA', 'HUAROCHIRI', 'SAN PEDRO DE HUANCAYRE', 0, 0),
(1352, '14', '1406', '140624', 'LIMA', 'HUAROCHIRI', 'SANTA CRUZ DE COCACHACRA', 0, 0),
(1353, '14', '1406', '140625', 'LIMA', 'HUAROCHIRI', 'SANTA EULALIA', 0, 0),
(1354, '14', '1406', '140626', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE ANCHUCAYA', 0, 0),
(1355, '14', '1406', '140627', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE TUNA', 0, 0),
(1356, '14', '1406', '140628', 'LIMA', 'HUAROCHIRI', 'SANTO DOMINGO DE LOS OLLEROS', 0, 0),
(1357, '14', '1406', '140629', 'LIMA', 'HUAROCHIRI', 'SURCO', 0, 0),
(1358, '14', '1406', '140630', 'LIMA', 'HUAROCHIRI', 'HUACHUPAMPA', 0, 0),
(1359, '14', '1406', '140631', 'LIMA', 'HUAROCHIRI', 'LARAOS', 0, 0),
(1360, '14', '1406', '140632', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE IRIS', 0, 0),
(1361, '14', '1407', '140701', 'LIMA', 'YAUYOS', 'YAUYOS', 0, 0),
(1362, '14', '1407', '140702', 'LIMA', 'YAUYOS', 'ALIS', 0, 0),
(1363, '14', '1407', '140703', 'LIMA', 'YAUYOS', 'ALLAUCA', 0, 0),
(1364, '14', '1407', '140704', 'LIMA', 'YAUYOS', 'AYAVIRI', 0, 0),
(1365, '14', '1407', '140705', 'LIMA', 'YAUYOS', 'AZANGARO', 0, 0),
(1366, '14', '1407', '140706', 'LIMA', 'YAUYOS', 'CACRA', 0, 0),
(1367, '14', '1407', '140707', 'LIMA', 'YAUYOS', 'CARANIA', 0, 0),
(1368, '14', '1407', '140708', 'LIMA', 'YAUYOS', 'COCHAS', 0, 0),
(1369, '14', '1407', '140709', 'LIMA', 'YAUYOS', 'COLONIA', 0, 0),
(1370, '14', '1407', '140710', 'LIMA', 'YAUYOS', 'CHOCOS', 0, 0),
(1371, '14', '1407', '140711', 'LIMA', 'YAUYOS', 'HUAMPARA', 0, 0),
(1372, '14', '1407', '140712', 'LIMA', 'YAUYOS', 'HUANCAYA', 0, 0),
(1373, '14', '1407', '140713', 'LIMA', 'YAUYOS', 'HUANGASCAR', 0, 0),
(1374, '14', '1407', '140714', 'LIMA', 'YAUYOS', 'HUANTAN', 0, 0),
(1375, '14', '1407', '140715', 'LIMA', 'YAUYOS', 'HUA', 0, 0),
(1376, '14', '1407', '140716', 'LIMA', 'YAUYOS', 'LARAOS', 0, 0),
(1377, '14', '1407', '140717', 'LIMA', 'YAUYOS', 'LINCHA', 0, 0),
(1378, '14', '1407', '140718', 'LIMA', 'YAUYOS', 'MIRAFLORES', 0, 0),
(1379, '14', '1407', '140719', 'LIMA', 'YAUYOS', 'OMAS', 0, 0),
(1380, '14', '1407', '140720', 'LIMA', 'YAUYOS', 'QUINCHES', 0, 0),
(1381, '14', '1407', '140721', 'LIMA', 'YAUYOS', 'QUINOCAY', 0, 0),
(1382, '14', '1407', '140722', 'LIMA', 'YAUYOS', 'SAN JOAQUIN', 0, 0),
(1383, '14', '1407', '140723', 'LIMA', 'YAUYOS', 'SAN PEDRO DE PILAS', 0, 0),
(1384, '14', '1407', '140724', 'LIMA', 'YAUYOS', 'TANTA', 0, 0),
(1385, '14', '1407', '140725', 'LIMA', 'YAUYOS', 'TAURIPAMPA', 0, 0),
(1386, '14', '1407', '140726', 'LIMA', 'YAUYOS', 'TUPE', 0, 0),
(1387, '14', '1407', '140727', 'LIMA', 'YAUYOS', 'TOMAS', 0, 0),
(1388, '14', '1407', '140728', 'LIMA', 'YAUYOS', 'VI', 0, 0),
(1389, '14', '1407', '140729', 'LIMA', 'YAUYOS', 'VITIS', 0, 0),
(1390, '14', '1407', '140730', 'LIMA', 'YAUYOS', 'HONGOS', 0, 0),
(1391, '14', '1407', '140731', 'LIMA', 'YAUYOS', 'MADEAN', 0, 0),
(1392, '14', '1407', '140732', 'LIMA', 'YAUYOS', 'PUTINZA', 0, 0),
(1393, '14', '1407', '140733', 'LIMA', 'YAUYOS', 'CATAHUASI', 0, 0);
INSERT INTO `ubigeo` (`id`, `department_id`, `province_id`, `district_id`, `department`, `province`, `district`, `latitude`, `longitud`) VALUES
(1394, '14', '1408', '140801', 'LIMA', 'HUARAL', 'HUARAL', 0, 0),
(1395, '14', '1408', '140802', 'LIMA', 'HUARAL', 'ATAVILLOS ALTO', 0, 0),
(1396, '14', '1408', '140803', 'LIMA', 'HUARAL', 'ATAVILLOS BAJO', 0, 0),
(1397, '14', '1408', '140804', 'LIMA', 'HUARAL', 'AUCALLAMA', 0, 0),
(1398, '14', '1408', '140805', 'LIMA', 'HUARAL', 'CHANCAY', 0, 0),
(1399, '14', '1408', '140806', 'LIMA', 'HUARAL', 'IHUARI', 0, 0),
(1400, '14', '1408', '140807', 'LIMA', 'HUARAL', 'LAMPIAN', 0, 0),
(1401, '14', '1408', '140808', 'LIMA', 'HUARAL', 'PACARAOS', 0, 0),
(1402, '14', '1408', '140809', 'LIMA', 'HUARAL', 'SAN MIGUEL DE ACOS', 0, 0),
(1403, '14', '1408', '140810', 'LIMA', 'HUARAL', 'VEINTISIETE DE NOVIEMBRE', 0, 0),
(1404, '14', '1408', '140811', 'LIMA', 'HUARAL', 'SANTA CRUZ DE ANDAMARCA', 0, 0),
(1405, '14', '1408', '140812', 'LIMA', 'HUARAL', 'SUMBILCA', 0, 0),
(1406, '14', '1409', '140901', 'LIMA', 'BARRANCA', 'BARRANCA', 0, 0),
(1407, '14', '1409', '140902', 'LIMA', 'BARRANCA', 'PARAMONGA', 0, 0),
(1408, '14', '1409', '140903', 'LIMA', 'BARRANCA', 'PATIVILCA', 0, 0),
(1409, '14', '1409', '140904', 'LIMA', 'BARRANCA', 'SUPE', 0, 0),
(1410, '14', '1409', '140905', 'LIMA', 'BARRANCA', 'SUPE PUERTO', 0, 0),
(1411, '14', '1410', '141001', 'LIMA', 'OYON', 'OYON', 0, 0),
(1412, '14', '1410', '141002', 'LIMA', 'OYON', 'NAVAN', 0, 0),
(1413, '14', '1410', '141003', 'LIMA', 'OYON', 'CAUJUL', 0, 0),
(1414, '14', '1410', '141004', 'LIMA', 'OYON', 'ANDAJES', 0, 0),
(1415, '14', '1410', '141005', 'LIMA', 'OYON', 'PACHANGARA', 0, 0),
(1416, '14', '1410', '141006', 'LIMA', 'OYON', 'COCHAMARCA', 0, 0),
(1819, '14', '1411', '141101', 'LIMA', 'CALLAO', 'CALLAO', 0, 0),
(1820, '14', '1411', '141102', 'LIMA', 'CALLAO', 'BELLAVISTA', 0, 0),
(1821, '14', '1411', '141103', 'LIMA', 'CALLAO', 'LA PUNTA', 0, 0),
(1822, '14', '1411', '141104', 'LIMA', 'CALLAO', 'CARMEN DE LA LEGUA-REYNOSO', 0, 0),
(1823, '14', '1411', '141105', 'LIMA', 'CALLAO', 'LA PERLA', 0, 0),
(1824, '14', '1411', '141106', 'LIMA', 'CALLAO', 'VENTANILLA', 0, 0),
(1417, '15', '1501', '150101', 'LORETO', 'MAYNAS', 'IQUITOS', 0, 0),
(1418, '15', '1501', '150102', 'LORETO', 'MAYNAS', 'ALTO NANAY', 0, 0),
(1419, '15', '1501', '150103', 'LORETO', 'MAYNAS', 'FERNANDO LORES', 0, 0),
(1420, '15', '1501', '150104', 'LORETO', 'MAYNAS', 'LAS AMAZONAS', 0, 0),
(1421, '15', '1501', '150105', 'LORETO', 'MAYNAS', 'MAZAN', 0, 0),
(1422, '15', '1501', '150106', 'LORETO', 'MAYNAS', 'NAPO', 0, 0),
(1423, '15', '1501', '150107', 'LORETO', 'MAYNAS', 'PUTUMAYO', 0, 0),
(1424, '15', '1501', '150108', 'LORETO', 'MAYNAS', 'TORRES CAUSANA', 0, 0),
(1425, '15', '1501', '150110', 'LORETO', 'MAYNAS', 'INDIANA', 0, 0),
(1426, '15', '1501', '150111', 'LORETO', 'MAYNAS', 'PUNCHANA', 0, 0),
(1427, '15', '1501', '150112', 'LORETO', 'MAYNAS', 'BELEN', 0, 0),
(1428, '15', '1501', '150113', 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA', 0, 0),
(1429, '15', '1501', '150114', 'LORETO', 'MAYNAS', 'TENIENTE MANUEL CLAVERO', 0, 0),
(1430, '15', '1502', '150201', 'LORETO', 'ALTO AMAZONAS', 'YURIMAGUAS', 0, 0),
(1431, '15', '1502', '150202', 'LORETO', 'ALTO AMAZONAS', 'BALSAPUERTO', 0, 0),
(1432, '15', '1502', '150205', 'LORETO', 'ALTO AMAZONAS', 'JEBEROS', 0, 0),
(1433, '15', '1502', '150206', 'LORETO', 'ALTO AMAZONAS', 'LAGUNAS', 0, 0),
(1434, '15', '1502', '150210', 'LORETO', 'ALTO AMAZONAS', 'SANTA CRUZ', 0, 0),
(1435, '15', '1502', '150211', 'LORETO', 'ALTO AMAZONAS', 'TENIENTE CESAR LOPEZ ROJAS', 0, 0),
(1436, '15', '1503', '150301', 'LORETO', 'LORETO', 'NAUTA', 0, 0),
(1437, '15', '1503', '150302', 'LORETO', 'LORETO', 'PARINARI', 0, 0),
(1438, '15', '1503', '150303', 'LORETO', 'LORETO', 'TIGRE', 0, 0),
(1439, '15', '1503', '150304', 'LORETO', 'LORETO', 'URARINAS', 0, 0),
(1440, '15', '1503', '150305', 'LORETO', 'LORETO', 'TROMPETEROS', 0, 0),
(1441, '15', '1504', '150401', 'LORETO', 'REQUENA', 'REQUENA', 0, 0),
(1442, '15', '1504', '150402', 'LORETO', 'REQUENA', 'ALTO TAPICHE', 0, 0),
(1443, '15', '1504', '150403', 'LORETO', 'REQUENA', 'CAPELO', 0, 0),
(1444, '15', '1504', '150404', 'LORETO', 'REQUENA', 'EMILIO SAN MARTIN', 0, 0),
(1445, '15', '1504', '150405', 'LORETO', 'REQUENA', 'MAQUIA', 0, 0),
(1446, '15', '1504', '150406', 'LORETO', 'REQUENA', 'PUINAHUA', 0, 0),
(1447, '15', '1504', '150407', 'LORETO', 'REQUENA', 'SAQUENA', 0, 0),
(1448, '15', '1504', '150408', 'LORETO', 'REQUENA', 'SOPLIN', 0, 0),
(1449, '15', '1504', '150409', 'LORETO', 'REQUENA', 'TAPICHE', 0, 0),
(1450, '15', '1504', '150410', 'LORETO', 'REQUENA', 'JENARO HERRERA', 0, 0),
(1451, '15', '1504', '150411', 'LORETO', 'REQUENA', 'YAQUERANA', 0, 0),
(1452, '15', '1505', '150501', 'LORETO', 'UCAYALI', 'CONTAMANA', 0, 0),
(1453, '15', '1505', '150502', 'LORETO', 'UCAYALI', 'VARGAS GUERRA', 0, 0),
(1454, '15', '1505', '150503', 'LORETO', 'UCAYALI', 'PADRE MARQUEZ', 0, 0),
(1455, '15', '1505', '150504', 'LORETO', 'UCAYALI', 'PAMPA HERMOSA', 0, 0),
(1456, '15', '1505', '150505', 'LORETO', 'UCAYALI', 'SARAYACU', 0, 0),
(1457, '15', '1505', '150506', 'LORETO', 'UCAYALI', 'INAHUAYA', 0, 0),
(1458, '15', '1506', '150601', 'LORETO', 'MARISCAL RAMON CASTILLA', 'RAMON CASTILLA', 0, 0),
(1459, '15', '1506', '150602', 'LORETO', 'MARISCAL RAMON CASTILLA', 'PEBAS', 0, 0),
(1460, '15', '1506', '150603', 'LORETO', 'MARISCAL RAMON CASTILLA', 'YAVARI', 0, 0),
(1461, '15', '1506', '150604', 'LORETO', 'MARISCAL RAMON CASTILLA', 'SAN PABLO', 0, 0),
(1462, '15', '1507', '150701', 'LORETO', 'DATEM DEL MARA', 'BARRANCA', 0, 0),
(1463, '15', '1507', '150702', 'LORETO', 'DATEM DEL MARA', 'ANDOAS', 0, 0),
(1464, '15', '1507', '150703', 'LORETO', 'DATEM DEL MARA', 'CAHUAPANAS', 0, 0),
(1465, '15', '1507', '150704', 'LORETO', 'DATEM DEL MARA', 'MANSERICHE', 0, 0),
(1466, '15', '1507', '150705', 'LORETO', 'DATEM DEL MARA', 'MORONA', 0, 0),
(1467, '15', '1507', '150706', 'LORETO', 'DATEM DEL MARA', 'PASTAZA', 0, 0),
(1468, '16', '1601', '160101', 'MADRE DE DIOS', 'TAMBOPATA', 'TAMBOPATA', 0, 0),
(1469, '16', '1601', '160102', 'MADRE DE DIOS', 'TAMBOPATA', 'INAMBARI', 0, 0),
(1470, '16', '1601', '160103', 'MADRE DE DIOS', 'TAMBOPATA', 'LAS PIEDRAS', 0, 0),
(1471, '16', '1601', '160104', 'MADRE DE DIOS', 'TAMBOPATA', 'LABERINTO', 0, 0),
(1472, '16', '1602', '160201', 'MADRE DE DIOS', 'MANU', 'MANU', 0, 0),
(1473, '16', '1602', '160202', 'MADRE DE DIOS', 'MANU', 'FITZCARRALD', 0, 0),
(1474, '16', '1602', '160203', 'MADRE DE DIOS', 'MANU', 'MADRE DE DIOS', 0, 0),
(1475, '16', '1602', '160204', 'MADRE DE DIOS', 'MANU', 'HUEPETUHE', 0, 0),
(1476, '16', '1603', '160301', 'MADRE DE DIOS', 'TAHUAMANU', 'I', 0, 0),
(1477, '16', '1603', '160302', 'MADRE DE DIOS', 'TAHUAMANU', 'IBERIA', 0, 0),
(1478, '16', '1603', '160303', 'MADRE DE DIOS', 'TAHUAMANU', 'TAHUAMANU', 0, 0),
(1479, '17', '1701', '170101', 'MOQUEGUA', 'MARISCAL NIETO', 'MOQUEGUA', 0, 0),
(1480, '17', '1701', '170102', 'MOQUEGUA', 'MARISCAL NIETO', 'CARUMAS', 0, 0),
(1481, '17', '1701', '170103', 'MOQUEGUA', 'MARISCAL NIETO', 'CUCHUMBAYA', 0, 0),
(1482, '17', '1701', '170104', 'MOQUEGUA', 'MARISCAL NIETO', 'SAN CRISTOBAL', 0, 0),
(1483, '17', '1701', '170105', 'MOQUEGUA', 'MARISCAL NIETO', 'TORATA', 0, 0),
(1484, '17', '1701', '170106', 'MOQUEGUA', 'MARISCAL NIETO', 'SAMEGUA', 0, 0),
(1485, '17', '1702', '170201', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'OMATE', 0, 0),
(1486, '17', '1702', '170202', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'COALAQUE', 0, 0),
(1487, '17', '1702', '170203', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'CHOJATA', 0, 0),
(1488, '17', '1702', '170204', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'ICHU', 0, 0),
(1489, '17', '1702', '170205', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LA CAPILLA', 0, 0),
(1490, '17', '1702', '170206', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LLOQUE', 0, 0),
(1491, '17', '1702', '170207', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'MATALAQUE', 0, 0),
(1492, '17', '1702', '170208', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'PUQUINA', 0, 0),
(1493, '17', '1702', '170209', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'QUINISTAQUILLAS', 0, 0),
(1494, '17', '1702', '170210', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'UBINAS', 0, 0),
(1495, '17', '1702', '170211', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'YUNGA', 0, 0),
(1496, '17', '1703', '170301', 'MOQUEGUA', 'ILO', 'ILO', 0, 0),
(1497, '17', '1703', '170302', 'MOQUEGUA', 'ILO', 'EL ALGARROBAL', 0, 0),
(1498, '17', '1703', '170303', 'MOQUEGUA', 'ILO', 'PACOCHA', 0, 0),
(1499, '18', '1801', '180101', 'PASCO', 'PASCO', 'CHAUPIMARCA', 0, 0),
(1500, '18', '1801', '180103', 'PASCO', 'PASCO', 'HUACHON', 0, 0),
(1501, '18', '1801', '180104', 'PASCO', 'PASCO', 'HUARIACA', 0, 0),
(1502, '18', '1801', '180105', 'PASCO', 'PASCO', 'HUAYLLAY', 0, 0),
(1503, '18', '1801', '180106', 'PASCO', 'PASCO', 'NINACACA', 0, 0),
(1504, '18', '1801', '180107', 'PASCO', 'PASCO', 'PALLANCHACRA', 0, 0),
(1505, '18', '1801', '180108', 'PASCO', 'PASCO', 'PAUCARTAMBO', 0, 0),
(1506, '18', '1801', '180109', 'PASCO', 'PASCO', 'SAN FCO DE ASIS DE YARUSYACAN', 0, 0),
(1507, '18', '1801', '180110', 'PASCO', 'PASCO', 'SIMON BOLIVAR', 0, 0),
(1508, '18', '1801', '180111', 'PASCO', 'PASCO', 'TICLACAYAN', 0, 0),
(1509, '18', '1801', '180112', 'PASCO', 'PASCO', 'TINYAHUARCO', 0, 0),
(1510, '18', '1801', '180113', 'PASCO', 'PASCO', 'VICCO', 0, 0),
(1511, '18', '1801', '180114', 'PASCO', 'PASCO', 'YANACANCHA', 0, 0),
(1512, '18', '1802', '180201', 'PASCO', 'DANIEL ALCIDES CARRION', 'YANAHUANCA', 0, 0),
(1513, '18', '1802', '180202', 'PASCO', 'DANIEL ALCIDES CARRION', 'CHACAYAN', 0, 0),
(1514, '18', '1802', '180203', 'PASCO', 'DANIEL ALCIDES CARRION', 'GOYLLARISQUIZGA', 0, 0),
(1515, '18', '1802', '180204', 'PASCO', 'DANIEL ALCIDES CARRION', 'PAUCAR', 0, 0),
(1516, '18', '1802', '180205', 'PASCO', 'DANIEL ALCIDES CARRION', 'SAN PEDRO DE PILLAO', 0, 0),
(1517, '18', '1802', '180206', 'PASCO', 'DANIEL ALCIDES CARRION', 'SANTA ANA DE TUSI', 0, 0),
(1518, '18', '1802', '180207', 'PASCO', 'DANIEL ALCIDES CARRION', 'TAPUC', 0, 0),
(1519, '18', '1802', '180208', 'PASCO', 'DANIEL ALCIDES CARRION', 'VILCABAMBA', 0, 0),
(1520, '18', '1803', '180301', 'PASCO', 'OXAPAMPA', 'OXAPAMPA', 0, 0),
(1521, '18', '1803', '180302', 'PASCO', 'OXAPAMPA', 'CHONTABAMBA', 0, 0),
(1522, '18', '1803', '180303', 'PASCO', 'OXAPAMPA', 'HUANCABAMBA', 0, 0),
(1523, '18', '1803', '180304', 'PASCO', 'OXAPAMPA', 'PUERTO BERMUDEZ', 0, 0),
(1524, '18', '1803', '180305', 'PASCO', 'OXAPAMPA', 'VILLA RICA', 0, 0),
(1525, '18', '1803', '180306', 'PASCO', 'OXAPAMPA', 'POZUZO', 0, 0),
(1526, '18', '1803', '180307', 'PASCO', 'OXAPAMPA', 'PALCAZU', 0, 0),
(1527, '18', '1803', '180308', 'PASCO', 'OXAPAMPA', 'CONSTITUCION', 0, 0),
(1528, '19', '1901', '190101', 'PIURA', 'PIURA', 'PIURA', 0, 0),
(1529, '19', '1901', '190103', 'PIURA', 'PIURA', 'CASTILLA', 0, 0),
(1530, '19', '1901', '190104', 'PIURA', 'PIURA', 'CATACAOS', 0, 0),
(1531, '19', '1901', '190105', 'PIURA', 'PIURA', 'LA ARENA', 0, 0),
(1532, '19', '1901', '190106', 'PIURA', 'PIURA', 'LA UNION', 0, 0),
(1533, '19', '1901', '190107', 'PIURA', 'PIURA', 'LAS LOMAS', 0, 0),
(1534, '19', '1901', '190109', 'PIURA', 'PIURA', 'TAMBO GRANDE', 0, 0),
(1535, '19', '1901', '190113', 'PIURA', 'PIURA', 'CURA MORI', 0, 0),
(1536, '19', '1901', '190114', 'PIURA', 'PIURA', 'EL TALLAN', 0, 0),
(1537, '19', '1901', '190115', 'PIURA', 'PIURA', 'VEINTISEIS DE OCTUBRE', 0, 0),
(1538, '19', '1902', '190201', 'PIURA', 'AYABACA', 'AYABACA', 0, 0),
(1539, '19', '1902', '190202', 'PIURA', 'AYABACA', 'FRIAS', 0, 0),
(1540, '19', '1902', '190203', 'PIURA', 'AYABACA', 'LAGUNAS', 0, 0),
(1541, '19', '1902', '190204', 'PIURA', 'AYABACA', 'MONTERO', 0, 0),
(1542, '19', '1902', '190205', 'PIURA', 'AYABACA', 'PACAIPAMPA', 0, 0),
(1543, '19', '1902', '190206', 'PIURA', 'AYABACA', 'SAPILLICA', 0, 0),
(1544, '19', '1902', '190207', 'PIURA', 'AYABACA', 'SICCHEZ', 0, 0),
(1545, '19', '1902', '190208', 'PIURA', 'AYABACA', 'SUYO', 0, 0),
(1546, '19', '1902', '190209', 'PIURA', 'AYABACA', 'JILILI', 0, 0),
(1547, '19', '1902', '190210', 'PIURA', 'AYABACA', 'PAIMAS', 0, 0),
(1548, '19', '1903', '190301', 'PIURA', 'HUANCABAMBA', 'HUANCABAMBA', 0, 0),
(1549, '19', '1903', '190302', 'PIURA', 'HUANCABAMBA', 'CANCHAQUE', 0, 0),
(1550, '19', '1903', '190303', 'PIURA', 'HUANCABAMBA', 'HUARMACA', 0, 0),
(1551, '19', '1903', '190304', 'PIURA', 'HUANCABAMBA', 'SONDOR', 0, 0),
(1552, '19', '1903', '190305', 'PIURA', 'HUANCABAMBA', 'SONDORILLO', 0, 0),
(1553, '19', '1903', '190306', 'PIURA', 'HUANCABAMBA', 'EL CARMEN DE LA FRONTERA', 0, 0),
(1554, '19', '1903', '190307', 'PIURA', 'HUANCABAMBA', 'SAN MIGUEL DE EL FAIQUE', 0, 0),
(1555, '19', '1903', '190308', 'PIURA', 'HUANCABAMBA', 'LALAQUIZ', 0, 0),
(1556, '19', '1904', '190401', 'PIURA', 'MORROPON', 'CHULUCANAS', 0, 0),
(1557, '19', '1904', '190402', 'PIURA', 'MORROPON', 'BUENOS AIRES', 0, 0),
(1558, '19', '1904', '190403', 'PIURA', 'MORROPON', 'CHALACO', 0, 0),
(1559, '19', '1904', '190404', 'PIURA', 'MORROPON', 'MORROPON', 0, 0),
(1560, '19', '1904', '190405', 'PIURA', 'MORROPON', 'SALITRAL', 0, 0),
(1561, '19', '1904', '190406', 'PIURA', 'MORROPON', 'SANTA CATALINA DE MOSSA', 0, 0),
(1562, '19', '1904', '190407', 'PIURA', 'MORROPON', 'SANTO DOMINGO', 0, 0),
(1563, '19', '1904', '190408', 'PIURA', 'MORROPON', 'LA MATANZA', 0, 0),
(1564, '19', '1904', '190409', 'PIURA', 'MORROPON', 'YAMANGO', 0, 0),
(1565, '19', '1904', '190410', 'PIURA', 'MORROPON', 'SAN JUAN DE BIGOTE', 0, 0),
(1566, '19', '1905', '190501', 'PIURA', 'PAITA', 'PAITA', 0, 0),
(1567, '19', '1905', '190502', 'PIURA', 'PAITA', 'AMOTAPE', 0, 0),
(1568, '19', '1905', '190503', 'PIURA', 'PAITA', 'ARENAL', 0, 0),
(1569, '19', '1905', '190504', 'PIURA', 'PAITA', 'LA HUACA', 0, 0),
(1570, '19', '1905', '190505', 'PIURA', 'PAITA', 'COLAN', 0, 0),
(1571, '19', '1905', '190506', 'PIURA', 'PAITA', 'TAMARINDO', 0, 0),
(1572, '19', '1905', '190507', 'PIURA', 'PAITA', 'VICHAYAL', 0, 0),
(1573, '19', '1906', '190601', 'PIURA', 'SULLANA', 'SULLANA', 0, 0),
(1574, '19', '1906', '190602', 'PIURA', 'SULLANA', 'BELLAVISTA', 0, 0),
(1575, '19', '1906', '190603', 'PIURA', 'SULLANA', 'LANCONES', 0, 0),
(1576, '19', '1906', '190604', 'PIURA', 'SULLANA', 'MARCAVELICA', 0, 0),
(1577, '19', '1906', '190605', 'PIURA', 'SULLANA', 'MIGUEL CHECA', 0, 0),
(1578, '19', '1906', '190606', 'PIURA', 'SULLANA', 'QUERECOTILLO', 0, 0),
(1579, '19', '1906', '190607', 'PIURA', 'SULLANA', 'SALITRAL', 0, 0),
(1580, '19', '1906', '190608', 'PIURA', 'SULLANA', 'IGNACIO ESCUDERO', 0, 0),
(1581, '19', '1907', '190701', 'PIURA', 'TALARA', 'PARI', 0, 0),
(1582, '19', '1907', '190702', 'PIURA', 'TALARA', 'EL ALTO', 0, 0),
(1583, '19', '1907', '190703', 'PIURA', 'TALARA', 'LA BREA', 0, 0),
(1584, '19', '1907', '190704', 'PIURA', 'TALARA', 'LOBITOS', 0, 0),
(1585, '19', '1907', '190705', 'PIURA', 'TALARA', 'MANCORA', 0, 0),
(1586, '19', '1907', '190706', 'PIURA', 'TALARA', 'LOS ORGANOS', 0, 0),
(1587, '19', '1908', '190801', 'PIURA', 'SECHURA', 'SECHURA', 0, 0),
(1588, '19', '1908', '190802', 'PIURA', 'SECHURA', 'VICE', 0, 0),
(1589, '19', '1908', '190803', 'PIURA', 'SECHURA', 'BERNAL', 0, 0),
(1590, '19', '1908', '190804', 'PIURA', 'SECHURA', 'BELLAVISTA DE LA UNION', 0, 0),
(1591, '19', '1908', '190805', 'PIURA', 'SECHURA', 'CRISTO NOS VALGA', 0, 0),
(1592, '19', '1908', '190806', 'PIURA', 'SECHURA', 'RINCONADA-LLICUAR', 0, 0),
(1593, '20', '2001', '200101', 'PUNO', 'PUNO', 'PUNO', 0, 0),
(1594, '20', '2001', '200102', 'PUNO', 'PUNO', 'ACORA', 0, 0),
(1595, '20', '2001', '200103', 'PUNO', 'PUNO', 'ATUNCOLLA', 0, 0),
(1596, '20', '2001', '200104', 'PUNO', 'PUNO', 'CAPACHICA', 0, 0),
(1597, '20', '2001', '200105', 'PUNO', 'PUNO', 'COATA', 0, 0),
(1598, '20', '2001', '200106', 'PUNO', 'PUNO', 'CHUCUITO', 0, 0),
(1599, '20', '2001', '200107', 'PUNO', 'PUNO', 'HUATA', 0, 0),
(1600, '20', '2001', '200108', 'PUNO', 'PUNO', 'MA', 0, 0),
(1601, '20', '2001', '200109', 'PUNO', 'PUNO', 'PAUCARCOLLA', 0, 0),
(1602, '20', '2001', '200110', 'PUNO', 'PUNO', 'PICHACANI', 0, 0),
(1603, '20', '2001', '200111', 'PUNO', 'PUNO', 'SAN ANTONIO', 0, 0),
(1604, '20', '2001', '200112', 'PUNO', 'PUNO', 'TIQUILLACA', 0, 0),
(1605, '20', '2001', '200113', 'PUNO', 'PUNO', 'VILQUE', 0, 0),
(1606, '20', '2001', '200114', 'PUNO', 'PUNO', 'PLATERIA', 0, 0),
(1607, '20', '2001', '200115', 'PUNO', 'PUNO', 'AMANTANI', 0, 0),
(1608, '20', '2002', '200201', 'PUNO', 'AZANGARO', 'AZANGARO', 0, 0),
(1609, '20', '2002', '200202', 'PUNO', 'AZANGARO', 'ACHAYA', 0, 0),
(1610, '20', '2002', '200203', 'PUNO', 'AZANGARO', 'ARAPA', 0, 0),
(1611, '20', '2002', '200204', 'PUNO', 'AZANGARO', 'ASILLO', 0, 0),
(1612, '20', '2002', '200205', 'PUNO', 'AZANGARO', 'CAMINACA', 0, 0),
(1613, '20', '2002', '200206', 'PUNO', 'AZANGARO', 'CHUPA', 0, 0),
(1614, '20', '2002', '200207', 'PUNO', 'AZANGARO', 'JOSE DOMINGO CHOQUEHUANCA', 0, 0),
(1615, '20', '2002', '200208', 'PUNO', 'AZANGARO', 'MU', 0, 0),
(1616, '20', '2002', '200210', 'PUNO', 'AZANGARO', 'POTONI', 0, 0),
(1617, '20', '2002', '200212', 'PUNO', 'AZANGARO', 'SAMAN', 0, 0),
(1618, '20', '2002', '200213', 'PUNO', 'AZANGARO', 'SAN ANTON', 0, 0),
(1619, '20', '2002', '200214', 'PUNO', 'AZANGARO', 'SAN JOSE', 0, 0),
(1620, '20', '2002', '200215', 'PUNO', 'AZANGARO', 'SAN JUAN DE SALINAS', 0, 0),
(1621, '20', '2002', '200216', 'PUNO', 'AZANGARO', 'SANTIAGO DE PUPUJA', 0, 0),
(1622, '20', '2002', '200217', 'PUNO', 'AZANGARO', 'TIRAPATA', 0, 0),
(1623, '20', '2003', '200301', 'PUNO', 'CARABAYA', 'MACUSANI', 0, 0),
(1624, '20', '2003', '200302', 'PUNO', 'CARABAYA', 'AJOYANI', 0, 0),
(1625, '20', '2003', '200303', 'PUNO', 'CARABAYA', 'AYAPATA', 0, 0),
(1626, '20', '2003', '200304', 'PUNO', 'CARABAYA', 'COASA', 0, 0),
(1627, '20', '2003', '200305', 'PUNO', 'CARABAYA', 'CORANI', 0, 0),
(1628, '20', '2003', '200306', 'PUNO', 'CARABAYA', 'CRUCERO', 0, 0),
(1629, '20', '2003', '200307', 'PUNO', 'CARABAYA', 'ITUATA', 0, 0),
(1630, '20', '2003', '200308', 'PUNO', 'CARABAYA', 'OLLACHEA', 0, 0),
(1631, '20', '2003', '200309', 'PUNO', 'CARABAYA', 'SAN GABAN', 0, 0),
(1632, '20', '2003', '200310', 'PUNO', 'CARABAYA', 'USICAYOS', 0, 0),
(1633, '20', '2004', '200401', 'PUNO', 'CHUCUITO', 'JULI', 0, 0),
(1634, '20', '2004', '200402', 'PUNO', 'CHUCUITO', 'DESAGUADERO', 0, 0),
(1635, '20', '2004', '200403', 'PUNO', 'CHUCUITO', 'HUACULLANI', 0, 0),
(1636, '20', '2004', '200406', 'PUNO', 'CHUCUITO', 'PISACOMA', 0, 0),
(1637, '20', '2004', '200407', 'PUNO', 'CHUCUITO', 'POMATA', 0, 0),
(1638, '20', '2004', '200410', 'PUNO', 'CHUCUITO', 'ZEPITA', 0, 0),
(1639, '20', '2004', '200412', 'PUNO', 'CHUCUITO', 'KELLUYO', 0, 0),
(1640, '20', '2005', '200501', 'PUNO', 'HUANCANE', 'HUANCANE', 0, 0),
(1641, '20', '2005', '200502', 'PUNO', 'HUANCANE', 'COJATA', 0, 0),
(1642, '20', '2005', '200504', 'PUNO', 'HUANCANE', 'INCHUPALLA', 0, 0),
(1643, '20', '2005', '200506', 'PUNO', 'HUANCANE', 'PUSI', 0, 0),
(1644, '20', '2005', '200507', 'PUNO', 'HUANCANE', 'ROSASPATA', 0, 0),
(1645, '20', '2005', '200508', 'PUNO', 'HUANCANE', 'TARACO', 0, 0),
(1646, '20', '2005', '200509', 'PUNO', 'HUANCANE', 'VILQUE CHICO', 0, 0),
(1647, '20', '2005', '200511', 'PUNO', 'HUANCANE', 'HUATASANI', 0, 0),
(1648, '20', '2006', '200601', 'PUNO', 'LAMPA', 'LAMPA', 0, 0),
(1649, '20', '2006', '200602', 'PUNO', 'LAMPA', 'CABANILLA', 0, 0),
(1650, '20', '2006', '200603', 'PUNO', 'LAMPA', 'CALAPUJA', 0, 0),
(1651, '20', '2006', '200604', 'PUNO', 'LAMPA', 'NICASIO', 0, 0),
(1652, '20', '2006', '200605', 'PUNO', 'LAMPA', 'OCUVIRI', 0, 0),
(1653, '20', '2006', '200606', 'PUNO', 'LAMPA', 'PALCA', 0, 0),
(1654, '20', '2006', '200607', 'PUNO', 'LAMPA', 'PARATIA', 0, 0),
(1655, '20', '2006', '200608', 'PUNO', 'LAMPA', 'PUCARA', 0, 0),
(1656, '20', '2006', '200609', 'PUNO', 'LAMPA', 'SANTA LUCIA', 0, 0),
(1657, '20', '2006', '200610', 'PUNO', 'LAMPA', 'VILAVILA', 0, 0),
(1658, '20', '2007', '200701', 'PUNO', 'MELGAR', 'AYAVIRI', 0, 0),
(1659, '20', '2007', '200702', 'PUNO', 'MELGAR', 'ANTAUTA', 0, 0),
(1660, '20', '2007', '200703', 'PUNO', 'MELGAR', 'CUPI', 0, 0),
(1661, '20', '2007', '200704', 'PUNO', 'MELGAR', 'LLALLI', 0, 0),
(1662, '20', '2007', '200705', 'PUNO', 'MELGAR', 'MACARI', 0, 0),
(1663, '20', '2007', '200706', 'PUNO', 'MELGAR', 'NU', 0, 0),
(1664, '20', '2007', '200707', 'PUNO', 'MELGAR', 'ORURILLO', 0, 0),
(1665, '20', '2007', '200708', 'PUNO', 'MELGAR', 'SANTA ROSA', 0, 0),
(1666, '20', '2007', '200709', 'PUNO', 'MELGAR', 'UMACHIRI', 0, 0),
(1667, '20', '2008', '200801', 'PUNO', 'SANDIA', 'SANDIA', 0, 0),
(1668, '20', '2008', '200803', 'PUNO', 'SANDIA', 'CUYOCUYO', 0, 0),
(1669, '20', '2008', '200804', 'PUNO', 'SANDIA', 'LIMBANI', 0, 0),
(1670, '20', '2008', '200805', 'PUNO', 'SANDIA', 'PHARA', 0, 0),
(1671, '20', '2008', '200806', 'PUNO', 'SANDIA', 'PATAMBUCO', 0, 0),
(1672, '20', '2008', '200807', 'PUNO', 'SANDIA', 'QUIACA', 0, 0),
(1673, '20', '2008', '200808', 'PUNO', 'SANDIA', 'SAN JUAN DEL ORO', 0, 0),
(1674, '20', '2008', '200810', 'PUNO', 'SANDIA', 'YANAHUAYA', 0, 0),
(1675, '20', '2008', '200811', 'PUNO', 'SANDIA', 'ALTO INAMBARI', 0, 0),
(1676, '20', '2008', '200812', 'PUNO', 'SANDIA', 'SAN PEDRO DE PUTINA PUNCO', 0, 0),
(1677, '20', '2009', '200901', 'PUNO', 'SAN ROMAN', 'JULIACA', 0, 0),
(1678, '20', '2009', '200902', 'PUNO', 'SAN ROMAN', 'CABANA', 0, 0),
(1679, '20', '2009', '200903', 'PUNO', 'SAN ROMAN', 'CABANILLAS', 0, 0),
(1680, '20', '2009', '200904', 'PUNO', 'SAN ROMAN', 'CARACOTO', 0, 0),
(1681, '20', '2010', '201001', 'PUNO', 'YUNGUYO', 'YUNGUYO', 0, 0),
(1682, '20', '2010', '201002', 'PUNO', 'YUNGUYO', 'UNICACHI', 0, 0),
(1683, '20', '2010', '201003', 'PUNO', 'YUNGUYO', 'ANAPIA', 0, 0),
(1684, '20', '2010', '201004', 'PUNO', 'YUNGUYO', 'COPANI', 0, 0),
(1685, '20', '2010', '201005', 'PUNO', 'YUNGUYO', 'CUTURAPI', 0, 0),
(1686, '20', '2010', '201006', 'PUNO', 'YUNGUYO', 'OLLARAYA', 0, 0),
(1687, '20', '2010', '201007', 'PUNO', 'YUNGUYO', 'TINICACHI', 0, 0),
(1688, '20', '2011', '201101', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PUTINA', 0, 0),
(1689, '20', '2011', '201102', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PEDRO VILCA APAZA', 0, 0),
(1690, '20', '2011', '201103', 'PUNO', 'SAN ANTONIO DE PUTINA', 'QUILCAPUNCU', 0, 0),
(1691, '20', '2011', '201104', 'PUNO', 'SAN ANTONIO DE PUTINA', 'ANANEA', 0, 0),
(1692, '20', '2011', '201105', 'PUNO', 'SAN ANTONIO DE PUTINA', 'SINA', 0, 0),
(1693, '20', '2012', '201201', 'PUNO', 'EL COLLAO', 'ILAVE', 0, 0),
(1694, '20', '2012', '201202', 'PUNO', 'EL COLLAO', 'PILCUYO', 0, 0),
(1695, '20', '2012', '201203', 'PUNO', 'EL COLLAO', 'SANTA ROSA', 0, 0),
(1696, '20', '2012', '201204', 'PUNO', 'EL COLLAO', 'CAPASO', 0, 0),
(1697, '20', '2012', '201205', 'PUNO', 'EL COLLAO', 'CONDURIRI', 0, 0),
(1698, '20', '2013', '201301', 'PUNO', 'MOHO', 'MOHO', 0, 0),
(1699, '20', '2013', '201302', 'PUNO', 'MOHO', 'CONIMA', 0, 0),
(1700, '20', '2013', '201303', 'PUNO', 'MOHO', 'TILALI', 0, 0),
(1701, '20', '2013', '201304', 'PUNO', 'MOHO', 'HUAYRAPATA', 0, 0),
(1702, '21', '2101', '210101', 'SAN MARTIN', 'MOYOBAMBA', 'MOYOBAMBA', 0, 0),
(1703, '21', '2101', '210102', 'SAN MARTIN', 'MOYOBAMBA', 'CALZADA', 0, 0),
(1704, '21', '2101', '210103', 'SAN MARTIN', 'MOYOBAMBA', 'HABANA', 0, 0),
(1705, '21', '2101', '210104', 'SAN MARTIN', 'MOYOBAMBA', 'JEPELACIO', 0, 0),
(1706, '21', '2101', '210105', 'SAN MARTIN', 'MOYOBAMBA', 'SORITOR', 0, 0),
(1707, '21', '2101', '210106', 'SAN MARTIN', 'MOYOBAMBA', 'YANTALO', 0, 0),
(1708, '21', '2102', '210201', 'SAN MARTIN', 'HUALLAGA', 'SAPOSOA', 0, 0),
(1709, '21', '2102', '210202', 'SAN MARTIN', 'HUALLAGA', 'PISCOYACU', 0, 0),
(1710, '21', '2102', '210203', 'SAN MARTIN', 'HUALLAGA', 'SACANCHE', 0, 0),
(1711, '21', '2102', '210204', 'SAN MARTIN', 'HUALLAGA', 'TINGO DE SAPOSOA', 0, 0),
(1712, '21', '2102', '210205', 'SAN MARTIN', 'HUALLAGA', 'ALTO SAPOSOA', 0, 0),
(1713, '21', '2102', '210206', 'SAN MARTIN', 'HUALLAGA', 'EL ESLABON', 0, 0),
(1714, '21', '2103', '210301', 'SAN MARTIN', 'LAMAS', 'LAMAS', 0, 0),
(1715, '21', '2103', '210303', 'SAN MARTIN', 'LAMAS', 'BARRANQUITA', 0, 0),
(1716, '21', '2103', '210304', 'SAN MARTIN', 'LAMAS', 'CAYNARACHI', 0, 0),
(1717, '21', '2103', '210305', 'SAN MARTIN', 'LAMAS', 'CU', 0, 0),
(1718, '21', '2103', '210306', 'SAN MARTIN', 'LAMAS', 'PINTO RECODO', 0, 0),
(1719, '21', '2103', '210307', 'SAN MARTIN', 'LAMAS', 'RUMISAPA', 0, 0),
(1720, '21', '2103', '210311', 'SAN MARTIN', 'LAMAS', 'SHANAO', 0, 0),
(1721, '21', '2103', '210313', 'SAN MARTIN', 'LAMAS', 'TABALOSOS', 0, 0),
(1722, '21', '2103', '210314', 'SAN MARTIN', 'LAMAS', 'ZAPATERO', 0, 0),
(1723, '21', '2103', '210315', 'SAN MARTIN', 'LAMAS', 'ALONSO DE ALVARADO', 0, 0),
(1724, '21', '2103', '210316', 'SAN MARTIN', 'LAMAS', 'SAN ROQUE DE CUMBAZA', 0, 0),
(1725, '21', '2104', '210401', 'SAN MARTIN', 'MARISCAL CACERES', 'JUANJUI', 0, 0),
(1726, '21', '2104', '210402', 'SAN MARTIN', 'MARISCAL CACERES', 'CAMPANILLA', 0, 0),
(1727, '21', '2104', '210403', 'SAN MARTIN', 'MARISCAL CACERES', 'HUICUNGO', 0, 0),
(1728, '21', '2104', '210404', 'SAN MARTIN', 'MARISCAL CACERES', 'PACHIZA', 0, 0),
(1729, '21', '2104', '210405', 'SAN MARTIN', 'MARISCAL CACERES', 'PAJARILLO', 0, 0),
(1730, '21', '2105', '210501', 'SAN MARTIN', 'RIOJA', 'RIOJA', 0, 0),
(1731, '21', '2105', '210502', 'SAN MARTIN', 'RIOJA', 'POSIC', 0, 0),
(1732, '21', '2105', '210503', 'SAN MARTIN', 'RIOJA', 'YORONGOS', 0, 0),
(1733, '21', '2105', '210504', 'SAN MARTIN', 'RIOJA', 'YURACYACU', 0, 0),
(1734, '21', '2105', '210505', 'SAN MARTIN', 'RIOJA', 'NUEVA CAJAMARCA', 0, 0),
(1735, '21', '2105', '210506', 'SAN MARTIN', 'RIOJA', 'ELIAS SOPLIN VARGAS', 0, 0),
(1736, '21', '2105', '210507', 'SAN MARTIN', 'RIOJA', 'SAN FERNANDO', 0, 0),
(1737, '21', '2105', '210508', 'SAN MARTIN', 'RIOJA', 'PARDO MIGUEL', 0, 0),
(1738, '21', '2105', '210509', 'SAN MARTIN', 'RIOJA', 'AWAJUN', 0, 0),
(1739, '21', '2106', '210601', 'SAN MARTIN', 'SAN MARTIN', 'TARAPOTO', 0, 0),
(1740, '21', '2106', '210602', 'SAN MARTIN', 'SAN MARTIN', 'ALBERTO LEVEAU', 0, 0),
(1741, '21', '2106', '210604', 'SAN MARTIN', 'SAN MARTIN', 'CACATACHI', 0, 0),
(1742, '21', '2106', '210606', 'SAN MARTIN', 'SAN MARTIN', 'CHAZUTA', 0, 0),
(1743, '21', '2106', '210607', 'SAN MARTIN', 'SAN MARTIN', 'CHIPURANA', 0, 0),
(1744, '21', '2106', '210608', 'SAN MARTIN', 'SAN MARTIN', 'EL PORVENIR', 0, 0),
(1745, '21', '2106', '210609', 'SAN MARTIN', 'SAN MARTIN', 'HUIMBAYOC', 0, 0),
(1746, '21', '2106', '210610', 'SAN MARTIN', 'SAN MARTIN', 'JUAN GUERRA', 0, 0),
(1747, '21', '2106', '210611', 'SAN MARTIN', 'SAN MARTIN', 'MORALES', 0, 0),
(1748, '21', '2106', '210612', 'SAN MARTIN', 'SAN MARTIN', 'PAPAPLAYA', 0, 0),
(1749, '21', '2106', '210616', 'SAN MARTIN', 'SAN MARTIN', 'SAN ANTONIO', 0, 0),
(1750, '21', '2106', '210619', 'SAN MARTIN', 'SAN MARTIN', 'SAUCE', 0, 0),
(1751, '21', '2106', '210620', 'SAN MARTIN', 'SAN MARTIN', 'SHAPAJA', 0, 0),
(1752, '21', '2106', '210621', 'SAN MARTIN', 'SAN MARTIN', 'LA BANDA DE SHILCAYO', 0, 0),
(1753, '21', '2107', '210701', 'SAN MARTIN', 'BELLAVISTA', 'BELLAVISTA', 0, 0),
(1754, '21', '2107', '210702', 'SAN MARTIN', 'BELLAVISTA', 'SAN RAFAEL', 0, 0),
(1755, '21', '2107', '210703', 'SAN MARTIN', 'BELLAVISTA', 'SAN PABLO', 0, 0),
(1756, '21', '2107', '210704', 'SAN MARTIN', 'BELLAVISTA', 'ALTO BIAVO', 0, 0),
(1757, '21', '2107', '210705', 'SAN MARTIN', 'BELLAVISTA', 'HUALLAGA', 0, 0),
(1758, '21', '2107', '210706', 'SAN MARTIN', 'BELLAVISTA', 'BAJO BIAVO', 0, 0),
(1759, '21', '2108', '210801', 'SAN MARTIN', 'TOCACHE', 'TOCACHE', 0, 0),
(1760, '21', '2108', '210802', 'SAN MARTIN', 'TOCACHE', 'NUEVO PROGRESO', 0, 0),
(1761, '21', '2108', '210803', 'SAN MARTIN', 'TOCACHE', 'POLVORA', 0, 0),
(1762, '21', '2108', '210804', 'SAN MARTIN', 'TOCACHE', 'SHUNTE', 0, 0),
(1763, '21', '2108', '210805', 'SAN MARTIN', 'TOCACHE', 'UCHIZA', 0, 0),
(1764, '21', '2109', '210901', 'SAN MARTIN', 'PICOTA', 'PICOTA', 0, 0),
(1765, '21', '2109', '210902', 'SAN MARTIN', 'PICOTA', 'BUENOS AIRES', 0, 0),
(1766, '21', '2109', '210903', 'SAN MARTIN', 'PICOTA', 'CASPIZAPA', 0, 0),
(1767, '21', '2109', '210904', 'SAN MARTIN', 'PICOTA', 'PILLUANA', 0, 0),
(1768, '21', '2109', '210905', 'SAN MARTIN', 'PICOTA', 'PUCACACA', 0, 0),
(1769, '21', '2109', '210906', 'SAN MARTIN', 'PICOTA', 'SAN CRISTOBAL', 0, 0),
(1770, '21', '2109', '210907', 'SAN MARTIN', 'PICOTA', 'SAN HILARION', 0, 0),
(1771, '21', '2109', '210908', 'SAN MARTIN', 'PICOTA', 'TINGO DE PONASA', 0, 0),
(1772, '21', '2109', '210909', 'SAN MARTIN', 'PICOTA', 'TRES UNIDOS', 0, 0),
(1773, '21', '2109', '210910', 'SAN MARTIN', 'PICOTA', 'SHAMBOYACU', 0, 0),
(1774, '21', '2110', '211001', 'SAN MARTIN', 'EL DORADO', 'SAN JOSE DE SISA', 0, 0),
(1775, '21', '2110', '211002', 'SAN MARTIN', 'EL DORADO', 'AGUA BLANCA', 0, 0),
(1776, '21', '2110', '211003', 'SAN MARTIN', 'EL DORADO', 'SHATOJA', 0, 0),
(1777, '21', '2110', '211004', 'SAN MARTIN', 'EL DORADO', 'SAN MARTIN', 0, 0),
(1778, '21', '2110', '211005', 'SAN MARTIN', 'EL DORADO', 'SANTA ROSA', 0, 0),
(1779, '22', '2201', '220101', 'TACNA', 'TACNA', 'TACNA', 0, 0),
(1780, '22', '2201', '220102', 'TACNA', 'TACNA', 'CALANA', 0, 0),
(1781, '22', '2201', '220104', 'TACNA', 'TACNA', 'INCLAN', 0, 0),
(1782, '22', '2201', '220107', 'TACNA', 'TACNA', 'PACHIA', 0, 0),
(1783, '22', '2201', '220108', 'TACNA', 'TACNA', 'PALCA', 0, 0),
(1784, '22', '2201', '220109', 'TACNA', 'TACNA', 'POCOLLAY', 0, 0),
(1785, '22', '2201', '220110', 'TACNA', 'TACNA', 'SAMA', 0, 0),
(1786, '22', '2201', '220111', 'TACNA', 'TACNA', 'ALTO DE LA ALIANZA', 0, 0),
(1787, '22', '2201', '220112', 'TACNA', 'TACNA', 'CIUDAD NUEVA', 0, 0),
(1788, '22', '2201', '220113', 'TACNA', 'TACNA', 'CORONEL GREGORIO ALBARRACIN L.', 0, 0),
(1789, '22', '2202', '220201', 'TACNA', 'TARATA', 'TARATA', 0, 0),
(1790, '22', '2202', '220205', 'TACNA', 'TARATA', 'HEROES ALBARRACIN', 0, 0),
(1791, '22', '2202', '220206', 'TACNA', 'TARATA', 'ESTIQUE', 0, 0),
(1792, '22', '2202', '220207', 'TACNA', 'TARATA', 'ESTIQUE PAMPA', 0, 0),
(1793, '22', '2202', '220210', 'TACNA', 'TARATA', 'SITAJARA', 0, 0),
(1794, '22', '2202', '220211', 'TACNA', 'TARATA', 'SUSAPAYA', 0, 0),
(1795, '22', '2202', '220212', 'TACNA', 'TARATA', 'TARUCACHI', 0, 0),
(1796, '22', '2202', '220213', 'TACNA', 'TARATA', 'TICACO', 0, 0),
(1797, '22', '2203', '220301', 'TACNA', 'JORGE BASADRE', 'LOCUMBA', 0, 0),
(1798, '22', '2203', '220302', 'TACNA', 'JORGE BASADRE', 'ITE', 0, 0),
(1799, '22', '2203', '220303', 'TACNA', 'JORGE BASADRE', 'ILABAYA', 0, 0),
(1800, '22', '2204', '220401', 'TACNA', 'CANDARAVE', 'CANDARAVE', 0, 0),
(1801, '22', '2204', '220402', 'TACNA', 'CANDARAVE', 'CAIRANI', 0, 0),
(1802, '22', '2204', '220403', 'TACNA', 'CANDARAVE', 'CURIBAYA', 0, 0),
(1803, '22', '2204', '220404', 'TACNA', 'CANDARAVE', 'HUANUARA', 0, 0),
(1804, '22', '2204', '220405', 'TACNA', 'CANDARAVE', 'QUILAHUANI', 0, 0),
(1805, '22', '2204', '220406', 'TACNA', 'CANDARAVE', 'CAMILACA', 0, 0),
(1806, '23', '2301', '230101', 'TUMBES', 'TUMBES', 'TUMBES', 0, 0),
(1807, '23', '2301', '230102', 'TUMBES', 'TUMBES', 'CORRALES', 0, 0),
(1808, '23', '2301', '230103', 'TUMBES', 'TUMBES', 'LA CRUZ', 0, 0),
(1809, '23', '2301', '230104', 'TUMBES', 'TUMBES', 'PAMPAS DE HOSPITAL', 0, 0),
(1810, '23', '2301', '230105', 'TUMBES', 'TUMBES', 'SAN JACINTO', 0, 0),
(1811, '23', '2301', '230106', 'TUMBES', 'TUMBES', 'SAN JUAN DE LA VIRGEN', 0, 0),
(1812, '23', '2302', '230201', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'ZORRITOS', 0, 0),
(1813, '23', '2302', '230202', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CASITAS', 0, 0),
(1814, '23', '2302', '230203', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CANOAS DE PUNTA SAL', 0, 0),
(1815, '23', '2303', '230301', 'TUMBES', 'ZARUMILLA', 'ZARUMILLA', 0, 0),
(1816, '23', '2303', '230302', 'TUMBES', 'ZARUMILLA', 'MATAPALO', 0, 0),
(1817, '23', '2303', '230303', 'TUMBES', 'ZARUMILLA', 'PAPAYAL', 0, 0),
(1818, '23', '2303', '230304', 'TUMBES', 'ZARUMILLA', 'AGUAS VERDES', 0, 0),
(1825, '25', '2501', '250101', 'UCAYALI', 'CORONEL PORTILLO', 'CALLERIA', 0, 0),
(1826, '25', '2501', '250102', 'UCAYALI', 'CORONEL PORTILLO', 'YARINACOCHA', 0, 0),
(1827, '25', '2501', '250103', 'UCAYALI', 'CORONEL PORTILLO', 'MASISEA', 0, 0),
(1828, '25', '2501', '250104', 'UCAYALI', 'CORONEL PORTILLO', 'CAMPOVERDE', 0, 0),
(1829, '25', '2501', '250105', 'UCAYALI', 'CORONEL PORTILLO', 'IPARIA', 0, 0),
(1830, '25', '2501', '250106', 'UCAYALI', 'CORONEL PORTILLO', 'NUEVA REQUENA', 0, 0),
(1831, '25', '2501', '250107', 'UCAYALI', 'CORONEL PORTILLO', 'MANANTAY', 0, 0),
(1832, '25', '2502', '250201', 'UCAYALI', 'PADRE ABAD', 'PADRE ABAD', 0, 0),
(1833, '25', '2502', '250202', 'UCAYALI', 'PADRE ABAD', 'IRAZOLA', 0, 0),
(1834, '25', '2502', '250203', 'UCAYALI', 'PADRE ABAD', 'CURIMANA', 0, 0),
(1835, '25', '2503', '250301', 'UCAYALI', 'ATALAYA', 'RAIMONDI', 0, 0),
(1836, '25', '2503', '250302', 'UCAYALI', 'ATALAYA', 'TAHUANIA', 0, 0),
(1837, '25', '2503', '250303', 'UCAYALI', 'ATALAYA', 'YURUA', 0, 0),
(1838, '25', '2503', '250304', 'UCAYALI', 'ATALAYA', 'SEPAHUA', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `auth` int(11) DEFAULT NULL,
  `verification_code` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `avatar` char(24) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `status`, `auth`, `verification_code`, `estudiante_id`, `avatar`) VALUES
(1, 'administrador@gmail.com', '123456', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `ruta` varchar(150) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_copia`
--

CREATE TABLE IF NOT EXISTS `video_copia` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `ruta` varchar(150) DEFAULT NULL,
  `etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

CREATE TABLE IF NOT EXISTS `voto` (
  `asunto_id` int(11) NOT NULL DEFAULT '0',
  `region_id` varchar(2) NOT NULL DEFAULT '',
  `participante_id` varchar(8) NOT NULL DEFAULT '0',
  `fecha_registro` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`), ADD KEY `objetivo_especifico_id` (`objetivo_especifico_id`);

--
-- Indices de la tabla `actividad_copia`
--
ALTER TABLE `actividad_copia`
  ADD PRIMARY KEY (`id`), ADD KEY `objetivo_especifico_id` (`objetivo_especifico_id`);

--
-- Indices de la tabla `asunto`
--
ALTER TABLE `asunto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`), ADD KEY `Fkusuario` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`), ADD KEY `type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`id`), ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `cronograma_copia`
--
ALTER TABLE `cronograma_copia`
  ADD PRIMARY KEY (`id`), ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`), ADD KEY `Fkencuesta_estudiante` (`estudiante_id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`), ADD KEY `Fkasuntoa` (`asunto_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`) USING BTREE, ADD UNIQUE KEY `dni` (`dni`), ADD KEY `Fkinstitucion` (`institucion_id`);

--
-- Indices de la tabla `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_institucion_ubigeo` (`unidad_gestion_educativa_local_id`), ADD KEY `unidad_gestion_educativa_local_id` (`unidad_gestion_educativa_local_id`), ADD KEY `ubigeo_id` (`ubigeo_id`), ADD KEY `tipo_institucion` (`tipo_institucion`), ADD KEY `tipo_institucion_2` (`tipo_institucion`);

--
-- Indices de la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD PRIMARY KEY (`id`), ADD KEY `Fkequipo` (`equipo_id`), ADD KEY `Fkintegrante_estudiante` (`estudiante_id`);

--
-- Indices de la tabla `invitacion`
--
ALTER TABLE `invitacion`
  ADD PRIMARY KEY (`id`), ADD KEY `Fkestudiante_lider` (`estudiante_id`), ADD KEY `Fkestudiante_invitado` (`estudiante_invitado_id`);

--
-- Indices de la tabla `objetivo_especifico`
--
ALTER TABLE `objetivo_especifico`
  ADD PRIMARY KEY (`id`), ADD KEY `proyecto_id` (`proyecto_id`);

--
-- Indices de la tabla `objetivo_especifico_copia`
--
ALTER TABLE `objetivo_especifico_copia`
  ADD PRIMARY KEY (`id`), ADD KEY `proyecto_id` (`proyecto_id`);

--
-- Indices de la tabla `plan_presupuestal`
--
ALTER TABLE `plan_presupuestal`
  ADD PRIMARY KEY (`id`), ADD KEY `actividad_int` (`como_conseguirlo`), ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `plan_presupuestal_copia`
--
ALTER TABLE `plan_presupuestal_copia`
  ADD PRIMARY KEY (`id`), ADD KEY `actividad_int` (`como_conseguirlo`), ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `pre_forum`
--
ALTER TABLE `pre_forum`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pre_forum_board`
--
ALTER TABLE `pre_forum_board`
  ADD PRIMARY KEY (`id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pre_forum_broadcast`
--
ALTER TABLE `pre_forum_broadcast`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `thread_id` (`thread_id`);

--
-- Indices de la tabla `pre_forum_follow`
--
ALTER TABLE `pre_forum_follow`
  ADD PRIMARY KEY (`id`), ADD KEY `forum_id` (`forum_id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pre_forum_post`
--
ALTER TABLE `pre_forum_post`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `thread_id` (`thread_id`);

--
-- Indices de la tabla `pre_forum_thread`
--
ALTER TABLE `pre_forum_thread`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `board_id` (`board_id`);

--
-- Indices de la tabla `pre_home_feed`
--
ALTER TABLE `pre_home_feed`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pre_home_post`
--
ALTER TABLE `pre_home_post`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pre_user_data`
--
ALTER TABLE `pre_user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `pre_user_follow`
--
ALTER TABLE `pre_user_follow`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `people_id` (`people_id`);

--
-- Indices de la tabla `pre_user_notice`
--
ALTER TABLE `pre_user_notice`
  ADD PRIMARY KEY (`id`), ADD KEY `type` (`type`), ADD KEY `from_user_id` (`from_user_id`), ADD KEY `to_user_id` (`to_user_id`);

--
-- Indices de la tabla `pre_user_notice_type`
--
ALTER TABLE `pre_user_notice_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `proyecto_copia`
--
ALTER TABLE `proyecto_copia`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `reflexion`
--
ALTER TABLE `reflexion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
  ADD PRIMARY KEY (`district_id`,`department_id`), ADD KEY `department_id` (`department_id`), ADD KEY `district_id` (`district_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Uniquesusername` (`username`), ADD KEY `Fkusuario_estudiante` (`estudiante_id`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_copia`
--
ALTER TABLE `video_copia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`asunto_id`,`region_id`,`participante_id`), ADD KEY `Fkparticipante` (`participante_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `etapa`
--
ALTER TABLE `etapa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1607;
--
-- AUTO_INCREMENT de la tabla `integrante`
--
ALTER TABLE `integrante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `invitacion`
--
ALTER TABLE `invitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `objetivo_especifico`
--
ALTER TABLE `objetivo_especifico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `plan_presupuestal`
--
ALTER TABLE `plan_presupuestal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `pre_forum`
--
ALTER TABLE `pre_forum`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pre_forum_board`
--
ALTER TABLE `pre_forum_board`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pre_forum_broadcast`
--
ALTER TABLE `pre_forum_broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_forum_follow`
--
ALTER TABLE `pre_forum_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_forum_post`
--
ALTER TABLE `pre_forum_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pre_forum_thread`
--
ALTER TABLE `pre_forum_thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `pre_home_feed`
--
ALTER TABLE `pre_home_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_home_post`
--
ALTER TABLE `pre_home_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_user_data`
--
ALTER TABLE `pre_user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_user_follow`
--
ALTER TABLE `pre_user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_user_notice`
--
ALTER TABLE `pre_user_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pre_user_notice_type`
--
ALTER TABLE `pre_user_notice_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `reflexion`
--
ALTER TABLE `reflexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `video_copia`
--
ALTER TABLE `video_copia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`objetivo_especifico_id`) REFERENCES `objetivo_especifico` (`id`);

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
ADD CONSTRAINT `Fkauthitem` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`),
ADD CONSTRAINT `Fkusuario` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cronograma`
--
ALTER TABLE `cronograma`
ADD CONSTRAINT `cronograma_ibfk_1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`);

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
ADD CONSTRAINT `Fkencuesta_estudiante` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
ADD CONSTRAINT `Fkasuntoa` FOREIGN KEY (`asunto_id`) REFERENCES `asunto` (`id`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
ADD CONSTRAINT `Fkinstitucion` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`);

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
ADD CONSTRAINT `Fkubigeo` FOREIGN KEY (`ubigeo_id`) REFERENCES `ubigeo` (`district_id`);

--
-- Filtros para la tabla `integrante`
--
ALTER TABLE `integrante`
ADD CONSTRAINT `Fkequipo` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
ADD CONSTRAINT `Fkintegrante_estudiante` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `invitacion`
--
ALTER TABLE `invitacion`
ADD CONSTRAINT `Fkestudiante_invitado` FOREIGN KEY (`estudiante_invitado_id`) REFERENCES `estudiante` (`id`),
ADD CONSTRAINT `Fkestudiante_lider` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `objetivo_especifico`
--
ALTER TABLE `objetivo_especifico`
ADD CONSTRAINT `objetivo_especifico_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `plan_presupuestal`
--
ALTER TABLE `plan_presupuestal`
ADD CONSTRAINT `plan_presupuestal_ibfk_1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`);

--
-- Filtros para la tabla `pre_forum_board`
--
ALTER TABLE `pre_forum_board`
ADD CONSTRAINT `pre_forum_board_ibfk_2` FOREIGN KEY (`forum_id`) REFERENCES `pre_forum` (`id`);

--
-- Filtros para la tabla `pre_forum_broadcast`
--
ALTER TABLE `pre_forum_broadcast`
ADD CONSTRAINT `pre_forum_broadcast_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `pre_forum` (`id`),
ADD CONSTRAINT `pre_forum_broadcast_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `pre_forum_broadcast_ibfk_3` FOREIGN KEY (`thread_id`) REFERENCES `pre_forum_thread` (`id`);

--
-- Filtros para la tabla `pre_forum_follow`
--
ALTER TABLE `pre_forum_follow`
ADD CONSTRAINT `pre_forum_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `pre_forum_follow_ibfk_2` FOREIGN KEY (`forum_id`) REFERENCES `pre_forum` (`id`);

--
-- Filtros para la tabla `pre_forum_post`
--
ALTER TABLE `pre_forum_post`
ADD CONSTRAINT `pre_forum_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `pre_forum_post_ibfk_2` FOREIGN KEY (`thread_id`) REFERENCES `pre_forum_thread` (`id`);

--
-- Filtros para la tabla `pre_forum_thread`
--
ALTER TABLE `pre_forum_thread`
ADD CONSTRAINT `pre_forum_thread_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pre_home_feed`
--
ALTER TABLE `pre_home_feed`
ADD CONSTRAINT `pre_home_feed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pre_home_post`
--
ALTER TABLE `pre_home_post`
ADD CONSTRAINT `pre_home_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pre_user_data`
--
ALTER TABLE `pre_user_data`
ADD CONSTRAINT `pre_user_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pre_user_follow`
--
ALTER TABLE `pre_user_follow`
ADD CONSTRAINT `pre_user_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pre_user_notice`
--
ALTER TABLE `pre_user_notice`
ADD CONSTRAINT `pre_user_notice_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `pre_user_notice_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `proyecto_copia`
--
ALTER TABLE `proyecto_copia`
ADD CONSTRAINT `proyecto_copia_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `Fkusuario_estudiante` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `voto`
--
ALTER TABLE `voto`
ADD CONSTRAINT `Fkasunto` FOREIGN KEY (`asunto_id`) REFERENCES `asunto` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
