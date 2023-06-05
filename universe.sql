--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    land_mass_in_mill_km integer,
    description text,
    name character varying(30) NOT NULL,
    population_in_mill numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continent_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continent_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_million_of_years numeric(10,2),
    description text,
    has_known_life boolean,
    num_stars_in_billions integer,
    name character varying(30) NOT NULL,
    dist_in_million_lightyears integer,
    shape character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    age_in_million_of_years numeric(10,2),
    description text,
    has_life boolean,
    size_in_km integer,
    name character varying(30) NOT NULL,
    distance_from_earth_in_lighyears integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age_in_million_of_years numeric(10,2),
    description text,
    has_life boolean,
    num_of_moons_in_system integer,
    name character varying(30) NOT NULL,
    distance_from_earth_in_lighyears integer,
    planet_type character varying(30),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age_in_million_of_years numeric(10,2),
    description text,
    has_known_life_within_system boolean,
    num_of_planets_in_system integer,
    name character varying(30) NOT NULL,
    distance_from_earth_in_lighyears integer,
    star_type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continent_continent_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 44580000, 'Largest continent in the world', 'Asia', 4561.00, 1);
INSERT INTO public.continent VALUES (2, 24710000, 'It is where USA is', 'North America', 579.00, 1);
INSERT INTO public.continent VALUES (3, 10530000, 'It is where the Romans used to be', 'Europe', 746.40, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 10010.00, 'Andromeda Time', false, 1000, 'Andromeda', 2500000, 'spiral');
INSERT INTO public.galaxy VALUES (2, 800.00, 'Named after redshift measurement', false, 1, 'Cosmos Redshift 7', 12900000, 'spiral');
INSERT INTO public.galaxy VALUES (3, 13690.00, 'Our galaxy', true, 100, 'Milky Way', 28000, 'spiral');
INSERT INTO public.galaxy VALUES (4, 1010.00, '2nd or 3rd closest to Milky Way', false, 20, 'Large Magellanic Cloud', 158200, 'irregular');
INSERT INTO public.galaxy VALUES (5, 300.00, 'Currently under starburst phase', false, 1, 'Antennae Galaxies', 65000000, 'elliptical');
INSERT INTO public.galaxy VALUES (6, 200.00, 'Shaped like a cartwheel', false, 10, 'Cartwheel Galaxy', 489200000, 'ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4510.00, 'Our moon', false, 1740, 'Moon', 0, 1);
INSERT INTO public.moon VALUES (2, 4503.00, 'Mars Moon 1', false, 11, 'Phobos', 0, 4);
INSERT INTO public.moon VALUES (3, 4503.00, 'Mars Moon 2', false, 6, 'Deimos', 0, 4);
INSERT INTO public.moon VALUES (4, 4503.00, '6th Largest Moon in the Solar System', false, 1560, 'Europa', 0, 5);
INSERT INTO public.moon VALUES (5, 4503.00, 'Largest Moon in the Solar System', false, 2634, 'Ganymede', 0, 5);
INSERT INTO public.moon VALUES (6, 4503.00, '4th Largest Moon in the Solar System', false, 1821, 'Io', 0, 5);
INSERT INTO public.moon VALUES (7, 4503.00, '3rd Largest Moon in the Solar System', false, 2410, 'Callisto', 0, 5);
INSERT INTO public.moon VALUES (8, 4503.00, 'Inner Most known moon of Jupiter', false, 21, 'Metis', 0, 5);
INSERT INTO public.moon VALUES (9, 4503.00, 'Smallest of the inner moons of Jupiter', false, 8, 'Adrasthea', 0, 5);
INSERT INTO public.moon VALUES (10, 4503.00, 'Also known as Jupiter V', false, 83, 'Amalthea', 0, 5);
INSERT INTO public.moon VALUES (11, 4503.00, 'Also known as Jupiter XIV', false, 49, 'Thebe', 0, 5);
INSERT INTO public.moon VALUES (12, 4003.00, 'Only moon with dense atmosphere', false, 2574, 'Titan', 0, 6);
INSERT INTO public.moon VALUES (13, 1000.00, 'Mostly covered by fresh, clean ice', false, 252, 'Enceladus', 0, 6);
INSERT INTO public.moon VALUES (14, 4560.00, 'A mid-sized moon of Saturn', false, 531, 'Tethys', 0, 6);
INSERT INTO public.moon VALUES (15, 4000.00, 'Also known as Saturn IV', false, 561, 'Dione', 0, 6);
INSERT INTO public.moon VALUES (16, 4000.00, 'First non-round moon to be discovered', false, 135, 'Hyperion', 0, 6);
INSERT INTO public.moon VALUES (17, 4600.00, 'Named after the queen of fairies', false, 788, 'Titania', 0, 7);
INSERT INTO public.moon VALUES (18, 100.00, 'Composed of ice and rocky materials', false, 578, 'Ariel', 0, 7);
INSERT INTO public.moon VALUES (19, 4503.00, 'Large moon of Neptune', false, 1353, 'Triton', 0, 8);
INSERT INTO public.moon VALUES (20, 4000.00, 'Most eccentric of all known moons', false, 179, 'Nereid', 0, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4543.00, 'Our planet', true, 1, 'Earth', 0, 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 4503.00, 'Closest to the sun', false, 0, 'Mercury', 0, 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 4503.00, 'Hottest planet, a baddie.', false, 0, 'Venus', 0, 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 4603.00, 'Elon Musk planet', false, 2, 'Mars', 0, 'terrestrial', 1);
INSERT INTO public.planet VALUES (5, 4603.00, 'Biggest planet in the solar system', false, 80, 'Jupiter', 0, 'gas giant', 1);
INSERT INTO public.planet VALUES (6, 4503.00, 'Planet with ring', false, 124, 'Saturn', 0, 'gas giant', 1);
INSERT INTO public.planet VALUES (7, 4503.00, 'Coldest planet', false, 27, 'Uranus', 0, 'ice giant', 1);
INSERT INTO public.planet VALUES (8, 4503.00, 'Farthest planet from the sun', false, 14, 'Earth', 0, 'ice giant', 1);
INSERT INTO public.planet VALUES (9, 4853.00, 'Lone planet of Proxima Centauri, for now', false, 0, 'Earth', 4, 'super earth', 2);
INSERT INTO public.planet VALUES (10, 900.00, 'Dubious planet in Wolf 359 System', false, 0, 'Wolf 359b', 8, 'unknown', 5);
INSERT INTO public.planet VALUES (11, 900.00, 'Planet in Wolf 359 System', false, 0, 'Wolf 359c', 8, 'unknown', 5);
INSERT INTO public.planet VALUES (12, 6000.00, 'Earth Version 2.0', false, 0, 'Kepler-452b', 1402, 'super earth', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4603.00, 'Our Star in our star system', true, 8, 'Sun', 1, 'yellow dwarf', 3);
INSERT INTO public.star VALUES (2, 4850.00, 'Part of a triple star system Alpha Centauri', false, 1, 'Proxima Centauri', 4, 'red', 3);
INSERT INTO public.star VALUES (3, 8000.00, 'Part of a triple star system Alpha Centauri', false, 0, 'Rigil Kentaurus', 4, 'yellow', 3);
INSERT INTO public.star VALUES (4, 5300.00, 'Part of a triple star system Alpha Centauri', false, 0, 'Toliman', 4, 'orange', 3);
INSERT INTO public.star VALUES (5, 900.00, 'Very young star', false, 2, 'Wolf 359', 8, 'red dwarf', 3);
INSERT INTO public.star VALUES (6, 6000.00, 'Star system with look-alike Earth', false, 1, 'Kepler-452', 1402, 'yellow', 3);
INSERT INTO public.star VALUES (7, 247.00, 'Big Star', false, 0, 'Sirius A', 9, 'white to blue', 3);


--
-- Name: continent_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continent_continent_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet name_planet_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_type UNIQUE (name, planet_type);


--
-- Name: star name_star_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_type UNIQUE (name, star_type);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: continent fkey_continent_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT fkey_continent_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fkey_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fkey_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

