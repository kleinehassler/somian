function sqli
para insql, nomtab
local are
are=alias()

if empty(nomtab) or isnull(nomtab) then
	if sqlexec(nconec,insql)<0 then
		do regerrbd
		wait 'Error en consulta' wind nowait
		if !empty(are) then
			select &are
		endif
		x=1
		return .f.
	else
		return .t.
	endif
else
	if sqlexec(nconec,insql,nomtab)<0 then
		do regerrbd
		wait 'Error en '+nomtab wind nowait
		if !empty(are) then
			select &are
		endif
		x=1
		return .f.
	else
		return .t.
	endif
endif

function empresas
q1="select ssri, sruc from empresas;"
if !sqli(q1,'empresas') then
	return .f.
endif
sele empresas
if reccount()=1 then
	return .t.
else
	return .f.
endif

function taccesos
q1="select * from accesos;"
return sqli(q1,'taccesos') 

*****************************************************************************************
*
*  Usuarios de una empresa
*
*****************************************************************************************
function usuempre
q1="select u.idsujeto, u.sname as nombreu, u.tipou, u.scode "+;
  	   "from vusuarios u ;"
return sqli(q1,'usuempre')

*****************************************************************************************
*
*  Programas 
*
*****************************************************************************************
function programas
q1="select idprograma, descrippro, progname "+;
					"from programas "+;
					"order by progname;"
return sqli(q1,'programas')

*****************************************************************************************
*	Articulos: 	MP=>MATERIA PRIMA			VR=>Varios  				PQ=>Productos Quimicos
*				CL=>Combustibles y Lubric.	ME=>Rep. Maq. y Equipos		RV=>Repuesto de Vehiculos
*				EL=>Materiales Electricos	MV=>Materiales Varios		TD=>Todos
*	Parámetro character
*****************************************************************************************
function articulosc
parame tipart
local tipo

tipo=tipart
if empty(tipo) or tipo='TD' then   && todos los articulos
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artipo, artmarca, isiva, "+;
			"artcosto, artcosto2 "+;
		" from vitems ;"
	return sqli(q1,'articulosc')
	
endif

q1= "select iditem, icode, iname, artgrupo, artsgrupo, artipo, artmarca, isiva, "+;
	"artcosto, artcosto2 "+;
	"from vitems "+;
	"where itipo=1 and substr(valordagru,1,2)="+alup(tipo)+" ;"
	
return sqli(q1,'articulosc')

*****************************************************************************************
*	Articulos con parametro (Tipo de articulo dato numérico) 
*****************************************************************************************
function articulos
parame tipo

if isnull(tipo) then
	return .f.
endif

if tipo>0 then
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
			"artcosto "+;
		"from vitems "+;
		"where itipo=1 and artgrupo="+alup(tipo)+" order by icode,iname;"
				
	return sqli(q1,'articulos')
	
else && si no tiene tipo, escoger todos
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
			"artcosto "+;	
		"from vitems "+;
		"where itipos=1 order by icode, iname;"
		
	return sqli(q1,'articulos')
	
endif

*****************************************************************************************
*	Servicios con parametro (Tipo de Servicio)
*****************************************************************************************
function servicios
parame tipo
local tipser
tipser=tipo

if !empty(tipser) then
	
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
				"artcosto "+;
				"from vitems "+;
				"where itipo=3 and artgrupo="+alup(tipser)+" order by icode, iname;"
				
	return sqli(q1,'servicios')
	
else && si no tiene tipo, escoger todos	
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
			"artcosto "+;
		"from vitems "+;
		"where itipo=3 and order by icode, iname;"
				
	return sqli(q1,'servicios')
	
endif

*****************************************************************************************
*	Activos Fijos con parametro (Tipo de Activo) ojo revisar
*****************************************************************************************
function actitems
parame tipo
local tact
tact=tipo

if !empty(tact) then
	q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
			"artcosto "+;
		" from vitems "+;
		"where itipo=2 and artgrupo="+alup(tact)+" order by icode, iname;"
				
	return sqli(q1,'actitems')
	
else
		q1="select iditem, icode, iname, artgrupo, artsgrupo, artmarca, isiva, "+;
				"artcosto "+;
			" from items "+;
			"where itipo=2 order by icode, iname;"
			
		return sqli(q1,'actitems')
endif

*****************************************************************************************
*	Items dependiendo del tipo (1=Articulos, 2=activos Fijos, 3=Servicios)
*****************************************************************************************
function vtitems
parame tipo

if tipo>0 then
	q1="select iditem, icode, iname, isiva, artcosto "+;
		" from vitems "+;
		"where  itipo="+alup(tipo)+" order by iname,icode;"
	return sqli(q1,'vtitems')
else
	return sqli("select iditem, icode, iname, isiva, artcosto "+;
				"from items "+;
				"order by iname, icode;",'vtitems') 
endif

*****************************************************************************************
*	Datos Generales:
*****************************************************************************************
function dg
para c
local t
q1="select iddato, descripda, valorda, gtable "+;
		"from datosgen where gtag="+alup(c)+" ;"
if !sqli(q1,'resul') then
	return .f.
else
	sele resul
	t=alltrim(gtable)
	if empty(t) then
		return .f.
	endif
	
	select iddato, descripda, valorda from resul ;
		order by descripda ;
		into cursor &t
	sele resul
	use
	sele &t
	return .t.
endif

*****************************************************************************************
*	Datos Generales de una empresa
*****************************************************************************************
function dge
para c
local resul
resul=''
do case
	case c='BODE'
		resul='bodegas'

	other
		return .f.
endcase
return sqli("select iddato, descripda, valorda from datosgen where gtag="+alup(c)+;
    			   " order by descripda;",resul) 

*****************************************************************************************
*	Cuentas contables de Movimiento
*****************************************************************************************
function plancuentamov
para tip
local aux

if empty(tip) then
	aux=alup(.t.)
else
	aux='auxcode='+alup(tip)
endif

q1="SELECT distinct idplancuenta, plancod, plannivel, plantype, cuenta, "+;
		"auxcode, pdocode, plancod as codigo, isdet "+;
	"FROM vplancta "+;
	"WHERE plantype='M' and "+aux+;
		" and pdocode="+alup(iprd)+" order by plancod,cuenta;"
		
if !sqli(q1,'plancuentamov') then
	return .f.
else
	select 	idplancuenta, plancod, plannivel, plantype, isdet, ;
			iif(isnull(auxcode),' ',auxcode) as auxcode, pdocode, cuenta, codigo ;
	from	plancuentamov ;
	into 	cursor plancuentamov
 	return .t.
endif
*****************************************************************************************
*	Cuentas contables 
*****************************************************************************************
function plancuenta
para idpdox
if empty(idpdox) then
	idpdox=iprd
endif

q1="SELECT distinct idplancuenta, plancod, plannivel, plantype, "+;
			"auxcode, pdocode, cuenta, plancod as codigo, isdet "+;
			"FROM vplancta "+;
			"WHERE pdocode="+alup(idpdox)+;
			" order by plancod,cuenta;"
			
if !sqli(q1,'plancuenta') then
	return .f.
else
	select 	idplancuenta, plancod, plannivel, plantype, isdet,  ;
			iif(isnull(auxcode),' ',auxcode) as auxcode, pdocode, cuenta, codigo ;
	from	plancuenta ;
	into 	cursor plancuenta
 	return .t.
endif
*****************************************************************************************
*	Auxiliares del Plande cuenta
*****************************************************************************************
function auxplancta
para idpdoy
if empty(idpdoy) then
	idpdoy=iprd
endif

q1="select distinct plancod, nomcta as cuenta, idplancuenta, auxiliar::char(6) as auxiliar, auxname::char(60) as auxname "+;
				"from vdiario "+;
				"where not isanulado and pdocode="+alup(idpdoy)+";"
				
return sqli(q1,'auxplancta')

*****************************************************************************************
*	
*	Rubros de Documentos y de Auxiliares
*
****************************************************************************************
function rubrosda
return sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula "+;
					"from rubros where rubtype='D' or rubtype='A' "+;
					" order by rubname;",'rubrosda')

*****************************************************************************************
*	
*	Rubros dependiendo del parametro
*
****************************************************************************************
function rubros
para tr
if empty(tr) then
	return sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula, "+;
						"rubtab, isactivo, isinput, tie "+;
						"from rubros "+;
						" order by rubname;",'rubros')
else
	do case
	case tr='C'
		return sqli("select rubcode, rubname, rubtype, rubformula, isactivo, rubtab, isinput, tie "+;
							"from rubros where rubtype='C' "+;
							" order by rubname;",'rubros')
	case tr='D'
		return sqli("select rubcode, rubname, rubformula, isactivo, rubtab, isinput, tie "+;
					"from rubros "+;
					"where rubtype='D' "+;
					"order by rubname;",'rubros') 
	case tr='R'
		return sqli("select rubcode, rubname, rubformula, isactivo, rubtab, isinput, tie "+;
					"from rubros "+;
					"where rubtype='R' "+;
					"order by rubname;",'rubros') 
	case tr='DA'
		return sqli("select rubcode, rubname, rubtype, substr(rubformula,1,15)::char(15) as rubformula, "+;
							"rubtab, isactivo, isinput, tie "+;
							"from rubros "+;
							"where rubtype='D' or rubtype='A' "+;
							" order by rubname;",'rubros')
	endcase
endif

*****************************************************************************************
*	Datos principales de los documentos, identificacion del documento y numero.
*****************************************************************************************
function docu
para  d, n
return sqli("select distinct code, idsecudoc, sname, bodega, fecha, linkdoc,  montototal, "+;
	           		"ispagado, isanulado, isaccount, cliente "+;
	           		"from vdocusmall "+;
	           		"where idsecudoc="+alup(d)+" and num="+alup(n)+";",'docu')

*****************************************************************************************
*	Datos del Documento con Rubros de cancelacion y Cuentas contables
*	Parametro idsecudoc
*****************************************************************************************
function docuset
para d
q1="select distinct d.iddocu, d.items, d.bancos, d.sujetos, d.rubrol, d.ninguno, d.swiva, "+;
		"d.swdesc, d.swkar, d.lispre, d.documentos, d.pagos, t.rubcode, r.rubname, r.rubtype, "+;
		"t.idplancuenta, t.cabedeta, t.sujaux, t.isinicial, t.itunacta, d.iscero, p.auxsuj, "+;
	    "t.debehaber, g.descripda as cuenta, p.auxcode, p.plancod, t.iddocuse, d.tipliq "+;
	"from secudoc s, docuse d, ddocuse t, vplancta p, datosgen g, rubros r "+;
	"where  s.iddocu=d.iddocu and d.iddocu=t.iddocu and t.rubcode=r.rubcode and "+;
	   	"t.idplancuenta=p.idplancuenta and p.idcuenta=g.iddato and "+;
	   	"t.idplancuenta>0 and s.idsecudoc="+alup(d)+" and "+;
	   	"s.pdocode="+alup(iprd)+" and d.pdocode="+alup(iprd)+" and "+;
	   	"p.pdocode="+alup(iprd)+";"
return sqli(q1,'docuset')

*****************************************************************************************
*	Rubros de Cancelacion y del documento
*****************************************************************************************
function cobros
para c
return sqli("select distinct rubcode, valor, isupdate  "+;
	 				  "from cobros  "+;
	 				  "where code="+alup(c)+;
	 				  " order by rubcode;",'cobros')



*****************************************************************************************
*	Inserción de registro en la tabla DOCUMENTOS MULTIPLES
*	Variables nrodoc, iddocu, fecha........
*****************************************************************************************
function insertdocmul

return sqli("insert into docmul (nrodoc, iddocu, fecha, pdocode, subtotal, "+;
           "idsujeto, codusu, observac, numero, isprint, isanulado, isgenerado ) values "+;
           pal(nrodocm) + al(iddocum) + al(fecham) + al(iprd) + al(subtotalm) + al(idsujetom) + ;
           al(idu) + al(observacm) + al(numerom) + al(isprintm) + al(isanuladom) + ual(isgeneradom) )
           
*****************************************************************************************
*	Productores Empleados o Clientes de la empresa
*****************************************************************************************
function proemcli
para c
do case
	case c='C'
		return sqli("select  CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+;
						"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+;
						"scode, idsujeto "+;
						"from sujetos where iscliente "+;
						";",'sclientes')
	case c='P'
		return sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+;
						"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+;
						"scode, idsujeto "+;
						"from sujetos where isproductor "+;
						";",'sproductores')
	case c='R'
		return sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+;
						"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+;
						"scode, idsujeto "+;
						"from sujetos where isproveedor "+;
						";",'sproveedores')
	case c='E'
		return sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) "+;
						"THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+;
						"scode, idsujeto "+;
						"from sujetos where isempleado "+;
						";",'sempleados')
endcase

*****************************************************************************************
*	Sujetos
*****************************************************************************************
function fsujetos
return sqli("select CASE WHEN (char_length(btrim((sname)::text, ' '::text)) = 0) THEN substr(ssri,1,30)::char(30) ELSE substr(sname,1,30)::char(30) END AS sname, "+;
				"scode, idsujeto "+;
				"from sujetos order by sname;",'sujetos')

*****************************************************************************************
*	Cuentas Bancarias
*****************************************************************************************
function ctasban
return sqli("select c.*, substr(d.descripda,1,20)::char(20) as descripda "+;
				"from ctasban c, detagru d "+;
				"where c.idbanco=d.iddato "+;
				" order by d.descripda;",'ctasban')

*****************************************************************************************
*	Datos Generales del documento
*****************************************************************************************
function reversodoc
para tipdock
if empty(tipdock) then
	return sqli("select distinct nomdoc, iddocu, clasedoc, tipodoc, subtipodoc, dtag, "+;
				"tipo, subtipo, tipsaldo, swconta "+;
				"from reversodoc "+;
				"where pdocode="+alup(iprd)+;
				" order by nomdoc;",'reversodoc')
else
	&& las consultas puden ser:
	&&		por tipo de documento(numerico)
	&& 		por tipo de detalle	(caracter)
	do case
	case type('tipdock')='N'
		return sqli("select distinct nomdoc, iddocu, clasedoc, tipodoc, subtipodoc, dtag, "+;
					"tipo, subtipo, tipsaldo, swconta "+;
					"from reversodoc "+;
					"where pdocode="+alup(iprd)+" and clasedoc="+alup(tipdock)+;
					" order by nomdoc;",'reversodoc')
	case type('tipdock')='C'
		do case
		case tipdock='D'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and documentos"+;
						" order by nomdoc;",'reversodoc')
		case tipdock='I'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and items"+;
						" order by nomdoc;",'reversodoc')
		case tipdock='S'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and sujetos"+;
						" order by nomdoc;",'reversodoc') 
		case tipdock='B'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and bancos"+;
						" order by nomdoc;",'reversodoc') 
		case tipdock='R'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and rubrol"+;
						" order by nomdoc;",'reversodoc')
		case tipdock='P'
			return sqli("select distinct nomdoc, iddocu, tipodoc, subtipodoc, dtag, "+;
						"tipo, subtipo, tipsaldo, swconta "+;
						"from reversodoc "+;
						"where pdocode="+alup(iprd)+" and pagos"+;
						" order by nomdoc;",'reversodoc')

		endcase
	endcase
endif

*****************************************************************************************
*	secuencia de documento
*****************************************************************************************
function secudoc
para codoc, fecdoc
local l, i, h, f
l=len(alltrim(codoc))
i=0
numy=0
if empty(l) then
	return .f.
endif
*****************************************************
if !empty(fecdoc) then
	f=fecdoc
else
	f=hoy
endif
*****************************************************

idst=idws
if escaja
	q1="select idworkstation as idwork from usuarios where idsujeto="+alup(idu)
	if sqli(q1,'estrca')
		select estrca
		if reccount()=0
			return .f.
		else
			idst=estrca.idwork
		endif
	endif
endif		

q1="select distinct s.idsecudoc, s.numactual, s.serie, s.iddocu, s.swaneiva, s.ajucon, "+;
		"s.descripser, s.idautosri, s.numauto, s.fcaducidad,  s.desde, s.hasta, "+;
		"s.femision, s.activo, s.tipper, s.reinicia, s.idsecu, s.clasedoc, s.manual, "+;
		"s.lispre, s.swiva, s.swdesc, s.swkar, s.tipcosto, s.tipsaldo, s.tipitem, "+;
		"s.ivaxitem, s.swconta, s.swprint, s.swclose, s.isdevo, s.numregdet, s.tipliq, s.iscero "+;
	"from vsecudoc s, secuwork w "+;
	"where s.estado and s.idsecudoc=w.idsecudoc and s.dtag="+alup(alltrim(codoc))+;
		" and w.idworkstation="+alup(idws)+" and s.pdocode="+alup(iprd)+" ;"
		
if !sqli(q1,'secudoc') then
	return .f.
endif

****************************************************
sele secudoc
if reccount('secudoc')=0 
	wait 'El Documento no está Autorizado en este Equipo'+chr(13)+;
				'O no esta activo' wind nowait
	return .f.
endif
****************************************************
if !activo then
	=messagebox('Esta serie no esta activa, SRI',0,empresa)
	return .f.
endif
****************************************************	
if !isnull(fcaducidad) then
	if fcaducidad<hoy then
		=messagebox('El documento ha caducado, no es posible su emisión',0,empresa)
		return .f.
	endif
endif

h=iif(empty(hasta) or isnull(hasta),999999999,hasta)

if reccount('secudoc')>1 then
	if clasedoc=2 then
		sele secudoc
		go top
		locate for alltrim(descripser)=ctanums
		if !found() then
			=messagebox('Documento Bancario sin secuencia',0,empresa) 
			return .f.
		endif
		if !secudoc.manual then
			numy = iif(isnull(numactual) or empty(numactual),0,numactual)+1
		endif
		idsecudocy=idsecudoc
		tippery=tipper
		doccodey=iddocu
		return .t.
	else
		=messagebox('Escoja una de las series',0)
		SET SHADOW ON
		DEFINE POPUP GridPopup ;
			FROM MROW(), MCOL() ;
  			MARGIN ;
  			promp fiel str(iif(isnull(secudoc.serie),0,secudoc.serie))+space(3)+secudoc.descripser ;
  			SHORTCUT 
  		on selection popup gridpopup deactivate popup gridpopup
		ACTIVATE POPUP GridPopup
		i=idsecudoc
		RELEASE POPUP GridPopup
		selec * from secudoc where idsecudoc=i into cursor secudoc
	endif
