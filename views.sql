begin;
DROP VIEW "vdocuret" cascade;
DROP VIEW "vdocuments" cascade;
DROP VIEW "vdocub" cascade;
DROP VIEW "reversodoc" cascade;
DROP VIEW "vdocumentg" cascade;
DROP VIEW "vsaldosi" cascade;
DROP VIEW "vsaldoscon" cascade;
DROP VIEW "vdiario" cascade;
DROP VIEW "vauxcon" cascade;
DROP VIEW "vdetagrus" cascade;
DROP VIEW "gatosgenl" cascade;
DROP VIEW "datosgens" cascade;
DROP VIEW "datosgeng" cascade;
DROP VIEW "vpreciosv" cascade;
DROP VIEW "vsecudoc" cascade;
DROP VIEW "vdocui" cascade;
DROP VIEW "vdetadoci" cascade;
DROP VIEW "vsujetos" cascade;
DROP VIEW "vplancta" cascade;
DROP VIEW "vitems" cascade;
DROP VIEW "vsuj" cascade;
DROP VIEW "vdocud" cascade;
DROP VIEW "vdetagru" cascade;
DROP VIEW "datosgenl" cascade;
DROP VIEW "datosgen" cascade;
DROP VIEW "vservicios" cascade;
DROP VIEW "varticulos" cascade;
DROP VIEW "varti" cascade;
DROP VIEW "vactivosfij" cascade;
DROP VIEW "vactivosf" cascade;
DROP VIEW "vconversion" cascade;
DROP VIEW "vhoraex" cascade;
DROP VIEW "vemple" cascade;
DROP VIEW "vsaldosban" cascade;
DROP VIEW "vctasb" cascade;
DROP VIEW "vproveedores" cascade;
DROP VIEW "vmonedas" cascade;
DROP VIEW "vrubros" cascade;
DROP VIEW "vdocmul" cascade;
DROP VIEW "vperiodos" cascade;
DROP VIEW "ambiempre" cascade;
DROP VIEW "vdocul" cascade;
DROP VIEW "vdocus" cascade;
DROP VIEW "vusuarios" cascade;
DROP VIEW "vempleados" cascade;
DROP VIEW "vclientes" cascade;
DROP VIEW "vsaldosb" cascade;
DROP VIEW "vworkstations" cascade;
DROP VIEW "vsritabla" cascade;
DROP VIEW "viewvar" cascade;
DROP VIEW "vctasban" cascade;
DROP VIEW "vsecuencias" cascade;
--DROP VIEW "vconproter" cascade;
--DROP VIEW "vsaldosc" cascade;
DROP VIEW "vdocusmall" cascade;
--DROP VIEW "vaneuret" cascade;
--DROP VIEW vdocup;
drop view vcheques;
DROP VIEW vcontenedor;
DROP VIEW vactividad;
drop view vhaciendas;


--
-- TOC entry 1383 (class 1259 OID 38924)
-- Dependencies: 1621 5
-- Name: ambiempre; Type: VIEW; Schema: public; Owner: postgres
--



CREATE VIEW ambiempre AS
    SELECT p.fecini, p.fecfin, p.pdocode, p.moneda, m.moname, p.nivelplan, p.isupdate, p.isopen, p.isajuste, p.swpreiva, 
    		p.confbod , p.cajero, p.swclilis, 
    CASE WHEN p.isupdate THEN 'PREDETERMINADO'::bpchar ELSE 'NO PREDETERMINADO'::bpchar END AS actual, CASE WHEN p.isopen THEN 'ABIERTO'::bpchar ELSE 'CERRADO'::bpchar END AS openx 
    FROM periodos p, monedas m 
    WHERE (p.moneda = m.mocode);



ALTER TABLE public.ambiempre OWNER TO postgres;
--
-- TOC entry 1408 (class 1259 OID 39008)
-- Dependencies: 1622 5
-- Name: datosgen; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW datosgen AS
    SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.gtable, g.idgrupo 
    FROM detagru d, grudat g 
    WHERE (d.idgrupo = g.idgrupo) ORDER BY g.gtag;


ALTER TABLE public.datosgen OWNER TO postgres;
--
-- TOC entry 1409 (class 1259 OID 39011)
-- Dependencies: 1623 5
-- Name: datosgeng; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW datosgeng AS
    SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo 
    FROM detagru d, grudat g 
    WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'G'::bpchar)) 
    ORDER BY g.gtag;


ALTER TABLE public.datosgeng OWNER TO postgres;

--
-- TOC entry 1410 (class 1259 OID 39014)
-- Dependencies: 1624 5
-- Name: datosgenl; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW datosgenl AS
    SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.gtable, g.idgrupo 
    FROM detagru d, grudat g 
    WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'L'::bpchar)) 
    ORDER BY g.gtag;


ALTER TABLE public.datosgenl OWNER TO postgres;

--
-- TOC entry 1411 (class 1259 OID 39017)
-- Dependencies: 1625 5
-- Name: datosgens; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW datosgens AS
    SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo 
    FROM detagru d, grudat g 
    WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'S'::bpchar)) ORDER BY g.gtag;


ALTER TABLE public.datosgens OWNER TO postgres;

--
-- TOC entry 1445 (class 1259 OID 39186)
-- Dependencies: 1626 5
-- Name: gatosgenl; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW gatosgenl AS
    SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo 
    FROM detagru d, grudat g 
    WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'L'::bpchar)) ORDER BY g.gtag;


ALTER TABLE public.gatosgenl OWNER TO postgres;
--
-- TOC entry 1478 (class 1259 OID 39310)
-- Dependencies: 1627 5
-- Name: reversodoc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW reversodoc AS
    SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, 
    f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva, f.swconta 
    FROM ((docuse f LEFT JOIN detagru d ON ((f.tipodoc = d.iddato))) LEFT JOIN detagru e ON ((f.subtipodoc = e.iddato)));


ALTER TABLE public.reversodoc OWNER TO postgres;

--
-- TOC entry 1503 (class 1259 OID 39397)
-- Dependencies: 1628 5
-- Name: vactivosf; Type: VIEW; Schema: public; Owner: postgres
--
CREATE OR REPLACE VIEW vactivosf AS 
 SELECT a.icode AS codigo, a.iname AS nombre, a.artpeso AS peso, a.artcosto AS costo, a.saldocon, a.isiva AS carga_iva, 
 	a.itag AS codigo_alt, u.descripda AS unidad, a.artmarca, c.descripda AS marca, g.descripda AS grupo, 
 	s.descripda AS subgrupo, m.moname, a.iditem, a.artgrupo, a.iunidad2, v.descripda AS unidad2, a.isformato
   FROM items a
   LEFT JOIN detagru u ON a.iunidad = u.iddato
   LEFT JOIN monedas m ON a.imoney = m.mocode
   LEFT JOIN detagru c ON a.artmarca = c.iddato
   LEFT JOIN detagru g ON a.artgrupo = g.iddato
   LEFT JOIN detagru s ON a.artsgrupo = s.iddato
   LEFT JOIN detagru v ON a.iunidad2 = v.iddato
  WHERE a.itipo = 1 AND g.valorda::text = 'AF'::text;

ALTER TABLE vactivosf OWNER TO postgres;

--
-- TOC entry 1504 (class 1259 OID 39401)
-- Dependencies: 1629 5
-- Name: vactivosfij; Type: VIEW; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW vactivosfij AS
    SELECT f.codact AS codigo, f.refer AS referencia, a.iname AS nombre_act, f.fecadq AS fecha_adq, 
    		f.fecent AS fecha_ent, s.idsujeto, s.sname AS nombre, 
    		f.ubicacion, f.code AS cod_docu, f.isbaja, f.numser AS numero_serie, 
    		f.costoh AS costo_his, f.costoa as costo_act, f.depacu, a.itag AS codigo_alt, u.descripda AS unidad, 
    		c.descripda AS marca, g.descripda AS grupo, f.depre AS por_depre, f.ismensual, f.idactivo, 
    		f.iditem, a.icode, f.estado, f.codebaj, f.capacidad, f.fecven
    FROM (((((activosf f LEFT JOIN sujetos s ON ((f.idsujeto = s.idsujeto))) 
    					 LEFT JOIN items a ON ((f.iditem = a.iditem))) 
    					 LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) 
    					 LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) 
    					 LEFT JOIN detagru g ON ((a.artgrupo = g.iddato)));


