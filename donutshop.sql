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
-- Name: donuts; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE donuts (
    id integer NOT NULL,
    name text,
    topping text,
    price integer
);


ALTER TABLE donuts OWNER TO tom;

--
-- Name: donuts_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE donuts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donuts_id_seq OWNER TO tom;

--
-- Name: donuts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE donuts_id_seq OWNED BY donuts.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    fav_donut integer,
    shop_id integer
);


ALTER TABLE employees OWNER TO tom;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employees_id_seq OWNER TO tom;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE knex_migrations OWNER TO tom;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE knex_migrations_id_seq OWNER TO tom;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


ALTER TABLE knex_migrations_lock OWNER TO tom;

--
-- Name: shop_donut_m2m; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE shop_donut_m2m (
    id integer NOT NULL,
    shop_id integer,
    donut_id integer
);


ALTER TABLE shop_donut_m2m OWNER TO tom;

--
-- Name: shop_donut_m2m_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE shop_donut_m2m_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop_donut_m2m_id_seq OWNER TO tom;

--
-- Name: shop_donut_m2m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE shop_donut_m2m_id_seq OWNED BY shop_donut_m2m.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE shops (
    id integer NOT NULL,
    name text,
    city text
);


ALTER TABLE shops OWNER TO tom;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shops_id_seq OWNER TO tom;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: donuts id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY donuts ALTER COLUMN id SET DEFAULT nextval('donuts_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Name: shop_donut_m2m id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shop_donut_m2m ALTER COLUMN id SET DEFAULT nextval('shop_donut_m2m_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Data for Name: donuts; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY donuts (id, name, topping, price) FROM stdin;
1	Glazed	sprinkles	2
2	Bear Claw	\N	2
3	Chocolate	chocolate	2
5	Jelly filled	powdered sugar	2
4	Eclair	icing	2
\.


--
-- Name: donuts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('donuts_id_seq', 7, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY employees (id, first_name, last_name, fav_donut, shop_id) FROM stdin;
1	Race	Carpenter	3	1
2	Tom	Martin	4	5
3	Stephen	Eversole	1	3
5	Shu Sia	Lukito	2	2
7	David	Kruse	3	5
6	Emit	Dutcher	1	4
4	Vinni	Otchkov	5	1
8	John	Armbruster	2	\N
9	Jeff	Klier	4	\N
10	Nmuta	Jones	1	\N
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('employees_id_seq', 7, true);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20170628092915_create_donuts_shop_donut_shopdonut_employee_tables.js	1	2017-06-29 10:35:09.384-07
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('knex_migrations_id_seq', 1, true);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY knex_migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Data for Name: shop_donut_m2m; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY shop_donut_m2m (id, shop_id, donut_id) FROM stdin;
1	1	1
2	3	1
3	4	1
4	1	2
5	2	2
6	5	2
7	2	3
8	3	3
9	4	3
10	1	4
11	5	4
12	1	5
\.


--
-- Name: shop_donut_m2m_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('shop_donut_m2m_id_seq', 12, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY shops (id, name, city) FROM stdin;
1	BOSA	Phoenix
2	Krispy Kream	Phoenix
3	Dunkin Donuts	San Tan Valley
4	Dunkin Donuts	Boston
5	BOSA	Lander
6	Sweet Treats	Kansas City
7	Dunkin Donuts	Kansas City
8	BOSA	Peoria
9	BOSA	Tuscon
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('shops_id_seq', 6, true);


--
-- Name: donuts donuts_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY donuts
    ADD CONSTRAINT donuts_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: shop_donut_m2m shop_donut_m2m_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shop_donut_m2m
    ADD CONSTRAINT shop_donut_m2m_pkey PRIMARY KEY (id);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: employees employees_fav_donut_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_fav_donut_foreign FOREIGN KEY (fav_donut) REFERENCES donuts(id);


--
-- Name: employees employees_shop_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_shop_id_foreign FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- Name: shop_donut_m2m shop_donut_m2m_donut_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shop_donut_m2m
    ADD CONSTRAINT shop_donut_m2m_donut_id_foreign FOREIGN KEY (donut_id) REFERENCES donuts(id);


--
-- Name: shop_donut_m2m shop_donut_m2m_shop_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY shop_donut_m2m
    ADD CONSTRAINT shop_donut_m2m_shop_id_foreign FOREIGN KEY (shop_id) REFERENCES shops(id);


--
-- PostgreSQL database dump complete
--