endif 

sele secudoc

if !reinicia then
	if !secudoc.manual then
		numy = iif(isnull(numactual) or empty(numactual),0,numactual)+1
	endif
	
	if numy>h then
		=messagebox('Documento supera el limite de autorización',0,empresa)
		return .f.
	endif
	idsecudocy=idsecudoc
	tippery=tipper
	doccodey=iddocu
	return .t.
else
	do case
	case tipper=1
		if !sqli("select max(d.num) as numactual "+;
					"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc) "+;
					"where s.idsecu="+alup(idsecu)+" and to_char(fecha,'YYYYMM')="+;
					alup(alltrim(str(year(f)*100+month(f))))+";",'ntid') then
			return .f.
		endif
	case tipper=2
		if !sqli("select max(d.num) as numactual "+;
					"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc) "+;
					"where s.idsecu="+alup(idsecu)+" and to_char(d.fecha,'YYYY')="+;
					alup(alltrim(str(year(f))))+";",'ntid') then
			return .f.
		endif
	case tipper=3
		if !sqli("select max(d.num) as numactual "+;
					"from documents d left join vsecudoc s on (d.idsecudoc=s.idsecudoc)"+;
					"where s.idsecu="+alup(idsecu)+" and d.pdocode="+;
					alup(iprd)+";",'ntid') then
			return .f.
		endif
	other 
		=messagebox('error en secuencia del documento',0,empresa)
		return .f.
	endcase
	if !secudoc.manual then
		numy = iif(isnull(ntid.numactual),0,ntid.numactual)+1
	endif
	sele ntid
	use
	if numy>h then
		=messagebox('Documento supera el limite de autorización.... ',0,empresa)
		return .f.
	endif
	sele secudoc
	
	idsecudocy=idsecudoc
	tippery=tipper
	doccodey=iddocu
	return .t.
endif

*****************************************************************************************
*	Actualizar secuencia de documento
*****************************************************************************************
FUNCTION UPSECUDOC
PARA cdup
if !sqli("select idsecu from secudoc where idsecudoc="+alup(cdup)+";",'docuup') then
	return .f.
endif
sele docuup
if reccount('docuup')=0 then
	return .f.
endif

return sqli("update secuencias set numese = "+alup(numy)+" where idsecu = "+;
    alup(docuup.idsecu)+";")


*****************************************************************************************
*	Tipos de Documentos
*****************************************************************************************
function tiposdoc
para t
if empty(t) then
	if !sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+;
			"from vsecudoc "+;
			"where estado and pdocode="+alup(iprd)+;
			";",'tiposdoc') then
		return .f.
	endif
endif
do case
	case t='B'
		return sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+;
				"from vsecudoc "+;
				"where clasedoc=2 and estado and pdocode="+alup(iprd)+;
				";",'tiposdoc')
	case t='C'
		return sqli("select distinct nomdoc, tipodoc, tipo, iddocu "+;
				"from vsecudoc "+;
				"where clasedoc=1 and estado and pdocode="+alup(iprd)+;
				";",'tiposdoc')
endcase

*****************************************************************************************
*	Documentos y series 
*****************************************************************************************
function docseries
return sqli("select distinct idsecudoc, serie, nomdoc "+;
				"from vsecudoc "+;
				"where pdocode="+alup(iprd)+" and estado order by nomdoc,serie;",'docseries')

*****************************************************************************************
*	Documentos de un grupo, determinado por el 
*	parametro idgdoc (identificacion del grupo==>numerico)
*****************************************************************************************
function dgdoc
para codw, kard
local cfz
if type('codw')='N' then
	if !empty(codw) then
		cfz="c.idgdoc="+alup(codw)
	else 
		cfz=alup(.t.)
	endif
else
	if !empty(codw) then
		cfz="c.tag="+alup(codw)
	else 
		cfz=alup(.t.)
	endif
endif

return sqli("select distinct a.nomdoc as tipo, "+;
				"a.dtag, a.iddocu, b.iddato1, b.iddato2, a.tipsaldo "+;
				"from vsecudoc a, dgdoc b, gdoc c "+;
				"where a.dtag=b.dtag and c.idgdoc=b.idgdoc and "+;
				"a.pdocode="+alup(iprd)+" and a.estado and "+cfz+;
				" order by a.nomdoc;",'dgdoc')

*****************************************************************************************
*	Documentos con series de un grupo 
*****************************************************************************************
function dgdocs
para cod
if !empty(cod) then
	cf=alltrim(cod)
else 
	cf=''
endif
return sqli("select distinct substr(a.tipo,1,15)::char(15)||' '||substr(a.subtipo,1,25)::char(25) as tipo, "+;
				"a.serie, a.idsecudoc, a.dtag, a.iddocu, b.iddato1, b.iddato2 "+;
				"from vsecudoc a, dgdoc b, gdoc c "+;
				"where a.dtag=b.dtag "+;
				" and c.idgdoc=b.idgdoc and a.estado and "+;
				"a.pdocode="+alup(iprd)+" and c.tag="+alup(cf)+" order by tipo;",'dgdocs') 

*****************************************************************************************
*	Funcion de Control de acceso a los programas
*****************************************************************************************
function accesos
para prog
pr=upper(alltrim(prog))

if empty(pr) then
	return .f.
endif
* si tiene acceso por usuario
if !used('accesos') then
	q1="select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+;
		"from accesos a, programas p "+;
		"where p.idprograma=a.idprog and a.idsujeto="+alup(idu)+;
			" and p.estapro union "+;
				"(select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+;
				"from acceper a, programas p, usuarios u "+;
				"where p.idprograma=a.idprog and a.idperfil=u.tipou "+;
				" and p.estapro and u.idsujeto="+alup(idu)+") order by progname;"
			
	if !sqli(q1,'accesos') then
		return .f.
	endif
endif
sele accesos
if reccount()>0 then
	go top
	locate for pr$progname
	if found() then
		return .t.
	endif
endif
return .f.
*****************************************************************************************
*	Funcion de Control de acceso a los programas
*	dependiento de (actualizar, insertar, anular)
*****************************************************************************************
function accesop
para prog, oper

pr=upper(alltrim(prog))
op=upper(alltrim(oper))
if empty(pr) and empty(op) then
	return .f.
endif

*	si el periodo no esta activo no se puede realizar transaciones
if !isabierto then
	return .f.
endif

* si tiene acceso por usuario
swac=.f.
if !sqli("select a.actu, a.inser, a.anu "+;
				"from accesos a, programas p "+;
				"where p.idprograma=a.idprog and a.idsujeto="+alup(idu)+;
				" and p.progname ~~ "+alup('%'+alltrim(pr)+'%')+;
				" and p.estapro;",'numprog') then
	return .f.
else
	sele numprog
	if reccount('numprog')>0 then
		go top
		do while !eof()
			do case
				case op='M' and actu
					swac=.t.
					exit
				case op='B' and anu
					swac=.t.
					exit
				case op='A' and inser
					swac=.t.
					exit
			endcase
			skip
		enddo

	else
		use
	endif
	if swac then
		return .t.
	endif
endif
* si tiene acceso por perfil				
if !sqli("select a.actu, a.inser, a.anu "+;
				"from acceper a, programas p, usuarios u "+;
				"where p.idprograma=a.idprog and a.idperfil=u.tipou "+;
				" and p.progname ~~ "+alup('%'+alltrim(pr)+'%')+;
				" and p.estapro and u.idsujeto="+alup(idu)+";",'numprog') then
	return .f.
else
	sele numprog
	if reccount('numprog')>0 then
		go top
		do while !eof()
			do case
				case op='M' and actu
					swac=.t.
					exit
				case op='B' and anu
					swac=.t.
					exit
				case op='A' and inser
					swac=.t.
					exit
			endcase
			skip
		enddo
	endif
	use
endif
return swac

*****************************************************************************************
*	Funcion de Control de autorizaciones por perfil
*****************************************************************************************
function autper
para pcod, proceso

local swproceso, docp

*!*	pcod 	=> 	codigo de documento
*!*	proceso	=> 	1.- Autorizar
*!*				2.- Anular asiento
*!*				3.- Anular documento
*!*				4.- Consulta de documento

if empty(pcod) or empty(proceso) then
	return .f.
endif

* si tiene acceso por usuario
q1="select iddocu from vdocusmall where code="+alup(pcod)
if !sqli(q1,'docacc')
	return .f.
endif

if reccount('docacc')=0
	return .f.
endif

sele docacc
go top
docp=docacc.iddocu

if !used('accdocper') then
	q1="select distinct autori, anuasi, anutot, consul "+;
		"from accdoc a "+;
		"where idsujeto="+alup(idu)+" and iddocu="+alup(docp)+;
			" union "+;
		"(select distinct autori, anuasi, anutot, consul "+;
		"from accdocper a, usuarios u "+;
		"where a.idperfil=u.tipou and u.idsujeto="+alup(idu)+" and iddocu="+alup(docp)+") ;"
			
	if !sqli(q1,'accdocper') then
		return .f.
	endif
endif

swproceso=.f.

sele accdocper
go top
do while !eof()
	do case
	case proceso=1
		if autori
			swproceso=.t.
			exit
		endif
	case proceso=2
		if anuasi
			swproceso=.t.
			exit
		endif
	case proceso=3
		if anutot
			swproceso=.t.
			exit
		endif
	case proceso=4
		if consul
			swproceso=.t.
			exit
		endif
	endcase
	sele accdocper
	skip
enddo

if swproceso
	return .t.
else
	return .f.
endif


*****************************************************************************************
*	Funcion obtencion de datos del embarque
*****************************************************************************************
function embarques

return sqli("select embcode, numero,embnumsem, barco, embfecha, embfliquida, marcaja, "+;
				"tipocaja, embcotiza, embcosto, embfob, dcltmpqty, dcldefqty, embcomdesc, "+;
				"embnumcaja, embpesoneto as pesoneto, embpesobruto, embnumforexp, puertollegada as ptolle, "+;
				"pais, puertosalida as ptosal "+;
				"from vembarques "+;
				"where substr(embnota,1,9)<>'NO VALIDO' and pdocode="+alup(iprd)+;
				" order by embnumsem desc;",'embarques')

*****************************************************************************************
*	Obtencion de campos de los documentos
*****************************************************************************************
function rubrosdoc
para tiprub
do case 
case empty(tiprub)
 	return sqli("select rubcode, rubname, rubformula, rubtype from rubros "+;
 				"where rubtype='D';",'rubros') 
case tiprub='C'
 	return sqli("select rubcode, rubname, rubformula, rubtype from rubros "+;
 				"where rubtype='C';",'rubros') 
case tiprub='D'	
 	return sqli("select rubcode, rubname, rubformula, rubtype from rubros "+;
 				"where rubtype='D';",'rubros')
case tiprub='A'	
 	return sqli("select rubcode, rubname, rubformula, rubtype from rubros "+;
 				"where and rubtype='A';",'rubros') 
endcase

*****************************************************************************************
*	tabla de datos del SRI
*****************************************************************************************
function sritabla
para arg
do case
case arg='PEIN'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='PERIODO INFORMADO' "+;
					"order by codigo;",'perinf')
case arg='SETR'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='SECUENCIAL DE TRANSACCIONES' "+;
					"order by codigo;",'sectra') 
case arg='TICO'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='TIPO DE COMPROBANTE' "+;
					"order by codigo;",'tipcom') 
case arg='CRTR'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='CREDITO TRIBUTARIO' "+;
					"order by codigo;",'cretri')
case arg='POIV'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='PORCENTAJES DE IVA' "+;
					"order by codigo;",'poriva')
case arg='REIV'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='PORCENTAJE DE RETENCION DE IVA' "+;
					"order by codigo;",'retiva')
case arg='POIC'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='PORCENTAJES DE ICE' "+;
					"order by codigo;",'porice')
case arg='BANC'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='BANCOS' "+;
					"order by codigo;",'bancos') 
case arg='PROV'
	return sqli("select * "+;
					"from vsritabla "+;
					"where trim(both ' ' from tabla)='PROVINCIAS' "+;
					"order by codigo;",'provincias') 
case arg='CAIR'
	return sqli("select * "+;
					"from vsritabla "+;
					"where substr(trim(both ' ' from tabla),1,35)=substr('CODIGO RETENCION FUENTE',1,35) "+;
					"order by codigo;",'codair')
other
	return .f.
endcase


*****************************************************************************************
*	Cuentas contables asigandas a los documentos
*****************************************************************************************
function ctascondoc

q1="select p.idplancuenta, p.cuenta, p.plancod, p.plannivel, p.auxcode, t.iddocu "+;
	"from vplancta p, ddocuse t "+;
	"where p.pdocode="+alup(iprd)+" and t.idplancuenta=p.idplancuenta "+;
		" order by iddocu;"
				
if !sqli(q1,'ctascondoc') then
	return .f.
else
	select idplancuenta, cuenta, iddocu, auxcode, plancod  ;
	from ctascondoc ;
	into cursor ctascondoc
	return .t.
endif

*****************************************************************************************
*	Grupos de Documentos
*****************************************************************************************
function gdoc
return sqli("select distinct descrip, tag, visilis, impresion, idgdoc "+;
			"from gdoc "+;
			" order by descrip;",'gdoc')
			
*****************************************************************************************
*	Variables por empresa
*****************************************************************************************
function tambiempre
return sqli("select fecini, fecfin, isupdate, isopen, openx, actual, pdocode, moneda, "+;
				"nivelplan "+;
				"from ambiempre "+;
				" order by fecini;",'tambiempre') 

*****************************************************************************************
*	Determina si el documento acepta los datos de anexos de iva
*	retorno logico
*****************************************************************************************
function insaneiva
para codanei
	if !sqli("select distinct code "+;
	           	"from aneiva "+;
	           	"where code="+alup(codanei)+";",'aneiva') then
	   return .f.
	endif
	sele aneiva
	if reccount('aneiva')>0 then
		use	
		wait 'Ya tiene registrado anexo de iva' wind nowait
		return .f.
	endif
	use
	if !sqli("select distinct swaneiva, isanulado "+;
	           	"from vdocusmall "+;
	           	"where code="+alup(codanei)+";",'swanei') then
	   return .f.
	endif
	sele swanei
	if reccount('swanei')= 0 then
		wait 'No existe Documento' wind nowait
		sele swanei
		use
		return .f.
	endif
	if isanulado then
		wait 'Documento ANULADO' wind nowait
		sele swanei
		use
		return .f.
	endif
	if !swaneiva then
		wait 'Documento No acepta datos Anexos de Iva' wind nowait
		sele swanei
		use
		return .f.
	endif
	sele swanei
	use
	return .t.
	
*****************************************************************************************
*	Autorizaciones de SRI
*****************************************************************************************
function autorizaciones
return sqli("select distinct * from autosri where activo ;",'autosri') 

*****************************************************************************************
*	Definicion de campos de una tabla
*****************************************************************************************
function defcampost
param namet
local c, d, n, i, j, k, n, f, estruc, t
f=''
d=nomunico()
dimension estruc (2,2)

* Estructura de la tabla, Valores por defecto en adsrc
*!*	if !sqli("select a.attname, t.typname, d.adsrc "+;
*!*				"from pg_class c left join pg_attribute a on (c.relfilenode=a.attrelid ) "+;
*!*				"left join pg_type t on (a.atttypid = t.typelem) "+;
*!*				"left join pg_attrdef d on (d.adnum=a.attnum and d.adrelid=c.relfilenode) "+;
*!*				"where  c.relname="+alup(namet)+" and attnum>0;",d)  then
*!*		do regerrbd
*!*		return .f.
*!*	endif

* Estructura de la tabla, Valores por defecto en adsrc
if !sqli("select * from "+namet+" where 'f';",d) then
	return .f.
endif

sele &d
n=afields(estruc)
i=alen(estruc,1)
for j=1 to i
	f='public '+estruc(j,1)
	t=type(estruc(j,1))
	&f
	do case
	case t='C'
		f= estruc(j,1)+"=''"
	case t='N'
		f= estruc(j,1)+"=0"
	case t='D'
		f= estruc(j,1)+"={}"
	case t='T'
		f= estruc(j,1)+"=DTOT({})"
	case t='L'
		f= estruc(j,1)+"=.f."
	case t='O'
		f= estruc(j,1)+"=''"
	other 
		f= estruc(j,1)+"=NULL"
	endcase
	&f

endfor
use
return .t.

*****************************************************************************************
*	Frase de Insercion en una tabla, con la clave primaria de tipo serial
*	Los campos de la tabla deben ser variables definidas.
*****************************************************************************************
function instabla
para namet,pkt

if empty(namet) or empty(pkt) then
	return .f.
endif
local d,i,j,k,n,c,f,estruc
f=''
pkt=upper(pkt)
d=nomunico()
dimension estruc (2,2)

if !sqli("select * from "+namet+" where 'f';",d) then
	return .f.
endif

n=afields(estruc)
use
i=alen(estruc,1)
f='insert into '+namet+' ('
for j=1 to i
	if i=j then
		if pkt=estruc(j,1) then
			f=substr(f,1,len(f)-2)
			f=f+') values '
		else
			f=f+estruc(j,1)+') values '
		endif
	else
		if pkt!=estruc(j,1) then
			f=f+estruc(j,1)+', '
		endif	
	endif
endfor
k=1
i=alen(estruc,1)
for k=1 to i
	if k=1 then
		if pkt=estruc(k,1) then
			f=f+'('
		else
			f=f+'('+alup(&estruc(k,1))+', '
		endif
	else
		if k=i then
			if pkt=estruc(k,1) then
				f=substr(f,1,len(f)-2)
				f=f+') '
			else	
				f=f+alup(&estruc(k,1))+') '
			endif
		else
			if pkt!=estruc(k,1) then
				f=f+alup(&estruc(k,1))+', '
			endif
		endif
	endif
endfor

f=alltrim(f)+';'
if !sqli(f) then
 	return .f.
else
	wait 'Resgritrado' wind nowait
	return .t.
endif
*****************************************************************************************
*	Frase de Insercion en una tabla, con la clave primaria incluida en la clave
*	Los campos de la tabla deben ser variables definidas.
*****************************************************************************************
function instablack
para namet,pkt

if empty(namet) or empty(pkt) then
	return .f.
endif