ALTER TABLE public.vactivosfij OWNER TO postgres;

--
-- TOC entry 1505 (class 1259 OID 39405)
-- Dependencies: 1630 5
-- Name: vsecudoc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsecudoc AS 
 SELECT DISTINCT e.idsecudoc, e.iddocu, e.idautosri, e.nota, d.cretri, d.ivaxitem, d.lispre, a.numauto, a.fcaducidad, 
 	a.desde, a.hasta, a.femision, a.activo, d.pdocode, d.tipodoc, d.subtipodoc, d.tipsaldo, u.serie, d.dtag, d.items, 
 	d.sujetos, d.usuarios, d.bancos, d.otros, d.pagos, d.documentos, d.tipitem, d.auxcode, d.nomdoc, d.swaneiva, d.swiva, 
 	d.swdesc, d.swcosto, d.swkar, d.swconta, d.swprint, d.swclose, d.tipcosto, d.idsritabla, i.descripda AS tipo, 
 	s.descripda AS subtipo, d.clasedoc, e.estado, u.numese AS numactual, u.idsecu, d.ajucon, d.iscero, 
 	u.tipper, u.tipnum, u.reinicia, u.manual, substr(u.descrip::text, 1, 10)::character(10) AS descripser, f.reporte, 
 	f.idimage, d.isdevo, d.istransfer, d.numregdet, d.tipliq
   FROM secudoc e
   LEFT JOIN docuse d ON e.iddocu = d.iddocu
   LEFT JOIN secuencias u ON e.idsecu = u.idsecu
   LEFT JOIN docuse  r ON d.idreversodoc = r.iddocu
   LEFT JOIN detagru i ON d.tipodoc = i.iddato
   LEFT JOIN detagru s ON d.subtipodoc = s.iddato
   LEFT JOIN autosri a ON e.idautosri = a.idautosri
   LEFT JOIN imagenrep f ON e.idimage = f.idimage ;


ALTER TABLE vsecudoc OWNER TO postgres;

--
-- TOC entry 1506 (class 1259 OID 39409)
-- Dependencies: 1631 5
-- Name: vdocuments; Type: VIEW; Schema: public; Owner: postgres
--
CREATE  VIEW vdocuments AS 
 SELECT DISTINCT d.idugra, d.fecgra, d.code, d.succode, d.depcode, d.usercaja, d.userstore, d.num, d.idsecudoc, 
 d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.sujter, d.auxitem, d.duracion, 
 d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.recargo2, d.recargo3, 
 d.flete, d.subconiva, tipitem, d.chofer, f.sname as chname, f.scedula as chcedula, f.sruc as chruc, nrec, comenanu, 
 d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, 
 d.isguia, d.isupdate, d.islock, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, 
 d.isreversado, d.concepto, k.afecha AS feccon, b.descripda AS bodega, z.tipsaldo, z.iddocu, z.nomdoc, z.iscero, 
 z.dtag, z.swaneiva, z.tipnum, z.swkar, z.swconta, z.idsritabla, z.ajucon, d.serie, d.numauto, d.fcaducidad, s.scel, s.stelf, 
 s.saddr, s.saddr2, s.scode, s.ssri, s.sname, s.srepre, s.sruc, s.scedula, ci.descripda AS sciudad, s.spasaporte, 
 j.sname AS vendedor, 
 u.sname AS nombreu, u.observ, monedas.moname AS moneda, d.pflag, d.dflag, d.idws, q.reporte, q.proceso, q.impresora,
 t.scode as codter, t.sname as nombret, z.isdevo, z.istransfer, z.documentos, 0 as codprin, 0 as codgar, '' as principal, 
 '' as garante, r.sname as recaudador, 0 as idprin, 0 as idgar, c2.descripda as ciudad2, s.diasplz, a.sname as cajero, 
 i.descripda as parroquia, e.descripda as sector, v.descripda as provincia, s.calific, s.sforpag,  z.cretri, 
 h.nombre as hacienda
   FROM documents d
   LEFT JOIN detagru b ON d.userstore = b.iddato
   LEFT JOIN asientosdia k ON d.code = k.code
   LEFT JOIN vsecudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN imagenrep q ON z.idimage = q.idimage
   LEFT JOIN sujetos u ON d.idugra = u.idsujeto
   LEFT JOIN periodos o ON d.pdocode = o.pdocode
   LEFT JOIN monedas ON o.moneda = monedas.mocode
   LEFT JOIN sujetos s ON d.cliente = s.idsujeto
   LEFT JOIN sujetos j ON d.seller = j.idsujeto
   LEFT JOIN sujetos r ON d.casher = r.idsujeto
   LEFT JOIN detagru ci ON s.sciudad = ci.iddato
   LEFT JOIN detagru c2 ON s.sciudad2 = c2.iddato
   LEFT JOIN detagru i ON s.parroquia = i.iddato
   LEFT JOIN detagru e ON s.sector = e.iddato
   left join detagru v on s.sprov = v.iddato
   LEFT JOIN sujetos a ON d.usercaja = a.idsujeto
   LEFT JOIN sujetos t ON d.sujter = t.idsujeto 
   LEFT JOIN sujetos f ON d.chofer = f.idsujeto
   left join haciendas h on d.idhacienda=h.idhacienda;

--
-- TOC entry 1507 (class 1259 OID 39413)
-- Dependencies: 1632 5
-- Name: vaneuret; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vaneuret AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie2 AS seriedoc, d.numsecue2 AS numsecdoc, 
 	d.secueret, d.numserie3, d.numauto3, d.fcaducidad3, d.idws, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, 
 	u.scedula, u.saddr, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc, d.codigoret, d.porcenret,
 	d.fimpresion
   FROM aneiva d
   LEFT JOIN vdocuments u ON d.code = u.code
   LEFT JOIN cobros c ON c.code = d.code
   LEFT JOIN rubros r ON c.rubcode = r.rubcode
   LEFT JOIN sritabla s ON d.idtipdoc = s.idsritabla
   LEFT JOIN detagru g ON s.iddato = g.iddato
   LEFT JOIN secudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN ( SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva
   FROM detagru d, detagru e, docuse f
  WHERE f.tipodoc = d.iddato AND f.subtipodoc = e.iddato) v ON z.iddocu = v.iddocu
  WHERE r.isdocret;

ALTER TABLE vaneuret OWNER TO postgres;
--
-- TOC entry 1510 (class 1259 OID 39422)
-- Dependencies: 1633 5
-- Name: varti; Type: VIEW; Schema: public; Owner: postgres
--
CREATE  VIEW varti AS 
 SELECT a.icode AS codigo, a.iname AS nombre, a.artpeso AS peso, a.artcosto AS costo, a.saldocon, a.isiva AS carga_iva, 
 	a.itag AS codigo_alt, u.descripda AS unidad, a.artmarca, c.descripda AS marca, g.descripda AS grupo, 
 	s.descripda AS subgrupo, m.moname, a.iditem, a.artgrupo, a.artsgrupo, iunidad2, v.descripda as unidad2, a.isformato, 
 	p.descripda as promocion, b.descripda as ubipro, e.descripda as ubica2, t.descripda as cntbulto, a.isservicio
   FROM items a
   LEFT JOIN detagru u ON a.iunidad = u.iddato
   LEFT JOIN monedas m ON a.imoney = m.mocode
   LEFT JOIN detagru c ON a.artmarca = c.iddato
   LEFT JOIN detagru g ON a.artgrupo = g.iddato
   LEFT JOIN detagru s ON a.artsgrupo = s.iddato
   LEFT JOIN detagru p ON a.promocion = p.iddato
   left join detagru v on a.iunidad2=v.iddato 
   left join detagru b on a.ubica=b.iddato
   left join detagru e on a.ubica2=e.iddato
   left join detagru t on a.cntbulto=t.iddato
  WHERE a.itipo = 1 AND g.valorda::text = 'PT'::text;

