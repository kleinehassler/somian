**
FUNCTION sqli
 PARAMETER insql, nomtab
 LOCAL are
 are = ALIAS()
 IF EMPTY(nomtab) .OR. ISNULL(nomtab)
    IF SQLEXEC(nconec, insql)<0
       DO regerrbd
       WAIT WINDOW NOWAIT 'Error en consulta'
       IF  .NOT. EMPTY(are)
          SELECT &are
       ENDIF
       x = 1
       RETURN .F.
    ELSE
       RETURN .T.
    ENDIF
 ELSE
    IF SQLEXEC(nconec, insql, nomtab)<0
       DO regerrbd
       WAIT WINDOW NOWAIT 'Error en '+nomtab
       IF  .NOT. EMPTY(are)
          SELECT &are
       ENDIF
       x = 1
       RETURN .F.
    ELSE
       RETURN .T.
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION empresas
 q1 = "select ssri, sruc from empresas;"
 IF  .NOT. sqli(q1, 'empresas')
    RETURN .F.
 ENDIF
 SELECT empresas
 IF RECCOUNT()=1
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION taccesos
 q1 = "select * from accesos;"
 RETURN sqli(q1, 'taccesos')
ENDFUNC
**
FUNCTION usuempre
 q1 = "select u.idsujeto, u.sname as nombreu, u.tipou, u.scode "+"from vusuarios u ;"
 RETURN sqli(q1, 'usuempre')
ENDFUNC
**
FUNCTION programas
 q1 = "select idprograma, descrippro, progname "+"from programas "+"order by progname;"
 RETURN sqli(q1, 'programas')
ENDFUNC
**
FUNCTION articulosc
 PARAMETER tipart
 LOCAL tipo
 tipo = tipart
 IF EMPTY(tipo) .OR. tipo='TD'
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artipo, artmarca, isiva, "+"artcosto, artcosto2 "+" from vitems ;"
    RETURN sqli(q1, 'articulosc')
 ENDIF
 q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artipo, artmarca, isiva, "+"artcosto, artcosto2 "+"from vitems "+"where itipo=1 and substr(valordagru,1,2)="+alup(tipo)+" ;"
 RETURN sqli(q1, 'articulosc')
ENDFUNC
**
FUNCTION articulos
 PARAMETER tipo
 IF ISNULL(tipo)
    RETURN .F.
 ENDIF
 IF tipo>0
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+"from vitems "+"where itipo=1 and artgrupo="+alup(tipo)+" order by icode,iname;"
    RETURN sqli(q1, 'articulos')
 ELSE
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+"from vitems "+"where itipos=1 order by icode, iname;"
    RETURN sqli(q1, 'articulos')
 ENDIF
ENDFUNC
**
FUNCTION servicios
 PARAMETER tipo
 LOCAL tipser
 tipser = tipo
 IF  .NOT. EMPTY(tipser)
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+"from vitems "+"where itipo=3 and artgrupo="+alup(tipser)+" order by icode, iname;"
    RETURN sqli(q1, 'servicios')
 ELSE
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+"from vitems "+"where itipo=3 and order by icode, iname;"
    RETURN sqli(q1, 'servicios')
 ENDIF
ENDFUNC
**
FUNCTION actitems
 PARAMETER tipo
 LOCAL tact
 tact = tipo
 IF  .NOT. EMPTY(tact)
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+" from vitems "+"where itipo=2 and artgrupo="+alup(tact)+" order by icode, iname;"
    RETURN sqli(q1, 'actitems')
 ELSE
    q1 = "select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+"artcosto "+" from items "+"where itipo=2 order by icode, iname;"
    RETURN sqli(q1, 'actitems')
 ENDIF
ENDFUNC
**
FUNCTION vtitems
 PARAMETER tipo
 IF tipo>0
    q1 = "select iditem, icode, iname, isiva, artcosto "+" from vitems "+"where  itipo="+alup(tipo)+" order by iname,icode;"
    RETURN sqli(q1, 'vtitems')
 ELSE
    RETURN sqli("select iditem, icode, iname, isiva, artcosto "+"from items "+"order by iname, icode;", 'vtitems')
 ENDIF
ENDFUNC
**
FUNCTION dg
 PARAMETER c
 LOCAL t
 q1 = "select iddato, descripda, valorda, gtable "+"from datosgen where gtag="+alup(c)+" ;"
 IF  .NOT. sqli(q1, 'resul')
    RETURN .F.
 ELSE
    SELECT resul
    t = ALLTRIM(gtable)
    IF EMPTY(t)
       RETURN .F.
    ENDIF
    SELECT iddato, descripda, valorda FROM resul  ORDER BY descripda  INTO CURSOR &t
    SELECT resul
    USE
    SELE &t
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION dge
 PARAMETER c
 LOCAL resul
 resul = ''
 DO CASE
    CASE c='BODE'
       resul = 'bodegas'
    OTHERWISE
       RETURN .F.
 ENDCASE
 RETURN sqli("select iddato, descripda, valorda from datosgen where gtag="+alup(c)+" order by descripda;", resul)
ENDFUNC
**
FUNCTION plancuentamov
 PARAMETER tip
 LOCAL aux
 IF EMPTY(tip)
    aux = alup(.T.)
 ELSE
    aux = 'auxcode='+alup(tip)
 ENDIF
 q1 = "SELECT distinct idplancuenta, plancod, plannivel, plantype, cuenta, "+"auxcode, pdocode, plancod as codigo, isdet "+"FROM vplancta "+"WHERE plantype='M' and "+aux+" and pdocode="+alup(iprd)+" order by plancod,cuenta;"
 IF  .NOT. sqli(q1, 'plancuentamov')
    RETURN .F.
 ELSE
    SELECT idplancuenta, plancod, plannivel, plantype, isdet, IIF(ISNULL(auxcode), ' ', auxcode) AS auxcode, pdocode, cuenta, codigo FROM plancuentamov INTO CURSOR plancuentamov
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION plancuenta
 PARAMETER idpdox
 IF EMPTY(idpdox)
    idpdox = iprd
 ENDIF
 q1 = "SELECT distinct idplancuenta, plancod, plannivel, plantype, "+"auxcode, pdocode, cuenta, plancod as codigo, isdet "+"FROM vplancta "+"WHERE pdocode="+alup(idpdox)+" order by plancod,cuenta;"
 IF  .NOT. sqli(q1, 'plancuenta')
    RETURN .F.
 ELSE
    SELECT idplancuenta, plancod, plannivel, plantype, isdet, IIF(ISNULL(auxcode), ' ', auxcode) AS auxcode, pdocode, cuenta, codigo FROM plancuenta INTO CURSOR plancuenta
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION auxplancta
 PARAMETER idpdoy
 IF EMPTY(idpdoy)
    idpdoy = iprd
 ENDIF
 q1 = "select distinct plancod, nomcta as cuenta, idplancuenta, auxiliar::char(6) as auxiliar, auxname::char(60) as auxname "+"from vdiario "+"where not isanulado and pdocode="+alup(idpdoy)+";"
 RETURN sqli(q1, 'auxplancta')
ENDFUNC
**
FUNCTION rubrosda
 RETURN sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula "+"from rubros where rubtype='D' or rubtype='A' "+" order by rubname;", 'rubrosda')
ENDFUNC
**
FUNCTION rubros
 PARAMETER tr
 IF EMPTY(tr)
    RETURN sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula, "+"rubtab, isactivo, isinput, tie "+"from rubros "+" order by rubname;", 'rubros')
 ELSE
    DO CASE
       CASE tr='C'
          RETURN sqli("select rubcode, rubname, rubtype, rubformula, isactivo, rubtab, isinput, tie "+"from rubros where rubtype='C' "+" order by rubname;", 'rubros')
       CASE tr='D'
          RETURN sqli("select rubcode, rubname, rubformula, isactivo, rubtab, isinput, tie "+"from rubros "+"where rubtype='D' "+"order by rubname;", 'rubros')
       CASE tr='R'
          RETURN sqli("select rubcode, rubname, rubformula, isactivo, rubtab, isinput, tie "+"from rubros "+"where rubtype='R' "+"order by rubname;", 'rubros')
       CASE tr='DA'
          RETURN sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula, "+"rubtab, isactivo, isinput, tie "+"from rubros "+"where rubtype='D' or rubtype='A' "+" order by rubname;", 'rubros')
    ENDCASE
 ENDIF
ENDFUNC
**
FUNCTION docu
 PARAMETER d, n
 RETURN sqli("select distinct code, idsecudoc, sname, bodega, fecha, linkdoc,  montototal, "+"ispagado, isanulado, isaccount, cliente "+"from vdocusmall "+"where idsecudoc="+alup(d)+" and num="+alup(n)+";", 'docu')
ENDFUNC
**
FUNCTION docuset
 PARAMETER d
 q1 = "select distinct d.iddocu, d.items, d.bancos, d.sujetos, d.rubrol, d.ninguno, d.swiva, "+"d.swdesc, d.swkar, d.lispre, d.documentos, d.pagos, t.rubcode, r.rubname, r.rubtype, "+"t.idplancuenta, t.cabedeta, t.sujaux, t.isinicial, t.itunacta, d.iscero, p.auxsuj, "+"t.debehaber, g.descripda as cuenta, p.auxcode, p.plancod, t.iddocuse, d.tipliq "+"from secudoc s, docuse d, ddocuse t, vplancta p, datosgen g, rubros r "+"where  s.iddocu=d.iddocu and d.iddocu=t.iddocu and t.rubcode=r.rubcode and "+"t.idplancuenta=p.idplancuenta and p.idcuenta=g.iddato and "+"t.idplancuenta>0 and s.idsecudoc="+alup(d)+" and "+"s.pdocode="+alup(iprd)+" and d.pdocode="+alup(iprd)+" and "+"p.pdocode="+alup(iprd)+";"
 RETURN sqli(q1, 'docuset')
ENDFUNC
**
FUNCTION cobros
 PARAMETER c
 RETURN sqli("select distinct rubcode, valor, isupdate  "+"from cobros  "+"where code="+alup(c)+" order by rubcode;", 'cobros')
ENDFUNC
**
FUNCTION insertdocmul
 RETURN sqli("insert into docmul (nrodoc, iddocu, fecha, pdocode, subtotal, "+"idsujeto, codusu, observac, numero, isprint, isanulado, isgenerado ) values "+pal(nrodocm)+al(iddocum)+al(fecham)+al(iprd)+al(subtotalm)+al(idsujetom)+al(idu)+al(observacm)+al(numerom)+al(isprintm)+al(isanuladom)+ual(isgeneradom))
ENDFUNC
**
FUNCTION proemcli
 PARAMETER c
 DO CASE
    CASE c='C'
       RETURN sqli("select  CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+"scode, idsujeto "+"from sujetos where iscliente "+";", 'sclientes')
    CASE c='P'
       RETURN sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+"scode, idsujeto "+"from sujetos where isproductor "+";", 'sproductores')
    CASE c='R'
       RETURN sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+"scode, idsujeto "+"from sujetos where isproveedor "+";", 'sproveedores')
    CASE c='E'
       RETURN sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+"scode, idsujeto "+"from sujetos where isempleado "+";", 'sempleados')
 ENDCASE
ENDFUNC
**
FUNCTION fsujetos
 RETURN sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+"scode, idsujeto "+"from sujetos order by sname;", 'sujetos')
ENDFUNC
**
FUNCTION ctasban
 RETURN sqli("select c.*, substr(d.descripda,1,20)::char(20) as descripda "+"from ctasban c, detagru d "+"where c.idbanco=d.iddato "+" order by d.descripda;", 'ctasban')
ENDFUNC
**
FUNCTION reversodoc
 PARAMETER tipdock
 IF EMPTY(tipdock)
    RETURN sqli("select distinct nomdoc, iddocu, clasedoc, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" order by nomdoc;", 'reversodoc')
 ELSE
    DO CASE
       CASE TYPE('tipdock')='N'
          RETURN sqli("select distinct nomdoc, iddocu, clasedoc, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and clasedoc="+alup(tipdock)+" order by nomdoc;", 'reversodoc')
       CASE TYPE('tipdock')='C'
          DO CASE
             CASE tipdock='D'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and documentos"+" order by nomdoc;", 'reversodoc')
             CASE tipdock='I'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and items"+" order by nomdoc;", 'reversodoc')
             CASE tipdock='S'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and sujetos"+" order by nomdoc;", 'reversodoc')
             CASE tipdock='B'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and bancos"+" order by nomdoc;", 'reversodoc')
             CASE tipdock='R'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and rubrol"+" order by nomdoc;", 'reversodoc')
             CASE tipdock='P'
                RETURN sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+"tipo, subtipo, tipsaldo, swconta "+"from reversodoc "+"where pdocode="+alup(iprd)+" and pagos"+" order by nomdoc;", 'reversodoc')
          ENDCASE
    ENDCASE
 ENDIF
ENDFUNC
**
FUNCTION secudoc
 PARAMETER codoc, fecdoc
 LOCAL l, i, h, f
 l = LEN(ALLTRIM(codoc))
 i = 0
 numy = 0
 IF EMPTY(l)
    RETURN .F.
 ENDIF
 IF  .NOT. EMPTY(fecdoc)
    f = fecdoc
 ELSE
    f = hoy
 ENDIF
 idst = idws
 IF escaja
    q1 = "select idworkstation as idwork from usuarios where idsujeto="+alup(idu)
    IF sqli(q1, 'estrca')
       SELECT estrca
       IF RECCOUNT()=0
          RETURN .F.
       ELSE
          idst = estrca.idwork
       ENDIF
    ENDIF
 ENDIF
 q1 = "select distinct s.idsecudoc, s.numactual, s.serie, s.iddocu, s.swaneiva, s.ajucon, "+"s.descripser, s.idautosri, s.numauto, s.fcaducidad,  s.desde, s.hasta, "+"s.femision, s.activo, s.tipper, s.reinicia, s.idsecu, s.clasedoc, s.manual, "+"s.lispre, s.swiva, s.swdesc, s.swkar, s.tipcosto, s.tipsaldo, s.tipitem, "+"s.ivaxitem, s.swconta, s.swprint, s.swclose, s.isdevo, s.numregdet, s.tipliq, s.iscero "+"from vsecudoc s, secuwork w "+"where s.estado and s.idsecudoc=w.idsecudoc and s.dtag="+alup(ALLTRIM(codoc))+" and w.idworkstation="+alup(idws)+" and s.pdocode="+alup(iprd)+" ;"
 IF  .NOT. sqli(q1, 'secudoc')
    RETURN .F.
 ENDIF
 SELECT secudoc
 IF RECCOUNT('secudoc')=0
    WAIT WINDOW NOWAIT 'El Documento no está Autorizado en este Equipo'+CHR(13)+'O no esta activo'
    RETURN .F.
 ENDIF
 IF  .NOT. activo
    = MESSAGEBOX('Esta serie no esta activa, SRI', 0, empresa)
    RETURN .F.
 ENDIF
 IF  .NOT. ISNULL(fcaducidad)
    IF fcaducidad<hoy
       = MESSAGEBOX('El documento ha caducado, no es posible su emisión', 0, empresa)
       RETURN .F.
    ENDIF
 ENDIF
 h = IIF(EMPTY(hasta) .OR. ISNULL(hasta), 999999999, hasta)
 IF RECCOUNT('secudoc')>1
    IF clasedoc=2
       SELECT secudoc
       GOTO TOP
       LOCATE FOR ALLTRIM(descripser)=ctanums
       IF  .NOT. FOUND()
          = MESSAGEBOX('Documento Bancario sin secuencia', 0, empresa)
          RETURN .F.
       ENDIF
       IF  .NOT. secudoc.manual
          numy = IIF(ISNULL(numactual) .OR. EMPTY(numactual), 0, numactual)+1
       ENDIF
       idsecudocy = idsecudoc
       tippery = tipper
       doccodey = iddocu
       RETURN .T.
    ELSE
       = MESSAGEBOX('Escoja una de las series', 0)
       SET SHADOWS ON
       DEFINE POPUP gridpopup FROM MROW(), MCOL() PROMPT FIELDS STR(IIF(ISNULL(secudoc.serie), 0, secudoc.serie))+SPACE(3)+secudoc.descripser MARGIN SHORTCUT
       ON SELECTION POPUP gridpopup DEACTIVATE POPUP gridpopup
       ACTIVATE POPUP gridpopup
       i = idsecudoc
       RELEASE POPUPS gridpopup
       SELECT * FROM secudoc WHERE idsecudoc=i INTO CURSOR secudoc
    ENDIF
 ENDIF
 SELECT secudoc
 IF  .NOT. reinicia
    IF  .NOT. secudoc.manual
       numy = IIF(ISNULL(numactual) .OR. EMPTY(numactual), 0, numactual)+1
    ENDIF
    IF numy>h
       = MESSAGEBOX('Documento supera el limite de autorización', 0, empresa)
       RETURN .F.
    ENDIF
    idsecudocy = idsecudoc
    tippery = tipper
    doccodey = iddocu
    RETURN .T.
 ELSE
    DO CASE
       CASE tipper=1
          IF  .NOT. sqli("select max(d.num) as numactual "+"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc) "+"where s.idsecu="+alup(idsecu)+" and to_char(fecha,'YYYYMM')="+alup(ALLTRIM(STR(YEAR(f)*100+MONTH(f))))+";", 'ntid')
             RETURN .F.
          ENDIF
       CASE tipper=2
          IF  .NOT. sqli("select max(d.num) as numactual "+"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc) "+"where s.idsecu="+alup(idsecu)+" and to_char(d.fecha,'YYYY')="+alup(ALLTRIM(STR(YEAR(f))))+";", 'ntid')
             RETURN .F.
          ENDIF
       CASE tipper=3
          IF  .NOT. sqli("select max(d.num) as numactual "+"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc)"+"where s.idsecu="+alup(idsecu)+" and d.pdocode="+alup(iprd)+";", 'ntid')
             RETURN .F.
          ENDIF
       OTHERWISE
          = MESSAGEBOX('error en secuencia del documento', 0, empresa)
          RETURN .F.
    ENDCASE
    IF  .NOT. secudoc.manual
       numy = IIF(ISNULL(ntid.numactual), 0, ntid.numactual)+1
    ENDIF
    SELECT ntid
    USE
    IF numy>h
       = MESSAGEBOX('Documento supera el limite de autorización.... ', 0, empresa)
       RETURN .F.
    ENDIF
    SELECT secudoc
    idsecudocy = idsecudoc
    tippery = tipper
    doccodey = iddocu
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION UPSECUDOC
 PARAMETER cdup
 IF  .NOT. sqli("select idsecu from secudoc where idsecudoc="+alup(cdup)+";", 'docuup')
    RETURN .F.
 ENDIF
 SELECT docuup
 IF RECCOUNT('docuup')=0
    RETURN .F.
 ENDIF
 RETURN sqli("update secuencias set numese = "+alup(numy)+" where idsecu = "+alup(docuup.idsecu)+";")