local d,i,j,k,n,c,f,estruc
f=''
pkt=upper(pkt)
d=nomunico()
dimension estruc (2,2)
if !sqli("select * from "+namet+" where 'f';",d) then
	return .f.
endif

n=afields(estruc)
use
i=alen(estruc,1)
f='insert into '+namet+' ('
for j=1 to i
	if i=j then
		f=f+estruc(j,1)+') values '
	else
		f=f+estruc(j,1)+', '
	endif
endfor
k=1
i=alen(estruc,1)
for k=1 to i
	if k=1 then
		f=f+'('+alup(&estruc(k,1))+', '
	else
		if k=i then
			f=f+alup(&estruc(k,1))+') '
		else
			f=f+alup(&estruc(k,1))+', '
		endif
	endif
endfor

f=alltrim(f)+';'
if !sqli(f) then
	return .f.
else
	wait 'Resgritrado' wind nowait
	return .t.
endif

*****************************************************************************************
*	Frase de Actualizacion de registro en una tabla
*	Los campos de la tabla deben ser variables definidas.
*****************************************************************************************
function modtabla
para namet,idtabla
local d,i,j,k,n,c,f,estruc

if empty(namet) or empty(idtabla) then
	return .f.
endif
f=''
idtabla=upper(idtabla)
dimension estruc (2,2)
d=nomunico()

if !sqli("select * from "+namet+" where 'f';",d) then
	return .f.
endif 

n=afields(estruc)
use
i=alen(estruc,1)
f='update '+namet+' set '
for j=1 to i
	if estruc(j,1)!=idtabla then
		f=f+estruc(j,1)+'='+alup(&estruc(j,1))+', '
	endif
endfor
f= alltrim(f)
n=len(f)
if substr(f,n,1)=',' then
	f=substr(f,1,n-1)
endif
f=f+' where '+idtabla+'='+alup(&idtabla)+';'
if !sqli("begin;") then
	return .f.
endif
x=0
if !sqli(alltrim(f)) then
	x=1
endif
do fintrans
return iif(x=1,.f.,.t.)

*****************************************************************************************
*	Frase de eliminacion de un registro en una tabla
*	Los campos de la tabla deben ser variables definidas.
*****************************************************************************************
function elitabla
para namet,idtabla
local f

if empty(namet) or empty(idtabla) then
	return .f.
endif

f=''
f='delete from '+namet+' where '+idtabla+'='+alup(&idtabla)+';'

if !sqli("begin;") then
	return .f.
endif
x=0
if !sqli(alltrim(f)) then
	x=1
endif
do fintrans
return iif(x=1,.f.,.t.)

*****************************************************************************************
*	Actualizacion de los costos de articulos
*	Parametro el Codigo del documento origen
*****************************************************************************************
function actcosart
parame ncod
local pdoc, b, bi, s, td, ci, qi, idit, icosto, iqty


*	Determinar si interviene en el Kardex

q1="select distinct tipsaldo, userstore, swkar, istransfer, fecha, isdevo, swconta, isaccount, "+;
		"isanulado, idsecudoc "+;
	"from vdocusmall "+;
	"where code="+alup(ncod)+" and iddocu in "+;
		"(select distinct d.iddocu "+;
		" from gdoc g, dgdoc t, docuse d "+;   
		" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "
				
if !sqli(q1,'typsaldo') then
	return .f.
endif
sele typsaldo
if reccount()=0 then
	return .t.
endif

*!*	if isanulado
*!*		return .t.
*!*	endif

if !swkar then
	return .t.
endif

if swconta 
	if !isaccount
		return .t.
	endif
endif

* Items
q1="select iditem, iname, icode "+;
	"from items "+;
	"where itipo=1 and iditem in "+;
			"(select iditem from detadoci where code="+alup(ncod)+") ;"
if !sqli(q1,'items') then
	return
endif

sele items 
go top
do while !eof()
	wait 'Procesando '+alltrim(iname) wind nowait
	
	iqty=saldoitem(items.iditem,hoy,)
	icosto=costofec(items.iditem,hoy)
	
	if icosto>0
		q1="update items set saldocon="+alup(iqty)+", "+;
				"artcosto="+alup(icosto)+;
			" where iditem="+alup(items.iditem)+";"
	else
		q1="update items set saldocon="+alup(iqty)+;
			" where iditem="+alup(items.iditem)+";"
	endif
	=sqli(q1)

	sele items
	skip
enddo

q1="select max(fecha) as fecha, max(code) as code "+;
	"from documents "+;
	"where idsecudoc="+alup(typsaldo.idsecudoc)+" and isaccount and not isanulado"

if sqli(q1,'ultdoc')
	if typsaldo.fecha<>ultdoc.fecha
		return .t.
	endif
endif

* Actualizar costo proveedor adquisiciones
q1="select iditem, (punitario - descuento/qty) as punitario "+;
	"from detadoci t left join vdocusmall d on (t.code=d.code) "+;
	"where isaccount and not isanulado and d.code="+alup(ncod)+" and d.iddocu in "+;
		"(select distinct d.iddocu "+;
		" from gdoc g, dgdoc t, docuse d "+;   
		" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "
		
if sqli(q1,'ultcosite') then
	sele ultcosite
	go top
	do while !eof()
		q1="update items set costopro="+alup(punitario)+;
			" where iditem="+alup(iditem)+";"
						
		=sqli(q1)
		sele ultcosite
		skip
	enddo
endif

wait clear
return x!=1 

*****************************************************************************************
*	Costos de articulos en una fecha determinada
*****************************************************************************************
function costofec
parame i, f

local pdoc, b, bi, s, td, ci, qi, idit, fec, ffi
idit=i
fec=f

if isnull(fec) or empty(fec)
	fec=hoy
endif

if isnull(idit) or empty(idit) 
	return 0
endif

* Items
q1="select iditem, iname, icode, artcosto, costopro "+;
	"from items "+;
	"where itipo=1 and iditem="+alup(idit)
	
if !sqli(q1,'itemst') then
	return
endif

if reccount('itemst')=0
	return 0
endif

go top

*!*	if fec=hoy
*!*		if iif(artcosto>0,round(artcosto,6),round(costopro,6))>0
*!*			return iif(artcosto>0,round(artcosto,6),round(costopro,6))
*!*		endif
*!*	endif

q1="select max(fecsaldo) as fecsaldo "+;
	"from saldosi "+;
	"where fecsaldo<"+alup(fec)+" and iditem="+alup(idit)

ffi=finip		
if sqli(q1,'fmaxsal')
	if reccount('fmaxsal')<>0
		ffi=iif(isnull(fmaxsal.fecsaldo) or empty(fmaxsal.fecsaldo),ffi,fmaxsal.fecsaldo)
	endif
endif
*wait 'Ult. fec Saldo '+devfeclet(ffi) wind nowait

**
* Saldos Iniciales en todas las bodegas
q1="select iditem, sum(qtyini) as inicial, precio "+;
	"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+;
	"where fecsaldo="+alup(ffi)+" and iditem ="+alup(idit)+ ;
	" group by iditem, precio;"
if !sqli(q1,'saldosit') then
	return
endif

* Calculo de Ingresos y Egresos en este periodo
q1="select iditem, qty, tipsaldo, artcosto, descuento, fecha, isdevo "+;
	"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
	"where not istransfer and swkar and fecha>"+alup(ffi)+" and fecha<="+alup(fec)+;
		" and "+fcont+" and not isanulado and iditem="+alup(idit)+;
				" order by iditem, fecha, tipsaldo desc ;"
if !sqli(q1,'movit') then
	return
endif

sele itemst
go top

idit=itemst.iditem

sele saldosit
go top
locate for iditem=idit
if found()
	ci=iif(isnull(precio),0,precio)
	qi=iif(isnull(inicial),0,inicial)
else
	ci=0
	qi=0
endif

sele movit
go top

swc=.t.
do while !eof() and swc and movit.iditem=idit
	if tipsaldo=1  	&& 	Egreso
		if qi>0	and qi-qty>=0 && Debe existir saldo
			qi=qi-qty
		endif
	else			&&	Ingresos
		if !isdevo
			ci=iif((qi+qty)>0,(qi*ci+(qty*artcosto-iif(isdevo,0,descuento)))/(qi+qty),ci)
			qi=qi+qty
		endif
	endif
	sele movit
	skip
enddo

return iif(ci>0,round(ci,6),0)


*****************************************************************************************
*	Costos de articulos en una fecha determinada
*****************************************************************************************
function cosprofec
parame i, f

local pdoc, b, bi, s, td, ci, qi, idit, fec, ffi
idit=i
fec=f

if isnull(fec) or empty(fec)
	fec=hoy
endif

if isnull(idit) or empty(idit) 
	return 0
endif

* Items
q1="select iditem, iname, icode, artcosto, costopro "+;
	"from items "+;
	"where itipo=1 and iditem="+alup(idit)
	
if !sqli(q1,'itemst') then
	return
endif

if reccount('itemst')=0
	return 0
endif

go top

* ultimo costo de proveedor
q1="select iditem, punitario - descuento/qty as punitario, max(fecha) as fecha "+;
	"from detadoci t left join vdocusmall d on (t.code=d.code) "+;
	"where iditem="+alup(idit)+" and fecha<="+alup(fec)+" and isaccount and not isanulado "+;
		" and d.iddocu in "+;
		"(select distinct d.iddocu "+;
		" from gdoc g, dgdoc t, docuse d "+;   
		" where g.tag='ADQING' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+;
	" group by iditem, 2 "+;
	" order by 3 desc, 2 desc "+;
	" limit 1 " 
		
if sqli(q1,'ultcosite') then

	if reccount('ultcosite')=0

		q1="select max(fecsaldo) as fecsaldo "+;
			"from saldosi "+;
			"where fecsaldo<"+alup(fec)+" and iditem="+alup(idit)

		ffi=finip		
		if sqli(q1,'fmaxsal')
			if reccount('fmaxsal')<>0
				ffi=iif(isnull(fmaxsal.fecsaldo) or empty(fmaxsal.fecsaldo),ffi,fmaxsal.fecsaldo)
			endif
		endif
		*wait 'Ult. fec Saldo '+devfeclet(ffi) wind nowait

		**
		* Ultimo costo de proveedor conocido
		q1="select iditem, cospro  "+;
			"from saldosi s  "+;
			"where fecsaldo="+alup(ffi)+" and iditem ="+alup(idit)
			
		=sqli(q1,'saldosit')
		
		if reccount('saldosit')=0
			return itemst.costopro
		else
			return saldosit.cospro
		endif
	else
		go top
		return ultcosite.punitario
	endif
else	
	return itemst.costopro	
endif

*****************************************************************************************
*	Costos de articulos en una fecha determinada
*****************************************************************************************
function cosfecini
parame i, f

local pdoc, b, bi, s, td, ci, qi, idit, fec
idit=i
fec=f

if isnull(fec) or empty(fec)
	fec=hoy
endif

if isnull(idit) or empty(idit) 
	return 0
endif

* Items
q1="select iditem, iname, icode, artcosto, costopro "+;
	"from items "+;
	"where itipo=1 and iditem="+alup(idit)
	
if !sqli(q1,'itemst') then
	return
endif

if reccount('itemst')=0
	return 0
endif

go top

if fec=hoy
	if iif(artcosto>0,round(artcosto,6),round(costopro,6))>0
		return iif(artcosto>0,round(artcosto,6),round(costopro,6))
	endif
endif

**
* Saldos Iniciales en todas las bodegas
q1="select iditem, sum(qtyini) as inicial, precio "+;
	"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+;
	"where fecsaldo="+alup(finip)+" and iditem ="+alup(idit)+ ;
	" group by iditem, precio;"
if !sqli(q1,'saldosit') then
	return
endif

* Calculo de Ingresos y Egresos en este periodo
q1="select iditem, qty, tipsaldo, artcosto, descuento, fecha, isdevo "+;
	"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
	"where swkar and pdocode="+alup(iprd)+" and fecha<="+alup(fec)+;
		" and "+fcont+" and not isanulado and iditem="+alup(idit)+;
				" order by iditem, fecha, tipsaldo desc ;"
if !sqli(q1,'movit') then
	return
endif

sele itemst
go top

idit=itemst.iditem

sele saldosit
go top
locate for iditem=idit
if found()
	ci=iif(isnull(precio),0,precio)
	qi=iif(isnull(inicial),0,inicial)
else
	ci=0
	qi=0
endif

sele movit
go top

swc=.t.
do while !eof() and swc and movit.iditem=idit
	if tipsaldo=1  	&& 	Egreso
		if qi>0	and qi-qty>=0 && Debe existir saldo
			qi=qi-qty
		endif
	else			&&	Ingresos
		if !isdevo
			ci=iif((qi+qty)>0,(qi*ci+(qty*artcosto-iif(isdevo,0,descuento)))/(qi+qty),ci)
			qi=qi+qty
		endif
	endif
	sele movit
	skip
enddo

return iif(ci>0,round(ci,6),0)

*****************************************************************************************
*	Imprimir un documento
*****************************************************************************************
function impdoc
para kcode, pimp
local i, j, fc1, fc2, fc3, fc4, fc5, fc6, fc7, fc8, fc9, fc10, fc11, fc12, fc13, fc14, fc15, fc16, fc17, fc18, fc19, fc20,;
			vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13, vc14, vc15, vc16, vc17, vc18, vc19, vc20
i=0
store '' 	to fc1, fc2, fc3, fc4, fc5, fc6, fc7, fc8, fc9, fc10, fc11, fc12, fc13, fc14, fc15, fc16, fc17, fc18, fc19, fc20
store 0.00 	to vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13, vc14, vc15, vc16, vc17, vc18, vc19, vc20


select 0
if !sqli("SELECT DISTINCT  idugra, fecgra, code, usercaja, userstore, num, idsecudoc, "+;
		" cliente, fecha, pdocode, ffrom, fto, seller, casher, linkdoc, sujter, duracion, "+;
		" valcuota, numcuota, poriva, descuconiva, descusiniva, recargo, recargo2, recargo3, "+;
		" flete, subconiva, tipitem, chofer, chname, chcedula, chruc, nrec, comenanu, "+;
		" subsiniva, subtotal, ivavalor, ivabienes, icevalor, ipsvalor, montototal, saldo, tmpsaldo, "+;
		" isguia, isupdate, islock, isprint, isaccount, ispagado, isanulado, isautorizado, impresora, "+;
 		" isreversado, concepto, feccon, bodega, tipsaldo, iddocu, nomdoc,  dtag, swaneiva, tipnum, "+;
 		" swkar, swconta, idsritabla, ajucon, serie, numauto, fcaducidad, scel, stelf, proceso, "+;
 		" saddr, saddr2, scode, ssri, sname, sruc, scedula, sciudad, ciudad2, spasaporte, vendedor, "+;
 		" nombreu, observ, moneda, idws, reporte, cretri, cajero, codter, nombret, isdevo, sforpag, "+;
 		" istransfer, documentos, recaudador, idprin, idgar, provincia, parroquia, sector, calific, "+;
 		" srepre, hacienda "+;
		"FROM vdocuments d "+;
		"where d.code="+alup(kcode)+";",'documents') then
	return .f.
endif

if saddr<>saddr2 and saddr>' ' and saddr2>' '
	q1="select distinct d.iddocu from gdoc g, dgdoc t, docuse d "+;   
		" where g.tag='IMDIAL' and g.idgdoc=t.idgdoc and t.dtag=d.dtag "
	if sqli(q1,'impdiralt')
		sele impdiralt
		go top
		locate for impdiralt.iddocu=documents.iddocu
		if found()
			select saddr, sciudad from documents ;
			union ;
			select saddr2 as saddr, ciudad2 as sciudad from documents ;
			into cursor direccion
			sele direccion
			
			=messagebox('Escoja la direccion de impresion',0)
			SET SHADOW ON
			DEFINE POPUP GridPopup2 ;
				FROM MROW(), MCOL() ;
	  			MARGIN ;
	  			promp fiel alltrim(direccion.saddr)+' - '+alltrim(iif(isnull(direccion.sciudad),' ',direccion.sciudad)) ;
	  			SHORTCUT 
	  		on selection popup gridpopup2 deactivate popup gridpopup2
			ACTIVATE POPUP GridPopup2
			dir=direccion.saddr
			ciu=alltrim(iif(isnull(direccion.sciudad),' ',direccion.sciudad))
			
			RELEASE POPUP GridPopup2
		
			SELECT DISTINCT  idugra, fecgra, code, usercaja, userstore, num, idsecudoc, ;
			 cliente, fecha, pdocode, ffrom, fto, seller, casher, linkdoc, sujter, duracion, ;
			 valcuota, numcuota, poriva, descuconiva, descusiniva, recargo, recargo2, recargo3, ;
			 flete, subconiva, tipitem, chofer, chname, chcedula, chruc, nrec, comenanu, ;
			 subsiniva, subtotal, ivavalor, ivabienes, icevalor, ipsvalor, montototal, saldo, tmpsaldo, ;
			 isguia, isupdate, islock, isprint, isaccount, ispagado, isanulado, isautorizado, ;
	 		 isreversado, concepto, feccon, bodega, tipsaldo, iddocu, nomdoc, proceso, impresora, ;
	 		 dtag, swaneiva, tipnum, swkar, swconta, idsritabla, ajucon, serie, numauto, fcaducidad, scel, stelf, ;
	 		 dir as saddr, saddr2, scode, ssri, sname, sruc, scedula, ciu as sciudad, spasaporte, vendedor, ;
	 		 nombreu, observ, moneda, idws, reporte, cretri, cajero, sforpag, ;
	 		 codter, nombret, isdevo, istransfer, documentos, calific, srepre,  ;
	 		 recaudador, idprin, idgar, provincia, parroquia, sector, hacienda ;
			FROM documents	;
			into cursor documents
		endif
	else
		return .f.
	endif
endif

sele documents
if reccount()=0 then
	return .f.
endif

q1="select r.rubname, c.valor "+;
	"from cobros c, rubros r "+;
	"where c.rubcode=r.rubcode and code="+alup(kcode)+" and tipo='C';"

j=1
	
if sqli(q1,'tmpcan') then		
	sele tmpcan
	go top
	j=1
	scan
		f='fc'+alltrim(str(j))+'=rubname'
		&f
		f='vc'+alltrim(str(j))+'=valor'
		&f
		j=j+1
		if j>10
			exit
		endif
	endscan
