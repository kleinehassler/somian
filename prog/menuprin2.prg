CLEA ALL
CLEA
do inicio
with _screen
	.caption = 'SISTEMA DE CONTABILIDAD INTEGRADO'
	.icon = '\sisconin\VARIOS\FACE02.ICO'
	.fontname='arial'
	.fontsize=10
	.fontbold=.f.
	.borderstyle=2
	.maxbutton=.f.
	.width=800
	.height=520
	.backcolor=rgb(236,233,216)
	.addobject('logo','image')
	.logo.picture='\sisconin\varios\obsa.jpg'
	.logo.width=320
	.logo.height=260
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
set sysmenu to defa
set sysmenu to

with _screen
	.logo.visible=.t.
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

do defvariables

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
	.periodo.forecolor=rgb(210,0,20)
	.periodo.autosize=.t.
	.periodo.fontbold=.t.
	.periodo.caption='USUARIO: '+alltrim(USUARIO)+space(10)+'Desde el: '+alltrim(devfeclet(finip))+;
	'  al  '+alltrim(devfeclet(ffinp))+space(10)+'FECHA: '+alltrim(DEVFECLET(HOY))
	.periodo.fontname='Times New Roman'
	.periodo.left=50
	.periodo.top=75
	.periodo.visible=.t.
	.periodo.left=(.width - .periodo.width)/2
	
	.AddObject('modulo','Label')
	.modulo.fontsize=14
	.modulo.backstyle=0
	.modulo.autosize=.t.
	.modulo.fontbold=.t.
	.modulo.caption=''
	.modulo.fontname='Times New Roman'
	.modulo.left=50
	.modulo.top=50
	.modulo.visible=.t.
	
endwith

do while FINAL=0
	store 0 to m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14
	c3=scols()-35
	_SCREEN.modulo.caption=''
	@ 7,5 GET m1 ;
		PICTURE "@*HT ADM. MAESTROS" ;
		style 'B';
		size 2,30 ;
		MESSAGE 'TABLAS PRINCIPALES';
		DEFAULT 1 

	@ 11,5 GET m2 ;
		PICTURE "@*HT LIQUIDACION FRUTAS" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'LIQUIDACIONES DE FRUTA';
		DEFAULT 1 
		
	@ 15,5 GET m3 ;
		PICTURE "@*HT ADQUISICIONES" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'ADQUSICIONES COMPRAS';
		DEFAULT 1 

	@ 19,5 GET m4 ;
		PICTURE "@*HT FACTURACION" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'VENTAS';
		DEFAULT 1 

	@ 23,5 GET m5 ;
		PICTURE "@*HT CONTABILIDAD" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'CONTABILIDAD GENERAL';
		DEFAULT 1 

	@ 27,5 GET m6 ;
		PICTURE "@*HT INVENTARIO" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'INVENTARIO DE MATERIALES/BODEGA';
		DEFAULT 1 

	@ 7,scols()/2-15 GET m7 ;
		PICTURE "@*HT BANCOS" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'BANCOS';
		DEFAULT 1 

	@ 27,scols()/2-15 GET m8 ;
		PICTURE "@*HT ROL DE PAGO" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'CONTROL DE PAGO PERSONAL';
		DEFAULT 1 

	@ 7,c3 GET m9 ;
		PICTURE "@*HT DOCUMENTOS INTERNOS" ;
		style 'B';
		size 2,30 ;
		MESSAGE 'DOCUMENTOS VARIOS';
		DEFAULT 1 

	@ 11,c3 GET m10 ;
		PICTURE "@*HT RECURSOS HUMANOS" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'RECURSOS HUMANOS';
		DEFAULT 1 
		
	@ 15,c3 GET m11 ;
		PICTURE "@*HT ACTIVOS FIJOS" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'ACTIVOS FIJOS Y BIENES DE CONTROL';
		DEFAULT 1 

	@ 19,c3 GET m12 ;
		PICTURE "@*HT S. R. I." ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'SERVICIO DE RENTAS INTERNAS';
		DEFAULT 1 

	@ 23,c3 GET m13 ;
		PICTURE "@*HT CONFIGURACIONES" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'CONFIGURACION DEL SISTEMA';
		DEFAULT 1 

	@ 27,c3 GET m14 ;
		PICTURE "@*HT SALIR" ;
		style 'B';
		SIZE 2,30 ;
		MESSAGE 'ABANDONAR EL SISTEMA';
		DEFAULT 1 
		
	READ CYCLE
	DO LIMPIARBOT
	progra=''
	modux=''
	do case 
		case m1 =1 	
			modux = 'ADMINISTRACIÓN MAESTROS'
			progra= 'menuadm'
		case m2	=1 	
			modux = 'LIQUIDACION DE FRUTA'
			progra= 'menuliq'
		case m3	=1 	
			modux = 'ADQUISICIONES'
			progra= 'menuadq'
		case m4	=1 	
			modux = 'FACTURACION'
			progra= 'menufac'
		case m5	=1 	
			modux = 'CONTABILIDAD'
			progra= 'menucon'
		case m6	=1 	
			modux = 'INVENTARIO'
			progra= 'menuinv'
		case m7	=1 	
			modux = 'BANCOS'
			progra= 'menuban'
		case m8	=1 	
			modux = 'ROL DE PAGOS'
			progra= 'menurol'
		case m9	=1 	
			modux = 'DOCUMENTOS'
			progra= 'menudoc'
		case m10=1 	
			modux = 'RECURSOS HUMANOS'
			progra= 'menurec'
		case m11=1 	
			modux = 'ACTIVOS FIJOS'
			progra= 'menuact'
		case m12=1 	
			modux = 'SERVICIO DE RENTAS INTERNAS'
			progra= 'menusri'
		case m13=1 	
			modux = 'CONFIGURACION DEL SISTEMA'
			progra= 'menuset'
		case m14=1 	
			exit
	endcase
	with _screen
		.modulo.caption=modux
		.modulo.left=(.width - .modulo.width)/2
	endwith
	do &progra
	
	set sysmenu to defa
	set sysmenu to
ENDDO
with _screen
	.fontname='arial'
	.fontsize=10
	.borderstyle=3
	.refresh
endwith

MODI WINDOWS SCREEN
SET SYSMENU TO DEFA
*quit

procedure limpiarbot
	@  7,5            clear to 29,35
	@  7,scols()-35   clear to 29,scols()-5
	@  7,scols()/2-15 clear to  9,scols()/2+15
	@ 27,scols()/2-15 clear to 29,scols()/2+15
