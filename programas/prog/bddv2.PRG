drop view vsecudoc cascade;

CREATE OR REPLACE VIEW vsecudoc AS 
 SELECT DISTINCT e.idsecudoc, e.iddocu, e.idautosri, e.nota, d.cretri, d.ivaxitem, d.lispre, a.numauto, a.fcaducidad, a.desde, a.hasta, a.femision, a.activo, d.pdocode, d.tipodoc, d.subtipodoc, d.tipsaldo, u.serie, d.dtag, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, d.tipitem, d.auxcode, d.nomdoc, d.swaneiva, d.swiva, d.swdesc, d.swcosto, d.swkar, d.swconta, d.tipcosto, d.idsritabla, i.descripda AS tipo, s.descripda AS subtipo, r.tipo AS rtipo, r.subtipo AS rsubtipo, d.clasedoc, e.estado, u.numese AS numactual, u.idsecu, u.tipper, u.tipnum, u.reinicia, u.manual, substr(u.descrip::text, 1, 10)::character(10) AS descripser, f.reporte, f.idimage
   FROM secudoc e
   LEFT JOIN docuse d ON e.iddocu = d.iddocu
   LEFT JOIN secuencias u ON e.idsecu = u.idsecu
   LEFT JOIN ( SELECT x.iddocu, y.descripda AS tipo, z.descripda AS subtipo
   FROM docuse x, detagru y, detagru z
  WHERE x.tipodoc = y.iddato AND x.subtipodoc = z.iddato) r ON d.idreversodoc = r.iddocu
   LEFT JOIN detagru i ON d.tipodoc = i.iddato
   LEFT JOIN detagru s ON d.subtipodoc = s.iddato
   LEFT JOIN autosri a ON e.idautosri = a.idautosri
   LEFT JOIN imagenrep f ON e.idimage = f.idimage
  ORDER BY e.idsecudoc, e.iddocu, e.idautosri, e.nota, a.numauto, a.fcaducidad, a.desde, a.hasta, a.femision, a.activo, d.pdocode, d.tipodoc, d.subtipodoc, d.tipsaldo, u.serie, d.dtag, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, d.auxcode, d.nomdoc, d.swaneiva, i.descripda, s.descripda, r.tipo, r.subtipo, d.clasedoc, e.estado, u.numese, u.idsecu, u.tipper, u.tipnum, u.reinicia, u.manual, substr(u.descrip::text, 1, 10)::character(10), f.reporte, f.idimage, d.swiva, d.swdesc, d.swcosto, d.tipcosto, d.ivaxitem, d.lispre, d.tipitem, d.swkar, d.swconta, d.idsritabla;

ALTER TABLE vsecudoc OWNER TO postgres;

CREATE OR REPLACE VIEW vdocuments AS 
 SELECT DISTINCT d.idugra, d.fecgra, d.code, d.succode, d.depcode, d.usercaja, d.userstore, d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.auxcode, d.auxitem, d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, d.concepto, k.afecha AS feccon, b.descripda AS bodega, z.tipsaldo, z.iddocu, z.nomdoc, z.tipo, z.subtipo, z.dtag, z.swaneiva, z.tipnum, z.swkar, z.idsritabla, d.serie, d.numauto, d.fcaducidad, s.scel, s.stelf, s.saddr, s.scode, s.ssri, s.sname, s.sruc, s.scedula, ci.descripda AS sciudad, s.spasaporte, j.sname AS vendedor, u.sname AS nombreu, monedas.moname AS moneda, d.pflag, d.dflag, d.idws, q.reporte, z.cretri 
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
   LEFT JOIN detagru ci ON s.sciudad = ci.iddato
  ORDER BY d.idugra, d.fecgra, d.code, d.succode, d.depcode, d.usercaja, d.userstore, d.num, d.idsecudoc, d.cliente, d.fecha, d.pdocode, d.ffrom, d.fto, d.seller, d.casher, d.linkdoc, d.auxcode, d.auxitem, d.duracion, d.taza, d.valcuota, d.numcuota, d.numcajas, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subconiva, d.subsiniva, d.subtotal, d.ivavalor, d.ivabienes, d.icevalor, d.ipsvalor, d.montototal, d.saldo, d.tmpsaldo, d.isguia, d.isupdate, d.isprint, d.isaccount, d.isbodega, d.ispagado, d.isanulado, d.isautorizado, d.isreversado, d.concepto, k.afecha, b.descripda, z.tipsaldo, z.iddocu, z.nomdoc, z.tipo, z.subtipo, z.dtag, z.swaneiva, z.tipnum, z.swkar, z.idsritabla, d.serie, d.numauto, d.fcaducidad, s.scel, s.stelf, s.saddr, s.scode, s.ssri, s.sname, s.sruc, s.scedula, ci.descripda, s.spasaporte, j.sname, u.sname, monedas.moname, d.pflag, d.dflag, d.idws, q.reporte;

