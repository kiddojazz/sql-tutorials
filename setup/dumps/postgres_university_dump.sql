--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: Course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Course" (
    id character varying(10) NOT NULL,
    name character varying(60),
    textbook character varying(100),
    credits integer,
    is_active character varying(10),
    department_id integer
);


ALTER TABLE public."Course" OWNER TO postgres;

--
-- Name: Department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Department" (
    id integer NOT NULL,
    name character varying(50),
    code character varying(4)
);


ALTER TABLE public."Department" OWNER TO postgres;

--
-- Name: Exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Exam" (
    id integer NOT NULL,
    exam_date date,
    grade character varying(2),
    course_id character varying(10),
    student_id integer
);


ALTER TABLE public."Exam" OWNER TO postgres;

--
-- Name: Faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Faculty" (
    id integer NOT NULL,
    name character varying(60),
    national_id bigint NOT NULL,
    "position" character varying(30),
    start_date date,
    end_date date,
    department_id integer
);


ALTER TABLE public."Faculty" OWNER TO postgres;

--
-- Name: Prerequisite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Prerequisite" (
    id integer NOT NULL,
    course_id character varying(10),
    prerequisite_id character varying(10) NOT NULL
);


ALTER TABLE public."Prerequisite" OWNER TO postgres;

--
-- Name: Program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Program" (
    id integer NOT NULL,
    name character varying(50),
    description character varying(250),
    start_date date,
    end_date date,
    type character varying(20),
    department_id integer
);


ALTER TABLE public."Program" OWNER TO postgres;

--
-- Name: Registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration" (
    id integer NOT NULL,
    semester character varying(30),
    year integer,
    registration_datetime timestamp without time zone,
    course_id character varying(10),
    student_id integer
);


ALTER TABLE public."Registration" OWNER TO postgres;

--
-- Name: Specification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Specification" (
    id integer NOT NULL,
    status character varying(20),
    course_id character varying(10),
    program_id integer
);


ALTER TABLE public."Specification" OWNER TO postgres;

--
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    id integer NOT NULL,
    name character varying(60),
    national_id bigint NOT NULL,
    birth_date date,
    enrollment_date date,
    graduation_date date
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- Name: Teaching; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Teaching" (
    id integer NOT NULL,
    role character varying(60),
    semester character varying(30),
    year integer,
    course_id character varying(10),
    faculty_id integer
);


ALTER TABLE public."Teaching" OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Data for Name: Course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Course" (id, name, textbook, credits, is_active, department_id) FROM stdin;
CE111	Introduction to Structural Engineering	Structures : Or Why Things Don't Fall Down by Gordon	7	Yes	4
CE121	Geotechnical Engineering-I	Introduction to Geotechnical Engineering by Das and Sivakugan	7	Yes	4
CE131	Mechanics of Solids-I	Mechanics of Solids by Ross	7	Yes	4
CE141	Mechanics of Fluids-I	Mechanics of Fluids by Smith	7	Yes	4
CE151	Modeling Tools for Civil Engineers	Modeling Tools	7	Yes	4
CE161	Statistics for Civil Engineers	Advanced Statistics	7	Yes	4
CE221	Geotechnical Engineering-II	Geotechnical Engineering: Principles and Practices by Coduto	7	Yes	4
CE231	Mechanics of Solids-II	Engineering Mechanics: Solids by Egor	7	Yes	4
CE241	Mechanics of Fluids-II	Theoretical Fluid Mechanics	7	Yes	4
CE421	Geotechnical Engineering-III	Advanced Geotechnical Engineering by Desai et. al	5	Yes	4
CE431	Mechanics of Solids-III	Advanced Mechanics of Solids by Srinath	5	Yes	4
CE441	Mechanics of Fluids-III	Advanced Fluid Mechanics by Graebel	5	Yes	4
CE511	Advanced Structural Engineering	Recent Research Papers	5	No	4
CS111	Introduction to Operating Systems	OS by Tanenbaum	7	Yes	1
CS112	Introduction to Real Time Operating Systems	Real-Time Operating Systems Book 1: The Theory by Cooling	7	Yes	1
CS113	Introduction to Computer Architecture	Computer Architecture by Patterson	7	Yes	1
CS121	Introduction to Databases	Database Systems: The Complete Book	7	Yes	1
CS122	Relational Databases	Database Systems: The Complete Book	7	No	1
CS123	Introduction to Structured Query Language	Database Systems: The Complete Book	7	Yes	1
CS131	Introduction to Data Structures	Introduction to Algorithms	7	Yes	1
CS132	Introduction to Algorithms	Introduction to Algorithms	7	Yes	1
CS141	Statistical Machine Learning	Statistical Machine Learning: A Unified Framework	7	Yes	1
CS142	Theory of Machine Learning	Machine Learning by Ethem	7	Yes	1
CS211	Operating Systems: Intermediate	OS by Tanenbaum	7	Yes	1
CS212	Real Time Operating Systems: Intermediate	Real-Time Operating Systems Book 1: The Theory by Cooling	7	Yes	1
CS213	Computer Architecture: Intermediate	Computer Architecture by Patterson	7	Yes	1
CS221	Intermediate: Structured Query Language	Database Systems: The Complete Book	7	Yes	1
CS222	Intermediate PostgreSQL	Database Systems: The Complete Book	7	Yes	1
CS231	Data Structures: Intermediate Level	Introduction to Algorithms	7	Yes	1
CS232	Algorithms: Intermediate Level	Introduction to Algorithms	7	Yes	1
CS235	Planar Graphs	Graph Theory by Diestel	7	Yes	1
CS241	Reinforcement Learning	Reinforcement Learning: An Introduction	7	Yes	1
CS242	Theory of Deep Learning	Deep Learning by Yoshua	7	Yes	1
CS411	Advanced Operating Systems	OS by Tanenbaum	5	Yes	1
CS413	Advanced Computer Architecture	Computer Architecture by Patterson	5	Yes	1
CS421	Advanced Database Concepts	Database Internals: A Deep Dive Into How Distributed Data Systems Work	5	Yes	1
CS422	Advanced Relational Databases	Database Systems: The Complete Book	5	Yes	1
CS441	Advanced Machine Learning	Recent Research Papers	5	Yes	1
CS442	Advances in Deep Learning	Recent Research Papers	5	No	1
CS443	Advanced Reinforcement Learning	Reinforcement Learning	5	Yes	1
CS511	Distributed Systems	OS by Tanenbaum	5	Yes	1
CS531	Advanced Data Structures	Introduction to Algorithms	5	Yes	1
CS532	Advanced Algorithms	Introduction to Algorithms	5	Yes	1
CS535	Non-Planar Graphs	Graph Theory by Diestel	5	No	1
EC111	Principles of Communication	Principles Of Communications: System Modulation And Noise	7	Yes	2
EC121	Signal and Systems	Signals and Systems by Oppenheim	7	Yes	2
EC131	Electronics-I	Power Electronics	7	Yes	2
EC141	Modeling Tools for Electronics Engineers	Modeling Tools	7	Yes	2
EC151	Statistics for Electronics Engineers	Advanced Statistics	7	Yes	2
EC211	Principles of Communication-II	Principles Of Communications: System Modulation And Noise	7	Yes	2
EC221	Digital Signal Processing	Digital Signal Processing: Principles, Algorithms, and Applications	7	Yes	2
EC222	Introduction to Programming Matlab	Matlab: an Introduction	7	Yes	2
EC231	Electronics-II	Power Electronics	7	Yes	2
EC411	Principles of Communication-III	Principles Of Communications: System Modulation And Noise	5	Yes	2
EC421	Advanced Signal and Systems	Signals and Systems	5	Yes	2
EC431	Electronics-III	Power Electronics	5	Yes	2
MA111	Linear Algebra	Introduction to Linear Algebra by Strang	7	Yes	5
MA121	Discrete Maths-I	Discrete Mathematics and Its Applications	7	Yes	5
MA122	Introduction to Graduate Mathematics	Introduction to College Mathematics	7	Yes	5
MA131	Introduction to Calculus	Advanced Calculus of Several Variables	7	Yes	5
MA141	Introduction to Optimizaton	An Introduction to Optimization	7	Yes	5
MA142	Introduction to Programming	Art of Programming	7	Yes	5
MA211	Linear Algebra-II	Introduction to Linear Algebra by Strang	7	Yes	5
MA221	Discrete Maths-II	Discrete Mathematics and Its Applications	7	Yes	5
MA231	Calculus: Intermediate	Advanced Calculus of Several Variables	7	Yes	5
MA241	Convex Optimizaton	An Introduction to Optimization	7	No	5
MA411	Linear Algebra-III	Introduction to Linear Algebra by Strang	5	Yes	5
MA421	Discrete Maths-III	Discrete Mathematics and Its Applications	5	Yes	5
MA431	Advanced Calculus	Advanced Calculus by Petrovic	5	Yes	5
MA441	Advanced Optimizaton	Numerical Optimization	5	No	5
ME111	Advanced Dynamics: Introduction	Advanced Dynamics by Donald	7	Yes	3
ME121	Nanotechnology-I	Introduction to Nanotechnology by Owens	7	Yes	3
ME131	Introduction to Operations Management	Operations Management by Stevenson	7	Yes	3
ME141	Modeling Tools for Mechanical Engineers	Modeling Tools	7	Yes	3
ME151	Statistics for Mechanical Engineers	Advanced Statistics	7	Yes	3
ME161	Supply Chain Management	Supply Chain Management: Strategy, Planning, and Operation by Chopra	7	Yes	3
ME211	Advanced Dynamics-II	Advanced Dynamics by Donald	7	Yes	3
ME221	Nanotechnology-II	Advanced Magnetic Nanostructures by Sellmyer and Skomski	7	Yes	3
ME411	Advanced Dynamics: Special Module	Advanced Dynamics by Donald	5	Yes	3
ME421	Nanotechnology-III	Recent Research Papers	5	Yes	3
ME431	Advanced Operations Management	Operations Management: Processes and Supply Chains	5	Yes	3
\.


--
-- Data for Name: Department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Department" (id, name, code) FROM stdin;
1	Computer Science	CS
2	Electronics and Communications	EC
3	Mechanical Engineering	ME
4	Civil Engineering	CE
5	Mathematics	MA
\.


