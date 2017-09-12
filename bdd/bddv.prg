
--alter table documents add CONSTRAINT "valfecdoc" CHECK (valfecper(pdocode, fecha));

--alter table asientosdia	add CONSTRAINT "valfecasi" CHECK (valfecper(pdocode, afecha));


DROP VIEW "vdocuret";
DROP VIEW "vdocuments";
DROP VIEW "vdocub";
DROP VIEW "reversodoc";
DROP VIEW "vdocumentg";
DROP VIEW "vsaldosi";
--DROP VIEW "vproduccion";
--DROP VIEW "vformatos";
DROP VIEW "vsaldoscon";
DROP VIEW "vdiario";
DROP VIEW "vauxcon";
DROP VIEW "vdetagrus";
DROP VIEW "gatosgenl";
DROP VIEW "datosgens";
DROP VIEW "datosgeng";
DROP VIEW "vpreciosv";
DROP VIEW "vsecudoc";
DROP VIEW "vdocui";
DROP VIEW "vdetadoci";
DROP VIEW "vsujetos";
DROP VIEW "vplancta";
DROP VIEW "vitems";
DROP VIEW "vsuj";
DROP VIEW "vdocud";
DROP VIEW "vdetagru";
DROP VIEW "datosgenl";
DROP VIEW "datosgen";
DROP VIEW "vservicios";
DROP VIEW "varticulos";
DROP VIEW "varti";
DROP VIEW "vactivosfij";
DROP VIEW "vactivosf";
DROP VIEW "vconversion";
DROP VIEW "vdocuse";
DROP VIEW "vhoraex";
DROP VIEW "vemple";
DROP VIEW "vsaldosban";
DROP VIEW "vctasb";
DROP VIEW "vproveedores";
DROP VIEW "vmonedas";
DROP VIEW "vrubros";
DROP VIEW "vdocmul";
DROP VIEW "vperiodos";
DROP VIEW "ambiempre";
DROP VIEW "vdocul";
DROP VIEW "vdocus";
DROP VIEW "vusuarios";
DROP VIEW "vempleados";
DROP VIEW "vclientes";
DROP VIEW "vsaldosb";
DROP VIEW "vworkstations";
DROP VIEW "vsritabla";
DROP VIEW "viewvar";
DROP VIEW "vctasban";
DROP VIEW "vsecuencias";
DROP VIEW "vconproter";
DROP VIEW "vsaldosc";
DROP VIEW "vdocusmall";
DROP VIEW "vaneuret";

CREATE VIEW "vctasban" as SELECT DISTINCT c.nucuban, b.descripda AS banco, c.ticuban, m.moname AS moneda, c.numaux, c.idcuenta FROM ((ctasban c LEFT JOIN detagru b ON ((c.idbanco = b.iddato))) LEFT JOIN monedas m ON ((c.mone = m.mocode))) ORDER BY c.nucuban, b.descripda, c.ticuban, m.moname, c.numaux, c.idcuenta;

CREATE VIEW "viewvar" as SELECT d.descripda AS variable, v.desde, v.hasta, v.valor, d.valorda AS tipo, v.idvardiaria FROM (vardiarias v LEFT JOIN detagru d ON ((v.codvar = d.iddato))) ORDER BY v.desde, d.descripda;

--CREATE VIEW "vsritabla" as SELECT s.idsritabla, s.codigo, s.descrip, s.anio, s.mes, s.iddato, s.valor, d.descripda, d.valorda AS loncod FROM sritabla s, detagru d WHERE (s.iddato = d.iddato);
CREATE VIEW "vsritabla" as SELECT s.codigo, d.descripda as tabla, s.descrip as descripcion,  s.anio, s.mes,  s.valor,  d.valorda AS loncod, s.iddato, s.idsritabla FROM sritabla s, detagru d WHERE (s.iddato = d.iddato);

CREATE VIEW "vworkstations" as SELECT w.equipo, w.ptovta, w.fono, a.descripda AS agencia, d.descripda AS departamento, c.descripda AS ciudad, w.idworkstation FROM (((workstations w LEFT JOIN detagru a ON ((w.idagencia = a.iddato))) LEFT JOIN detagru d ON ((w.iddepart = d.iddato))) LEFT JOIN detagru c ON ((w.idciudad = c.iddato)));

CREATE VIEW "vsaldosb" as SELECT s.pdocode, s.idcuenta, s.saldoi, c.nucuban, c.numaux, b.descripda AS banco FROM ((saldosb s LEFT JOIN ctasban c ON ((s.idcuenta = c.idcuenta))) LEFT JOIN detagru b ON ((b.iddato = c.idbanco)));

CREATE VIEW "vclientes" as SELECT sujetos.scode, CASE WHEN (char_length(btrim((sujetos.sname)::text, ''::text)) = 0) THEN sujetos.ssri ELSE sujetos.sname END AS sname, sujetos.stag, sujetos.scedula, sujetos.sruc, sujetos.ssri, sujetos.saddr, sujetos.stelf, sujetos.isempleado, sujetos.isproveedor, sujetos.isproductor, sujetos.idsujeto FROM sujetos WHERE sujetos.iscliente ORDER BY sujetos.sname, sujetos.ssri;