endif	

q1="select distinct c.fecheque, b.descripda as banco, c.numcta, c.isefectivo, c.observa, "+;
		"c.numche, c.valor, c.fecdepo, t.numero, t.banco as bandep "+;
	"from cheques c left join detagru b on (c.banco=b.iddato) "+;
				"   left join vctasb t on (c.ctaban=t.idcuenta) "+;
	"where c.code="+alup(kcode)+;
	" order by c.fecheque;"		

	
if sqli(q1,'tmpche') then		
	sele tmpche
	go top
	j=11
	scan
		f='fc'+alltrim(str(j))+"=alltrim(banco)+' / Cta:'+alltrim(numcta)+' / Num.Ch:'+alltrim(str(numche))+' / Fec.Ch:'+devfeclet(fecheque,4)"
		&f
		f='vc'+alltrim(str(j))+'=valor'
		&f
		j=j+1
		if j>20
			exit
		endif
	endscan
endif


q1="select distinct c.nucuban, d.descripda, b.nudocban, b.fecdoc, b.punitario as cvaldo, "+;
		"b.isconfbanc as iscobrado, 'f'::bool "+;
	"from ctasban c, detadocb b, detagru d	"+;
	"where c.idcuenta=b.idcuenta and c.idbanco=d.iddato and not b.isanulado "+;
              " and b.code="+alup(kcode)+";"
	
if sqli(q1,'tmpdb') then		
	sele tmpdb
	go top
	scan
		f='fc'+alltrim(str(j))+"=alltrim(descripda)+' / Cta:'+alltrim(nucuban)+' / Num.doc:'+alltrim(str(nudocban))+' / Fec.doc:'+devfeclet(fecdoc,4)"
		&f
		f='vc'+alltrim(str(j))+'=cvaldo'
		&f
		j=j+1
		if j>20
			exit
		endif
	endscan
endif

sele documents
	
*!*	if swconta
*!*		if !(like('*FACTURA*',nomdoc) or like('*NOTA*VENTA*',nomdoc))
*!*			if !isaccount
*!*				wait 'No ha sido contabilizado' wind nowait
*!*				return .f.
*!*			endif
*!*		endif
*!*	endif	
*!*		
if linkdoc>0 then
	q1="SELECT nomdoc as nomlink, fecha as feclink, code as codelink, num as numlink, serie as serielink "+;
			 "FROM vdocusmall "+;
			 "where code="+alup(linkdoc)+";"
			 
	if !sqli(q1,'linky') then
		return .f.
	else
		select d.*, l.*, fc1 as fc1, fc2 as fc2, fc3 as fc3, fc4 as fc4, fc5  as fc5, ;
						 fc6 as fc6, fc7 as fc7, fc8 as fc8, fc9 as fc9, fc10 as fc10, ;
						 fc11 as fc11, fc12 as fc12, fc13 as fc13, fc14 as fc14, fc15 as fc15,  ;
						 fc16 as fc16, fc17 as fc17, fc18 as fc18, fc19 as fc19, fc20 as fc20, ;
						 vc1 as vc1, vc2 as vc2, vc3 as vc3, vc4 as vc4, vc5  as vc5, ;
						 vc6 as vc6, vc7 as vc7, vc8 as vc8, vc9 as vc9, vc10 as vc10, ;
						 vc11 as vc11, vc12 as vc12, vc13 as vc13, vc14 as vc14, vc15 as vc15,  ;
						 vc16 as vc16, vc17 as vc17, vc18 as vc18, vc19 as vc19, vc20 as vc20 ;
		from documents d, linky l ;
		where d.linkdoc=l.codelink ;
		into cursor documents
	endif
else
		select d.*, '' as nomlink, {} as feclink, 0 as codelink, 0 as numlink, 0 as serielink, ;
				  		 fc1 as fc1, fc2 as fc2, fc3 as fc3, fc4 as fc4, fc5  as fc5, ;
						 fc6 as fc6, fc7 as fc7, fc8 as fc8, fc9 as fc9, fc10 as fc10, ;
						 fc11 as fc11, fc12 as fc12, fc13 as fc13, fc14 as fc14, fc15 as fc15,  ;
						 fc16 as fc16, fc17 as fc17, fc18 as fc18, fc19 as fc19, fc20 as fc20, ;
						 vc1 as vc1, vc2 as vc2, vc3 as vc3, vc4 as vc4, vc5  as vc5, ;
						 vc6 as vc6, vc7 as vc7, vc8 as vc8, vc9 as vc9, vc10 as vc10, ;
						 vc11 as vc11, vc12 as vc12, vc13 as vc13, vc14 as vc14, vc15 as vc15,  ;
					   	 vc16 as vc16, vc17 as vc17, vc18 as vc18, vc19 as vc19, vc20 as vc20 ;
		from documents d ;
		into cursor documents
endif

if !sqli("select distinct d.items, d.bancos, d.sujetos, d.rubrol, d.ninguno, "+;
				"d.documentos, d.pagos, d.dtag "+;
	     "from secudoc s, docuse d "+;
	          	"where s.iddocu=d.iddocu and s.idsecudoc="+alup(idsecudoc)+";",'docuset') then
	return .f.
endif
sele docuset


* seleccionar el detalle dependiendo del tipo
do case
	case items
		if !sqli("select * from vdocui where code="+alup(kcode)+";",'docitems') then
			return .f.
		endif
		nitem=reccount('docitems')	
		
		*select qty*artpeso as pesototgr from docitems into cursor calpes
		*pesotot=calpes.pesototgr
		
		pesotot=0
			
		sele d.*,  i.icode, i.iname, i.marca, i.grupo, i.genero, i.itag, i.itipo, i.auxiliar, i.auxcon, fecven, ;
			i.punitario as punitario, i.unidad, i.unidad2, i.qty, i.qtyactivo, i.isiva, i.descuento, i.pordes, ;
			i.qtypromo, pvp, valconiva, pesotot as pesotot, factorc, numeconver, denoconver, i.ubipro, ;
			nitem as nitem ;
			from documents d left join docitems i on (d.code=i.code) ;
			order by i.iname ;
			into cursor documents
		sele docitems
		use	
		
		sele documents
		if proceso
			go top
			varep=documents.reporte
			do &varep
		else
			swipd=ireport(iif(empty(reporte) or isnull(reporte),'docuitems',reporte),,'documents',.t.)
		endif
	
		sele documents
		use
	case bancos
		if !sqli("select * from vdocub where not isanulado and code="+alup(kcode)+";",'docbancos') then
			return .f.
		endif
		sele d.*,  b.nucuban, b.ticuban, b.banco, b.idcuenta, b.nudocban, b.cbenef, b.cconce, ;
			b.fecdoc, b.punitario, b.qty, b.docanulado, b.isconfbanc, b.isprotesto, b.isconciliado, ;
			b.isprintb, b.fecpag, b.secuencia, d.dtag  ;
			from documents d left join docbancos b on (d.code=b.code) ;
			into cursor documents
		sele docbancos
		use	
		sele documents
		=ireport(iif(empty(reporte) or isnull(reporte),'docubancos',reporte),,'documents')
		sele documents
		use
	case sujetos 
		if !sqli("select * from vdocus where code="+alup(kcode)+";",'docsujetos') then
			return .f.
		endif
		sele d.*,  s.snamed, s.scode as codigo, s.punitario, s.qty  ;
			from documents d left join docsujetos s on (d.code=s.code) ;
			order by s.snamed ;
			into cursor documents 

		sele documents
		=ireport(iif(empty(reporte) or isnull(reporte),'docusujetos',reporte),,'documents')
		sele documents
		use
	case pagos 
		if !sqli("select * from vdocup where code="+alup(kcode)+";",'docpagos') then
			return .f.
		endif
		sele d.*, saldoant, plancod, nomdocd, coded, numd, valort, fecultpag  ;
			from documents d left join docpagos s on (d.code=s.code) ;
			into cursor documents
		sele documents
		=ireport(iif(empty(reporte) or isnull(reporte),'docupag',reporte),,'documents')
		sele documents
		use

	case documentos
		q1="select d.code, coded, saldoant, valort, tipoie, nomdoc, num as numd, rubname, a.numsecue2, "+;
					"numcuota as numcuotad, valcuota as valcuotad, concepto as conceptod "+;
				 "from vdocud d left join aneiva a on (d.coded=a.code) "+;
				 "where d.code="+alup(kcode)+;
				 "union "+;
				 "select p.code, s.code as coded, p.saldoant, p.valort, ' ' as tipoie, referencia as nomdoc, 0 as numd, "+;
				 	" 'Sal.Inic.'||s.plancod as rubname, 0 as numsecue2, 0 as numcuotad, cuota as valcuotad, "+;
				 	"referencia as conceptod "+;
				 " from detadocp p left join vsaldosci s on (p.idsaldosci=s.idsaldosci) "+;
				 " where p.code="+alup(kcode)
				 
		if !sqli(q1,'docdocu') then
			return .f.
		endif

		sele d.*,  t.coded, t.saldoant, t.valort, t.tipoie, t.numd, t.nomdoc as documentod, rubname, numsecue2  ;
			from documents d left join docdocu t on (d.code=t.code) ;
			order by t.tipoie desc;
			into cursor documents
		sele docdocu

		use	
		sele documents
		=ireport(iif(empty(reporte) or isnull(reporte),'docudoc',reporte),,'documents')
		sele documents
		use
	
	case rubrol
		if !sqli("select * from vdocul where code="+alup(kcode)+";",'docrol') then
			return .f.
		endif
	
		sele d.*,  r.rubtab, r.rubname, r.valor, r.tie ;
			from documents d left join docrol r on (d.code=r.code) ;
			order by tie desc ;
			into cursor documents
		sele docrol
		use	
		
		sele documents
	
		=ireport(iif(empty(reporte) or isnull(reporte),'docrol',reporte),,'documents')
		sele documents
		use
	other case
		if !sqli("select * from vdocup where code="+alup(kcode)+";",'docpagos') then
			return .f.
		endif
		if reccount('docpagos')>0

			sele d.*, saldoant, plancod, nomdocd, coded, numd, valort, fecultpag, referencia  ;
				from documents d left join docpagos s on (d.code=s.code) ;
				into cursor documents
			sele documents
			=ireport(iif(empty(reporte) or isnull(reporte),'docupag',reporte),,'documents')
			sele documents
			use
		else
			sele documents
			=ireport(iif(empty(reporte) or isnull(reporte),'documents',reporte),,'documents')
			sele documents
			use
		endif
endcase
sele docuset
use
return sqli("update documents set isprint='t' where code="+alup(kcode)+";") 
wait 'Documento Impreso' wind nowait

*****************************************************************************************
*	Escoger el Grupo de Documentos
*****************************************************************************************
function selgru
para topc, tipgru
local i, f

f='visilis'	
if !empty(tipgru)
	if tipgru=2
		f='impresion'
	endif
endif

if !sqli("select * "+;
			"from gdoc "+;
			"where "+f+" order by descrip;",'grudoc') then
	return .f.
endif
if !empty(topc) then
	sele grudoc
	fbus='*'+alltrim(topc)+'*'
	set filter to like(fbus,descrip)
endif
	
SET SHADOW ON
DEFINE POPUP GridPopup ;
  FROM MROW(), MCOL() ;
  MARGIN ;
  promp fields grudoc.descrip;
  SHORTCUT		

ON SELECTION POPUP GridPopup deactivate popup gridpopup
ACTIVATE POPUP GridPopup
RELEASE POPUP GridPopup

i=grudoc.idgdoc
sele grudoc
return i

*****************************************************************************************
*	Balance General 
*	Parametro la fecha a la cual se lo requiere
*****************************************************************************************
function balanceg
para fec, des, fdia
local d, s, p, t, fdh, sdh, swsalini

swsalini=.f.

if empty(fec) or isnull(fec) then
	fec=ffinp
endif

if empty(des) or isnull(des) then
	swsalini=.t.
	des=finip
endif

d=nomunico()
s=nomunico()
p=nomunico()
t=nomunico()

if des=finip
	fdh='afecha<='+alup(fec)
	sdh=alup(.t.)
else
	fdh="afecha<="+alup(fec)+" and afecha>="+alup(des)
	sdh=alup(.f.)
endif

*	NO TOMAR o NO TOMAR EN CUENTA LOS SALDOS INICIALES

sdh=alup(swsalini)

if fec=finip
	fdia=alup(.f.)
else
	fdia=alup(.t.)
endif

q1="SELECT idplancuenta, idaux, auxiliar, auxname, sum(debe) AS debe, sum(haber) AS haber "+;
	"FROM vdiario "+;
	"where not isanulado and "+fdia+" and "+fdh+;
	" GROUP BY idplancuenta, idaux, auxiliar, auxname;"

if !sqli(q1,d) then
	return .f.
endif

q1="SELECT DISTINCT auxiliar, auxname, idauxiliar as idaux, idplancuenta, debe, haber "+;
	"FROM vsaldoscon "+;
	"WHERE "+sdh+" and pdocode="+alup(iprd)+";"

if !sqli(q1,s) then
	return .f.
endif
				
q1="SELECT distinct idplancuenta, plancod, plannivel, plantype, "+;
		"auxcode, pdocode, cuenta, plancod as codigo "+;
	"FROM vplancta "+;
	"WHERE pdocode="+alup(iprd)+;
		" order by plancod,cuenta;"				
		
if !sqli(q1,p) then
	return .f.
else
	select 	idplancuenta, plancod, plannivel, plantype, ;
			iif(isnull(auxcode),' ',auxcode) as auxcode, pdocode, cuenta, codigo ;
	from	&p ;
	into 	cursor &p
endif

*	Union de los valores de saldos y los del diario
create cursor &t (idplancuenta i null, idaux i null, auxiliar c(10) null, auxname c(50) null, debe n(12,2), haber n(12,2))
sele &d
go top
do while !eof()
	scatt memvar
	sele &t
	insert into &t from memvar
	sele &d
	skip
enddo
sele &s
go top
do while !eof()
	scat memvar
	sele &t
	locate for idplancuenta=m.idplancuenta and idaux=m.idaux
	if found()
		replace debe with debe+m.debe
		replace haber with haber+m.haber
	else
		insert into &t from memvar
	endif
	sele &s
	skip
enddo
	
*	Sumar los valores del debe y haber
select idplancuenta, idaux, auxiliar, auxname, sum(debe-haber) as valor ;
	from &t ;
	group by idplancuenta, idaux ;
	having sum(debe-haber)#0 ;
	into cursor &t;
	
* balance general
SELE p.plancod, p.plannivel, p.plantype, p.cuenta, p.auxcode , a.auxiliar, a.auxname, ;
		iif(substr(p.plancod,1,1)='1' or substr(p.plancod,1,1)='5', iif(isnull(valor),0000000000.00,valor), 000000000.00) as debe, ;
		iif(substr(p.plancod,1,1)='2' or substr(p.plancod,1,1)='3' or substr(p.plancod,1,1)='4', iif(isnull(valor),00000000.00,valor*(-1)), 00000000.00) as haber, ;
		p.idplancuenta, a.idaux, fec as fhasta, p.codigo ;
		FROM &p p LEFT JOIN &t a ON (p.IDPLANCUENTA=a.IDPLANCUENTA) ;
		order by p.plancod ;
		into cursor balanceg
sele &p
use
sele &d
use
sele &s
use
sele &t
use
sele balanceg
return .t.		

*****************************************************************************************
*	Saldos de una Cuenta contable a una fecha determinada
*	Parametro la fecha, cta, auxiliar
*	Puede recibir como parametros: 
*		la fecha
*		identificacion de cuenta
*		identificacion del auxiliar
*****************************************************************************************
function saldoscta
para fec, kcta, kaux
local d, s, p, t, fkcta, fkaux1, fkaux2
if empty(fec) or isnull(fec) then
	fec=ffinp
endif

if empty(kcta) or isnull(kcta) then
	fkcta=alup(.t.)
else
	fkcta='idplancuenta='+alup(kcta)
endif

if empty(kaux) or isnull(kaux) then
	fkaux1=alup(.t.)
	fkaux2=alup(.t.)
else
	fkaux1='idaux='+alup(kaux)
	fkaux2='idauxiliar='+alup(kaux)
endif

d=nomunico()
s=nomunico()
t=nomunico()

if fec=ffinp
	ffec=" afecha<="+alup(ffinp)
else
	ffec=" afecha<"+alup(fec)
endif

if !sqli("SELECT idplancuenta, idaux, auxiliar, auxname, sum(debe) AS debe, sum(haber) AS haber "+;
				"FROM vdiario "+;
				"where not isanulado and "+fkaux1+" and "+fkcta+" and pdocode="+alup(iprd)+" and "+ffec+;
				" GROUP BY idplancuenta, idaux, auxiliar, auxname;",d) then
	return .f.
endif

if !sqli("SELECT DISTINCT auxiliar, auxname, idauxiliar as idaux, idplancuenta, debe, haber "+;
				"FROM vsaldoscon "+;
				"WHERE "+fkaux2+" and "+fkcta+" and pdocode="+alup(iprd)+";",s) then
	return .f.
endif

*	Union de los valores de saldos y los del diario
create cursor &t (idplancuenta i, idaux i, auxiliar c(10), auxname c(50), debe n(12,2), haber n(12,2))
sele &d
go top
do while !eof()
	scatt memvar
	sele &t
	insert into &t from memvar
	sele &d
	skip
enddo
sele &s
go top
do while !eof()
	scat memvar
	sele &t
	locate for idplancuenta=m.idplancuenta and idaux=m.idaux
	if found()
		replace debe with debe+m.debe
		replace haber with haber+m.haber
	else
		insert into &t from memvar
	endif
	sele &s
	skip
enddo
	
*	Sumar los valores del debe y haber
select idplancuenta, idaux, auxiliar, auxname, sum(debe-haber) as valors ;
	from &t ;
	group by idplancuenta, idaux ;
	having sum(debe-haber)#0 ;
	into cursor saldoscta
	
sele &d
use
sele &s
use
sele &t
use

sele saldoscta
return .t.		


*****************************************************************************************
*	Auxiliares Contables
*	Parametro:	I ===> Items
*	Parametro:	S ===> Sujetos
*	Parametro:	B ===> Bancos
*****************************************************************************************
function auxcon
para tsp
local f
f=alup(.t.)
if !empty(tsp) then
	f='tipo='+alup(tsp)