--
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Exam" (id, exam_date, grade, course_id, student_id) FROM stdin;
1	2022-07-11	A+	CS111	1001
2	2022-07-11	A	CS121	1001
3	2022-07-11	A+	CS122	1001
4	2022-12-05	B+	CS211	1001
5	2022-12-06	B	CS212	1001
6	2022-12-07	B+	MA111	1001
7	2023-07-11	A+	CS411	1001
8	2023-07-11	A+	CS511	1001
9	2023-07-11	F	MA211	1001
10	2023-12-05	\N	CS121	1001
11	2023-12-06	\N	CS122	1001
12	2023-12-14	\N	MA411	1001
21	2022-07-11	A	CS121	1003
22	2022-07-11	A+	CS122	1003
23	2022-01-11	A+	CS123	1003
24	2022-12-19	A	CS221	1003
25	2022-12-20	B	CS132	1003
26	2022-12-18	A	CS131	1003
27	2023-07-19	B	CS421	1003
28	2023-07-21	C	CS422	1003
29	2023-07-22	F	MA111	1003
30	2023-12-19	\N	CS132	1003
31	2023-12-16	\N	CS231	1003
32	2023-12-17	\N	MA211	1003
41	2022-07-19	A+	CS131	1007
42	2022-07-21	A+	CS132	1007
43	2022-07-22	A	CS121	1007
44	2022-12-21	A+	CS221	1007
45	2022-12-20	A+	CS232	1007
46	2022-12-19	A	CS231	1007
47	2023-07-19	F	CS531	1007
48	2023-07-18	A	CS532	1007
49	2023-07-21	B+	CS141	1007
50	2023-12-15	\N	CS142	1007
51	2023-12-16	\N	CS242	1007
52	2023-12-17	\N	EC121	1007
61	2022-07-19	A+	CS141	1010
62	2022-01-21	A	CS142	1010
63	2022-01-20	B+	CS131	1010
64	2022-12-17	A+	CS241	1010
65	2022-12-16	A	CS242	1010
66	2022-12-19	B+	EC111	1010
67	2023-07-18	B+	CS441	1010
68	2023-07-19	B	CS442	1010
69	2023-07-20	F	MA111	1010
70	2023-12-19	\N	CS443	1010
71	2023-12-18	\N	CS231	1010
72	2023-12-20	\N	MA211	1010
2001	2022-07-19	A	EC111	1607
2002	2022-07-21	A+	EC131	1607
2003	2022-07-20	A	EC151	1607
2004	2022-12-15	B	EC211	1607
2005	2022-12-16	B+	EC221	1607
2006	2022-12-17	B+	CS111	1607
2007	2023-07-19	A+	EC411	1607
2008	2023-07-20	A+	CS112	1607
2009	2023-07-22	F	CS113	1607
2010	2023-12-05	\N	EC121	1607
2011	2023-12-06	\N	EC141	1607
2012	2023-12-14	\N	CS211	1607
2051	2022-07-21	A	EC121	1610
2052	2022-07-19	A+	EC141	1610
2053	2022-07-22	A+	CS111	1610
2054	2022-12-15	B+	EC221	1610
2055	2022-12-16	B+	EC231	1610
2056	2022-12-17	B+	MA111	1610
2057	2023-07-11	A	EC411	1610
2058	2023-07-11	F	CS112	1610
2059	2023-07-11	B+	CS113	1610
2060	2023-12-15	\N	EC421	1610
2061	2023-12-16	\N	EC431	1610
2062	2023-12-19	\N	CS211	1610
3001	2022-07-20	A+	ME111	2008
3002	2022-07-19	B+	ME131	2008
3003	2022-07-22	B	ME141	2008
3004	2022-12-20	A	ME211	2008
3005	2022-12-19	A+	CS142	2008
3006	2022-12-22	A+	CS141	2008
3011	2023-07-20	F	ME411	2008
3012	2023-07-19	B+	CS241	2008
3013	2023-07-22	B	CS242	2008
3014	2023-12-21	\N	ME211	2008
3015	2023-12-23	\N	ME431	2008
3016	2023-12-22	\N	CS111	2008
3051	2022-07-20	A+	ME121	2009
3052	2022-07-19	B+	ME151	2009
3053	2022-07-22	B	ME161	2009
3054	2022-12-20	A	ME221	2009
3055	2022-12-19	A+	CS142	2009
3056	2022-12-22	A+	CS141	2009
3062	2023-07-19	F	CS241	2009
3063	2023-07-22	B	CS242	2009
3064	2023-12-21	\N	ME421	2009
3065	2023-12-23	\N	ME431	2009
3066	2023-12-22	\N	ME131	2009
4001	2022-07-21	A+	CE111	1103
4002	2022-07-22	A	CE121	1103
4003	2022-07-20	A	CE161	1103
4004	2022-12-21	A+	CE221	1103
4005	2022-12-18	A	CE511	1103
4006	2022-12-19	A	CS111	1103
4011	2023-07-21	B	CE421	1103
4012	2023-07-22	B	CE511	1103
4013	2023-07-20	F	CE161	1103
4014	2023-12-21	\N	MA131	1103
4015	2023-12-18	\N	MA111	1103
4016	2023-12-19	\N	MA142	1103
4051	2022-07-21	A+	CE131	1107
4052	2022-07-22	A	CE141	1107
4053	2022-07-20	A	CE151	1107
4054	2022-12-21	A+	CE231	1107
4055	2022-12-18	A	CE241	1107
4056	2022-12-19	A	CS111	1107
4061	2023-07-21	B	CE431	1107
4062	2023-07-22	B	CE441	1107
4063	2023-07-20	F	CE161	1107
4064	2023-12-21	\N	MA131	1107
4065	2023-12-18	\N	MA111	1107
4066	2023-12-19	\N	MA142	1107
5001	2022-07-21	A+	MA111	1710
5002	2022-07-19	A	MA131	1710
5003	2022-07-22	B+	MA142	1710
5004	2022-12-21	B+	MA211	1710
5005	2022-12-19	A	MA231	1710
5006	2022-12-22	A	CS111	1710
5011	2023-07-21	A+	MA411	1710
5012	2023-07-19	A	MA431	1710
5013	2023-07-22	F	CS211	1710
5014	2023-12-21	\N	MA211	1710
5015	2023-12-19	\N	MA231	1710
5016	2023-12-22	\N	CS111	1710
5101	2022-07-21	A+	MA121	1707
5102	2022-07-19	A	MA122	1707
5103	2022-07-22	B+	MA141	1707
5104	2022-12-21	B+	MA221	1707
5105	2022-12-19	A	MA241	1707
5106	2022-12-22	A	CS111	1707
5111	2023-07-21	A+	MA421	1707
5112	2023-07-19	A	MA441	1707
5113	2023-07-22	F	MA142	1707
5114	2023-12-21	\N	CS211	1707
5115	2023-12-19	\N	CS113	1707
5116	2023-12-22	\N	CS211	1707
\.


--
-- Data for Name: Faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Faculty" (id, name, national_id, "position", start_date, end_date, department_id) FROM stdin;
1	Anubha Gupta	1018901231	Professor	2010-01-11	2027-03-11	2
2	Anubha Gupta	1018901231	Associate Professor	2007-01-09	2010-01-10	2
3	Anubha Gupta	1018901231	Assistant Professor	2004-05-11	2007-01-08	2
21	Peter Pan	2130989011	Professor	2007-05-11	\N	2
22	Peter Pan	2130989011	Associate Professor	2004-07-11	2007-05-10	2
23	Peter Pan	2130989011	Assistant Professor	2001-05-11	2004-07-10	2
33	Nando de Fretas	3130901341	Associate Professor	2023-03-11	2025-04-08	2
34	Nando de Fretas	3130901341	Assistant Professor	2020-05-17	2023-03-10	2
41	Robert Ludloo	3031201441	Assistant Professor	2017-05-11	\N	2
42	Robert Ludloo	3031201441	Teaching Assistant	2014-05-11	2017-05-10	2
51	Vikram Goyal	6541236090	Professor	2016-01-11	\N	2
52	Vikram Goyal	6541236090	Associate Professor	2012-03-20	2016-03-10	2
53	Vikram Goyal	6541236090	Assistant Professor	2009-03-12	2012-03-19	2
54	Vikram Goyal	6541236090	Teaching Assistant	2006-01-11	2009-03-11	2
100	Score Koli	3221114041	Teaching Assistant	2021-01-11	2023-03-20	2
101	Schroger Ken	3251113041	Teaching Assistant	2023-01-03	\N	2
102	Schidt Kraus	3112124041	Teaching Assistant	2022-01-11	\N	2
111	AV Subramanium	1340902317	Assistant Professor	2011-05-11	\N	1
121	Risa Sodi	1409239017	Associate Professor	2010-01-11	\N	1
122	Risa Sodi	1409239017	Assistant Professor	2008-04-08	2010-01-10	1
131	Wlliam Liu	231456789	Professor	2015-05-12	\N	1
132	Wlliam Liu	231456789	Associate Professor	2009-02-11	2015-05-11	1
133	Wlliam Liu	231456789	Assistant Professor	2006-03-22	2009-02-10	1
134	Wlliam Liu	231456789	Teaching Assistant	2003-05-11	2006-03-21	1
221	Cormen Qiu	1040902317	Professor	2013-03-11	\N	1
225	Ajit Singh	1302632117	Assistant Professor	2012-05-11	2024-06-08	1
226	Ajit Singh	1302632117	Teaching Assistant	2009-05-11	2012-05-10	1
227	Sam Wilson	3021632117	Professor	2021-05-11	\N	1
228	Sam Wilson	3021632117	Associate Professor	2018-02-10	2021-05-10	1
229	Liu Lian	2163202117	Associate Professor	2019-02-10	\N	1
230	Kiu Chi	3163218917	Assistant Professor	2020-12-10	\N	1
300	Milos Simic	9875511222	Teaching Assistant	2022-04-11	\N	1
301	Ritu Jain	1347551122	Teaching Assistant	2022-04-11	2024-12-19	1
302	Reera Soi	7309551122	Teaching Assistant	2022-07-10	2023-12-23	1
303	Michael Albin	3147551122	Teaching Assistant	2022-04-11	2025-12-12	1
304	Tahir Hussain	8569551122	Teaching Assistant	2021-12-10	\N	1
305	Michael Albin	5637551122	Teaching Assistant	2021-04-11	2025-12-12	1
401	Vini Joseph	9028291011	Professor	2015-02-12	\N	3
402	Vini Joseph	9028291011	Associate Professor	2015-02-11	2012-09-09	3
421	Brandon Fraser	2314561011	Assistant Professor	2013-08-11	\N	3
431	Thomas Cook	7734139012	Associate Professor	2016-10-11	\N	3
432	Thomas Cook	7734139012	Assistant Professor	2013-03-11	2016-10-10	3
441	Steven Joe	1567230978	Professor	2019-09-11	\N	3
451	Rick Ponting	6605504403	Assistant Professor	2020-11-11	\N	3
510	Ranold Krose	2314553301	Teaching Assistant	2021-09-11	\N	3
511	Rini Sen	1423553301	Teaching Assistant	2022-06-11	\N	3
512	Casper Jones	4253513301	Teaching Assistant	2021-04-11	\N	3
601	Sussie Smith	1657230918	Professor	2019-01-11	2027-02-18	5
602	Sussie Smith	1657230918	Associate Professor	2015-10-11	2019-01-10	5
603	Sussie Smith	1657230918	Assistant Professor	2012-01-09	2015-10-10	5
621	Badrinath Ho	2010111987	Professor	2016-03-11	\N	5
631	Theiry Kerry	2110118447	Associate Professor	2019-04-11	\N	5
641	Steve Joseph	1314567655	Assistant Professor	2021-06-23	\N	5
642	Steve Joseph	1314567655	Teaching Assistant	2019-03-11	2021-06-23	5
651	Rina Anderson	1902341504	Assistant Professor	2020-09-11	2026-07-08	5
652	Rina Anderson	1902341504	Teaching Assistant	2017-09-11	2020-09-10	5
671	Rosita Klaus	1234015024	Teaching Assistant	2023-01-08	2024-02-02	5
672	Ballu Singh	2134105024	Teaching Assistant	2022-12-11	2024-02-02	5
673	Rory Ross	4021351024	Teaching Assistant	2022-11-11	2024-02-02	5
681	Vin Diesel	1331405624	Professor	2014-01-11	\N	4
682	Vin Diesel	1331405624	Associate Professor	2009-01-11	2014-01-10	4
691	Brandon Ford	2131435609	Assistant Professor	2013-01-11	\N	4
703	Thor Cookie	1112125129	Associate Professor	2016-01-11	\N	4
715	Ron Parry	2032145096	Assistant Professor	2020-01-11	\N	4
716	Ron Parry	2032145096	Teaching Assistant	2018-01-09	2020-01-10	4
724	Stove Joseph	1010101332	Professor	2019-01-11	2025-02-08	4
725	Stove Joseph	1010101332	Associate Professor	2015-12-10	2019-01-10	4
726	Stove Joseph	1010101332	Assistant Professor	2011-02-09	2015-12-09	4
727	Stove Joseph	1010101332	Teaching Assistant	2008-03-11	2011-02-08	4
739	Karen Walter	2314657876	Teaching Assistant	2022-11-11	\N	4
740	Kira Wass	2314623876	Teaching Assistant	2021-09-11	\N	4
741	Sophia Ker	2314437876	Teaching Assistant	2022-08-11	\N	4
\.