CREATE VIEW "vempleados" as SELECT s.scode, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS sname, s.scedula, s.sruc, e.emsexo, c.descripda AS cargo, e.emsueldo, e.emnumcar, v.descripda AS estciv, e.emnumiess, e.emfecing, e.emfecnac, e.emfecsal, e.emcodocuiess, e.emnumcta, e.emtipcta, d.descripda AS departamento, e.emisiess, t.descripda AS titulo, e.emisactivo, s.idsujeto FROM (((((sujetos s LEFT JOIN empleados e ON ((e.idsujeto = s.idsujeto))) LEFT JOIN detagru c ON ((e.emcargo = c.iddato))) LEFT JOIN detagru t ON ((e.emcodtit = t.iddato))) LEFT JOIN detagru d ON ((e.emcoddep = d.iddato))) LEFT JOIN detagru v ON ((e.emestciv = v.iddato))) WHERE s.isempleado;

CREATE VIEW "vusuarios" as SELECT DISTINCT CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS sname, s.scode, w.equipo, t.descripda AS tipou, u.idsujeto FROM (((usuarios u LEFT JOIN sujetos s ON ((s.idsujeto = u.idsujeto))) LEFT JOIN detagru t ON ((u.tipou = t.iddato))) LEFT JOIN workstations w ON ((u.idworkstation = w.idworkstation))) ORDER BY CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END, s.scode, w.equipo, t.descripda, u.idsujeto;

CREATE VIEW "vdocus" as SELECT t.code, i.sname AS snamed, i.ssri AS ssrid, i.scode, i.idsujeto, t.punitario, t.qty FROM (detadocs t LEFT JOIN sujetos i ON ((t.idsujeto = i.idsujeto)));

CREATE VIEW "vdocul" as SELECT d.code, r.rubtab, r.rubname, d.valor, d.tie FROM (detadocl d LEFT JOIN rubros r ON ((d.rubcode = r.rubcode)));

CREATE VIEW "ambiempre" as SELECT p.fecini, p.fecfin, p.pdocode, p.moneda, m.moname, p.nivelplan, p.isupdate, p.isopen, CASE WHEN p.isupdate THEN 'PREDETERMINADO'::bpchar ELSE 'NO PREDETERMINADO'::bpchar END AS actual, CASE WHEN p.isopen THEN 'ABIERTO'::bpchar ELSE 'CERRADO'::bpchar END AS openx FROM periodos p, monedas m WHERE (p.moneda = m.mocode);

CREATE VIEW "vperiodos" as SELECT p.pdocode, p.fecini, p.fecfin, p.moneda, p.nivelplan, p.isupdate, p.isopen, CASE WHEN p.isopen THEN 'ABIERTO'::text ELSE 'CERRADO'::text END AS dopen, CASE WHEN p.isupdate THEN 'PREDETERMINADO'::text ELSE 'NO PREDETERMINADO'::text END AS dactual FROM periodos p;

CREATE VIEW "vdocmul" as SELECT d.nrodoc, d.iddocu, d.fecha, d.pdocode, d.subtotal, d.idsujeto, d.codusu, d.observac, d.isprint, d.isanulado, d.fecgra, d.isgenerado, d.iscancelado, d.isaccount, d.numero, o.nomdoc, o.dtag, s.scode AS scodeb, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS beneficiario, t.idsujeto AS idsujetod, CASE WHEN (char_length(btrim((u.sname)::text, ''::text)) = 0) THEN u.ssri ELSE u.sname END AS sname, u.scode, t.valor, t.cant, (t.valor * t.cant) AS subtotald, t.code FROM (((((docmul d LEFT JOIN sujetos s ON ((d.idsujeto = s.idsujeto))) LEFT JOIN docuse o ON ((d.iddocu = o.iddocu))) LEFT JOIN periodos p ON ((d.pdocode = p.pdocode))) LEFT JOIN docmuld t ON ((d.nrodoc = t.nrodoc))) LEFT JOIN sujetos u ON ((t.idsujeto = u.idsujeto)));

CREATE VIEW "vrubros" as SELECT rubros.rubtab AS codigo, rubros.rubname AS rubro, rubros.rubtype AS tipo, rubros.rubformula AS formula, rubros.tie AS ing_egr_rol, rubros.isactivo AS activo, rubros.isdocban AS es_doc_ban, rubros.isdocret AS es_doc_ret, rubros.rubcode FROM rubros;

CREATE VIEW "vmonedas" as SELECT monedas.moname AS moneda, monedas.mosimbolo AS simbolo, monedas.mocoti AS cotizacion, monedas.mocode FROM monedas;

CREATE VIEW "vproveedores" as SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, s.idsujeto FROM ((sujetos s LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) LEFT JOIN detagru p ON ((s.sprov = p.iddato))) WHERE s.isproveedor;

CREATE VIEW "vctasb" as SELECT DISTINCT c.nucuban AS numero, b.descripda AS banco, c.ticuban AS tipo, m.moname AS moneda, c.numaux AS num_auxiliar, c.idcuenta FROM ((ctasban c LEFT JOIN detagru b ON ((c.idbanco = b.iddato))) LEFT JOIN monedas m ON ((c.mone = m.mocode))) ORDER BY c.nucuban, b.descripda, c.ticuban, m.moname, c.numaux, c.idcuenta;

