local ruta
ruta=sys(2003)+'\bdd;'+sys(2003)+'\prog;'+sys(2003)+'\form;'+sys(2003)+'\report;'+sys(2003)+'\varios;'+sys(2003)+'\migracion'
SET PATH TO &ruta
ruta=sys(2003)+'\tempo'
SET DEFA TO &ruta

SET PROCEDURE TO PROCEDI.fxp, FCONSULTAS.fxp ADDIT

SET CLASSLIB TO botones ADDITIVE
SET CLASSLIB TO general ADDITIVE

set sysmenu to defa
SET DATE TO DMY
SET CENTURY ON
SET SAFE OFF
set exclu off
set talk off
set dele on
set point to '.'
set separator to ',' 
set decimal to 6

*on error do manejo_err

ON KEY LABEL F9 do verror
ON KEY LABEL ALT+C !/N CALC

public 	hoy, ide, idu, dtu, idse, mascara1, mascara2, mascara3, mascarae, cmoneda, smone, ;
		nconec, final,cadenaorig,cadenadest, EMPRESA, USUARIO, isabierto, idb, idagen, ;
		isactual, cta, fta, cfa, iprd, agencia, ciudad, finip, ffinp, swpreiva, ingcaj, ;
		fono, idws, equipo, nivp, modulok, nombdd, idsecudocy, idautosriy, tippery, ;
		iddocuy, numy, ctasnums, doccodey, cgru, tlbrdesktop, q1, basedd, x, confbod, ;
		consindes, calsalbod, actcosanu, printofil, postoobar, swkeycon, fcont, CODSRIIVA, ;
		swkarneg, swbloctadoc, ismaster, idcajero, vpctaxcob, esptovta, rucemp, escaja, idi


*!*	hoy			=>	fecha actual (date)
*!*	ide			=>	identificación de la empresa en la tabla empresas
*!*	idse		=>	identificación de la empresa en la tabla sujetos
*!*	idu			=> 	identificación del usuario q esta en el sistema
*!*	dtu			=> 	detalle de tipo de usuario (X ej: Contador)
*!*	mascara1	=>	mascara para valores hasta 999,999.99
*!*	mascara2	=>	mascara para valores hasta 999'999,999.99
*!*	cmoneda		=> 	codigo de moneda del sistema
*!*	finip		=>	fecha de inicio de periodo
*!*	ffinp		=>	fecha de fin de periodo
*!*	nconec		=>	numero de conexión
*!*	final		=> 	bandera numerica que determina si quiere salir del sistema
*!*	cadenaorig	=> 	cadena de caracteres para la validacion de la clave
*!*	cadenadest	=> 	cadena de caracteres para la validacion de la clave
*!*	empresa		=> 	nombre de la empresa en la que se encuentra
*!*	usuario		=> 	nombre del usuario que ingreso al sistema
*!*	isabieto	=> 	bandera que determina si se puede realizar transaciones en este periodo
*!*	isactual	=> 	periodo al que los usuarios acceden por default
*!*	cta			=>	color del texto de los controles text box
*!*	fta			=>	tipo de fuente de los controles text box
*!*	cfa			=>	color de los formularios
*!*	iprd		=>	identificacion del periodo
*!*	agencia     =>  Nombre de la agencia en la q se encuentra
*!*	ciudad		=> 	ciudad en la que se encuentran
*!*	fono		=> 	Telefono de la estacion de trabajo
*!*	idws		=> 	Identificación de la estacion de trabajo
*!* equipo		=> 	Equipo en uso
*!* nivp		=>	Nivel del plan contable
*!* modulok		=>	Modulo del sistema
*!*	cgru		=>	Grupo de documentos activo en un instante
*!* q1			=>  comando sql
*!*	confbod		=> 	La entrega de productos desde bodega tiene confirmacion
*!*	ingcaj		=>	Al momento de cancelar el documento pude cambiar cajero

idsecudocy	=0
idautosriy	=0
tippery		=0
iddocuy		=0
numy		=0
doccodey	=0
ctasnums	=0

cadenaorig='ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'       
cadenadest='2468013579AEIOUBCDFGHJKLMNPQRSTVWXYZ'
isabierto=.t.
isactual=.t.
hoy={//}
idu=1
idb=2651
ide=1
idse=56
empresa=''
usuario='PARDO LOJAN DANIEL'
smone=''
dtu='ADMINISTRADOR'
cmoneda=0
iprd=54
mascara1='999,999.99'
mascara2='999,999,999.99'
mascara3='9,999.99999'
mascarae='9,999,999'
finip=date(2012,01,01)
ffinp=date(2012,12,31)
final=0
cta=0
fta=tipolet('Times New Roman')
cfa=14215660
agencia = ''
ciudad = ''
fono = ''
idws=51
nivp=0
equipo=''
modulok='ADQ'
cgru=''
q1=''

basedd='rocaoro12'

x=0
consindes=.f.
calsalbod=.f.
actcosanu=.f.
printofil=.t.
postoobar=0
swkeycon=.t.
CODSRIIVA=2
swkarneg=.t.
swpreiva=.t.
idagen=160
confbod=.f.
confbod=.f.
ingcaj=.f.
swbloctadoc=.f.
ismaster=.f.
idcajero=9668
vpctaxcob=0
esptovta=.f.
rucemp='1111111111111'
escaja=.f.
idi=0

if swkeycon
	fcont='isaccount'
else
	fcont=alup(.t.)
endif

nombdd=ALLTRIM(nomunico())
do principal81

nconec=sqlconnect(basedd)
if nconec<0 then
	wait 'No existe comunicacion con la BASE DE DATOS' wind nowait
	cancel
endif
if sqlexec(nconec,"select now()::date as fecha;", 'fechahoy')>0 then
	sele fechahoy
	hoy=FECHA
	sele fechahoy
	use
else
	wait 'No existe comunicación' wind nowait
endif

do defvariables	

SET RESOURCE  OFF

=configura()

_SCREEN.CAPTION=UPPER(basedd)