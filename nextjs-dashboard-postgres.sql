--
-- PostgreSQL database dump
--

\restrict i341eX7keHgQIQAWaGhWFBCZrzbkV4eKX1eDDwq5yWE7bQqo8pS0y2JRQGxDaYw

-- Dumped from database version 18.7 (Homebrew)
-- Dumped by pg_dump version 18.7 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    image_url character varying(255) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    customer_id uuid NOT NULL,
    amount integer NOT NULL,
    status character varying(255) NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: revenue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenue (
    month character varying(4) NOT NULL,
    revenue integer NOT NULL
);


ALTER TABLE public.revenue OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, email, image_url) FROM stdin;
3958dc9e-712f-4377-85e9-fec4b6a6442a	Delba de Oliveira	delba@oliveira.com	/customers/delba-de-oliveira.png
d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	Evil Rabbit	evil@rabbit.com	/customers/evil-rabbit.png
76d65c26-f784-44a2-ac19-586678f7c2f2	Michael Novotny	michael@novotny.com	/customers/michael-novotny.png
13d07535-c59e-4157-a011-f8d2ef4e0cbb	Balazs Orban	balazs@orban.com	/customers/balazs-orban.png
3958dc9e-742f-4377-85e9-fec4b6a6442a	Lee Robinson	lee@robinson.com	/customers/lee-robinson.png
cc27c14a-0acf-4f4a-a6c9-d45682c144b9	Amy Burns	amy@burns.com	/customers/amy-burns.png
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, customer_id, amount, status, date) FROM stdin;
94a3b2d6-876c-4389-ac54-af6dfc8c9544	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	15795	pending	2022-12-06
42b1746a-ad0b-45a1-90c1-fc0bdafd3e21	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8546	paid	2023-06-07
e2a4e947-e4b0-4ff9-98d2-549c9985bb34	76d65c26-f784-44a2-ac19-586678f7c2f2	44800	paid	2023-09-10
1fce9a59-0e80-407b-9d15-16afd14f29cb	3958dc9e-712f-4377-85e9-fec4b6a6442a	20348	pending	2022-11-14
8f44c43a-f4c8-4b95-a6e7-9ccca2c1b6ab	13d07535-c59e-4157-a011-f8d2ef4e0cbb	34577	pending	2023-08-05
6af1fa33-7720-4107-9510-6a4144a6ef20	3958dc9e-712f-4377-85e9-fec4b6a6442a	500	paid	2023-08-19
437b8303-a01d-4b56-8b73-7e3985d9ec12	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	3040	paid	2022-10-29
6f902391-b9c9-4636-82d4-e98687719924	3958dc9e-742f-4377-85e9-fec4b6a6442a	54246	pending	2023-07-16
75599db3-6af7-4d94-addd-21576b6b417a	13d07535-c59e-4157-a011-f8d2ef4e0cbb	8945	paid	2023-06-03
0282ad8a-6866-4d57-92c9-e6aa182f671d	d6e15727-9fe1-4961-8c5b-ea44a9bd81aa	666	pending	2023-06-27
2ae0202d-127d-43c0-abf9-5cc4ce8ca50d	76d65c26-f784-44a2-ac19-586678f7c2f2	32545	paid	2023-06-09
f7e61760-ce73-4bb1-b96d-bff54b3481c1	cc27c14a-0acf-4f4a-a6c9-d45682c144b9	1250	paid	2023-06-17
871d1094-a924-494b-a280-a3b3d67a49a9	3958dc9e-742f-4377-85e9-fec4b6a6442a	1000	paid	2022-06-05
\.


--
-- Data for Name: revenue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenue (month, revenue) FROM stdin;
Mar	2200
Aug	3700
Nov	3000
Apr	2500
Jun	3200
Feb	1800
Dec	4800
Oct	2800
Jul	3500
Jan	2000
May	2300
Sep	2500
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
410544b2-4001-4271-9855-fec4b6a6442a	User	user@nextmail.com	$2b$10$aKrQwAyqR8v/dPOicw42IOTam3d6J/E5DApLBWny5sxutg9dw93ry
\.


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: revenue revenue_month_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue
    ADD CONSTRAINT revenue_month_key UNIQUE (month);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict i341eX7keHgQIQAWaGhWFBCZrzbkV4eKX1eDDwq5yWE7bQqo8pS0y2JRQGxDaYw