ENDFUNC
**
FUNCTION tiposdoc
 PARAMETER t
 IF EMPTY(t)
    IF  .NOT. sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+"from vsecudoc "+"where estado and pdocode="+alup(iprd)+";", 'tiposdoc')
       RETURN .F.
    ENDIF
 ENDIF
 DO CASE
    CASE t='B'
       RETURN sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+"from vsecudoc "+"where clasedoc=2 and estado and pdocode="+alup(iprd)+";", 'tiposdoc')
    CASE t='C'
       RETURN sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+"from vsecudoc "+"where clasedoc=1 and estado and pdocode="+alup(iprd)+";", 'tiposdoc')
 ENDCASE
ENDFUNC
**
FUNCTION docseries
 RETURN sqli("select distinct idsecudoc, serie, nomdoc "+"from vsecudoc "+"where pdocode="+alup(iprd)+" and estado order by nomdoc,serie;", 'docseries')
ENDFUNC
**
FUNCTION dgdoc
 PARAMETER codw, kard
 LOCAL cfz
 IF TYPE('codw')='N'
    IF  .NOT. EMPTY(codw)
       cfz = "c.idgdoc="+alup(codw)
    ELSE
       cfz = alup(.T.)
    ENDIF
 ELSE
    IF  .NOT. EMPTY(codw)
       cfz = "c.tag="+alup(codw)
    ELSE
       cfz = alup(.T.)
    ENDIF
 ENDIF
 RETURN sqli("select distinct a.nomdoc as tipo, "+"a.dtag, a.iddocu, b.iddato1, b.iddato2, a.tipsaldo "+"from vsecudoc a, dgdoc b, gdoc c "+"where a.dtag=b.dtag and c.idgdoc=b.idgdoc and "+"a.pdocode="+alup(iprd)+" and a.estado and "+cfz+" order by a.nomdoc;", 'dgdoc')
ENDFUNC
**
FUNCTION dgdocs
 PARAMETER cod
 IF  .NOT. EMPTY(cod)
    cf = ALLTRIM(cod)
 ELSE
    cf = ''
 ENDIF
 RETURN sqli("select distinct substr(a.tipo,1,15)::char(15)||' '||substr(a.subtipo,1,25)::char(25) as tipo, "+"a.serie, a.idsecudoc, a.dtag, a.iddocu, b.iddato1, b.iddato2 "+"from vsecudoc a, dgdoc b, gdoc c "+"where a.dtag=b.dtag "+" and c.idgdoc=b.idgdoc and a.estado and "+"a.pdocode="+alup(iprd)+" and c.tag="+alup(cf)+" order by tipo;", 'dgdocs')
