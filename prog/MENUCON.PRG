*       *********************************************************
*       *                                                         
*       * 16/01/2012            MENUCON.PRG             16:11:14  
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

DEFINE PAD _3es0yp120 OF _MSYSMENU PROMPT "Plan de Cuentas" COLOR SCHEME 3 ;
	KEY ALT+P, ""
DEFINE PAD _3es0yp121 OF _MSYSMENU PROMPT "Saldos Iniciales" COLOR SCHEME 3 ;
	KEY ALT+S, ""
DEFINE PAD _3es0yp122 OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _3es0yp123 OF _MSYSMENU PROMPT "Ajustes" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _3es0yp124 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _3es0yp125 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _3es0yp120 OF _MSYSMENU ACTIVATE POPUP plandecuen
ON PAD _3es0yp121 OF _MSYSMENU ACTIVATE POPUP _2gc0q3cdj
ON PAD _3es0yp122 OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _3es0yp123 OF _MSYSMENU ACTIVATE POPUP ajustes
ON PAD _3es0yp124 OF _MSYSMENU ACTIVATE POPUP _1s110jpeh
ON PAD _3es0yp125 OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP plandecuen MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF plandecuen PROMPT "Edición del Plan de Cuentas"
ON SELECTION BAR 1 OF plandecuen do form con0201

DEFINE POPUP _2gc0q3cdj MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _2gc0q3cdj PROMPT "Importar Saldos  Periodo Anterior"
DEFINE BAR 2 OF _2gc0q3cdj PROMPT "Importar detalle de Saldos Periodo anterior"
DEFINE BAR 3 OF _2gc0q3cdj PROMPT "\-"
DEFINE BAR 4 OF _2gc0q3cdj PROMPT "Edicion"
DEFINE BAR 5 OF _2gc0q3cdj PROMPT "Edicion detalle"
DEFINE BAR 6 OF _2gc0q3cdj PROMPT "Actualizar Saldos Iniciales"
DEFINE BAR 7 OF _2gc0q3cdj PROMPT "Borrar saldos"
DEFINE BAR 8 OF _2gc0q3cdj PROMPT "Cuadrar Saldos Iniciales"
DEFINE BAR 9 OF _2gc0q3cdj PROMPT "Contabilizar Cheques de Clientes"
DEFINE BAR 10 OF _2gc0q3cdj PROMPT "\-"
DEFINE BAR 11 OF _2gc0q3cdj PROMPT "Generar Archivo de Saldos Prox Periodo"
DEFINE BAR 12 OF _2gc0q3cdj PROMPT "Generar Detalle de Saldos Iniciales Prox Periodo"
ON SELECTION BAR 1 OF _2gc0q3cdj do form con0204a
ON SELECTION BAR 2 OF _2gc0q3cdj do form con0207a
ON BAR 4 OF _2gc0q3cdj ACTIVATE POPUP edicion
ON SELECTION BAR 5 OF _2gc0q3cdj do form con0206
ON SELECTION BAR 6 OF _2gc0q3cdj do form con0206a
ON SELECTION BAR 7 OF _2gc0q3cdj do form con0205
ON SELECTION BAR 8 OF _2gc0q3cdj do form con0212
ON SELECTION BAR 9 OF _2gc0q3cdj do form fac0210
ON SELECTION BAR 11 OF _2gc0q3cdj do form con0204
ON SELECTION BAR 12 OF _2gc0q3cdj do form con0207

DEFINE POPUP edicion MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF edicion PROMPT "Por Lista"
DEFINE BAR 2 OF edicion PROMPT "Por codigo"
ON SELECTION BAR 1 OF edicion do form con0203
ON SELECTION BAR 2 OF edicion do form con0203a

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Cuentas Contables"
DEFINE BAR 2 OF reportes PROMPT "Balances"
DEFINE BAR 3 OF reportes PROMPT "Documentos"
DEFINE BAR 4 OF reportes PROMPT "\-"
DEFINE BAR 5 OF reportes PROMPT "Detalle Saldos Iniciales"
DEFINE BAR 6 OF reportes PROMPT "Estado de Cuenta Sujetos"
DEFINE BAR 7 OF reportes PROMPT "Costo De Ventas"
DEFINE BAR 8 OF reportes PROMPT "\-"
DEFINE BAR 9 OF reportes PROMPT "Verificacion de Contabilizacion"
DEFINE BAR 10 OF reportes PROMPT "\-"
DEFINE BAR 11 OF reportes PROMPT "Borrar Resultado del Ejercicio"
ON BAR 1 OF reportes ACTIVATE POPUP cuentascon
ON BAR 2 OF reportes ACTIVATE POPUP balances
ON BAR 3 OF reportes ACTIVATE POPUP nuevoeleme
ON BAR 5 OF reportes ACTIVATE POPUP detallesal
ON BAR 6 OF reportes ACTIVATE POPUP estadodecu
ON SELECTION BAR 7 OF reportes do form con0113
ON SELECTION BAR 9 OF reportes do form verificacont
ON SELECTION BAR 11 OF reportes do form borreseje