--
-- Data for Name: Prerequisite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Prerequisite" (id, course_id, prerequisite_id) FROM stdin;
2	CS411	CS211
3	CS511	CS211
4	CS211	CS111
5	CS211	CS112
6	CS213	CS113
7	CS413	CS213
21	CS221	CS121
22	CS221	CS123
23	CS421	CS121
24	CS422	CS122
103	CS231	CS131
104	CS232	CS131
105	CS232	CS132
106	CS235	CS131
108	CS531	CS231
110	CS532	CS232
111	CS535	CS235
203	CS241	CS141
204	CS242	CS141
205	CS242	CS142
207	CS441	CS241
208	CS442	CS242
209	CS443	CS241
2051	EC211	EC111
2052	EC221	EC121
2053	EC231	EC131
2102	EC411	EC211
2104	EC421	EC221
2106	EC431	EC231
3051	ME211	ME111
3052	ME221	ME121
3102	ME411	ME211
3104	ME421	ME221
3105	ME431	ME131
3106	ME431	ME151
4051	CE221	CE121
4052	CE231	CE131
4053	CE241	CE141
4101	CE511	CE111
4102	CE421	CE221
4104	CE431	CE231
4106	CE441	CE241
5051	MA211	MA111
5052	MA221	MA121
5053	MA231	MA131
5054	MA241	MA141
5102	MA411	MA211
5103	MA421	MA221
5105	MA431	MA231
5107	MA441	MA241
\.


--
-- Data for Name: Program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Program" (id, name, description, start_date, end_date, type, department_id) FROM stdin;
111	Operating Systems	Major in Operating Systems	2012-01-01	\N	Major	1
112	Operating Systems	Minor in Operating Systems	2012-01-01	\N	Minor	1
121	Databases	Major in Database Management Systems	2011-01-01	\N	Major	1
122	Databases	Major in Database Management Systems	2011-01-01	\N	Minor	1
131	Theoretical Computer Science	Major in Theoretical Computer Science	2010-01-01	\N	Major	1
132	Theoretical Computer Science	Minor in Theoretical Computer Science	2010-01-01	\N	Minor	1
141	Artificial Intelligence	Major in Artificial Intelligence	2018-07-01	\N	Major	1
142	Artificial Intelligence	Minor in Artificial Intelligence	2018-07-01	\N	Minor	1
211	Communications	Major in Communications	2011-01-11	\N	Major	2
212	Communications	Minor in Communications	2011-01-11	\N	Minor	2
221	Signals and Systems	Major in Signals and Systems	2010-07-11	\N	Major	2
222	Signals and Systems	Minor in Signals and Systems	2010-07-11	\N	Minor	2
311	Dynamics	Major in Dynamics	2010-07-01	\N	Major	3
312	Dynamics	Minor in Dynamics	2010-07-01	\N	Major	3
321	Nanotechnology	Major in Nanotechnology	2010-07-01	\N	Major	3
322	Nanotechnology	Minor in Nanotechnology	2010-07-01	\N	Minor	3
411	Structural Engineering	Major in Structural Engineering	2010-01-11	\N	Major	4
412	Structural Engineering	Minor in Structural Engineering	2010-01-11	\N	Minor	4
421	Mechanics	Major in Mechanics	2011-07-01	\N	Major	4
422	Mechanics	Minor in Mechanics	2011-07-01	\N	Minor	4
511	Linear Algebra	Major in Linear Algebra	2011-01-11	\N	Major	5
512	Linear Algebra	Minor in Linear Algebra	2011-01-11	\N	Minor	5
521	Discrete Mathematics	Major in Discrete Mathematics	2010-07-11	\N	Major	5
522	Discrete Mathematics	Minor in Discrete Mathematics	2010-07-11	\N	Minor	5
\.


--
-- Data for Name: Registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration" (id, semester, year, registration_datetime, course_id, student_id) FROM stdin;
1	SPRING	2022	2022-01-11 12:45:56	CS111	1001
2	SPRING	2022	2022-01-11 12:45:56	CS121	1001
3	SPRING	2022	2022-01-11 12:45:56	CS122	1001
11	SPRING	2022	2022-01-11 09:45:56	CS121	1003
12	SPRING	2022	2022-01-11 08:45:56	CS122	1003
13	SPRING	2022	2022-01-11 15:45:56	CS123	1003
21	SPRING	2022	2022-01-11 09:45:56	CS131	1007
22	SPRING	2022	2022-01-11 08:45:56	CS132	1007
23	SPRING	2022	2022-01-11 15:45:56	CS121	1007
31	SPRING	2022	2022-01-11 09:45:56	CS141	1010
32	SPRING	2022	2022-01-11 08:45:56	CS142	1010
33	SPRING	2022	2022-01-11 15:45:56	CS131	1010
101	FALL	2022	2022-08-05 12:45:56	CS211	1001
102	FALL	2022	2022-08-06 11:15:56	CS212	1001
103	FALL	2022	2022-08-07 09:35:56	MA111	1001
104	FALL	2022	2022-08-07 09:35:56	CS531	1001
111	FALL	2022	2022-08-01 10:22:32	CS221	1003
112	FALL	2022	2022-08-01 19:12:32	CS132	1003
113	FALL	2022	2022-08-01 16:41:32	CS131	1003
121	FALL	2022	2022-08-01 10:22:32	CS221	1007
122	FALL	2022	2022-08-01 19:12:32	CS232	1007
123	FALL	2022	2022-08-01 16:41:32	CS231	1007
131	FALL	2022	2022-08-01 10:22:32	CS241	1010
132	FALL	2022	2022-08-01 19:12:32	CS242	1010
133	FALL	2022	2022-08-01 16:41:32	EC111	1010
201	SPRING	2023	2023-01-11 12:45:56	CS411	1001
202	SPRING	2023	2023-01-11 12:45:56	CS511	1001
203	SPRING	2023	2023-01-11 12:45:56	MA211	1001
211	SPRING	2023	2023-01-11 16:45:56	CS421	1003
212	SPRING	2023	2023-01-11 14:35:56	CS422	1003
213	SPRING	2023	2023-01-11 14:15:56	MA111	1003
221	SPRING	2023	2023-01-11 16:45:56	CS531	1007
222	SPRING	2023	2023-01-11 14:35:56	CS532	1007
223	SPRING	2023	2023-01-11 14:15:56	CS141	1007
231	SPRING	2023	2023-01-11 16:45:56	CS441	1010
232	SPRING	2023	2023-01-11 14:35:56	CS442	1010
233	SPRING	2023	2023-01-11 14:15:56	MA111	1010
301	FALL	2023	2023-08-05 12:45:56	CS121	1001
302	FALL	2023	2023-08-06 11:15:56	CS122	1001
303	FALL	2023	2023-08-07 09:35:56	MA411	1001
311	FALL	2023	2023-08-05 18:45:56	CS132	1003
312	FALL	2023	2023-08-06 10:15:56	CS231	1003
313	FALL	2023	2023-08-07 19:35:56	MA211	1003
321	FALL	2023	2023-08-05 18:45:56	CS142	1007
322	FALL	2023	2023-08-06 10:15:56	CS242	1007
323	FALL	2023	2023-08-07 19:35:56	EC121	1007
331	FALL	2023	2023-08-05 18:45:56	CS443	1010
332	FALL	2023	2023-08-06 10:15:56	CS231	1010
333	FALL	2023	2023-08-07 19:35:56	MA211	1010
2001	SPRING	2022	2022-01-08 11:42:50	EC111	1607
2002	SPRING	2022	2022-01-08 12:42:50	EC131	1607
2003	SPRING	2022	2022-01-08 13:42:50	EC151	1607
2011	SPRING	2022	2022-01-08 13:42:50	EC121	1610
2012	SPRING	2022	2022-01-08 13:42:50	EC141	1610
2013	SPRING	2022	2022-01-08 13:42:50	CS111	1610
2051	FALL	2022	2022-08-05 11:22:50	EC211	1607
2052	FALL	2022	2022-08-04 12:12:50	EC221	1607
2053	FALL	2022	2022-08-03 15:32:50	CS111	1607
2101	SPRING	2023	2023-01-06 11:42:50	EC411	1607
2102	SPRING	2023	2023-01-06 12:42:50	CS112	1607
2103	SPRING	2023	2023-01-05 13:42:50	CS113	1607
2111	SPRING	2023	2023-01-06 11:42:50	EC411	1610
2112	SPRING	2023	2023-01-06 12:42:50	CS112	1610
2113	SPRING	2023	2023-01-05 13:42:50	CS113	1610
2151	FALL	2022	2022-08-02 11:22:50	EC221	1610
2152	FALL	2022	2022-08-02 12:12:50	EC231	1610
2153	FALL	2022	2022-08-02 15:32:50	MA111	1610
2551	FALL	2022	2022-08-05 11:22:50	EC121	1607
2552	FALL	2022	2022-08-04 12:12:50	EC141	1607
2553	FALL	2022	2022-08-03 15:32:50	CS211	1607
2671	FALL	2022	2022-08-05 11:22:50	EC421	1610
2672	FALL	2022	2022-08-04 12:12:50	EC431	1610
2673	FALL	2022	2022-08-03 15:32:50	CS211	1610
3001	SPRING	2022	2022-01-08 13:12:50	ME111	2008
3002	SPRING	2022	2022-01-07 12:42:50	ME131	2008
3003	SPRING	2022	2022-01-09 14:22:50	ME141	2008
3011	SPRING	2022	2022-01-08 11:12:50	ME121	2009
3012	SPRING	2022	2022-01-08 12:42:50	ME151	2009
3013	SPRING	2022	2022-01-10 14:22:50	ME161	2009
3051	FALL	2022	2022-08-03 16:12:50	ME211	2008
3052	FALL	2022	2022-08-04 11:42:50	CS142	2008
3053	FALL	2022	2022-08-05 15:22:50	CS141	2008
3071	FALL	2022	2022-08-10 16:12:50	ME221	2009
3072	FALL	2022	2022-08-12 11:42:50	CS142	2009
3073	FALL	2022	2022-08-09 15:22:50	CS141	2009
3101	SPRING	2023	2023-01-09 10:12:50	ME411	2008
3102	SPRING	2023	2023-01-09 15:42:50	CS241	2008
3103	SPRING	2023	2023-01-09 11:22:50	CS242	2008
3121	SPRING	2023	2023-01-04 10:12:50	ME431	2009
3122	SPRING	2023	2023-01-05 15:42:50	CS241	2009
3123	SPRING	2023	2023-01-04 11:22:50	CS242	2009
3151	FALL	2023	2023-08-04 10:12:50	ME211	2008
3152	FALL	2023	2023-08-07 10:42:50	ME431	2008
3153	FALL	2023	2023-08-06 13:22:50	CS111	2008
3171	FALL	2023	2023-08-02 10:12:50	ME421	2009
3172	FALL	2023	2023-08-05 10:42:50	ME431	2009
3173	FALL	2023	2023-08-05 13:22:50	ME131	2009
4001	SPRING	2022	2022-01-03 13:42:50	CE111	1103
4002	SPRING	2022	2022-01-03 13:42:50	CE121	1103
4003	SPRING	2022	2022-01-03 13:42:50	CE161	1103
4004	SPRING	2022	2022-01-04 13:42:50	CE421	1103
4011	SPRING	2022	2022-01-03 15:42:50	CE131	1107
4012	SPRING	2022	2022-01-03 15:42:50	CE141	1107
4013	SPRING	2022	2022-01-03 16:42:50	CE151	1107
4051	FALL	2022	2022-08-03 11:42:50	CE221	1103
4052	FALL	2022	2022-08-03 10:12:50	CE131	1103
4053	FALL	2022	2022-08-03 12:14:50	CS111	1103
4071	FALL	2022	2022-08-03 12:42:50	CE231	1107
4072	FALL	2022	2022-08-03 14:12:50	CE241	1107
4073	FALL	2022	2022-08-03 14:14:50	CS111	1107
4101	SPRING	2023	2023-01-03 13:42:50	CE421	1103
4102	SPRING	2023	2023-01-03 13:42:50	CE511	1103
4103	SPRING	2023	2023-01-03 13:42:50	CE161	1103
4121	SPRING	2023	2023-01-03 15:42:50	CE431	1107
4122	SPRING	2023	2023-01-03 11:42:50	CE441	1107
4123	SPRING	2023	2023-01-03 18:42:50	CE161	1107
4151	FALL	2023	2023-08-03 11:42:50	MA131	1103
4152	FALL	2023	2023-08-03 10:12:50	MA111	1103
4153	FALL	2023	2023-08-03 12:14:50	MA142	1103
4171	FALL	2023	2023-08-03 11:12:50	MA131	1107
4172	FALL	2023	2023-08-03 10:32:50	MA111	1107
4173	FALL	2023	2023-08-03 12:24:50	MA142	1107
5001	SPRING	2022	2022-01-11 13:42:50	MA111	1710
5002	SPRING	2022	2022-01-11 13:42:50	MA131	1710
5003	SPRING	2022	2022-01-11 13:42:50	MA142	1710
5051	FALL	2022	2022-08-03 10:12:50	MA211	1710
5052	FALL	2022	2022-08-03 11:12:50	MA231	1710
5053	FALL	2022	2022-08-03 11:12:50	CS111	1710
5101	SPRING	2023	2023-01-08 17:42:50	MA411	1710
5102	SPRING	2023	2023-01-09 15:42:50	MA431	1710
5103	SPRING	2023	2023-01-12 10:42:50	CS211	1710
5111	SPRING	2022	2022-01-11 13:42:50	MA121	1707
5112	SPRING	2022	2022-01-11 13:42:50	MA122	1707
5113	SPRING	2022	2022-01-11 13:42:50	MA141	1707
5114	SPRING	2022	2022-01-11 13:42:50	MA241	1707
5151	FALL	2023	2023-08-03 11:12:50	MA211	1710
5152	FALL	2023	2023-08-05 09:12:50	MA231	1710
5153	FALL	2023	2023-08-04 14:12:50	CS111	1710
5171	FALL	2022	2022-08-03 10:12:50	MA221	1707
5172	FALL	2022	2022-08-03 12:22:50	MA241	1707
5173	FALL	2022	2022-08-03 11:02:50	CS111	1710
5201	SPRING	2023	2023-01-03 17:12:50	MA421	1707
5202	SPRING	2023	2023-01-03 17:12:50	MA441	1707
5203	SPRING	2023	2023-01-03 17:12:50	MA142	1707
5371	FALL	2023	2023-08-05 11:12:50	CS112	1707
5372	FALL	2023	2023-08-07 09:12:50	CS113	1707
5373	FALL	2023	2023-08-02 14:12:50	CS211	1707
\.