ALTER TABLE varti OWNER TO postgres;

--
-- TOC entry 1511 (class 1259 OID 39426)
-- Dependencies: 1634 5
-- Name: varticulos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW varticulos AS
    SELECT a.iname, a.icode AS auxcon, f.descripda AS genero, a.iname AS auxiliar, a.artpeso, a.artsell, a.artcosto, 
    a.artfob, a.artcosto2, a.artfob2, a.issell, a.isbuy, a.isreturn, a.isfob, a.isformato, a.imoney, a.isiva, a.itag, 
    a.icode, u.descripda AS unidad, x.descripda AS unidad2, y.descripda AS unidad3, c.descripda AS marca, a.artmarca, 
    g.descripda AS grupo, s.descripda AS subgrupo, m.moname, a.iditem, a.artgrupo, a.iunidad, a.iunidad2, a.iunidad3,
    a.costopro, a.artsgrupo, b.descripda as ubipro, e.descripda as ubica2, t.descripda as cntbulto, a.isservicio
    FROM items a LEFT JOIN detagru u ON (a.iunidad = u.iddato) 
    			 LEFT JOIN detagru x ON (a.iunidad2 = x.iddato) 
    			 LEFT JOIN detagru y ON (a.iunidad3 = y.iddato) 
    			 LEFT JOIN monedas m ON (a.imoney = m.mocode) 
    			 LEFT JOIN detagru c ON (a.artmarca = c.iddato) 
    			 LEFT JOIN detagru g ON (a.artgrupo = g.iddato) 
    			 LEFT JOIN detagru s ON (a.artsgrupo = s.iddato) 
    			 LEFT JOIN detagru f ON (a.artipo = f.iddato) 
    			 left join detagru b on a.ubica=b.iddato
   				 left join detagru e on a.ubica2=e.iddato
   				 left join detagru t on a.cntbulto=t.iddato
    WHERE (a.itipo = 1);


ALTER TABLE public.varticulos OWNER TO postgres;

--
-- TOC entry 1512 (class 1259 OID 39430)
-- Dependencies: 1635 5
-- Name: vitems; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vitems AS 
 SELECT a.iditem, a.artgrupo, a.artsgrupo, a.artipo, a.artmarca, a.artpeso, a.artsell, a.artcosto, a.artfob, a.artcosto2, 
 	a.artfob2, a.issell, a.isbuy, a.isreturn, a.isfob, a.isformato, a.itipo, a.iname, a.iunidad, a.iunidad2, a.iunidad3, 
 	a.imoney, a.isiva, a.isdesc, a.itag, a.icode, a.depre, a.saldocon, u.descripda AS unidad, v.descripda as unidad2, 
 	w.descripda as unidad3, c.descripda AS marca, c.valorda AS valordamar, g.valorda AS valordagru, g.descripda AS grupo, 
 	m.moname, a.icode AS auxcon, f.descripda AS genero, a.iname AS auxiliar, p.descripda as promocion, a.isperecible, 
 	a.costopro, s.descripda as subgrupo, pvp, numeconver, denoconver, qtyxmayor, b.descripda as ubipro, e.descripda as ubica2, 
 	t.descripda as cntbulto, isservicio, 
 	case when numeconver>0 then denoconver/numeconver else 0 end as factorc
   FROM items a
   LEFT JOIN detagru u ON a.iunidad = u.iddato
   LEFT JOIN monedas m ON a.imoney = m.mocode
   LEFT JOIN detagru c ON a.artmarca = c.iddato
   LEFT JOIN detagru g ON a.artgrupo = g.iddato
   LEFT JOIN detagru s ON a.artsgrupo = s.iddato
   LEFT JOIN detagru f ON a.artipo = f.iddato
   left join detagru v on a.iunidad2=v.iddato
   left join detagru w on a.iunidad3=w.iddato
   left join detagru b on a.ubica=b.iddato
   left join detagru e on a.ubica2=e.iddato
   left join detagru t on a.cntbulto=t.iddato
   left join conversion r on (a.iunidad=r.iddato2 and a.iunidad2=r.iddato1)
   left join detagru p on a.promocion=p.iddato; 


ALTER TABLE public.vitems OWNER TO postgres;
--
-- TOC entry 1513 (class 1259 OID 39434)
-- Dependencies: 1636 5
-- Name: vauxcon; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vauxcon AS
    SELECT DISTINCT a.tipo, a.idauxiliar, (substr(a.auxiliar, 2, 5))::character(5) AS auxiliar, a.auxname FROM (((SELECT DISTINCT 'B'::bpchar AS tipo, c.idcuenta AS idauxiliar, to_char(c.numaux, ('09999'::bpchar)::text) AS auxiliar, ((btrim((b.descripda)::text, ' '::text) || ' '::text) || ((c.nucuban)::character varying(15))::text) AS auxname FROM detagru b, ctasban c WHERE (c.idbanco = b.iddato) ORDER BY 1, c.idcuenta, to_char(c.numaux, ('09999'::bpchar)::text), ((btrim((b.descripda)::text, ' '::text) || ' '::text) || ((c.nucuban)::character varying(15))::text)) UNION (SELECT DISTINCT 'S'::bpchar AS tipo, s.idsujeto AS idauxiliar, to_char(s.scode, ('09999'::bpchar)::text) AS auxiliar, CASE WHEN (char_length(btrim((s.sname)::text, ' '::text)) = 0) THEN s.ssri ELSE s.sname END AS auxname FROM sujetos s ORDER BY 1, s.idsujeto, to_char(s.scode, ('09999'::bpchar)::text), CASE WHEN (char_length(btrim((s.sname)::text, ' '::text)) = 0) THEN s.ssri ELSE s.sname END)) UNION (SELECT DISTINCT 'I'::bpchar AS tipo, i.iditem AS idauxiliar, to_char(i.icode, ('09999'::bpchar)::text) AS auxiliar, i.iname AS auxname FROM vitems i ORDER BY 1, i.iditem, to_char(i.icode, ('09999'::bpchar)::text), i.iname)) a ORDER BY a.tipo, (substr(a.auxiliar, 2, 5))::character(5), a.idauxiliar, a.auxname;


ALTER TABLE public.vauxcon OWNER TO postgres;
--
-- TOC entry 1514 (class 1259 OID 39438)
-- Dependencies: 1637 5
-- Name: vclientes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vclientes AS
    SELECT sujetos.scode, CASE WHEN (char_length(btrim((sujetos.sname)::text, ''::text)) = 0) THEN sujetos.ssri ELSE sujetos.sname END AS sname, sujetos.stag, sujetos.scedula, sujetos.sruc, sujetos.ssri, sujetos.saddr, sujetos.stelf, sujetos.isempleado, sujetos.isproveedor, sujetos.isproductor, sujetos.idsujeto FROM sujetos WHERE sujetos.iscliente ORDER BY sujetos.sname, sujetos.ssri;


ALTER TABLE public.vclientes OWNER TO postgres;
--
-- TOC entry 1515 (class 1259 OID 39441)
-- Dependencies: 1638 5
-- Name: vconversion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vconversion AS
    SELECT m.descripda AS medida, c.numeconver, c.denoconver, e.descripda AS equivale, c.idconversion FROM (("conversion" c LEFT JOIN detagru m ON ((c.iddato1 = m.iddato))) LEFT JOIN detagru e ON ((c.iddato2 = e.iddato))) ORDER BY m.descripda;


ALTER TABLE public.vconversion OWNER TO postgres;

