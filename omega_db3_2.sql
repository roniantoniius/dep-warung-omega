--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-10-20 17:36:13

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
-- TOC entry 236 (class 1259 OID 49818)
-- Name: beli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beli (
    id_beli integer NOT NULL,
    kuantitas integer NOT NULL,
    harga_total numeric(12,2) NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 49817)
-- Name: beli_id_beli_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beli_id_beli_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 235
-- Name: beli_id_beli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beli_id_beli_seq OWNED BY public.beli.id_beli;


--
-- TOC entry 222 (class 1259 OID 49706)
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    id integer NOT NULL,
    business_name character varying(20) NOT NULL,
    city character varying(100) DEFAULT 'Unspecified'::character varying NOT NULL,
    region character varying(100) DEFAULT 'Unspecified'::character varying NOT NULL,
    business_description text,
    logo character varying(200) DEFAULT 'default.jpg'::character varying NOT NULL,
    owner_id integer NOT NULL
);

--
-- TOC entry 221 (class 1259 OID 49705)
-- Name: business_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_id_seq OWNED BY public.business.id;


--
-- TOC entry 224 (class 1259 OID 49725)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    harga_total numeric(12,2) DEFAULT 0 NOT NULL,
    user_id integer NOT NULL
);

--
-- TOC entry 223 (class 1259 OID 49724)
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- TOC entry 216 (class 1259 OID 49673)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id_category integer NOT NULL,
    category_name character varying(100) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 49672)
-- Name: category_id_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;


--
-- TOC entry 234 (class 1259 OID 49800)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id_order integer NOT NULL,
    kuantitas integer NOT NULL,
    harga_total numeric(12,2) NOT NULL,
    date_ordered timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);

--
-- TOC entry 233 (class 1259 OID 49799)
-- Name: order_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_id_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_order_seq OWNED BY public."order".id_order;


--
-- TOC entry 228 (class 1259 OID 49759)
-- Name: pesan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesan (
    id_pesan integer NOT NULL,
    kuantitas integer NOT NULL,
    harga_kuantitas numeric(12,2) NOT NULL,
    cart_id integer NOT NULL,
    produk_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 49758)
-- Name: pesan_id_pesan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pesan_id_pesan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 227
-- Name: pesan_id_pesan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pesan_id_pesan_seq OWNED BY public.pesan.id_pesan;


--
-- TOC entry 226 (class 1259 OID 49738)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    original_price numeric(12,2) NOT NULL,
    new_price numeric(12,2) NOT NULL,
    percentage_discount integer NOT NULL,
    offer_expiration_date date NOT NULL,
    harga_note character varying(100) NOT NULL,
    produk_note character varying(100) NOT NULL,
    lokasi character varying(100) NOT NULL,
    product_description text,
    tips text,
    product_image character varying(200) DEFAULT 'productDefault.jpg'::character varying NOT NULL,
    date_published timestamp with time zone NOT NULL,
    business_id integer NOT NULL,
    category_id integer NOT NULL
);

--
-- TOC entry 225 (class 1259 OID 49737)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 232 (class 1259 OID 49788)
-- Name: report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report (
    id_report integer NOT NULL,
    transaction_id integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 49787)
-- Name: report_id_report_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_id_report_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 231
-- Name: report_id_report_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_id_report_seq OWNED BY public.report.id_report;


--
-- TOC entry 218 (class 1259 OID 49682)
-- Name: resep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resep (
    id integer NOT NULL,
    nama_resep character varying(100) NOT NULL,
    gambar_resep character varying(200) DEFAULT 'default_resep.jpg'::character varying NOT NULL,
    bahan_1 text NOT NULL,
    bahan_2 text,
    bahan_3 text,
    langkah_1 text NOT NULL,
    langkah_2 text,
    langkah_3 text
);


--
-- TOC entry 217 (class 1259 OID 49681)
-- Name: resep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resep_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 217
-- Name: resep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resep_id_seq OWNED BY public.resep.id;


--
-- TOC entry 230 (class 1259 OID 49776)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id_transaction integer NOT NULL,
    cart_id integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 49775)
