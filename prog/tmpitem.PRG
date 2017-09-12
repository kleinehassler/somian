drop table tmp;

select * into table tmp from items ;

drop table items cascade;

CREATE TABLE items
(
  iditem int4 NOT NULL DEFAULT nextval(('"auxiliarescon_seq"'::text)::regclass),
  artgrupo int2 NOT NULL,
  artsgrupo int2,
  artmarca int2,
  artpeso float8,
  artsell float8,
  artcosto float8 DEFAULT 0,
  artfob float8,
  artcosto2 float8,
  artfob2 float8,
  issell bool,
  isbuy bool,
  isreturn bool,
  isfob bool,
  itipo int2 DEFAULT 0,
  iname varchar(140) NOT NULL,
  iunidad int4 NOT NULL,
  imoney int4 NOT NULL,
  isiva bool DEFAULT false,
  itag varchar(20) NOT NULL,
  icode int4,
  artipo int4,
  saldocon float8  DEFAULT 0,
  stockmin int4,
  stockmax int4,
  depre int2,
  isformato bool DEFAULT false,
  qtyunidad float8,
  isdesc bool DEFAULT false,
  iunidad3 int4 DEFAULT 0,
  iunidad2 int4 DEFAULT 0,
  icolor int4,
  CONSTRAINT items_pkey PRIMARY KEY (iditem),
  CONSTRAINT costonocero CHECK (artcosto >= 0::double precision),
  CONSTRAINT depre CHECK (depre >= 0 AND depre <= 100)
) 
WITHOUT OIDS;
ALTER TABLE items OWNER TO postgres;


-- Index: unicode

-- DROP INDEX unicode;

CREATE UNIQUE INDEX unicode
  ON items
  USING btree
  (icode);
  
insert into items select * from tmp;
  
ALTER TABLE detadoci ADD CONSTRAINT fk_items FOREIGN KEY (iditem) REFERENCES items (iditem)    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE preciosv ADD CONSTRAINT fk_items FOREIGN KEY (iditem) REFERENCES items (iditem)    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE producing ADD CONSTRAINT fk_items FOREIGN KEY (iditem) REFERENCES items (iditem)    ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE saldosi ADD CONSTRAINT fk_items FOREIGN KEY (iditem) REFERENCES items (iditem)    ON UPDATE CASCADE ON DELETE RESTRICT;

