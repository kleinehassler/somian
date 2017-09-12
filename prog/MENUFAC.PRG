*       *********************************************************
*       *                                                         
*       * 18/01/2012            MENUFAC.PRG             10:30:22  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2012 Nombre de compañía                   
*       * Dirección                                               
*       * Ciudad,     Código pos                                  
*       * País                                              
*       *                                                         
*       * Descripción:                                            
*       * Este PROGRAMA lo ha generado automáticamente GENMENU.    
*       *                                                         
*       *********************************************************


*       *********************************************************
*       *                                                         
*       *                    Definición de menú                   
*       *                                                         
*       *********************************************************
*

SET SYSMENU TO
SET SYSMENU AUTOMATIC

DEFINE PAD _3eu0minzw OF _MSYSMENU PROMPT "Ventas" COLOR SCHEME 3 ;
	KEY ALT+V, ""
DEFINE PAD _3eu0minzx OF _MSYSMENU PROMPT "Clientes" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _3eu0minzy OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _3eu0minzz OF _MSYSMENU PROMPT "N/C y N/D" COLOR SCHEME 3 ;
	KEY ALT+N, ""
DEFINE PAD _3eu0mio00 OF _MSYSMENU PROMPT "Bancos" COLOR SCHEME 3 ;
	KEY ALT+B, ""
DEFINE PAD _3eu0mio01 OF _MSYSMENU PROMPT "Impresión Documentos" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _3eu0mio02 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _3eu0mio03 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _3eu0minzw OF _MSYSMENU ACTIVATE POPUP ventas
ON PAD _3eu0minzx OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _3eu0minzy OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _3eu0minzz OF _MSYSMENU ACTIVATE POPUP ncynd
ON PAD _3eu0mio00 OF _MSYSMENU ACTIVATE POPUP bancos
ON PAD _3eu0mio01 OF _MSYSMENU ACTIVATE POPUP impresiónd
ON PAD _3eu0mio02 OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _3eu0mio03 OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP ventas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF ventas PROMPT "Proformas - Pedidos"
DEFINE BAR 3 OF ventas PROMPT "Ventas Por Despacho"
DEFINE BAR 4 OF ventas PROMPT "Guias de Remision"
DEFINE BAR 5 OF ventas PROMPT "\-"
DEFINE BAR 6 OF ventas PROMPT "Por Bodegas"
DEFINE BAR 7 OF ventas PROMPT "\-"
DEFINE BAR 8 OF ventas PROMPT "Canje de Retenciones"
DEFINE BAR 9 OF ventas PROMPT "Anticipos Clientes"
DEFINE BAR 10 OF ventas PROMPT "\-"
DEFINE BAR 11 OF ventas PROMPT "liquidacions en Ventas"
DEFINE BAR 12 OF ventas PROMPT "\-"
DEFINE BAR 13 OF ventas PROMPT "Lista de Precios"
DEFINE BAR 14 OF ventas PROMPT "Precios Individuales"
ON SELECTION BAR 1 OF ventas do form fac0101
ON SELECTION BAR 2 OF ventas do form fac0103
ON SELECTION BAR 3 OF ventas do form fac0110
ON SELECTION BAR 4 OF ventas do form fac0106
ON BAR 6 OF ventas ACTIVATE POPUP porbodegas
ON SELECTION BAR 8 OF ventas do form  fac0107
ON SELECTION BAR 9 OF ventas do form fac0104
ON SELECTION BAR 11 OF ventas do form fac0113
ON SELECTION BAR 13 OF ventas do form fac0109
ON SELECTION BAR 14 OF ventas do form fac0109a

DEFINE POPUP porbodegas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porbodegas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF porbodegas PROMPT "Pedidos de Ventas"
DEFINE BAR 3 OF porbodegas PROMPT "Facturas Credito"
ON SELECTION BAR 1 OF porbodegas do form fac0106a
ON BAR 2 OF porbodegas ACTIVATE POPUP pedidosdev
ON SELECTION BAR 3 OF porbodegas do form fac0106c