-- Name: transaction_id_transaction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_transaction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 229
-- Name: transaction_id_transaction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_transaction_seq OWNED BY public.transaction.id_transaction;


--
-- TOC entry 238 (class 1259 OID 49835)
-- Name: transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi (
    id_transaksi integer NOT NULL,
    total numeric(12,2) NOT NULL,
    status boolean DEFAULT false NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 49847)
-- Name: transaksi_beli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi_beli (
    transaksi_id integer NOT NULL,
    beli_id integer NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 49834)
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksi_id_transaksi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 237
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNED BY public.transaksi.id_transaksi;


--
-- TOC entry 241 (class 1259 OID 49862)
-- Name: transaksidetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksidetail (
    id_detail integer NOT NULL,
    kuantitas integer NOT NULL,
    harga_total numeric(12,2) NOT NULL,
    product_id integer NOT NULL,
    transaksi_id integer NOT NULL
);

--
-- TOC entry 240 (class 1259 OID 49861)
-- Name: transaksidetail_id_detail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksidetail_id_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 240
-- Name: transaksidetail_id_detail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksidetail_id_detail_seq OWNED BY public.transaksidetail.id_detail;


--
-- TOC entry 220 (class 1259 OID 49692)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    address text,
    is_verified boolean DEFAULT false NOT NULL,
    join_date timestamp with time zone NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 49691)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4770 (class 2604 OID 49821)