--
-- TOC entry 1516 (class 1259 OID 39444)
-- Dependencies: 1639 5
-- Name: vctasb; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vctasb AS
    SELECT DISTINCT c.nucuban AS numero, b.descripda AS banco, c.ticuban AS tipo, m.moname AS moneda, c.numaux AS num_auxiliar, c.idcuenta FROM ((ctasban c LEFT JOIN detagru b ON ((c.idbanco = b.iddato))) LEFT JOIN monedas m ON ((c.mone = m.mocode))) ORDER BY c.nucuban, b.descripda, c.ticuban, m.moname, c.numaux, c.idcuenta;


ALTER TABLE public.vctasb OWNER TO postgres;

--
-- TOC entry 1517 (class 1259 OID 39447)
-- Dependencies: 1640 5
-- Name: vctasban; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vctasban AS
    SELECT DISTINCT c.nucuban, b.descripda AS banco, c.ticuban, m.moname AS moneda, c.numaux, c.idcuenta 
    FROM ((ctasban c LEFT JOIN detagru b ON ((c.idbanco = b.iddato))) LEFT JOIN monedas m ON ((c.mone = m.mocode))) ORDER BY c.nucuban, b.descripda, c.ticuban, m.moname, c.numaux, c.idcuenta;


ALTER TABLE public.vctasban OWNER TO postgres;

--
-- TOC entry 1518 (class 1259 OID 39450)
-- Dependencies: 1641 5
-- Name: vdetadoci; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdetadoci AS
    SELECT t.code, i.iditem, i.icode, i.iname, i.marca, i.grupo, i.genero, i.itipo, i.iname AS auxiliar, i.icode AS auxcon, 
    		t.punitario, i.unidad, i.artgrupo, t.qty, i.ubipro,  t.valor AS subtot, t.valconiva, t.descuento, t.qtyactivo, t.isiva, 
    		t.artcosto, i.depre, t.pordes, t.impuesto, t.secuencia, t.idcontenedor, t.comenta 
    FROM (detadoci t LEFT JOIN vitems i ON ((t.iditem = i.iditem)));


ALTER TABLE public.vdetadoci OWNER TO postgres;

--
-- TOC entry 1519 (class 1259 OID 39454)
-- Dependencies: 1642 5
-- Name: vdetagru; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdetagru AS
    SELECT d.descripda AS dato, g.gtag AS codigo_g, g.descripgru AS grupo, g.tipo, d.valorda AS valor_a, d.iddato 
    FROM detagru d, grudat g WHERE (d.idgrupo = g.idgrupo) ORDER BY g.gtag;


ALTER TABLE public.vdetagru OWNER TO postgres;

--
-- TOC entry 1520 (class 1259 OID 39457)
-- Dependencies: 1643 5
-- Name: vdetagrus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdetagrus AS
    SELECT d.descripda AS dato, g.gtag AS codigo_g, g.descripgru AS grupo, g.tipo, d.valorda AS valor_a, d.iddato 
    FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'G'::bpchar)) ORDER BY g.gtag;


ALTER TABLE public.vdetagrus OWNER TO postgres;

