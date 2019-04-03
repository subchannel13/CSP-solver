--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-04-03 15:11:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16393)
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16395)
-- Name: ACO_params; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ACO_params" (
    "problemId" bigint NOT NULL,
    "populationSize" integer NOT NULL,
    beta real NOT NULL,
    gamma integer NOT NULL,
    ro real NOT NULL,
    "maxIterations" integer NOT NULL
);


ALTER TABLE dbo."ACO_params" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: GA_params; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."GA_params" (
    "problemId" bigint NOT NULL,
    "populationSize" integer NOT NULL,
    "tournamentSize" integer NOT NULL,
    "maxGenerations" integer NOT NULL,
    "crossoverRatio" real NOT NULL,
    "mutationRatio" real NOT NULL
);


ALTER TABLE dbo."GA_params" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16401)
-- Name: PatternOrders; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."PatternOrders" (
    "patternId" bigint NOT NULL,
    "orderId" integer NOT NULL,
    quantity integer NOT NULL,
    "cachedLength" integer NOT NULL
);


ALTER TABLE dbo."PatternOrders" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16435)
-- Name: problem_problemid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.problem_problemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.problem_problemid_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: Problem; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Problem" (
    "problemId" bigint DEFAULT nextval('dbo.problem_problemid_seq'::regclass) NOT NULL,
    status integer NOT NULL,
    material integer NOT NULL,
    algorithm integer NOT NULL,
    "dateAssinged" date NOT NULL,
    "dateSolved" date NOT NULL,
    note text NOT NULL,
    "cutWidth" integer NOT NULL
);


ALTER TABLE dbo."Problem" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16412)
-- Name: ProblemOrders; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ProblemOrders" (
    "problemId" bigint NOT NULL,
    "pieceLength" integer NOT NULL,
    quantity integer NOT NULL,
    "orderId" integer NOT NULL
);


ALTER TABLE dbo."ProblemOrders" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16415)
-- Name: ProblemStatus; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ProblemStatus" (
    "statusId" integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE dbo."ProblemStatus" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16450)
-- Name: solutionpatterns_problemid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.solutionpatterns_problemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.solutionpatterns_problemid_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16421)
-- Name: SolutionPatterns; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."SolutionPatterns" (
    "problemId" bigint DEFAULT nextval('dbo.solutionpatterns_problemid_seq'::regclass) NOT NULL,
    "solutionId" integer NOT NULL,
    "patternId" bigint NOT NULL,
    quantity integer NOT NULL,
    stock integer NOT NULL,
    "trimLength" integer NOT NULL
);


ALTER TABLE dbo."SolutionPatterns" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16456)
-- Name: stocktype_typeid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.stocktype_typeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.stocktype_typeid_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16429)
-- Name: StockType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."StockType" (
    "typeId" integer DEFAULT nextval('dbo.stocktype_typeid_seq'::regclass) NOT NULL,
    "typeName" text NOT NULL,
    width integer NOT NULL,
    "problemSpecific" boolean NOT NULL
);


ALTER TABLE dbo."StockType" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16453)
-- Name: stocks_stockid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.stocks_stockid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.stocks_stockid_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16426)
-- Name: Stocks; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Stocks" (
    "materialType" integer NOT NULL,
    "materialLength" integer NOT NULL,
    quantity integer NOT NULL,
    "stockId" integer DEFAULT nextval('dbo.stocks_stockid_seq'::regclass) NOT NULL
);


ALTER TABLE dbo."Stocks" OWNER TO postgres;

--
-- TOC entry 2876 (class 0 OID 16395)
-- Dependencies: 198
-- Data for Name: ACO_params; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ACO_params" ("problemId", "populationSize", beta, gamma, ro, "maxIterations") FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 16398)
-- Dependencies: 199
-- Data for Name: GA_params; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."GA_params" ("problemId", "populationSize", "tournamentSize", "maxGenerations", "crossoverRatio", "mutationRatio") FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 16401)
-- Dependencies: 200
-- Data for Name: PatternOrders; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."PatternOrders" ("patternId", "orderId", quantity, "cachedLength") FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 16404)
-- Dependencies: 201
-- Data for Name: Problem; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Problem" ("problemId", status, material, algorithm, "dateAssinged", "dateSolved", note, "cutWidth") FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 16412)
-- Dependencies: 202
-- Data for Name: ProblemOrders; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ProblemOrders" ("problemId", "pieceLength", quantity, "orderId") FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 16415)
-- Dependencies: 203
-- Data for Name: ProblemStatus; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ProblemStatus" ("statusId", description) FROM stdin;
1	Saved, not solved
2	Waiting
3	Solving
4	Unsolvable
5	Solved, not implemented
6	Implemented
7	Done or canceled
\.