-- Name: beli id_beli; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli ALTER COLUMN id_beli SET DEFAULT nextval('public.beli_id_beli_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 49709)
-- Name: business id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business ALTER COLUMN id SET DEFAULT nextval('public.business_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 49728)
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 49676)
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 49803)
-- Name: order id_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id_order SET DEFAULT nextval('public.order_id_order_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 49762)
-- Name: pesan id_pesan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesan ALTER COLUMN id_pesan SET DEFAULT nextval('public.pesan_id_pesan_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 49741)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 49791)
-- Name: report id_report; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report ALTER COLUMN id_report SET DEFAULT nextval('public.report_id_report_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 49685)
-- Name: resep id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resep ALTER COLUMN id SET DEFAULT nextval('public.resep_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 49779)
-- Name: transaction id_transaction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id_transaction SET DEFAULT nextval('public.transaction_id_transaction_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 49838)
-- Name: transaksi id_transaksi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('public.transaksi_id_transaksi_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 49865)
-- Name: transaksidetail id_detail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail ALTER COLUMN id_detail SET DEFAULT nextval('public.transaksidetail_id_detail_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 49695)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4991 (class 0 OID 49818)
-- Dependencies: 236
-- Data for Name: beli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beli (id_beli, kuantitas, harga_total, product_id, user_id) FROM stdin;
29	4	396000.00	5	1
35	4	232000.00	10	14
36	2	136000.00	9	14
38	4	180000.00	8	1
40	5	360000.00	11	11
41	1	70000.00	6	11
45	1	99000.00	5	15
46	1	195000.00	7	15
47	1	45000.00	8	15
48	1	58000.00	10	15
\.


--
-- TOC entry 4977 (class 0 OID 49706)
-- Dependencies: 222
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (id, business_name, city, region, business_description, logo, owner_id) FROM stdin;
1	roni	Unspecified	Unspecified	\N	default.jpg	1
2	voke	Unspecified	Unspecified	\N	default.jpg	2
3	fava	Unspecified	Unspecified	\N	default.jpg	5
4	xolev	Unspecified	Unspecified	\N	default.jpg	6
5	viba	Unspecified	Unspecified	\N	default.jpg	11
6	theo	Unspecified	Unspecified	\N	default.jpg	12
7	Theo	Unspecified	Unspecified	\N	default.jpg	14
8	Antonius Roni	Unspecified	Unspecified	\N	default.jpg	15
\.


--
-- TOC entry 4979 (class 0 OID 49725)
-- Dependencies: 224
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cart_id, harga_total, user_id) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 49673)
-- Dependencies: 216
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id_category, category_name) FROM stdin;
1	Ready to Eat
2	Fish - Fillets, Cutlets & Tails
3	Crab & Lobster
4	Prawns
5	Mussels, Bugs & Shellfish
\.


--
-- TOC entry 4989 (class 0 OID 49800)
-- Dependencies: 234
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id_order, kuantitas, harga_total, date_ordered, product_id, user_id) FROM stdin;
2	3	285000.00	2024-09-21 20:14:41.398423+07	1	1
\.


--
-- TOC entry 4983 (class 0 OID 49759)
-- Dependencies: 228
-- Data for Name: pesan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pesan (id_pesan, kuantitas, harga_kuantitas, cart_id, produk_id) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 49738)
-- Dependencies: 226
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, original_price, new_price, percentage_discount, offer_expiration_date, harga_note, produk_note, lokasi, product_description, tips, product_image, date_published, business_id, category_id) FROM stdin;
4	Kerang Hijau Segar	50000.00	40000.00	20	2024-09-14	per porsi	untuk 4 orang	DKI Jakarta	Kerang hijau segar, lezat untuk sajian seafood.	Tumis dengan saus tiram untuk rasa gurih yang memikat.	f7eb92b62a7afa165fc9.jpg	2024-09-14 17:22:34.389191+07	1	5
6	Udang Segar Pilihan	90000.00	70000.00	22	2024-09-14	per box	untuk 4 orang	DKI Jakarta	Udang segar dari laut, siap diolah untuk berbagai masakan.	Goreng dengan tepung untuk hasil yang renyah.	005655223bdd7735a1b3.jpg	2024-09-14 17:26:29.103019+07	1	4
7	Daging Steak Premium	200000.00	195000.00	2	2024-09-10	Potongan harga untuk persediaan terbatas	Daging steak berkualitas premium	Jakarta	Daging steak segar, siap untuk diolah menjadi steak lezat.	Panggang dengan garam dan lada untuk cita rasa otentik.	2c7ac48662319527383a.png	2024-09-10 13:55:51.549687+07	1	2
8	Nasi Goreng Udang Amerika	50000.00	45000.00	10	2024-09-10	Harga spesial selama bulan ini	Nasi goreng udang ala Amerika, siap disantap	Jakarta	Nasi goreng udang Amerika, sajian cepat saji lezat.	Tambahkan saus pedas untuk rasa yang lebih kuat.	4fff04b1c8ee1814b30b.jpg	2024-09-10 13:55:59.896243+07	1	1
9	Udang Goreng dengan Bayam	70000.00	68000.00	2	2024-09-10	Diskon untuk pembelian langsung	Udang goreng dipadukan dengan bayam segar	Bandung	Udang goreng dengan bayam, sajian sehat dan lezat.	Goreng dengan sedikit minyak untuk hasil yang renyah.	281b7a2eaa9e60c11e4d.jpg	2024-09-10 13:56:08.93406+07	1	1
10	Salad Mie Pedas Seafood	60000.00	58000.00	3	2024-09-10	Diskon spesial bulan ini	Salad mie pedas dengan campuran seafood segar	Bali	Salad mie pedas dengan seafood, kombinasi lezat dan sehat.	Tambahkan jeruk nipis untuk cita rasa segar.	bc7cf4a0f667247436c3.jpg	2024-09-10 13:56:16.567482+07	1	1
11	Cumi Goreng Tepung Renyah	75000.00	72000.00	4	2024-09-10	Diskon untuk pembelian langsung	Cumi goreng tepung dengan tekstur renyah	Surabaya	Cumi goreng dengan tepung renyah, siap disantap.	Goreng dengan api sedang untuk hasil yang sempurna.	3c08138135c52adfd13e.jpg	2024-09-10 13:56:25.036057+07	1	1
1	Kepiting Segar	200000.00	95000.00	52	2024-09-14	per ekor	untuk 1-2 orang	Jakarta Utara	Kepiting segar dengan cakar, cocok untuk berbagai olahan masakan.	Rebus dengan bumbu rempah untuk hasil terbaik.	771655a2f2597775bab8.jpg	2024-09-14 16:56:05.399064+07	1	3
2	Ikan Nila Segar	2500.00	1500.00	40	2024-09-14	per gram	untuk 1 orang	Tanjung Priok	Ikan segar siap diolah dengan sentuhan lemon segar.	Panggang dengan minyak zaitun dan lemon untuk rasa optimal	b6e46db6434b61478d45.jpg	2024-09-14 17:17:11.129453+07	1	2
3	Ikan Kembung Segar	6500.00	3000.00	53	2024-09-14	per gram	untuk 1 orang	DKI Jakarta	Ikan kembung segar, cocok untuk berbagai olahan.	Goreng dengan bumbu kuning untuk hasil yang renyah.	d96842f271d10dae95f3.jpg	2024-09-14 17:21:13.460371+07	1	2
5	Daging Salmon Premium	150000.00	99000.00	34	2024-09-14	per box	untuk 4 orang	DKI Jakarta	Daging Salmon Premium adalah produk seafood berkualitas tinggi yang dipilih secara teliti untuk memastikan kesegaran dan kelezatan. Dengan kandungan protein yang tinggi dan rendah lemak, daging salmon ini sangat cocok untuk Anda yang ingin menjaga kesehatan dan kebugaran. Nikmati sensasi rasa yang lezat dan tekstur yang lembut dengan mengolahnya menjadi berbagai hidangan yang lezat.	Untuk menjaga kesegaran Daging Salmon Premium, pastikan Anda menyimpannya di dalam freezer dengan suhu -18°C atau lebih rendah. Sebelum mengolah, pastikan Anda mencuci tangan dan peralatan dengan air mengalir untuk menghindari kontaminasi. Simpan daging salmon dalam wadah tertutup rapat dan jauhkan dari bauan lainnya untuk menghindari percampuran bau. Dengan mengikuti tips ini, Anda dapat menikmati Daging Salmon Premium yang segar dan lezat dalam waktu yang lama.	49072183bd3416cfdade.jpg	2024-09-14 22:18:34.512707+07	1	2
\.


--
-- TOC entry 4987 (class 0 OID 49788)
-- Dependencies: 232
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report (id_report, transaction_id) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 49682)
-- Dependencies: 218
-- Data for Name: resep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resep (id, nama_resep, gambar_resep, bahan_1, bahan_2, bahan_3, langkah_1, langkah_2, langkah_3) FROM stdin;
1	Nasi Goreng Udang Amerika	1c8d3623a2bc16150ffb.jpg	200g udang kupas	2 porsi nasi putih	2 siung bawang putih cincang	Tumis bawang putih hingga harum, masukkan udang dan tumis hingga matang.	Tambahkan nasi putih ke dalam wajan, aduk rata dengan udang.	Tambahkan kecap, garam, dan merica secukupnya. Aduk hingga tercampur merata.
2	Udang Goreng dengan Bayam	14349b894a1e84a207af.jpg	200g udang kupas	100g bayam segar	2 siung bawang putih cincang	Goreng udang dalam minyak panas hingga berubah warna menjadi merah keemasan.	Tumis bawang putih hingga harum, masukkan bayam dan tumis hingga layu.	Campurkan udang goreng dengan tumisan bayam, sajikan selagi hangat.
3	Ikan Bakar Bumbu Kuning	c7e369cca6697af3e569.jpg	500 gram ikan kakap segar, cuci bersih dan beri sedikit perasan jeruk nipis	5 siung bawang merah, 3 siung bawang putih, kunyit, jahe, kemiri, dan lengkuas yang sudah dihaluskan untuk bumbu kuning	2 sendok makan minyak kelapa asli, garam secukupnya, dan daun jeruk untuk aroma segar yang khas	Pertama, lumuri ikan kakap segar dengan perasan jeruk nipis agar segar dan tidak amis, lalu biarkan meresap selama 15 menit. Rasa segar ikan ini akan menjadi bintang utama dalam hidangan.	Selanjutnya, tumis bumbu kuning yang sudah dihaluskan dengan minyak kelapa hingga harum. Kunyit memberikan warna emas yang menggiurkan, sementara jahe dan lengkuas menambahkan cita rasa yang dalam dan autentik.	Balurkan bumbu kuning secara merata pada ikan kakap, lalu panggang di atas bara api hingga matang sempurna, sambil sesekali diolesi sisa bumbu untuk menjaga kelembutannya. Sajikan dengan taburan daun jeruk dan nasi hangat.
\.


