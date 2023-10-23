-- Rodar esse sql após rodar o script python

insert into public.municipalities (code_muni, name_muni, code_state) values 
(5300109, 'Mojuí dos Campos', 15),
(5300110, 'Serra Caiada', 24),
(5300111, 'Joca Claudino', 25),
(5300112, 'São Vicente do Seridó', 25),
(5300113, 'Brazópolis', 31),
(5300114, 'Embu das Artes', 35),
(5300115, 'Balneário Rincão', 42),
(5300116, 'Pescaria Bravas', 42),
(5300117, 'Pinto Bandeira', 43),
(5300118, 'Paraíso das Águas', 50);

ALTER TABLE public.schools DROP COLUMN city_slug;
ALTER TABLE public.schools ALTER COLUMN date_update TYPE date USING date_update::date;
ALTER TABLE public.schools ALTER COLUMN code_state TYPE int4 USING code_state::int4;
ALTER TABLE public.schools ALTER COLUMN code_muni TYPE int4 USING code_muni::int4;
ALTER TABLE public.schools ALTER COLUMN code_school TYPE int4 USING code_school::int4;
ALTER TABLE public.schools ALTER COLUMN abbrev_state TYPE varchar USING abbrev_state::varchar;
ALTER TABLE public.schools ALTER COLUMN name_muni TYPE varchar USING name_muni::varchar;
ALTER TABLE public.schools ALTER COLUMN name_school TYPE varchar USING name_school::varchar;
ALTER TABLE public.schools ALTER COLUMN education_level TYPE varchar USING education_level::varchar;
ALTER TABLE public.schools ALTER COLUMN education_level_others TYPE varchar USING education_level_others::varchar;
ALTER TABLE public.schools ALTER COLUMN address TYPE varchar USING address::varchar;
ALTER TABLE public.schools ALTER COLUMN phone_number TYPE varchar USING phone_number::varchar;
ALTER TABLE public.schools ALTER COLUMN government_level TYPE varchar USING government_level::varchar;
ALTER TABLE public.schools ALTER COLUMN private_school_type TYPE varchar USING private_school_type::varchar;
ALTER TABLE public.schools ALTER COLUMN service_restriction TYPE varchar USING service_restriction::varchar;
ALTER TABLE public.schools ALTER COLUMN "size" TYPE varchar USING "size"::varchar;
ALTER TABLE public.schools ALTER COLUMN location_type TYPE varchar USING location_type::varchar;
ALTER TABLE public.schools ALTER COLUMN urban TYPE varchar USING urban::varchar;

ALTER TABLE public.schools ALTER COLUMN date_update TYPE varchar USING date_update::varchar;
ALTER TABLE public.schools DROP COLUMN name_muni;
ALTER TABLE public.schools DROP COLUMN abbrev_state;

ALTER TABLE public.metro_area ALTER COLUMN legislation_date TYPE date USING legislation_date::date;
ALTER TABLE public.metro_area ALTER COLUMN legislation TYPE varchar USING legislation::varchar;
ALTER TABLE public.metro_area ALTER COLUMN subdivision TYPE varchar USING subdivision::varchar;
ALTER TABLE public.metro_area ALTER COLUMN "type" TYPE varchar USING "type"::varchar;
ALTER TABLE public.metro_area ALTER COLUMN name_metro TYPE varchar USING name_metro::varchar;

ALTER TABLE schools ADD CONSTRAINT fk_muni_schools FOREIGN KEY (code_muni) REFERENCES municipalities(code_muni);
ALTER TABLE schools ADD CONSTRAINT fk_state_schools FOREIGN KEY (code_state) REFERENCES states(code_state);

ALTER TABLE metro_area  ADD CONSTRAINT fk_state_metro_area FOREIGN KEY (code_state) REFERENCES states(code_state);

ALTER TABLE municipalities  ADD CONSTRAINT fk_state_municipalities FOREIGN KEY (code_state) REFERENCES states(code_state);

ALTER TABLE states  ADD CONSTRAINT fk_regions_state FOREIGN KEY (code_region) REFERENCES regions(code_region);