DEFINE POPUP pedidosdev MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF pedidosdev PROMPT "Normal"
DEFINE BAR 2 OF pedidosdev PROMPT "Importación"
ON SELECTION BAR 1 OF pedidosdev do form fac0106b
ON SELECTION BAR 2 OF pedidosdev do form fac0106d

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Ingreso"
DEFINE BAR 2 OF nuevoeleme PROMPT "Haciendas"
DEFINE BAR 3 OF nuevoeleme PROMPT "\-"
DEFINE BAR 4 OF nuevoeleme PROMPT "Cheques Recibidos"
DEFINE BAR 5 OF nuevoeleme PROMPT "Postergacion de Cheques"
DEFINE BAR 6 OF nuevoeleme PROMPT "Confirmacion de Cheques"
DEFINE BAR 7 OF nuevoeleme PROMPT "Cheques de otros periodos"
DEFINE BAR 8 OF nuevoeleme PROMPT "\-"
DEFINE BAR 9 OF nuevoeleme PROMPT "Retenciones Recibidas"
DEFINE BAR 10 OF nuevoeleme PROMPT "\-"
DEFINE BAR 11 OF nuevoeleme PROMPT "Rutas Ventas"
DEFINE BAR 12 OF nuevoeleme PROMPT "Rutas Distribucion"
ON SELECTION BAR 1 OF nuevoeleme do form adm0303
ON SELECTION BAR 2 OF nuevoeleme do form adm0304
ON SELECTION BAR 4 OF nuevoeleme do form cheques
ON SELECTION BAR 5 OF nuevoeleme do form poscheques
ON BAR 6 OF nuevoeleme ACTIVATE POPUP confirmaci
ON SELECTION BAR 7 OF nuevoeleme do form chequesind
ON SELECTION BAR 9 OF nuevoeleme do form retenreci
ON SELECTION BAR 11 OF nuevoeleme do form rutas
ON SELECTION BAR 12 OF nuevoeleme do form rutdis

DEFINE POPUP confirmaci MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF confirmaci PROMPT "Individual"
DEFINE BAR 2 OF confirmaci PROMPT "Solo Confirmacion Por fechas"
DEFINE BAR 3 OF confirmaci PROMPT "Conf. o Desconf Por fechas"
ON SELECTION BAR 1 OF confirmaci do form confirche
ON SELECTION BAR 2 OF confirmaci do form confirche2
ON SELECTION BAR 3 OF confirmaci do form confirche3

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Por Cliente"
DEFINE BAR 2 OF reportes PROMPT "\-"
DEFINE BAR 3 OF reportes PROMPT "Caja-Credito"
DEFINE BAR 4 OF reportes PROMPT "\-"
DEFINE BAR 5 OF reportes PROMPT "Por Items"
DEFINE BAR 6 OF reportes PROMPT "\-"
DEFINE BAR 7 OF reportes PROMPT "Por Transacción"
DEFINE BAR 8 OF reportes PROMPT "\-"
DEFINE BAR 9 OF reportes PROMPT "Ventas por Vendedor"
DEFINE BAR 10 OF reportes PROMPT "\-"
DEFINE BAR 11 OF reportes PROMPT "Configuracion de  Reportes"
ON BAR 1 OF reportes ACTIVATE POPUP porcliente
ON BAR 3 OF reportes ACTIVATE POPUP cajacredit
ON BAR 5 OF reportes ACTIVATE POPUP poritems
ON BAR 7 OF reportes ACTIVATE POPUP portransac
ON BAR 9 OF reportes ACTIVATE POPUP ventasporv
ON SELECTION BAR 11 OF reportes do form fac0308