ENDFUNC
**
FUNCTION accesos
 PARAMETER prog
 pr = UPPER(ALLTRIM(prog))
 IF EMPTY(pr)
    RETURN .F.
 ENDIF
 IF  .NOT. USED('accesos')
    q1 = "select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+"from accesos a, programas p "+"where p.idprograma=a.idprog and a.idsujeto="+alup(idu)+" and p.estapro union "+"(select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+"from acceper a, programas p, usuarios u "+"where p.idprograma=a.idprog and a.idperfil=u.tipou "+" and p.estapro and u.idsujeto="+alup(idu)+") order by progname;"
    IF  .NOT. sqli(q1, 'accesos')
       RETURN .F.
    ENDIF
 ENDIF
 SELECT accesos
 IF RECCOUNT()>0
    GOTO TOP
    LOCATE FOR pr$progname
    IF FOUND()
       RETURN .T.
    ENDIF
 ENDIF
 RETURN .F.
ENDFUNC
**
FUNCTION accesop
 PARAMETER prog, oper
 pr = UPPER(ALLTRIM(prog))
 op = UPPER(ALLTRIM(oper))
 IF EMPTY(pr) .AND. EMPTY(op)
    RETURN .F.
 ENDIF
 IF  .NOT. isabierto
    RETURN .F.
 ENDIF
 swac = .F.
 IF  .NOT. sqli("select a.actu, a.inser, a.anu "+"from accesos a, programas p "+"where p.idprograma=a.idprog and a.idsujeto="+alup(idu)+" and p.progname ~~ "+alup('%'+ALLTRIM(pr)+'%')+" and p.estapro;", 'numprog')
    RETURN .F.
 ELSE
    SELECT numprog
    IF RECCOUNT('numprog')>0
       GOTO TOP
       DO WHILE  .NOT. EOF()
          DO CASE
             CASE op='M' .AND. actu
                swac = .T.
                EXIT
             CASE op='B' .AND. anu
                swac = .T.
                EXIT
             CASE op='A' .AND. inser
                swac = .T.
                EXIT
          ENDCASE
          SKIP
       ENDDO
    ELSE
       USE
    ENDIF
    IF swac
       RETURN .T.
    ENDIF
 ENDIF
 IF  .NOT. sqli("select a.actu, a.inser, a.anu "+"from acceper a, programas p, usuarios u "+"where p.idprograma=a.idprog and a.idperfil=u.tipou "+" and p.progname ~~ "+alup('%'+ALLTRIM(pr)+'%')+" and p.estapro and u.idsujeto="+alup(idu)+";", 'numprog')
    RETURN .F.
 ELSE
    SELECT numprog
    IF RECCOUNT('numprog')>0
       GOTO TOP
       DO WHILE  .NOT. EOF()
          DO CASE
             CASE op='M' .AND. actu
                swac = .T.
                EXIT
             CASE op='B' .AND. anu
                swac = .T.
                EXIT
             CASE op='A' .AND. inser
                swac = .T.
                EXIT
          ENDCASE
          SKIP
       ENDDO
    ENDIF
    USE
 ENDIF
 RETURN swac
ENDFUNC
**
FUNCTION autper
 PARAMETER pcod, proceso
 LOCAL swproceso, docp
 IF EMPTY(pcod) .OR. EMPTY(proceso)
    RETURN .F.
 ENDIF
 q1 = "select iddocu from vdocusmall where code="+alup(pcod)
 IF  .NOT. sqli(q1, 'docacc')
    RETURN .F.
 ENDIF
 IF RECCOUNT('docacc')=0
    RETURN .F.
 ENDIF
 SELECT docacc
 GOTO TOP
 docp = docacc.iddocu
 IF  .NOT. USED('accdocper')
    q1 = "select distinct autori, anuasi, anutot, consul "+"from accdoc a "+"where idsujeto="+alup(idu)+" and iddocu="+alup(docp)+" union "+"(select distinct autori, anuasi, anutot, consul "+"from accdocper a, usuarios u "+"where a.idperfil=u.tipou and u.idsujeto="+alup(idu)+" and iddocu="+alup(docp)+") ;"
    IF  .NOT. sqli(q1, 'accdocper')
       RETURN .F.
    ENDIF
 ENDIF
 swproceso = .F.
 SELECT accdocper
 GOTO TOP
 DO WHILE  .NOT. EOF()
    DO CASE
       CASE proceso=1
          IF autori
             swproceso = .T.
             EXIT
          ENDIF
       CASE proceso=2
          IF anuasi
             swproceso = .T.
             EXIT
          ENDIF
       CASE proceso=3
          IF anutot
             swproceso = .T.
             EXIT
          ENDIF
       CASE proceso=4
          IF consul
             swproceso = .T.
             EXIT
          ENDIF
    ENDCASE
    SELECT accdocper
    SKIP
 ENDDO
 IF swproceso
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION embarques
 RETURN sqli("select embcode, numero,embnumsem, barco, embfecha, embfliquida, marcaja, "+"tipocaja, embcotiza, embcosto, embfob, dcltmpqty, dcldefqty, embcomdesc, "+"embnumcaja, embpesoneto as pesoneto, embpesobruto, embnumforexp, puertollegada as ptolle, "+"pais, puertosalida as ptosal "+"from vembarques "+"where substr(embnota,1,9)<>'NO VALIDO' and pdocode="+alup(iprd)+" order by embnumsem desc;", 'embarques')
ENDFUNC
**
FUNCTION rubrosdoc
 PARAMETER tiprub
 DO CASE
    CASE EMPTY(tiprub)
       RETURN sqli("select rubcode, rubname, rubformula, rubtype from rubros "+"where rubtype='D';", 'rubros')
    CASE tiprub='C'
       RETURN sqli("select rubcode, rubname, rubformula, rubtype from rubros "+"where rubtype='C';", 'rubros')
    CASE tiprub='D'
       RETURN sqli("select rubcode, rubname, rubformula, rubtype from rubros "+"where rubtype='D';", 'rubros')
    CASE tiprub='A'
       RETURN sqli("select rubcode, rubname, rubformula, rubtype from rubros "+"where and rubtype='A';", 'rubros')
 ENDCASE
ENDFUNC
**
FUNCTION sritabla
 PARAMETER arg
 DO CASE
    CASE arg='PEIN'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='PERIODO INFORMADO' "+"order by codigo;", 'perinf')
    CASE arg='SETR'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='SECUENCIAL DE TRANSACCIONES' "+"order by codigo;", 'sectra')
    CASE arg='TICO'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='TIPO DE COMPROBANTE' "+"order by codigo;", 'tipcom')
    CASE arg='CRTR'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='CREDITO TRIBUTARIO' "+"order by codigo;", 'cretri')
    CASE arg='POIV'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla "+"from vsritabla "+"where trim(both ' ' from tabla)='PORCENTAJES DE IVA' "+"order by codigo;", 'poriva')
    CASE arg='REIV'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='PORCENTAJE DE RETENCION DE IVA' "+"order by codigo;", 'retiva')
    CASE arg='POIC'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='PORCENTAJES DE ICE' "+"order by codigo;", 'porice')
    CASE arg='BANC'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='BANCOS' "+"order by codigo;", 'bancos')
    CASE arg='PROV'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='PROVINCIAS' "+"order by codigo;", 'provincias')
    CASE arg='CAIR'
       q1 = "select * "+"from vsritabla "+"where (substr(codigo,1,3)='332' or substr(codigo,1,3)='333' or substr(codigo,1,3)='334') and substr(trim(both ' ' from tabla),1,35)=substr('CODIGO RETENCION FUENTE',1,35) "+"order by codigo;"
       = sqli(q1, 'codairsinr')
       q1 = "select * "+"from vsritabla "+"where (substr(codigo,1,3)<>'332' and substr(codigo,1,3)<>'333' and substr(codigo,1,3)<>'334') and substr(trim(both ' ' from tabla),1,35)=substr('CODIGO RETENCION FUENTE',1,35) "+"order by codigo;"
       RETURN sqli(q1, 'codair')
    CASE arg='FPAX'
       RETURN sqli("select codigo::integer, tabla, descripcion, anio, mes, valor, loncod, iddato, idsritabla  "+"from vsritabla "+"where trim(both ' ' from tabla)='FORMA DE PAGO DOCUMENTOS' "+"order by codigo;", 'formaPago')
    OTHERWISE
       RETURN .F.
 ENDCASE
ENDFUNC
**
FUNCTION ctascondoc
 q1 = "select p.idplancuenta, p.cuenta, p.plancod, p.plannivel, p.auxcode, t.iddocu "+"from vplancta p, ddocuse t "+"where p.pdocode="+alup(iprd)+" and t.idplancuenta=p.idplancuenta "+" order by iddocu;"
 IF  .NOT. sqli(q1, 'ctascondoc')
    RETURN .F.
 ELSE
    SELECT idplancuenta, cuenta, iddocu, auxcode, plancod FROM ctascondoc INTO CURSOR ctascondoc
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION gdoc
 RETURN sqli("select distinct descrip, tag, visilis, impresion, idgdoc "+"from gdoc "+" order by descrip;", 'gdoc')
ENDFUNC
**
FUNCTION tambiempre
 RETURN sqli("select fecini, fecfin, isupdate, isopen, openx, actual, pdocode, moneda, "+"nivelplan "+"from ambiempre "+" order by fecini;", 'tambiempre')
ENDFUNC
**
FUNCTION insaneiva
 PARAMETER codanei
 IF  .NOT. sqli("select distinct code "+"from aneiva "+"where code="+alup(codanei)+";", 'aneiva')
    RETURN .F.
 ENDIF
 SELECT aneiva
 IF RECCOUNT('aneiva')>0
    USE
    WAIT WINDOW NOWAIT 'Ya tiene registrado anexo de iva'
    RETURN .F.
 ENDIF
 USE
 IF  .NOT. sqli("select distinct swaneiva, isanulado "+"from vdocusmall "+"where code="+alup(codanei)+";", 'swanei')
    RETURN .F.
 ENDIF
 SELECT swanei
 IF RECCOUNT('swanei')=0
    WAIT WINDOW NOWAIT 'No existe Documento'
    SELECT swanei
    USE
    RETURN .F.
 ENDIF
 IF isanulado
    WAIT WINDOW NOWAIT 'Documento ANULADO'
    SELECT swanei
    USE
    RETURN .F.
 ENDIF
 IF  .NOT. swaneiva
    WAIT WINDOW NOWAIT 'Documento No acepta datos Anexos de Iva'
    SELECT swanei
    USE
    RETURN .F.
 ENDIF
 SELECT swanei
 USE
 RETURN .T.
ENDFUNC
**
FUNCTION autorizaciones
 RETURN sqli("select distinct * from autosri where activo ;", 'autosri')
ENDFUNC
**
FUNCTION defcampost
 PARAMETER namet
 LOCAL c, d, n, i, j, k, n, f, estruc, t
 f = ''
 d = nomunico()
 DIMENSION estruc(2, 2)
 IF  .NOT. sqli("select * from "+namet+" where 'f';", d)
    RETURN .F.
 ENDIF
 SELE &d
 n = AFIELDS(estruc)
 i = ALEN(estruc, 1)
 FOR j = 1 TO i
    f = 'public '+estruc(j, 1)
    t = TYPE(estruc(j, 1))
    &f
    DO CASE
       CASE t='C'
          f = estruc(j, 1)+"=''"
       CASE t='N'
          f = estruc(j, 1)+"=0"
       CASE t='D'
          f = estruc(j, 1)+"={}"
       CASE t='T'
          f = estruc(j, 1)+"=DTOT({})"
       CASE t='L'
          f = estruc(j, 1)+"=.f."
       CASE t='O'
          f = estruc(j, 1)+"=''"
       OTHERWISE
          f = estruc(j, 1)+"=NULL"
    ENDCASE
    &f
 ENDFOR
 USE
 RETURN .T.
ENDFUNC
**
FUNCTION instabla
 PARAMETER namet, pkt
 IF EMPTY(namet) .OR. EMPTY(pkt)
    RETURN .F.
 ENDIF
 LOCAL d, i, j, k, n, c, f, estruc
 f = ''
 pkt = UPPER(pkt)
 d = nomunico()
 DIMENSION estruc(2, 2)
 IF  .NOT. sqli("select * from "+namet+" where 'f';", d)
    RETURN .F.
 ENDIF
 n = AFIELDS(estruc)
 USE
 i = ALEN(estruc, 1)
 f = 'insert into '+namet+' ('
 FOR j = 1 TO i
    IF i=j
       IF pkt=estruc(j, 1)
          f = SUBSTR(f, 1, LEN(f)-2)
          f = f+') values '
       ELSE
          f = f+estruc(j, 1)+') values '
       ENDIF
    ELSE
       IF pkt<>estruc(j, 1)
          f = f+estruc(j, 1)+', '
       ENDIF
    ENDIF
 ENDFOR
 k = 1
 i = ALEN(estruc, 1)
 FOR k = 1 TO i
    IF k=1
       IF pkt=estruc(k, 1)
          f = f+'('
       ELSE
          f=f+'('+alup(&estruc(k,1))+', '
       ENDIF
    ELSE
       IF k=i
          IF pkt=estruc(k, 1)
             f = SUBSTR(f, 1, LEN(f)-2)
             f = f+') '
          ELSE
             f=f+alup(&estruc(k,1))+') '
          ENDIF
       ELSE
          IF pkt<>estruc(k, 1)
             f=f+alup(&estruc(k,1))+', '
          ENDIF
       ENDIF
    ENDIF
 ENDFOR
 f = ALLTRIM(f)+';'
 IF  .NOT. sqli(f)
    RETURN .F.
 ELSE
    WAIT WINDOW NOWAIT 'Resgritrado'
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION instablack
 PARAMETER namet, pkt
 IF EMPTY(namet) .OR. EMPTY(pkt)
    RETURN .F.
 ENDIF
 LOCAL d, i, j, k, n, c, f, estruc
 f = ''
 pkt = UPPER(pkt)
 d = nomunico()
 DIMENSION estruc(2, 2)
 IF  .NOT. sqli("select * from "+namet+" where 'f';", d)
    RETURN .F.
 ENDIF
 n = AFIELDS(estruc)
 USE
 i = ALEN(estruc, 1)
 f = 'insert into '+namet+' ('
 FOR j = 1 TO i
    IF i=j
       f = f+estruc(j, 1)+') values '
    ELSE
       f = f+estruc(j, 1)+', '
    ENDIF
 ENDFOR
 k = 1
 i = ALEN(estruc, 1)
 FOR k = 1 TO i
    IF k=1
       f=f+'('+alup(&estruc(k,1))+', '
    ELSE
       IF k=i
          f=f+alup(&estruc(k,1))+') '
       ELSE
          f=f+alup(&estruc(k,1))+', '
       ENDIF
    ENDIF
 ENDFOR
 f = ALLTRIM(f)+';'
 IF  .NOT. sqli(f)
    RETURN .F.
 ELSE
    WAIT WINDOW NOWAIT 'Resgritrado'
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION modtabla
 PARAMETER namet, idtabla
 LOCAL d, i, j, k, n, c, f, estruc
 IF EMPTY(namet) .OR. EMPTY(idtabla)
    RETURN .F.
 ENDIF
 f = ''
 idtabla = UPPER(idtabla)
 DIMENSION estruc(2, 2)
 d = nomunico()
 IF  .NOT. sqli("select * from "+namet+" where 'f';", d)
    RETURN .F.
 ENDIF
 n = AFIELDS(estruc)
 USE
 i = ALEN(estruc, 1)
 f = 'update '+namet+' set '
 FOR j = 1 TO i
    IF estruc(j, 1)<>idtabla
       f=f+estruc(j,1)+'='+alup(&estruc(j,1))+', '
    ENDIF
 ENDFOR
 f = ALLTRIM(f)
 n = LEN(f)
 IF SUBSTR(f, n, 1)=','
    f = SUBSTR(f, 1, n-1)
 ENDIF
 f=f+' where '+idtabla+'='+alup(&idtabla)+';'
 IF  .NOT. sqli("begin;")
    RETURN .F.
 ENDIF
 x = 0
 IF  .NOT. sqli(ALLTRIM(f))
    x = 1
 ENDIF
 DO fintrans
 RETURN IIF(x=1, .F., .T.)
ENDFUNC
**
FUNCTION elitabla
 PARAMETER namet, idtabla
 LOCAL f
 IF EMPTY(namet) .OR. EMPTY(idtabla)
    RETURN .F.
 ENDIF
 f = ''
 f='delete from '+namet+' where '+idtabla+'='+alup(&idtabla)+';'
 IF  .NOT. sqli("begin;")
    RETURN .F.
 ENDIF
 x = 0
 IF  .NOT. sqli(ALLTRIM(f))
    x = 1
 ENDIF
 DO fintrans
 RETURN IIF(x=1, .F., .T.)
ENDFUNC
**
FUNCTION actcosart
 PARAMETER ncod
 LOCAL pdoc, b, bi, s, td, ci, qi, idit, icosto, iqty
 q1 = "select distinct tipsaldo, userstore, swkar, istransfer, fecha, isdevo, swconta, isaccount, "+"isanulado, idsecudoc "+"from vdocusmall "+"where code="+alup(ncod)+" and iddocu in "+"(select distinct d.iddocu "+" from gdoc g, dgdoc t, docuse d "+" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "
 IF  .NOT. sqli(q1, 'typsaldo')
    RETURN .F.
 ENDIF
 SELECT typsaldo
 IF RECCOUNT()=0
    RETURN .T.
 ENDIF
 IF  .NOT. swkar
    RETURN .T.
 ENDIF
 IF swconta
    IF  .NOT. isaccount
       RETURN .T.
    ENDIF
 ENDIF
 q1 = "select iditem, iname, icode "+"from items "+"where itipo=1 and iditem in "+"(select iditem from detadoci where code="+alup(ncod)+") ;"
 IF  .NOT. sqli(q1, 'items')
    RETURN
 ENDIF
 SELECT items
 GOTO TOP
 DO WHILE  .NOT. EOF()
    WAIT WINDOW NOWAIT 'Procesando '+ALLTRIM(iname)
    iqty = saldoitem(items.iditem, hoy, )
    icosto = costofec(items.iditem, hoy)
    IF icosto>0
       q1 = "update items set saldocon="+alup(iqty)+", "+"artcosto="+alup(icosto)+" where iditem="+alup(items.iditem)+";"
    ELSE
       q1 = "update items set saldocon="+alup(iqty)+" where iditem="+alup(items.iditem)+";"
    ENDIF
    = sqli(q1)
    SELECT items
    SKIP
 ENDDO
 q1 = "select max(fecha) as fecha, max(code) as code "+"from documents "+"where idsecudoc="+alup(typsaldo.idsecudoc)+" and isaccount and not isanulado"
 IF sqli(q1, 'ultdoc')
    IF typsaldo.fecha<>ultdoc.fecha
       RETURN .T.
    ENDIF
 ENDIF
 q1 = "select iditem, (punitario - descuento/qty) as punitario "+"from detadoci t left join vdocusmall d on (t.code=d.code) "+"where isaccount and not isanulado and d.code="+alup(ncod)+" and d.iddocu in "+"(select distinct d.iddocu "+" from gdoc g, dgdoc t, docuse d "+" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "
 IF sqli(q1, 'ultcosite')
    SELECT ultcosite
    GOTO TOP
    DO WHILE  .NOT. EOF()
       q1 = "update items set costopro="+alup(punitario)+" where iditem="+alup(iditem)+";"
       = sqli(q1)
       SELECT ultcosite
       SKIP
    ENDDO
 ENDIF
 WAIT CLEAR
 RETURN x<>1
ENDFUNC
**
FUNCTION costofec
 PARAMETER i, f
 LOCAL pdoc, b, bi, s, td, ci, qi, idit, fec, ffi
 idit = i
 fec = f
 IF ISNULL(fec) .OR. EMPTY(fec)
    fec = hoy
 ENDIF
 IF ISNULL(idit) .OR. EMPTY(idit)
    RETURN 0
 ENDIF
 q1 = "select iditem, iname, icode, artcosto, costopro "+"from items "+"where itipo=1 and iditem="+alup(idit)
 IF  .NOT. sqli(q1, 'itemst')
    RETURN
 ENDIF
 IF RECCOUNT('itemst')=0
    RETURN 0
 ENDIF
 GOTO TOP
 q1 = "select max(fecsaldo) as fecsaldo "+"from saldosi "+"where fecsaldo<"+alup(fec)+" and iditem="+alup(idit)
 ffi = finip
 IF sqli(q1, 'fmaxsal')
    IF RECCOUNT('fmaxsal')<>0
       ffi = IIF(ISNULL(fmaxsal.fecsaldo) .OR. EMPTY(fmaxsal.fecsaldo), ffi, fmaxsal.fecsaldo)
    ENDIF
 ENDIF
 q1 = "select iditem, sum(qtyini) as inicial, precio "+"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+"where fecsaldo="+alup(ffi)+" and iditem ="+alup(idit)+" group by iditem, precio;"
 IF  .NOT. sqli(q1, 'saldosit')
    RETURN
 ENDIF
 q1 = "select iditem, qty, tipsaldo, artcosto, descuento, fecha, isdevo "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where not istransfer and swkar and fecha>"+alup(ffi)+" and fecha<="+alup(fec)+" and "+fcont+" and not isanulado and iditem="+alup(idit)+" order by iditem, fecha, tipsaldo desc ;"
 IF  .NOT. sqli(q1, 'movit')
    RETURN
 ENDIF
 SELECT itemst
 GOTO TOP
 idit = itemst.iditem
 SELECT saldosit
 GOTO TOP
 LOCATE FOR iditem=idit
 IF FOUND()
    ci = IIF(ISNULL(precio), 0, precio)
    qi = IIF(ISNULL(inicial), 0, inicial)
 ELSE
    ci = 0
    qi = 0
 ENDIF
 SELECT movit
 GOTO TOP
 swc = .T.
 DO WHILE  .NOT. EOF() .AND. swc .AND. movit.iditem=idit
    IF tipsaldo=1
       IF qi>0 .AND. qi-qty>=0
          qi = qi-qty
       ENDIF
    ELSE
       IF  .NOT. isdevo
          ci = IIF((qi+qty)>0, (qi*ci+(qty*artcosto-IIF(isdevo, 0, descuento)))/(qi+qty), ci)
          qi = qi+qty
       ENDIF
    ENDIF
    SELECT movit
    SKIP
 ENDDO
 RETURN IIF(ci>0, ROUND(ci, 6), 0)
ENDFUNC
**
FUNCTION cosprofec
 PARAMETER i, f
 LOCAL pdoc, b, bi, s, td, ci, qi, idit, fec, ffi
 idit = i
 fec = f
 IF ISNULL(fec) .OR. EMPTY(fec)
    fec = hoy
 ENDIF
 IF ISNULL(idit) .OR. EMPTY(idit)
    RETURN 0
 ENDIF
 q1 = "select iditem, iname, icode, artcosto, costopro "+"from items "+"where itipo=1 and iditem="+alup(idit)
 IF  .NOT. sqli(q1, 'itemst')
    RETURN
 ENDIF
 IF RECCOUNT('itemst')=0
    RETURN 0
 ENDIF
 GOTO TOP
 q1 = "select iditem, punitario - descuento/qty as punitario, max(fecha) as fecha "+"from detadoci t left join vdocusmall d on (t.code=d.code) "+"where iditem="+alup(idit)+" and fecha<="+alup(fec)+" and isaccount and not isanulado "+" and d.iddocu in "+"(select distinct d.iddocu "+" from gdoc g, dgdoc t, docuse d "+" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+" group by iditem, 2 "+" order by 3 desc, 2 desc "+" limit 1 "
 IF sqli(q1, 'ultcosite')
    IF RECCOUNT('ultcosite')=0
       q1 = "select max(fecsaldo) as fecsaldo "+"from saldosi "+"where fecsaldo<"+alup(fec)+" and iditem="+alup(idit)
       ffi = finip
       IF sqli(q1, 'fmaxsal')
          IF RECCOUNT('fmaxsal')<>0
             ffi = IIF(ISNULL(fmaxsal.fecsaldo) .OR. EMPTY(fmaxsal.fecsaldo), ffi, fmaxsal.fecsaldo)
          ENDIF
       ENDIF
       q1 = "select iditem, cospro  "+"from saldosi s  "+"where fecsaldo="+alup(ffi)+" and iditem ="+alup(idit)
       = sqli(q1, 'saldosit')
       IF RECCOUNT('saldosit')=0
          RETURN itemst.costopro
       ELSE
          RETURN saldosit.cospro
       ENDIF
    ELSE
       GOTO TOP
       RETURN ultcosite.punitario
    ENDIF
 ELSE
    RETURN itemst.costopro
 ENDIF
ENDFUNC
**
FUNCTION cosfecini
 PARAMETER i, f
 LOCAL pdoc, b, bi, s, td, ci, qi, idit, fec
 idit = i
 fec = f
 IF ISNULL(fec) .OR. EMPTY(fec)
    fec = hoy
 ENDIF
 IF ISNULL(idit) .OR. EMPTY(idit)
    RETURN 0
 ENDIF
 q1 = "select iditem, iname, icode, artcosto, costopro "+"from items "+"where itipo=1 and iditem="+alup(idit)
 IF  .NOT. sqli(q1, 'itemst')
    RETURN
 ENDIF
 IF RECCOUNT('itemst')=0
    RETURN 0
 ENDIF
 GOTO TOP
 IF fec=hoy
    IF IIF(artcosto>0, ROUND(artcosto, 6), ROUND(costopro, 6))>0
       RETURN IIF(artcosto>0, ROUND(artcosto, 6), ROUND(costopro, 6))
    ENDIF
 ENDIF
 q1 = "select iditem, sum(qtyini) as inicial, precio "+"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+"where fecsaldo="+alup(finip)+" and iditem ="+alup(idit)+" group by iditem, precio;"
 IF  .NOT. sqli(q1, 'saldosit')
    RETURN
 ENDIF
 q1 = "select iditem, qty, tipsaldo, artcosto, descuento, fecha, isdevo "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where swkar and pdocode="+alup(iprd)+" and fecha<="+alup(fec)+" and "+fcont+" and not isanulado and iditem="+alup(idit)+" order by iditem, fecha, tipsaldo desc ;"
 IF  .NOT. sqli(q1, 'movit')
    RETURN
 ENDIF
 SELECT itemst
 GOTO TOP
 idit = itemst.iditem
 SELECT saldosit
 GOTO TOP
 LOCATE FOR iditem=idit
 IF FOUND()
    ci = IIF(ISNULL(precio), 0, precio)
    qi = IIF(ISNULL(inicial), 0, inicial)
 ELSE
    ci = 0
    qi = 0
 ENDIF
 SELECT movit
 GOTO TOP
 swc = .T.
 DO WHILE  .NOT. EOF() .AND. swc .AND. movit.iditem=idit
    IF tipsaldo=1
       IF qi>0 .AND. qi-qty>=0
          qi = qi-qty
       ENDIF
    ELSE
       IF  .NOT. isdevo
          ci = IIF((qi+qty)>0, (qi*ci+(qty*artcosto-IIF(isdevo, 0, descuento)))/(qi+qty), ci)
          qi = qi+qty
       ENDIF
    ENDIF
    SELECT movit
    SKIP
 ENDDO
 RETURN IIF(ci>0, ROUND(ci, 6), 0)
ENDFUNC
**
FUNCTION impdoc
 PARAMETER kcode, pimp
 LOCAL i, j, fc1, fc2, fc3, fc4, fc5, fc6, fc7, fc8, fc9, fc10, fc11, fc12, fc13, fc14, fc15, fc16, fc17, fc18, fc19, fc20, vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13, vc14, vc15, vc16, vc17, vc18, vc19, vc20
 i = 0
 STORE '' TO fc1, fc2, fc3, fc4, fc5, fc6, fc7, fc8, fc9, fc10, fc11, fc12, fc13, fc14, fc15, fc16, fc17, fc18, fc19, fc20
 STORE 0.00  TO vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13, vc14, vc15, vc16, vc17, vc18, vc19, vc20
 SELECT 0
 IF  .NOT. sqli("SELECT DISTINCT  idugra, fecgra, code, usercaja, userstore, num, idsecudoc, "+" cliente, fecha, pdocode, ffrom, fto, seller, casher, linkdoc, sujter, duracion, "+" valcuota, numcuota, poriva, descuconiva, descusiniva, recargo, recargo2, recargo3, "+" flete, subconiva, tipitem, chofer, chname, chcedula, chruc, nrec, comenanu, "+" subsiniva, subtotal, ivavalor, ivabienes, icevalor, ipsvalor, montototal, saldo, tmpsaldo, "+" isguia, isupdate, islock, isprint, isaccount, ispagado, isanulado, isautorizado, impresora, "+" isreversado, concepto, feccon, bodega, tipsaldo, iddocu, nomdoc,  dtag, swaneiva, tipnum, "+" swkar, swconta, idsritabla, ajucon, serie, numauto, fcaducidad, scel, stelf, proceso, "+" saddr, saddr2, scode, ssri, sname, sruc, scedula, sciudad, ciudad2, spasaporte, vendedor, "+" nombreu, observ, moneda, idws, reporte, cretri, cajero, codter, nombret, isdevo, sforpag, "+" istransfer, documentos, recaudador, idprin, idgar, provincia, parroquia, sector, calific, "+" srepre, hacienda "+"FROM vdocuments d "+"where d.code="+alup(kcode)+";", 'documents')
    RETURN .F.
 ENDIF
 IF saddr<>saddr2 .AND. saddr>' ' .AND. saddr2>' '
    q1 = "select distinct d.iddocu from gdoc g, dgdoc t, docuse d "+" where g.tag='IMDIAL' and g.idgdoc=t.idgdoc and t.dtag=d.dtag "
    IF sqli(q1, 'impdiralt')
       SELECT impdiralt
       GOTO TOP
       LOCATE FOR impdiralt.iddocu=documents.iddocu
       IF FOUND()
          SELECT saddr, sciudad FROM documents UNION SELECT saddr2 AS saddr, ciudad2 AS sciudad FROM documents INTO CURSOR direccion
          SELECT direccion
          = MESSAGEBOX('Escoja la direccion de impresion', 0)
          SET SHADOWS ON
          DEFINE POPUP gridpopup2 FROM MROW(), MCOL() PROMPT FIELDS ALLTRIM(direccion.saddr)+' - '+ALLTRIM(IIF(ISNULL(direccion.sciudad), ' ', direccion.sciudad)) MARGIN SHORTCUT
          ON SELECTION POPUP gridpopup2 DEACTIVATE POPUP gridpopup2
          ACTIVATE POPUP gridpopup2
          dir = direccion.saddr
          ciu = ALLTRIM(IIF(ISNULL(direccion.sciudad), ' ', direccion.sciudad))
          RELEASE POPUPS gridpopup2
          SELECT DISTINCT idugra, fecgra, code, usercaja, userstore, num, idsecudoc, cliente, fecha, pdocode, ffrom, fto, seller, casher, linkdoc, sujter, duracion, valcuota, numcuota, poriva, descuconiva, descusiniva, recargo, recargo2, recargo3, flete, subconiva, tipitem, chofer, chname, chcedula, chruc, nrec, comenanu, subsiniva, subtotal, ivavalor, ivabienes, icevalor, ipsvalor, montototal, saldo, tmpsaldo, isguia, isupdate, islock, isprint, isaccount, ispagado, isanulado, isautorizado, isreversado, concepto, feccon, bodega, tipsaldo, iddocu, nomdoc, proceso, impresora, dtag, swaneiva, tipnum, swkar, swconta, idsritabla, ajucon, serie, numauto, fcaducidad, scel, stelf, dir AS saddr, saddr2, scode, ssri, sname, sruc, scedula, ciu AS sciudad, spasaporte, vendedor, nombreu, observ, moneda, idws, reporte, cretri, cajero, sforpag, codter, nombret, isdevo, istransfer, documentos, calific, srepre, recaudador, idprin, idgar, provincia, parroquia, sector, hacienda FROM documents INTO CURSOR documents
       ENDIF
    ELSE
       RETURN .F.
    ENDIF
 ENDIF
 SELECT documents
 IF RECCOUNT()=0
    RETURN .F.
 ENDIF
 q1 = "select r.rubname, c.valor "+"from cobros c, rubros r "+"where c.rubcode=r.rubcode and code="+alup(kcode)+" and tipo='C';"
 j = 1
 IF sqli(q1, 'tmpcan')
    SELECT tmpcan
    GOTO TOP
    j = 1
    SCAN
       f = 'fc'+ALLTRIM(STR(j))+'=rubname'
       &f
       f = 'vc'+ALLTRIM(STR(j))+'=valor'
       &f
       j = j+1
       IF j>10
          EXIT
       ENDIF
    ENDSCAN
 ENDIF
 q1 = "select distinct c.fecheque, b.descripda as banco, c.numcta, c.isefectivo, c.observa, "+"c.numche, c.valor, c.fecdepo, t.numero, t.banco as bandep "+"from cheques c left join detagru b on (c.banco=b.iddato) "+"   left join vctasb t on (c.ctaban=t.idcuenta) "+"where c.code="+alup(kcode)+" order by c.fecheque;"
 IF sqli(q1, 'tmpche')
    SELECT tmpche
    GOTO TOP
    j = 11
    SCAN
       f = 'fc'+ALLTRIM(STR(j))+"=alltrim(banco)+' / Cta:'+alltrim(numcta)+' / Num.Ch:'+alltrim(str(numche))+' / Fec.Ch:'+devfeclet(fecheque,4)"
       &f
       f = 'vc'+ALLTRIM(STR(j))+'=valor'
       &f
       j = j+1
       IF j>20
          EXIT
       ENDIF
    ENDSCAN
 ENDIF
 q1 = "select distinct c.nucuban, d.descripda, b.nudocban, b.fecdoc, b.punitario as cvaldo, "+"b.isconfbanc as iscobrado, 'f'::bool "+"from ctasban c, detadocb b, detagru d	"+"where c.idcuenta=b.idcuenta and c.idbanco=d.iddato and not b.isanulado "+" and b.code="+alup(kcode)+";"
 IF sqli(q1, 'tmpdb')
    SELECT tmpdb
    GOTO TOP
    SCAN
       f = 'fc'+ALLTRIM(STR(j))+"=alltrim(descripda)+' / Cta:'+alltrim(nucuban)+' / Num.doc:'+alltrim(str(nudocban))+' / Fec.doc:'+devfeclet(fecdoc,4)"
       &f
       f = 'vc'+ALLTRIM(STR(j))+'=cvaldo'
       &f
       j = j+1
       IF j>20
          EXIT
       ENDIF
    ENDSCAN
 ENDIF
 SELECT documents
 IF linkdoc>0
    q1 = "SELECT nomdoc as nomlink, fecha as feclink, code as codelink, num as numlink, serie as serielink "+"FROM vdocusmall "+"where code="+alup(linkdoc)+";"
    IF  .NOT. sqli(q1, 'linky')
       RETURN .F.
    ELSE
       SELECT d.*, l.*, fc1 AS fc1, fc2 AS fc2, fc3 AS fc3, fc4 AS fc4, fc5 AS fc5, fc6 AS fc6, fc7 AS fc7, fc8 AS fc8, fc9 AS fc9, fc10 AS fc10, fc11 AS fc11, fc12 AS fc12, fc13 AS fc13, fc14 AS fc14, fc15 AS fc15, fc16 AS fc16, fc17 AS fc17, fc18 AS fc18, fc19 AS fc19, fc20 AS fc20, vc1 AS vc1, vc2 AS vc2, vc3 AS vc3, vc4 AS vc4, vc5 AS vc5, vc6 AS vc6, vc7 AS vc7, vc8 AS vc8, vc9 AS vc9, vc10 AS vc10, vc11 AS vc11, vc12 AS vc12, vc13 AS vc13, vc14 AS vc14, vc15 AS vc15, vc16 AS vc16, vc17 AS vc17, vc18 AS vc18, vc19 AS vc19, vc20 AS vc20 FROM documents d, linky l WHERE d.linkdoc=l.codelink INTO CURSOR documents
    ENDIF
 ELSE
    SELECT d.*, '' AS nomlink, {} AS feclink, 0 AS codelink, 0 AS numlink, 0 AS serielink, fc1 AS fc1, fc2 AS fc2, fc3 AS fc3, fc4 AS fc4, fc5 AS fc5, fc6 AS fc6, fc7 AS fc7, fc8 AS fc8, fc9 AS fc9, fc10 AS fc10, fc11 AS fc11, fc12 AS fc12, fc13 AS fc13, fc14 AS fc14, fc15 AS fc15, fc16 AS fc16, fc17 AS fc17, fc18 AS fc18, fc19 AS fc19, fc20 AS fc20, vc1 AS vc1, vc2 AS vc2, vc3 AS vc3, vc4 AS vc4, vc5 AS vc5, vc6 AS vc6, vc7 AS vc7, vc8 AS vc8, vc9 AS vc9, vc10 AS vc10, vc11 AS vc11, vc12 AS vc12, vc13 AS vc13, vc14 AS vc14, vc15 AS vc15, vc16 AS vc16, vc17 AS vc17, vc18 AS vc18, vc19 AS vc19, vc20 AS vc20 FROM documents d INTO CURSOR documents
 ENDIF
 IF  .NOT. sqli("select distinct d.items, d.bancos, d.sujetos, d.rubrol, d.ninguno, "+"d.documentos, d.pagos, d.dtag "+"from secudoc s, docuse d "+"where s.iddocu=d.iddocu and s.idsecudoc="+alup(idsecudoc)+";", 'docuset')
    RETURN .F.
 ENDIF
 SELECT docuset
 DO CASE
    CASE items
       IF  .NOT. sqli("select * from vdocui where code="+alup(kcode)+";", 'docitems')
          RETURN .F.
       ENDIF
       nitem = RECCOUNT('docitems')
       pesotot = 0
       SELECT d.*, i.icode, i.iname, i.marca, i.grupo, i.genero, i.itag, i.itipo, i.auxiliar, i.auxcon, fecven, i.punitario AS punitario, i.unidad, i.unidad2, i.qty, i.qtyactivo, i.isiva, i.descuento, i.pordes, i.qtypromo, pvp, valconiva, pesotot AS pesotot, factorc, numeconver, denoconver, i.ubipro, nitem AS nitem FROM documents d LEFT JOIN docitems i ON (d.code=i.code) ORDER BY i.iname INTO CURSOR documents
       SELECT docitems
       USE
       SELECT documents
       IF proceso
          GOTO TOP
          varep = documents.reporte
          DO &varep
       ELSE
          swipd = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docuitems', reporte), , 'documents', .T.)
       ENDIF
       SELECT documents
       USE
    CASE bancos
       IF  .NOT. sqli("select * from vdocub where not isanulado and code="+alup(kcode)+";", 'docbancos')
          RETURN .F.
       ENDIF
       SELECT d.*, b.nucuban, b.ticuban, b.banco, b.idcuenta, b.nudocban, b.cbenef, b.cconce, b.fecdoc, b.punitario, b.qty, b.docanulado, b.isconfbanc, b.isprotesto, b.isconciliado, b.isprintb, b.fecpag, b.secuencia, d.dtag FROM documents d LEFT JOIN docbancos b ON (d.code=b.code) INTO CURSOR documents
       SELECT docbancos
       USE
       SELECT documents
       = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docubancos', reporte), , 'documents')
       SELECT documents
       USE
    CASE sujetos
       IF  .NOT. sqli("select * from vdocus where code="+alup(kcode)+";", 'docsujetos')
          RETURN .F.
       ENDIF
       SELECT d.*, s.snamed, s.scode AS codigo, s.punitario, s.qty FROM documents d LEFT JOIN docsujetos s ON (d.code=s.code) ORDER BY s.snamed INTO CURSOR documents
       SELECT documents
       = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docusujetos', reporte), , 'documents')
       SELECT documents
       USE
    CASE pagos
       IF  .NOT. sqli("select * from vdocup where code="+alup(kcode)+";", 'docpagos')
          RETURN .F.
       ENDIF
       SELECT d.*, saldoant, plancod, nomdocd, coded, numd, valort, fecultpag FROM documents d LEFT JOIN docpagos s ON (d.code=s.code) INTO CURSOR documents
       SELECT documents
       = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docupag', reporte), , 'documents')
       SELECT documents
       USE
    CASE documentos
       q1 = "select d.code, coded, saldoant, valort, tipoie, nomdoc, num as numd, rubname, a.numsecue2, "+"numcuota as numcuotad, valcuota as valcuotad, concepto as conceptod "+"from vdocud d left join aneiva a on (d.coded=a.code) "+"where d.code="+alup(kcode)+"union "+"select p.code, s.code as coded, p.saldoant, p.valort, ' ' as tipoie, referencia as nomdoc, 0 as numd, "+" 'Sal.Inic.'||s.plancod as rubname, 0 as numsecue2, 0 as numcuotad, cuota as valcuotad, "+"referencia as conceptod "+" from detadocp p left join vsaldosci s on (p.idsaldosci=s.idsaldosci) "+" where p.code="+alup(kcode)
       IF  .NOT. sqli(q1, 'docdocu')
          RETURN .F.
       ENDIF
       SELECT d.*, t.coded, t.saldoant, t.valort, t.tipoie, t.numd, t.nomdoc AS documentod, rubname, numsecue2 FROM documents d LEFT JOIN docdocu t ON (d.code=t.code) ORDER BY t.tipoie DESC INTO CURSOR documents
       SELECT docdocu
       USE
       SELECT documents
       = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docudoc', reporte), , 'documents')
       SELECT documents
       USE
    CASE rubrol
       IF  .NOT. sqli("select * from vdocul where code="+alup(kcode)+";", 'docrol')
          RETURN .F.
       ENDIF
       SELECT d.*, r.rubtab, r.rubname, r.valor, r.tie FROM documents d LEFT JOIN docrol r ON (d.code=r.code) ORDER BY tie DESC INTO CURSOR documents
       SELECT docrol
       USE
       SELECT documents
       = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docrol', reporte), , 'documents')
       SELECT documents
       USE
    OTHERWISE
       IF  .NOT. sqli("select * from vdocup where code="+alup(kcode)+";", 'docpagos')
          RETURN .F.
       ENDIF
       IF RECCOUNT('docpagos')>0
          SELECT d.*, saldoant, plancod, nomdocd, coded, numd, valort, fecultpag, referencia FROM documents d LEFT JOIN docpagos s ON (d.code=s.code) INTO CURSOR documents
          SELECT documents
          = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'docupag', reporte), , 'documents')
          SELECT documents
          USE
       ELSE
          SELECT documents
          = ireport(IIF(EMPTY(reporte) .OR. ISNULL(reporte), 'documents', reporte), , 'documents')
          SELECT documents
          USE
       ENDIF
 ENDCASE
 SELECT docuset
 USE
 RETURN sqli("update documents set isprint='t' where code="+alup(kcode)+";")
 WAIT WINDOW NOWAIT 'Documento Impreso'