endif	

*!*	if (!sqli("SELECT tipo, idauxiliar, auxiliar, substr(auxname,1,40) as auxname "+;
*!*				"from vauxcon " +;
*!*				"WHERE "+f+" and idauxiliar in "+;
*!*				"(select distinct idaux from vdiario where pdocode="+alup(iprd)+")"+;
*!*				" order by auxname;",'auxcon')) then
*!*		do regerrbd
*!*		=messagebox('Error en la obtencion de Auxiliares Contables',0,EMPRESA)								
*!*		return .f.
*!*	endif

if !sqli("SELECT tipo, idauxiliar, auxiliar, substr(auxname,1,40) as auxname "+;
			"from vauxcon " +;
			"WHERE "+f+" order by auxname;",'auxcon') then
	return .f.
endif


*****************************************************************************************
*	Contabilizacion de Documentos
*	Parametro: Codigo del Documento
*****************************************************************************************
function condoc
para cddoc

local codew,idsecudocw, snamew, bodegaw, fechaw,	montototalw, linkdocw, clientey, ;
		scodew, codeuy,	nomdocw, conceptow, nombreuy, swite, swban, swsuj, swusu, swnin, ;
		swdoc, swk, nprox, numasi, ids, t, td, th, t1, swdb, dtagw
		
if !rubros('D')
	return .f.
endif

numasi=0

if swkeycon
	codew=cddoc

	if !isabierto then
		wait 'Este periodo ya fue cerrado' wind nowait
		return .f.
	endif

	if used('diario') then
		sele diario
		use
	endif
	
	create cursor nomtmpc (rubcode n(5), valor n(10,2), isupdate l defa .f.)
	
create cursor diario (	cuenta c(40), ;
						auxiliar c(40), ;
						codigo c(30), ;
						debe n(10,2) defa 0, ;
						haber n(10,2) defa 0, ;
						rubcode i, ;
                      	idplancuenta i, ;
                      	idaux i, ;
                      	tipoaux c(1), ;
                      	coded n(6) defa 0)

	if codew=0 then
		wait 'Ingrese codigo de documento' wind nowait
		return .f.
	endif

	sele diario

	if used('nomtmp2') then
		sele nomtmp2
		use
	endif
	&&
	&& datos de cabecera del documento
	&&
	q1="select distinct code, idsecudoc, sname, bodega, fecha, linkdoc, nombreu, isprint, dtag, "+;
				"subconiva, subsiniva, subtotal, descuconiva, descusiniva, ivavalor, ajucon, "+;
				"montototal, recargo, recargo2, recargo3, flete, icevalor, ipsvalor, moneda, ispagado, "+;
				"isanulado, isaccount, nomdoc, cliente, scode, concepto, idugra as codeu, nombreu "+;
	           "from vdocuments "+;
	           "where code="+alup(codew)+";"
	           
	if !sqli(q1,'nomtmp2') then
	   return .f.
	endif
	
	sele nomtmp2
	if reccount('nomtmp2')= 0 then
	   wait 'No existe documento' wind nowait
	   return .f.
	endif

	if isanulado then
		wait 'Documento anulado' wind nowait
		return .f.
	endif

	if !ispagado then
		wait 'Documento no cancelado' wind nowait
		return .f.
	endif
	
	if ajucon
		wait 'Documento debe ser contabilizado manualmente' wind nowait
		return .f.
	endif	

	sele nomtmp2
	codew		= code
	idsecudocw 	= idsecudoc
	snamew		= sname
	bodegaw		= bodega
	fechaw		= fecha
	montototalw	= montototal
	linkdocw	= linkdoc
	clientey	= cliente
	scodew		= scode
	codeuy		= codeu
	nomdocw		= nomdoc
	conceptow	= concepto
	nombreuy	= nombreu
	dtagw		= dtag

	if !between(fechaw,finip,ffinp) then
		wait 'Fecha fuera del periodo contable' wind nowait 
		return .F.
	endif

	************************************************************************************
	*	datos de configuracion del documento del documento
	************************************************************************************	
	if !docuset(idsecudocw) then 
		return .f.
	endif

	if reccount('docuset')=0 then
		wait 'Error en configuración del documento' wind nowait
		return .f.
	endif

	swite=items
	swban=bancos
	swsuj=sujetos
	swrol=rubrol
	swnin=ninguno
	swdoc=documentos
	swk=swkar
	if	!cobros(codew) then
		return .f.
	endif
***********************************************************************************
*	Adjuntamos los rubros del documento
***********************************************************************************
	
	sele rubros
	go top
	
	do while !eof()
		fv='nomtmp2.'+alltrim(rubros.rubformula)
		m.valor=&fv
		m.rubcode=rubros.rubcode

		sele nomtmpc
		appen blank
		gather memvar
		sele rubros
		skip
	enddo

	select * from cobros union select * from nomtmpc into cursor cobros
	
*!*		if reccount('cobros')=0 then
*!*			return .f.
*!*		endif


	***********************************************************************************
	*	recorrido de los rubros y cuentas q cosntan en la config. del documento
	***********************************************************************************
	sele docuset
	go top
	do while !eof()
		sele cobros
		go top
		locate for rubcode=docuset.rubcode
		if found() then
	***********************************************************************************
	*	buscar los datos de los auxiliares dependiendo de lo q diga la cta. ctble.
	***********************************************************************************
	*	Si el auxiliar es bancos busco en datos de bancos
			sele docuset	
			do case
			case docuset.auxcode='B'
				*************************************************************************
				*	Si tiene detalle de documentos bancarios, registrar cada documento
				*************************************************************************
				fr='not d.isdet'
				if swban then && determinar si son valores del detalle
					if !swdb 
						q1="select distinct sum(punitario) as cvaldo "+;
		 				  	"from detadocb "+;
		 				  	"where isdet and not isanulado and code="+alup(codew)+";"
						if !sqli(q1,'docban')
							return .f.
						endif
						sele docban
						if docban.cvaldo=cobros.valor  then &&
							fr='d.isdet'
							swdb=.t.
						endif
					endif
						
				endif
				&& verificar si el detalle corresponde a esta cuenta
				if !sqli("select distinct d.idcuenta, d.nudocban, c.nucuban, fecdoc, "+;
						"g.descripda as banco, d.punitario as cvaldo, c.numaux "+;
	 				  	"from detadocb d, ctasban c, datosgen g "+;
	 				  	"where "+fr+" and d.idcuenta=c.idcuenta and not d.isanulado and "+;
	 				  	"c.idbanco=g.iddato and code="+alup(codew)+";",'docban') then
					return .f.
				endif
				if reccount('docban')=0 then
					wait 'Necesita datos bancarios para este documento ' wind nowait
					sele docban
					use
					return .f.
				endif
				
				sele docban
				go top
				do while !eof()   && registrar todos los doc. bancarios
					sele diario
					appen blank
					replace  diario.cuenta with docuset.cuenta
					replace diario.idplancuenta with docuset.idplancuenta
					replace diario.rubcode  with docuset.rubcode
					if docuset.debehaber='D' then
						replace diario.debe with docban.cvaldo
					else
						replace diario.haber with docban.cvaldo
					endif

					replace diario.auxiliar with alltrim(docban.banco)+' '+alltrim(docban.nucuban)+;
												'  doc:'+alltrim(str(docban.nudocban))
					replace diario.codigo with alltrim(docuset.plancod)+'.'+nconcero(5,docban.numaux)
					replace diario.idaux	 with docban.idcuenta
					sele docban
					skip	
				enddo
	*************************************************************					
	*	Si el auxiliar es sujetos 
	*************************************************************
			case docuset.auxcode='S'
			
				if docuset.auxsuj>0
				
					q1="select scode, sname, idsujeto from sujetos where idsujeto="+alup(auxsuj)
					if !sqli(q1,'sujtdc')
						=messagebox('Error en auxiliar de cuenta: Sujetos ',0,empresa)
						return .f.
					else
						if reccount('sujtdc')<>1
							=messagebox('Error en auxiliar de cuenta: Sujetos',0,empresa)
							return .f.
						endif
					endif
				
				endif
				
				if docuset.cabedeta=2 then	&& si el documento tiene detalle de sujetos
					

					q1="select idsujeto, scode, punitario as cvaldo, "+;
						"snamed AS sname "+;
						"from vdocus d "+;
	 				  	"where code="+alup(codew)+";"
 				  	
					if !sqli(q1,'docsuj') then
						return .f.
					endif
					if reccount('docsuj')=0 then
						wait 'Necesita datos de sujetos detalle ' wind nowait
						sele docsuj
						use
						return .f.
					endif

				
					sele docsuj
					go top
					do while !eof()   && registrar todos los  sujetos
						sele diario
						appen blank
						replace  diario.cuenta with docuset.cuenta
						replace diario.idplancuenta with docuset.idplancuenta
						replace diario.rubcode  with docuset.rubcode
						if docuset.debehaber='D' then
							replace diario.debe with docsuj.cvaldo
						else
							replace diario.haber with docsuj.cvaldo
						endif
						
						if docuset.auxsuj=0
							replace diario.auxiliar with alltrim(docsuj.sname)
							replace diario.codigo with alltrim(docuset.plancod)+'.'+nconcero(5,docsuj.scode)
							replace diario.idaux	 with docsuj.idsujeto
						else
							replace diario.auxiliar with alltrim(sujtdc.sname)
							replace diario.codigo with alltrim(docuset.plancod)+'.'+nconcero(5,sujtdc.scode)
							replace diario.idaux	 with sujtdc.idsujeto
						endif
						
						sele docsuj
						skip	
					enddo
					use
				else	&& si la cuenta es de sujetos pero el rubro es del documento
					do case
					case docuset.sujaux='B'
						cs='(d.cliente=s.idsujeto)'
						is='cliente'
					case docuset.sujaux='C'
						cs='(d.usercaja=s.idsujeto)'
						is='usercaja'
					case docuset.sujaux='V'
						cs='(d.seller=s.idsujeto)'
						is='seller'
					case docuset.sujaux='R'
						cs='(d.casher=s.idsujeto)'
						is='casher'
					case docuset.sujaux='U'
						cs='(d.idugra=s.idsujeto)'
						is='idugra'
					other
						cs='(d.sujter=s.idsujeto)'
						is='sujter'
					endcase
					
					q1="select sname, scode, "+is+;
						" from documents d left join sujetos s on "+cs+;
						" where code="+alup(codew)+";"
					if !sqli(q1,'benef')
						return .f.
					endif
					
					b='benef.'+is
						
					sele diario
					appen blank
					replace  cuenta with docuset.cuenta
					replace  diario.cuenta with docuset.cuenta
					replace diario.idplancuenta with docuset.idplancuenta
					replace diario.rubcode  with docuset.rubcode
					
					if docuset.debehaber='D' then
						replace debe with cobros.valor
					else
						replace haber with cobros.valor			
					endif
					
					if docuset.auxsuj=0
						replace diario.auxiliar with alltrim(benef.sname)
						replace diario.codigo 	with alltrim(docuset.plancod)+'.'+nconcero(5,benef.scode)
						replace diario.idaux	 with &b
					else
						replace diario.auxiliar with alltrim(sujtdc.sname)
						replace diario.codigo with alltrim(docuset.plancod)+'.'+nconcero(5,sujtdc.scode)
						replace diario.idaux	 with sujtdc.idsujeto
					endif

					replace diario.rubcode  with docuset.rubcode
					replace diario.idplancuenta with docuset.idplancuenta
				endif

	*	Si el auxiliar es de inventario 
			case docuset.auxcode='I'
			if swite then		&& si el documento tiene detalle de items
				if like('*SIN IVA*',docuset.rubname)
					q1="select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+;
	                  		"from vdocui "+;
	                  		"where not isivai and code="+alup(codew)+";"
                else
                	if like('*CON IVA*',docuset.rubname)
						q1="select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+;
	                  		"from vdocui "+;
	                  		"where isivai and code="+alup(codew)+";"
	                else
						q1="select iditem, auxiliar , auxcon, round(subtot::numeric,2) as valor, descuento, artgrupo "+;
	                  		"from vdocui "+;
	                  		"where code="+alup(codew)+";"	                
	                endif
                endif

				if !sqli(q1,'detart')
					return .f.
				endif

				if reccount('detart')=0 then
*!*						wait 'Necesita datos de items detalle ' wind nowait
*!*						sele detart
				endif
				&& Buscamos las cuentas dependiento del grupo, si no esta marcado como una sola cuenta
				if !docuset.itunacta
					q1="select d.idplancuenta, p.cuenta, p.plancod, d.debehaber, d.artgrupo "+;
	                	"from dcontitem d left join vplancta p on (d.idplancuenta=p.idplancuenta) "+;
	                  	"where d.iddocuse="+alup(docuset.iddocuse)+";"

					if !sqli(q1,'confitem')
						return .f.
					endif
				endif
				sele detart
				go top
				do while !eof()   && registrar todos los datos del inventario
					
					sele diario
					appen blank
					if !docuset.itunacta
						g=detart.artgrupo
						sele confitem
						go top
						locate for artgrupo=g
						
						if found() then
							sele diario
							replace  diario.cuenta with confitem.cuenta
							replace diario.idplancuenta with confitem.idplancuenta
							replace diario.rubcode  with docuset.rubcode
							if docuset.debehaber='D' then
								replace diario.debe with iif(consindes,detart.valor-detart.descuento,detart.valor)
							else
								replace diario.haber with iif(consindes,detart.valor-detart.descuento,detart.valor)
							endif

							replace diario.auxiliar with alltrim(detart.auxiliar)
							replace diario.codigo with alltrim(confitem.plancod)+'.'+nconcero(5,detart.auxcon)
							replace diario.idaux	 with detart.iditem
						endif
					else	
						sele diario
						replace  diario.cuenta with docuset.cuenta
						replace diario.idplancuenta with docuset.idplancuenta
						replace diario.rubcode  with docuset.rubcode
						if docuset.debehaber='D' then
							replace diario.debe with iif(consindes,detart.valor-detart.descuento,detart.valor)
						else
							replace diario.haber with iif(consindes,detart.valor-detart.descuento,detart.valor)
						endif

						replace diario.auxiliar with alltrim(detart.auxiliar)
						replace diario.codigo with alltrim(docuset.plancod)+'.'+nconcero(5,detart.auxcon)
						replace diario.idaux	 with detart.iditem

					endif

					sele detart
					skip	
				enddo
				use

			endif

			endcase

		endif
		sele docuset
		skip
	enddo
	*********************************************************************************
	*	Si el documento es de liquidacion o tiene otros documentos en el detalle
	*********************************************************************************
	if swdoc
		q1="select d.code, d.coded, d.valort, d.rubcode, s.cliente, s.iddocu, s.sname, "+;
					"s.scode, o.idplancuenta, o.debehaber, o.sujaux, t.plancod, "+;
					"g.descripda as cuenta "+;
			"from detadocd d left join vdocusmall s on (d.coded=s.code) "+;
							"left join vdocusmall p on (p.code=d.code) "+;
							"left join ddocused o on (p.iddocu=o.iddocu and d.rubcode=o.rubcode) "+;
							"left join vplancta t on (o.idplancuenta=t.idplancuenta) "+;
							"left join detagru g on (t.idcuenta=g.iddato) "+;
			"where d.code="+alup(codew)+" and s.iddocu=o.iddocud "+;
					"and t.pdocode="+alup(iprd)+";"
		if !sqli(q1,'detadocd') then	
			return .f.
		else
			
		endif

		if reccount('detadocd')>0 then
			sele detadocd
			go top
			do while !eof()
	****
				do case
				case detadocd.sujaux='B'
					cs='(d.cliente=s.idsujeto)'
					is='cliente'
				case detadocd.sujaux='C'
					cs='(d.usercaja=s.idsujeto)'
					is='usercaja'
				case detadocd.sujaux='V'
					cs='(d.seller=s.idsujeto)'
					is='seller'
				case detadocd.sujaux='R'
					cs='(d.casher=s.idsujeto)'
					is='casher'
				case docuset.sujaux='U'
					cs='(d.idugra=s.idsujeto)'
					is='idugra'
				other
					cs='(d.sujter=s.idsujeto)'
					is='sujter'
				endcase
				
				q1="select sname, scode, "+is+;
					" from documents d left join sujetos s on "+cs+;
					" where code="+alup(detadocd.coded)+";"
				if !sqli(q1,'benef')
					return .f.
				endif
				
				b='benef.'+is
					
	****
				sele diario
				appen blank
				replace  diario.cuenta with detadocd.cuenta
				replace diario.idplancuenta with detadocd.idplancuenta
	*			replace diario.rubcode  with detadocd.rubcode
				if detadocd.debehaber='D' then
					replace diario.debe 	with detadocd.valort
				else
					replace diario.haber 	with detadocd.valort
				endif

				replace diario.auxiliar with alltrim(benef.sname)
				replace diario.codigo 	with alltrim(detadocd.plancod)+'.'+nconcero(5,benef.scode)
				replace diario.idaux	with &b
				replace diario.coded  	with detadocd.coded
				sele detadocd
				skip
			enddo
		endif
	endif
	*********************************************************************************
	*	Si el documento es Rol de Pagos
	*********************************************************************************
	if swrol
		if !sqli("select distinct d.code, d.rubcode, d.valor, s.cliente, s.iddocu, s.sname, "+;
						"s.scode, r.idplancuenta, r.debehaber, t.plancod, t.cuenta, t.auxsuj "+;
						"from detadocl d left join vdocusmall s on (d.code=s.code) "+;
							"left join contarol r on (d.rubcode=r.rubcode) "+;
							"left join empleados e on (s.cliente=e.idsujeto) "+;
							"left join vplancta t on (r.idplancuenta=t.idplancuenta) "+;
						"where r.area=e.emarea and d.code="+alup(codew),'detadocr') then
					
			return .f.
		endif

		if reccount('detadocr')>0 then
			sele detadocr
			go top
			do while !eof()
			
				if detadocr.auxsuj>0
					q1="select scode, sname, idsujeto "+;
						"from sujetos "+;
						"where idsujeto="+alup(detadocr.auxsuj)
						
					if !sqli(q1,'sujtdc')
						=messagebox('Error en auxilar: Sujetos',0,empresa)
						return .f.
					else
						if reccount('sujtdc')<>1
							=messagebox('Error en auxilar: Sujetos',0,empresa)
							return .f.
						endif
					endif
				endif
			
				sele diario
				appen blank
				replace  diario.cuenta with detadocr.cuenta
				replace diario.idplancuenta with detadocr.idplancuenta
	*			replace diario.rubcode  with detadocr.rubcode
				if detadocr.debehaber='D' then
					replace diario.debe 	with detadocr.valor
				else
					replace diario.haber 	with detadocr.valor
				endif

				if detadocr.auxsuj=0
					replace diario.auxiliar with alltrim(detadocr.sname)
					replace diario.codigo 	with alltrim(detadocr.plancod)+'.'+nconcero(5,detadocr.scode)
					replace diario.idaux	 with detadocr.cliente
				else
					replace diario.auxiliar with alltrim(sujtdc.sname)
					replace diario.codigo with alltrim(detadocr.plancod)+'.'+nconcero(5,sujtdc.scode)
					replace diario.idaux	 with sujtdc.idsujeto
				endif