DEFINE POPUP porcliente MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porcliente PROMPT "Principales"
DEFINE BAR 2 OF porcliente PROMPT "Ventas"
DEFINE BAR 3 OF porcliente PROMPT "Historico"
DEFINE BAR 4 OF porcliente PROMPT "Estado de Cuenta"
DEFINE BAR 5 OF porcliente PROMPT "Cheques No registrados"
DEFINE BAR 6 OF porcliente PROMPT "Cheques"
DEFINE BAR 7 OF porcliente PROMPT "Cheques Depositados"
DEFINE BAR 8 OF porcliente PROMPT "Cheques por Vecimiento"
DEFINE BAR 9 OF porcliente PROMPT "Ultimas Transacciones"
DEFINE BAR 10 OF porcliente PROMPT "Por Documento"
DEFINE BAR 11 OF porcliente PROMPT "Saldos con Intereses"
DEFINE BAR 12 OF porcliente PROMPT "Saldos Iniciales"
DEFINE BAR 13 OF porcliente PROMPT "Por Montos"
ON SELECTION BAR 1 OF porcliente do form impprin
ON SELECTION BAR 2 OF porcliente do form fac0301
ON SELECTION BAR 3 OF porcliente do form fac0304
ON SELECTION BAR 4 OF porcliente do form con0111
ON SELECTION BAR 5 OF porcliente do form fac0312a
ON SELECTION BAR 6 OF porcliente do form fac0312
ON SELECTION BAR 7 OF porcliente do form chedepo
ON SELECTION BAR 8 OF porcliente do form checliven
ON SELECTION BAR 9 OF porcliente do form fac0320
ON SELECTION BAR 10 OF porcliente do form fac0305
ON SELECTION BAR 11 OF porcliente do form fac0322
ON SELECTION BAR 12 OF porcliente do form fac0324
ON SELECTION BAR 13 OF porcliente do form fac0326

DEFINE POPUP cajacredit MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF cajacredit PROMPT "Detalle de Cancelaciones"
DEFINE BAR 2 OF cajacredit PROMPT "Ingresos-Egresos (det canc)"
DEFINE BAR 3 OF cajacredit PROMPT "Ingresos y Egresos (Caja)"
DEFINE BAR 4 OF cajacredit PROMPT "Detalle de Pagos Grupo"
DEFINE BAR 5 OF cajacredit PROMPT "\-"
DEFINE BAR 6 OF cajacredit PROMPT "Pagos Descuadrados"
ON SELECTION BAR 1 OF cajacredit do form fac0311c
ON SELECTION BAR 2 OF cajacredit do form fac0311
ON SELECTION BAR 3 OF cajacredit do form fac0311a
ON SELECTION BAR 4 OF cajacredit do form  fac0319
ON SELECTION BAR 6 OF cajacredit do form fac0323

DEFINE POPUP poritems MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF poritems PROMPT "Documentos Por Items"
DEFINE BAR 2 OF poritems PROMPT "Ventas por Items"
DEFINE BAR 3 OF poritems PROMPT "Rentabilidad"
DEFINE BAR 4 OF poritems PROMPT "Por Grupos y Supgrupos"
DEFINE BAR 5 OF poritems PROMPT "Articulos No Registrados"
ON SELECTION BAR 1 OF poritems do form fac0302
ON SELECTION BAR 2 OF poritems do form fac0315
ON SELECTION BAR 3 OF poritems do form fac0317
ON SELECTION BAR 4 OF poritems do form fac0701
ON SELECTION BAR 5 OF poritems do form fac0327

DEFINE POPUP portransac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF portransac PROMPT "Secuencial"
DEFINE BAR 2 OF portransac PROMPT "Montos Totales"
DEFINE BAR 3 OF portransac PROMPT "Montos Totales (Grupos Doc)"
DEFINE BAR 4 OF portransac PROMPT "Montos Totales Recaudacion"
DEFINE BAR 5 OF portransac PROMPT "Montos Totales Recaudacion por Cta"
DEFINE BAR 6 OF portransac PROMPT "Montos Totales Recaudacion Varios Clientes"
DEFINE BAR 7 OF portransac PROMPT "Resumen Por Mes"
DEFINE BAR 8 OF portransac PROMPT "Retenciones Recibidas"
DEFINE BAR 9 OF portransac PROMPT "Por Vencimiento"
ON SELECTION BAR 1 OF portransac do form fac0307
ON SELECTION BAR 2 OF portransac do form fac0303
ON SELECTION BAR 3 OF portransac do form fac0303a
ON SELECTION BAR 4 OF portransac do form fac0303c
ON SELECTION BAR 5 OF portransac do form fac0303e
ON BAR 6 OF portransac ACTIVATE POPUP montostota
ON SELECTION BAR 7 OF portransac do form fac0316
ON SELECTION BAR 8 OF portransac do form retenfac
ON BAR 9 OF portransac ACTIVATE POPUP porfechade