--
-- TOC entry 2882 (class 0 OID 16421)
-- Dependencies: 204
-- Data for Name: SolutionPatterns; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."SolutionPatterns" ("problemId", "solutionId", "patternId", quantity, stock, "trimLength") FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 16429)
-- Dependencies: 206
-- Data for Name: StockType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."StockType" ("typeId", "typeName", width, "problemSpecific") FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 16426)
-- Dependencies: 205
-- Data for Name: Stocks; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Stocks" ("materialType", "materialLength", quantity, "stockId") FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 207
-- Name: problem_problemid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.problem_problemid_seq', 1, false);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 208
-- Name: solutionpatterns_problemid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.solutionpatterns_problemid_seq', 1, false);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 209
-- Name: stocks_stockid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.stocks_stockid_seq', 1, false);


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 210
-- Name: stocktype_typeid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.stocktype_typeid_seq', 1, false);


--
-- TOC entry 2733 (class 2606 OID 16460)
-- Name: ACO_params ACO_params_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ACO_params"
    ADD CONSTRAINT "ACO_params_pkey" PRIMARY KEY ("problemId");


--
-- TOC entry 2735 (class 2606 OID 16462)
-- Name: GA_params GA_params_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."GA_params"
    ADD CONSTRAINT "GA_params_pkey" PRIMARY KEY ("problemId");


--
-- TOC entry 2737 (class 2606 OID 16464)
-- Name: PatternOrders PatternOrders_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."PatternOrders"
    ADD CONSTRAINT "PatternOrders_pkey" PRIMARY KEY ("patternId", "orderId");


--
-- TOC entry 2741 (class 2606 OID 16466)
-- Name: ProblemOrders ProblemOrders_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ProblemOrders"
    ADD CONSTRAINT "ProblemOrders_pkey" PRIMARY KEY ("problemId", "orderId");


--
-- TOC entry 2743 (class 2606 OID 16468)
-- Name: ProblemStatus ProblemStatus_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ProblemStatus"
    ADD CONSTRAINT "ProblemStatus_pkey" PRIMARY KEY ("statusId");


--
-- TOC entry 2739 (class 2606 OID 16411)
-- Name: Problem Problem_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Problem"
    ADD CONSTRAINT "Problem_pkey" PRIMARY KEY ("problemId");


--
-- TOC entry 2745 (class 2606 OID 16425)
-- Name: SolutionPatterns SolutionPatterns_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."SolutionPatterns"
    ADD CONSTRAINT "SolutionPatterns_pkey" PRIMARY KEY ("patternId");


--
-- TOC entry 2749 (class 2606 OID 16472)
-- Name: StockType StockType_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."StockType"
    ADD CONSTRAINT "StockType_pkey" PRIMARY KEY ("typeId");


--
-- TOC entry 2747 (class 2606 OID 16470)
-- Name: Stocks Stocks_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Stocks"
    ADD CONSTRAINT "Stocks_pkey" PRIMARY KEY ("materialType", "stockId");


--
-- TOC entry 2750 (class 2606 OID 16478)
-- Name: ACO_params ACO_params_problemId_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ACO_params"
    ADD CONSTRAINT "ACO_params_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES dbo."Problem"("problemId") ON DELETE CASCADE;


--
-- TOC entry 2751 (class 2606 OID 16483)
-- Name: GA_params GA_params_problemId_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."GA_params"
    ADD CONSTRAINT "GA_params_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES dbo."Problem"("problemId") ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 16493)
-- Name: PatternOrders PatternOrders_patternId_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."PatternOrders"
    ADD CONSTRAINT "PatternOrders_patternId_fkey" FOREIGN KEY ("patternId") REFERENCES dbo."SolutionPatterns"("patternId");


--
-- TOC entry 2753 (class 2606 OID 16498)
-- Name: ProblemOrders ProblemOrders_problemId_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ProblemOrders"
    ADD CONSTRAINT "ProblemOrders_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES dbo."Problem"("problemId") ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 16508)
-- Name: Stocks Stocks_materialType_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Stocks"
    ADD CONSTRAINT "Stocks_materialType_fkey" FOREIGN KEY ("materialType") REFERENCES dbo."StockType"("typeId");


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA dbo; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA dbo TO csp_solver;


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE "ACO_params"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."ACO_params" TO csp_solver;


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE "GA_params"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."GA_params" TO csp_solver;


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "PatternOrders"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."PatternOrders" TO csp_solver;


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "Problem"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."Problem" TO csp_solver;


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "ProblemOrders"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."ProblemOrders" TO csp_solver;


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "ProblemStatus"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."ProblemStatus" TO csp_solver;


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "SolutionPatterns"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."SolutionPatterns" TO csp_solver;


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "StockType"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."StockType" TO csp_solver;


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "Stocks"; Type: ACL; Schema: dbo; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE dbo."Stocks" TO csp_solver;


-- Completed on 2019-04-03 15:11:16

--
-- PostgreSQL database dump complete
--