--
-- Data for Name: Specification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Specification" (id, status, course_id, program_id) FROM stdin;
1	Mandatory	CS111	111
2	Mandatory	CS112	111
3	Mandatory	CS113	111
4	Mandatory	CS211	111
5	Mandatory	CS212	111
6	Mandatory	CS213	111
7	Elective	CS411	111
8	Elective	CS511	111
9	Elective	CS413	111
101	Mandatory	CS111	112
102	Mandatory	CS112	112
103	Mandatory	CS113	112
104	Mandatory	CS211	112
105	Mandatory	CS212	112
106	Mandatory	CS213	112
201	Mandatory	CS121	121
202	Mandatory	CS122	121
203	Mandatory	CS123	121
204	Mandatory	CS221	121
205	Mandatory	CS222	121
206	Mandatory	CS213	121
207	Elective	CS421	121
208	Elective	CS422	121
251	Mandatory	CS121	122
252	Mandatory	CS122	122
253	Mandatory	CS123	122
254	Mandatory	CS221	122
255	Mandatory	CS222	122
256	Mandatory	CS213	122
301	Mandatory	CS131	131
302	Mandatory	CS132	131
303	Mandatory	CS231	131
304	Mandatory	CS232	131
305	Mandatory	CS235	131
306	Elective	CS531	131
307	Elective	CS532	131
308	Elective	CS535	131
351	Mandatory	CS131	132
352	Mandatory	CS132	132
353	Mandatory	CS231	132
354	Mandatory	CS232	132
355	Mandatory	CS235	132
401	Mandatory	CS141	141
402	Mandatory	CS142	141
403	Mandatory	CS241	141
404	Mandatory	CS242	141
405	Elective	CS441	141
406	Elective	CS442	141
407	Elective	CS443	141
451	Mandatory	CS141	142
452	Mandatory	CS142	142
453	Mandatory	CS241	142
454	Mandatory	CS242	142
2001	Mandatory	EC111	211
2002	Mandatory	EC131	211
2004	Mandatory	EC151	211
2005	Mandatory	EC211	211
2006	Mandatory	EC221	211
2007	Elective	EC411	211
2101	Mandatory	EC111	212
2102	Mandatory	EC131	212
2104	Mandatory	EC151	212
2105	Mandatory	EC211	212
2106	Mandatory	EC221	212
2501	Mandatory	EC121	221
2502	Mandatory	EC221	221
2503	Elective	EC421	221
2504	Elective	EC431	221
2505	Mandatory	EC141	221
2506	Mandatory	EC222	221
2700	Mandatory	EC141	222
2701	Mandatory	EC121	222
2702	Mandatory	EC221	222
2703	Mandatory	EC222	222
3001	Mandatory	ME111	311
3002	Mandatory	ME131	311
3003	Mandatory	ME141	311
3004	Mandatory	ME211	311
3005	Elective	ME411	311
3101	Mandatory	ME111	312
3102	Mandatory	ME131	312
3103	Mandatory	ME141	312
3104	Mandatory	ME211	312
3501	Mandatory	ME121	321
3502	Mandatory	ME151	321
3503	Mandatory	ME161	321
3504	Mandatory	ME221	321
3505	Elective	ME421	321
3506	Elective	ME431	321
3701	Mandatory	ME121	322
3702	Mandatory	ME151	322
3703	Mandatory	ME161	322
3704	Mandatory	ME221	322
4001	Mandatory	CE111	411
4002	Mandatory	CE121	411
4003	Mandatory	CE161	411
4011	Mandatory	CE221	411
4012	Elective	CE511	411
4013	Elective	CE421	411
4101	Mandatory	CE111	412
4102	Mandatory	CE121	412
4103	Mandatory	CE161	412
4104	Mandatory	CE221	412
4501	Mandatory	CE131	421
4502	Mandatory	CE141	421
4503	Mandatory	CE151	421
4504	Mandatory	CE231	421
4505	Elective	CE431	421
4506	Elective	CE441	421
4701	Mandatory	CE131	422
4702	Mandatory	CE141	422
4703	Mandatory	CE151	422
4704	Mandatory	CE231	422
5001	Mandatory	MA111	511
5002	Mandatory	MA131	511
5003	Mandatory	MA142	511
5004	Mandatory	MA211	511
5005	Mandatory	MA231	511
5006	Elective	MA411	511
5007	Elective	MA431	511
5201	Mandatory	MA111	512
5202	Mandatory	MA131	512
5203	Mandatory	MA142	512
5204	Mandatory	MA211	512
5205	Mandatory	MA231	512
5501	Mandatory	MA121	521
5502	Mandatory	MA141	521
5503	Mandatory	MA122	521
5504	Mandatory	MA221	521
5505	Mandatory	MA241	521
5506	Elective	MA421	521
5507	Elective	MA441	521
5701	Mandatory	MA121	522
5702	Mandatory	MA141	522
5703	Mandatory	MA122	522
5704	Mandatory	MA221	522
5705	Mandatory	MA241	522
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Student" (id, name, national_id, birth_date, enrollment_date, graduation_date) FROM stdin;
1001	John Liu	123345566	2001-04-05	2020-01-15	2024-06-15
1003	Rita Ora	132345166	2001-01-14	2020-01-15	2024-06-15
1007	Philip Lose	321345566	2001-06-15	2020-01-15	2024-06-15
1010	Samantha Prabhu	3217165566	2001-03-21	2020-01-15	2024-06-15
1011	Vikas Jain	321345662	2001-07-18	2020-01-15	\N
1101	Jia Grey	1345236267	2001-02-05	2020-01-15	2024-06-15
1103	Rose Rit	1323612067	2001-05-14	2020-01-15	\N
1107	Phellum Luis	203678911	2001-03-15	2020-01-15	2024-06-15
1110	Albert Decosta	2617897011	2001-02-21	2020-01-15	2024-06-15
1111	Vikram Kohli	1516578091	2001-03-08	2020-01-15	2024-06-15
1607	Peter Liu	3043455662	2002-04-14	2021-01-15	2025-06-15
1610	Ritu Raj	3203455662	2002-02-05	2021-01-15	2025-06-15
1617	Philip Mohan	3103455662	2002-05-15	2021-01-15	2025-06-15
1619	Sam Roberts	9203455662	2002-06-21	2021-01-15	2025-06-15
1621	Vineet Jha	7203421662	2002-05-18	2021-01-15	\N
1707	Piu Liu	2101368101	2002-03-14	2021-01-15	\N
1710	Roni Roto	2678910631	2002-03-11	2021-01-15	2025-06-15
1717	Param Mohan	1023456545	2002-05-15	2021-01-15	2025-06-15
1719	Siren Lobo	189091342	2002-06-17	2021-01-15	\N
1721	Vini Puh	1312091343	2002-05-13	2021-01-15	2025-06-15
2001	Reena Roy	9023455613	2003-01-13	2022-01-15	2025-06-15
2006	Agatha Christi	1100245767	2003-05-19	2022-01-15	\N
2008	Julia Roberts	1212446677	2003-06-12	2022-01-15	2025-06-15
2009	Pollards Grey	6503453662	2003-04-19	2022-01-15	2025-06-15
2017	Potu Singh	1312445677	2003-03-11	2022-01-15	\N
\.