ENDFUNC
**
FUNCTION selgru
 PARAMETER topc, tipgru
 LOCAL i, f
 f = 'visilis'
 IF  .NOT. EMPTY(tipgru)
    IF tipgru=2
       f = 'impresion'
    ENDIF
 ENDIF
 IF  .NOT. sqli("select * "+"from gdoc "+"where "+f+" order by descrip;", 'grudoc')
    RETURN .F.
 ENDIF
 IF  .NOT. EMPTY(topc)
    SELECT grudoc
    fbus = '*'+ALLTRIM(topc)+'*'
    SET FILTER TO LIKE(fbus, descrip)
 ENDIF
 SET SHADOWS ON
 DEFINE POPUP gridpopup FROM MROW(), MCOL() PROMPT FIELDS grudoc.descrip MARGIN SHORTCUT
 ON SELECTION POPUP gridpopup DEACTIVATE POPUP gridpopup
 ACTIVATE POPUP gridpopup
 RELEASE POPUPS gridpopup
 i = grudoc.idgdoc
 SELECT grudoc
 RETURN i
ENDFUNC
**
FUNCTION balanceg
 PARAMETER fec, des, fdia
 LOCAL d, s, p, t, fdh, sdh, swsalini
 swsalini = .F.
 IF EMPTY(fec) .OR. ISNULL(fec)
    fec = ffinp
 ENDIF
 IF EMPTY(des) .OR. ISNULL(des)
    swsalini = .T.
    des = finip
 ENDIF
 d = nomunico()
 s = nomunico()
 p = nomunico()
 t = nomunico()
 IF des=finip
    fdh = 'afecha<='+alup(fec)
    sdh = alup(.T.)
 ELSE
    fdh = "afecha<="+alup(fec)+" and afecha>="+alup(des)
    sdh = alup(.F.)
 ENDIF
 sdh = alup(swsalini)
 IF fec=finip
    fdia = alup(.F.)
 ELSE
    fdia = alup(.T.)
 ENDIF
 q1 = "SELECT idplancuenta, idaux, auxiliar, auxname, sum(debe) AS debe, sum(haber) AS haber "+"FROM vdiario "+"where not isanulado and "+fdia+" and "+fdh+" GROUP BY idplancuenta, idaux, auxiliar, auxname;"
 IF  .NOT. sqli(q1, d)
    RETURN .F.
 ENDIF
 q1 = "SELECT DISTINCT auxiliar, auxname, idauxiliar as idaux, idplancuenta, debe, haber "+"FROM vsaldoscon "+"WHERE "+sdh+" and pdocode="+alup(iprd)+";"
 IF  .NOT. sqli(q1, s)
    RETURN .F.
 ENDIF
 q1 = "SELECT distinct idplancuenta, plancod, plannivel, plantype, "+"auxcode, pdocode, cuenta, plancod as codigo "+"FROM vplancta "+"WHERE pdocode="+alup(iprd)+" order by plancod,cuenta;"
 IF  .NOT. sqli(q1, p)
    RETURN .F.
 ELSE
    SELECT 	idplancuenta, plancod, plannivel, plantype,  IIF(ISNULL(auxcode),' ',auxcode) AS auxcode, pdocode, cuenta, codigo  FROM	&p  INTO 	CURSOR &p
 ENDIF
 CREATE CURSOR &t (idplancuenta i NULL, idaux i NULL, auxiliar c(10) NULL, auxname c(50) NULL, debe n(12,2), haber n(12,2))
 SELE &d
 GOTO TOP
 DO WHILE  .NOT. EOF()
    SCATTER MEMVAR
    SELE &t
    INSERT INTO &t FROM MEMVAR
    SELE &d
    SKIP
 ENDDO
 SELE &s
 GOTO TOP
 DO WHILE  .NOT. EOF()
    SCATTER MEMVAR
    SELE &t
    LOCATE FOR idplancuenta=m.idplancuenta .AND. idaux=m.idaux
    IF FOUND()
       REPLACE debe WITH debe+m.debe
       REPLACE haber WITH haber+m.haber
    ELSE
       INSERT INTO &t FROM MEMVAR
    ENDIF
    SELE &s
    SKIP
 ENDDO
 SELECT idplancuenta, idaux, auxiliar, auxname, SUM(debe-haber) AS valor  FROM &t  GROUP BY idplancuenta, idaux  HAVING SUM(debe-haber)#0  INTO CURSOR &t 
 SELE p.plancod, p.plannivel, p.plantype, p.cuenta, p.auxcode , a.auxiliar, a.auxname,  IIF(SUBSTR(p.plancod,1,1)='1' OR SUBSTR(p.plancod,1,1)='5', IIF(ISNULL(valor),0000000000.00,valor), 000000000.00) AS debe,  IIF(SUBSTR(p.plancod,1,1)='2' OR SUBSTR(p.plancod,1,1)='3' OR SUBSTR(p.plancod,1,1)='4', IIF(ISNULL(valor),00000000.00,valor*(-1)), 00000000.00) AS haber,  p.idplancuenta, a.idaux, fec AS fhasta, p.codigo  FROM &p p LEFT JOIN &t a ON (p.idplancuenta=a.idplancuenta)  ORDER BY p.plancod  INTO CURSOR balanceg
 SELE &p
 USE
 SELE &d
 USE
 SELE &s
 USE
 SELE &t
 USE
 SELECT balanceg
 RETURN .T.
ENDFUNC
**
FUNCTION saldoscta
 PARAMETER fec, kcta, kaux
 LOCAL d, s, p, t, fkcta, fkaux1, fkaux2
 IF EMPTY(fec) .OR. ISNULL(fec)
    fec = ffinp
 ENDIF
 IF EMPTY(kcta) .OR. ISNULL(kcta)
    fkcta = alup(.T.)
 ELSE
    fkcta = 'idplancuenta='+alup(kcta)
 ENDIF
 IF EMPTY(kaux) .OR. ISNULL(kaux)
    fkaux1 = alup(.T.)
    fkaux2 = alup(.T.)
 ELSE
    fkaux1 = 'idaux='+alup(kaux)
    fkaux2 = 'idauxiliar='+alup(kaux)
 ENDIF
 d = nomunico()
 s = nomunico()
 t = nomunico()
 IF fec=ffinp
    ffec = " afecha<="+alup(ffinp)
 ELSE
    ffec = " afecha<"+alup(fec)
 ENDIF
 IF  .NOT. sqli("SELECT idplancuenta, idaux, auxiliar, auxname, sum(debe) AS debe, sum(haber) AS haber "+"FROM vdiario "+"where not isanulado and "+fkaux1+" and "+fkcta+" and pdocode="+alup(iprd)+" and "+ffec+" GROUP BY idplancuenta, idaux, auxiliar, auxname;", d)
    RETURN .F.
 ENDIF
 IF  .NOT. sqli("SELECT DISTINCT auxiliar, auxname, idauxiliar as idaux, idplancuenta, debe, haber "+"FROM vsaldoscon "+"WHERE "+fkaux2+" and "+fkcta+" and pdocode="+alup(iprd)+";", s)
    RETURN .F.
 ENDIF
 CREATE CURSOR &t (idplancuenta i, idaux i, auxiliar c(10), auxname c(50), debe n(12,2), haber n(12,2))
 SELE &d
 GOTO TOP
 DO WHILE  .NOT. EOF()
    SCATTER MEMVAR
    SELE &t
    INSERT INTO &t FROM MEMVAR
    SELE &d
    SKIP
 ENDDO
 SELE &s
 GOTO TOP
 DO WHILE  .NOT. EOF()
    SCATTER MEMVAR
    SELE &t
    LOCATE FOR idplancuenta=m.idplancuenta .AND. idaux=m.idaux
    IF FOUND()
       REPLACE debe WITH debe+m.debe
       REPLACE haber WITH haber+m.haber
    ELSE
       INSERT INTO &t FROM MEMVAR
    ENDIF
    SELE &s
    SKIP
 ENDDO
 SELECT idplancuenta, idaux, auxiliar, auxname, SUM(debe-haber) AS valors  FROM &t  GROUP BY idplancuenta, idaux  HAVING SUM(debe-haber)#0  INTO CURSOR saldoscta
 SELE &d
 USE
 SELE &s
 USE
 SELE &t
 USE
 SELECT saldoscta
 RETURN .T.