*!*					replace diario.auxiliar with alltrim(detadocr.sname)
*!*					replace diario.codigo with alltrim(detadocr.plancod)+'.'+nconcero(5,detadocr.scode)
*!*					replace diario.idaux	 with detadocr.cliente
				sele detadocr
				skip
			enddo
		endif
	endif

*********************************************************************************
*	Si el documento Contiene registro de saldos iniciales
*********************************************************************************
	q1="select distinct sum(d.valort) as valort, s.cuenta, s.ctacon, s.sname, s.scode, "+;
				"s.plancod, s.idsujeto, p.auxsuj "+;
		"from detadocp d left join vsaldosci s on (d.idsaldosci=s.idsaldosci) "+;
						"left join vplancta p on (s.ctacon=p.idplancuenta) "+;
		"where d.code="+alup(codew)+;
		" group by s.cuenta, s.ctacon, s.sname, s.scode, s.plancod, s.idsujeto, p.auxsuj "
		
	if !sqli(q1,'detadocp')
		return .f.
	endif

	if reccount('detadocp')>0 then
		sele detadocp
		go top
		do while !eof()

			if detadocp.auxsuj>0
				q1="select scode, sname, idsujeto "+;
					"from sujetos "+;
					"where idsujeto="+alup(detadocp.auxsuj)
					
				if !sqli(q1,'sujtdc')
					=messagebox('Error en auxilar: Sujetos',0,empresa)
					return .f.
				else
					if reccount('sujtdc')<>1
						=messagebox('Error en auxilar: Sujetos',0,empresa)
						return .f.
					endif
				endif
			endif

			sele diario
			appen blank
			replace  diario.cuenta with detadocp.cuenta
			replace diario.idplancuenta with detadocp.ctacon
*			replace diario.rubcode  with detadocr.rubcode
			if substr(detadocp.plancod,1,1)='2'
				replace diario.debe 	with detadocp.valort
			else
				replace diario.haber 	with detadocp.valort
			endif


			if detadocp.auxsuj=0
				replace diario.auxiliar with alltrim(detadocp.sname)
				replace diario.codigo 	with alltrim(detadocp.plancod)+'.'+nconcero(5,detadocp.scode)
				replace diario.idaux	with detadocp.idsujeto
			else
				replace diario.auxiliar with alltrim(sujtdc.sname)
				replace diario.codigo 	with alltrim(detadocp.plancod)+'.'+nconcero(5,sujtdc.scode)
				replace diario.idaux	with sujtdc.idsujeto
			endif

			sele detadocp
			skip
		enddo
	endif



	SELE *, iif(debe>0,0,1) as tipdh FROM DIARIO into cursor tmpd
	
	sele * from tmpd  where debe>0 or haber>0 order by tipdh, codigo   into cursor tmpd

	sele diario

	select sum(debe) as td, sum(haber) as th from diario into cursor tmpdia
	
	if tmpdia.td=0 or tmpdia.th=0
		wait 'Descuadrado...' wind nowait
		return .f.
	endif
	
	sele diario
	go top
	if round(tmpdia.td,2)#round(tmpdia.th,2) then
		wait 'Descuadrado...' wind nowait
		return .f.
	endif
	
	if swbloctadoc
		if used('docban')
			selec distinct d.idplancuenta, d.idaux, d.auxiliar, b.fecdoc ;
			from diario d left join docban b on (d.idaux=b.idcuenta) ;
			into cursor blocta 
		else
			selec distinct idplancuenta, idaux, auxiliar, fechaw as fecdoc ;
			from diario ;
			into cursor blocta 
		endif
		
		sele blocta
		go top
		scan
			q1="select distinct b.fecha, p.cuenta, p.plancod, b.auxiliar "+;
				" from bloqueos b left join vplancta p on (b.idcuenta=p.idplancuenta) "+;
				" where b.pdocode="+alup(iprd)+" and b.idcuenta="+alup(blocta.idplancuenta)+" and "+;
						" b.fecha>="+alup(fecdoc)+" and b.islock"
			if !sqli(q1,'bloqueos')
				wait 'Error en bloqueos' wind nowait
				return .f.
			else
				if reccount('bloqueos')>0 
					go top
					swaux=.f.
					swcta=.f.
					do while !eof()
						if auxiliar=blocta.idaux
							swaux=.t.
							exit
						endif
						if auxiliar>0
							swcta=.t.
						endif
						skip
					enddo
					if swaux or !swcta
						=messagebox('Una cuenta de este documento esta bloqueada...'+chr(13)+;
								alltrim(bloqueos.plancod)+' - '+alltrim(bloqueos.cuenta)+' - '+blocta.auxiliar,0,empresa)
						return .f.
					endif
				endif
			endif
		endscan
	endif

	&&&&&&

	if !sqli("select s.idsecu, d.descripda from secuencias s, detagru d "+;
					  "where s.idsecuencia=d.iddato "+ ;
					  "and substr(d.descripda,1,18)="+alup('ASIENTOS CONTABLES')+";",'secuencias') then
		
		return .f.
	else
		sele secuencias
		if reccount('secuencias')=0 or reccount('secuencias')>1 then
			wait 'Error en secuencia de Asientos Contables' wind nowait
			use
			return .f.
		endif
	endif


	SELE secuencias
	ids=idsecu
	
	if tmpdia.td=0 and tmpdia.th=0 

		x=0

		if !sqli("begin;") then
			return
		endif
	
		q1="delete from asientosmov where idasiento in "+;
				"(select idasiento from asientosdia "+;
					"where code="+alup(codew)+")"
		
		=sqli(q1)		
		q1="delete from asientosdia "+;
				"where code="+alup(codew)
		=sqli(q1)

		=sqli("update documents set isaccount='t' where code="+alup(codew)+";") 
		
		if fintransq()
			
			if swk
				if !nomtmp2.isaccount
					=actcosart(codew)
				endif
			endif
			
			return .t.
		else
			return .f.
		endif


	endif
	
	if !sqli("begin;") then
		return
	endif
	x=0
	
	q1="select numasi as na "+;
		" from asientosdia "+;
		"where code= "+alup(codew)
	=sqli(q1,'asiento')
	
	numasi=asiento.na
	
	q1="delete from asientosmov where idasiento in "+;
			"(select idasiento from asientosdia "+;
				"where code="+alup(codew)+")"
	
	=sqli(q1)		
	q1="delete from asientosdia "+;
			"where code="+alup(codew)
	=sqli(q1)
	
	****************************************************************************************
	*	Bloquear el rgistro de documents hasta q se actualice los datos
	****************************************************************************************
	=sqli("lock documents in share row exclusive mode;") 

	=sqli("lock secuencias in share row exclusive mode;")

	=sqli("update documents set isaccount='t' where code="+alup(codew)+";") 

	=sqli("select nextval('asientosdia_idasiento_seq'::text) as valor;",'secdia')

	nprox=0
	if used('secdia') then
		sele secdia
		go top
		nprox=val(valor)
		use
	endif
	
	if numasi=0
		if sqli("select numese from secuencias where idsecu="+;
						alup(ids)+";",'nextasi') then
			numasi=nextasi.numese+1
		endif
		use
	endif


	=sqli("update secuencias set numese="+alup(numasi)+;
					" where idsecu="+alup(ids)+";") 

	=sqli("insert into asientosdia (idasiento, numasi, code, idugra, afecha, pdocode) values "+;
					pal(nprox)+al(numasi)+al(codew)+al(idu)+al(fechaw)+ual(iprd)) 

	sele diario
	go top
	c=0
	do while !eof()
		if debe>0 or Haber>0 then
			q1="insert into asientosmov (idasiento, idcta, idaux, debe, haber, coded) values "+;
							  pal(nprox)+al(idplancuenta)+al(idaux)+al(debe)+al(haber)+ual(coded)
			if sqli(q1)
				c=c+1
			endif
		endif
		skip
	enddo
	
	q1="update detadocb set isaccount='t' where code="+alup(codew)
	=sqli(q1)
	
	x=iif(c=0,1,0)  	&&	Si no hay detalle del asiento, reversar

	*******************
	if fintransq()
			
		if swk
			if !nomtmp2.isaccount
				=actcosart(codew)
			endif
		endif
		
		return .t.
	else
		return .f.
	endif
			
	*******************
endif	

***********************************************
*	Procedimiento q finaliza una transaccion
***********************************************
procedure fintrans
	if x=0 then
		if sqlexec(nconec,"commit;")<0 then
			wait 'Error en la conexion con la BDD 2' wind
		else
			=messagebox('Registrado',0,empresa)
		endif
	else
		if sqlexec(nconec,"rollback;")<0 then
			wait 'Error en la conexion con la BDD 1' wind 
		else
			=messagebox('No se Registro!!!',0,empresa)
		endif
	endif

***********************************************
*	Funcion q finaliza una transaccion 
*	Sin mensage de confirmacion
***********************************************
Function fintransq
	if x=0 then
		if sqlexec(nconec,"commit;")<0 then
			return .f.
		else
			return .t.
		endif
	else
		if sqlexec(nconec,"rollback;")<0 then
			return .f.
		else
			return .f.
		endif
	endif

***********************************************
*	Funcion q Obtiene informacion de los formatos
*	d los archivos
**********************************************
Function imagenrep
return sqli("select idimage, archivo, descripcion from imagenrep ;",'imagenrep') 



***********************************************
*	Funcion q actualiza los precios promedios
*	en los documentos
**********************************************
Function actcosdoc
para ncod, tarc, nite, fd, fh

*!*	ncod 	==> codigo de documento
*!*	tarc 	==> tipo de articulo
*!*	nite	==> codigo de item (iditem)
*!*	fd		==> fecha inicio de actualización de documento
*!*	fh		==> fecha finalizacion de actualización de documento

local pdoc, td, pu, ci, cf, cdoc, f, s, sfin, pua, pup, ffi, fuc


cf=0
ci=0
f=iif(!empty(fh) and !isnull(fh),fh,hoy)
fp=iif(!empty(fd) and !isnull(fd),fd,finip)
sfin=.f.

if tipcalcos=1
	s=alup(.t.)

	if !empty(ncod) and !isnull(ncod)
		q1="select isaccount, swkar, isdevo, swconta, fecha, istransfer "+;
			"from vdocusmall "+;
			"where code="+alup(ncod)
		if sqli(q1,'dpri')
			sele dpri
			go top
			if reccount()=0
				use
				return .f.
			endif
			
			if !swkar then
				return .t.
			endif

			if !swconta 
				return .t.
			else
				if !isaccount
					return .t.
				endif
			endif
			f=dpri.fecha
			fp=dpri.fecha
		endif
		s="iditem in (select iditem from detadoci where code="+alup(ncod)+") "
	else
		if !empty(tarc)
			s="iditem in (select iditem from items where artgrupo="+alup(tarc)+") "
		else
			if !empty(nite)
				s="iditem="+alup(nite)+" "
			endif
		endif
	endif

	fuc=finip		
	q1="select max(fecha) as fecha "+;
		"from costeoinv "

	if sqli(q1,'fultcost')
		if reccount('fultcost')=1
			fuc=iif(isnull(fultcost.fecha) or empty(fultcost.fecha),finip,fultcost.fecha)
		endif
	endif


	q1="select max(fecsaldo) as fecsaldo "+;
		"from saldosi "+;
		"where fecsaldo<"+alup(fp)

	ffi=finip		
	if sqli(q1,'fmaxsal')
		if reccount('fmaxsal')<>0
			ffi=iif(isnull(fmaxsal.fecsaldo) or empty(fmaxsal.fecsaldo),ffi,fmaxsal.fecsaldo)
		endif
	endif
		
	* Saldos Iniciales
	q1="select iditem, sum(inicial) as inicial, max(precio) as precio "+;
		"from saldosi "+;
		"where fecsaldo="+alup(ffi)+" and "+s+;
		"group by iditem;"
	if !sqli(q1,'saldosi') then
		return .f.
	endif

	* Calculo  de Ingresos en este periodo
	q1="select fecha, iditem, artcosto, descuento, artcosto as punitario, iname, icode, qty, isdevo, "+;
			"d.code, d.istransfer  "+;
		"from vdocui i left join vdocusmall d on (d.code=i.code) "+;
		"where not d.istransfer and d.swkar and fecha>"+alup(ffi)+" and fecha<="+alup(f)+" and tipsaldo=2 and "+fcont+" and "+;
			"not isanulado and "+s+;
			" order by iditem, fecha;"
	if !sqli(q1,'ingresos') then
		return .f.
	endif

	* Tabla de Items
	q1="select iditem, icode, iname, artcosto, costopro "+;
		"from items "+;
		"where itipo=1 and "+s+" order by iname;"
		
	if !sqli(q1,'articulos') then
		return .f.
	endif

	* Saldos Iniciales e Ingresos
	sele articulos
	go top
	do while !eof()
		x=0
		
		wait 'Actualizando '+alltrim(articulos.iname) wind at 3,1 time 0.3

		if !sqli("begin;") then
			exit
		endif

		sele saldosi
		go top
		locate for iditem=articulos.iditem
		if found()
			pu	=iif(isnull(precio) or empty(precio),0, precio)
			pua	=iif(isnull(precio) or empty(precio),0, precio)
			ci	=iif(isnull(inicial),0,inicial)
		else
			pu	=0
			pua	=0
		endif

		fi=fp
		
		sele ingresos
		set filter to
		set filter to iditem=articulos.iditem
		go top
		
		if !eof()
			if pu=0 or pua=0
				pu	=ingresos.artcosto
				pua	=ingresos.artcosto
			else
				pup=ingresos.artcosto
			endif
		else
			if pu=0
				pu=iif(isnull(articulos.artcosto) or empty(articulos.artcosto), articulos.costopro, articulos.artcosto)
			endif
		endif
		
		do while !eof()
			*	Actualizacion solo del hasta la fecha definida, caso contrio no actualizar
			
			if fecha>=fp and fecha<=f and fecha>fuc
				*	Actualizacion de Facturas
				q1="update detadoci set artcosto="+alup(round(iif(empty(pu) or isnull(pu),iif(empty(pua) or isnull(pua),iif(empty(pup) or isnull(pup),0,pup),pua) ,pu),5))+;
					" where iditem="+alup(articulos.iditem)+" and code in "+;
					"(select code "+;
					" from vdocusmall "+;
					" where pdocode="+alup(iprd)+" and tipsaldo=1 and "+fcont+ " and not isdevo and not istransfer "+;
					" and not isanulado and fecha<"+;
						alup(fecha)+" and fecha>="+alup(fi)+")"
				if !sqli(q1)
					wait 'Error en actualización' wind nowait
				endif
					
				*		Actualizacion de Devoluciones de ventas
				if ingresos.isdevo
					q1="update detadoci set artcosto="+alup(round(iif(empty(pu) or isnull(pu),iif(empty(pua) or isnull(pua),iif(empty(pup) or isnull(pup),0,pup),pua) ,pu),5))+;
						" where iditem="+alup(articulos.iditem)+" and code="+;
						alup(ingresos.code) 
					if !sqli(q1)
						wait 'Error en actualización' wind nowait
					endif
				endif

			endif
			
			*	Calculo de Egresos en este periodo, los mismos documentos q se actualizan
			q1="select sum(qty) as qty  "+;
				"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
				"where not istransfer and tipsaldo=1 and swkar and "+fcont+" and not isanulado and "+;
						"iditem="+alup(articulos.iditem)+;
						" and pdocode="+alup(iprd)+" and fecha<"+alup(fecha)+" and fecha>="+alup(fi)
			if sqli(q1,'egr')
				ce=iif(isnull(egr.qty),0,egr.qty)
				
			*	No puede haber mas egresos de los q hay			
				if ci-ce<0 
					if (empty(pu) or isnull(pu)) and (empty(pua) or isnull(pua)) and (empty(pup) or isnull(pup))
						x=1
					endif
				else
					if !ingresos.isdevo and !ingresos.istransfer
						pu=iif(ci-ce+ingresos.qty>0, ;
								((ci-ce)*pu + (ingresos.qty*ingresos.artcosto) -ingresos.descuento)/((ci-ce)+ingresos.qty),;
								ingresos.artcosto)			
						if pu<=0
							pu=pua
						else
							pua=pu
						endif
						
						sele ingresos
						skip
						if !eof()
							pup=artcosto
						endif
						skip -1
						
					endif
				endif
				
				ci=ci-ce+ingresos.qty

			endif

			sele ingresos
			fi=fecha
			skip
		enddo
		
		* Si tuvieramos otros egresos despues del ultimo ingreso
		q1="select sum(qty) as qty  "+;
			"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
			"where tipsaldo=1 and "+fcont+" and not isanulado and not isdevo and "+;
					"iditem="+alup(articulos.iditem)+;
					" and pdocode="+alup(iprd)+" and fecha>="+alup(fi)+" and fecha<="+alup(f)

		if sqli(q1,'egr')
			cf=iif(isnull(egr.qty),0,egr.qty)

			ci=ci-cf
		endif

		*	Actualizacion de facturas
		if fi<=f and fi>fuc 
			q1="update detadoci set artcosto="+alup(pu)+;
					" where iditem="+alup(articulos.iditem)+" and code in "+;
						"(select code "+;
						" from vdocusmall "+;
						" where tipsaldo=1 and swkar and "+fcont+" and not isdevo and not istransfer "+;
						" and not isanulado and pdocode="+alup(iprd)+;
							" and fecha>="+alup(fi)+" and fecha<="+alup(f)+")"
			=sqli(q1)
		endif	
		
		&& Actualizar el costo del kardex
		if f=hoy
	*!*			q1="update items set saldocon="+alup(ci)+", artcosto="+alup(pu)+;
	*!*					" where iditem="+alup(articulos.iditem)+";"
	*!*			=sqli(q1)
		endif	
		**********************************************************************
		if !fintransq() then
			=messagebox('Error en '+alltrim(str(articulos.icode))+' '+;
			 alltrim(articulos.iname),0,empresa)
		endif
		**********************************************************************
		
		sele articulos
		
		skip
	enddo

	wait clear 

	return .t.