CREATE VIEW "vsaldosban" as SELECT c.nucuban AS numero, s.saldoi AS saldo_ini, c.numaux AS num_auxiliar, b.descripda AS banco, s.pdocode, s.idcuenta FROM ((saldosb s LEFT JOIN ctasban c ON ((s.idcuenta = c.idcuenta))) LEFT JOIN detagru b ON ((b.iddato = c.idbanco)));

CREATE VIEW "vemple" as SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, s.idsujeto FROM ((sujetos s LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) LEFT JOIN detagru p ON ((s.sprov = p.iddato))) WHERE s.isempleado;

CREATE VIEW "vhoraex" as SELECT s.sname AS nombre, h.fecha, h.h100 AS horas_100, h.v100 AS valor_100, h.h50 AS horas_50, h.v50 AS valor_50, h.ent1 AS hora_ent1, h.sal1 AS hora_sal1, h.ent2 AS hora_ent2, h.sal2 AS hora_sal2, h.ent3 AS hora_ent3, h.sal3 AS hora_sal3, h.idsujeto, h.idhoraex FROM (horaex h LEFT JOIN sujetos s ON ((h.idsujeto = s.idsujeto))) ORDER BY h.fecha, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END;

CREATE VIEW vplancta AS SELECT c.descripda AS cuenta, p.plantype, p.plannivel, p.auxcode, CASE WHEN (p.plannivel = 1) THEN substr((p.plancod)::text, 2, 1) WHEN (p.plannivel = 2) THEN (substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) WHEN (p.plannivel = 3) THEN (((substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) || '.'::text) || substr((p.plancod)::text, 5, 2)) WHEN (p.plannivel = 4) THEN (((((substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) WHEN (p.plannivel = 5) THEN (((((((substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) WHEN (p.plannivel = 6) THEN (((((((((substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) || '.'::text) || substr((p.plancod)::text, 11, 2)) ELSE ((((((((((substr((p.plancod)::text, 2, 1) || substr((p.plancod)::text, 4, 1)) || '.'::text) || substr((p.plancod)::text, 5, 2)) || '.'::text) || substr((p.plancod)::text, 7, 2)) || '.'::text) || substr((p.plancod)::text, 9, 2)) || substr((p.plancod)::text, 11, 2)) || '.'::text) || substr((p.plancod)::text, 13, 2)) END AS plancod, p.idplancuenta, p.idcuenta, p.pdocode FROM (plancuenta p LEFT JOIN detagru c ON ((p.idcuenta = c.iddato))) ORDER BY p.plancod;

CREATE VIEW vdocuse AS SELECT d.pdocode, d.iddocu, d.dtag, d.descrip, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, p.auxcode, d.nomdoc, d.ivaxitem, d.lispre, d.idsritabla, t.debehaber, i.descripda AS tipo, s.descripda AS subtipo, r.tipo AS rtipo, r.subtipo AS rsubtipo, r.nomdoc AS reversodoc, p.cuenta, p.plancod, u.rubname, l.cuenta AS ctaitem, l.plancod AS plancodite, a.descripda AS tipoart, c.debehaber AS dhitem FROM (((((((((docuse d LEFT JOIN ddocuse t ON ((d.iddocu = t.iddocu))) LEFT JOIN (SELECT x.iddocu, x.nomdoc, y.descripda AS tipo, z.descripda AS subtipo FROM docuse x, detagru y, detagru z WHERE ((x.tipodoc = y.iddato) AND (x.subtipodoc = z.iddato))) r ON ((d.idreversodoc = r.iddocu))) LEFT JOIN detagru i ON ((d.tipodoc = i.iddato))) LEFT JOIN detagru s ON ((d.subtipodoc = s.iddato))) LEFT JOIN vplancta p ON ((t.idplancuenta = p.idplancuenta))) LEFT JOIN rubros u ON ((t.rubcode = u.rubcode))) LEFT JOIN dcontitem c ON ((t.iddocuse = c.iddocuse))) LEFT JOIN vplancta l ON ((c.idplancuenta = l.idplancuenta))) LEFT JOIN detagru a ON ((c.artgrupo = a.iddato))) WHERE (t.idplancuenta > 0) ORDER BY d.nomdoc, p.plancod;

CREATE VIEW "vconversion" as SELECT m.descripda AS medida, c.numeconver, c.denoconver, e.descripda AS equivale, c.idconversion FROM ((conversion c LEFT JOIN detagru m ON ((c.iddato1 = m.iddato))) LEFT JOIN detagru e ON ((c.iddato2 = e.iddato))) ORDER BY m.descripda;

CREATE VIEW "vactivosf" as SELECT a.icode AS codigo, a.iname AS nombre, a.artpeso AS peso, a.artcosto AS costo, a.isiva AS carga_iva, a.itag AS codigo_alt, u.descripda AS unidad, c.descripda AS marca, g.descripda AS grupo, s.descripda AS subgrupo, m.moname, a.iditem FROM (((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru s ON ((a.artsgrupo = s.iddato))) WHERE (g.valorda = 'AF');

CREATE VIEW "vactivosfij" as SELECT f.codact AS codigo, f.fecadq AS fecha_adq, f.fecent AS fecha_ent, s.sname AS nombre, f.refer AS referencia, f.ubicacion, f.code AS cod_docu, f.isbaja, f.numser AS numero_serie, f.costoh AS costo_his, a.iname AS nombre_act, a.itag AS codigo_alt, u.descripda AS unidad, c.descripda AS marca, g.descripda AS grupo, f.depre AS por_depre, f.ismensual, f.idactivo, f.iditem, a.icode FROM (((((activosf f LEFT JOIN sujetos s ON ((f.idsujeto = s.idsujeto))) LEFT JOIN items a ON ((f.iditem = a.iditem))) LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato)));

CREATE VIEW "varti" as SELECT a.icode AS codigo, a.iname AS nombre, a.artpeso AS peso, a.artcosto AS costo, a.saldocon, a.isiva AS carga_iva, a.itag AS codigo_alt, u.descripda AS unidad, c.descripda AS marca, g.descripda AS grupo, s.descripda AS subgrupo, m.moname, a.iditem FROM (((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru s ON ((a.artsgrupo = s.iddato))) WHERE (a.itipo = 1 and g.valorda<>'AF');

CREATE VIEW "varticulos" as SELECT a.iname, a.icode AS auxcon, f.descripda AS genero, a.iname AS auxiliar, a.artpeso, a.artsell, a.artcosto, a.artfob, a.artcosto2, a.artfob2, a.artwin1, a.issell, a.isbuy, a.isreturn, a.isfob, a.isformato, a.imoney, a.isiva, a.itag, a.icode, u.descripda AS unidad, c.descripda AS marca, g.descripda AS grupo, s.descripda AS subgrupo, m.moname, a.iditem, a.artgrupo FROM ((((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru s ON ((a.artsgrupo = s.iddato))) LEFT JOIN detagru f ON ((a.artipo = f.iddato))) WHERE (a.itipo = 1);

CREATE VIEW "vservicios" as SELECT a.icode, a.itag, a.iname, a.icode AS auxcon, a.iname AS auxiliar, a.artpeso, a.artsell, a.artcosto, a.artfob, a.artcosto2, a.artfob2, a.artwin1, a.issell, a.isbuy, a.isreturn, a.isfob, a.isiva, u.descripda AS unidad, c.descripda AS marca, g.descripda AS grupo, s.descripda AS subgrupo, m.moname, f.descripda AS genero, a.iditem FROM ((((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru s ON ((a.artsgrupo = s.iddato))) LEFT JOIN detagru f ON ((a.artipo = f.iddato))) WHERE (a.itipo = 3);

CREATE VIEW "datosgen" as SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.gtable, g.idgrupo FROM detagru d, grudat g WHERE (d.idgrupo = g.idgrupo) ORDER BY g.gtag;

CREATE VIEW "datosgenl" as SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.gtable, g.idgrupo FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'L'::bpchar)) ORDER BY g.gtag;

CREATE VIEW "vdetagru" as SELECT d.descripda AS dato, g.gtag AS codigo_g, g.descripgru AS grupo, g.tipo, d.valorda AS valor_a, d.iddato FROM detagru d, grudat g WHERE (d.idgrupo = g.idgrupo) ORDER BY g.gtag;

CREATE VIEW "vdocud" as SELECT DISTINCT y.code, y.coded, y.saldoant, y.valort, y.tipoie, d.idugra, d.fecgra, d.succode, d.depcode, d.usercaja, d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.auxcode, d.auxitem, d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, d.concepto, k.afecha AS feccon, b.descripda AS bodega, v.tipo, v.subtipo, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, s.scode, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END AS sname, s.sruc, s.scedula, s.spasaporte, u.sname AS nombreu, u.scode AS codeu, monedas.moname AS moneda FROM (((((((((detadocd y LEFT JOIN documents d ON ((y.coded = d.code))) LEFT JOIN detagru b ON ((d.userstore = b.iddato))) LEFT JOIN asientosdia k ON ((d.code = k.code))) LEFT JOIN secudoc z ON ((d.idsecudoc = z.idsecudoc))) LEFT JOIN (SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva FROM detagru d, detagru e, docuse f WHERE ((f.tipodoc = d.iddato) AND (f.subtipodoc = e.iddato))) v ON ((z.iddocu = v.iddocu))) LEFT JOIN sujetos u ON ((d.idugra = u.idsujeto))) LEFT JOIN periodos o ON ((d.pdocode = o.pdocode))) LEFT JOIN monedas ON ((o.moneda = monedas.mocode))) LEFT JOIN sujetos s ON ((d.cliente = s.idsujeto))) ORDER BY y.code, y.coded, y.saldoant, y.valort, y.tipoie, d.idugra, d.fecgra, d.succode, d.depcode, d.usercaja, d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.auxcode, d.auxitem, d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, d.concepto, k.afecha, b.descripda, v.tipo, v.subtipo, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, s.scode, CASE WHEN (char_length(btrim((s.sname)::text, ''::text)) = 0) THEN s.ssri ELSE s.sname END, s.sruc, s.scedula, s.spasaporte, u.sname, u.scode, monedas.moname;

CREATE VIEW "vsuj" as SELECT s.idsujeto, s.scode, CASE WHEN char_length(btrim(s.sname::text, ''::text)) = 0 THEN s.ssri ELSE s.sname END AS sname, s.sruc, s.scedula, s.spasaporte, s.isempleado, s.isproductor, s.isproveedor, s.iscliente, s.issocio, c.descripda AS ciudad, p.descripda AS provincia, s.tipcli, t.descripda AS tipo_cli, a.descripda as tipo_act FROM sujetos s  LEFT JOIN detagru c ON s.sciudad = c.iddato LEFT JOIN detagru p ON s.sprov = p.iddato LEFT JOIN detagru t ON s.tipcli = t.iddato LEFT JOIN detagru a ON s.tipact = a.iddato ;

CREATE VIEW "vitems" as SELECT a.iditem, a.artgrupo, a.artsgrupo, a.artipo, a.artmarca, a.artpeso, a.artsell, a.artcosto, a.artfob, a.artcosto2, a.artfob2, a.artwin1, a.artwin2, a.artwin3, a.issell, a.isbuy, a.isreturn, a.isfob, a.isformato, a.itipo, a.iname, a.iunidad, a.imoney, a.isiva, a.isdesc, a.itag, a.icode, a.depre, a.saldocon, u.descripda AS unidad, c.descripda AS marca, c.valorda AS valordamar, g.valorda AS valordagru, g.descripda AS grupo, m.moname, a.icode AS auxcon, f.descripda AS genero, a.iname AS auxiliar FROM (((((items a LEFT JOIN detagru u ON ((a.iunidad = u.iddato))) LEFT JOIN monedas m ON ((a.imoney = m.mocode))) LEFT JOIN detagru c ON ((a.artmarca = c.iddato))) LEFT JOIN detagru g ON ((a.artgrupo = g.iddato))) LEFT JOIN detagru f ON ((a.artipo = f.iddato)));

CREATE VIEW "vsujetos" as SELECT s.scode AS codigo, s.sname AS nombre, s.ssri AS razon_soc, s.scedula AS cedula, s.sruc AS ruc, s.spasaporte AS pasaporte, s.isempleado AS es_empleado, s.isproveedor AS es_proveedor, s.iscliente AS es_cliente, s.issocio AS es_socio, c.descripda AS ciudad, p.descripda AS provincia, t.descripda AS tipo_cli, s.saddr AS direccion, s.idsujeto FROM (((sujetos s LEFT JOIN detagru c ON ((s.sciudad = c.iddato))) LEFT JOIN detagru p ON ((s.sprov = p.iddato))) LEFT JOIN detagru t ON ((s.tipcli = t.iddato)));

CREATE VIEW "vdetadoci" as SELECT t.code, i.iditem, i.icode, i.iname, i.marca, i.grupo, i.genero, i.itipo, i.iname AS auxiliar, i.icode AS auxcon, t.punitario, i.unidad, i.artgrupo, t.qty, t.valor AS subtot, t.valconiva, t.descuento, t.qtyactivo, t.isiva, t.artcosto, i.depre, t.pordes, t.impuesto FROM (detadoci t LEFT JOIN vitems i ON ((t.iditem = i.iditem)));

CREATE VIEW "vdocui" as SELECT t.code, i.iditem, i.icode, i.iname, i.marca, i.grupo, i.genero, i.itipo, i.iname AS auxiliar, i.icode AS auxcon, t.punitario, i.unidad, i.artgrupo, t.qty, t.valor AS subtot, t.valconiva, t.descuento, t.qtyactivo, t.isiva, t.artcosto, i.depre, t.pordes, t.impuesto FROM (detadoci t LEFT JOIN vitems i ON ((t.iditem = i.iditem)));

CREATE VIEW "vsecudoc" as SELECT DISTINCT e.idsecudoc, e.iddocu, e.idautosri, e.nota, d.ivaxitem, d.lispre, a.numauto, a.fcaducidad, a.desde, a.hasta, a.femision, a.activo, d.pdocode, d.tipodoc, d.subtipodoc, d.tipsaldo, u.serie, d.dtag, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, d.tipitem, d.auxcode, d.nomdoc, d.swaneiva, d.swiva, d.swdesc, d.swcosto, d.swkar, d.swconta, d.tipcosto, d.idsritabla, i.descripda AS tipo, s.descripda AS subtipo, r.tipo AS rtipo, r.subtipo AS rsubtipo, d.clasedoc, e.estado, u.numese AS numactual, u.idsecu, u.tipper, u.tipnum, u.reinicia, u.manual, (substr((u.descrip)::text, 1, 10))::character(10) AS descripser, f.reporte, f.idimage FROM (((((((secudoc e LEFT JOIN docuse d ON ((e.iddocu = d.iddocu))) LEFT JOIN secuencias u ON ((e.idsecu = u.idsecu))) LEFT JOIN (SELECT x.iddocu, y.descripda AS tipo, z.descripda AS subtipo FROM docuse x, detagru y, detagru z WHERE ((x.tipodoc = y.iddato) AND (x.subtipodoc = z.iddato))) r ON ((d.idreversodoc = r.iddocu))) LEFT JOIN detagru i ON ((d.tipodoc = i.iddato))) LEFT JOIN detagru s ON ((d.subtipodoc = s.iddato))) LEFT JOIN autosri a ON ((e.idautosri = a.idautosri))) LEFT JOIN imagenrep f ON ((e.idimage = f.idimage))) ORDER BY e.idsecudoc, e.iddocu, e.idautosri, e.nota, a.numauto, a.fcaducidad, a.desde, a.hasta, a.femision, a.activo, d.pdocode, d.tipodoc, d.subtipodoc, d.tipsaldo, u.serie, d.dtag, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, d.auxcode, d.nomdoc, d.swaneiva, i.descripda, s.descripda, r.tipo, r.subtipo, d.clasedoc, e.estado, u.numese, u.idsecu, u.tipper, u.tipnum, u.reinicia, u.manual, (substr((u.descrip)::text, 1, 10))::character(10), f.reporte, f.idimage, d.swiva, d.swdesc, d.swcosto, d.tipcosto;

CREATE VIEW vpreciosv AS SELECT c.descripda AS clientes, i.icode, i.iname, i.artcosto, p.preciov, p.idlista, p.iditem, p.pordes AS descuento, p.porcom, p.pordes, p.iddato FROM ((preciosv p LEFT JOIN detagru c ON ((p.iddato = c.iddato))) LEFT JOIN items i ON ((p.iditem = i.iditem)));

CREATE VIEW "datosgeng" as SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'G'::bpchar)) ORDER BY g.gtag;

CREATE VIEW "datosgens" as SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'S'::bpchar)) ORDER BY g.gtag;

CREATE VIEW "gatosgenl" as SELECT d.iddato, d.descripda, g.gtag, g.tipo, d.valorda, g.descripgru, g.idgrupo FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'L'::bpchar)) ORDER BY g.gtag;

CREATE VIEW "vdetagrus" as SELECT d.descripda AS dato, g.gtag AS codigo_g, g.descripgru AS grupo, g.tipo, d.valorda AS valor_a, d.iddato FROM detagru d, grudat g WHERE ((d.idgrupo = g.idgrupo) AND (g.tipo = 'G'::bpchar)) ORDER BY g.gtag;

--CREATE VIEW "vformatos" as SELECT i.iname, j.iname AS componente, d.descripda AS unidad, f.idformato FROM (((formatos f LEFT JOIN items i ON ((f.iditem = i.iditem))) LEFT JOIN items j ON ((f.idcomp = j.iditem))) LEFT JOIN detagru d ON ((f.unidad = d.iddato)));

--CREATE VIEW "vproduccion" as SELECT p.idproduc, p.fecha, i.iname, p.isanulado, p.observac, p.fecgra, p.idusu, s.sname AS jefeprod FROM ((produccion p LEFT JOIN items i ON ((p.formato = i.iditem))) LEFT JOIN sujetos s ON ((p.jefeprod = s.idsujeto))) ORDER BY p.fecha, i.iname;

CREATE VIEW "vsaldosi" as SELECT i.icode, i.iname, g.descripda AS grupo, m.descripda AS marca, s.inicial, s.precio, s.iditem, s.pdocode, s.idsaldosi FROM (((saldosi s LEFT JOIN items i ON ((s.iditem = i.iditem))) LEFT JOIN detagru m ON ((i.artmarca = m.iddato))) LEFT JOIN detagru g ON ((i.artgrupo = g.iddato))) ORDER BY g.descripda, m.descripda, i.iname, i.icode;

--d.serie
CREATE VIEW "vdocumentg" as SELECT DISTINCT d.code, d.num, v.nomdoc AS documento, s.scode AS cod_persona, s.ssri AS sri, s.sname AS nombre, s.sruc AS ruc, s.scedula AS cedula, r.sname AS vendedor, d.fecha, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.subtotal, d.ivavalor, d.ivabienes, d.montototal, d.saldo, d.tmpsaldo AS saldo_inic, d.isprint AS impreso, d.isaccount AS contabilizado, d.ispagado AS cancelado, d.isanulado AS pagado, d.isautorizado AS autorizado, d.concepto, k.afecha AS fec_conta, d.ffrom AS desde, d.fto AS hasta, d.fecgra AS fec_grabac, b.descripda AS bodega, v.dtag, d.pdocode FROM (((((((documents d LEFT JOIN detagru b ON ((d.userstore = b.iddato))) LEFT JOIN asientosdia k ON ((d.code = k.code))) LEFT JOIN vsecudoc z ON ((d.idsecudoc = z.idsecudoc))) LEFT JOIN (SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva FROM detagru d, detagru e, docuse f WHERE ((f.tipodoc = d.iddato) AND (f.subtipodoc = e.iddato))) v ON ((z.iddocu = v.iddocu))) LEFT JOIN sujetos s ON ((d.cliente = s.idsujeto))) ) LEFT JOIN sujetos r ON ((d.seller = r.idsujeto))) ORDER BY d.code, d.num, v.nomdoc, s.scode, s.ssri, s.sname, s.sruc, s.scedula, r.sname, d.fecha, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.subtotal, d.ivavalor, d.montototal, d.saldo, d.tmpsaldo, d.isprint, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, k.afecha, d.ffrom, d.fto, d.fecgra, b.descripda, v.dtag, d.pdocode;

CREATE VIEW "reversodoc" as SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva FROM ((docuse f LEFT JOIN detagru d ON ((f.tipodoc = d.iddato))) LEFT JOIN detagru e ON ((f.subtipodoc = e.iddato)));

CREATE VIEW "vdocub" as SELECT DISTINCT t.code, i.nucuban, i.ticuban, k.descripda AS banco, t.isanulado, t.idcuenta, t.nudocban, t.cbenef, t.cconce, t.fecdoc, t.punitario, t.qty, t.isanulado AS docanulado, t.isconfbanc, t.isprotesto, t.isconciliado, t.isprint AS isprintb, t.tipodoc, t.fecpag, t.isposfec, t.isconpos, t.isdet, t.secuencia, r.dtag, r.nomdoc FROM (((detadocb t LEFT JOIN ctasban i ON ((t.idcuenta = i.idcuenta))) LEFT JOIN detagru k ON ((i.idbanco = k.iddato))) LEFT JOIN reversodoc r ON ((t.tipodoc = r.iddocu))) ORDER BY t.code, i.nucuban, i.ticuban, k.descripda, t.idcuenta, t.nudocban, t.cbenef, t.cconce, t.fecdoc, t.punitario, t.qty, t.isanulado, t.isconfbanc, t.isprotesto, t.isconciliado, t.isprint, t.tipodoc, t.fecpag, t.secuencia, r.dtag, r.nomdoc;

--d.serie, d.numauto, d.fcaducidad, d.idws

CREATE VIEW "vdocuments" as SELECT DISTINCT d.idugra, d.fecgra, d.code, d.succode, d.depcode, d.usercaja, d.userstore, d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.auxcode, d.auxitem, d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, d.concepto, k.afecha AS feccon, b.descripda AS bodega, z.tipsaldo, z.iddocu, z.nomdoc, z.tipo, z.subtipo, z.dtag, z.swaneiva, z.tipnum, z.swkar, z.idsritabla, d.serie, d.numauto, d.fcaducidad, s.scel, s.stelf, s.saddr, s.scode, s.ssri, s.sname, s.sruc, s.scedula, ci.descripda AS sciudad, s.spasaporte, j.sname AS vendedor, u.sname AS nombreu, monedas.moname AS moneda, d.pflag, d.dflag, d.idws, q.reporte FROM ((((((((((documents d LEFT JOIN detagru b ON ((d.userstore = b.iddato))) LEFT JOIN asientosdia k ON ((d.code = k.code))) LEFT JOIN vsecudoc z ON ((d.idsecudoc = z.idsecudoc))) LEFT JOIN imagenrep q ON ((z.idimage = q.idimage)))   LEFT JOIN sujetos u ON ((d.idugra = u.idsujeto))) LEFT JOIN periodos o ON ((d.pdocode = o.pdocode))) LEFT JOIN monedas ON ((o.moneda = monedas.mocode))) LEFT JOIN sujetos s ON ((d.cliente = s.idsujeto))) LEFT JOIN sujetos j ON ((d.seller = j.idsujeto))) LEFT JOIN detagru ci ON ((s.sciudad = ci.iddato))) ;


--d.serie, d.idws 
--CREATE VIEW "vdocusmall" AS SELECT DISTINCT d.code, d.userstore, d.num, d.cliente, d.fecha, d.pdocode, d.seller, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.descuconiva, d.descusiniva, d.subtotal, d.ivavalor, d.ivabienes, d.montototal, d.saldo, d.tmpsaldo, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, v.swkar, d.serie, d.fcaducidad, u.scode, u.ssri, u.sname, u.sruc, u.scedula, d.pflag, d.dflag, d.idws FROM (((documents d LEFT JOIN secudoc s ON ((d.idsecudoc = s.idsecudoc))) LEFT JOIN docuse v ON ((s.iddocu = v.iddocu))) LEFT JOIN sujetos u ON ((d.cliente = u.idsujeto))) ;
CREATE VIEW vdocusmall AS SELECT DISTINCT d.code, d.userstore, d.num, d.cliente, d.fecha, d.pdocode, d.idsecudoc, d.seller, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subtotal, d.subconiva, d.subsiniva, d.ivavalor, d.ivabienes, d.montototal, d.icevalor, d.ipsvalor, d.saldo, d.tmpsaldo, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, v.idsritabla, v.swkar, d.serie, d.fcaducidad, u.scode, u.ssri, u.sname, u.sruc, u.scedula, u.saddr, d.pflag, d.dflag, d.idws FROM (((documents d LEFT JOIN secudoc s ON ((d.idsecudoc = s.idsecudoc))) LEFT JOIN docuse v ON ((s.iddocu = v.iddocu))) LEFT JOIN sujetos u ON ((d.cliente = u.idsujeto))) ;


CREATE VIEW vdocuret AS SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.secueret, d.autoret, d.fcaducret, d.numserie2, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc FROM (((((((aneiva d LEFT JOIN vdocusmall u ON ((d.code = u.code))) LEFT JOIN cobros c ON ((c.code = d.code))) LEFT JOIN rubros r ON ((c.rubcode = r.rubcode))) LEFT JOIN sritabla s ON ((d.idtipdoc = s.idsritabla))) LEFT JOIN detagru g ON ((s.iddato = g.iddato))) LEFT JOIN secudoc z ON ((d.idsecudoc = z.idsecudoc))) LEFT JOIN reversodoc v ON ((z.iddocu = v.iddocu))) WHERE c.isdocret;
	
CREATE VIEW "vauxcon" as SELECT DISTINCT a.tipo, a.idauxiliar, (substr(a.auxiliar, 2, 5))::character(5) AS auxiliar, a.auxname FROM ((SELECT DISTINCT 'B'::bpchar AS tipo, c.idcuenta AS idauxiliar, to_char(c.numaux, ('09999'::bpchar)::text) AS auxiliar, ((btrim((b.descripda)::text, ' '::text) || ' '::text) || ((c.nucuban)::character varying(15))::text) AS auxname FROM detagru b, ctasban c WHERE (c.idbanco = b.iddato)  UNION SELECT DISTINCT 'S'::bpchar AS tipo, s.idsujeto AS idauxiliar, to_char(s.scode, ('09999'::bpchar)::text) AS auxiliar, CASE WHEN (char_length(btrim((s.sname)::text, ' '::text)) = 0) THEN s.ssri ELSE s.sname END AS auxname FROM sujetos s ) UNION SELECT DISTINCT 'I'::bpchar AS tipo, i.iditem AS idauxiliar, to_char(i.icode, ('09999'::bpchar)::text) AS auxiliar, i.iname AS auxname FROM vitems i ) a ORDER BY a.tipo, (substr(a.auxiliar, 2, 5))::character(5);

CREATE VIEW "vdiario" as SELECT DISTINCT a.pdocode, a.code, a.numasi, p.plancod, a.afecha, a.isanulado, p.idplancuenta, p.cuenta AS nomcta, p.auxcode, x.auxiliar, x.auxname, p.plannivel, m.idaux, m.debe, m.haber FROM (((asientosdia a LEFT JOIN asientosmov m ON ((a.idasiento = m.idasiento))) LEFT JOIN vplancta p ON ((m.idcta = p.idplancuenta))) LEFT JOIN vauxcon x ON ((m.idaux = x.idauxiliar))) ORDER BY a.pdocode, a.code, a.numasi, p.plancod, a.afecha, p.idplancuenta, p.cuenta, x.auxiliar, x.auxname, p.plannivel, m.idaux, m.debe, m.haber;

CREATE VIEW "vsaldoscon" as SELECT DISTINCT sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, p.plannivel, sc.debe, sc.haber, p.cuenta FROM saldoscon sc, vplancta p, vauxcon a, periodos pr WHERE (((sc.pdocode = pr.pdocode) AND (sc.idplancuenta = p.idplancuenta)) AND (sc.idaux = a.idauxiliar)) ORDER BY sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, p.plannivel, sc.debe, sc.haber;

CREATE VIEW "vsecuencias" AS SELECT d.descripda AS secuencia, s.descrip AS descripcion, s.numese AS num_actual, s.serie, s.idsecu FROM (secuencias s LEFT JOIN detagru d ON ((s.idsecuencia = d.iddato)));

CREATE VIEW "vconproter" AS SELECT i.iname, m.iname AS matepri, m.icode, m.artcosto, i.unidad, p.qty, p.idconproter, p.codmatpri, p.idproter FROM ((conproter p LEFT JOIN vitems i ON ((p.idproter = i.iditem))) LEFT JOIN items m ON ((p.codmatpri = m.iditem))) ORDER BY i.iname;

CREATE VIEW "vsaldosc" as SELECT DISTINCT p.plancod AS codigo, a.auxname AS auxiliar, sc.debe, sc.haber, a.auxiliar AS codaux, p.cuenta, sc.idsaldocon, sc.pdocode, a.idauxiliar, pr.fecfin, p.idplancuenta, p.plannivel FROM saldoscon sc, vplancta p, vauxcon a, periodos pr WHERE (((sc.pdocode = pr.pdocode) AND (sc.idplancuenta = p.idplancuenta)) AND (sc.idaux = a.idauxiliar)) ORDER BY sc.idsaldocon, sc.pdocode, p.plancod, a.idauxiliar, a.auxiliar, a.auxname, pr.fecfin, p.idplancuenta, p.plannivel, sc.debe, sc.haber, p.cuenta;

CREATE VIEW "vaneuret" AS SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.secueret, d.numserie3, d.numauto3, d.fcaducidad3, d.idws, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc FROM (((((((aneiva d LEFT JOIN vdocuments u ON ((d.code = u.code))) LEFT JOIN cobros c ON ((c.code = d.code))) LEFT JOIN rubros r ON ((c.rubcode = r.rubcode))) LEFT JOIN sritabla s ON ((d.idtipdoc = s.idsritabla))) LEFT JOIN detagru g ON ((s.iddato = g.iddato))) LEFT JOIN secudoc z ON ((d.idsecudoc = z.idsecudoc))) LEFT JOIN (SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva FROM detagru d, detagru e, docuse f WHERE ((f.tipodoc = d.iddato) AND (f.subtipodoc = e.iddato))) v ON ((z.iddocu = v.iddocu))) WHERE (NOT c.isdocret);