ENDFUNC
**
FUNCTION auxcon
 PARAMETER tsp
 LOCAL f
 f = alup(.T.)
 IF  .NOT. EMPTY(tsp)
    f = 'tipo='+alup(tsp)
 ENDIF
 IF  .NOT. sqli("SELECT tipo, idauxiliar, auxiliar, substr(auxname,1,40) as auxname "+"from vauxcon "+"WHERE "+f+" order by auxname;", 'auxcon')
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION condoc
 PARAMETER cddoc
 LOCAL codew, idsecudocw, snamew, bodegaw, fechaw, montototalw, linkdocw, clientey, scodew, codeuy, nomdocw, conceptow, nombreuy, swite, swban, swsuj, swusu, swnin, swdoc, swk, nprox, numasi, ids, t, td, th, t1, swdb, dtagw
 IF  .NOT. rubros('D')
    RETURN .F.
 ENDIF
 numasi = 0
 IF swkeycon
    codew = cddoc
    IF  .NOT. isabierto
       WAIT WINDOW NOWAIT 'Este periodo ya fue cerrado'
       RETURN .F.
    ENDIF
    IF USED('diario')
       SELECT diario
       USE
    ENDIF
    CREATE CURSOR nomtmpc (rubcode N (5), valor N (10, 2), isupdate L DEFAULT .F.)
    CREATE CURSOR diario (cuenta C (40), auxiliar C (40), codigo C (30), debe N (10, 2) DEFAULT 0, haber N (10, 2) DEFAULT 0, rubcode I, idplancuenta I, idaux I, tipoaux C (1), coded N (6) DEFAULT 0)
    IF codew=0
       WAIT WINDOW NOWAIT 'Ingrese codigo de documento'
       RETURN .F.
    ENDIF
    SELECT diario
    IF USED('nomtmp2')
       SELECT nomtmp2
       USE
    ENDIF
    q1 = "select distinct code, idsecudoc, sname, bodega, fecha, linkdoc, nombreu, isprint, dtag, "+"subconiva, subsiniva, subtotal, descuconiva, descusiniva, ivavalor, ajucon, "+"montototal, recargo, recargo2, recargo3, flete, icevalor, ipsvalor, moneda, ispagado, "+"isanulado, isaccount, nomdoc, cliente, scode, concepto, idugra as codeu, nombreu "+"from vdocuments "+"where code="+alup(codew)+";"
    IF  .NOT. sqli(q1, 'nomtmp2')
       RETURN .F.
    ENDIF
    SELECT nomtmp2
    IF RECCOUNT('nomtmp2')=0
       WAIT WINDOW NOWAIT 'No existe documento'
       RETURN .F.
    ENDIF
    IF isanulado
       WAIT WINDOW NOWAIT 'Documento anulado'
       RETURN .F.
    ENDIF
    IF  .NOT. ispagado
       WAIT WINDOW NOWAIT 'Documento no cancelado'
       RETURN .F.
    ENDIF
    IF ajucon
       WAIT WINDOW NOWAIT 'Documento debe ser contabilizado manualmente'
       RETURN .F.
    ENDIF
    SELECT nomtmp2
    codew = code
    idsecudocw = idsecudoc
    snamew = sname
    bodegaw = bodega
    fechaw = fecha
    montototalw = montototal
    linkdocw = linkdoc
    clientey = cliente
    scodew = scode
    codeuy = codeu
    nomdocw = nomdoc
    conceptow = concepto
    nombreuy = nombreu
    dtagw = dtag
    IF  .NOT. BETWEEN(fechaw, finip, ffinp)
       WAIT WINDOW NOWAIT 'Fecha fuera del periodo contable'
       RETURN .F.
    ENDIF
    IF  .NOT. docuset(idsecudocw)
       RETURN .F.
    ENDIF
    IF RECCOUNT('docuset')=0
       WAIT WINDOW NOWAIT 'Error en configuración del documento'
       RETURN .F.
    ENDIF
    swite = items
    swban = bancos
    swsuj = sujetos
    swrol = rubrol
    swnin = ninguno
    swdoc = documentos
    swk = swkar
    IF  .NOT. cobros(codew)
       RETURN .F.
    ENDIF
    SELECT rubros
    GOTO TOP
    DO WHILE  .NOT. EOF()
       fv = 'nomtmp2.'+ALLTRIM(rubros.rubformula)
       m.valor=&FV
       m.rubcode = rubros.rubcode
       SELECT nomtmpc
       APPEND BLANK
       GATHER MEMVAR
       SELECT rubros
       SKIP
    ENDDO
    SELECT * FROM cobros UNION SELECT * FROM nomtmpc INTO CURSOR cobros
    SELECT docuset
    GOTO TOP
    DO WHILE  .NOT. EOF()
       SELECT cobros
       GOTO TOP
       LOCATE FOR rubcode=docuset.rubcode
       IF FOUND()
          SELECT docuset
          DO CASE
             CASE docuset.auxcode='B'
                fr = 'not d.isdet'
                IF swban
                   IF  .NOT. swdb
                      q1 = "select distinct sum(punitario) as cvaldo "+"from detadocb "+"where isdet and not isanulado and code="+alup(codew)+";"
                      IF  .NOT. sqli(q1, 'docban')
                         RETURN .F.
                      ENDIF
                      SELECT docban
                      IF docban.cvaldo=cobros.valor
                         fr = 'd.isdet'
                         swdb = .T.
                      ENDIF
                   ENDIF
                ENDIF
                IF  .NOT. sqli("select distinct d.idcuenta, d.nudocban, c.nucuban, fecdoc, "+"g.descripda as banco, d.punitario as cvaldo, c.numaux "+"from detadocb d, ctasban c, datosgen g "+"where "+fr+" and d.idcuenta=c.idcuenta and not d.isanulado and "+"c.idbanco=g.iddato and code="+alup(codew)+";", 'docban')
                   RETURN .F.
                ENDIF
                IF RECCOUNT('docban')=0
                   WAIT WINDOW NOWAIT 'Necesita datos bancarios para este documento '
                   SELECT docban
                   USE
                   RETURN .F.
                ENDIF
                SELECT docban
                GOTO TOP
                DO WHILE  .NOT. EOF()
                   SELECT diario
                   APPEND BLANK
                   REPLACE diario.cuenta WITH docuset.cuenta
                   REPLACE diario.idplancuenta WITH docuset.idplancuenta
                   REPLACE diario.rubcode WITH docuset.rubcode
                   IF docuset.debehaber='D'
                      REPLACE diario.debe WITH docban.cvaldo
                   ELSE
                      REPLACE diario.haber WITH docban.cvaldo
                   ENDIF
                   REPLACE diario.auxiliar WITH ALLTRIM(docban.banco)+' '+ALLTRIM(docban.nucuban)+'  doc:'+ALLTRIM(STR(docban.nudocban))
                   REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, docban.numaux)
                   REPLACE diario.idaux WITH docban.idcuenta
                   SELECT docban
                   SKIP
                ENDDO
             CASE docuset.auxcode='S'
                IF docuset.auxsuj>0
                   q1 = "select scode, sname, idsujeto from sujetos where idsujeto="+alup(auxsuj)
                   IF  .NOT. sqli(q1, 'sujtdc')
                      = MESSAGEBOX('Error en auxiliar de cuenta: Sujetos ', 0, empresa)
                      RETURN .F.
                   ELSE
                      IF RECCOUNT('sujtdc')<>1
                         = MESSAGEBOX('Error en auxiliar de cuenta: Sujetos', 0, empresa)
                         RETURN .F.
                      ENDIF
                   ENDIF
                ENDIF
                IF docuset.cabedeta=2
                   q1 = "select idsujeto, scode, punitario as cvaldo, "+"snamed AS sname "+"from vdocus d "+"where code="+alup(codew)+";"
                   IF  .NOT. sqli(q1, 'docsuj')
                      RETURN .F.
                   ENDIF
                   IF RECCOUNT('docsuj')=0
                      WAIT WINDOW NOWAIT 'Necesita datos de sujetos detalle '
                      SELECT docsuj
                      USE
                      RETURN .F.
                   ENDIF
                   SELECT docsuj
                   GOTO TOP
                   DO WHILE  .NOT. EOF()
                      SELECT diario
                      APPEND BLANK
                      REPLACE diario.cuenta WITH docuset.cuenta
                      REPLACE diario.idplancuenta WITH docuset.idplancuenta
                      REPLACE diario.rubcode WITH docuset.rubcode
                      IF docuset.debehaber='D'
                         REPLACE diario.debe WITH docsuj.cvaldo
                      ELSE
                         REPLACE diario.haber WITH docsuj.cvaldo
                      ENDIF
                      IF docuset.auxsuj=0
                         REPLACE diario.auxiliar WITH ALLTRIM(docsuj.sname)
                         REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, docsuj.scode)
                         REPLACE diario.idaux WITH docsuj.idsujeto
                      ELSE
                         REPLACE diario.auxiliar WITH ALLTRIM(sujtdc.sname)
                         REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, sujtdc.scode)
                         REPLACE diario.idaux WITH sujtdc.idsujeto
                      ENDIF
                      SELECT docsuj
                      SKIP
                   ENDDO
                   USE
                ELSE
                   DO CASE
                      CASE docuset.sujaux='B'
                         cs = '(d.cliente=s.idsujeto)'
                         is = 'cliente'
                      CASE docuset.sujaux='C'
                         cs = '(d.usercaja=s.idsujeto)'
                         is = 'usercaja'
                      CASE docuset.sujaux='V'
                         cs = '(d.seller=s.idsujeto)'
                         is = 'seller'
                      CASE docuset.sujaux='R'
                         cs = '(d.casher=s.idsujeto)'
                         is = 'casher'
                      CASE docuset.sujaux='U'
                         cs = '(d.idugra=s.idsujeto)'
                         is = 'idugra'
                      OTHERWISE
                         cs = '(d.sujter=s.idsujeto)'
                         is = 'sujter'
                   ENDCASE
                   q1 = "select sname, scode, "+is+" from documents d left join sujetos s on "+cs+" where code="+alup(codew)+";"
                   IF  .NOT. sqli(q1, 'benef')
                      RETURN .F.
                   ENDIF
                   b = 'benef.'+is
                   SELECT diario
                   APPEND BLANK
                   REPLACE cuenta WITH docuset.cuenta
                   REPLACE diario.cuenta WITH docuset.cuenta
                   REPLACE diario.idplancuenta WITH docuset.idplancuenta
                   REPLACE diario.rubcode WITH docuset.rubcode
                   IF docuset.debehaber='D'
                      REPLACE debe WITH cobros.valor
                   ELSE
                      REPLACE haber WITH cobros.valor
                   ENDIF
                   IF docuset.auxsuj=0
                      REPLACE diario.auxiliar WITH ALLTRIM(benef.sname)
                      REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, benef.scode)
                      REPLACE diario.idaux	 WITH &b
                   ELSE
                      REPLACE diario.auxiliar WITH ALLTRIM(sujtdc.sname)
                      REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, sujtdc.scode)
                      REPLACE diario.idaux WITH sujtdc.idsujeto
                   ENDIF
                   REPLACE diario.rubcode WITH docuset.rubcode
                   REPLACE diario.idplancuenta WITH docuset.idplancuenta
                ENDIF
             CASE docuset.auxcode='I'
                IF swite
                   IF LIKE('*SIN IVA*', docuset.rubname)
                      q1 = "select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+"from vdocui "+"where not isivai and code="+alup(codew)+";"
                   ELSE
                      IF LIKE('*CON IVA*', docuset.rubname)
                         q1 = "select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+"from vdocui "+"where isivai and code="+alup(codew)+";"
                      ELSE
                         q1 = "select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+"from vdocui "+"where code="+alup(codew)+";"
                      ENDIF
                   ENDIF
                   IF  .NOT. sqli(q1, 'detart')
                      RETURN .F.
                   ENDIF
                   IF RECCOUNT('detart')=0
                   ENDIF
                   IF  .NOT. docuset.itunacta
                      q1 = "select d.idplancuenta, p.cuenta, p.plancod, d.debehaber, d.artgrupo "+"from dcontitem d left join vplancta p on (d.idplancuenta=p.idplancuenta) "+"where d.iddocuse="+alup(docuset.iddocuse)+";"
                      IF  .NOT. sqli(q1, 'confitem')
                         RETURN .F.
                      ENDIF
                   ENDIF
                   SELECT detart
                   GOTO TOP
                   DO WHILE  .NOT. EOF()
                      SELECT diario
                      APPEND BLANK
                      IF  .NOT. docuset.itunacta
                         g = detart.artgrupo
                         SELECT confitem
                         GOTO TOP
                         LOCATE FOR artgrupo=g
                         IF FOUND()
                            SELECT diario
                            REPLACE diario.cuenta WITH confitem.cuenta
                            REPLACE diario.idplancuenta WITH confitem.idplancuenta
                            REPLACE diario.rubcode WITH docuset.rubcode
                            IF docuset.debehaber='D'
                               REPLACE diario.debe WITH IIF(consindes, detart.valor-detart.descuento, detart.valor)
                            ELSE
                               REPLACE diario.haber WITH IIF(consindes, detart.valor-detart.descuento, detart.valor)
                            ENDIF
                            REPLACE diario.auxiliar WITH ALLTRIM(detart.auxiliar)
                            REPLACE diario.codigo WITH ALLTRIM(confitem.plancod)+'.'+nconcero(5, detart.auxcon)
                            REPLACE diario.idaux WITH detart.iditem
                         ENDIF
                      ELSE
                         SELECT diario
                         REPLACE diario.cuenta WITH docuset.cuenta
                         REPLACE diario.idplancuenta WITH docuset.idplancuenta
                         REPLACE diario.rubcode WITH docuset.rubcode
                         IF docuset.debehaber='D'
                            REPLACE diario.debe WITH IIF(consindes, detart.valor-detart.descuento, detart.valor)
                         ELSE
                            REPLACE diario.haber WITH IIF(consindes, detart.valor-detart.descuento, detart.valor)
                         ENDIF
                         REPLACE diario.auxiliar WITH ALLTRIM(detart.auxiliar)
                         REPLACE diario.codigo WITH ALLTRIM(docuset.plancod)+'.'+nconcero(5, detart.auxcon)
                         REPLACE diario.idaux WITH detart.iditem
                      ENDIF
                      SELECT detart
                      SKIP
                   ENDDO
                   USE
                ENDIF
          ENDCASE
       ENDIF
       SELECT docuset
       SKIP
    ENDDO
    IF swdoc
       q1 = "select d.code, d.coded, d.valort, d.rubcode, s.cliente, s.iddocu, s.sname, "+"s.scode, o.idplancuenta, o.debehaber, o.sujaux, t.plancod, "+"g.descripda as cuenta "+"from detadocd d left join vdocusmall s on (d.coded=s.code) "+"left join vdocusmall p on (p.code=d.code) "+"left join ddocused o on (p.iddocu=o.iddocu and d.rubcode=o.rubcode) "+"left join vplancta t on (o.idplancuenta=t.idplancuenta) "+"left join detagru g on (t.idcuenta=g.iddato) "+"where d.code="+alup(codew)+" and s.iddocu=o.iddocud "+"and t.pdocode="+alup(iprd)+";"
       IF  .NOT. sqli(q1, 'detadocd')
          RETURN .F.
       ELSE
       ENDIF
       IF RECCOUNT('detadocd')>0
          SELECT detadocd
          GOTO TOP
          DO WHILE  .NOT. EOF()
             DO CASE
                CASE detadocd.sujaux='B'
                   cs = '(d.cliente=s.idsujeto)'
                   is = 'cliente'
                CASE detadocd.sujaux='C'
                   cs = '(d.usercaja=s.idsujeto)'
                   is = 'usercaja'
                CASE detadocd.sujaux='V'
                   cs = '(d.seller=s.idsujeto)'
                   is = 'seller'
                CASE detadocd.sujaux='R'
                   cs = '(d.casher=s.idsujeto)'
                   is = 'casher'
                CASE docuset.sujaux='U'
                   cs = '(d.idugra=s.idsujeto)'
                   is = 'idugra'
                OTHERWISE
                   cs = '(d.sujter=s.idsujeto)'
                   is = 'sujter'
             ENDCASE
             q1 = "select sname, scode, "+is+" from documents d left join sujetos s on "+cs+" where code="+alup(detadocd.coded)+";"
             IF  .NOT. sqli(q1, 'benef')
                RETURN .F.
             ENDIF
             b = 'benef.'+is
             SELECT diario
             APPEND BLANK
             REPLACE diario.cuenta WITH detadocd.cuenta
             REPLACE diario.idplancuenta WITH detadocd.idplancuenta
             IF detadocd.debehaber='D'
                REPLACE diario.debe WITH detadocd.valort
             ELSE
                REPLACE diario.haber WITH detadocd.valort
             ENDIF
             REPLACE diario.auxiliar WITH ALLTRIM(benef.sname)
             REPLACE diario.codigo WITH ALLTRIM(detadocd.plancod)+'.'+nconcero(5, benef.scode)
             REPLACE diario.idaux	WITH &b
             REPLACE diario.coded WITH detadocd.coded
             SELECT detadocd
             SKIP
          ENDDO
       ENDIF
    ENDIF
    IF swrol
       IF  .NOT. sqli("select distinct d.code, d.rubcode, d.valor, s.cliente, s.iddocu, s.sname, "+"s.scode, r.idplancuenta, r.debehaber, t.plancod, t.cuenta, t.auxsuj "+"from detadocl d left join vdocusmall s on (d.code=s.code) "+"left join contarol r on (d.rubcode=r.rubcode) "+"left join empleados e on (s.cliente=e.idsujeto) "+"left join vplancta t on (r.idplancuenta=t.idplancuenta) "+"where r.area=e.emarea and d.code="+alup(codew), 'detadocr')
          RETURN .F.
       ENDIF
       IF RECCOUNT('detadocr')>0
          SELECT detadocr
          GOTO TOP
          DO WHILE  .NOT. EOF()
             IF detadocr.auxsuj>0
                q1 = "select scode, sname, idsujeto "+"from sujetos "+"where idsujeto="+alup(detadocr.auxsuj)
                IF  .NOT. sqli(q1, 'sujtdc')
                   = MESSAGEBOX('Error en auxilar: Sujetos', 0, empresa)
                   RETURN .F.
                ELSE
                   IF RECCOUNT('sujtdc')<>1
                      = MESSAGEBOX('Error en auxilar: Sujetos', 0, empresa)
                      RETURN .F.
                   ENDIF
                ENDIF
             ENDIF
             SELECT diario
             APPEND BLANK
             REPLACE diario.cuenta WITH detadocr.cuenta
             REPLACE diario.idplancuenta WITH detadocr.idplancuenta
             IF detadocr.debehaber='D'
                REPLACE diario.debe WITH detadocr.valor
             ELSE
                REPLACE diario.haber WITH detadocr.valor
             ENDIF
             IF detadocr.auxsuj=0
                REPLACE diario.auxiliar WITH ALLTRIM(detadocr.sname)
                REPLACE diario.codigo WITH ALLTRIM(detadocr.plancod)+'.'+nconcero(5, detadocr.scode)
                REPLACE diario.idaux WITH detadocr.cliente
             ELSE
                REPLACE diario.auxiliar WITH ALLTRIM(sujtdc.sname)
                REPLACE diario.codigo WITH ALLTRIM(detadocr.plancod)+'.'+nconcero(5, sujtdc.scode)
                REPLACE diario.idaux WITH sujtdc.idsujeto
             ENDIF
             SELECT detadocr
             SKIP
          ENDDO
       ENDIF
    ENDIF
    q1 = "select distinct sum(d.valort) as valort, s.cuenta, s.ctacon, s.sname, s.scode, "+"s.plancod, s.idsujeto, p.auxsuj "+"from detadocp d left join vsaldosci s on (d.idsaldosci=s.idsaldosci) "+"left join vplancta p on (s.ctacon=p.idplancuenta) "+"where d.code="+alup(codew)+" group by s.cuenta, s.ctacon, s.sname, s.scode, s.plancod, s.idsujeto, p.auxsuj "
    IF  .NOT. sqli(q1, 'detadocp')
       RETURN .F.
    ENDIF
    IF RECCOUNT('detadocp')>0
       SELECT detadocp
       GOTO TOP
       DO WHILE  .NOT. EOF()
          IF detadocp.auxsuj>0
             q1 = "select scode, sname, idsujeto "+"from sujetos "+"where idsujeto="+alup(detadocp.auxsuj)
             IF  .NOT. sqli(q1, 'sujtdc')
                = MESSAGEBOX('Error en auxilar: Sujetos', 0, empresa)
                RETURN .F.
             ELSE
                IF RECCOUNT('sujtdc')<>1
                   = MESSAGEBOX('Error en auxilar: Sujetos', 0, empresa)
                   RETURN .F.
                ENDIF
             ENDIF
          ENDIF
          SELECT diario
          APPEND BLANK
          REPLACE diario.cuenta WITH detadocp.cuenta
          REPLACE diario.idplancuenta WITH detadocp.ctacon
          IF SUBSTR(detadocp.plancod, 1, 1)='2'
             REPLACE diario.debe WITH detadocp.valort
          ELSE
             REPLACE diario.haber WITH detadocp.valort
          ENDIF
          IF detadocp.auxsuj=0
             REPLACE diario.auxiliar WITH ALLTRIM(detadocp.sname)
             REPLACE diario.codigo WITH ALLTRIM(detadocp.plancod)+'.'+nconcero(5, detadocp.scode)
             REPLACE diario.idaux WITH detadocp.idsujeto
          ELSE
             REPLACE diario.auxiliar WITH ALLTRIM(sujtdc.sname)
             REPLACE diario.codigo WITH ALLTRIM(detadocp.plancod)+'.'+nconcero(5, sujtdc.scode)
             REPLACE diario.idaux WITH sujtdc.idsujeto
          ENDIF
          SELECT detadocp
          SKIP
       ENDDO
    ENDIF
    SELECT *, IIF(debe>0, 0, 1) AS tipdh FROM DIARIO INTO CURSOR tmpd
    SELECT * FROM tmpd WHERE debe>0 OR haber>0 ORDER BY tipdh, codigo INTO CURSOR tmpd
    SELECT diario
    SELECT SUM(debe) AS td, SUM(haber) AS th FROM diario INTO CURSOR tmpdia
    IF tmpdia.td=0 .OR. tmpdia.th=0
       WAIT WINDOW NOWAIT 'Descuadrado...'
       RETURN .F.
    ENDIF
    SELECT diario
    GOTO TOP
    IF ROUND(tmpdia.td, 2)<>ROUND(tmpdia.th, 2)
       WAIT WINDOW NOWAIT 'Descuadrado...'
       RETURN .F.
    ENDIF
    IF swbloctadoc
       IF USED('docban')
          SELECT DISTINCT d.idplancuenta, d.idaux, d.auxiliar, b.fecdoc FROM diario d LEFT JOIN docban b ON (d.idaux=b.idcuenta) INTO CURSOR blocta
       ELSE
          SELECT DISTINCT idplancuenta, idaux, auxiliar, fechaw AS fecdoc FROM diario INTO CURSOR blocta
       ENDIF
       SELECT blocta
       GOTO TOP
       SCAN
          q1 = "select distinct b.fecha, p.cuenta, p.plancod, b.auxiliar "+" from bloqueos b left join vplancta p on (b.idcuenta=p.idplancuenta) "+" where b.pdocode="+alup(iprd)+" and b.idcuenta="+alup(blocta.idplancuenta)+" and "+" b.fecha>="+alup(fecdoc)+" and b.islock"
          IF  .NOT. sqli(q1, 'bloqueos')
             WAIT WINDOW NOWAIT 'Error en bloqueos'
             RETURN .F.
          ELSE
             IF RECCOUNT('bloqueos')>0
                GOTO TOP
                swaux = .F.
                swcta = .F.
                DO WHILE  .NOT. EOF()
                   IF auxiliar=blocta.idaux
                      swaux = .T.
                      EXIT
                   ENDIF
                   IF auxiliar>0
                      swcta = .T.
                   ENDIF
                   SKIP
                ENDDO
                IF swaux .OR.  .NOT. swcta
                   = MESSAGEBOX('Una cuenta de este documento esta bloqueada...'+CHR(13)+ALLTRIM(bloqueos.plancod)+' - '+ALLTRIM(bloqueos.cuenta)+' - '+blocta.auxiliar, 0, empresa)
                   RETURN .F.
                ENDIF
             ENDIF
          ENDIF
       ENDSCAN
    ENDIF
    IF  .NOT. sqli("select s.idsecu, d.descripda from secuencias s, detagru d "+"where s.idsecuencia=d.iddato "+"and substr(d.descripda,1,18)="+alup('ASIENTOS CONTABLES')+";", 'secuencias')
       RETURN .F.
    ELSE
       SELECT secuencias
       IF RECCOUNT('secuencias')=0 .OR. RECCOUNT('secuencias')>1
          WAIT WINDOW NOWAIT 'Error en secuencia de Asientos Contables'
          USE
          RETURN .F.
       ENDIF
    ENDIF
    SELECT secuencias
    ids = idsecu
    IF tmpdia.td=0 .AND. tmpdia.th=0
       x = 0
       IF  .NOT. sqli("begin;")
          RETURN
       ENDIF
       q1 = "delete from asientosmov where idasiento in "+"(select idasiento from asientosdia "+"where code="+alup(codew)+")"
       = sqli(q1)
       q1 = "delete from asientosdia "+"where code="+alup(codew)
       = sqli(q1)
       = sqli("update documents set isaccount='t' where code="+alup(codew)+";")
       IF fintransq()
          IF swk
             IF  .NOT. nomtmp2.isaccount
                = actcosart(codew)
             ENDIF
          ENDIF
          RETURN .T.
       ELSE
          RETURN .F.
       ENDIF
    ENDIF
    IF  .NOT. sqli("begin;")
       RETURN
    ENDIF
    x = 0
    q1 = "select numasi as na "+" from asientosdia "+"where code= "+alup(codew)
    = sqli(q1, 'asiento')
    numasi = asiento.na
    q1 = "delete from asientosmov where idasiento in "+"(select idasiento from asientosdia "+"where code="+alup(codew)+")"
    = sqli(q1)
    q1 = "delete from asientosdia "+"where code="+alup(codew)
    = sqli(q1)
    = sqli("lock documents in share row exclusive mode;")
    = sqli("lock secuencias in share row exclusive mode;")
    = sqli("update documents set isaccount='t' where code="+alup(codew)+";")
    = sqli("select nextval('asientosdia_idasiento_seq'::text) as valor;", 'secdia')
    nprox = 0
    IF USED('secdia')
       SELECT secdia
       GOTO TOP
       nprox = VAL(valor)
       USE
    ENDIF
    IF numasi=0
       IF sqli("select numese from secuencias where idsecu="+alup(ids)+";", 'nextasi')
          numasi = nextasi.numese+1
       ENDIF
       USE
    ENDIF
    = sqli("update secuencias set numese="+alup(numasi)+" where idsecu="+alup(ids)+";")
    = sqli("insert into asientosdia (idasiento, numasi, code, idugra, afecha, pdocode) values "+pal(nprox)+al(numasi)+al(codew)+al(idu)+al(fechaw)+ual(iprd))
    SELECT diario
    GOTO TOP
    c = 0
    DO WHILE  .NOT. EOF()
       IF debe>0 .OR. haber>0
          q1 = "insert into asientosmov (idasiento, idcta, idaux, debe, haber, coded) values "+pal(nprox)+al(idplancuenta)+al(idaux)+al(debe)+al(haber)+ual(coded)
          IF sqli(q1)
             c = c+1
          ENDIF
       ENDIF
       SKIP
    ENDDO
    q1 = "update detadocb set isaccount='t' where code="+alup(codew)
    = sqli(q1)
    x = IIF(c=0, 1, 0)
    IF fintransq()
       IF swk
          IF  .NOT. nomtmp2.isaccount
             = actcosart(codew)
          ENDIF
       ENDIF
       RETURN .T.
    ELSE
       RETURN .F.
    ENDIF
 ENDIF