--
-- TOC entry 4985 (class 0 OID 49776)
-- Dependencies: 230
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id_transaction, cart_id) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 49835)
-- Dependencies: 238
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksi (id_transaksi, total, status, user_id) FROM stdin;
1	200000.00	f	1
2	700000.00	f	11
3	798000.00	f	1
4	798000.00	f	1
5	798000.00	f	1
6	798000.00	f	1
7	420000.00	f	1
8	285000.00	f	1
9	483000.00	f	1
10	1263000.00	f	1
11	285000.00	f	1
12	285000.00	f	1
13	320000.00	f	1
14	80000.00	f	1
15	580000.00	f	1
16	580000.00	f	1
17	1393000.00	f	1
18	1005000.00	f	1
19	1401000.00	f	1
20	562000.00	f	14
21	562000.00	f	14
22	367000.00	f	14
23	70000.00	f	14
24	71500.00	f	14
25	71500.00	f	14
26	1500.00	f	14
27	273500.00	f	14
28	272000.00	f	14
29	272000.00	f	14
30	272000.00	f	14
31	504000.00	f	14
32	504000.00	f	14
33	504000.00	f	14
34	640000.00	f	14
35	640000.00	f	14
36	640000.00	f	14
37	640000.00	f	14
38	720000.00	f	14
39	720000.00	f	14
40	720000.00	f	14
41	720000.00	f	14
42	368000.00	f	14
43	785000.00	f	11
44	1401000.00	f	1
45	1401000.00	f	1
46	1401000.00	f	1
47	1401000.00	f	1
48	981000.00	f	1
49	981000.00	f	1
50	981000.00	f	1
51	396000.00	f	1
52	576000.00	f	1
53	576000.00	f	1
54	399000.00	f	11
55	399000.00	f	11
56	469000.00	f	11
57	469000.00	t	11
58	469000.00	t	11
59	430000.00	f	11
60	430000.00	f	11
61	430000.00	t	11
62	430000.00	f	11
63	430000.00	f	11
64	368000.00	t	14
65	407000.00	t	15
66	397000.00	t	15
\.