DEFINE POPUP cuentascon MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF cuentascon PROMPT "Plan de cuentas"
DEFINE BAR 2 OF cuentascon PROMPT "Detalle de Auxiliar de Cuenta"
DEFINE BAR 3 OF cuentascon PROMPT "Cuentas Pendientes del Ejercicio"
DEFINE BAR 4 OF cuentascon PROMPT "Historico detallado de una Cuenta Resumen"
DEFINE BAR 5 OF cuentascon PROMPT "Historico detallado de una Cuenta Cajero"
DEFINE BAR 6 OF cuentascon PROMPT "Historico Detallado de una Cuenta"
DEFINE BAR 7 OF cuentascon PROMPT "Saldos Deudores y Acreedores"
DEFINE BAR 8 OF cuentascon PROMPT "Resumen Ciertas Cuentas"
DEFINE BAR 9 OF cuentascon PROMPT "Resumen Ciertas Ctas Detalle"
ON SELECTION BAR 1 OF cuentascon do form con0101
ON SELECTION BAR 2 OF cuentascon do form con0103
ON SELECTION BAR 3 OF cuentascon do form con0104
ON SELECTION BAR 4 OF cuentascon do form con0110
ON SELECTION BAR 5 OF cuentascon do form con0110a
ON SELECTION BAR 6 OF cuentascon do form fac0311b
ON SELECTION BAR 7 OF cuentascon do form con0105
ON SELECTION BAR 8 OF cuentascon do form con0114
ON SELECTION BAR 9 OF cuentascon do form con0114a

DEFINE POPUP balances MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF balances PROMPT "Comprobación"
DEFINE BAR 2 OF balances PROMPT "Comprobacion por sujeto"
DEFINE BAR 3 OF balances PROMPT "Sumas y Saldos"
DEFINE BAR 4 OF balances PROMPT "General"
DEFINE BAR 5 OF balances PROMPT "General por Periodos"
DEFINE BAR 6 OF balances PROMPT "Estado de Perdidas y Ganancias"
DEFINE BAR 7 OF balances PROMPT "Estado de Perdidas y Ganancias por Periodo"
DEFINE BAR 8 OF balances PROMPT "Balance Inicial"
ON SELECTION BAR 1 OF balances do form con0106
ON SELECTION BAR 2 OF balances do form con0106a
ON SELECTION BAR 3 OF balances do form con0107
ON SELECTION BAR 4 OF balances do form con0108
ON SELECTION BAR 5 OF balances do form con0108a
ON SELECTION BAR 6 OF balances do form con0109
ON SELECTION BAR 7 OF balances do form con0109a
ON SELECTION BAR 8 OF balances do form con0118

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "En Orden Secuencia"
DEFINE BAR 2 OF nuevoeleme PROMPT "Doc Bines-Servicios"
DEFINE BAR 3 OF nuevoeleme PROMPT "Monto Totales (grupo doc)"
DEFINE BAR 4 OF nuevoeleme PROMPT "Documentos no Contabiilizados"
DEFINE BAR 5 OF nuevoeleme PROMPT "Secuencial de Asientos"
DEFINE BAR 6 OF nuevoeleme PROMPT "Resumen de Asientos Contables"
DEFINE BAR 7 OF nuevoeleme PROMPT "Doc. Descuadrados"
ON SELECTION BAR 1 OF nuevoeleme do form con0102
ON SELECTION BAR 2 OF nuevoeleme do form con0112
ON SELECTION BAR 3 OF nuevoeleme do form fac0303a
ON SELECTION BAR 4 OF nuevoeleme do form con0115
ON SELECTION BAR 5 OF nuevoeleme do form con0116
ON SELECTION BAR 6 OF nuevoeleme do form con0116a
ON SELECTION BAR 7 OF nuevoeleme do form con0117

DEFINE POPUP detallesal MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF detallesal PROMPT "Por cuenta"
DEFINE BAR 2 OF detallesal PROMPT "Detalle de Pagos"
DEFINE BAR 3 OF detallesal PROMPT "Descuadrados"
DEFINE BAR 4 OF detallesal PROMPT "No registrados"
ON SELECTION BAR 1 OF detallesal do form con0208
ON SELECTION BAR 2 OF detallesal do form con0209
ON SELECTION BAR 3 OF detallesal do form con0210
ON SELECTION BAR 4 OF detallesal do form con0211