else
	
	s=alup(.t.)
	
	if !empty(ncod) and !isnull(ncod)
		q1="select isaccount, swkar, isdevo, swconta, fecha, istransfer "+;
			"from vdocusmall "+;
			"where code="+alup(ncod)
		if sqli(q1,'dpri')
			sele dpri
			go top
			if reccount()=0
				use
				return .f.
			endif
			
			if !swkar then
				return .t.
			endif

			if !swconta 
				return .t.
			else
				if !isaccount
					return .t.
				endif
			endif
			f=dpri.fecha
			fp=dpri.fecha
		endif
		s="iditem in (select iditem from detadoci where code="+alup(ncod)+") "
	else
		if !empty(tarc)
			s="iditem in (select iditem from items where artgrupo="+alup(tarc)+") "
		else
			if !empty(nite)
				s="iditem="+alup(nite)+" "
			endif
		endif
	endif


	* Tabla de Items
	q1="select iditem, icode, iname, artcosto, costopro "+;
		"from items "+;
		"where itipo=1 and "+s+" order by iname;"
		
	if !sqli(q1,'articulos') then
		return .f.
	endif

	q1="select distinct cospro, iditem, min(fecsaldo) as fecsaldo "+;
				" from saldosi "+;
				" where fecsaldo>"+alup(fp)+;
				" group by 1,2 "+;
				" order by 2,3 "
	
	if !sqli(q1,'fsaldos')
		return .f.
	endif		

	wait 'Pprocesando.... ' wind nowait	

	sele fsaldos
	
	sele articulos
	go top
	do while !eof()

		wait 'Actualizando '+alltrim(articulos.iname) wind at 3,1 time 0.1

		sele fsaldos
		go top
		locate for iditem=articulos.iditem
		if found()
			x=0
			*	Actualizacion de Facturas
			q1="update detadoci set artcosto="+alup(fsaldos.cospro)+;
				" where iditem="+alup(fsaldos.iditem)+" and code in "+;
				"(select code "+;
				" from vdocusmall "+;
				" where tipsaldo=1 and "+fcont+ " and not isdevo and not istransfer "+;
				" and not isanulado and fecha>="+alup(fp)+" and fecha<="+alup(f)+")"
			
			if !sqli(q1)
				wait 'Error en actualización' wind nowait
			endif

			q1="update detadoci set artcosto="+alup(fsaldos.cospro)+;
				" where iditem="+alup(fsaldos.iditem)+" and code in "+;
					" (select code "+;
						" from vdocusmall "+;
						" where isdevo and swkar and fecha>="+alup(fp)+" and fecha<="+alup(f)+;
							" and tipsaldo=2 and "+fcont+" and "+;
							"not isanulado )"
			if !sqli(q1)
				wait 'Error en actualización' wind nowait
			endif

		endif
		if !fintransq() then
			=messagebox('Error en '+alltrim(str(articulos.icode))+' '+;
			 alltrim(articulos.iname),0,empresa)
		endif

		sele articulos
		skip
	enddo
	wait clear 

	return .t.

endif
*****************************************************************************
*	Configuración del ambiente de trabajo
*****************************************************************************
function configura

q1="select printofil as ptf, postoobar as ptb "+;
	"from usuarios "+;
	"where idsujeto="+alup(idu)+";"
	
if sqli(q1,'setup')
	printofil=ptf
	postoobar=ptb
	use
	return .t.
else
	return .f.
endif

*****************************************************************************
*	Conversion de unidades
*****************************************************************************
function convunid
para	cqty, uorig, udest
local tare

tare=alias()

if used('conver')
	sele conver
	go top
else
	q1="select numeconver, denoconver, iddato1, iddato2 "+;
		"from conversion "
	if !sqli(q1,'conver')
		if !empty(tare)
			sele &tare
		endif
		return 0
	endif
endif
sele conver
locate for iddato2=udest and iddato1=uorig
if found()
	if !empty(tare)
		sele &tare
	endif
	return cqty*conver.numeconver/conver.denoconver
else
	sele conver
	go top
	locate for iddato2=uorig and iddato1=udest
	if found()
		return cqty*conver.denoconver/conver.numeconver
	else
		if !empty(tare)
			sele &tare
		endif
		return 0
	endif
endif


*****************************************************************************
*	Cancelación de Documentos
*****************************************************************************
function candoc
para xcodey

local vrb, br

br=1

if !rubros('D') then 
	return .t.
endif

if xcodey!=0 then
	********************************************************************************
	*	Si ya genero documentos bancarios, no es posible cancelar de nuevo
	********************************************************************************	
	q1="select count(*)::int4 as numdoc "+;
		"from detadocb "+;
		"where not isdet and not isanulado and code="+alup(xcodey)
	if !sqli(q1,'genban')
		return .f.
	endif
	sele genban
	if numdoc>0
		wait 'Ya se han generado documentos bancarios para este documento' wind nowait
		return .f.
	endif
	********************************************************************************
	*	Datos principales
	********************************************************************************	
	
	q1="select distinct idsecudoc, montototal, ispagado, isanulado, isaccount, tipsaldo, linkdoc, fecha "+;
	   "from vdocusmall d "+;
	   "where code="+alup(xcodey)+";"
	if !sqli(q1,'nomtmp2') then
	   wait 'Error de conección datos principales doc.' wind nowait
	   return .f.
	endif
	sele nomtmp2
	if reccount('nomtmp2')= 0 then
		wait 'NO existe documento' wind nowait
		return .f.
	endif
	if isanulado then
		wait 'Documento ANULADO' wind nowait
		return .f.
	endif
	if isaccount then
		wait 'Documento Contabilizado' wind nowait
		return .f.
	endif

     q1="select r.rubcode, r.rubname, r.rubtype, r.isdocban, r.isdocret, r.rubformula, "+;
			"r.rubcal, r.rubtab, d.siempre, d.issaldo "+;
		"from secudoc s, docuse c,ddocuse d, rubros r "+;
		"where s.iddocu=c.iddocu and c.iddocu=d.iddocu and d.rubcode=r.rubcode and "+;
				"r.rubtype='C' and s.idsecudoc="+alup(nomtmp2.idsecudoc)+;
		" order by rubformula;"
		
	if !sqli(q1,'ddocuse') then
		return .f.
	endif

	if reccount('ddocuse')!=1 
		return .f.
	else
		*	Si el rubro de cancelacion es caja y el usuario puede ingresar cajero
		*	retornar falso para permitir registrar cajero
		if like('*CAJA*',rubname) and ingcaj
			return .f.
		endif
	endif
	
	sele ddocuse 
	go top

	if !EMPTY(alltrim(rubformula)) and !isnull(rubformula)
		return .f.
	endif

	x=0
	
	if !sqli("begin;")
		return .f.
	endif

	=sqli("lock documents in share row exclusive mode;")

	********************************************************************************
	*	Eliminación de Registros de cancelación, si fue cancelado anteriormente
	********************************************************************************	
	q1="delete from cobros where tipo='C' and code="+alup(xcodey)
	=sqli(q1)
	********************************************************************************
	*	Si este documento actualizo saldos en otros documentos
	*	Y fue cancelado anteriormente, reestablecer los saldos.
	********************************************************************************	
	if nomtmp2.ispagado
		q1="select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+;
			"from detadocd a, documents b "+;
			"where a.coded=b.code and a.code="+alup(xcodey)+";"
						
		if sqli(q1,'detadoc')
			sele detadoc
			go top
			do while !eof()
				q1="update documents set saldo="+alup(saldo+valort)+;
		           		" where code="+alup(coded)+";"
		           		
				=sqli(q1)
				skip
			enddo
		endif
	endif
	
	********************************************************************************
	*	Si este documento actualizo detalle de pagos
	********************************************************************************	
	if nomtmp2.ispagado

		q1="select s.saldo, p.valort, p.idsaldosci, p.fecultpag "+;
			"from detadocp p left join saldosci s on (p.idsaldosci=s.idsaldosci) "+;
			"where p.code="+alup(xcodey)+";"
						
		if sqli(q1,'detadocp')
			sele detadocp
			go top
			do while !eof()
				q1="update saldosci set saldo="+alup(saldo+valort)+;
		           		" where idsaldosci="+alup(idsaldosci)+";"
		           		
				=sqli(q1)
				skip
			enddo
		endif
	endif
	********************************************************************************
	*	Registrar rubros de cancelación
	********************************************************************************	
		
		q1="insert into cobros (code, rubcode, valor, basecal, tipo) values "+;
			                  pal(xcodey) + al(ddocuse.rubcode) + al(nomtmp2.montototal) + al(0)+ual(ddocuse.rubtype)
		=sqli(q1)

	********************************************************************************
	*	Actualizar documento principal
	********************************************************************************	
		if idcajero=0
			x=1
		endif
		
		if ddocuse.issaldo
			q1="update documents set usercaja="+alup(idcajero)+;
				", tmpsaldo=montototal, saldo=montototal, ispagado='t' where code="+alup(xcodey)
		else
		     q1="select sum(valor) as valor "+;
				"from vdocusmall d left join cobros c on (d.code=c.code) "+;
								"  left join rubros r on (c.rubcode=r.rubcode) "+;
								"  left join ddocuse u on (d.iddocu=u.iddocu and r.rubcode=u.rubcode) "+;
				"where u.issaldo and r.rubtype='D' and d.code="+alup(xcodey)
		
			if !sqli(q1,'saldord') then
				return .f.
			endif
			sele saldord
			go top
			q1="update documents set tmpsaldo="+alup(saldord.valor)+;
									", saldo ="+alup(saldord.valor)+;
									", usercaja="+alup(idcajero)+;
									", ispagado='t' where code="+alup(xcodey)		
		endif
		=sqli(q1)	

	********************************************************************************
	*	Actualizacion de los documentos de la liquidacion
	********************************************************************************	
	q1="select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+;
					"from detadocd a, documents b "+;
					"where a.coded=b.code and a.code="+alup(xcodey)+";"
	= sqli(q1,'detadoc') 

	sele detadoc
	go top
	do while !eof()
		if saldo-valort<0 then
	    	sele novedad
	    	append blank
	    	replace descrip with 'Revise el detalle de liq. codigo doc.'+alup(detadoc.coded)
	    	
	    	wait 'Revise el detalle de liq. codigo doc.'+alup(detadoc.coded) wind nowait
	    	sele detadoc
			x=1		
		else
			q1="update documents set saldo="+alup(saldo-valort)+;
	                          " where code="+alup(coded)+";"
			= sqli(q1)
		endif
		skip
	enddo

	********************************************************************************
	*	Actualizacion de Pagos
	********************************************************************************	
		q1="select a.saldoant, a.valort, a.idsaldosci "+;
			"from detadocp a "+;
			"where a.code="+alup(xcodey)+";"
						
		if sqli(q1,'detadocp')
			sele detadocp
			go top
			do while !eof()
				q1="update saldosci set saldo=saldo-"+alup(valort)+;
		           		" where idsaldosci="+alup(idsaldosci)+";"
		           		
				=sqli(q1)
				skip
			enddo
		endif
		
	********************************************************************	
	rc=fintransq()
	********************************************************************	
	n=xcodey
	if x=0 then
		=messagebox('Documento Cerrado...',0,empresa)
		
	
		sele ddocuse
		
		if alltrim(upper(rubname))='CAJA' and nomtmp2.tipsaldo=1 
			if messagebox('Desea Registrar Cheques de clientes? ',36)=6 then
				do form cheques with n
			endif
		endif
*!*			No existen documentos de retencion
*!*			if !deleted() and rubcode!=0 and isdocret and messagebox('Desea Generar Retención? ',36)=6 
*!*				do form comprete with n
*!*			endif
		
		if isdocban 
			if transche(xcodey)
				sele ddocuse
				if messagebox('Desea Generar '+alltrim(rubname)+ '? ',36)=6 then
					n=xcodey
					do form adq0702b with n
				endif
			endif
		endif
		
		if rc
			return .t.
		endif
	else
		return .f.
	endif
endif

****************************************************************************
*	Comprobacion de Cheques Posechados
****************************************************************************
function transche

para ycode

if swkeycon
	fcont1='d.isaccount'
else
	fcont1=alup(.t.)
endif

q1="select c.valor, d.linkdoc, fecha, c.rubcode "+;
	"from documents d left join cobros c on (d.code=c.code) "+;
					" left join rubros r on (c.rubcode=r.rubcode) "+;
	"where c.code="+alup(ycode)+" and r.rubtype='C' and r.isdocban and not d.isanulado and not "+;
			fcont1
		
if !sqli(q1,'tcoban')
	return .f.
endif

if reccount('tcoban')=0
	return .t.
endif

q1="select * "+;
	"from detadocb "+;
	"where punitario="+alup(valor)+" and isposfec and fecdoc="+alup(tcoban.fecha)+;
				" and not isconpos and code="+alup(tcoban.linkdoc)

if !sqli(q1,'chequepos')
	return .f.
endif

********************************************************************
*	Si tiene cheques posfechados actualizar sus codigos de enlaces
********************************************************************
sele chequepos	
if reccount('chequepos')>0

	x=0

	=sqli("begin;")
	
	q1="update cobros set isupdate ="+alup(.t.) + " where code="+alup(ycode)+;
	  " and rubcode="+alup(tcoban.rubcode)+";"
	=sqli(q1)
	
	q1="update detadocb set isconpos='t', "+;
					"code="+alup(ycode)+;
		" where punitario="+alup(tcoban.valor)+" and isposfec and fecdoc="+;
		alup(nomtmp2.fecha)+" and not isconpos and code="+alup(nomtmp2.linkdoc)
	=sqli(q1)
	****************************************************************
	= fintransq()
	****************************************************************
	wait 'Se han transferido cheques posfechados a este documento' wind nowait
endif

return .t.


***************************************************************
*	Anulacion de Documentos
***************************************************************
function anuladoc

para codek

local iddocuy, linkdocy, fechay, ispagadoy, isanuladoy


q1="select distinct code, iddocu, nomdoc, isprint, ispagado, isaccount, "+;
			"isanulado, fecgra, fecha, num, sname, moneda, poriva, montototal, "+;
			"numcuota, ffrom, fto, linkdoc, subconiva, descuconiva, subsiniva, "+;
			"descusiniva, recargo, flete, ivavalor, icevalor, ipsvalor, subtotal, valcuota, "+;
			"concepto, saldo "+;
	"from vdocuments where code="+alup(codek)+";"
if !sqli(q1,'nomtmp0') then
   	return .f.
endif
sele nomtmp0

iddocuy		= iddocu
linkdocy	= linkdoc
fechay		= fecha
ispagadoy	=ispagado
isanuladoy	=isanulado


if isanuladoy then
	wait 'Documento Anulado' wind nowait
	return .t.
endif

***
if !autper(codek, 3)
	wait 'No tiene Acceso de anulación total' wind nowait
	return .f.
endif

if empty(codek)
	wait 'Ingrese Codigo' wind nowait
	return .f.
endif

if bloqueodoc(codek)
	return .f.
endif

***************************************************************************************
*	verificar si existen documentos bancarios confirmados
***************************************************************************************
q1="select isposfec, isconpos, isconciliado, isprotesto, isconfbanc, fecpag, punitario, fecdoc "+;
		"from vdocub "+;
		"where code="+alup(codek)+ " and not isanulado ;"
if !sqli(q1,'docban') then
	return .f.
endif

sele docban
go top
do while !eof()
	if isconciliado or isconfbanc then
		wait 'Existe documentos bancarios confirmados' wind nowait
		return .f.
	endif
	skip
enddo
***************************************************************************************
*	verificar si esta registrado como gasto o adquisición en importación
***************************************************************************************
q1="select p.codimp "+;
	"from import p left join importd d on (p.idimport=d.idimport) "+;
	"where not isanulado and d.code="+alup(codek)
if !sqli(q1,'import') then
	wait 'Error en consulta de importaciones o compras locales' wind nowait
	return .f.
endif

sele import
go top
if reccount()>0 
	wait 'Este documento esta registrado en el calculo de articulos '+alltrim(str(codimp)) wind nowait
	return .f.
endif
		
***************************************************************************************
*	verificar si este documento fue tomado en cuenta en alguna liquidacion
***************************************************************************************
q1="select code from documents where "+fcont+" and not isanulado and code in "+;
			"(select code from detadocd where coded="+alup(codek)+")"
if !sqli(q1,'docliq')
	return
else
	sele docliq
	if reccount()>0 
		wait 'Exiten documentos de liquidación que hacen referencia a este documento' wind nowait		
		return .f.
	endif	
endif	

***************************************************************************************
*	verificar si este documento fue el inicial de otro documento activo
***************************************************************************************
q1="select code "+;
	"from vdocusmall "+;
	"where iddocu<>"+alup(nomtmp0.iddocu)+" and "+fcont+;
	" and not isanulado and linkdoc="+alup(codek)
if !sqli(q1,'docgen')
	return
else
	sele docgen
	if reccount()>0 
		if messagebox('Exiten Doc. generado en base a este y aun esta activo desea continuar? '+alltrim(str(code)),36,empresa)!=6
			return .f.
		endif
	endif	
endif	
*********************************************************************************
x=0
if !sqli("begin;") then
	return
endif
************************************************************************************
*	Si el documento tiene cheque posfechado, y fueron traspasados a este documento
*	volverlos a dejarlos en el documento original
************************************************************************************
if linkdocy>0
	sele docban
	go top
	do while !eof()

		if isposfec and isconpos and fecdoc=.fecha
			q1="update detadocb set isconpos='f', "+;
						"code="+alup(linkdocy)+;
					" where punitario="+alup(punitario)+" and not isanulado "+;
					" and isposfec and isconpos and code="+alup(codek)
			=sqli(q1)
		endif

		skip
	enddo