ALTER TABLE vdocuments OWNER TO postgres;

drop view vdocuse ;

CREATE OR REPLACE VIEW vdocuse AS 
 SELECT d.pdocode, d.iddocu, d.dtag, d.descrip, d.items, d.sujetos, d.usuarios, d.bancos, d.otros, d.documentos, p.auxcode, d.nomdoc, d.ivaxitem, d.lispre, d.idsritabla, t.debehaber, t.sujaux, i.descripda AS tipo, s.descripda AS subtipo, r.tipo AS rtipo, r.subtipo AS rsubtipo, r.nomdoc AS reversodoc, p.cuenta, p.plancod, u.rubname, l.cuenta AS ctaitem, l.plancod AS plancodite, a.descripda AS tipoart, c.debehaber AS dhitem, d.cretri 
   FROM docuse d
   LEFT JOIN ddocuse t ON d.iddocu = t.iddocu
   LEFT JOIN ( SELECT x.iddocu, x.nomdoc, y.descripda AS tipo, z.descripda AS subtipo
      FROM docuse x, detagru y, detagru z
     WHERE x.tipodoc = y.iddato AND x.subtipodoc = z.iddato) r ON d.idreversodoc = r.iddocu
   LEFT JOIN detagru i ON d.tipodoc = i.iddato
   LEFT JOIN detagru s ON d.subtipodoc = s.iddato
   LEFT JOIN vplancta p ON t.idplancuenta = p.idplancuenta
   LEFT JOIN rubros u ON t.rubcode = u.rubcode
   LEFT JOIN dcontitem c ON t.iddocuse = c.iddocuse
   LEFT JOIN vplancta l ON c.idplancuenta = l.idplancuenta
   LEFT JOIN detagru a ON c.artgrupo = a.iddato
  WHERE t.idplancuenta > 0
  ORDER BY d.nomdoc, p.plancod;

ALTER TABLE vdocuse OWNER TO postgres;