ENDFUNC
**
PROCEDURE fintrans
 IF x=0
    IF SQLEXEC(nconec, "commit;")<0
       WAIT WINDOW 'Error en la conexion con la BDD 2'
    ELSE
       = MESSAGEBOX('Registrado', 0, empresa)
    ENDIF
 ELSE
    IF SQLEXEC(nconec, "rollback;")<0
       WAIT WINDOW 'Error en la conexion con la BDD 1'
    ELSE
       = MESSAGEBOX('No se Registro!!!', 0, empresa)
    ENDIF
 ENDIF
ENDPROC
**
FUNCTION fintransq
 IF x=0
    IF SQLEXEC(nconec, "commit;")<0
       RETURN .F.
    ELSE
       RETURN .T.
    ENDIF
 ELSE
    IF SQLEXEC(nconec, "rollback;")<0
       RETURN .F.
    ELSE
       RETURN .F.
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION imagenrep
 RETURN sqli("select idimage, archivo, descripcion from imagenrep ;", 'imagenrep')
ENDFUNC
**
FUNCTION actcosdoc
 PARAMETER ncod, tarc, nite, fd, fh
 LOCAL pdoc, td, pu, ci, cf, cdoc, f, s, sfin, pua, pup, ffi, fuc
 cf = 0
 ci = 0
 f = IIF( .NOT. EMPTY(fh) .AND.  .NOT. ISNULL(fh), fh, hoy)
 fp = IIF( .NOT. EMPTY(fd) .AND.  .NOT. ISNULL(fd), fd, finip)
 sfin = .F.
 IF tipcalcos=1
    s = alup(.T.)
    IF  .NOT. EMPTY(ncod) .AND.  .NOT. ISNULL(ncod)
       q1 = "select isaccount, swkar, isdevo, swconta, fecha, istransfer "+"from vdocusmall "+"where code="+alup(ncod)
       IF sqli(q1, 'dpri')
          SELECT dpri
          GOTO TOP
          IF RECCOUNT()=0
             USE
             RETURN .F.
          ENDIF
          IF  .NOT. swkar
             RETURN .T.
          ENDIF
          IF  .NOT. swconta
             RETURN .T.
          ELSE
             IF  .NOT. isaccount
                RETURN .T.
             ENDIF
          ENDIF
          f = dpri.fecha
          fp = dpri.fecha
       ENDIF
       s = "iditem in (select iditem from detadoci where code="+alup(ncod)+") "
    ELSE
       IF  .NOT. EMPTY(tarc)
          s = "iditem in (select iditem from items where artgrupo="+alup(tarc)+") "
       ELSE
          IF  .NOT. EMPTY(nite)
             s = "iditem="+alup(nite)+" "
          ENDIF
       ENDIF
    ENDIF
    fuc = finip
    q1 = "select max(fecha) as fecha "+"from costeoinv "
    IF sqli(q1, 'fultcost')
       IF RECCOUNT('fultcost')=1
          fuc = IIF(ISNULL(fultcost.fecha) .OR. EMPTY(fultcost.fecha), finip, fultcost.fecha)
       ENDIF
    ENDIF
    q1 = "select max(fecsaldo) as fecsaldo "+"from saldosi "+"where fecsaldo<"+alup(fp)
    ffi = finip
    IF sqli(q1, 'fmaxsal')
       IF RECCOUNT('fmaxsal')<>0
          ffi = IIF(ISNULL(fmaxsal.fecsaldo) .OR. EMPTY(fmaxsal.fecsaldo), ffi, fmaxsal.fecsaldo)
       ENDIF
    ENDIF
    q1 = "select iditem, sum(inicial) as inicial, max(precio) as precio "+"from saldosi "+"where fecsaldo="+alup(ffi)+" and "+s+"group by iditem;"
    IF  .NOT. sqli(q1, 'saldosi')
       RETURN .F.
    ENDIF
    q1 = "select fecha, iditem, artcosto, descuento, artcosto as punitario, iname, icode, qty, isdevo, "+"d.code, d.istransfer  "+"from vdocui i left join vdocusmall d on (d.code=i.code) "+"where not d.istransfer and d.swkar and fecha>"+alup(ffi)+" and fecha<="+alup(f)+" and tipsaldo=2 and "+fcont+" and "+"not isanulado and "+s+" order by iditem, fecha;"
    IF  .NOT. sqli(q1, 'ingresos')
       RETURN .F.
    ENDIF
    q1 = "select iditem, icode, iname, artcosto, costopro "+"from items "+"where itipo=1 and "+s+" order by iname;"
    IF  .NOT. sqli(q1, 'articulos')
       RETURN .F.
    ENDIF
    SELECT articulos
    GOTO TOP
    DO WHILE  .NOT. EOF()
       x = 0
       WAIT WINDOW AT 3, 1 TIMEOUT 0.3 'Actualizando '+ALLTRIM(articulos.iname)
       IF  .NOT. sqli("begin;")
          EXIT
       ENDIF
       SELECT saldosi
       GOTO TOP
       LOCATE FOR iditem=articulos.iditem
       IF FOUND()
          pu = IIF(ISNULL(precio) .OR. EMPTY(precio), 0, precio)
          pua = IIF(ISNULL(precio) .OR. EMPTY(precio), 0, precio)
          ci = IIF(ISNULL(inicial), 0, inicial)
       ELSE
          pu = 0
          pua = 0
       ENDIF
       fi = fp
       SELECT ingresos
       SET FILTER TO
       SET FILTER TO iditem=articulos.iditem
       GOTO TOP
       IF  .NOT. EOF()
          IF pu=0 .OR. pua=0
             pu = ingresos.artcosto
             pua = ingresos.artcosto
          ELSE
             pup = ingresos.artcosto
          ENDIF
       ELSE
          IF pu=0
             pu = IIF(ISNULL(articulos.artcosto) .OR. EMPTY(articulos.artcosto), articulos.costopro, articulos.artcosto)
          ENDIF
       ENDIF
       DO WHILE  .NOT. EOF()
          IF fecha>=fp .AND. fecha<=f .AND. fecha>fuc
             q1 = "update detadoci set artcosto="+alup(ROUND(IIF(EMPTY(pu) .OR. ISNULL(pu), IIF(EMPTY(pua) .OR. ISNULL(pua), IIF(EMPTY(pup) .OR. ISNULL(pup), 0, pup), pua), pu), 5))+" where iditem="+alup(articulos.iditem)+" and code in "+"(select code "+" from vdocusmall "+" where pdocode="+alup(iprd)+" and tipsaldo=1 and "+fcont+" and not isdevo and not istransfer "+" and not isanulado and fecha<"+alup(fecha)+" and fecha>="+alup(fi)+")"
             IF  .NOT. sqli(q1)
                WAIT WINDOW NOWAIT 'Error en actualización'
             ENDIF
             IF ingresos.isdevo
                q1 = "update detadoci set artcosto="+alup(ROUND(IIF(EMPTY(pu) .OR. ISNULL(pu), IIF(EMPTY(pua) .OR. ISNULL(pua), IIF(EMPTY(pup) .OR. ISNULL(pup), 0, pup), pua), pu), 5))+" where iditem="+alup(articulos.iditem)+" and code="+alup(ingresos.code)
                IF  .NOT. sqli(q1)
                   WAIT WINDOW NOWAIT 'Error en actualización'
                ENDIF
             ENDIF
          ENDIF
          q1 = "select sum(qty) as qty  "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where not istransfer and tipsaldo=1 and swkar and "+fcont+" and not isanulado and "+"iditem="+alup(articulos.iditem)+" and pdocode="+alup(iprd)+" and fecha<"+alup(fecha)+" and fecha>="+alup(fi)
          IF sqli(q1, 'egr')
             ce = IIF(ISNULL(egr.qty), 0, egr.qty)
             IF ci-ce<0
                IF (EMPTY(pu) .OR. ISNULL(pu)) .AND. (EMPTY(pua) .OR. ISNULL(pua)) .AND. (EMPTY(pup) .OR. ISNULL(pup))
                   x = 1
                ENDIF
             ELSE
                IF  .NOT. ingresos.isdevo .AND.  .NOT. ingresos.istransfer
                   pu = IIF(ci-ce+ingresos.qty>0, ((ci-ce)*pu+(ingresos.qty*ingresos.artcosto)-ingresos.descuento)/((ci-ce)+ingresos.qty), ingresos.artcosto)
                   IF pu<=0
                      pu = pua
                   ELSE
                      pua = pu
                   ENDIF
                   SELECT ingresos
                   SKIP
                   IF  .NOT. EOF()
                      pup = artcosto
                   ENDIF
                   SKIP -1
                ENDIF
             ENDIF
             ci = ci-ce+ingresos.qty
          ENDIF
          SELECT ingresos
          fi = fecha
          SKIP
       ENDDO
       q1 = "select sum(qty) as qty  "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where tipsaldo=1 and "+fcont+" and not isanulado and not isdevo and "+"iditem="+alup(articulos.iditem)+" and pdocode="+alup(iprd)+" and fecha>="+alup(fi)+" and fecha<="+alup(f)
       IF sqli(q1, 'egr')
          cf = IIF(ISNULL(egr.qty), 0, egr.qty)
          ci = ci-cf
       ENDIF
       IF fi<=f .AND. fi>fuc
          q1 = "update detadoci set artcosto="+alup(pu)+" where iditem="+alup(articulos.iditem)+" and code in "+"(select code "+" from vdocusmall "+" where tipsaldo=1 and swkar and "+fcont+" and not isdevo and not istransfer "+" and not isanulado and pdocode="+alup(iprd)+" and fecha>="+alup(fi)+" and fecha<="+alup(f)+")"
          = sqli(q1)
       ENDIF
       IF f=hoy
       ENDIF
       IF  .NOT. fintransq()
          = MESSAGEBOX('Error en '+ALLTRIM(STR(articulos.icode))+' '+ALLTRIM(articulos.iname), 0, empresa)
       ENDIF
       SELECT articulos
       SKIP
    ENDDO
    WAIT CLEAR
    RETURN .T.
 ELSE
    s = alup(.T.)
    IF  .NOT. EMPTY(ncod) .AND.  .NOT. ISNULL(ncod)
       q1 = "select isaccount, swkar, isdevo, swconta, fecha, istransfer "+"from vdocusmall "+"where code="+alup(ncod)
       IF sqli(q1, 'dpri')
          SELECT dpri
          GOTO TOP
          IF RECCOUNT()=0
             USE
             RETURN .F.
          ENDIF
          IF  .NOT. swkar
             RETURN .T.
          ENDIF
          IF  .NOT. swconta
             RETURN .T.
          ELSE
             IF  .NOT. isaccount
                RETURN .T.
             ENDIF
          ENDIF
          f = dpri.fecha
          fp = dpri.fecha
       ENDIF
       s = "iditem in (select iditem from detadoci where code="+alup(ncod)+") "
    ELSE
       IF  .NOT. EMPTY(tarc)
          s = "iditem in (select iditem from items where artgrupo="+alup(tarc)+") "
       ELSE
          IF  .NOT. EMPTY(nite)
             s = "iditem="+alup(nite)+" "
          ENDIF
       ENDIF
    ENDIF
    q1 = "select iditem, icode, iname, artcosto, costopro "+"from items "+"where itipo=1 and "+s+" order by iname;"
    IF  .NOT. sqli(q1, 'articulos')
       RETURN .F.
    ENDIF
    q1 = "select distinct cospro, iditem, min(fecsaldo) as fecsaldo "+" from saldosi "+" where fecsaldo>"+alup(fp)+" group by 1,2 "+" order by 2,3 "
    IF  .NOT. sqli(q1, 'fsaldos')
       RETURN .F.
    ENDIF
    WAIT WINDOW NOWAIT 'Pprocesando.... '
    SELECT fsaldos
    SELECT articulos
    GOTO TOP
    DO WHILE  .NOT. EOF()
       WAIT WINDOW AT 3, 1 TIMEOUT 0.1 'Actualizando '+ALLTRIM(articulos.iname)
       SELECT fsaldos
       GOTO TOP
       LOCATE FOR iditem=articulos.iditem
       IF FOUND()
          x = 0
          q1 = "update detadoci set artcosto="+alup(fsaldos.cospro)+" where iditem="+alup(fsaldos.iditem)+" and code in "+"(select code "+" from vdocusmall "+" where tipsaldo=1 and "+fcont+" and not isdevo and not istransfer "+" and not isanulado and fecha>="+alup(fp)+" and fecha<="+alup(f)+")"
          IF  .NOT. sqli(q1)
             WAIT WINDOW NOWAIT 'Error en actualización'
          ENDIF
          q1 = "update detadoci set artcosto="+alup(fsaldos.cospro)+" where iditem="+alup(fsaldos.iditem)+" and code in "+" (select code "+" from vdocusmall "+" where isdevo and swkar and fecha>="+alup(fp)+" and fecha<="+alup(f)+" and tipsaldo=2 and "+fcont+" and "+"not isanulado )"
          IF  .NOT. sqli(q1)
             WAIT WINDOW NOWAIT 'Error en actualización'
          ENDIF
       ENDIF
       IF  .NOT. fintransq()
          = MESSAGEBOX('Error en '+ALLTRIM(STR(articulos.icode))+' '+ALLTRIM(articulos.iname), 0, empresa)
       ENDIF
       SELECT articulos
       SKIP
    ENDDO
    WAIT CLEAR
    RETURN .T.
 ENDIF
