*       *********************************************************
*       *                                                         
*       * 09-10-2003           MENUPRIN.PRG             11:01:37  
*       *                                                         
*       *********************************************************
*       *********************************************************
*       *                                                         
*       *                     Establecer código                   
*       *                                                         
*       *********************************************************
*

CLEA ALL
CLEA
#INCLUDE "INCLUDE\STRING.H"

local bodega
bodega=''

*	Configurar Variables de entorno
do inicio.fxp

*	Configurar la BDD
do principal81.fxp

with _screen
	.caption = 'SISTEMA DE CONTABILIDAD INTEGRADO'
	.icon = '..\varios\FACE02.ICO'
	.fontname='arial'
	.fontsize=10
	.fontbold=.f.
	.borderstyle=2
	.maxbutton=.f.
	.width=800
	.height=520
	.backcolor=rgb(192,192,192)
	.closable=.f.
	.addobject('logo','image')
	.logo.width=720
	.logo.height=560
	.logo.stretch=1
	.logo.backstyle=0
	.refresh
	
endwith

clea
if scols()<133 or srows()<33 then
	with _screen
		.windowstate=2
		.maxbutton=.t.
		.refresh
	endwith
	clea
endif
set sysmenu to 

with _screen
	.logo.visible=.f.
	.logo.left=(.width - .logo.width)/2
	.logo.top=(.height - .logo.height-100)/2+100
	.addobject('cuadro1','shape')
	.cuadro1.width=.width-20
	.cuadro1.height=90
	.cuadro1.borderwidth=3
	.cuadro1.backstyle=0
	.cuadro1.visible=.t.
	.cuadro1.top=5
	.cuadro1.left=(.width - .cuadro1.width)/2
	
	.addobject('cuadro2','shape')
	.cuadro2.width=.width-20
	.cuadro2.height=.height-105
	.cuadro2.borderwidth=3
	.cuadro2.backstyle=0
	.cuadro2.visible=.t.
	.cuadro2.top=98
	.cuadro2.left=(.width - .cuadro2.width)/2
endwith

do form clave to final

*	Bodega del usuario
q1="select descripda as cbodega "+;
		"from detagru "+;
		"where iddato="+alup(idb)+";"
if sqli(q1,'bodega') then
	sele bodega
	bodega=bodega.cbodega
	sele bodega
	use
else
	wait 'Error en obtención de bodega' wind nowait
endif

if final=0 then
	*	Determina la Fecha del sistema
	if sqlexec(nconec,"select now()::date as fecha;", 'fechahoy')>0 then
		sele fechahoy
		hoy=FECHA
		sele fechahoy
		use
	else
		wait 'No existe comunicación' wind nowait
	endif

	*	Define variables 
	do defvariables	
	
	 if !configura()
	 	final=1
	 endif
	
endif


with _screen
	.AddObject('titulo','Label')
	.titulo.backstyle=0
	.titulo.fontshadow=.t.
	.titulo.fontunderline=.t.
	.titulo.caption=alltrim(empresa)
	.titulo.fontname='Times New Roman'
	.titulo.fontsize=16
	.titulo.fontbold=.t.
	.titulo.autosize=.t.
	.titulo.left=50
	.titulo.top=15
	.titulo.visible=.t.
	.titulo.left=(.width - .titulo.width)/2

	.AddObject('periodo','Label')
	.periodo.fontsize=10
	.periodo.backstyle=0
	.periodo.forecolor=rgb(0,128,64)
	.periodo.autosize=.t.
	.periodo.fontbold=.t.
	.periodo.caption='USUARIO: '+alltrim(USUARIO)+space(5)+'PERIODO: '+alltrim(devfeclet(finip))+;
	'  al  '+alltrim(devfeclet(ffinp))
	.periodo.fontname='Times New Roman'
	.periodo.left=50
	.periodo.top=75
	.periodo.visible=.t.
	.periodo.left=(.width - .periodo.width)/2

	.AddObject('fecequi','Label')
	.fecequi.fontsize=10
	.fecequi.backstyle=0
*	.fecequi.forecolor=rgb(0,128,64)
	.fecequi.autosize=.t.
	.fecequi.fontbold=.t.
	.fecequi.caption='EQUIPO: '+equipo+SPACE(5)+'BODEGA:'+ALLTRIM(bodega)+space(5)+;
	'FECHA: '+alltrim(DEVFECLET(HOY))+space(5)+'AGENCIA: '+alltrim(agencia)
	.fecequi.fontname='Times New Roman'
	.fecequi.left=50
	.fecequi.top=105
	.fecequi.visible=.t.
	.fecequi.left=(.width - .fecequi.width)/2

	.AddObject('modulo','Label')
	.modulo.fontsize=14
	.modulo.backstyle=0
	.modulo.forecolor=rgb(0,0,128)
	.modulo.autosize=.t.
	.modulo.fontbold=.t.
	.modulo.caption=''
	.modulo.fontname='Times New Roman'
	.modulo.left=50
	.modulo.top=50
	.modulo.visible=.t.
	
endwith


*       *********************************************************
*       *                                                         
*       *                    Definición de menú                   
*       *                                                         
*       *********************************************************
*

