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
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ad_archive_report_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_archive_report_pages (
    id bigint NOT NULL,
    page_id bigint,
    page_name character varying,
    disclaimer character varying,
    amount_spent integer,
    ads_count integer,
    ad_archive_report_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ads_this_tranche integer,
    spend_this_tranche integer,
    amount_spent_since_start_date integer
);


--
-- Name: ad_archive_report_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_archive_report_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_archive_report_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_archive_report_pages_id_seq OWNED BY public.ad_archive_report_pages.id;


--
-- Name: ad_archive_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_archive_reports (
    id bigint NOT NULL,
    scrape_date timestamp without time zone,
    s3_url text,
    kind text,
    loaded boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ad_archive_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_archive_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_archive_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_archive_reports_id_seq OWNED BY public.ad_archive_reports.id;


--
-- Name: ad_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_texts (
    id bigint NOT NULL,
    text text,
    text_hash character varying,
    vec text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    search_text text,
    tsv tsvector
);


--
-- Name: ad_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_texts_id_seq OWNED BY public.ad_texts.id;


--
-- Name: ad_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_topics (
    id bigint NOT NULL,
    topic_id integer,
    proportion double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ad_text_id integer
);


--
-- Name: ad_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_topics_id_seq OWNED BY public.ad_topics.id;


--
-- Name: ads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ads (
    ad_creative_body text,
    ad_delivery_start_time timestamp(4) with time zone,
    ad_delivery_stop_time timestamp(4) with time zone,
    ad_creation_time timestamp(4) with time zone,
    page_id bigint,
    currency character varying(255),
    ad_snapshot_url character varying,
    is_active boolean,
    ad_sponsor_id integer,
    archive_id bigint NOT NULL,
    nyu_id bigint NOT NULL,
    ad_creative_link_caption character varying,
    ad_creative_link_description character varying,
    ad_creative_link_title character varying,
    ad_category_id integer,
    ad_id bigint,
    country_code character varying,
    most_recent boolean,
    funding_entity character varying
);


--
-- Name: ads_nyu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ads_nyu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ads_nyu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ads_nyu_id_seq OWNED BY public.ads.nyu_id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: big_spenders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.big_spenders (
    id bigint NOT NULL,
    ad_archive_report_id integer,
    previous_ad_archive_report_id integer,
    ad_archive_report_page_id integer,
    page_id bigint,
    spend_amount integer,
    duration_days integer,
    is_new boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: big_spenders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.big_spenders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: big_spenders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.big_spenders_id_seq OWNED BY public.big_spenders.id;


--
-- Name: demo_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo_groups (
    age character varying(255),
    gender character varying(255),
    id integer NOT NULL
);


--
-- Name: demo_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_groups_id_seq OWNED BY public.demo_groups.id;


--
-- Name: demo_impressions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo_impressions (
    ad_archive_id bigint,
    demo_id integer,
    min_impressions integer,
    max_impressions integer,
    min_spend integer,
    max_spend integer,
    crawl_date date,
    most_recent boolean,
    nyu_id bigint NOT NULL
);


--
-- Name: demo_impressions_nyu_id1_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_impressions_nyu_id1_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_impressions_nyu_id1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_impressions_nyu_id1_seq OWNED BY public.demo_impressions.nyu_id;


--
-- Name: fbpac_ads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fbpac_ads (
    id text NOT NULL,
    html text NOT NULL,
    political integer NOT NULL,
    not_political integer NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    thumbnail text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    lang text NOT NULL,
    images text[] NOT NULL,
    impressions integer DEFAULT 1 NOT NULL,
    political_probability double precision DEFAULT 0 NOT NULL,
    targeting text,
    suppressed boolean DEFAULT false NOT NULL,
    targets jsonb DEFAULT '[]'::jsonb,
    advertiser text,
    entities jsonb DEFAULT '[]'::jsonb,
    page text,
    lower_page character varying,
    targetings text[],
    paid_for_by text,
    targetedness integer,
    listbuilding_fundraising_proba numeric(9,6)
);


--
-- Name: impressions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.impressions (
    ad_archive_id bigint,
    crawl_date date,
    min_impressions integer,
    min_spend integer,
    max_impressions integer,
    max_spend integer,
    most_recent boolean,
    nyu_id bigint NOT NULL
);


--
-- Name: impressions_nyu_id1_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.impressions_nyu_id1_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: impressions_nyu_id1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.impressions_nyu_id1_seq OWNED BY public.impressions.nyu_id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    page_name character varying(255),
    page_id bigint,
    federal_candidate boolean,
    url character varying,
    is_deleted boolean
);


--
-- Name: payers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payers (
    id bigint NOT NULL,
    name character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: payers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payers_id_seq OWNED BY public.payers.id;


--
-- Name: region_impressions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region_impressions (
    ad_archive_id bigint,
    region_id integer,
    min_impressions integer,
    min_spend integer,
    max_impressions integer,
    max_spend integer,
    crawl_date date,
    most_recent boolean,
    nyu_id bigint NOT NULL
);


--
-- Name: region_impressions_nyu_id1_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.region_impressions_nyu_id1_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_impressions_nyu_id1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.region_impressions_nyu_id1_seq OWNED BY public.region_impressions.nyu_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regions (
    name character varying,
    id integer NOT NULL
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id bigint NOT NULL,
    topic character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: writable_ads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.writable_ads (
    id bigint NOT NULL,
    partisanship character varying,
    purpose character varying,
    optimism character varying,
    attack character varying,
    archive_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    text_hash character varying,
    ad_id text
);


--
-- Name: writable_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.writable_ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: writable_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.writable_ads_id_seq OWNED BY public.writable_ads.id;


--
-- Name: writable_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.writable_pages (
    id bigint NOT NULL,
    page_id bigint,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    disclaimer character varying
);


--
-- Name: writable_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.writable_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: writable_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.writable_pages_id_seq OWNED BY public.writable_pages.id;


--
-- Name: ad_archive_report_pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_archive_report_pages ALTER COLUMN id SET DEFAULT nextval('public.ad_archive_report_pages_id_seq'::regclass);


--
-- Name: ad_archive_reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_archive_reports ALTER COLUMN id SET DEFAULT nextval('public.ad_archive_reports_id_seq'::regclass);


--
-- Name: ad_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_texts ALTER COLUMN id SET DEFAULT nextval('public.ad_texts_id_seq'::regclass);


--
-- Name: ad_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_topics ALTER COLUMN id SET DEFAULT nextval('public.ad_topics_id_seq'::regclass);


--
-- Name: ads nyu_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ads ALTER COLUMN nyu_id SET DEFAULT nextval('public.ads_nyu_id_seq'::regclass);


--
-- Name: big_spenders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.big_spenders ALTER COLUMN id SET DEFAULT nextval('public.big_spenders_id_seq'::regclass);


--
-- Name: demo_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo_groups ALTER COLUMN id SET DEFAULT nextval('public.demo_groups_id_seq'::regclass);


--
-- Name: demo_impressions nyu_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo_impressions ALTER COLUMN nyu_id SET DEFAULT nextval('public.demo_impressions_nyu_id1_seq'::regclass);


--
-- Name: impressions nyu_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.impressions ALTER COLUMN nyu_id SET DEFAULT nextval('public.impressions_nyu_id1_seq'::regclass);


--
-- Name: payers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payers ALTER COLUMN id SET DEFAULT nextval('public.payers_id_seq'::regclass);


--
-- Name: region_impressions nyu_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region_impressions ALTER COLUMN nyu_id SET DEFAULT nextval('public.region_impressions_nyu_id1_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: writable_ads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writable_ads ALTER COLUMN id SET DEFAULT nextval('public.writable_ads_id_seq'::regclass);


--
-- Name: writable_pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writable_pages ALTER COLUMN id SET DEFAULT nextval('public.writable_pages_id_seq'::regclass);


--
-- Name: ad_archive_report_pages ad_archive_report_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_archive_report_pages
    ADD CONSTRAINT ad_archive_report_pages_pkey PRIMARY KEY (id);


--
-- Name: ad_archive_reports ad_archive_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_archive_reports
    ADD CONSTRAINT ad_archive_reports_pkey PRIMARY KEY (id);


--
-- Name: ad_texts ad_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_texts
    ADD CONSTRAINT ad_texts_pkey PRIMARY KEY (id);


--
-- Name: ad_topics ad_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_topics
    ADD CONSTRAINT ad_topics_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: big_spenders big_spenders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.big_spenders
    ADD CONSTRAINT big_spenders_pkey PRIMARY KEY (id);


--
-- Name: demo_groups demo_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo_groups
    ADD CONSTRAINT demo_groups_pkey PRIMARY KEY (id);


--
-- Name: demo_impressions demo_impressions_unique_ad_archive_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo_impressions
    ADD CONSTRAINT demo_impressions_unique_ad_archive_id UNIQUE (ad_archive_id, demo_id);


--
-- Name: fbpac_ads fbpac_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fbpac_ads
    ADD CONSTRAINT fbpac_ads_pkey PRIMARY KEY (id);


--
-- Name: impressions impressions_unique_ad_archive_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.impressions
    ADD CONSTRAINT impressions_unique_ad_archive_id UNIQUE (ad_archive_id);


--
-- Name: payers payers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payers
    ADD CONSTRAINT payers_pkey PRIMARY KEY (id);


--
-- Name: region_impressions region_impressions_unique_ad_archive_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region_impressions
    ADD CONSTRAINT region_impressions_unique_ad_archive_id UNIQUE (ad_archive_id, region_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: ads unique_ad_archive_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT unique_ad_archive_id UNIQUE (archive_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: writable_ads writable_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writable_ads
    ADD CONSTRAINT writable_ads_pkey PRIMARY KEY (id);


--
-- Name: writable_pages writable_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.writable_pages
    ADD CONSTRAINT writable_pages_pkey PRIMARY KEY (id);


--
-- Name: demo_impressions_archive_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX demo_impressions_archive_id_idx ON public.demo_impressions USING btree (ad_archive_id);


--
-- Name: fbpac_ads_lower_page_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fbpac_ads_lower_page_idx ON public.fbpac_ads USING btree (lower_page);


--
-- Name: impressions_archive_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX impressions_archive_id_idx ON public.impressions USING btree (ad_archive_id);


--
-- Name: index_ad_archive_report_pages_on_ad_archive_report_id_page_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_archive_report_pages_on_ad_archive_report_id_page_id ON public.ad_archive_report_pages USING btree (ad_archive_report_id, page_id);


--
-- Name: index_ad_texts_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_texts_on_tsv ON public.ad_texts USING gin (tsv);


--
-- Name: index_fbpac_ads_on_advertiser; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_advertiser ON public.fbpac_ads USING btree (advertiser);


--
-- Name: index_fbpac_ads_on_browser_lang; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_browser_lang ON public.fbpac_ads USING btree (lang);


--
-- Name: index_fbpac_ads_on_entities; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_entities ON public.fbpac_ads USING gin (entities);


--
-- Name: index_fbpac_ads_on_page; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_page ON public.fbpac_ads USING btree (page);


--
-- Name: index_fbpac_ads_on_political_probability; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_political_probability ON public.fbpac_ads USING btree (political_probability);


--
-- Name: index_fbpac_ads_on_targets; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fbpac_ads_on_targets ON public.fbpac_ads USING gin (targets);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_writable_ads_on_text_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_writable_ads_on_text_hash ON public.writable_ads USING btree (text_hash);


--
-- Name: region_impressions_archive_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX region_impressions_archive_id_idx ON public.region_impressions USING btree (ad_archive_id);


--
-- Name: ad_texts tsvectorupdate; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON public.ad_texts FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.english', 'search_text');


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20191004013753'),
('20191004145903'),
('20191004151713'),
('20191004151746'),
('20191008172936'),
('20191017012957'),
('20191017013045'),
('20191020005347'),
('20191023190103'),
('20191028150654'),
('20191106220234'),
('20191203155349'),
('20191216225447'),
('20200103144941'),
('20200108145543'),
('20200108151338'),
('20200108181722'),
('20200205171023'),
('20200205171134'),
('20200205183726');