ENDFUNC
**
FUNCTION configura
 q1 = "select printofil as ptf, postoobar as ptb "+"from usuarios "+"where idsujeto="+alup(idu)+";"
 IF sqli(q1, 'setup')
    printofil = ptf
    postoobar = ptb
    USE
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION convunid
 PARAMETER cqty, uorig, udest
 LOCAL tare
 tare = ALIAS()
 IF USED('conver')
    SELECT conver
    GOTO TOP
 ELSE
    q1 = "select numeconver, denoconver, iddato1, iddato2 "+"from conversion "
    IF  .NOT. sqli(q1, 'conver')
       IF  .NOT. EMPTY(tare)
          SELE &tare
       ENDIF
       RETURN 0
    ENDIF
 ENDIF
 SELECT conver
 LOCATE FOR iddato2=udest .AND. iddato1=uorig
 IF FOUND()
    IF  .NOT. EMPTY(tare)
       SELE &tare
    ENDIF
    RETURN cqty*conver.numeconver/conver.denoconver
 ELSE
    SELECT conver
    GOTO TOP
    LOCATE FOR iddato2=uorig .AND. iddato1=udest
    IF FOUND()
       RETURN cqty*conver.denoconver/conver.numeconver
    ELSE
       IF  .NOT. EMPTY(tare)
          SELE &tare
       ENDIF
       RETURN 0
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION candoc
 PARAMETER xcodey
 LOCAL vrb, br
 br = 1
 IF  .NOT. rubros('D')
    RETURN .T.
 ENDIF
 IF xcodey<>0
    q1 = "select count(*)::int4 as numdoc "+"from detadocb "+"where not isdet and not isanulado and code="+alup(xcodey)
    IF  .NOT. sqli(q1, 'genban')
       RETURN .F.
    ENDIF
    SELECT genban
    IF numdoc>0
       WAIT WINDOW NOWAIT 'Ya se han generado documentos bancarios para este documento'
       RETURN .F.
    ENDIF
    q1 = "select distinct idsecudoc, montototal, ispagado, isanulado, isaccount, tipsaldo, linkdoc, fecha "+"from vdocusmall d "+"where code="+alup(xcodey)+";"
    IF  .NOT. sqli(q1, 'nomtmp2')
       WAIT WINDOW NOWAIT 'Error de conección datos principales doc.'
       RETURN .F.
    ENDIF
    SELECT nomtmp2
    IF RECCOUNT('nomtmp2')=0
       WAIT WINDOW NOWAIT 'NO existe documento'
       RETURN .F.
    ENDIF
    IF isanulado
       WAIT WINDOW NOWAIT 'Documento ANULADO'
       RETURN .F.
    ENDIF
    IF isaccount
       WAIT WINDOW NOWAIT 'Documento Contabilizado'
       RETURN .F.
    ENDIF
    q1 = "select r.rubcode, r.rubname, r.rubtype, r.isdocban, r.isdocret, r.rubformula, "+"r.rubcal, r.rubtab, d.siempre, d.issaldo "+"from secudoc s, docuse c,ddocuse d, rubros r "+"where s.iddocu=c.iddocu and c.iddocu=d.iddocu and d.rubcode=r.rubcode and "+"r.rubtype='C' and s.idsecudoc="+alup(nomtmp2.idsecudoc)+" order by rubformula;"
    IF  .NOT. sqli(q1, 'ddocuse')
       RETURN .F.
    ENDIF
    IF RECCOUNT('ddocuse')<>1
       RETURN .F.
    ELSE
       IF LIKE('*CAJA*', rubname) .AND. ingcaj
          RETURN .F.
       ENDIF
    ENDIF
    SELECT ddocuse
    GOTO TOP
    IF  .NOT. EMPTY(ALLTRIM(rubformula)) .AND.  .NOT. ISNULL(rubformula)
       RETURN .F.
    ENDIF
    x = 0
    IF  .NOT. sqli("begin;")
       RETURN .F.
    ENDIF
    = sqli("lock documents in share row exclusive mode;")
    q1 = "delete from cobros where tipo='C' and code="+alup(xcodey)
    = sqli(q1)
    IF nomtmp2.ispagado
       q1 = "select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+"from detadocd a, documents b "+"where a.coded=b.code and a.code="+alup(xcodey)+";"
       IF sqli(q1, 'detadoc')
          SELECT detadoc
          GOTO TOP
          DO WHILE  .NOT. EOF()
             q1 = "update documents set saldo="+alup(saldo+valort)+" where code="+alup(coded)+";"
             = sqli(q1)
             SKIP
          ENDDO
       ENDIF
    ENDIF
    IF nomtmp2.ispagado
       q1 = "select s.saldo, p.valort, p.idsaldosci, p.fecultpag "+"from detadocp p left join saldosci s on (p.idsaldosci=s.idsaldosci) "+"where p.code="+alup(xcodey)+";"
       IF sqli(q1, 'detadocp')
          SELECT detadocp
          GOTO TOP
          DO WHILE  .NOT. EOF()
             q1 = "update saldosci set saldo="+alup(saldo+valort)+" where idsaldosci="+alup(idsaldosci)+";"
             = sqli(q1)
             SKIP
          ENDDO
       ENDIF
    ENDIF
    q1 = "insert into cobros (code, rubcode, valor, basecal, tipo) values "+pal(xcodey)+al(ddocuse.rubcode)+al(nomtmp2.montototal)+al(0)+ual(ddocuse.rubtype)
    = sqli(q1)
    IF idcajero=0
       x = 1
    ENDIF
    IF ddocuse.issaldo
       q1 = "update documents set usercaja="+alup(idcajero)+", tmpsaldo=montototal, saldo=montototal, ispagado='t' where code="+alup(xcodey)
    ELSE
       q1 = "select sum(valor) as valor "+"from vdocusmall d left join cobros c on (d.code=c.code) "+"  left join rubros r on (c.rubcode=r.rubcode) "+"  left join ddocuse u on (d.iddocu=u.iddocu and r.rubcode=u.rubcode) "+"where u.issaldo and r.rubtype='D' and d.code="+alup(xcodey)
       IF  .NOT. sqli(q1, 'saldord')
          RETURN .F.
       ENDIF
       SELECT saldord
       GOTO TOP
       q1 = "update documents set tmpsaldo="+alup(saldord.valor)+", saldo ="+alup(saldord.valor)+", usercaja="+alup(idcajero)+", ispagado='t' where code="+alup(xcodey)
    ENDIF
    = sqli(q1)
    q1 = "select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+"from detadocd a, documents b "+"where a.coded=b.code and a.code="+alup(xcodey)+";"
    = sqli(q1, 'detadoc')
    SELECT detadoc
    GOTO TOP
    DO WHILE  .NOT. EOF()
       IF saldo-valort<0
          SELECT novedad
          APPEND BLANK
          REPLACE descrip WITH 'Revise el detalle de liq. codigo doc.'+alup(detadoc.coded)
          WAIT WINDOW NOWAIT 'Revise el detalle de liq. codigo doc.'+alup(detadoc.coded)
          SELECT detadoc
          x = 1
       ELSE
          q1 = "update documents set saldo="+alup(saldo-valort)+" where code="+alup(coded)+";"
          = sqli(q1)
       ENDIF
       SKIP
    ENDDO
    q1 = "select a.saldoant, a.valort, a.idsaldosci "+"from detadocp a "+"where a.code="+alup(xcodey)+";"
    IF sqli(q1, 'detadocp')
       SELECT detadocp
       GOTO TOP
       DO WHILE  .NOT. EOF()
          q1 = "update saldosci set saldo=saldo-"+alup(valort)+" where idsaldosci="+alup(idsaldosci)+";"
          = sqli(q1)
          SKIP
       ENDDO
    ENDIF
    rc = fintransq()
    n = xcodey
    IF x=0
       = MESSAGEBOX('Documento Cerrado...', 0, empresa)
       SELECT ddocuse
       IF ALLTRIM(UPPER(rubname))='CAJA' .AND. nomtmp2.tipsaldo=1
          IF MESSAGEBOX('Desea Registrar Cheques de clientes? ', 36)=6
             DO FORM cheques WITH n
          ENDIF
       ENDIF
       IF isdocban
          IF transche(xcodey)
             SELECT ddocuse
             IF MESSAGEBOX('Desea Generar '+ALLTRIM(rubname)+'? ', 36)=6
                n = xcodey
                DO FORM adq0702b WITH n
             ENDIF
          ENDIF
       ENDIF
       IF rc
          RETURN .T.
       ENDIF
    ELSE
       RETURN .F.
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION transche
 PARAMETER ycode
 IF swkeycon
    fcont1 = 'd.isaccount'
 ELSE
    fcont1 = alup(.T.)
 ENDIF
 q1 = "select c.valor, d.linkdoc, fecha, c.rubcode "+"from documents d left join cobros c on (d.code=c.code) "+" left join rubros r on (c.rubcode=r.rubcode) "+"where c.code="+alup(ycode)+" and r.rubtype='C' and r.isdocban and not d.isanulado and not "+fcont1
 IF  .NOT. sqli(q1, 'tcoban')
    RETURN .F.
 ENDIF
 IF RECCOUNT('tcoban')=0
    RETURN .T.
 ENDIF
 q1 = "select * "+"from detadocb "+"where punitario="+alup(valor)+" and isposfec and fecdoc="+alup(tcoban.fecha)+" and not isconpos and code="+alup(tcoban.linkdoc)
 IF  .NOT. sqli(q1, 'chequepos')
    RETURN .F.
 ENDIF
 SELECT chequepos
 IF RECCOUNT('chequepos')>0
    x = 0
    = sqli("begin;")
    q1 = "update cobros set isupdate ="+alup(.T.)+" where code="+alup(ycode)+" and rubcode="+alup(tcoban.rubcode)+";"
    = sqli(q1)
    q1 = "update detadocb set isconpos='t', "+"code="+alup(ycode)+" where punitario="+alup(tcoban.valor)+" and isposfec and fecdoc="+alup(nomtmp2.fecha)+" and not isconpos and code="+alup(nomtmp2.linkdoc)
    = sqli(q1)
    = fintransq()
    WAIT WINDOW NOWAIT 'Se han transferido cheques posfechados a este documento'
 ENDIF
 RETURN .T.