DEFINE POPUP montostota MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF montostota PROMPT "Normal"
DEFINE BAR 2 OF montostota PROMPT "Inicial y actual"
ON SELECTION BAR 1 OF montostota do form fac0303f
ON SELECTION BAR 2 OF montostota do form fac0303g

DEFINE POPUP porfechade MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porfechade PROMPT "Por Fechas"
DEFINE BAR 2 OF porfechade PROMPT "Varias Cuentas"
DEFINE BAR 3 OF porfechade PROMPT "Resumen"
DEFINE BAR 4 OF porfechade PROMPT "Vencidos y Por Vencer"
ON SELECTION BAR 1 OF porfechade do form fac0310
ON SELECTION BAR 2 OF porfechade do form fac0310a
ON SELECTION BAR 3 OF porfechade do form fac0310b
ON SELECTION BAR 4 OF porfechade do form fac0310c

DEFINE POPUP ventasporv MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventasporv PROMPT "Por Ventas"
DEFINE BAR 2 OF ventasporv PROMPT "Por Recaudacion"
DEFINE BAR 3 OF ventasporv PROMPT "Por Linea"
DEFINE BAR 4 OF ventasporv PROMPT "\-"
DEFINE BAR 5 OF ventasporv PROMPT "Guias"
DEFINE BAR 6 OF ventasporv PROMPT "Documentos"
DEFINE BAR 7 OF ventasporv PROMPT "\-"
DEFINE BAR 8 OF ventasporv PROMPT "Vendedores por Rutas"
DEFINE BAR 9 OF ventasporv PROMPT "Rutas de Venta No Asignadas"
DEFINE BAR 10 OF ventasporv PROMPT "\-"
DEFINE BAR 11 OF ventasporv PROMPT "Rutas de Distribucion"
DEFINE BAR 12 OF ventasporv PROMPT "Rutas de Dist. No asignadas"
ON SELECTION BAR 1 OF ventasporv do form fac0309
ON SELECTION BAR 2 OF ventasporv do form fac0309e
ON SELECTION BAR 3 OF ventasporv do form fac0309d
ON SELECTION BAR 5 OF ventasporv do form inv0602b
ON SELECTION BAR 6 OF ventasporv do form fac0309g
ON SELECTION BAR 8 OF ventasporv do form fac0309f
ON SELECTION BAR 9 OF ventasporv do form fac0309j
ON SELECTION BAR 11 OF ventasporv do form fac0309h
ON SELECTION BAR 12 OF ventasporv do form fac0309i

DEFINE POPUP ncynd MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ncynd PROMPT "Nota de Credito o Debito (Clientes Devoluciones)"
DEFINE BAR 2 OF ncynd PROMPT "Nota de Credito o Debito (Descuentos)"
DEFINE BAR 3 OF ncynd PROMPT "\-"
DEFINE BAR 4 OF ncynd PROMPT "Nota de Credito o Debito (Clientes Devoluciones SR"
DEFINE BAR 5 OF ncynd PROMPT "Nota de Credito o Debito (Descuentos SR.)"
ON SELECTION BAR 1 OF ncynd do form fac0401
ON SELECTION BAR 2 OF ncynd do form fac0402
ON SELECTION BAR 4 OF ncynd do form fac0401a
ON SELECTION BAR 5 OF ncynd do form fac0402a

