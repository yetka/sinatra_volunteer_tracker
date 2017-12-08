--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE projects (
    name character varying,
    id integer NOT NULL,
    volunteer_id integer
);


ALTER TABLE projects OWNER TO "Guest";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO "Guest";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE volunteers (
    name character varying,
    id integer NOT NULL,
    project_id integer
);


ALTER TABLE volunteers OWNER TO "Guest";

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteers_id_seq OWNER TO "Guest";

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE volunteers_id_seq OWNED BY volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY volunteers ALTER COLUMN id SET DEFAULT nextval('volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY projects (name, id, volunteer_id) FROM stdin;
Green Lake cleaning	305	\N
Camp Long cleaning	306	\N
Children Hospital	307	\N
Central Library for blinders	308	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('projects_id_seq', 308, true);


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY volunteers (name, id, project_id) FROM stdin;
Malgorzata Haniszewska	91	305
Tomasz Wiszkowski	92	305
John Doe	93	305
George Washington	94	305
John Adams	95	306
Thomas Jefferson	96	306
James Madison	97	306
James Monroe	98	306
John Quincy Adams	99	307
Andrew Jackson	100	307
Martin Van Buren	101	307
William Henry Harrison	102	307
John Tyler	103	307
James K. Polk	104	307
Zachary Taylor	105	307
Millard Fillmore	106	308
Franklin Pierce	107	308
James Buchanan	108	308
\.


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('volunteers_id_seq', 108, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