endif
********************************************************************************
*	Anulacion de documento
********************************************************************************
q1="update documents set isanulado="+alup(.t.)+;
					  ", iduanu="	+alup(idu)+;
	" where code="+alup(codek)+";"
					
=sqli(q1) 

********************************************************************************
*	Si es documento de Venta de cartera, dejar los cheques pendientes
********************************************************************************
q1="update cheques set codvencar=0"+;
					", isefectivo='f' "+;
					", fecdepo=null "+;
		" where codvencar="+alup(codek)
=sqli(q1)

********************************************************************************
*	confirmacion de cheques de clientes
********************************************************************************	

q1="select idcheque from detadocs where code="+alup(codek)
if sqli(q1,'checli')	
	sele checli
	go top
	do while !eof()
		q1="update cheques set isefectivo='f'" +;
					" where idcheque="+alup(idcheque)+";"
		=sqli(q1)
		
		sele checli
		skip
	enddo
endif
********************************************************************************
*	determinamos si existe este codigo en la tabla de descargo de inventario
********************************************************************************
q1="select code, codedes from descargov where codedes="+alup(codek)+";"
if sqli(q1,'descargo') 
	if reccount('descargo')>0 
		x=1
		wait 'Existe este documento registrado en un doc. de descargo '+str(code) wind nowait
	endif
endif
q1="select dflag from documents where code="+alup(codek)+";"
if sqli(q1,'descargo')
	if dflag
		wait 'documento ha sido descargado de inventario' wind nowait
		x=1
	endif
endif	 

********************************************************************************
*	Actualizacion de los documentos que pertenezcan a otro documento
********************************************************************************	

q1="select a.saldoant, a.valort, a.coded, a.tipoie, b.saldo "+;
	"from detadocd a, documents b "+;
	"where a.coded=b.code and a.code="+alup(codek)+";"
				
if sqli(q1,'detadoc')  then
	sele detadoc
	go top
	do while !eof()
		if ispagadoy then
		
			q1="update documents set saldo="+alup(saldo+valort)+;
	           		" where code="+alup(coded)+";"
	           		
			=sqli(q1)
		endif
		skip
	enddo
endif
********************************************************************************
*	Anulacion de documentos bancarios
********************************************************************************	
q1="update detadocb set isanulado="+alup(.t.)+;
      		" where code="+alup(codek)+";"
=sqli(q1)

********************************************************************************
*	Anulacion de cheques de clientes
********************************************************************************	
q1="update cheques set isanulado="+alup(.t.)+;
      		" where code="+alup(codek)+";"
=sqli(q1)

********************************************************************************
*	Si es Documento de depreciacion de activos
********************************************************************************	
q1=	"update depreact set isreg="+alup(.f.)+;
   		" where code="+alup(codek)+";"
=sqli(q1)


********************************************************************************
*	Si es Actualizo pagos 
********************************************************************************	
if ispagadoy
	q1="select s.monto, s.saldo, p.valort, p.idsaldosci, p.fecultpag "+;
		"from detadocp p left join saldosci s on (p.idsaldosci=s.idsaldosci) "+;
		"where p.code="+alup(codek)+";"

	if sqli(q1,'detadp')
		sele detadp
		go top
		do while !eof()
			q1="update saldosci set saldo="+alup(iif(saldo+valort>monto, monto, saldo+valort))+;
	           		" where idsaldosci="+alup(idsaldosci)+";"
	           		
			=sqli(q1)
			skip
		enddo
	endif
endif
********************************************************************************
*	Anulacion del asiento contable
********************************************************************************	
q1=	"update asientosdia set isanulado="+alup(.t.)+;
   		" where code="+alup(codek)+";"
=sqli(q1)

********************************************************************************
*	Auditoria
********************************************************************************	

q1="insert into auditoria (idu, modulo, ame,  nametable, keytable,  progname) values "+;
					pal(idu)+al(modulok)+al('E')+al('DOCUMENTS')+al(codek)+ual('ADQ0704')
=sqli(q1)

wait 'Documento anulado' wind nowait

********************************************************************************	
if fintransq()
	=actcosart(codek)
	return .t.
else
	return .f.
endif

********************************************************************************
function bloqueodoc
para codez, dtagz, fechaz

local dz, fz

if swbloctadoc

	if empty(codez) or isnull(codez)
		codez=0
	endif
	
	q1="select isaccount, fecha, dtag, swconta "+;
		"from vdocusmall "+;
		"where code="+alup(codez)
	if !sqli(q1,'documx')
		return .t.
	endif
			
	if codez>0
	
		if documx.isaccount
		
			q1="select distinct idcta, idaux "+;
				"from asientosdia a left join asientosmov m on (a.idasiento=m.idasiento) "+;
				"where a.code="+alup(codez)
			if !sqli(q1,'blocta')
				return .t.
			endif
			
			sele blocta
			go top
			scan
				q1="select distinct b.fecha, p.cuenta, p.plancod, b.auxiliar "+;
					" from bloqueos b left join vplancta p on (b.idcuenta=p.idplancuenta) "+;
					" where b.pdocode="+alup(iprd)+" and b.idcuenta="+alup(blocta.idcta)+" and "+;
							" b.fecha>="+alup(documx.fecha)+" and b.islock"
				if !sqli(q1,'bloqueos')
					wait 'Error en bloqueos' wind nowait
					return .t.
				else
					if reccount('bloqueos')>0 
						go top
						swaux=.f.
						swcta=.f.
						do while !eof()
							if auxiliar=blocta.idaux
								swaux=.t.
							endif
							if auxiliar>0
								swcta=.t.
							endif
							skip
						enddo
						if swaux or !swcta
	*!*							=messagebox('Una cuenta de este documento esta bloqueada...'+chr(13)+;
	*!*									alltrim(bloqueos.plancod)+' - '+alltrim(bloqueos.cuenta),0,empresa)
							wait 'Una cuenta de este documento esta bloqueada...'+chr(13)+;
									alltrim(bloqueos.plancod)+' - '+alltrim(bloqueos.cuenta) wind nowait
							return .t.
						endif
					endif
				endif
			endscan
		endif
	endif
	
	if isnull(dtagz) or empty(dtagz) 
		dz=documx.dtag
		fz=documx.fecha
	else
		dz=dtagz
		fz=fechaz
	endif
	
	q1="select distinct b.fecha, g.descrip "+;
		" from bloqueos b left join gdoc g on (b.idgrupo=g.idgdoc) "+;
						" left join dgdoc t on (g.idgdoc=t.idgdoc) "+;
						" left join docuse s on (t.dtag=s.dtag) "+;
		" where b.pdocode="+alup(iprd)+" and s.pdocode="+alup(iprd)+" and b.idgrupo>0 and "+;
				" s.dtag="+alup(dz)+" and b.fecha>="+alup(fz)+" and b.islock"
	if !sqli(q1,'bloqueos')
		wait 'Error en bloqueos' wind nowait
		return .t.
	else
		if reccount('bloqueos')>0
*!*				=messagebox('El grupo al que pertenece este documento esta bloqueado...'+chr(13)+;
*!*							alltrim(bloqueos.descrip),0,empresa)
			wait 'El grupo al que pertenece este documento esta bloqueado...'+chr(13)+alltrim(bloqueos.descrip) wind nowait
			return .t.
		else
			return .f.
		endif
	endif
	
	return .f.	
else
	return .f.
endif

********************************************************************************
*	Saldo de Items por Bodegas
********************************************************************************
function saldoitem
	para isaldo, fsaldo, bsaldo 
	
	local fbod, fbod2, ffec
	
	fsaldo=iif(empty(fsaldo) or isnull(fsaldo),hoy,fsaldo)
	
*!*		q1="select saldocon "+;
*!*			"from items "+;
*!*			"where itipo=1 and iditem="+alup(isaldo)

*!*		if !sqli(q1,'sitem')
*!*			return 0
*!*		endif
*!*		 
*!*		if (fsaldo=hoy or (empty(bsaldo) or isnull(bsaldo))) and !calsalbod
*!*			return saldocon
*!*		endif

	if (empty(bsaldo) or isnull(bsaldo))
		fbod=alup(.t.)
		fbod2=alup(.t.)
	else
		fbod="bodega="+alup(bsaldo)
		fbod2="userstore="+alup(bsaldo)
	endif
		
	if (empty(fsaldo) or isnull(fsaldo))
		ffec="fecha<="+alup(hoy)
	else
		ffec="fecha<="+alup(fsaldo)
	endif
	
	q1="select max(fecsaldo) as fecsaldo "+;
		"from saldosi "+;
		"where fecsaldo<"+alup(iif(empty(fsaldo) or isnull(fsaldo),hoy,fsaldo))+" and iditem="+alup(isaldo)

	ffi=finip		
	if sqli(q1,'fmaxsal')
		if reccount('fmaxsal')<>0
			ffi=iif(isnull(fmaxsal.fecsaldo) or empty(fmaxsal.fecsaldo),ffi,fmaxsal.fecsaldo)
		endif
	endif
*	wait 'Ult. fec Saldo '+devfeclet(ffi) wind nowait
		
	q1="select iditem, sum(qtyini) as qtyini "+;
		"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+;
		"where fecsaldo="+alup(ffi)+" and "+fbod+" and iditem="+alup(isaldo)+;
		" group by iditem;"
	if !sqli(q1,'saldb') 
		return 0
	endif

	*!*	* Calculo de Ingresos y Egresos en este periodo y en esta bodega
	q1="select iditem, sum(case when tipsaldo=1 then qty*(-1) else qty end) as qty "+;
		"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
		"where "+fbod2+" and fecha>"+alup(ffi)+" and "+ffec+" and d.iddocu in "+;
			"(select distinct d.iddocu "+;
			" from gdoc g, dgdoc t, docuse d "+;   
			" where g.tag='KARKAR' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+;
			" and case when swconta then isaccount else 't' end "+;
			" and not isanulado and iditem="+alup(isaldo)+;
		" group by iditem ;"
	if !sqli(q1,'movitx') 
		return 0
	endif

	return iif(isnull(saldb.qtyini),0,saldb.qtyini)+iif(isnull(movitx.qty),0,movitx.qty)

********************************************************************************
*	Saldo de Items por Bodegas
********************************************************************************
function saliteini
	para isaldo, fsaldo, bsaldo 
	
	local fbod, fbod2, ffec
	
	fsaldo=iif(empty(fsaldo) or isnull(fsaldo),hoy,fsaldo)
	
	if (empty(bsaldo) or isnull(bsaldo))
		fbod=alup(.t.)
		fbod2=alup(.t.)
	else
		fbod="bodega="+alup(bsaldo)
		fbod2="userstore="+alup(bsaldo)
	endif
		
	if (empty(fsaldo) or isnull(fsaldo))
		ffec="fecha<="+alup(hoy)
	else
		ffec="fecha<="+alup(fsaldo)
	endif


	ffi=finip		

	q1="select iditem, sum(qtyini) as qtyini "+;
		"from saldosi s left join saldosib b on (s.idsaldosi=b.idsaldosi) "+;
		"where fecsaldo="+alup(ffi)+" and "+fbod+" and iditem="+alup(isaldo)+;
		" group by iditem;"
	if !sqli(q1,'saldb') 
		return
	endif

	*!*	* Calculo de Ingresos y Egresos en este periodo y en esta bodega
	q1="select iditem, sum(case when tipsaldo=1 then qty*(-1) else qty end) as qty "+;
		"from detadoci i left join vdocusmall d on (d.code=i.code) "+;
		"where "+fbod2+" and fecha>"+alup(ffi)+" and "+ffec+" and d.iddocu in "+;
			"(select distinct d.iddocu "+;
			" from gdoc g, dgdoc t, docuse d "+;   
			" where g.tag='KARKAR' and g.idgdoc=t.idgdoc and t.dtag=d.dtag ) "+;
			" and case when swconta then isaccount else 't' end "+;
			" and not isanulado and iditem="+alup(isaldo)+;
		" group by iditem ;"
	if !sqli(q1,'movitx') 
		return
	endif

	return iif(isnull(saldb.qtyini),0,saldb.qtyini)+iif(isnull(movitx.qty),0,movitx.qty)
	
*****************************************************************************
*	IMPRESION DE ASIENTOS CONTABLES
*****************************************************************************
function impasiento
para coddoc

	wait 'Generando Asiento Contable....' wind nowait
		
	q1="select distinct code, nomdoc, sname, concepto, documentos, tipsaldo "+;
	"from vdocusmall "+;
	"where code="+alup(coddoc)+";"
	
	if !sqli(q1,'tprinc') then
		return .t.
	endif
	
	if tprinc.documentos 
		q1="select distinct d.code, d.isanulado, numasi, plancod, auxiliar::char(6) as codaux, afecha, nomcta as cuenta, "+;
			"substr(auxname,1,25)||case when a.numsecue2>0 	then '  Doc:'||to_char(a.numsecue2,'9999999') "+;
									"	when p.num>0 		then '  Doc:'||to_char(p.num,'9999999') "+;
									"	else '' end as auxname, debe, haber, auxcode, d.coded, idaux  "+;
			"from vdiario d left join aneiva a on (d.coded=a.code) "+;
						" 	left join documents p on (d.coded=p.code) "+;	
			"where d.code="+alup(coddoc)+";"
	else
		q1="select code, isanulado, numasi, plancod, auxiliar::char(6) as codaux, afecha, nomcta as cuenta, "+;
				"auxname, debe, haber, auxcode, code as coded, idaux "+;
			"from vdiario d "+;
			"where code="+alup(coddoc)+";"
	endif

	if !sqli(q1,'asiento75')then
		return .t.
	endif	
	**
	&& obtencion de datos bancarios
	q1="select code, nucuban, nudocban, punitario, fecdoc, idcuenta "+;
		" from vdocub "+;
		" where not isanulado and substr(dtag,1,6)='CHEQUE' and code="+alup(coddoc)+";"
					
	if !sqli(q1,'cheques') then
		return .t.
	endif


	if (tprinc.documentos )  or reccount('cheques')>1
		sele distinct d.nomdoc, d.code, d.sname, d.concepto, a.numasi, a.afecha, a.debe, a.haber, a.isanulado, cuenta, ;
			alltrim(a.plancod)+'.'+alltrim(codaux)+space(25) as codigo, ;
			alltrim(substr(a.auxname,1,100))+iif(!isnull(b.nudocban),' Doc. '+alltrim(str(b.nudocban))+'-'+dtoc(fecdoc),'') as auxiliar, ;
			a.coded ;
		from asiento75 a left join tprinc d on (a.code=d.code) ;
						 left join cheques b on (a.code=b.code and a.debe+a.haber=b.punitario and a.auxcode='B' and a.idaux=b.idcuenta);
		into cursor asientox order by a.debe desc
	else
		sele d.nomdoc, d.code, d.sname, d.concepto, a.numasi, a.afecha, a.debe, a.haber, a.isanulado, cuenta, ;
			alltrim(a.plancod)+'.'+alltrim(codaux)+space(25) as codigo, ;
			alltrim(substr(a.auxname,1,100))+iif(!isnull(b.nudocban),' Doc. '+alltrim(str(b.nudocban))+'-'+dtoc(fecdoc),'') as auxiliar, ;
			a.coded ;
		from asiento75 a left join tprinc d on (a.code=d.code) ;
						 left join cheques b on (a.code=b.code and a.debe+a.haber=b.punitario and a.auxcode='B' and a.idaux=b.idcuenta);
		into cursor asientox order by a.debe desc
	endif


	sele asientox
	=ireport('asientocon')
		
*****************************************************************************
*	RUBROS DE UN DOCUMENTO EN TABLA
*****************************************************************************
function rubdoc
para qcode

create cursor vardoc (	rubcode		n(6), ;
						rubformula 	c(50), ;
						valor		n(12,2) )
q1="select rubcode, rubformula "+;
	" from rubros "+;
	" where rubtype='D' "
if !sqli(q1,'qrubros')
	return .f.
endif

q1="select * from documents where code="+alup(qcode)

if !sqli(q1,'qdoc')
	return .f.
endif

SELE QDOC

sele qrubros
go top
do while !eof()
	
	sele vardoc
	appen blank
	
	replace rubformula 	with qrubros.rubformula
	replace rubcode 	with qrubros.rubcode
	fe="replace valor 	with qdoc."+alltrim(qrubros.rubformula)
	&fe
	sele qrubros
	skip
enddo
sele qrubros
return

*****************************************************************************
*	RUBROS DE UN DOCUMENTO EN TABLA
*****************************************************************************
function regcobsal
para coddoc

q1="select d.iddocu, t.rubcode, issaldo "+;
	"from docuse d left join ddocuse t on (d.iddocu=t.iddocu) "+;
				"  left join rubros r on (t.rubcode=r.rubcode) "+;
	" where iddocu="+alup(coddoc)+" and rubtype='D' and issaldo "
if !sqli(q1,'confsal')
	return
endif

if reccount('confsal')=0
	return .t.
endif

q1="select code, iddocu "+;
	" from vdocusmall d "+;
	" where iddocu="+alup(coddoc)+" and swconta and code not in (select distinct code from cobros where tipo='D') "
=sqli(q1,'docsinrub')

sele docsinrub
go top
do while !eof()
	wait 'Actualizando configuracion de saldos '+str(code) wind nowait
	=rubdoc(code)
	sele confsal
	go top
	do while !eof()
		sele vardoc
		go top
		locate for rubcode=confsal.rubcode
		if found()
			q1="insert into cobros ( code, rubcode, valor, tipo) values "+pal(docsinrub.code)+;
		   		al(vardoc.rubcode)+al(vardoc.valor)+ual('D')
			=sqli(q1)

		endif
		sele confsal
		skip
	enddo
	sele docsinrub
	skip
enddo 	

return .t.		

*****************************************************************************
*	CALCULO DEL SUELDO EN BANANERAS
*****************************************************************************

function calsuel
para idsuj, feci, fecf

if empty(idsuj) or isnull(idsuj)
	return 0
endif	

if empty(feci) or isnull(feci)
	return 0
endif	

if empty(fecf) or isnull(fecf)
	return 0
endif	

q1="select sum(numhec*valorunit) as valor "+;
	" from actividad "+;
	" where fecha>="+alup(feci)+" and fecha<="+alup(fecf)+" and idsujeto="+alup(idsuj)
if sqli(q1,'actividad')
	sele actividad
	if valor>0
		return valor
	else
		return 0
	endif
else
	return 0
endif				