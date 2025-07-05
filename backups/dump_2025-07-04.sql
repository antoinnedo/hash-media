--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Debian 16.9-1.pgdg120+1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO hash_media;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO hash_media;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO hash_media;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO hash_media;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO hash_media;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO hash_media;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO hash_media;

--
-- Name: comment_likes; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.comment_likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    comment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comment_likes OWNER TO hash_media;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.comment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_likes_id_seq OWNER TO hash_media;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.comment_likes_id_seq OWNED BY public.comment_likes.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    content text,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO hash_media;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO hash_media;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO hash_media;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO hash_media;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    content text,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO hash_media;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO hash_media;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.relationships (
    id bigint NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.relationships OWNER TO hash_media;

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.relationships_id_seq OWNER TO hash_media;

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.relationships_id_seq OWNED BY public.relationships.id;


--
-- Name: responses; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.responses (
    id bigint NOT NULL,
    content text,
    user_id bigint NOT NULL,
    comment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.responses OWNER TO hash_media;

--
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.responses_id_seq OWNER TO hash_media;

--
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.responses_id_seq OWNED BY public.responses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO hash_media;

--
-- Name: users; Type: TABLE; Schema: public; Owner: hash_media
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp(6) without time zone,
    username character varying
);


ALTER TABLE public.users OWNER TO hash_media;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hash_media
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO hash_media;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hash_media
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: relationships id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.relationships ALTER COLUMN id SET DEFAULT nextval('public.relationships_id_seq'::regclass);


--
-- Name: responses id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.responses ALTER COLUMN id SET DEFAULT nextval('public.responses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	avatar	User	1	1	2025-07-04 08:42:22.051182
2	image	ActiveStorage::VariantRecord	1	2	2025-07-04 08:44:11.278141
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	gget3ixwsnocyoxxd6k6uttpbct6	default_cat_pfp.jpeg	image/jpeg	{"identified":true,"width":637,"height":358,"analyzed":true}	local	45397	RW/tbFOavt8iItk5bxBntQ==	2025-07-04 08:42:22.034468
2	1x4njngibm6iacjlg1jtqau5ktk2	default_cat_pfp.jpeg	image/jpeg	{"identified":true,"width":100,"height":56,"analyzed":true}	local	2119	9yoNLqfUiWNVUdrc6MSbbw==	2025-07-04 08:44:11.274478
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
1	1	6/MbmLdOctrj7ukuFyVm7nWShm4=
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-07-04 08:41:25.390059	2025-07-04 08:41:25.390062
schema_sha1	f835d985adf27f45959f1c7893793e92433646ae	2025-07-04 08:41:25.400711	2025-07-04 08:41:25.400713
\.


--
-- Data for Name: comment_likes; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.comment_likes (id, user_id, comment_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.comments (id, content, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.likes (id, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.posts (id, title, content, user_id, created_at, updated_at) FROM stdin;
2	Hey hey hey	12121212	1	2025-07-04 09:30:11.841731	2025-07-04 09:30:11.841731
\.


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.relationships (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.responses (id, content, user_id, comment_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.schema_migrations (version) FROM stdin;
20250630102140
20250630084046
20250630072844
20250630072341
20250630062212
20250630042805
20250630025938
20250630025549
20250630025513
20250630024534
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hash_media
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, failed_attempts, unlock_token, locked_at, username) FROM stdin;
1	antoinne2307@gmail.com	$2a$12$86.HMZwjldoeJO43QX0M5O2hmHEZeTYA5pr2qd4L.uFucoCsVETzW	\N	\N	2025-07-04 08:42:49.29023	2025-07-04 08:42:21.916569	2025-07-04 08:42:49.298338	zfoU6yspz3PtxBeyzi29	2025-07-04 08:42:37.433111	2025-07-04 08:42:21.918023	\N	1	2025-07-04 08:42:49.297993	2025-07-04 08:42:49.297993	151.101.1.227	151.101.1.227	0	\N	\N	antoinne2307
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 2, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 2, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, true);


--
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.posts_id_seq', 2, true);


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.relationships_id_seq', 1, false);


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.responses_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hash_media
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: responses responses_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_comment_likes_on_comment_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_comment_likes_on_comment_id ON public.comment_likes USING btree (comment_id);


--
-- Name: index_comment_likes_on_user_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_comment_likes_on_user_id ON public.comment_likes USING btree (user_id);


--
-- Name: index_comment_likes_on_user_id_and_comment_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_comment_likes_on_user_id_and_comment_id ON public.comment_likes USING btree (user_id, comment_id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_likes_on_post_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_likes_on_post_id ON public.likes USING btree (post_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: index_likes_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_likes_on_user_id_and_post_id ON public.likes USING btree (user_id, post_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_relationships_on_followed_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_relationships_on_followed_id ON public.relationships USING btree (followed_id);


--
-- Name: index_relationships_on_follower_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_relationships_on_follower_id ON public.relationships USING btree (follower_id);


--
-- Name: index_relationships_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_relationships_on_follower_id_and_followed_id ON public.relationships USING btree (follower_id, followed_id);


--
-- Name: index_responses_on_comment_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_responses_on_comment_id ON public.responses USING btree (comment_id);


--
-- Name: index_responses_on_user_id; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE INDEX index_responses_on_user_id ON public.responses USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: hash_media
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: responses fk_rails_2bd9a0753e; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT fk_rails_2bd9a0753e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: responses fk_rails_8187599354; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT fk_rails_8187599354 FOREIGN KEY (comment_id) REFERENCES public.comments(id);


--
-- Name: likes fk_rails_87a8aac469; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_87a8aac469 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: comment_likes fk_rails_c28a479c60; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT fk_rails_c28a479c60 FOREIGN KEY (comment_id) REFERENCES public.comments(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: comment_likes fk_rails_efcc5b56dc; Type: FK CONSTRAINT; Schema: public; Owner: hash_media
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT fk_rails_efcc5b56dc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