CREATE OR REPLACE VIEW vdocumentg AS 
 SELECT DISTINCT d.code, d.num, v.nomdoc AS documento, s.scode AS cod_persona, s.ssri AS sri, s.sname AS nombre, s.sruc AS ruc, s.scedula AS cedula, r.sname AS vendedor, d.fecha, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.subtotal, d.ivavalor, d.ivabienes, d.montototal, d.saldo, d.tmpsaldo AS saldo_inic, d.isprint AS impreso, d.isaccount AS contabilizado, d.ispagado AS cancelado, d.isanulado AS pagado, d.isautorizado AS autorizado, d.concepto, k.afecha AS fec_conta, d.ffrom AS desde, d.fto AS hasta, d.fecgra AS fec_grabac, b.descripda AS bodega, v.dtag, d.pdocode
   FROM documents d
   LEFT JOIN detagru b ON d.userstore = b.iddato
   LEFT JOIN asientosdia k ON d.code = k.code
   LEFT JOIN vsecudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN ( SELECT f.iddocu, f.pdocode, d.descripda AS tipo, e.descripda AS subtipo, f.tipodoc, f.subtipodoc, f.dtag, f.items, f.clasedoc, f.bancos, f.usuarios, f.otros, f.sujetos, f.documentos, f.tipsaldo, f.nomdoc, f.swaneiva
   FROM detagru d, detagru e, docuse f
  WHERE f.tipodoc = d.iddato AND f.subtipodoc = e.iddato) v ON z.iddocu = v.iddocu
   LEFT JOIN sujetos s ON d.cliente = s.idsujeto
   LEFT JOIN sujetos r ON d.seller = r.idsujeto
  ORDER BY d.code, d.num, v.nomdoc, s.scode, s.ssri, s.sname, s.sruc, s.scedula, r.sname, d.fecha, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.subtotal, d.ivavalor, d.montototal, d.saldo, d.tmpsaldo, d.isprint, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, k.afecha, d.ffrom, d.fto, d.fecgra, b.descripda, v.dtag, d.pdocode, d.ivabienes;

ALTER TABLE vdocumentg OWNER TO postgres;


drop view vdocusmall cascade; 

CREATE OR REPLACE VIEW vdocusmall AS 
 SELECT DISTINCT d.code, d.userstore, d.num, d.cliente, d.fecha, d.pdocode, d.idsecudoc, d.seller, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subtotal, d.subconiva, d.subsiniva, d.ivavalor, d.ivabienes, d.montototal, d.icevalor, d.ipsvalor, d.saldo, d.tmpsaldo, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, v.idsritabla, v.swkar, d.serie, d.fcaducidad, u.scode, u.ssri, u.sname, u.sruc, u.scedula, u.saddr, d.pflag, d.dflag, d.idws, v.cretri 
   FROM documents d
   LEFT JOIN secudoc s ON d.idsecudoc = s.idsecudoc
   LEFT JOIN docuse v ON s.iddocu = v.iddocu
   LEFT JOIN sujetos u ON d.cliente = u.idsujeto
  ORDER BY d.code, d.userstore, d.num, d.cliente, d.fecha, d.pdocode, d.idsecudoc, d.seller, d.linkdoc, d.valcuota, d.numcuota, d.poriva, d.descuconiva, d.descusiniva, d.recargo, d.flete, d.subtotal, d.subconiva, d.subsiniva, d.ivavalor, d.ivabienes, d.montototal, d.icevalor, d.ipsvalor, d.saldo, d.tmpsaldo, d.isaccount, d.ispagado, d.isanulado, d.isautorizado, d.concepto, v.tipsaldo, v.iddocu, v.nomdoc, v.dtag, v.swaneiva, v.idsritabla, v.swkar, d.serie, d.fcaducidad, u.scode, u.ssri, u.sname, u.sruc, u.scedula, u.saddr, d.pflag, d.dflag, d.idws;

ALTER TABLE vdocusmall OWNER TO postgres;


CREATE OR REPLACE VIEW vaneuret AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.secueret, d.numserie3, d.numauto3, d.fcaducidad3, d.idws, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc
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
  WHERE NOT c.isdocret;

ALTER TABLE vaneuret OWNER TO postgres;

CREATE OR REPLACE VIEW vdocuret AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.secueret, d.autoret, d.fcaducret, d.numserie2, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc
   FROM aneiva d
   LEFT JOIN vdocusmall u ON d.code = u.code
   LEFT JOIN cobros c ON c.code = d.code
   LEFT JOIN rubros r ON c.rubcode = r.rubcode
   LEFT JOIN sritabla s ON d.idtipdoc = s.idsritabla
   LEFT JOIN detagru g ON s.iddato = g.iddato
   LEFT JOIN secudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN reversodoc v ON z.iddocu = v.iddocu
  WHERE c.isdocret;

ALTER TABLE vdocuret OWNER TO postgres;
