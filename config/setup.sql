------Project's queries------
CREATE TABLE rates(
  id serial NOT NULL,
  date date,
  currency integer DEFAULT 0,
  rate double precision DEFAULT 0,
  CONSTRAINT rates_pkey PRIMARY KEY (id)
)WITH OIDS;

CREATE TABLE rates_local(
  id serial NOT NULL,
  date date,
  curr_id integer,
  rate double precision DEFAULT 0,
  CONSTRAINT rates_local_pkey PRIMARY KEY (id)
)WITH OIDS;

-- DROP TABLE entities;
CREATE TABLE entities(
  id serial NOT NULL,
  user_id integer NOT NULL DEFAULT 0,
  name text DEFAULT ''::text,
  date timestamp DEFAULT now(),
  active boolean default true,
  descr text DEFAULT ''::text,
  surname text DEFAULT ''::text,
  salutation text DEFAULT ''::text,
  type_id integer NOT NULL DEFAULT 0,
  physical boolean default false,
  email text DEFAULT ''::text,
  mobile text DEFAULT ''::text,
  tel text DEFAULT ''::text,
  address text DEFAULT ''::text,
  passport text DEFAULT ''::text,
  country_id integer NOT NULL DEFAULT 0,
  birth_date date DEFAULT null,
  CONSTRAINT entities_pkey PRIMARY KEY (id)
)WITH OIDS;



--DROP TABLE cashflow;
CREATE TABLE cashflow(
  id serial NOT NULL,
  user_id integer NOT NULL DEFAULT 0,
  name text DEFAULT ''::text,
  date timestamp DEFAULT now(),
  active boolean default true,
  descr text DEFAULT ''::text,
  currency_id integer NOT NULL DEFAULT 0,
  type_id integer NOT NULL DEFAULT 0,
  units integer DEFAULT 0,
  amount numeric DEFAULT 0,
  amount_eur numeric DEFAULT 0,
  amount_usd numeric DEFAULT 0,
  payment_id integer NOT NULL DEFAULT 0,
  consent_id integer NOT NULL DEFAULT 0,
  CONSTRAINT cashflow_pkey PRIMARY KEY (id)
)WITH OIDS;



CREATE TABLE products(
  id serial NOT NULL,
  name text DEFAULT ''::text,
  date timestamp DEFAULT now(),
  active boolean default true,
  descr text DEFAULT ''::text,
  image text DEFAULT ''::text,
  currency_id integer NOT NULL DEFAULT 601,
  type_id integer NOT NULL DEFAULT 0,
  units integer DEFAULT 0,
  qty integer DEFAULT 0,
  price numeric DEFAULT 0,
  CONSTRAINT products_pkey PRIMARY KEY (id)
)WITH OIDS;

CREATE TABLE payments(
  id serial NOT NULL,
  user_id integer NOT NULL DEFAULT 0,
  name text DEFAULT ''::text,
  date timestamp DEFAULT now(),
  active boolean default true,
  descr text DEFAULT ''::text,
  item_number text DEFAULT ''::text,
  txn_id text DEFAULT ''::text,
  currency_id integer NOT NULL DEFAULT 601,
  status_id integer NOT NULL DEFAULT 0,
  status text DEFAULT ''::text,
  product_id integer NOT NULL DEFAULT 0,
  amount numeric DEFAULT 0,
  amount_eur numeric DEFAULT 0,
  amount_usd numeric DEFAULT 0,

  transaction_subject text DEFAULT ''::text,
  txn_type text DEFAULT ''::text,
  payment_date text DEFAULT ''::text,
  last_name text DEFAULT ''::text,
  residence_country text DEFAULT ''::text,
  pending_reason text DEFAULT ''::text,
  item_name text DEFAULT ''::text,
  payment_gross text DEFAULT ''::text,
  mc_currency text DEFAULT ''::text,
  business text DEFAULT ''::text,
  payment_type text DEFAULT ''::text,
  protection_eligibility text DEFAULT ''::text,
  verify_sign text DEFAULT ''::text,
  payer_status text DEFAULT ''::text,
  test_ipn text DEFAULT ''::text,
  payer_email text DEFAULT ''::text,
  quantity text DEFAULT ''::text,
  receiver_email text DEFAULT ''::text,
  first_name text DEFAULT ''::text,
  payer_id text DEFAULT ''::text,
  receiver_id text DEFAULT ''::text,
  handling_amount text DEFAULT ''::text,
  payment_status text DEFAULT ''::text,
  mc_gross text DEFAULT ''::text,
  custom text DEFAULT ''::text,
  charset text DEFAULT ''::text,
  notify_version text DEFAULT ''::text,
  ipn_track_id text DEFAULT ''::text,
    CONSTRAINT payments_pkey PRIMARY KEY (id)
)WITH OIDS;


alter table entities add constraint fk_entities_users foreign key (user_id) references users (id) on delete cascade on update cascade;
alter table cashflow add constraint fk_cashflow_users foreign key (user_id) references users (id) on delete cascade on update cascade;