--
-- TOC entry 4994 (class 0 OID 49847)
-- Dependencies: 239
-- Data for Name: transaksi_beli; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksi_beli (transaksi_id, beli_id) FROM stdin;
\.


--
-- TOC entry 4996 (class 0 OID 49862)
-- Dependencies: 241
-- Data for Name: transaksidetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksidetail (id_detail, kuantitas, harga_total, product_id, transaksi_id) FROM stdin;
1	6	420000.00	6	17
2	3	585000.00	7	17
3	4	272000.00	9	17
4	2	116000.00	10	17
5	6	420000.00	6	18
6	3	585000.00	7	18
7	6	420000.00	6	19
8	3	585000.00	7	19
9	4	396000.00	5	19
10	1	195000.00	7	20
11	3	297000.00	5	20
12	1	70000.00	6	20
13	1	195000.00	7	21
14	3	297000.00	5	21
15	1	70000.00	6	21
16	3	297000.00	5	22
17	1	70000.00	6	22
18	1	70000.00	6	23
19	1	70000.00	6	24
20	1	1500.00	2	24
21	1	70000.00	6	25
22	1	1500.00	2	25
23	1	1500.00	2	26
24	1	1500.00	2	27
25	4	272000.00	9	27
26	4	272000.00	9	28
27	4	272000.00	9	33
28	4	232000.00	10	33
29	4	272000.00	9	40
30	4	232000.00	10	40
31	2	136000.00	9	40
32	2	80000.00	4	40
33	4	232000.00	10	42
34	2	136000.00	9	42
35	6	420000.00	6	46
36	3	585000.00	7	46
37	4	396000.00	5	46
38	6	420000.00	6	47
39	3	585000.00	7	47
40	4	396000.00	5	47
41	3	585000.00	7	48
42	4	396000.00	5	48
43	3	585000.00	7	49
44	4	396000.00	5	49
45	3	585000.00	7	50
46	4	396000.00	5	50
47	4	396000.00	5	51
48	4	396000.00	5	52
49	4	180000.00	8	52
50	4	396000.00	5	53
51	4	180000.00	8	53
52	13	39000.00	3	54
53	5	360000.00	11	54
54	13	39000.00	3	55
55	5	360000.00	11	55
56	13	39000.00	3	56
57	5	360000.00	11	56
58	1	70000.00	6	56
59	13	39000.00	3	57
60	5	360000.00	11	57
61	1	70000.00	6	57
62	13	39000.00	3	58
63	5	360000.00	11	58
64	1	70000.00	6	58
65	5	360000.00	11	59
66	1	70000.00	6	59
67	5	360000.00	11	60
68	1	70000.00	6	60
69	5	360000.00	11	61
70	1	70000.00	6	61
71	5	360000.00	11	62
72	1	70000.00	6	62
73	5	360000.00	11	63
74	1	70000.00	6	63
75	4	232000.00	10	64
76	2	136000.00	9	64
77	2	80000.00	4	65
78	3	210000.00	6	65
79	6	18000.00	3	65
80	1	99000.00	5	65
81	1	99000.00	5	66
82	1	195000.00	7	66
83	1	45000.00	8	66
84	1	58000.00	10	66
\.