--
-- TOC entry 1521 (class 1259 OID 39460)
-- Dependencies: 1644 5
-- Name: vplancta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vplancta AS
    SELECT c.descripda AS cuenta, p.plantype, p.plannivel, p.auxcode, p.isdet, p.negativo,
	p.idplancuenta, p.idcuenta, p.pdocode, p.auxite, p.auxsuj, 
    CASE WHEN (p.plannivel = 1) THEN substr((p.plancod)::text, 2, 1) 
    	 WHEN (p.plannivel = 2) THEN (substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) 
    	 WHEN (p.plannivel = 3) THEN (((substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) || '.'::text) || substr((p.plancod)::text, 5, 2)) 
    	 WHEN (p.plannivel = 4) THEN (((((substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) 
    	 WHEN (p.plannivel = 5) THEN (((((((substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) 
    	 WHEN (p.plannivel = 6) THEN (((((((((substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) || '.'::text) || substr((p.plancod)::text, 11, 2)) 
    	 ELSE ((((((((((substr((p.plancod)::text, 2, 1) ||'.'|| substr((p.plancod)::text, 3, 2)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) || substr((p.plancod)::text, 11, 2)) || '.'::text) || substr((p.plancod)::text, 13, 2)) END AS plancod
    FROM (plancuenta p LEFT JOIN detagru c ON ((p.idcuenta = c.iddato))) 
    ORDER BY p.plancod;


ALTER TABLE public.vplancta OWNER TO postgres;

--
-- TOC entry 1522 (class 1259 OID 39463)
-- Dependencies: 1645 5
-- Name: vdiario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdiario AS
    SELECT a.pdocode, a.code, a.numasi, p.plancod, d.fecha as afecha, d.isanulado, p.idplancuenta, p.cuenta AS nomcta, 
    	p.auxcode, x.auxiliar, x.auxname, p.plannivel, m.idaux, m.debe, m.haber, m.idasimov, m.coded, p.negativo
    FROM asientosdia a LEFT JOIN asientosmov m ON a.idasiento = m.idasiento
   					  LEFT JOIN vplancta p ON m.idcta = p.idplancuenta 
   					  LEFT JOIN vauxcon x ON m.idaux = x.idauxiliar 
   					  left join documents d on (a.code=d.code)
   	where not d.isanulado ;


ALTER TABLE public.vdiario OWNER TO postgres;

CREATE VIEW vdiariocta AS
    SELECT a.pdocode, a.code, a.numasi, p.plancod, d.fecha as afecha, d.isanulado, p.idplancuenta, p.cuenta AS nomcta, 
    	p.auxcode, p.plannivel, m.idaux, m.debe, m.haber, m.idasimov, m.coded, p.negativo
    FROM asientosdia a LEFT JOIN asientosmov m ON a.idasiento = m.idasiento
   					  LEFT JOIN vplancta p ON m.idcta = p.idplancuenta 
   					  left join documents d on (a.code=d.code)
   	where not d.isanulado ;


ALTER TABLE public.vdiariocta OWNER TO postgres;

--
-- TOC entry 1523 (class 1259 OID 39467)
-- Dependencies: 1646 5
-- Name: vdocmul; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocmul AS
    SELECT d.nrodoc, d.iddocu, d.fecha, d.pdocode, d.subtotal, d.idsujeto, d.codusu, d.observac, d.isprint, d.isanulado, 
    d.fecgra, d.isgenerado, d.iscancelado, d.isaccount, d.numero, o.nomdoc, o.dtag, s.scode AS scodeb, 
    CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS beneficiario, t.idsujeto AS idsujetod, CASE WHEN (char_length(btrim((u.sname)::text, ''::text)) = 0) THEN u.ssri ELSE u.sname END AS sname, u.scode, t.valor, t.cant, (t.valor * t.cant) AS subtotald, t.code FROM (((((docmul d LEFT JOIN sujetos s ON ((d.idsujeto = s.idsujeto))) LEFT JOIN docuse o ON ((d.iddocu = o.iddocu))) LEFT JOIN periodos p ON ((d.pdocode = p.pdocode))) LEFT JOIN docmuld t ON ((d.nrodoc = t.nrodoc))) LEFT JOIN sujetos u ON ((t.idsujeto = u.idsujeto)));


ALTER TABLE public.vdocmul OWNER TO postgres;

--
-- TOC entry 1524 (class 1259 OID 39471)
-- Dependencies: 1647 5
-- Name: vdocub; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocub AS
    SELECT t.code, i.nucuban, i.ticuban, k.descripda AS banco, t.isanulado, t.idcuenta, t.nudocban, t.cbenef, 
    t.cconce, t.fecdoc, t.punitario, t.qty, t.isanulado AS docanulado, t.isconfbanc, t.isprotesto, t.isconciliado, 
    t.isprint AS isprintb, t.tipodoc, t.fecpag, t.isposfec, t.isconpos, t.isdet, t.secuencia, r.dtag, r.nomdoc, t.fecha, 
    t.isaccount, i.numaux
    FROM (((detadocb t LEFT JOIN ctasban i ON ((t.idcuenta = i.idcuenta))) 
    				   LEFT JOIN detagru k ON ((i.idbanco = k.iddato))) 
    				   LEFT JOIN reversodoc r ON ((t.tipodoc = r.iddocu))) ;


ALTER TABLE public.vdocub OWNER TO postgres;

--
-- TOC entry 1525 (class 1259 OID 39475)
-- Dependencies: 1648 5
-- Name: vdocud; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocud AS
SELECT DISTINCT y.code, y.coded, y.saldoant, y.valort, y.tipoie, d.idugra, d.fecgra, d.succode, d.depcode, d.usercaja, 
d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.sujter, d.auxitem, 
d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.recargo2, 
d.recargo3, d.flete, d.nrec, 
d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, 
d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, 
d.concepto, k.afecha AS feccon, b.descripda AS bodega, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, 
v.swaneiva, s.scode, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS sname, 
s.sruc, s.scedula, s.spasaporte, u.sname AS nombreu, u.scode AS codeu, monedas.moname AS moneda, r.rubname, r.rubcode, 
v.isdevo, v.istransfer
FROM ((((((((((detadocd y 	LEFT JOIN documents d ON ((y.coded = d.code))) 
				LEFT JOIN detagru b ON ((d.userstore = b.iddato))) 
				LEFT JOIN asientosdia k ON ((d.code = k.code))) 
				LEFT JOIN secudoc z ON ((d.idsecudoc = z.idsecudoc))) 
				LEFT JOIN docuse v ON ((z.iddocu = v.iddocu))) 
				LEFT JOIN sujetos u ON ((d.idugra = u.idsujeto))) 
				LEFT JOIN periodos o ON ((d.pdocode = o.pdocode))) 
				LEFT JOIN monedas ON ((o.moneda = monedas.mocode))) 
				LEFT JOIN sujetos s ON ((d.cliente = s.idsujeto))) 
				left join rubros r on (y.rubcode=r.rubcode));


ALTER TABLE public.vdocud OWNER TO postgres;

--
-- TOC entry 1526 (class 1259 OID 39479)
-- Dependencies: 1649 5
-- Name: vdocui; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vdocui AS 
 SELECT t.code, i.iditem, i.icode, i.iname, i.marca, i.grupo, i.subgrupo, i.itag, i.genero, i.itipo, i.iname AS auxiliar, 
 	i.icode AS auxcon, t.punitario, i.unidad, i.artgrupo, i.artmarca, t.qty, t.valor AS subtot, t.valconiva, t.descuento, 
 	t.qtyactivo, t.isiva, t.qtybodega, t.artcosto, i.depre, t.pordes, t.impuesto, i.iunidad, i.unidad2, i.iunidad2, 
 	i.isformato, t.secuencia, t.idcontenedor, t.fecven, i.isperecible, t.qtypromo, i.artpeso, t.comenta, i.artsgrupo,
 	i.pvp, i.factorc, i.numeconver, i.denoconver, i.isiva as isivai, i.ubipro, i.ubica2, i.isservicio
   FROM detadoci t
   LEFT JOIN vitems i ON t.iditem = i.iditem;

ALTER TABLE vdocui OWNER TO postgres;
--
-- TOC entry 1527 (class 1259 OID 39483)
-- Dependencies: 1650 5
-- Name: vdocul; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocul AS
    SELECT d.code, r.rubtab, r.rubname, d.valor, d.tie FROM (detadocl d LEFT JOIN rubros r ON ((d.rubcode = r.rubcode)));


ALTER TABLE public.vdocul OWNER TO postgres;

--
-- TOC entry 1528 (class 1259 OID 39486)
-- Dependencies: 1651 5
-- Name: vdocumentg; Type: VIEW; Schema: public; Owner: postgres
--
CREATE  VIEW vdocumentg AS 
 SELECT DISTINCT d.code, s.sname AS nombre, v.nomdoc AS documento, d.num, s.scode AS cod_persona, s.ssri AS sri, 
 	a.numsecue2 as numfacadq, 
 	s.sruc AS ruc, s.scedula AS cedula, r.sname AS vendedor, d.fecha, d.linkdoc, d.valcuota, d.numcuota, d.poriva, 
 	d.subtotal, d.ivavalor, d.ivabienes, d.montototal, d.saldo, d.tmpsaldo AS saldo_inic, d.isprint AS impreso, 
 	d.isaccount AS contabilizado, d.ispagado AS cancelado, d.isanulado AS anulado, d.islock, d.isautorizado AS autorizado, 
 	d.concepto, k.afecha AS fec_conta, d.ffrom AS desde, d.fto AS hasta, d.fecgra AS fec_grabac, b.descripda AS bodega, 
 	v.dtag, d.pdocode, z.isdevo, z.istransfer, p.scode as codprin, g.scode as codgar, p.sname as principal, 
 	g.sname as garante, d.chofer, d.nrec 
   FROM documents d
   left join aneiva a on d.code=a.code
   LEFT JOIN detagru b ON d.userstore = b.iddato
   LEFT JOIN asientosdia k ON d.code = k.code
   LEFT JOIN vsecudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN docuse  v ON z.iddocu = v.iddocu
   LEFT JOIN sujetos s ON d.cliente = s.idsujeto
   LEFT JOIN sujetos r ON d.seller = r.idsujeto
   LEFT JOIN sujetos t ON d.sujter = t.idsujeto 
   LEFT JOIN sujetos p ON s.codprin = p.idsujeto
   LEFT JOIN sujetos g ON s.codgar = g.idsujeto ;


ALTER TABLE public.vdocumentg OWNER TO postgres;

--
-- TOC entry 1529 (class 1259 OID 39490)
-- Dependencies: 1652 5
-- Name: vdocusmall; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vdocusmall AS 
 SELECT DISTINCT d.code, d.userstore, d.usercaja, d.num, d.cliente, d.fecha, d.fto, d.pdocode, d.idsecudoc, d.seller, 
 		d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.recargo2, d.recargo3, 
 		d.flete, d.subtotal, d.subconiva, d.chofer, nrec, d.comenanu, v.iscero, u.calific, u.sforpag, u.diasplz, 
 		d.subsiniva, d.ivavalor, d.ivabienes, d.montototal, d.icevalor, d.ipsvalor, d.saldo, d.tmpsaldo, d.isaccount, 
 		d.isprint, d.islock, d.ispagado, d.isanulado, d.isautorizado, d.concepto, v.tipitem,v.tipsaldo, v.iddocu, v.nomdoc, 
 		v.dtag, v.swaneiva, v.idsritabla, v.swkar, v.documentos, d.serie, d.fcaducidad, u.scode, u.ssri, u.sname, u.sruc, 
 		u.scedula, u.saddr, u.sciudad, u.observ, d.pflag, d.dflag, d.idws, v.cretri, v.swconta, v.swcostov, d.duracion, d.isreversado, d.idugra, 
 		t.sname as nombret, v.isdevo, v.istransfer, d.casher, 0 as codprin, 0 as codgar, '' as principal, '' as garante,
 		0 as idprin, 0 as idgar, d.sujter, v.ajucon   
   FROM documents d
   LEFT JOIN secudoc s ON d.idsecudoc = s.idsecudoc
   LEFT JOIN docuse v ON s.iddocu = v.iddocu
   LEFT JOIN sujetos u ON d.cliente = u.idsujeto
   LEFT JOIN sujetos t ON d.sujter  = t.idsujeto;



ALTER TABLE public.vdocusmall OWNER TO postgres;

--
-- TOC entry 1530 (class 1259 OID 39494)
-- Dependencies: 1653 5
-- Name: vdocuret; Type: VIEW; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW vdocuret AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, 
	d.numsecue1 AS numsecdoc, d.numsecue2, d.secueret, d.autoret, d.fcaducret, d.numserie2, 
	d.numauto2 as numautadq, d.fecha2 as fecdocadq, fcaducidad2 as feccadadq, 
	s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, u.sciudad, 
	u.stelf, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc, i.codigo as codigoret,
	d.fimpresion
   FROM aneiva d
   LEFT JOIN vdocuments u ON d.code = u.code
   LEFT JOIN cobros c ON c.code = d.code
   left join sritabla i on c.idsritabla=i.idsritabla
   LEFT JOIN rubros r ON c.rubcode = r.rubcode
   LEFT JOIN sritabla s ON d.idtipdoc = s.idsritabla
   LEFT JOIN detagru g ON s.iddato = g.iddato
   LEFT JOIN secudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN reversodoc v ON z.iddocu = v.iddocu
  WHERE c.isdocret;

ALTER TABLE vdocuret OWNER TO postgres;

--
-- TOC entry 1531 (class 1259 OID 39498)
-- Dependencies: 1654 5
-- Name: vdocus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vdocus AS
    SELECT t.code, i.sname AS snamed, i.ssri AS ssrid, i.scode, i.idsujeto, t.punitario, t.qty, t.idcheque 
    FROM (detadocs t LEFT JOIN sujetos i ON ((t.idsujeto = i.idsujeto)));


ALTER TABLE public.vdocus OWNER TO postgres;

--
-- TOC entry 1532 (class 1259 OID 39501)
-- Dependencies: 1655 5
-- Name: vdocuse; Type: VIEW; Schema: public; Owner: postgres
--
CREATE VIEW vdocuse AS 
 SELECT d.iddocu, d.pdocode, d.tipodoc, d.subtipodoc, d.idreversodoc, d.dtag, d.bancos, d.usuarios, d.otros,  d.sujetos, 
 d.clasedoc, d.tipsaldo, d.items, d.documentos, d.nomdoc, d.grudoc, d.swaneiva, d.ninguno, d.rubrol, d.tipitem, d.swiva, 
 d.swdesc, d.swcosto, d.tipcosto, d.swkar, d.descrip, d.lispre, d.ivaxitem, d.swconta, d.idsritabla, d.swtransfer, 
 d.cretri, d.swprint, d.swclose, d.pagos, d.swauto, p.auxcode, t.debehaber, t.sujaux, t.issaldo, t.isinicial, 
 i.descripda AS tipo, s.descripda AS subtipo, r.nomdoc AS reversodoc, p.cuenta, d.ajucon, d.iscero, 
 p.plancod, p.idplancuenta, u.rubname, l.cuenta AS ctaitem, l.plancod AS plancodite, a.descripda AS tipoart, 
 c.debehaber AS dhitem, d.isdevo, d.istransfer, d.tipliq 
   FROM docuse d  LEFT JOIN ddocuse t ON d.iddocu = t.iddocu
   LEFT JOIN docuse  r ON d.idreversodoc = r.iddocu
   LEFT JOIN detagru i ON d.tipodoc = i.iddato
   LEFT JOIN detagru s ON d.subtipodoc = s.iddato
   LEFT JOIN vplancta p ON t.idplancuenta = p.idplancuenta
   LEFT JOIN rubros u ON t.rubcode = u.rubcode
   LEFT JOIN dcontitem c ON t.iddocuse = c.iddocuse
   LEFT JOIN vplancta l ON c.idplancuenta = l.idplancuenta
   LEFT JOIN detagru a ON c.artgrupo = a.iddato
  WHERE t.idplancuenta > 0
  ORDER BY d.nomdoc, p.plancod;

ALTER TABLE public.vdocuse OWNER TO postgres;

--
-- TOC entry 1533 (class 1259 OID 39505)
-- Dependencies: 1656 5
-- Name: vemple; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vemple AS
    SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, 
    s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, 
    s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, s.idsujeto 
    FROM ((sujetos s LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) LEFT JOIN detagru p ON ((s.sprov = p.iddato))) 
    WHERE s.isempleado;


ALTER TABLE public.vemple OWNER TO postgres;

--
-- TOC entry 1534 (class 1259 OID 39509)
-- Dependencies: 1657 5
-- Name: vempleados; Type: VIEW; Schema: public; Owner: postgres
--
 
CREATE VIEW vempleados AS
    SELECT s.scode, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS sname, 
    	s.scedula, s.sruc, e.emsexo, c.descripda AS cargo, e.emsueldo, e.emnumcar, v.descripda AS estciv, e.emnumiess, 
    	e.emfecing, e.emfecnac, e.emfecsal, e.emcodocuiess, e.emnumcta, e.emtipcta, d.descripda AS departamento, 
    	e.emisiess, t.descripda AS titulo, e.emisactivo, s.idsujeto, e.emcoddep, e.emhoex, e.cuotapres
    	FROM ((((( empleados e LEFT JOIN sujetos s ON ((e.idsujeto = s.idsujeto))) 
    						   LEFT JOIN detagru c ON ((e.emcargo = c.iddato))) 
    						   LEFT JOIN detagru t ON ((e.emcodtit = t.iddato))) 
    						   LEFT JOIN detagru d ON ((e.emcoddep = d.iddato))) 
    						   LEFT JOIN detagru v ON ((e.emestciv = v.iddato))) 
    WHERE s.isempleado;


ALTER TABLE public.vempleados OWNER TO postgres;

--
-- TOC entry 1535 (class 1259 OID 39513)
-- Dependencies: 1658 5
-- Name: vhoraex; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vhoraex AS
    SELECT s.sname AS nombre, h.fecha, h.h100 AS horas_100, h.v100 AS valor_100, h.h50 AS horas_50, h.v50 AS valor_50, 
    	h.ent1 AS hora_ent1, h.sal1 AS hora_sal1, h.ent2 AS hora_ent2, h.sal2 AS hora_sal2, h.ent3 AS hora_ent3, 
    	h.sal3 AS hora_sal3, h.idsujeto, h.idhoraex, t.descrip as turno 
    FROM horaex h LEFT JOIN sujetos s ON (h.idsujeto = s.idsujeto)
    			  left join turnos t on (h.idturno = t.idturno) 
    ORDER BY h.fecha, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END;


ALTER TABLE public.vhoraex OWNER TO postgres;

--
-- TOC entry 1536 (class 1259 OID 39517)
-- Dependencies: 1659 5
-- Name: viewvar; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW viewvar AS
    SELECT d.descripda AS variable, v.desde, v.hasta, v.valor, d.valorda AS tipo, v.idvardiaria 
    FROM (vardiarias v LEFT JOIN detagru d ON ((v.codvar = d.iddato))) ORDER BY v.desde, d.descripda;


ALTER TABLE public.viewvar OWNER TO postgres;

--
-- TOC entry 1537 (class 1259 OID 39520)
-- Dependencies: 1660 5
-- Name: vmonedas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vmonedas AS
    SELECT monedas.moname AS moneda, monedas.mosimbolo AS simbolo, monedas.mocoti AS cotizacion, monedas.mocode 
    FROM monedas;


ALTER TABLE public.vmonedas OWNER TO postgres;

--
-- TOC entry 1538 (class 1259 OID 39523)
-- Dependencies: 1661 5
-- Name: vperiodos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vperiodos AS
    SELECT p.pdocode, p.fecini, p.fecfin, p.moneda, p.nivelplan, p.isupdate, p.isopen, p.swclilis, 
    CASE WHEN p.isopen THEN 'ABIERTO'::text ELSE 'CERRADO'::text END AS dopen, CASE WHEN p.isupdate THEN 'PREDETERMINADO'::text ELSE 'NO PREDETERMINADO'::text END AS dactual 
    FROM periodos p;


ALTER TABLE public.vperiodos OWNER TO postgres;

--
-- TOC entry 1539 (class 1259 OID 39526)
-- Dependencies: 1662 5
-- Name: vpreciosv; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vpreciosv AS 
 SELECT c.descripda AS clientes, i.icode, i.iname, i.artcosto, i.artgrupo, i.artmarca, i.itag, p.preciov, p.idlista, 
 	p.iditem, p.pordes AS descuento, p.pordes, p.poruti, p.iddato, g.descripda AS grupo, m.descripda AS marca, 
 	u.descripda as unidad, s.descripda AS subgrupo, i.artsgrupo
   FROM preciosv p
   LEFT JOIN detagru c ON p.iddato = c.iddato
   LEFT JOIN items i ON p.iditem = i.iditem
   LEFT JOIN detagru g ON i.artgrupo = g.iddato
   LEFT JOIN detagru s ON i.artsgrupo = s.iddato
   LEFT JOIN detagru m ON i.artmarca = m.iddato
   LEFT JOIN detagru u ON i.iunidad = u.iddato;   

ALTER TABLE vpreciosv OWNER TO postgres;
--
-- TOC entry 1540 (class 1259 OID 39530)
-- Dependencies: 1663 5
-- Name: vproveedores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vproveedores AS
    SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, 
    s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, 
    s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, s.idsujeto 
    FROM ((sujetos s LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) LEFT JOIN detagru p ON ((s.sprov = p.iddato))) 
    WHERE s.isproveedor;


ALTER TABLE public.vproveedores OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 39534)
-- Dependencies: 1664 5
-- Name: vrubros; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vrubros AS
    SELECT rubros.rubtab AS codigo, rubros.rubname AS rubro, rubros.rubtype AS tipo, rubros.rubformula AS formula, 
    rubros.tie AS ing_egr_rol, rubros.isactivo AS activo, rubros.isdocban AS es_doc_ban, rubros.isdocret AS es_doc_ret, 
    rubros.rubcode 
    FROM rubros;


ALTER TABLE public.vrubros OWNER TO postgres;

--
-- TOC entry 1542 (class 1259 OID 39537)
-- Dependencies: 1665 5
-- Name: vsaldosb; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsaldosb AS
    SELECT s.pdocode, s.idcuenta, s.saldoi, c.nucuban, c.numaux, b.descripda AS banco, s.idsaldosb
    FROM ((saldosb s LEFT JOIN ctasban c ON ((s.idcuenta = c.idcuenta))) LEFT JOIN detagru b ON ((b.iddato = c.idbanco)));


ALTER TABLE public.vsaldosb OWNER TO postgres;

--
-- TOC entry 1543 (class 1259 OID 39540)
-- Dependencies: 1666 5
-- Name: vsaldosban; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsaldosban AS
    SELECT c.nucuban AS numero, s.saldoi AS saldo_ini, c.numaux AS num_auxiliar, b.descripda AS banco, s.pdocode, 
    s.idcuenta, s.idsaldosb 
    FROM ((saldosb s LEFT JOIN ctasban c ON ((s.idcuenta = c.idcuenta))) LEFT JOIN detagru b ON ((b.iddato = c.idbanco)));


ALTER TABLE public.vsaldosban OWNER TO postgres;
--
-- TOC entry 1544 (class 1259 OID 39543)
-- Dependencies: 1667 5
-- Name: vsaldosc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsaldosc AS 
	SELECT DISTINCT p.plancod AS codigo, a.auxname AS auxiliar, sc.debe, sc.haber, a.auxiliar AS codaux, p.cuenta, 
	sc.idsaldocon, sc.pdocode, a.idauxiliar, pr.fecfin, p.idplancuenta, p.plannivel, p.negativo
   FROM saldoscon sc, vplancta p, vauxcon a, periodos pr
  WHERE sc.pdocode = pr.pdocode AND sc.idplancuenta = p.idplancuenta AND sc.idaux = a.idauxiliar and sc.idplancuenta not in 
	(select idplancuenta from periodos union select ctaperdida from periodos) 
  ORDER BY sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, p.plannivel, sc.debe, sc.haber, p.cuenta;

ALTER TABLE vsaldosc OWNER TO postgres;
--
-- TOC entry 1545 (class 1259 OID 39546)
-- Dependencies: 1668 5
-- Name: vsaldoscon; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsaldoscon AS
    SELECT DISTINCT sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, 
    p.plannivel, sc.debe, sc.haber, p.cuenta, p.negativo 
    FROM saldoscon sc, vplancta p, vauxcon a, periodos pr 
    WHERE (((sc.pdocode = pr.pdocode) AND (sc.idplancuenta = p.idplancuenta)) AND (sc.idaux = a.idauxiliar)) 
    ORDER BY sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, 
    p.plannivel, sc.debe, sc.haber, p.cuenta;


ALTER TABLE public.vsaldoscon OWNER TO postgres;

--
-- TOC entry 1546 (class 1259 OID 39549)
-- Dependencies: 1669 5
-- Name: vsaldosi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsaldosi AS
    SELECT i.icode, i.iname, g.descripda AS grupo, m.descripda AS marca, s.inicial, s.precio, s.iditem, s.fecsaldo, s.pdocode, 
    s.idsaldosi, s.cospro 
    FROM (((saldosi s LEFT JOIN items i ON ((s.iditem = i.iditem))) 
    				  LEFT JOIN detagru m ON ((i.artmarca = m.iddato))) 
    				  LEFT JOIN detagru g ON ((i.artgrupo = g.iddato))) 
    ORDER BY g.descripda, m.descripda, i.iname, i.icode;


ALTER TABLE public.vsaldosi OWNER TO postgres;

--
-- TOC entry 1547 (class 1259 OID 39553)
-- Dependencies: 1670 5
-- Name: vsecuencias; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsecuencias AS
    SELECT d.descripda AS secuencia, s.descrip AS descripcion, s.numese AS num_actual, s.serie, s.idsecu 
    FROM (secuencias s LEFT JOIN detagru d ON ((s.idsecuencia = d.iddato)));


ALTER TABLE public.vsecuencias OWNER TO postgres;

--
-- TOC entry 1548 (class 1259 OID 39556)
-- Dependencies: 1671 5
-- Name: vservicios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vservicios AS
    SELECT a.icode, a.itag, a.iname, a.icode AS auxcon, a.iname AS auxiliar, a.artpeso, a.artsell, a.artcosto, a.artfob, 
    a.artcosto2, a.artfob2, a.issell, a.isbuy, a.isreturn, a.isfob, a.isiva, u.descripda AS unidad, c.descripda AS marca, 
    g.descripda AS grupo, s.descripda AS subgrupo, m.moname, f.descripda AS genero, a.iditem 
    FROM ((((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru s ON ((a.artsgrupo = s.iddato))) LEFT JOIN detagru f ON ((a.artipo = f.iddato))) 
    WHERE (a.itipo = 3);


ALTER TABLE public.vservicios OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 39560)
-- Dependencies: 1672 5
-- Name: vsritabla; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsritabla AS
    SELECT s.codigo, d.descripda AS tabla, s.descrip AS descripcion, s.anio, s.mes, s.valor, d.valorda AS loncod, s.iddato, 
    s.idsritabla 
    FROM sritabla s, detagru d 
    WHERE (s.iddato = d.iddato);


ALTER TABLE public.vsritabla OWNER TO postgres;

--
-- TOC entry 1550 (class 1259 OID 39563)
-- Dependencies: 1673 5
-- Name: vsuj; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsuj AS 
 SELECT s.idsujeto, s.scode, s.sname, s.ssri, s.sruc, s.scedula, s.spasaporte, s.isempleado, s.isproductor, s.isproveedor, 
 		s.iscliente, s.issocio, c.descripda AS ciudad, p.descripda AS provincia, s.diasplz, s.svendedor, s.srepre, 
 		s.tipcli, s.tipact, t.descripda AS tipo_cli, a.descripda AS tipo_act, s.stag, s.sciudad, s.sprov, s.saddr, s.stelf, 
 		0 as idprin, '' as principal, 0 as idgar, '' as garante, s.activo, s.scredito,
 		s.calific, s.observ, s.sciudad2, u.descripda as ciudad2, r.descripda as parroquia, e.descripda as sector, 
 		v.idsujeto as idven, v.sname as vendedor, s.sector as idsector
   FROM sujetos s
   LEFT JOIN detagru c ON s.sciudad = c.iddato
   LEFT JOIN detagru u ON s.sciudad2= u.iddato   
   LEFT JOIN detagru p ON s.sprov = p.iddato
   LEFT JOIN detagru t ON s.tipcli = t.iddato
   LEFT JOIN detagru a ON s.tipact = a.iddato 
   LEFT JOIN detagru r ON s.parroquia = r.iddato
   LEFT JOIN detagru e ON s.sector = e.iddato
   left join rutas f   on s.sector = f.ruta
   left join sujetos v  on f.vendedor = v.idsujeto ;

ALTER TABLE vsuj OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 39567)
-- Dependencies: 1674 5
-- Name: vsujetos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vsujetos AS
    SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, s.stag, s.svendedor, 
    s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, s.activo, 
    s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, t.descripda AS tipo_cli, s.saddr AS direccion, 
    s.idsujeto, '' as principal, '' as garante, 0 as idprin, 0 as idgar, s.diasplz, s.srepre,
    s.scredito, s.calific, s.observ, u.descripda as ciudad2, t.descripda as parroquia, e.descripda as sector, 
    v.idsujeto as idven, v.sname as vendedor
    FROM sujetos s LEFT JOIN detagru c ON (s.sciudad = c.iddato) 
    			   LEFT JOIN detagru u ON (s.sciudad2= u.iddato) 
    			   LEFT JOIN detagru p ON (s.sprov = p.iddato)
    			   LEFT JOIN detagru t ON (s.tipcli = t.iddato) 
   			       LEFT JOIN detagru r ON s.parroquia = r.iddato
   				   LEFT JOIN detagru e ON s.sector = e.iddato	
				   left join rutas f   on s.sector = f.ruta
				   left join sujetos v  on f.vendedor = v.idsujeto 	;


ALTER TABLE public.vsujetos OWNER TO postgres;
--
-- TOC entry 1553 (class 1259 OID 39575)
-- Dependencies: 1675 5
-- Name: vusuarios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE  VIEW vusuarios AS 
 SELECT DISTINCT 
        CASE
            WHEN char_length(btrim(s.sname::text, ''::text)) = 0 THEN s.ssri
            ELSE s.sname
        END AS sname, s.scode, w.equipo, t.descripda AS tipou, u.idsujeto, u.contrau, u.ingcaj 
   FROM usuarios u
   LEFT JOIN sujetos s ON s.idsujeto = u.idsujeto
   LEFT JOIN detagru t ON u.tipou = t.iddato
   LEFT JOIN workstations w ON u.idworkstation = w.idworkstation
  ORDER BY 
CASE
    WHEN char_length(btrim(s.sname::text, ''::text)) = 0 THEN s.ssri
    ELSE s.sname
END, s.scode, w.equipo, t.descripda, u.idsujeto;

ALTER TABLE vusuarios OWNER TO postgres;
--
-- TOC entry 1554 (class 1259 OID 39579)
-- Dependencies: 1676 5
-- Name: vworkstations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vworkstations AS
    SELECT w.equipo, w.ptovta, w.fono, a.descripda AS agencia, d.descripda AS departamento, c.descripda AS ciudad, 
    w.idworkstation 
    FROM (((workstations w LEFT JOIN detagru a ON ((w.idagencia = a.iddato))) LEFT JOIN detagru d ON ((w.iddepart = d.iddato))) LEFT JOIN detagru c ON ((w.idciudad = c.iddato)));


ALTER TABLE public.vworkstations OWNER TO postgres;

CREATE VIEW vdocup AS 
 SELECT DISTINCT y.code, y.saldoant, y.valort, p.plancod, v.nomdoc AS nomdocd, d.code AS coded, d.num AS numd, 
 	y.fecultpag, y.idsaldosci, a.referencia 
   FROM detadocp y
   LEFT JOIN vplancta p ON y.idplancuenta = p.idplancuenta
   LEFT JOIN saldosci a ON y.idsaldosci = a.idsaldosci
   LEFT JOIN documents d ON a.code = d.code
   LEFT JOIN secudoc s ON d.idsecudoc = s.idsecudoc
   LEFT JOIN docuse v ON s.iddocu = v.iddocu
   LEFT JOIN sujetos u ON d.cliente = u.idsujeto
  ORDER BY y.code, y.saldoant, y.valort, p.plancod, v.nomdoc, d.code, d.num;

ALTER TABLE vdocup OWNER TO postgres;

CREATE VIEW vsaldosci AS 
 SELECT u.sname, u.scode, d.nomdoc, d.num, p.plancod, p.cuenta, s.code, s.idsujeto, s.monto, s.saldo, s.pdocode, 
 		s.ctacon, s.fecultpag, s.idsaldosci, s.cuota, s.fecven, s.cobrador, s.referencia, p.negativo, s.seller,
 		s.casher, s.fecha
   FROM saldosci s
   LEFT JOIN sujetos u ON s.idsujeto = u.idsujeto
   LEFT JOIN vdocusmall d ON s.code = d.code
   LEFT JOIN vplancta p ON s.ctacon = p.idplancuenta;

ALTER TABLE vsaldosci OWNER TO postgres;

CREATE VIEW vcontenedor AS
select nombre, codimp, fecha, sname as auximp, observa, idcontenedor, pdocode
from impconte c left join import i on (c.idimport=i.idimport) 
				left join sujetos s on (i.idugra=s.idsujeto) 
order by fecha, codimp, nombre;

ALTER TABLE vcontenedor OWNER TO postgres;

CREATE OR REPLACE VIEW vsecuagen AS 
 SELECT s.codigo, s.idagencia, t.idtablasis, s.secini, s.secfin, s.fecini, s.ismaster, t.tabla, t.tienerep, t.nivel, t.ckey, t.secsis, a.descripda AS agencia
   FROM secuagen s
   LEFT JOIN tablasis t ON s.idtablasis = t.idtablasis
   LEFT JOIN detagru a ON s.idagencia = a.iddato;

CREATE OR REPLACE VIEW vcheques AS 
 SELECT s.scode, s.sname as nombre, c.numcta, c.numche, c.fecheque, c.observa, c.valor, c.fecha, b.descripda AS banco, c.ctaban, c.idcheque, c.isefectivo, c.fecdepo
   FROM cheques c
   LEFT JOIN detagru b ON c.banco = b.iddato
   LEFT JOIN sujetos s ON c.cliente = s.idsujeto
  WHERE c.code = 0 OR c.code IS NULL or code not in (select code from documents) 
  ORDER BY c.fecheque, s.sname;

ALTER TABLE vcheques OWNER TO postgres;

CREATE OR REPLACE VIEW vdocubant AS 
 SELECT b.code, b.nudocban, b.punitario as valor, b.cbenef, b.cconce, c.nucuban, b.qty, b.isconfbanc, 
 		b.isanulado, b.isconciliado, b.isprotesto, b.fecpag, b.tipodoc, b.fecdoc, b.isprint, b.isdet,
  		b.isconpos, b.isposfec, b.fecha, b.isaccount, b.idcuenta, b.secuencia
   FROM detadocb b LEFT JOIN reversodoc r ON b.tipodoc = r.iddocu
   				   LEFT JOIN ctasban c ON b.idcuenta = c.idcuenta
  WHERE b.code = 0 OR b.code IS NULL or b.code not in (select code from documents) 
  ORDER BY b.code;

ALTER TABLE vdocubant OWNER TO postgres;


CREATE VIEW vactividad AS
    SELECT s.scode AS codigo, s.sname AS nombre, s.scedula AS cedula,  
    c.descripda AS ciudad, t.descripda as actividad, numhec,
    valorunit, fecha, s.idsujeto, codact
    FROM ((actividad a left join sujetos s  on (a.idsujeto=s.idsujeto) 
			LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) 
			LEFT JOIN detagru t ON ((a.codact = t.iddato))) ;
    
ALTER TABLE public.vactividad OWNER TO postgres;


CREATE VIEW vhaciendas AS
    SELECT nombre, hectareas, sname as productor, descripda as ciudad, idhacienda, h.idsujeto
    FROM haciendas h left join detagru d on (h.ciudad=d.iddato)
    				 left join sujetos s on (h.idsujeto=s.idsujeto);


commit;