--
-- Data for Name: Teaching; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Teaching" (id, role, semester, year, course_id, faculty_id) FROM stdin;
1	Instructor	SPRING	2022	CS111	111
2	TA	SPRING	2022	CS111	300
3	Instructor	SPRING	2022	CS112	121
4	TA	SPRING	2022	CS112	301
5	Instructor	SPRING	2022	CS113	221
6	TA	SPRING	2022	CS113	302
7	Instructor	SPRING	2022	CS121	131
8	TA	SPRING	2022	CS121	303
9	Instructor	SPRING	2022	CS122	225
10	TA	SPRING	2022	CS122	304
11	Instructor	SPRING	2022	CS123	227
12	TA	SPRING	2022	CS123	305
13	Instructor	SPRING	2022	CS131	229
14	TA	SPRING	2022	CS131	305
15	Instructor	SPRING	2022	CS132	230
16	TA	SPRING	2022	CS132	304
17	Instructor	SPRING	2022	CS141	111
18	TA	SPRING	2022	CS141	303
19	Instructor	SPRING	2022	CS142	121
20	TA	SPRING	2022	CS142	301
23	Instructor	SPRING	2022	CS211	131
24	TA	SPRING	2022	CS211	300
25	Instructor	SPRING	2022	CS212	225
26	TA	SPRING	2022	CS212	301
27	Instructor	SPRING	2022	CS213	227
28	TA	SPRING	2022	CS213	302
29	Instructor	SPRING	2022	CS221	229
30	TA	SPRING	2022	CS221	303
31	Instructor	SPRING	2022	CS222	230
32	TA	SPRING	2022	CS222	304
33	Instructor	SPRING	2022	CS231	229
34	TA	SPRING	2022	CS231	305
35	Instructor	SPRING	2022	CS235	230
36	TA	SPRING	2022	CS235	301
37	Instructor	SPRING	2022	CS241	131
38	TA	SPRING	2022	CS241	302
39	Instructor	SPRING	2022	CS242	111
40	TA	SPRING	2022	CS242	303
41	Instructor	SPRING	2022	CS411	121
42	TA	SPRING	2022	CS411	304
43	Instructor	SPRING	2022	CS413	221
44	TA	SPRING	2022	CS413	305
45	Instructor	SPRING	2022	CS421	225
46	TA	SPRING	2022	CS421	305
47	Instructor	SPRING	2022	CS422	227
48	TA	SPRING	2022	CS422	304
49	Instructor	SPRING	2022	CS441	228
50	Instructor	SPRING	2022	CS443	221
51	TA	SPRING	2022	CS443	302
52	Instructor	SPRING	2022	CS511	121
53	TA	SPRING	2022	CS511	301
54	Instructor	SPRING	2022	CS531	230
55	TA	SPRING	2022	CS531	301
56	Instructor	SPRING	2022	CS532	229
57	TA	SPRING	2022	CS532	302
60	TA	SPRING	2022	CS441	303
101	Instructor	FALL	2022	CS111	111
102	TA	FALL	2022	CS111	300
103	Instructor	FALL	2022	CS112	121
104	TA	FALL	2022	CS112	301
105	Instructor	FALL	2022	CS113	221
106	TA	FALL	2022	CS113	302
107	Instructor	FALL	2022	CS121	131
108	TA	FALL	2022	CS121	303
109	Instructor	FALL	2022	CS122	225
110	TA	FALL	2022	CS122	304
111	Instructor	FALL	2022	CS123	227
112	TA	FALL	2022	CS123	305
113	Instructor	FALL	2022	CS131	230
114	TA	FALL	2022	CS131	305
115	Instructor	FALL	2022	CS132	229
116	TA	FALL	2022	CS132	304
117	Instructor	FALL	2022	CS141	121
118	TA	FALL	2022	CS141	303
119	Instructor	FALL	2022	CS142	111
120	TA	FALL	2022	CS142	301
121	Instructor	FALL	2022	CS421	225
122	TA	FALL	2022	CS421	305
123	Instructor	FALL	2022	CS211	131
124	TA	FALL	2022	CS211	300
125	Instructor	FALL	2022	CS212	225
126	TA	FALL	2022	CS212	301
127	Instructor	FALL	2022	CS213	227
128	TA	FALL	2022	CS213	302
129	Instructor	FALL	2022	CS221	221
130	TA	FALL	2022	CS221	303
131	Instructor	FALL	2022	CS222	230
132	TA	FALL	2022	CS222	304
133	Instructor	FALL	2022	CS231	229
134	TA	FALL	2022	CS231	305
135	Instructor	FALL	2022	CS235	230
136	TA	FALL	2022	CS235	301
137	Instructor	FALL	2022	CS241	131
138	TA	FALL	2022	CS241	302
139	Instructor	FALL	2022	CS242	111
140	TA	FALL	2022	CS242	303
141	Instructor	FALL	2022	CS411	121
142	TA	FALL	2022	CS411	304
143	Instructor	FALL	2022	CS413	221
144	TA	FALL	2022	CS413	301
146	Instructor	FALL	2022	CS422	227
147	TA	FALL	2022	CS422	302
148	Instructor	FALL	2022	CS441	228
149	TA	FALL	2022	CS441	303
150	Instructor	FALL	2022	CS443	221
151	TA	FALL	2022	CS443	304
152	Instructor	FALL	2022	CS511	121
153	TA	FALL	2022	CS511	305
154	Instructor	FALL	2022	CS531	230
155	TA	FALL	2022	CS531	302
156	Instructor	FALL	2022	CS532	229
157	TA	FALL	2022	CS532	300
201	Instructor	SPRING	2023	CS111	121
202	TA	SPRING	2023	CS111	300
203	Instructor	SPRING	2023	CS112	111
204	TA	SPRING	2023	CS112	301
205	Instructor	SPRING	2023	CS113	225
206	TA	SPRING	2023	CS113	302
207	Instructor	SPRING	2023	CS121	131
208	TA	SPRING	2023	CS121	303
209	Instructor	SPRING	2023	CS122	221
210	TA	SPRING	2023	CS122	304
211	Instructor	SPRING	2023	CS123	227
212	TA	SPRING	2023	CS123	305
213	Instructor	SPRING	2023	CS131	229
214	TA	SPRING	2023	CS131	305
215	Instructor	SPRING	2023	CS132	230
216	TA	SPRING	2023	CS132	304
217	Instructor	SPRING	2023	CS141	111
218	TA	SPRING	2023	CS141	303
219	Instructor	SPRING	2023	CS142	121
220	TA	SPRING	2023	CS142	301
221	TA	SPRING	2023	CS231	305
223	Instructor	SPRING	2023	CS211	131
224	TA	SPRING	2023	CS211	300
225	Instructor	SPRING	2023	CS212	225
226	TA	SPRING	2023	CS212	301
227	Instructor	SPRING	2023	CS213	227
228	TA	SPRING	2023	CS213	302
229	Instructor	SPRING	2023	CS221	229
230	TA	SPRING	2023	CS221	303
231	Instructor	SPRING	2023	CS222	230
232	TA	SPRING	2023	CS222	304
233	Instructor	SPRING	2023	CS231	229
234	Instructor	SPRING	2023	CS235	230
235	TA	SPRING	2023	CS235	301
236	Instructor	SPRING	2023	CS241	131
237	TA	SPRING	2023	CS241	302
238	Instructor	SPRING	2023	CS242	111
239	TA	SPRING	2023	CS242	303
240	Instructor	SPRING	2023	CS411	121
241	TA	SPRING	2023	CS411	304
242	Instructor	SPRING	2023	CS413	221
243	TA	SPRING	2023	CS413	305
244	Instructor	SPRING	2023	CS421	225
245	TA	SPRING	2023	CS421	305
246	Instructor	SPRING	2023	CS422	227
247	TA	SPRING	2023	CS422	304
248	Instructor	SPRING	2023	CS441	228
249	TA	SPRING	2023	CS441	301
250	Instructor	SPRING	2023	CS443	221
251	TA	SPRING	2023	CS443	302
252	Instructor	SPRING	2023	CS511	121
253	TA	SPRING	2023	CS511	303
254	Instructor	SPRING	2023	CS531	230
255	TA	SPRING	2023	CS531	304
256	Instructor	SPRING	2023	CS532	229
257	TA	SPRING	2023	CS532	300
401	Instructor	FALL	2023	CS111	131
402	TA	FALL	2023	CS111	303
403	Instructor	FALL	2023	CS112	121
404	TA	FALL	2023	CS112	301
405	Instructor	FALL	2023	CS113	229
406	TA	FALL	2023	CS113	302
407	Instructor	FALL	2023	CS121	111
408	TA	FALL	2023	CS121	300
409	Instructor	FALL	2023	CS122	225
410	TA	FALL	2023	CS122	304
411	Instructor	FALL	2023	CS123	227
412	TA	FALL	2023	CS123	304
413	Instructor	FALL	2023	CS131	230
414	TA	FALL	2022	CS131	305
415	Instructor	FALL	2023	CS132	221
416	TA	FALL	2023	CS132	305
417	Instructor	FALL	2023	CS141	121
418	TA	FALL	2023	CS141	301
419	Instructor	FALL	2023	CS142	131
420	TA	FALL	2023	CS142	301
421	TA	FALL	2023	CS231	305
423	Instructor	FALL	2023	CS211	111
424	TA	FALL	2023	CS211	301
425	Instructor	FALL	2023	CS212	230
426	TA	FALL	2023	CS212	303
427	Instructor	FALL	2023	CS213	227
428	TA	FALL	2023	CS213	302
429	Instructor	FALL	2023	CS221	221
430	TA	FALL	2023	CS221	303
431	Instructor	FALL	2023	CS222	230
432	TA	FALL	2023	CS222	304
433	Instructor	FALL	2023	CS231	229
434	Instructor	FALL	2023	CS235	225
435	TA	FALL	2023	CS235	301
436	Instructor	FALL	2023	CS241	131
437	TA	FALL	2023	CS241	302
438	Instructor	FALL	2023	CS242	111
439	TA	FALL	2023	CS242	303
440	Instructor	FALL	2023	CS411	121
441	TA	FALL	2023	CS411	304
442	Instructor	FALL	2023	CS413	221
443	TA	FALL	2023	CS413	301
444	Instructor	FALL	2023	CS421	225
445	TA	FALL	2023	CS421	305
446	Instructor	FALL	2023	CS422	227
447	TA	FALL	2023	CS422	302
448	Instructor	FALL	2023	CS441	228
449	TA	FALL	2023	CS441	303
450	Instructor	FALL	2023	CS443	221
451	TA	FALL	2023	CS443	304
452	Instructor	FALL	2023	CS511	121
453	TA	FALL	2023	CS511	305
454	Instructor	FALL	2022	CS531	230
455	TA	FALL	2023	CS531	302
456	Instructor	FALL	2023	CS532	229
457	TA	FALL	2023	CS532	300
2001	Instructor	SPRING	2022	EC111	1
2002	TA	SPRING	2022	EC111	100
2003	Instructor	SPRING	2022	EC121	21
2004	TA	SPRING	2022	EC121	101
2005	Instructor	SPRING	2022	EC131	33
2006	TA	SPRING	2022	EC131	102
2007	Instructor	SPRING	2022	EC141	41
2008	TA	SPRING	2022	EC141	102
2009	Instructor	SPRING	2022	EC151	51
2010	TA	SPRING	2022	EC151	100
2011	Instructor	SPRING	2022	EC211	1
2012	TA	SPRING	2022	EC211	101
2013	Instructor	SPRING	2022	EC221	21
2014	TA	SPRING	2022	EC221	101
2015	Instructor	SPRING	2022	EC222	33
2016	TA	SPRING	2022	EC222	100
2017	Instructor	SPRING	2022	EC231	41
2018	TA	SPRING	2022	EC231	102
2019	Instructor	SPRING	2022	EC411	51
2020	TA	SPRING	2022	EC411	100
2021	Instructor	SPRING	2022	EC421	51
2022	TA	SPRING	2022	EC421	101
2023	Instructor	SPRING	2022	EC431	21
2024	TA	SPRING	2022	EC431	102
2101	Instructor	FALL	2022	EC111	21
2102	TA	FALL	2022	EC111	101
2103	Instructor	SPRING	2022	EC121	1
2104	TA	FALL	2022	EC121	100
2105	Instructor	SPRING	2022	EC131	41
2106	TA	FALL	2022	EC131	102
2107	Instructor	SPRING	2022	EC141	33
2108	TA	FALL	2022	EC141	102
2109	Instructor	SPRING	2022	EC151	51
2110	TA	FALL	2022	EC151	101
2111	Instructor	SPRING	2022	EC211	51
2112	TA	FALL	2022	EC211	100
2113	Instructor	SPRING	2022	EC221	1
2114	TA	FALL	2022	EC221	102
2115	Instructor	SPRING	2022	EC222	33
2116	TA	FALL	2022	EC222	101
2117	Instructor	SPRING	2022	EC231	41
2118	TA	FALL	2022	EC231	100
2119	Instructor	SPRING	2022	EC411	21
2120	TA	FALL	2022	EC411	101
2121	Instructor	SPRING	2022	EC421	33
2122	TA	FALL	2022	EC421	102
2123	Instructor	SPRING	2022	EC431	21
2124	TA	FALL	2022	EC431	100
2201	Instructor	SPRING	2023	EC111	1
2202	TA	SPRING	2023	EC111	100
2203	Instructor	SPRING	2023	EC121	21
2204	TA	SPRING	2023	EC121	101
2205	Instructor	SPRING	2023	EC131	33
2206	TA	SPRING	2023	EC131	102
2207	Instructor	SPRING	2023	EC141	41
2208	TA	SPRING	2023	EC141	102
2209	Instructor	SPRING	2023	EC151	51
2210	TA	SPRING	2023	EC151	100
2211	Instructor	SPRING	2023	EC211	1
2212	TA	SPRING	2023	EC211	101
2213	Instructor	SPRING	2023	EC221	21
2214	TA	SPRING	2023	EC221	101
2215	Instructor	SPRING	2023	EC222	33
2216	TA	SPRING	2023	EC222	100
2217	Instructor	SPRING	2023	EC231	41
2218	TA	SPRING	2023	EC231	102
2219	Instructor	SPRING	2023	EC411	51
2220	TA	SPRING	2023	EC411	100
2221	Instructor	SPRING	2023	EC421	51
2222	TA	SPRING	2023	EC421	101
2223	Instructor	SPRING	2023	EC431	21
2224	TA	SPRING	2023	EC431	102
2301	Instructor	FALL	2023	EC111	1
2302	TA	FALL	2023	EC111	101
2303	Instructor	SPRING	2023	EC121	1
2304	TA	FALL	2023	EC121	102
2305	Instructor	SPRING	2023	EC131	41
2306	TA	FALL	2023	EC131	102
2307	Instructor	SPRING	2023	EC141	33
2308	TA	FALL	2023	EC141	100
2309	Instructor	SPRING	2023	EC151	51
2310	TA	FALL	2023	EC151	101
2311	Instructor	SPRING	2023	EC211	51
2312	TA	FALL	2023	EC211	102
2313	Instructor	SPRING	2023	EC221	21
2314	TA	FALL	2023	EC221	100
2315	Instructor	SPRING	2023	EC222	33
2316	TA	FALL	2023	EC222	101
2317	Instructor	SPRING	2023	EC231	41
2318	TA	FALL	2023	EC231	100
2319	Instructor	SPRING	2023	EC411	21
2320	TA	FALL	2023	EC411	101
2321	Instructor	SPRING	2023	EC421	33
2322	TA	FALL	2023	EC421	102
2323	Instructor	SPRING	2023	EC431	21
2324	TA	FALL	2023	EC431	100
3001	Instructor	SPRING	2022	ME111	401
3002	TA	SPRING	2022	ME111	510
3003	Instructor	SPRING	2022	ME121	421
3004	TA	SPRING	2022	ME121	511
3005	Instructor	SPRING	2022	ME131	441
3006	TA	SPRING	2022	ME131	512
3007	Instructor	SPRING	2022	ME141	431
3008	TA	SPRING	2022	ME141	510
3009	Instructor	SPRING	2022	ME151	451
3010	TA	SPRING	2022	ME151	511
3011	Instructor	SPRING	2022	ME161	401
3012	TA	SPRING	2022	ME161	512
3013	Instructor	SPRING	2022	ME211	441
3014	TA	SPRING	2022	ME211	510
3015	Instructor	SPRING	2022	ME221	421
3016	TA	SPRING	2022	ME221	511
3017	Instructor	SPRING	2022	ME411	451
3018	TA	SPRING	2022	ME411	512
3019	Instructor	SPRING	2022	ME421	431
3020	TA	SPRING	2022	ME421	511
3021	Instructor	SPRING	2022	ME431	401
3022	TA	SPRING	2022	ME431	510
3101	Instructor	FALL	2022	ME111	421
3102	TA	FALL	2022	ME111	510
3103	Instructor	FALL	2022	ME121	401
3104	TA	FALL	2022	ME121	511
3105	Instructor	FALL	2022	ME131	431
3106	TA	FALL	2022	ME131	512
3107	Instructor	FALL	2022	ME141	441
3108	TA	FALL	2022	ME141	512
3109	Instructor	FALL	2022	ME151	451
3110	TA	FALL	2022	ME151	511
3111	Instructor	FALL	2022	ME161	401
3112	TA	FALL	2022	ME161	510
3113	Instructor	FALL	2022	ME211	441
3114	TA	FALL	2022	ME211	510
3115	Instructor	FALL	2022	ME221	451
3116	TA	FALL	2022	ME221	511
3117	Instructor	FALL	2022	ME411	421
3118	TA	FALL	2022	ME411	510
3119	Instructor	FALL	2022	ME421	431
3120	TA	FALL	2022	ME421	512
3121	Instructor	FALL	2022	ME431	401
3122	TA	FALL	2022	ME431	511
3201	Instructor	SPRING	2023	ME111	401
3202	TA	SPRING	2023	ME111	510
3203	Instructor	SPRING	2023	ME121	421
3204	TA	SPRING	2023	ME121	511
3205	Instructor	SPRING	2023	ME131	441
3206	TA	SPRING	2023	ME131	512
3207	Instructor	SPRING	2023	ME141	431
3208	TA	SPRING	2023	ME141	510
3209	Instructor	SPRING	2023	ME151	451
3210	TA	SPRING	2023	ME151	511
3211	Instructor	SPRING	2023	ME161	401
3212	TA	SPRING	2023	ME161	512
3213	Instructor	SPRING	2023	ME211	441
3214	TA	SPRING	2023	ME211	510
3215	Instructor	SPRING	2023	ME221	421
3216	TA	SPRING	2023	ME221	511
3217	Instructor	SPRING	2023	ME411	451
3218	TA	SPRING	2023	ME411	512
3219	Instructor	SPRING	2023	ME421	431
3220	TA	SPRING	2023	ME421	511
3221	Instructor	SPRING	2023	ME431	401
3222	TA	SPRING	2023	ME431	510
3301	Instructor	FALL	2023	ME111	421
3302	TA	FALL	2023	ME111	510
3303	Instructor	FALL	2023	ME121	401
3304	TA	FALL	2023	ME121	511
3305	Instructor	FALL	2023	ME131	431
3306	TA	FALL	2023	ME131	512
3307	Instructor	FALL	2023	ME141	441
3308	TA	FALL	2023	ME141	512
3309	Instructor	FALL	2023	ME151	451
3310	TA	FALL	2023	ME151	511
3311	Instructor	FALL	2023	ME161	401
3312	TA	FALL	2023	ME161	510
3313	Instructor	FALL	2023	ME211	441
3314	TA	FALL	2023	ME211	510
3315	Instructor	FALL	2023	ME221	451
3316	TA	FALL	2023	ME221	511
3317	Instructor	FALL	2023	ME411	421
3318	TA	FALL	2023	ME411	510
3319	Instructor	FALL	2023	ME421	431
3320	TA	FALL	2023	ME421	512
3321	Instructor	FALL	2023	ME431	401
3322	TA	FALL	2023	ME431	511
4001	Instructor	SPRING	2022	CE111	681
4002	TA	SPRING	2022	CE111	739
4003	Instructor	SPRING	2022	CE121	691
4004	TA	SPRING	2022	CE121	740
4005	Instructor	SPRING	2022	CE131	703
4006	TA	SPRING	2022	CE131	741
4007	Instructor	SPRING	2022	CE141	724
4008	TA	SPRING	2022	CE141	739
4009	Instructor	SPRING	2022	CE151	724
4010	TA	SPRING	2022	CE151	741
4011	Instructor	SPRING	2022	CE161	715
4012	TA	SPRING	2022	CE161	740
4013	Instructor	SPRING	2022	CE221	691
4014	TA	SPRING	2022	CE221	739
4015	Instructor	SPRING	2022	CE231	681
4016	TA	SPRING	2022	CE231	740
4017	Instructor	SPRING	2022	CE241	715
4018	TA	SPRING	2022	CE241	741
4019	Instructor	SPRING	2022	CE421	703
4020	TA	SPRING	2022	CE421	741
4021	Instructor	SPRING	2022	CE431	691
4022	TA	SPRING	2022	CE431	740
4023	Instructor	SPRING	2022	CE441	715
4024	TA	SPRING	2022	CE441	739
4100	Instructor	FALL	2022	CE121	681
4101	TA	FALL	2022	CE121	741
4102	Instructor	FALL	2022	CE131	724
4103	TA	FALL	2022	CE131	740
4105	Instructor	FALL	2022	CE141	703
4106	TA	FALL	2022	CE141	739
4107	Instructor	FALL	2022	CE151	724
4108	TA	FALL	2022	CE151	741
4109	Instructor	FALL	2022	CE161	703
4110	TA	FALL	2022	CE161	740
4111	Instructor	FALL	2022	CE221	681
4112	TA	FALL	2022	CE221	739
4113	Instructor	FALL	2022	CE231	691
4114	TA	FALL	2022	CE231	739
4115	Instructor	FALL	2022	CE241	715
4116	TA	FALL	2022	CE241	740
4117	Instructor	FALL	2022	CE421	703
4118	TA	FALL	2022	CE421	741
4119	Instructor	FALL	2022	CE431	691
4120	TA	FALL	2022	CE431	739
4121	Instructor	FALL	2022	CE441	715
4122	TA	FALL	2022	CE441	740
4201	Instructor	SPRING	2023	CE111	681
4202	TA	SPRING	2023	CE111	740
4203	Instructor	SPRING	2023	CE121	691
4204	TA	SPRING	2023	CE121	741
4205	Instructor	SPRING	2023	CE131	703
4206	TA	SPRING	2023	CE131	739
4207	Instructor	SPRING	2023	CE141	724
4208	TA	SPRING	2023	CE141	739
4209	Instructor	SPRING	2023	CE151	703
4210	TA	SPRING	202	CE151	740
4211	Instructor	SPRING	2023	CE161	691
4212	TA	SPRING	2023	CE161	741
4213	Instructor	SPRING	2023	CE221	691
4214	TA	SPRING	2023	CE221	739
4215	Instructor	SPRING	2023	CE231	681
4216	TA	SPRING	2023	CE231	741
4217	Instructor	SPRING	2023	CE241	715
4218	TA	SPRING	2023	CE241	739
4219	Instructor	SPRING	2023	CE421	724
4220	TA	SPRING	2023	CE421	740
4221	Instructor	SPRING	2023	CE431	691
4222	TA	SPRING	2023	CE431	740
4223	Instructor	SPRING	2023	CE441	715
4224	TA	SPRING	2023	CE441	739
4300	Instructor	FALL	2023	CE121	724
4301	TA	FALL	2023	CE121	739
4302	Instructor	FALL	2023	CE131	724
4303	TA	FALL	2023	CE131	739
4304	Instructor	FALL	2023	CE141	703
4305	TA	FALL	2023	CE141	740
4306	Instructor	FALL	2023	CE151	703
4307	TA	FALL	2023	CE151	740
4308	Instructor	FALL	2023	CE161	681
4309	TA	FALL	2023	CE161	741
4310	Instructor	FALL	2023	CE221	681
4311	TA	FALL	2023	CE221	741
4312	Instructor	FALL	2023	CE231	691
4313	TA	FALL	2023	CE231	741
4314	Instructor	FALL	2023	CE241	715
4315	TA	FALL	2023	CE241	739
4316	Instructor	FALL	2023	CE421	715
4317	TA	FALL	2023	CE421	739
4318	Instructor	FALL	2023	CE431	691
4319	TA	FALL	2023	CE431	740
4320	Instructor	FALL	2023	CE441	715
4321	TA	FALL	2023	CE441	740
5001	Instructor	SPRING	2022	MA111	601
5002	TA	SPRING	2022	MA111	671
5003	Instructor	SPRING	2022	MA121	621
5004	TA	SPRING	2022	MA121	672
5005	Instructor	SPRING	2022	MA122	631
5006	TA	SPRING	2022	MA122	673
5007	Instructor	SPRING	2022	MA131	641
5008	TA	SPRING	2022	MA131	671
5009	Instructor	SPRING	2022	MA141	651
5010	TA	SPRING	2022	MA141	672
5011	Instructor	SPRING	2022	MA142	601
5012	TA	SPRING	2022	MA142	673
5013	Instructor	SPRING	2022	MA211	631
5014	TA	SPRING	2022	MA211	671
5015	Instructor	SPRING	2022	MA221	621
5016	TA	SPRING	2022	MA221	672
5017	Instructor	SPRING	2022	MA231	641
5018	TA	SPRING	2022	MA231	673
5019	Instructor	SPRING	2022	MA241	651
5020	TA	SPRING	2022	MA241	673
5021	Instructor	SPRING	2022	MA411	601
5022	TA	SPRING	2022	MA411	672
5023	Instructor	SPRING	2022	MA421	631
5024	TA	SPRING	2022	MA421	671
5025	Instructor	SPRING	2022	MA431	621
5026	TA	SPRING	2022	MA431	673
5027	Instructor	SPRING	2022	MA441	601
5028	TA	SPRING	2022	MA441	672
5101	Instructor	FALL	2022	MA111	621
5102	TA	FALL	2022	MA111	671
5103	Instructor	FALL	2022	MA121	601
5104	TA	FALL	2022	MA121	672
5105	Instructor	FALL	2022	MA122	631
5106	TA	FALL	2022	MA122	673
5107	Instructor	FALL	2022	MA131	641
5108	TA	FALL	2022	MA131	672
5109	Instructor	FALL	2022	MA141	651
5110	TA	FALL	2022	MA141	671
5111	Instructor	FALL	2022	MA142	621
5112	TA	FALL	2022	MA142	673
5113	Instructor	FALL	2022	MA211	631
5114	TA	FALL	2022	MA211	671
5115	Instructor	FALL	2022	MA221	641
5116	TA	FALL	2022	MA221	672
5117	Instructor	FALL	2022	MA231	651
5118	TA	FALL	2022	MA231	673
5119	Instructor	FALL	2022	MA241	651
5120	TA	FALL	2022	MA241	671
5121	Instructor	FALL	2022	MA411	631
5122	TA	FALL	2022	MA411	672
5123	Instructor	FALL	2022	MA421	641
5124	TA	FALL	2022	MA421	673
5125	Instructor	FALL	2022	MA431	621
5126	TA	FALL	2022	MA431	672
5127	Instructor	FALL	2022	MA441	601
5128	TA	FALL	2022	MA441	671
5201	Instructor	SPRING	2023	MA111	621
5202	TA	SPRING	2023	MA111	672
5203	Instructor	SPRING	2023	MA121	601
5204	TA	SPRING	2023	MA121	671
5205	Instructor	SPRING	2023	MA122	631
5206	TA	SPRING	2023	MA122	671
5207	Instructor	SPRING	2023	MA131	641
5208	TA	SPRING	2023	MA131	673
5209	Instructor	SPRING	2023	MA141	651
5210	TA	SPRING	2023	MA141	672
5211	Instructor	SPRING	2023	MA142	641
5212	TA	SPRING	2023	MA142	671
5213	Instructor	SPRING	2023	MA211	631
5214	TA	SPRING	2023	MA211	671
5215	Instructor	SPRING	2023	MA221	621
5216	TA	SPRING	2023	MA221	672
5217	Instructor	SPRING	2023	MA231	651
5218	TA	SPRING	2023	MA231	673
5219	Instructor	SPRING	2023	MA241	641
5220	TA	SPRING	2023	MA241	673
5221	Instructor	SPRING	2023	MA411	601
5222	TA	SPRING	2023	MA411	672
5223	Instructor	SPRING	2023	MA421	631
5224	TA	SPRING	2023	MA421	672
5225	Instructor	SPRING	2023	MA431	621
5226	TA	SPRING	2023	MA431	671
5227	Instructor	SPRING	2023	MA441	601
5228	TA	SPRING	2023	MA441	671
5301	Instructor	FALL	2023	MA111	651
5302	TA	FALL	2023	MA111	671
5303	Instructor	FALL	2023	MA121	601
5304	TA	FALL	2023	MA121	672
5305	Instructor	FALL	2023	MA122	631
5306	TA	FALL	2023	MA122	673
5307	Instructor	FALL	2023	MA131	641
5308	TA	FALL	2023	MA131	672
5309	Instructor	FALL	2023	MA141	651
5310	TA	FALL	2023	MA141	671
5311	Instructor	FALL	2023	MA142	621
5312	TA	FALL	2023	MA142	673
5313	Instructor	FALL	2023	MA211	631
5314	TA	FALL	2023	MA211	672
5315	Instructor	FALL	2023	MA221	641
5316	TA	FALL	2023	MA221	671
5317	Instructor	FALL	2023	MA231	621
5318	TA	FALL	2023	MA231	673
5319	Instructor	FALL	2023	MA241	651
5320	TA	FALL	2023	MA241	671
5321	Instructor	FALL	2023	MA411	631
5322	TA	FALL	2023	MA411	672
5323	Instructor	FALL	2023	MA421	641
5324	TA	FALL	2023	MA421	673
5325	Instructor	FALL	2023	MA431	621
5326	TA	FALL	2023	MA431	672
5327	Instructor	FALL	2023	MA441	601
5328	TA	FALL	2023	MA441	671
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	initial-setup	database-schema.yml	2024-03-24 20:05:31.729901	1	EXECUTED	9:8d38e38652aea83e3bde74196750fa10	createTable tableName=Course		\N	4.26.0	\N	\N	1332331638
2	initial-setup	database-schema.yml	2024-03-24 20:05:31.753143	2	EXECUTED	9:d67a7772bd8ec8566d52a8ac0bd563f2	createTable tableName=Department		\N	4.26.0	\N	\N	1332331638
3	initial-setup	database-schema.yml	2024-03-24 20:05:31.774663	3	EXECUTED	9:ff4bd0f73fbf5bb302e33ffa75eb6a77	createTable tableName=Exam		\N	4.26.0	\N	\N	1332331638
4	initial-setup	database-schema.yml	2024-03-24 20:05:31.793687	4	EXECUTED	9:5ac3f2ee602a1c88f88e306d51b6c40d	createTable tableName=Faculty		\N	4.26.0	\N	\N	1332331638
5	initial-setup	database-schema.yml	2024-03-24 20:05:31.812203	5	EXECUTED	9:73fc4bae5de14b6e049b8eb0b8071952	createTable tableName=Prerequisite		\N	4.26.0	\N	\N	1332331638
6	initial-setup	database-schema.yml	2024-03-24 20:05:31.83323	6	EXECUTED	9:0f02ef3e8afbb87517d37eb3f93a01e8	createTable tableName=Program		\N	4.26.0	\N	\N	1332331638
7	initial-setup	database-schema.yml	2024-03-24 20:05:31.84985	7	EXECUTED	9:8b9c5897525696620f8d06185ea7e9df	createTable tableName=Registration		\N	4.26.0	\N	\N	1332331638
8	initial-setup	database-schema.yml	2024-03-24 20:05:31.867501	8	EXECUTED	9:c38593e7e343956fab0e204fedb7c19b	createTable tableName=Specification		\N	4.26.0	\N	\N	1332331638
9	initial-setup	database-schema.yml	2024-03-24 20:05:31.884746	9	EXECUTED	9:571e04bd28a04c806983aeb939f2c51b	createTable tableName=Student		\N	4.26.0	\N	\N	1332331638
10	initial-setup	database-schema.yml	2024-03-24 20:05:31.902338	10	EXECUTED	9:fa5915345a01e24deb8b885bc647d528	createTable tableName=Teaching		\N	4.26.0	\N	\N	1332331638
11	initial-setup	database-schema.yml	2024-03-24 20:05:31.968532	11	EXECUTED	9:7c7fc5f9eb9c83de215884875a6b45a9	loadData tableName=Course		\N	4.26.0	\N	\N	1332331638
12	initial-setup	database-schema.yml	2024-03-24 20:05:31.981084	12	EXECUTED	9:e9c3748e37cc45490521b3644c27072b	loadData tableName=Department		\N	4.26.0	\N	\N	1332331638
13	initial-setup	database-schema.yml	2024-03-24 20:05:32.058303	13	EXECUTED	9:0c280465f86a5d9e39a888e1203edfab	loadData tableName=Exam		\N	4.26.0	\N	\N	1332331638
14	initial-setup	database-schema.yml	2024-03-24 20:05:32.102936	14	EXECUTED	9:50473ec63e340e6159836ecb9e02a062	loadData tableName=Faculty		\N	4.26.0	\N	\N	1332331638
15	initial-setup	database-schema.yml	2024-03-24 20:05:32.122926	15	EXECUTED	9:e3391b7d0891fb1ca2269707e4414848	loadData tableName=Prerequisite		\N	4.26.0	\N	\N	1332331638
16	initial-setup	database-schema.yml	2024-03-24 20:05:32.144753	16	EXECUTED	9:97ad14ca7f6a165886763d966826f4f6	loadData tableName=Program		\N	4.26.0	\N	\N	1332331638
17	initial-setup	database-schema.yml	2024-03-24 20:05:32.186582	17	EXECUTED	9:996268299ecc654122e097a596dcefb2	loadData tableName=Registration		\N	4.26.0	\N	\N	1332331638
18	initial-setup	database-schema.yml	2024-03-24 20:05:32.216268	18	EXECUTED	9:a22371818a9e38a19d1d908fdf6f265c	loadData tableName=Specification		\N	4.26.0	\N	\N	1332331638
19	initial-setup	database-schema.yml	2024-03-24 20:05:32.241012	19	EXECUTED	9:10b50fc0184d5893d509d3abc43cc067	loadData tableName=Student		\N	4.26.0	\N	\N	1332331638
20	initial-setup	database-schema.yml	2024-03-24 20:05:32.359499	20	EXECUTED	9:7d04fc18740b3938f3054d4749d45d58	loadData tableName=Teaching		\N	4.26.0	\N	\N	1332331638
21	initial-setup	database-schema.yml	2024-03-24 20:05:32.374358	21	EXECUTED	9:7f9815633549c83ab7eab37f31e93927	createIndex indexName=exam_course_id, tableName=Exam		\N	4.26.0	\N	\N	1332331638
22	initial-setup	database-schema.yml	2024-03-24 20:05:32.387271	22	EXECUTED	9:8b60655023f6617e13b19086eceb1ca2	createIndex indexName=prerequisite_course_id, tableName=Prerequisite		\N	4.26.0	\N	\N	1332331638
23	initial-setup	database-schema.yml	2024-03-24 20:05:32.40285	23	EXECUTED	9:3bda0747c745d43e27b36ef4b51bd8ed	createIndex indexName=registration_course_id, tableName=Registration		\N	4.26.0	\N	\N	1332331638
24	initial-setup	database-schema.yml	2024-03-24 20:05:32.415021	24	EXECUTED	9:d04c4d8aebcfa8ded7e93c814b5b89f1	createIndex indexName=specification_course_id, tableName=Specification		\N	4.26.0	\N	\N	1332331638
25	initial-setup	database-schema.yml	2024-03-24 20:05:32.432269	25	EXECUTED	9:52056ebc40791e2d45ac9802471877e9	createIndex indexName=teaching_course_id, tableName=Teaching		\N	4.26.0	\N	\N	1332331638
26	initial-setup	database-schema.yml	2024-03-24 20:05:32.445206	26	EXECUTED	9:e8da93c0617f57c6fd7fb5fae75f6adf	createIndex indexName=course_department_id, tableName=Course		\N	4.26.0	\N	\N	1332331638
27	initial-setup	database-schema.yml	2024-03-24 20:05:32.462326	27	EXECUTED	9:edf10f212af61e56b77aa1f4e22079c1	createIndex indexName=faculty_department_id, tableName=Faculty		\N	4.26.0	\N	\N	1332331638
28	initial-setup	database-schema.yml	2024-03-24 20:05:32.475979	28	EXECUTED	9:772a69233866d744186b4d9e104d1b0d	createIndex indexName=program_department_id, tableName=Program		\N	4.26.0	\N	\N	1332331638
29	initial-setup	database-schema.yml	2024-03-24 20:05:32.491814	29	EXECUTED	9:7d7362a23549b655db1f63ceffb307ea	createIndex indexName=teaching_faculty_id, tableName=Teaching		\N	4.26.0	\N	\N	1332331638
30	initial-setup	database-schema.yml	2024-03-24 20:05:32.505953	30	EXECUTED	9:1ad9f85b2713377e2ae417b1cf12902c	createIndex indexName=prerequisite_id, tableName=Prerequisite		\N	4.26.0	\N	\N	1332331638
31	initial-setup	database-schema.yml	2024-03-24 20:05:32.520125	31	EXECUTED	9:a83c90ed50a0f831669600f8f5a26e02	createIndex indexName=specification_program_id, tableName=Specification		\N	4.26.0	\N	\N	1332331638
32	initial-setup	database-schema.yml	2024-03-24 20:05:32.535547	32	EXECUTED	9:8ed49c5478f7ab73d473255a0dd19154	createIndex indexName=exam_student_id, tableName=Exam		\N	4.26.0	\N	\N	1332331638
33	initial-setup	database-schema.yml	2024-03-24 20:05:32.549456	33	EXECUTED	9:a3f0c67250c88fef1f6d3b6da5dc0baf	createIndex indexName=registration_student_id, tableName=Registration		\N	4.26.0	\N	\N	1332331638
34	initial-setup	database-schema.yml	2024-03-24 20:05:32.567382	34	EXECUTED	9:3d640d61f13eb2bbdd9618d1160521a4	addForeignKeyConstraint baseTableName=Course, constraintName=Course_ibfk_1, referencedTableName=Department		\N	4.26.0	\N	\N	1332331638
35	initial-setup	database-schema.yml	2024-03-24 20:05:32.57923	35	EXECUTED	9:d5684925f707f3a47fd296a127bab8db	addForeignKeyConstraint baseTableName=Exam, constraintName=Exam_ibfk_1, referencedTableName=Student		\N	4.26.0	\N	\N	1332331638
36	initial-setup	database-schema.yml	2024-03-24 20:05:32.59596	36	EXECUTED	9:c463c5c4633f2f1084508bc039c36cd7	addForeignKeyConstraint baseTableName=Exam, constraintName=Exam_ibfk_2, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
37	initial-setup	database-schema.yml	2024-03-24 20:05:32.606958	37	EXECUTED	9:94ebff2e63a5ced2d59f2dbabf780fbe	addForeignKeyConstraint baseTableName=Faculty, constraintName=Faculty_ibfk_1, referencedTableName=Department		\N	4.26.0	\N	\N	1332331638
38	initial-setup	database-schema.yml	2024-03-24 20:05:32.616887	38	EXECUTED	9:6c3825736b56aac89824eed3e5e6511d	addForeignKeyConstraint baseTableName=Prerequisite, constraintName=Prerequisite_ibfk_1, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
39	initial-setup	database-schema.yml	2024-03-24 20:05:32.630461	39	EXECUTED	9:a9bc21808e0137e49eee63aef581ccdd	addForeignKeyConstraint baseTableName=Prerequisite, constraintName=Prerequisite_ibfk_2, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
40	initial-setup	database-schema.yml	2024-03-24 20:05:32.641798	40	EXECUTED	9:43c5fc6419c38e838fc15b4928fa627c	addForeignKeyConstraint baseTableName=Program, constraintName=Program_ibfk_1, referencedTableName=Department		\N	4.26.0	\N	\N	1332331638
41	initial-setup	database-schema.yml	2024-03-24 20:05:32.653379	41	EXECUTED	9:d82e127a7f71dd65764dde5e9e1c4781	addForeignKeyConstraint baseTableName=Registration, constraintName=Registration_ibfk_1, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
42	initial-setup	database-schema.yml	2024-03-24 20:05:32.664793	42	EXECUTED	9:4a8e25ee117dfd946a758b26fcda79df	addForeignKeyConstraint baseTableName=Registration, constraintName=Registration_ibfk_2, referencedTableName=Student		\N	4.26.0	\N	\N	1332331638
43	initial-setup	database-schema.yml	2024-03-24 20:05:32.675181	43	EXECUTED	9:2d121d14aaf3821d092e4396e06bb096	addForeignKeyConstraint baseTableName=Specification, constraintName=Specification_ibfk_1, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
44	initial-setup	database-schema.yml	2024-03-24 20:05:32.685256	44	EXECUTED	9:5d3c3a902c0329c4648bf95f66c82c2f	addForeignKeyConstraint baseTableName=Specification, constraintName=Specification_ibfk_2, referencedTableName=Program		\N	4.26.0	\N	\N	1332331638
45	initial-setup	database-schema.yml	2024-03-24 20:05:32.697784	45	EXECUTED	9:a05c24d39f12ae393a18d0e451010264	addForeignKeyConstraint baseTableName=Teaching, constraintName=Teaching_ibfk_1, referencedTableName=Course		\N	4.26.0	\N	\N	1332331638
46	initial-setup	database-schema.yml	2024-03-24 20:05:32.710055	46	EXECUTED	9:9a44b7d546fb634673765c7e7492994b	addForeignKeyConstraint baseTableName=Teaching, constraintName=Teaching_ibfk_2, referencedTableName=Faculty		\N	4.26.0	\N	\N	1332331638
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Name: Course Course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Course"
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (id);


