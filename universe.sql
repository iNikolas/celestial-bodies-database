--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    type character varying(30) NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    planet_id integer,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    star_id integer,
    planet_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_id integer,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    star_count integer,
    age_in_millions_of_years integer,
    distance_from_earth double precision
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_system_id_seq OWNED BY public.star_system.star_system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Our home galaxy', 'Spiral', 0.00, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 'Nearest major galaxy', 'Spiral', 2537000.00, 10100);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', true, 'Part of the Local Group', 'Spiral', 3000000.00, 12000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', false, 'Located in the Virgo Cluster', 'Elliptical', 53000000.00, 13000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', true, 'Distinctive due to its prominent dust lane', 'Spiral', 28800000.00, 10000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', true, 'Known for its spiral arms and interacting with smaller galaxy NGC 5195', 'Spiral', 23000000.00, 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', 1, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars'' moons', 2, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Another moon of Mars', 2, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (13, 'Charon', 'Largest moon of Pluto and part of a binary system with Pluto', 9, 4500, 0.01, true, false);
INSERT INTO public.moon VALUES (14, 'Nereid', 'Moon of Neptune with highly elliptical orbit', 6, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (21, 'Hyperion', 'Moon of Saturn with irregular shape and sponge-like appearance', 5, 4500, 0.15, true, false);
INSERT INTO public.moon VALUES (22, 'Tethys', 'Saturn''s moon with prominent impact crater Odysseus', 5, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (23, 'Titania', 'Largest moon of Uranus and second-largest overall', 9, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (24, 'Umbriel', 'Uranus''s moon with dark, heavily cratered surface', 9, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (25, 'Ariel', 'Moon of Uranus with the brightest and possibly youngest surface', 9, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (26, 'Ceres', 'Dwarf planet in the asteroid belt, also considered a minor planet', 10, 4500, 1.70, true, false);
INSERT INTO public.moon VALUES (27, 'Ganymed', 'Asteroid belt''s largest asteroid, originally classified as a planet', 11, 4500, 2.70, true, false);
INSERT INTO public.moon VALUES (28, 'Vesta', 'Second-largest asteroid in the asteroid belt', 12, 4500, 2.36, true, false);
INSERT INTO public.moon VALUES (4, 'Europa', 'Moon of Jupiter known for its subsurface ocean', 4, 4500, 0.00, true, NULL);
INSERT INTO public.moon VALUES (5, 'Titan', 'Largest moon of Saturn, has a dense atmosphere', 5, 4500, 0.00, true, NULL);
INSERT INTO public.moon VALUES (6, 'Triton', 'Moon of Neptune with retrograde orbit', 6, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Largest moon of Jupiter and in the Solar System', 4, 4500, 0.00, true, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Moon of Jupiter known for its heavily cratered surface', 4, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (9, 'Io', 'Volcanically active moon of Jupiter', 4, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Moon of Saturn with active geysers', 5, 4500, 0.00, true, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Saturn''s moon with a distinctive crater named Herschel', 5, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn''s moon known for its bright wispy terrain', 5, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Moon of Uranus with a dark surface', 12, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Uranus''s moon with varied geological features', 12, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Second-largest moon of Saturn and known for its rings', 5, 4500, 0.00, true, false);
INSERT INTO public.moon VALUES (18, 'Phoebe', 'Retrograde moon of Saturn with irregular shape', 5, 4500, 0.01, true, false);
INSERT INTO public.moon VALUES (19, 'Iapetus', 'Saturn''s moon with a two-toned appearance', 5, 4500, 0.03, true, false);
INSERT INTO public.moon VALUES (20, 'Luna', 'Latin name for the Moon', 1, 4500, 0.00, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Our home planet', 1, 'Terrestrial', 4500, 0.00, true);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'The Red Planet', 1, 'Terrestrial', 4500, 0.00, true);
INSERT INTO public.planet VALUES (3, 'Proxima b', false, 'Exoplanet in the habitable zone of Proxima Centauri', 2, 'Terrestrial', 4700, 4.24, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 'Largest planet in the Solar System', 1, 'Gas Giant', 4500, 0.00, false);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 'Sixth planet from the Sun known for its rings', 1, 'Gas Giant', 4500, 0.00, false);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 'Eighth planet from the Sun', 1, 'Ice Giant', 4500, 0.00, false);
INSERT INTO public.planet VALUES (7, 'Mercury', false, 'Closest planet to the Sun', 1, 'Terrestrial', 4500, 0.00, true);
INSERT INTO public.planet VALUES (8, 'Venus', false, 'Second planet from the Sun', 1, 'Terrestrial', 4500, 0.00, true);
INSERT INTO public.planet VALUES (9, 'Uranus', false, 'Seventh planet from the Sun', 1, 'Ice Giant', 4500, 0.00, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', false, 'Exoplanet in the habitable zone of its star Kepler-186', 2, 'Terrestrial', 1500, 490.00, true);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', false, 'Exoplanet known as Osiris, first exoplanet detected transiting its star', 3, 'Gas Giant', 1000, 159.00, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', false, 'Exoplanet in the habitable zone of the ultra-cool dwarf star TRAPPIST-1', 4, 'Terrestrial', 500, 39.60, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our own star', 1, 4600, 0.00, true, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest known star to the Sun', 1, 4700, 4.24, true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in Orion', 2, 8500, 642.50, true, false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'Primary star of the Alpha Centauri system', 1, 6000, 4.37, true, false);
INSERT INTO public.star VALUES (5, 'Sirius', 'Brightest star in the night sky', 1, 250, 8.60, true, false);
INSERT INTO public.star VALUES (6, 'Procyon', 'Binary star system in the constellation Canis Minor', 1, 1600, 11.46, true, false);
INSERT INTO public.star VALUES (7, 'Rigel', 'Blue supergiant in the constellation Orion', 2, 10000, 860.00, true, false);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Alpha Centauri', 'Closest star system to the Solar System', 3, 6000, 4.37);
INSERT INTO public.star_system VALUES (2, 'Sirius System', 'Brightest star system visible from Earth', 2, 250, 8.6);
INSERT INTO public.star_system VALUES (3, 'Pleiades', 'Open star cluster visible to the naked eye', 1000, 115, 444);
INSERT INTO public.star_system VALUES (4, 'Orion Nebula', 'Nebula where new stars are forming', 1, 1500, 1344);
INSERT INTO public.star_system VALUES (5, 'Trappist-1', 'Ultra-cool dwarf star system with multiple Earth-sized planets', 7, 750, 39.5);
INSERT INTO public.star_system VALUES (6, 'Kepler-62', 'Star system with five known planets, including Kepler-62f in the habitable zone', 5, 1500, 1200);
INSERT INTO public.star_system VALUES (7, 'Tau Ceti', 'Sun-like star with potentially habitable planets', 1, 6250, 11.9);
INSERT INTO public.star_system VALUES (8, 'Gliese 581', 'Red dwarf star system with several planets, including Gliese 581d potentially in the habitable zone', 3, 2500, 20.3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, true);


--
-- Name: star_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_system_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


--
-- Name: star_system uq_star_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT uq_star_system_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

