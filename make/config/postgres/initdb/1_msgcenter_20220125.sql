\c msgcenter

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-1.pgdg16.04+1)

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

--
-- Name: msgcenter; Type: SCHEMA; Schema: -; Owner: insightalarm
--

CREATE SCHEMA msgcenter;


ALTER SCHEMA msgcenter OWNER TO insightalarm;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: c_andon_alarm; Type: TABLE; Schema: msgcenter; Owner: insightalarm
--

CREATE TABLE msgcenter.c_andon_alarm (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    biz_id character varying(128) DEFAULT NULL::character varying,
    state_code integer DEFAULT 1 NOT NULL,
    led_name character varying(128) DEFAULT NULL::character varying,
    led_id character varying(128) DEFAULT NULL::character varying,
    zone_name character varying(128) DEFAULT NULL::character varying,
    zone_id character varying(128) DEFAULT NULL::character varying,
    button_name character varying(128) DEFAULT NULL::character varying,
    button_id character varying(128) DEFAULT NULL::character varying,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    andon_type character varying(128) DEFAULT NULL::character varying,
    remark1 character varying(128) DEFAULT NULL::character varying,
    remark2 character varying(128) DEFAULT NULL::character varying,
    remark3 character varying(128) DEFAULT NULL::character varying,
    remark4 character varying(128) DEFAULT NULL::character varying,
    remark5 character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE msgcenter.c_andon_alarm OWNER TO insightalarm;

--
-- Name: c_andon_alarm_id_seq; Type: SEQUENCE; Schema: msgcenter; Owner: insightalarm
--

CREATE SEQUENCE msgcenter.c_andon_alarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE msgcenter.c_andon_alarm_id_seq OWNER TO insightalarm;

--
-- Name: c_andon_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: msgcenter; Owner: insightalarm
--

ALTER SEQUENCE msgcenter.c_andon_alarm_id_seq OWNED BY msgcenter.c_andon_alarm.id;


--
-- Name: c_andon_alarm id; Type: DEFAULT; Schema: msgcenter; Owner: insightalarm
--

ALTER TABLE ONLY msgcenter.c_andon_alarm ALTER COLUMN id SET DEFAULT nextval('msgcenter.c_andon_alarm_id_seq'::regclass);


--
-- Name: c_andon_alarm c_andon_alarm_pkey; Type: CONSTRAINT; Schema: msgcenter; Owner: insightalarm
--

ALTER TABLE ONLY msgcenter.c_andon_alarm
    ADD CONSTRAINT c_andon_alarm_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