--
-- Name: Department Department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (id);


--
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY (id);


--
-- Name: Faculty Faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Faculty"
    ADD CONSTRAINT "Faculty_pkey" PRIMARY KEY (id);


--
-- Name: Prerequisite Prerequisite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prerequisite"
    ADD CONSTRAINT "Prerequisite_pkey" PRIMARY KEY (id);


--
-- Name: Program Program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Program"
    ADD CONSTRAINT "Program_pkey" PRIMARY KEY (id);


--
-- Name: Registration Registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration"
    ADD CONSTRAINT "Registration_pkey" PRIMARY KEY (id);


--
-- Name: Specification Specification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specification"
    ADD CONSTRAINT "Specification_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Teaching Teaching_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teaching"
    ADD CONSTRAINT "Teaching_pkey" PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: course_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX course_department_id ON public."Course" USING btree (department_id);


--
-- Name: exam_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_course_id ON public."Exam" USING btree (course_id);


--
-- Name: exam_student_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_student_id ON public."Exam" USING btree (student_id);


--
-- Name: faculty_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX faculty_department_id ON public."Faculty" USING btree (department_id);


--
-- Name: prerequisite_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prerequisite_course_id ON public."Prerequisite" USING btree (course_id);


--
-- Name: prerequisite_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prerequisite_id ON public."Prerequisite" USING btree (prerequisite_id);


