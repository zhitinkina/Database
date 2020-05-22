CREATE DATABASE shop
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE public.manufacturer
(
    manufacturer_id SERIAL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturer_id),
    CONSTRAINT manufacturer_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.manufacturer
    OWNER to postgres;

CREATE TABLE public.basket_status
(
    basket_status_id SMALLSERIAL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_status_pkey PRIMARY KEY (basket_status_id),
    CONSTRAINT basket_status_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.basket_status
    OWNER to postgres;

CREATE TABLE public.category
(
    category_id SMALLSERIAL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (category_id),
    CONSTRAINT category_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.category
    OWNER to postgres;

CREATE TABLE public.role
(
    role_id SMALLSERIAL,
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT role_pkey PRIMARY KEY (role_id),
    CONSTRAINT role_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.role
    OWNER to postgres;

CREATE TABLE public."user"
(
    user_id BIGSERIAL,
    login character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(128) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    role_id smallint NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id),
    CONSTRAINT user_email_key UNIQUE (email),
    CONSTRAINT user_login_key UNIQUE (login),
    CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id)
        REFERENCES public.role (role_id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to postgres;

CREATE TABLE public.basket
(
    basket_id BIGSERIAL,
    user_id bigint NOT NULL,
    basket_status_id smallint NOT NULL,
    CONSTRAINT basket_pkey PRIMARY KEY (basket_id),
    CONSTRAINT basket_basket_status_id_fkey FOREIGN KEY (basket_status_id)
        REFERENCES public.basket_status (basket_status_id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT basket_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.basket
    OWNER to postgres;

CREATE TABLE public.product
(
    product_id SERIAL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    cost money NOT NULL,
    description text COLLATE pg_catalog."default",
    category_id smallint NOT NULL,
    img character varying(256) COLLATE pg_catalog."default",
    manufacturer_id bigint NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_name_key UNIQUE (name),
    CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.category (category_id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT product_manufacturer_id_fkey FOREIGN KEY (manufacturer_id)
        REFERENCES public.manufacturer (manufacturer_id) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.product
    OWNER to postgres;

CREATE TABLE public."order"
(
    basket_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity smallint NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (basket_id, product_id),
    CONSTRAINT order_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."order"
    OWNER to postgres;

INSERT INTO public."manufacturer" (name, description) VALUES
('Vivienne Sabo', 'Vivienne Sabo -марка с романтичной парижской душой, дарит ощущения весеннего Парижа, современная и классическая, интригующая и демократичная. При создании косметических продуктов марки Vivienne Sabo используются самые современные текстуры и формулы Аромат свежих цветов фиалки, украшающих коллекцию, дарит ощущение весеннего Парижа.'),
('Maybelline New York', 'Maybelline New York - бренд макияжа №1 в России. Это бренд, вдохновленный духом Нью-Йорка и несущий в себе такие ценности как: красота, мода, неограниченные возможности, инновации и доступность. Косметика Maybelline NY - отличный способ самовыражения. Это современный бренд, который тонко чувствует актуальные тенденции, но при этом имеет 100-летнюю историю.'),
('"ЧИСТАЯ ЛИНИЯ"', '"ЧИСТАЯ ЛИНИЯ" - Это уникальная косметика на основе натуральных экстрактов российских трав. Опыт и научные исследования компании позволяют открывать уникальные свойства российских трав для защиты и сохранения красоты и здоровья кожи и волос.'),
('Estel (Эстель)', 'Estel (Эстель) - российский производитель профессиональной косметики для волос.');

INSERT INTO public."basket_status" (name) VALUES
('В процессе'),
('Оплачено');

INSERT INTO public."category" (name) VALUES
('Лицо'),
('Волосы'),
('Ногти'),
('Тело');

INSERT INTO public."role" (name) VALUES
('Администратор'),
('Пользователь');

INSERT INTO public."product" (name, cost, description, category_id, img, manufacturer_id) VALUES
('Vivienne Sabo Тушь', 300, 'Тушь для ресниц супер-объемная, со сценическим эффектом', 1, 'ink.jpg', 1),
('Палетка теней', 882, 'Палетка теней Rimmel Magnif''Eyes Blush', 1, 'pallete.jpg', 1),
('Губная помада-тинт', 1000, 'L`Oreal Paris Rouge Signature, матовый, "Я протестую", красный', 1, 'lips.jpg', 1),
('DIVAGE Румяна', 271, 'Румяна компактные "VELVET"', 1, 'brash1.jpg', 1),
('Relouis Помада', 345, 'Помада губная La Mia Italia', 1, 'lips2.jpg', 1),
('Matrix Шампунь', 1100, 'Шампунь для волос Total Results So Silver, для нейтрализации желтизны', 2, 'shampoo.jpg', 1),
('Бигуди-бумеранги', 235, 'Harizma Бигуди-бумеранги 22x240 мм 10 шт h10983-22, зелёные', 2, 'hair-curlers.jpg', 1),
('Расческа Tangle Teezer', 1288, 'Щетка для волос', 2, 'hairbrush.jpg', 1),
('Лак для ногтей', 570, 'Kinetics SolarGel Polish тон 200, 15 мл', 3, 'varnish2.jpg', 1),
('Быстрая сушка лака', 212, 'Super Fast Drying, 11 мл.', 3, 'varnish.jpg', 1),
('Слайдер-дизайн', 345, 'Слайдер-дизайн Пары линии, sd1-1567 в наборе', 3, 'varnish-nabor.jpg', 1),
('Крем для тела', 470, 'Botanic Secrets Апельсин и какао 150мл', 3, 'cream.jpg', 1),
('Молочко-хайлайтер', 845, 'MIXIT Бронзовое молочко-хайлайтер для тела Unicorn Shimmer Milk Color Bronze, 100 мл', 3, 'highlighter.jpg', 1),
('Большая щётка', 345, 'Lapochka большая щётка из бука для сухого массажа max (щетина кабана) средней жесткости', 3, 'brush.jpg', 1);

CREATE FUNCTION get_basket_id_or_create(u_id BIGINT) RETURNS BIGINT AS $$
DECLARE
	b_id BIGINT;
BEGIN
	SELECT basket_id INTO b_id FROM basket WHERE user_id=u_id AND basket_status_id=1;
	IF b_id ISNULL THEN
	    INSERT INTO basket (user_id, basket_status_id) VALUES (u_id, 1);
		SELECT basket_id INTO b_id FROM basket WHERE user_id=u_id AND basket_status_id=1;
	END IF;
	RETURN b_id;
END $$
LANGUAGE PLPGSQL;

CREATE FUNCTION patch_order(b_id BIGINT, p_id BIGINT, delta SMALLINT) RETURNS VOID AS  $$
DECLARE
    curr_quantity smallint = (SELECT quantity FROM public."order" WHERE basket_id=b_id AND product_id=p_id);
BEGIN
    IF curr_quantity ISNULL THEN
        IF delta <= 0 THEN
            RAISE 'Order cannot be initialized with negative quantity, got %s', delta;
        END IF;
        INSERT INTO public."order" (basket_id, product_id, quantity) VALUES (b_id, p_id, delta);
    ELSE
        IF (curr_quantity + delta) > 0 THEN
            UPDATE public."order" SET quantity = curr_quantity + delta WHERE basket_id=b_id AND product_id=p_id;
        ELSE
            DELETE FROM public."order" WHERE basket_id=b_id AND product_id=p_id;
        END IF;
    END IF;
END $$
LANGUAGE PLPGSQL;
