SET DEFA TO \SISCONIN\TEMPO
SET PATH TO \SISCONIN\BDD;\SISCONIN\PROG;\SISCONIN\FORM;\SISCONIN\REPORT;\SISCONIN\VARIOS
SET PROCEDURE TO PROCEDIMIENTOS, FCONSULTAS ADDIT
set sysmenu to defa

do ambiente

public 	hoy, ide, idu, dtu, idse, mascara1, mascara2, mascara3, mascarae, cmoneda, smone, ;
		nconec, final,cadenaorig,cadenadest, EMPRESA, USUARIO, isabierto, ;
		isactual, cta, fta, cfa, iprd, agencia, ciudad, finip, ffinp, ;
		fono, idws, equipo, nivp, modulok
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
       
cadenaorig='ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'       
cadenadest='2468013579AEIOUBCDFGHJKLMNPQRSTVWXYZ'
isabierto=.t.
isactual=.t.
hoy={//}
idu=5
ide=1
idse=56
empresa=''
usuario=''
smone=''
dtu=''
cmoneda=0
iprd=16
mascara1='999,999.99'
mascara2='999,999,999.99'
mascara3='9,999.9999'
mascarae='9,999,999'
finip=date(2004,01,01)
ffinp=date(2004,12,31)
final=0
cta=0
fta=tipolet('Times New Roman')
cfa=14215660
agencia = ''
ciudad = ''
fono = ''
idws=7
nivp=0
equipo=''
modulok='ADQ'

OPEN DATA bddsisconin
nconec=sqlconnect('BDD')
if nconec<0 then
	wait 'No existe comunicacion con la BASE DE DATOS' wind
	cancel
endif
do defvariables	
if sqlexec(nconec,"select now() as fecha;", 'fechahoy')>0 then
	sele fechahoy
	hoy=FECHA
	sele fechahoy
	use
else
	wait 'No existe comunicación' wind nowait
endif