--
-- Name: program_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX program_department_id ON public."Program" USING btree (department_id);


--
-- Name: registration_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_course_id ON public."Registration" USING btree (course_id);


--
-- Name: registration_student_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_student_id ON public."Registration" USING btree (student_id);


--
-- Name: specification_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX specification_course_id ON public."Specification" USING btree (course_id);


--
-- Name: specification_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX specification_program_id ON public."Specification" USING btree (program_id);


--
-- Name: teaching_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teaching_course_id ON public."Teaching" USING btree (course_id);


--
-- Name: teaching_faculty_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teaching_faculty_id ON public."Teaching" USING btree (faculty_id);


--
-- Name: Course Course_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Course"
    ADD CONSTRAINT "Course_ibfk_1" FOREIGN KEY (department_id) REFERENCES public."Department"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Exam Exam_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_ibfk_1" FOREIGN KEY (student_id) REFERENCES public."Student"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Exam Exam_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_ibfk_2" FOREIGN KEY (course_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Faculty Faculty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Faculty"
    ADD CONSTRAINT "Faculty_ibfk_1" FOREIGN KEY (department_id) REFERENCES public."Department"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Prerequisite Prerequisite_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prerequisite"
    ADD CONSTRAINT "Prerequisite_ibfk_1" FOREIGN KEY (course_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Prerequisite Prerequisite_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prerequisite"
    ADD CONSTRAINT "Prerequisite_ibfk_2" FOREIGN KEY (prerequisite_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Program Program_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Program"
    ADD CONSTRAINT "Program_ibfk_1" FOREIGN KEY (department_id) REFERENCES public."Department"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Registration Registration_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration"
    ADD CONSTRAINT "Registration_ibfk_1" FOREIGN KEY (course_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Registration Registration_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration"
    ADD CONSTRAINT "Registration_ibfk_2" FOREIGN KEY (student_id) REFERENCES public."Student"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Specification Specification_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specification"
    ADD CONSTRAINT "Specification_ibfk_1" FOREIGN KEY (course_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Specification Specification_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specification"
    ADD CONSTRAINT "Specification_ibfk_2" FOREIGN KEY (program_id) REFERENCES public."Program"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Teaching Teaching_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teaching"
    ADD CONSTRAINT "Teaching_ibfk_1" FOREIGN KEY (course_id) REFERENCES public."Course"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: Teaching Teaching_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Teaching"
    ADD CONSTRAINT "Teaching_ibfk_2" FOREIGN KEY (faculty_id) REFERENCES public."Faculty"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