ENDFUNC
**
FUNCTION anuladoc
 PARAMETER codek
 LOCAL iddocuy, linkdocy, fechay, ispagadoy, isanuladoy
 q1 = "select distinct code, iddocu, nomdoc, isprint, ispagado, isaccount, "+"isanulado, fecgra, fecha, num, sname, moneda, poriva, montototal, "+"numcuota, ffrom, fto, linkdoc, subconiva, descuconiva, subsiniva, "+"descusiniva, recargo, flete, ivavalor, icevalor, ipsvalor, subtotal, valcuota, "+"concepto, saldo "+"from vdocuments where code="+alup(codek)+";"
 IF  .NOT. sqli(q1, 'nomtmp0')
    RETURN .F.
 ENDIF
 SELECT nomtmp0
 iddocuy = iddocu
 linkdocy = linkdoc
 fechay = fecha
 ispagadoy = ispagado
 isanuladoy = isanulado
 IF isanuladoy
    WAIT WINDOW NOWAIT 'Documento Anulado'
    RETURN .T.
 ENDIF
 IF  .NOT. autper(codek, 3)
    WAIT WINDOW NOWAIT 'No tiene Acceso de anulación total'
    RETURN .F.
 ENDIF
 IF EMPTY(codek)
    WAIT WINDOW NOWAIT 'Ingrese Codigo'
    RETURN .F.
 ENDIF
 IF bloqueodoc(codek)
    RETURN .F.
 ENDIF
 q1 = "select isposfec, isconpos, isconciliado, isprotesto, isconfbanc, fecpag, punitario, fecdoc "+"from vdocub "+"where code="+alup(codek)+" and not isanulado ;"
 IF  .NOT. sqli(q1, 'docban')
    RETURN .F.
 ENDIF
 SELECT docban
 GOTO TOP
 DO WHILE  .NOT. EOF()
    IF isconciliado .OR. isconfbanc
       WAIT WINDOW NOWAIT 'Existe documentos bancarios confirmados'
       RETURN .F.
    ENDIF
    SKIP
 ENDDO
 q1 = "select p.codimp "+"from import p left join importd d on (p.idimport=d.idimport) "+"where not isanulado and d.code="+alup(codek)
 IF  .NOT. sqli(q1, 'import')
    WAIT WINDOW NOWAIT 'Error en consulta de importaciones o compras locales'
    RETURN .F.
 ENDIF
 SELECT import
 GOTO TOP
 IF RECCOUNT()>0
    WAIT WINDOW NOWAIT 'Este documento esta registrado en el calculo de articulos '+ALLTRIM(STR(codimp))
    RETURN .F.
 ENDIF
 q1 = "select code from documents where "+fcont+" and not isanulado and code in "+"(select code from detadocd where coded="+alup(codek)+")"
 IF  .NOT. sqli(q1, 'docliq')
    RETURN
 ELSE
    SELECT docliq
    IF RECCOUNT()>0
       WAIT WINDOW NOWAIT 'Exiten documentos de liquidación que hacen referencia a este documento'
       RETURN .F.
    ENDIF
 ENDIF
 q1 = "select code "+"from vdocusmall "+"where iddocu<>"+alup(nomtmp0.iddocu)+" and "+fcont+" and not isanulado and linkdoc="+alup(codek)
 IF  .NOT. sqli(q1, 'docgen')
    RETURN
 ELSE
    SELECT docgen
    IF RECCOUNT()>0
       IF MESSAGEBOX('Exiten Doc. generado en base a este y aun esta activo desea continuar? '+ALLTRIM(STR(code)), 36, empresa)<>6
          RETURN .F.
       ENDIF
    ENDIF
 ENDIF
 x = 0
 IF  .NOT. sqli("begin;")
    RETURN
 ENDIF
 IF linkdocy>0
    SELECT docban
    GOTO TOP
    DO WHILE  .NOT. EOF()
       IF isposfec .AND. isconpos .AND. fecdoc=.fecha
          q1 = "update detadocb set isconpos='f', "+"code="+alup(linkdocy)+" where punitario="+alup(punitario)+" and not isanulado "+" and isposfec and isconpos and code="+alup(codek)
          = sqli(q1)
       ENDIF
       SKIP
    ENDDO
 ENDIF
 q1 = "update documents set isanulado="+alup(.T.)+", iduanu="+alup(idu)+" where code="+alup(codek)+";"
 = sqli(q1)
 q1 = "update cheques set codvencar=0"+", isefectivo='f' "+", fecdepo=null "+" where codvencar="+alup(codek)
 = sqli(q1)
 q1 = "select idcheque from detadocs where code="+alup(codek)
 IF sqli(q1, 'checli')
    SELECT checli
    GOTO TOP
    DO WHILE  .NOT. EOF()
       q1 = "update cheques set isefectivo='f'"+" where idcheque="+alup(idcheque)+";"
       = sqli(q1)
       SELECT checli
       SKIP
    ENDDO
 ENDIF
 q1 = "select code, codedes from descargov where codedes="+alup(codek)+";"
 IF sqli(q1, 'descargo')
    IF RECCOUNT('descargo')>0
       x = 1
       WAIT WINDOW NOWAIT 'Existe este documento registrado en un doc. de descargo '+STR(code)
    ENDIF
 ENDIF
 q1 = "select dflag from documents where code="+alup(codek)+";"
 IF sqli(q1, 'descargo')
    IF dflag
       WAIT WINDOW NOWAIT 'documento ha sido descargado de inventario'
       x = 1
    ENDIF
 ENDIF
 q1 = "select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+"from detadocd a, documents b "+"where a.coded=b.code and a.code="+alup(codek)+";"
 IF sqli(q1, 'detadoc')
    SELECT detadoc
    GOTO TOP
    DO WHILE  .NOT. EOF()
       IF ispagadoy
          q1 = "update documents set saldo="+alup(saldo+valort)+" where code="+alup(coded)+";"
          = sqli(q1)
       ENDIF
       SKIP
    ENDDO
 ENDIF
 q1 = "update detadocb set isanulado="+alup(.T.)+" where code="+alup(codek)+";"
 = sqli(q1)
 q1 = "update cheques set isanulado="+alup(.T.)+" where code="+alup(codek)+";"
 = sqli(q1)
 q1 = "update depreact set isreg="+alup(.F.)+" where code="+alup(codek)+";"
 = sqli(q1)
 IF ispagadoy
    q1 = "select s.monto, s.saldo, p.valort, p.idsaldosci, p.fecultpag "+"from detadocp p left join saldosci s on (p.idsaldosci=s.idsaldosci) "+"where p.code="+alup(codek)+";"
    IF sqli(q1, 'detadp')
       SELECT detadp
       GOTO TOP
       DO WHILE  .NOT. EOF()
          q1 = "update saldosci set saldo="+alup(IIF(saldo+valort>monto, monto, saldo+valort))+" where idsaldosci="+alup(idsaldosci)+";"
          = sqli(q1)
          SKIP
       ENDDO
    ENDIF
 ENDIF
 q1 = "update asientosdia set isanulado="+alup(.T.)+" where code="+alup(codek)+";"
 = sqli(q1)
 q1 = "insert into auditoria (idu, modulo, ame,  nametable, keytable,  progname) values "+pal(idu)+al(modulok)+al('E')+al('DOCUMENTS')+al(codek)+ual('ADQ0704')
 = sqli(q1)
 WAIT WINDOW NOWAIT 'Documento anulado'
 IF fintransq()
    = actcosart(codek)
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION bloqueodoc
 PARAMETER codez, dtagz, fechaz
 LOCAL dz, fz
 IF swbloctadoc
    IF EMPTY(codez) .OR. ISNULL(codez)
       codez = 0
    ENDIF
    q1 = "select isaccount, fecha, dtag, swconta "+"from vdocusmall "+"where code="+alup(codez)
    IF  .NOT. sqli(q1, 'documx')
       RETURN .T.
    ENDIF
    IF codez>0
       IF documx.isaccount
          q1 = "select distinct idcta, idaux "+"from asientosdia a left join asientosmov m on (a.idasiento=m.idasiento) "+"where a.code="+alup(codez)
          IF  .NOT. sqli(q1, 'blocta')
             RETURN .T.
          ENDIF
          SELECT blocta
          GOTO TOP
          SCAN
             q1 = "select distinct b.fecha, p.cuenta, p.plancod, b.auxiliar "+" from bloqueos b left join vplancta p on (b.idcuenta=p.idplancuenta) "+" where b.pdocode="+alup(iprd)+" and b.idcuenta="+alup(blocta.idcta)+" and "+" b.fecha>="+alup(documx.fecha)+" and b.islock"
             IF  .NOT. sqli(q1, 'bloqueos')
                WAIT WINDOW NOWAIT 'Error en bloqueos'
                RETURN .T.
             ELSE
                IF RECCOUNT('bloqueos')>0
                   GOTO TOP
                   swaux = .F.
                   swcta = .F.
                   DO WHILE  .NOT. EOF()
                      IF auxiliar=blocta.idaux
                         swaux = .T.
                      ENDIF
                      IF auxiliar>0
                         swcta = .T.
                      ENDIF
                      SKIP
                   ENDDO
                   IF swaux .OR.  .NOT. swcta
                      WAIT WINDOW NOWAIT 'Una cuenta de este documento esta bloqueada...'+CHR(13)+ALLTRIM(bloqueos.plancod)+' - '+ALLTRIM(bloqueos.cuenta)
                      RETURN .T.
                   ENDIF
                ENDIF
             ENDIF
          ENDSCAN
       ENDIF
    ENDIF
    IF ISNULL(dtagz) .OR. EMPTY(dtagz)
       dz = documx.dtag
       fz = documx.fecha
    ELSE
       dz = dtagz
       fz = fechaz
    ENDIF
    q1 = "select distinct b.fecha, g.descrip "+" from bloqueos b left join gdoc g on (b.idgrupo=g.idgdoc) "+" left join dgdoc t on (g.idgdoc=t.idgdoc) "+" left join docuse s on (t.dtag=s.dtag) "+" where b.pdocode="+alup(iprd)+" and s.pdocode="+alup(iprd)+" and b.idgrupo>0 and "+" s.dtag="+alup(dz)+" and b.fecha>="+alup(fz)+" and b.islock"
    IF  .NOT. sqli(q1, 'bloqueos')
       WAIT WINDOW NOWAIT 'Error en bloqueos'
       RETURN .T.
    ELSE
       IF RECCOUNT('bloqueos')>0
          WAIT WINDOW NOWAIT 'El grupo al que pertenece este documento esta bloqueado...'+CHR(13)+ALLTRIM(bloqueos.descrip)
          RETURN .T.
       ELSE
          RETURN .F.
       ENDIF
    ENDIF
    RETURN .F.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION saldoitem
 PARAMETER isaldo, fsaldo, bsaldo
 LOCAL fbod, fbod2, ffec
 fsaldo = IIF(EMPTY(fsaldo) .OR. ISNULL(fsaldo), hoy, fsaldo)
 IF (EMPTY(bsaldo) .OR. ISNULL(bsaldo))
    fbod = alup(.T.)
    fbod2 = alup(.T.)
 ELSE
    fbod = "bodega="+alup(bsaldo)
    fbod2 = "userstore="+alup(bsaldo)
 ENDIF
 IF (EMPTY(fsaldo) .OR. ISNULL(fsaldo))
    ffec = "fecha<="+alup(hoy)
 ELSE
    ffec = "fecha<="+alup(fsaldo)
 ENDIF
 q1 = "select max(fecsaldo) as fecsaldo "+"from saldosi "+"where fecsaldo<"+alup(IIF(EMPTY(fsaldo) .OR. ISNULL(fsaldo), hoy, fsaldo))+" and iditem="+alup(isaldo)
 ffi = finip
 IF sqli(q1, 'fmaxsal')
    IF RECCOUNT('fmaxsal')<>0
       ffi = IIF(ISNULL(fmaxsal.fecsaldo) .OR. EMPTY(fmaxsal.fecsaldo), ffi, fmaxsal.fecsaldo)
    ENDIF
 ENDIF
 q1 = "select iditem, sum(qtyini) as qtyini "+"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+"where fecsaldo="+alup(ffi)+" and "+fbod+" and iditem="+alup(isaldo)+" group by iditem;"
 IF  .NOT. sqli(q1, 'saldb')
    RETURN 0
 ENDIF
 q1 = "select iditem, sum(case when tipsaldo=1 then qty*(-1) else qty end) as qty "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where "+fbod2+" and fecha>"+alup(ffi)+" and "+ffec+" and d.iddocu in "+"(select distinct d.iddocu "+" from gdoc g, dgdoc t, docuse d "+" where g.tag='KARKAR' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+" and case when swconta then isaccount else 't' end "+" and not isanulado and iditem="+alup(isaldo)+" group by iditem ;"
 IF  .NOT. sqli(q1, 'movitx')
    RETURN 0
 ENDIF
 RETURN IIF(ISNULL(saldb.qtyini), 0, saldb.qtyini)+IIF(ISNULL(movitx.qty), 0, movitx.qty)
ENDFUNC
**
FUNCTION saliteini
 PARAMETER isaldo, fsaldo, bsaldo
 LOCAL fbod, fbod2, ffec
 fsaldo = IIF(EMPTY(fsaldo) .OR. ISNULL(fsaldo), hoy, fsaldo)
 IF (EMPTY(bsaldo) .OR. ISNULL(bsaldo))
    fbod = alup(.T.)
    fbod2 = alup(.T.)
 ELSE
    fbod = "bodega="+alup(bsaldo)
    fbod2 = "userstore="+alup(bsaldo)
 ENDIF
 IF (EMPTY(fsaldo) .OR. ISNULL(fsaldo))
    ffec = "fecha<="+alup(hoy)
 ELSE
    ffec = "fecha<="+alup(fsaldo)
 ENDIF
 ffi = finip
 q1 = "select iditem, sum(qtyini) as qtyini "+"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+"where fecsaldo="+alup(ffi)+" and "+fbod+" and iditem="+alup(isaldo)+" group by iditem;"
 IF  .NOT. sqli(q1, 'saldb')
    RETURN
 ENDIF
 q1 = "select iditem, sum(case when tipsaldo=1 then qty*(-1) else qty end) as qty "+"from detadoci i left join vdocusmall d on (d.code=i.code) "+"where "+fbod2+" and fecha>"+alup(ffi)+" and "+ffec+" and d.iddocu in "+"(select distinct d.iddocu "+" from gdoc g, dgdoc t, docuse d "+" where g.tag='KARKAR' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+" and case when swconta then isaccount else 't' end "+" and not isanulado and iditem="+alup(isaldo)+" group by iditem ;"
 IF  .NOT. sqli(q1, 'movitx')
    RETURN
 ENDIF
 RETURN IIF(ISNULL(saldb.qtyini), 0, saldb.qtyini)+IIF(ISNULL(movitx.qty), 0, movitx.qty)
ENDFUNC
**
FUNCTION impasiento
 PARAMETER coddoc
 WAIT WINDOW NOWAIT 'Generando Asiento Contable....'
 q1 = "select distinct d.code, d.nomdoc, d.sname, d.concepto, d.documentos, d.tipsaldo,  s.sname as nombreu,  "+" t.descrip AS tipdoc, numserie2, numsecue2, numauto2 as numautadq, fcaducidad2 as feccadadq, fecha2 as fecdocadq "+"from vdocusmall d left join sujetos s on (d.idugra=s.idsujeto)"+"  left join aneiva a on (d.code=a.code) "+"  LEFT JOIN sritabla t ON a.idtipdoc = t.idsritabla "+"where d.code="+alup(coddoc)+";"
 IF  .NOT. sqli(q1, 'tprinc')
    RETURN .T.
 ENDIF
 IF tprinc.documentos
    q1 = "select distinct d.code, d.isanulado, numasi, plancod, auxiliar::char(6) as codaux, afecha, nomcta as cuenta, "+"substr(auxname,1,25)||case when a.numsecue2>0 	then '  Doc:'||to_char(a.numsecue2,'9999999') "+"	when p.num>0 		then '  Doc:'||to_char(p.num,'9999999') "+"	else '' end as auxname, debe, haber, auxcode, d.coded, idaux, idasimov  "+"from vdiario d left join aneiva a on (d.coded=a.code) "+" 	left join documents p on (d.coded=p.code) "+"where d.code="+alup(coddoc)+";"
 ELSE
    q1 = "select code, isanulado, numasi, plancod, auxiliar::char(6) as codaux, afecha, nomcta as cuenta, "+"auxname, debe, haber, auxcode, code as coded, idaux, idasimov "+"from vdiario d "+"where code="+alup(coddoc)+";"
 ENDIF
 IF  .NOT. sqli(q1, 'asiento75')
    RETURN .T.
 ENDIF
 q1 = "SELECT DISTINCT t.code, i.nucuban, t.nudocban, t.punitario, t.fecdoc, t.idcuenta, i.ticuban, t.secuencia, "+" to_char(i.numaux, ('09999'::bpchar)::text) AS codaux, "+" ((btrim((k.descripda)::text, ' '::text) || ' '::text) || ((i.nucuban)::character varying(15))::text) AS auxname "+"FROM (((detadocb t LEFT JOIN ctasban i ON ((t.idcuenta = i.idcuenta))) "+"   LEFT JOIN detagru k ON ((i.idbanco = k.iddato))) "+"   LEFT JOIN reversodoc r ON ((t.tipodoc = r.iddocu))) "+" where not isanulado and code="+alup(coddoc)+";"
 IF  .NOT. sqli(q1, 'cheques')
    RETURN .T.
 ENDIF
 IF RECCOUNT('cheques')>=1
    SELECT DISTINCT d.nomdoc, d.code, d.sname, d.concepto, a.numasi, a.afecha, a.debe, a.haber, a.isanulado, cuenta, ALLTRIM(a.plancod)+'.'+ALLTRIM(codaux)+SPACE(25) AS codigo, ALLTRIM(SUBSTR(a.auxname, 1, 100))+SPACE(100) AS auxiliar, a.coded, idasimov, nombreu FROM asiento75 a LEFT JOIN tprinc d ON (a.code=d.code) WHERE auxcode<>'B' INTO CURSOR asientoa
    SELECT DISTINCT d.nomdoc, d.code, d.sname, d.concepto, a.numasi, a.afecha, a.isanulado, cuenta, plancod, IIF(a.debe>0, .T., .F.) AS swdebe FROM asiento75 a LEFT JOIN tprinc d ON (a.code=d.code) WHERE auxcode='B' INTO CURSOR cuentaban
    SELECT DISTINCT b.*, ALLTRIM(plancod)+'.'+ALLTRIM(codaux)+SPACE(25) AS codigo, IIF(swdebe, punitario, 000000000.00 ) AS debe, IIF( NOT swdebe, punitario, 00000000.00 ) AS haber, SUBSTR(ALLTRIM(c.auxname)+' Doc: '+ALLTRIM(STR(nudocban))+' fec: '+devfeclet(fecdoc, 5)+'    ', 1, 200) AS auxiliar, 000000 AS coded, 000000000 AS idasimov FROM cheques c LEFT JOIN cuentaban b ON (c.code=b.code) INTO CURSOR asientob
    SELECT nomdoc, code, sname, concepto, numasi, afecha, debe, haber, isanulado, SUBSTR(nombreu, 1, 40) AS nombreu, cuenta, SUBSTR(codigo, 1, 100) AS codigo, SUBSTR(auxiliar, 1, 200) AS auxiliar, coded, idasimov FROM asientoa UNION SELECT nomdoc, code, sname, concepto, numasi, afecha, debe, haber, isanulado, SPACE(40) AS nombreu, cuenta, SUBSTR(codigo, 1, 100) AS codigo, SUBSTR(auxiliar, 1, 200) AS auxiliar, coded, idasimov FROM asientob INTO CURSOR asientoz
    SELECT a.*, tipdoc, numserie2, numsecue2, numautadq, feccadadq, fecdocadq FROM asientoz a LEFT JOIN tprinc p ON (a.code=p.code) ORDER BY debe DESC INTO CURSOR asientox
 ELSE
    SELECT DISTINCT d.nomdoc, d.code, d.sname, d.concepto, a.numasi, a.afecha, a.debe, a.haber, a.isanulado, cuenta, d.nombreu, ALLTRIM(a.plancod)+'.'+ALLTRIM(codaux)+SPACE(25) AS codigo, ALLTRIM(SUBSTR(a.auxname, 1, 100)) AS auxiliar, a.coded, idasimov, tipdoc, numserie2, numsecue2, numautadq, feccadadq, fecdocadq FROM asiento75 a LEFT JOIN tprinc d ON (a.code=d.code) ORDER BY a.debe DESC INTO CURSOR asientox
 ENDIF
 SELECT asientox
 = ireport('asientocon')
ENDFUNC
**
FUNCTION rubdoc
 PARAMETER qcode
 CREATE CURSOR vardoc (rubcode N (6), rubformula C (50), valor N (12, 2))
 q1 = "select rubcode, rubformula "+" from rubros "+" where rubtype='D' "
 IF  .NOT. sqli(q1, 'qrubros')
    RETURN .F.
 ENDIF
 q1 = "select * from documents where code="+alup(qcode)
 IF  .NOT. sqli(q1, 'qdoc')
    RETURN .F.
 ENDIF
 SELECT qdoc
 SELECT qrubros
 GOTO TOP
 DO WHILE  .NOT. EOF()
    SELECT vardoc
    APPEND BLANK
    REPLACE rubformula WITH qrubros.rubformula
    REPLACE rubcode WITH qrubros.rubcode
    fe = "replace valor 	with qdoc."+ALLTRIM(qrubros.rubformula)
    &fe
    SELECT qrubros
    SKIP
 ENDDO
 SELECT qrubros
 RETURN
ENDFUNC
**
FUNCTION regcobsal
 PARAMETER coddoc
 q1 = "select d.iddocu, t.rubcode, issaldo "+"from docuse d left join ddocuse t on (d.iddocu=t.iddocu) "+"  left join rubros r on (t.rubcode=r.rubcode) "+" where iddocu="+alup(coddoc)+" and rubtype='D' and issaldo "
 IF  .NOT. sqli(q1, 'confsal')
    RETURN
 ENDIF
 IF RECCOUNT('confsal')=0
    RETURN .T.
 ENDIF
 q1 = "select code, iddocu "+" from vdocusmall d "+" where iddocu="+alup(coddoc)+" and swconta and code not in (select distinct code from cobros where tipo='D') "
 = sqli(q1, 'docsinrub')
 SELECT docsinrub
 GOTO TOP
 DO WHILE  .NOT. EOF()
    WAIT WINDOW NOWAIT 'Actualizando configuracion de saldos '+STR(code)
    = rubdoc(code)
    SELECT confsal
    GOTO TOP
    DO WHILE  .NOT. EOF()
       SELECT vardoc
       GOTO TOP
       LOCATE FOR rubcode=confsal.rubcode
       IF FOUND()
          q1 = "insert into cobros ( code, rubcode, valor, tipo) values "+pal(docsinrub.code)+al(vardoc.rubcode)+al(vardoc.valor)+ual('D')
          = sqli(q1)
       ENDIF
       SELECT confsal
       SKIP
    ENDDO
    SELECT docsinrub
    SKIP
 ENDDO
 RETURN .T.
ENDFUNC
**
FUNCTION calsuel
 PARAMETER idsuj, feci, fecf
 IF EMPTY(idsuj) .OR. ISNULL(idsuj)
    RETURN 0
 ENDIF
 IF EMPTY(feci) .OR. ISNULL(feci)
    RETURN 0
 ENDIF
 IF EMPTY(fecf) .OR. ISNULL(fecf)
    RETURN 0
 ENDIF
 q1 = "select sum(numhec*valorunit) as valor "+" from actividad "+" where fecha>="+alup(feci)+" and fecha<="+alup(fecf)+" and idsujeto="+alup(idsuj)
 IF sqli(q1, 'actividad')
    SELECT actividad
    IF valor>0
       RETURN valor
    ELSE
       RETURN 0
    ENDIF
 ELSE
    RETURN 0
 ENDIF
ENDFUNC
**
FUNCTION forpagsri
 PARAMETER codk
 LOCAL forpag1k, forpag2k, forpag3k, ncombo
 forpag1k = 0
 forpag2k = 0
 forpag3k = 0
 q1 = "select cliente, fecha, forpag1, forpag2, forpag3 "+"from documents d left join aneiva a on (d.code=a.code)  "+"where d.code="+alup(codk)
 IF sqli(q1, 'anedoc')
    SELECT anedoc
    GOTO TOP
    IF IIF(ISNULL(forpag1), 0, forpag1)+IIF(ISNULL(forpag2), 0, forpag2)+IIF(ISNULL(forpag3), 0, forpag3)>0
       RETURN .T.
    ENDIF
 ELSE
    RETURN
 ENDIF
 q1 = "select rubname, valor "+"from cobros c left join rubros r on (c.rubcode=r.rubcode) "+"where c.tipo='C' and code="+alup(codk)+";"
 IF  .NOT. sqli(q1, 'tmpcob')
    RETURN
 ENDIF
 SELECT tmpcob
 GOTO TOP
 ncombo = 1
 DO WHILE  .NOT. EOF()
    DO CASE
       CASE ncombo=1
          IF tmpcob.rubname='CAJA' .AND. valor>0
             forpag1k = 1
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('CHEQUE*CLI*', tmpcob.rubname) .OR. LIKE('DEPOSITO*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag1k = 2
             ELSE
                forpag1k = 20
             ENDIF
             ncombo = ncombo+1
          ENDIF
          IF LIKE('CUENTA*COBRAR*', tmpcob.rubname) .AND. valor>0
             q1 = "select sforpag from sujetos where idsujeto="+alup(anedoc.cliente)
             IF sqli(q1, 'fpcli')
                IF fpcli.sforpag>0
                   forpag1k = fpcli.sforpag
                ELSE
                   forpag1k = 1
                ENDIF
                ncombo = ncombo+1
             ENDIF
          ENDIF
          IF LIKE('DINERO*E*', tmpcob.rubname) .AND. valor>0
             forpag1k = 17
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('TARJETA*', tmpcob.rubname) .OR. LIKE('T/C*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag1k = 10
             ELSE
                forpag1k = 19
             ENDIF
             ncombo = ncombo+1
          ENDIF
       CASE ncombo=2
          IF tmpcob.rubname='CAJA' .AND. valor>0
             forpag2k = 1
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('CHEQUE*CLI*', tmpcob.rubname) .OR. LIKE('DEPOSITO*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag2k = 2
             ELSE
                forpag2k = 20
             ENDIF
             ncombo = ncombo+1
          ENDIF
          IF LIKE('CUENTA*COBRAR*', tmpcob.rubname) .AND. valor>0
             q1 = "select sforpag from sujetos where idsujeto="+alup(anedoc.cliente)
             IF sqli(q1, 'fpcli')
                IF fpcli.sforpag>0
                   forpag2k = fpcli.sforpag
                ELSE
                   forpag2k = 1
                ENDIF
             ENDIF
             ncombo = ncombo+1
          ENDIF
          IF LIKE('DINERO*E*', tmpcob.rubname) .AND. valor>0
             forpag2k = 17
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('TARJETA*', tmpcob.rubname) .OR. LIKE('T/C*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag2k = 10
             ELSE
                forpag2k = 19
             ENDIF
             ncombo = ncombo+1
          ENDIF
       CASE ncombo=3
          IF tmpcob.rubname='CAJA' .AND. valor>0
             forpag3k = 1
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('CHEQUE*CLI*', tmpcob.rubname) .OR. LIKE('DEPOSITO*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag3k = 2
             ELSE
                forpag3k = 20
             ENDIF
             ncombo = ncombo+1
          ENDIF
          IF LIKE('CUENTA*COBRAR*', tmpcob.rubname) .AND. valor>0
             q1 = "select sforpag from sujetos where idsujeto="+alup(anedoc.cliente)
             IF sqli(q1, 'fpcli')
                IF fpcli.sforpag>0
                   forpag3k = fpcli.sforpag
                ELSE
                   forpag3k = 1
                ENDIF
             ENDIF
             ncombo = ncombo+1
          ENDIF
          IF LIKE('DINERO*E*', tmpcob.rubname) .AND. valor>0
             forpag3k = 17
             ncombo = ncombo+1
          ENDIF
          IF (LIKE('TARJETA*', tmpcob.rubname) .OR. LIKE('T/C*', tmpcob.rubname)) .AND. valor>0
             IF anedoc.fecha<DATE(2016, 06, 01)
                forpag3k = 10
             ELSE
                forpag3k = 19
             ENDIF
             ncombo = ncombo+1
          ENDIF
    ENDCASE
    SELECT tmpcob
    SKIP
 ENDDO
 IF forpag1k+forpag2k+forpag1k=0
    forpag1k = 1
 ENDIF
 q1 = "update aneiva set  forpag1="+alup(forpag1k)+", forpag2="+alup(forpag2k)+", forpag3="+alup(forpag3k)+" where code="+alup(codk)
 RETURN sqli(q1)
ENDFUNC
**