DEFINE POPUP bancos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF bancos PROMPT "Cuentas Por Cobrar"
DEFINE BAR 2 OF bancos PROMPT "\-"
DEFINE BAR 3 OF bancos PROMPT "Cancelación de Saldos Iniciales"
DEFINE BAR 4 OF bancos PROMPT "Cancelación de Saldos Iniciales Confirmados"
DEFINE BAR 5 OF bancos PROMPT "Otros Ingresos"
DEFINE BAR 6 OF bancos PROMPT "Transferencia Caja"
DEFINE BAR 7 OF bancos PROMPT "Ingresos Det. Sujetos"
DEFINE BAR 8 OF bancos PROMPT "Depositos Bancarios (Caja)"
DEFINE BAR 9 OF bancos PROMPT "Depositos Bancarios (Cheques Clientes)"
DEFINE BAR 10 OF bancos PROMPT "\-"
DEFINE BAR 11 OF bancos PROMPT "Liquidaciones"
DEFINE BAR 12 OF bancos PROMPT "\-"
DEFINE BAR 13 OF bancos PROMPT "Consulta de Saldos Clientes"
ON SELECTION BAR 1 OF bancos do form ban0101
ON SELECTION BAR 3 OF bancos do form ban0104
ON SELECTION BAR 4 OF bancos do form ban0104a
ON SELECTION BAR 5 OF bancos do form ban0102
ON SELECTION BAR 6 OF bancos do form ban0102a
ON SELECTION BAR 7 OF bancos do form ban0105
ON SELECTION BAR 8 OF bancos do form ban0103
ON SELECTION BAR 9 OF bancos do form ban0108
ON SELECTION BAR 11 OF bancos do form fac0112
ON SELECTION BAR 13 OF bancos do form ban0110

DEFINE POPUP impresiónd MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF impresiónd PROMPT "Activar Impresión de Documentos"
DEFINE BAR 2 OF impresiónd PROMPT "Desactivar Impresión de Doc. Ventas"
ON SELECTION BAR 1 OF impresiónd do form actimpdoc
ON SELECTION BAR 2 OF impresiónd ;
	DO _3eu0mio15 ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Cancelación"
DEFINE BAR 2 OF documentos PROMPT "Cancelación Saldos Iniciales"
DEFINE BAR 3 OF documentos PROMPT "Documento Bancario"
DEFINE BAR 4 OF documentos PROMPT "Contabilización"
DEFINE BAR 5 OF documentos PROMPT "\-"
DEFINE BAR 6 OF documentos PROMPT "Autorización"
DEFINE BAR 7 OF documentos PROMPT "Anulación"
DEFINE BAR 8 OF documentos PROMPT "\-"
DEFINE BAR 9 OF documentos PROMPT "Consulta"
DEFINE BAR 10 OF documentos PROMPT "Historial"
DEFINE BAR 11 OF documentos PROMPT "\-"
DEFINE BAR 12 OF documentos PROMPT "Corrección"
DEFINE BAR 13 OF documentos PROMPT "Costos de Ventas"
DEFINE BAR 14 OF documentos PROMPT "\-"
DEFINE BAR 15 OF documentos PROMPT "Consulta de Saldos"
ON SELECTION BAR 1 OF documentos do form adq0701b
ON SELECTION BAR 2 OF documentos do form saldoini
ON SELECTION BAR 3 OF documentos do form adq0702b
ON SELECTION BAR 4 OF documentos do form adq0703b
ON SELECTION BAR 6 OF documentos do form adq0707
ON SELECTION BAR 7 OF documentos do form adq0704
ON SELECTION BAR 9 OF documentos do form adq0705b
ON SELECTION BAR 10 OF documentos do form historial
ON SELECTION BAR 12 OF documentos do form adq0706
ON SELECTION BAR 13 OF documentos do form costoven
ON SELECTION BAR 15 OF documentos do form ban0110

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el Sistema"
ON SELECTION BAR 1 OF salir ;
	DO _3eu0mio1p ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")
ON SELECTION BAR 2 OF salir ;
	DO _3eu0mio1q ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _3EU0MIO15  ON SELECTION BAR 2 OF POPUP impresiónd      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  160        
*       * Called By:  ON SELECTION BAR 2 OF POPUP impresiónd      
*       * Prompt:     Desactivar Impresión de Doc. Ventas         
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3eu0mio15
if type('_screen.objimp')='O'
	_screen.removeobject('objimp')
endif


*       *********************************************************
*       *                                                         
*       * _3EU0MIO1P  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  181        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3eu0mio1p
do while type('_screen.activeform')='O'
	_screen.activeform.release
enddo	

if used('ACCESOS') then
	sele accesos
	use
endif

deactivate menu _msysmenu
clea even
clea read
return


*       *********************************************************
*       *                                                         
*       * _3EU0MIO1Q  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  182        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el Sistema                        
*       * Snippet:    3                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3eu0mio1q
deactivate menu _msysmenu
clea even
clea read
final=1
return