DEFINE POPUP estadodecu MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF estadodecu PROMPT "Normal"
DEFINE BAR 2 OF estadodecu PROMPT "Det Saldos Inic."
ON SELECTION BAR 1 OF estadodecu do form con0111
ON SELECTION BAR 2 OF estadodecu do form con0111a

DEFINE POPUP ajustes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ajustes PROMPT "Transferencia de Valores Caja"
DEFINE BAR 2 OF ajustes PROMPT "Prestamos Socios"
DEFINE BAR 3 OF ajustes PROMPT "Transf. de Valores Ctas. Por Pagar"
DEFINE BAR 4 OF ajustes PROMPT "Varios"
DEFINE BAR 5 OF ajustes PROMPT "Varios Det. Sujetos"
DEFINE BAR 6 OF ajustes PROMPT "Varios Det. Items"
DEFINE BAR 7 OF ajustes PROMPT "Ingresos/Egresos"
DEFINE BAR 8 OF ajustes PROMPT "Liquidaciones"
ON SELECTION BAR 1 OF ajustes do form con0302
ON SELECTION BAR 2 OF ajustes do form con0303
ON SELECTION BAR 3 OF ajustes do form con0304
ON SELECTION BAR 4 OF ajustes do form con0305
ON BAR 5 OF ajustes ACTIVATE POPUP variosdets
ON BAR 6 OF ajustes ACTIVATE POPUP variosdeti
ON SELECTION BAR 7 OF ajustes do form con0308
ON SELECTION BAR 8 OF ajustes do form con0309

DEFINE POPUP variosdets MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF variosdets PROMPT "Por Cuenta Contable"
DEFINE BAR 2 OF variosdets PROMPT "Por Valor"
ON SELECTION BAR 1 OF variosdets do form con0306
ON SELECTION BAR 2 OF variosdets do form con0306b

DEFINE POPUP variosdeti MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF variosdeti PROMPT "Por Cuentas"
DEFINE BAR 2 OF variosdeti PROMPT "Por Valor"
ON SELECTION BAR 1 OF variosdeti do form con0307a
ON SELECTION BAR 2 OF variosdeti do form con0307b

DEFINE POPUP _1s110jpeh MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1s110jpeh PROMPT "Cerrar doc - Forma de Pago"
DEFINE BAR 2 OF _1s110jpeh PROMPT "Doc. Bancario"
DEFINE BAR 3 OF _1s110jpeh PROMPT "Contabilizacion"
DEFINE BAR 4 OF _1s110jpeh PROMPT "\-"
DEFINE BAR 5 OF _1s110jpeh PROMPT "Correccion"
DEFINE BAR 6 OF _1s110jpeh PROMPT "Anulacion"
DEFINE BAR 7 OF _1s110jpeh PROMPT "\-"
DEFINE BAR 8 OF _1s110jpeh PROMPT "Consulta"
ON SELECTION BAR 1 OF _1s110jpeh do form adq0701b
ON SELECTION BAR 2 OF _1s110jpeh do form adq0702b
ON BAR 3 OF _1s110jpeh ACTIVATE POPUP contabiliz
ON SELECTION BAR 5 OF _1s110jpeh do form adq0706
ON SELECTION BAR 6 OF _1s110jpeh do form adq0704
ON SELECTION BAR 8 OF _1s110jpeh do form adq0705b

DEFINE POPUP contabiliz MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF contabiliz PROMPT "Individual Detallada"
DEFINE BAR 2 OF contabiliz PROMPT "Por Grupos"
DEFINE BAR 3 OF contabiliz PROMPT "Individual"
DEFINE BAR 4 OF contabiliz PROMPT "Ajustes Contables"
ON SELECTION BAR 1 OF contabiliz do form adq0703b
ON SELECTION BAR 2 OF contabiliz do form contadoc
ON SELECTION BAR 3 OF contabiliz do form adq0703c
ON SELECTION BAR 4 OF contabiliz do form adq0703d

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresal al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _3es0yp12w ;
	IN LOCFILE("PROG\MENUCON" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCON?")
ON SELECTION BAR 2 OF salir ;
	DO _3es0yp13f ;
	IN LOCFILE("PROG\MENUCON" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCON?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _3ES0YP12W  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCON.PRG,            Record:  111        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresal al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3es0yp12w
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
*       * _3ES0YP13F  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCON.PRG,            Record:  112        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3es0yp13f
deactivate menu _msysmenu
clea even
clea read
final=1
return