--
-- TOC entry 4975 (class 0 OID 49692)
-- Dependencies: 220
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, email, password, phone, address, is_verified, join_date) FROM stdin;
1	roni	antoniusronz45@gmail.com	$2b$12$DgkkA2SDQFpVHNrMjVwTwe5wYvBGy2EbO5aLdmaipAo3ReC8Jwei.	35351351	Jakarta	t	2024-09-10 13:52:54.310268+07
2	voke	vokemag879@asaud.com	$2b$12$uNqxSUMC5FuVQ7MYOgCUTeOCgFsEnb73seADEv/w9W77pdZg17pbq	123	sa	f	2024-09-16 09:39:47.039191+07
5	fava	favama8149@cetnob.com	$2b$12$p3xryTRNCIj/oyo5tblztOQ6AfrwmPTYVyaawMzng1.jw5QEqO9MK	123	sd	f	2024-09-16 11:28:51.967289+07
6	xolev	xolev97957@asaud.com	$2b$12$oZn0g16FS3//ubGHvfW1CeRrXJQpbh/ES5s3N/unixnZ7a8kjJnm6	1231	bandung	t	2024-09-16 12:01:10.823899+07
11	viba	vibaj21036@asaud.com	$2b$12$pqZBulpb1ioJvDS1W4ek/e0oFn5A3BaKCZAEngCLJSOCtfKtRsnfy	123	Bandung	t	2024-09-18 15:46:28.754058+07
12	theo	xecip62017@scarden.com	$2b$12$0gDBkbNuftorxsla0CTEY.NzsMgF5jjcfXq.Q2zB5Sx7rIKLpG0oG	0898483734	Jalan Batavia, Jakarta	t	2024-10-15 14:51:15.145835+07
14	Theo	rayod30354@rowplant.com	$2b$12$SRkE5Wv7pjxl7xEtGoYyOu6v9ZNSQx9i.cKVtnOtdD4v7o/NY/aUC	0723871247	Dimana aja deh	t	2024-10-15 15:05:33.722157+07
15	Antonius Roni	aantoniusron77@gmail.com	$2b$12$oukLDeUOujcoGGfuje8j5OdkWH1lFJkHxjUrASYv7jw308FbJw43a	0898483734	Jakarta Timur	f	2024-10-20 07:07:55.200336+07
\.


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 235
-- Name: beli_id_beli_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beli_id_beli_seq', 48, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 221
-- Name: business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_id_seq', 8, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 223
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_category_seq', 5, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_order_seq', 2, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 227
-- Name: pesan_id_pesan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pesan_id_pesan_seq', 1, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 11, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 231
-- Name: report_id_report_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_id_report_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 217
-- Name: resep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resep_id_seq', 3, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 229
-- Name: transaction_id_transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_transaction_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 237
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksi_id_transaksi_seq', 66, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 240
-- Name: transaksidetail_id_detail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksidetail_id_detail_seq', 84, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 15, true);