if (escaja or esptovta ) and final=0
	do menucaj
else

DEFINE POPUP sisconin SHORTCUT RELATIVE FROM 8,5 &&MROW(),MCOL()

DEFINE BAR 1 OF sisconin PROMPT "ADMINISTRACION" ;
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE 'Mantenimiento de las opciones Generales'

DEFINE BAR 3 OF sisconin PROMPT "ADQUISICIONES";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''

DEFINE BAR 4 OF sisconin PROMPT "FACTURACION";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''

DEFINE BAR 5 OF sisconin PROMPT "CONTABILIDAD";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''

DEFINE BAR 6 OF sisconin PROMPT "INVENTARIO";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''
	
DEFINE BAR 7 OF sisconin PROMPT "BANCOS";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''
	
DEFINE BAR 8 OF sisconin PROMPT "ROL DE PAGOS";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''
	
*!*	DEFINE BAR 9 OF sisconin PROMPT "PRODUCCION";
*!*	  	FONT 'Times New Roman', 12;
*!*	  	STYLE 'B' ;
*!*		SKIP FOR .f. ;
*!*		MESSAGE ''
	
*!*	DEFINE BAR 10 OF sisconin PROMPT "RECURSOS HUMANOS";
*!*	  	FONT 'Times New Roman', 12;
*!*	  	STYLE 'B' ;
*!*		SKIP FOR .f. ;
*!*		MESSAGE ''
	
DEFINE BAR 11 OF sisconin PROMPT "ACTIVOS FIJOS";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''
	
DEFINE BAR 12 OF sisconin PROMPT "S. R. I.";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''

*!*	DEFINE BAR 13 OF sisconin PROMPT "C A J A";
*!*	  	FONT 'Times New Roman', 12;
*!*	  	STYLE 'B' ;
*!*		SKIP FOR .f. ;
*!*		MESSAGE ''
	
DEFINE BAR 14 OF sisconin PROMPT "CONFIGURACION";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE ''
	
DEFINE BAR 15 OF sisconin PROMPT "\-"	

DEFINE BAR 16 OF sisconin PROMPT "SALIR";
  	FONT 'Times New Roman', 12;
  	STYLE 'B' ;
	SKIP FOR .f. ;
	MESSAGE 'Abandonar el Sistema'

	
ON SELECTION BAR 1 OF sisconin do programa with 'menuadm'
ON SELECTION BAR 3 OF sisconin do programa with 'menuadq'
ON SELECTION BAR 4 OF sisconin do programa with 'menufac'
ON SELECTION BAR 5 OF sisconin do programa with 'menucon'
ON SELECTION BAR 6 OF sisconin do programa with 'menuinv'
ON SELECTION BAR 7 OF sisconin do programa with 'menuban'
ON SELECTION BAR 8 OF sisconin do programa with 'menurol'
*!*	ON SELECTION BAR 9 OF sisconin do programa with 'menupro'
*!*	ON SELECTION BAR 10 OF sisconin do programa with 'menurec'
ON SELECTION BAR 11 OF sisconin do programa with 'menuact'
ON SELECTION BAR 12 OF sisconin do programa with 'menusri'
*!*	ON SELECTION BAR 13 OF sisconin do programa with 'menucaj'
ON SELECTION BAR 14 OF sisconin do programa with 'menuset'
ON SELECTION BAR 16 OF sisconin ;
	final=1
do while !(final=1)
	ACTIVATE POPUP sisconin
enddo

q1="delete from autprecio where idsujeto="+alup(idu)
=sqli(q1)

endif

*!*	MODI WINDOWS SCREEN
*!*	SET SYSMENU TO DEFA
=SQLDISCONNECT(nconec)
close all

f=sys(2003)+'\'+nombdd

delete data &f
quit

procedure programa
para p
	do case 
		case p='menucaj'
			menux='C A J A'
			modulok='CAJ'
		case p='menuadm'
			menux='Administración Maestro'
			modulok='ADM'
		case p='menusri'
			menux='Rentas'
			modulok='SRI'
		case p='menuadq'
			menux='Adquisiciones'
			modulok='ADQ'
		case p='menufac'
			menux='Facturación'
			modulok='FAC'
		case p='menucon'
			menux='Contabilidad'
			modulok='CON'
		case p='menurol'
			menux='Rol de Pagos'
			modulok='ROL'
		case p='menupro'
			menux='Producción'
			modulok='PRO'
		case p='menuset'
			menux='Configuración'
			modulok='SET'
		case p='menuinv'
			menux='Inventario'
			modulok='INV'
		case p='menuban'
			menux='Bancos'
			modulok='BAN'
		case p='menuact'
			menux='Activos Fijos'
			modulok='ACT'
		case p='menurec'
			menux='Recursos Humanos'
			modulok='REC'		
		OTHERWISE
			return
	endcase
	
	_screen.modulo.caption=menux
	_screen.modulo.left=(_screen.width - _screen.modulo.width)/2
	_screen.caption = alltrim(empresa)+' - '+alltrim(upper(menux))+' - SISTEMA DE CONTABILIDAD INTEGRADO'
	
	do &p

	_screen.modulo.caption=' '
	_screen.modulo.left=(_screen.width - _screen.modulo.width)/2