--
-- TOC entry 4804 (class 2606 OID 49823)
-- Name: beli beli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli
    ADD CONSTRAINT beli_pkey PRIMARY KEY (id_beli);


--
-- TOC entry 4787 (class 2606 OID 49718)
-- Name: business business_business_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_business_name_key UNIQUE (business_name);


--
-- TOC entry 4789 (class 2606 OID 49716)
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 49731)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- TOC entry 4775 (class 2606 OID 49680)
-- Name: category category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);


--
-- TOC entry 4777 (class 2606 OID 49678)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- TOC entry 4802 (class 2606 OID 49806)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id_order);


--
-- TOC entry 4796 (class 2606 OID 49764)
-- Name: pesan pesan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesan
    ADD CONSTRAINT pesan_pkey PRIMARY KEY (id_pesan);


--
-- TOC entry 4794 (class 2606 OID 49746)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 49793)
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id_report);


--
-- TOC entry 4779 (class 2606 OID 49690)
-- Name: resep resep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resep
    ADD CONSTRAINT resep_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 49781)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id_transaction);


--
-- TOC entry 4806 (class 2606 OID 49841)
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- TOC entry 4809 (class 2606 OID 49867)
-- Name: transaksidetail transaksidetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT transaksidetail_pkey PRIMARY KEY (id_detail);


--
-- TOC entry 4781 (class 2606 OID 49704)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 4783 (class 2606 OID 49700)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 49702)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 4792 (class 1259 OID 49757)
-- Name: idx_product_name_683352; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_name_683352 ON public.product USING btree (name);


--
-- TOC entry 4807 (class 1259 OID 49860)
-- Name: uidx_transaksi_b_transak_70eb31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uidx_transaksi_b_transak_70eb31 ON public.transaksi_beli USING btree (transaksi_id, beli_id);


--
-- TOC entry 4820 (class 2606 OID 49824)
-- Name: beli beli_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli
    ADD CONSTRAINT beli_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4821 (class 2606 OID 49829)
-- Name: beli beli_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli
    ADD CONSTRAINT beli_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4810 (class 2606 OID 49719)
-- Name: business business_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4811 (class 2606 OID 49732)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 49807)
-- Name: order order_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 49812)
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4814 (class 2606 OID 49765)
-- Name: pesan pesan_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesan
    ADD CONSTRAINT pesan_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 49770)
-- Name: pesan pesan_produk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesan
    ADD CONSTRAINT pesan_produk_id_fkey FOREIGN KEY (produk_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 49747)
-- Name: product product_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.business(id) ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 49752)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id_category) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 49794)
-- Name: report report_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id_transaction) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 49782)
-- Name: transaction transaction_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id) ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 49855)
-- Name: transaksi_beli transaksi_beli_beli_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi_beli
    ADD CONSTRAINT transaksi_beli_beli_id_fkey FOREIGN KEY (beli_id) REFERENCES public.beli(id_beli) ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 49850)
-- Name: transaksi_beli transaksi_beli_transaksi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi_beli
    ADD CONSTRAINT transaksi_beli_transaksi_id_fkey FOREIGN KEY (transaksi_id) REFERENCES public.transaksi(id_transaksi) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 49842)
-- Name: transaksi transaksi_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4825 (class 2606 OID 49868)
-- Name: transaksidetail transaksidetail_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT transaksidetail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4826 (class 2606 OID 49873)
-- Name: transaksidetail transaksidetail_transaksi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT transaksidetail_transaksi_id_fkey FOREIGN KEY (transaksi_id) REFERENCES public.transaksi(id_transaksi) ON DELETE CASCADE;


-- Completed on 2024-10-20 17:36:14

--
-- PostgreSQL database dump complete
--

