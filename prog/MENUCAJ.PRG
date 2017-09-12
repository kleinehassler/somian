*       *********************************************************
*       *                                                         
*       * 07/07/2011            MENUCAJ.PRG             15:08:13  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2011 Nombre de compañía                   
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

DEFINE PAD _39d0wfzfw OF _MSYSMENU PROMPT "Ventas" COLOR SCHEME 3 ;
	KEY ALT+V, ""
DEFINE PAD _39d0wfzfx OF _MSYSMENU PROMPT "Movimientos" COLOR SCHEME 3 ;
	KEY ALT+M, ""
DEFINE PAD _39d0wfzfy OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _39d0wfzfz OF _MSYSMENU PROMPT "Configuracion" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _39d0wfzg0 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _39d0wfzg1 OF _MSYSMENU PROMPT "Impresion" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _39d0wfzg2 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _39d0wfzfw OF _MSYSMENU ACTIVATE POPUP ventas
ON PAD _39d0wfzfx OF _MSYSMENU ACTIVATE POPUP movimiento
ON PAD _39d0wfzfy OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _39d0wfzfz OF _MSYSMENU ACTIVATE POPUP configurac
ON PAD _39d0wfzg0 OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _39d0wfzg1 OF _MSYSMENU ACTIVATE POPUP _2u51edjuu
ON PAD _39d0wfzg2 OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP ventas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF ventas PROMPT "Cotizaciones"
DEFINE BAR 3 OF ventas PROMPT "Dco Generados"
DEFINE BAR 4 OF ventas PROMPT "\-"
DEFINE BAR 5 OF ventas PROMPT "Devoluciones"
DEFINE BAR 6 OF ventas PROMPT "\-"
DEFINE BAR 7 OF ventas PROMPT "Cheques Ventas"
DEFINE BAR 8 OF ventas PROMPT "\-"
DEFINE BAR 9 OF ventas PROMPT "Consulta de Items"
DEFINE BAR 10 OF ventas PROMPT "Ingreso de precios"
ON SELECTION BAR 1 OF ventas do form fac0101
ON SELECTION BAR 2 OF ventas do form fac0103
ON SELECTION BAR 3 OF ventas do form fac0101b
ON SELECTION BAR 5 OF ventas do form fac0401
ON SELECTION BAR 7 OF ventas do form  cheques
ON SELECTION BAR 9 OF ventas do form fac0109a
ON SELECTION BAR 10 OF ventas do form inv0109e

DEFINE POPUP movimiento MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF movimiento PROMPT "Ingreso Productos"
ON SELECTION BAR 1 OF movimiento do form inv0401

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Detalle de Cancelaciones"
DEFINE BAR 2 OF reportes PROMPT "Ingresos-Egresos (det canc)"
DEFINE BAR 3 OF reportes PROMPT "Movimiento Cta. Caja"
DEFINE BAR 4 OF reportes PROMPT "Doc. No Contabilizados"
DEFINE BAR 5 OF reportes PROMPT "Montos Totales"
DEFINE BAR 6 OF reportes PROMPT "\-"
DEFINE BAR 7 OF reportes PROMPT "Resumen por tipo"
DEFINE BAR 8 OF reportes PROMPT "Movimiento Productos"
ON SELECTION BAR 1 OF reportes do form fac0311c
ON SELECTION BAR 2 OF reportes do form fac0311
ON SELECTION BAR 3 OF reportes do form fac0311a
ON SELECTION BAR 4 OF reportes do form con0115
ON SELECTION BAR 5 OF reportes do form fac0303
ON SELECTION BAR 7 OF reportes do form inv0603
ON SELECTION BAR 8 OF reportes do form inv0601c

DEFINE POPUP configurac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF configurac PROMPT "Apariencia"
DEFINE BAR 2 OF configurac PROMPT "Cambiar Clave"
DEFINE BAR 3 OF configurac PROMPT "\-"
DEFINE BAR 4 OF configurac PROMPT "Consulta"
ON SELECTION BAR 1 OF configurac do form set0403
ON SELECTION BAR 2 OF configurac do form set0401
ON SELECTION BAR 4 OF configurac do form adq0705b

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Consulta"
DEFINE BAR 2 OF documentos PROMPT "\-"
DEFINE BAR 3 OF documentos PROMPT "Anulacion"
ON SELECTION BAR 1 OF documentos do form adq0705b
ON SELECTION BAR 3 OF documentos do form adq0704

DEFINE POPUP _2u51edjuu MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _2u51edjuu PROMPT "Activar Impresión de Documentos"
DEFINE BAR 2 OF _2u51edjuu PROMPT "Desactivar Impresión de Doc. Ventas"
ON SELECTION BAR 1 OF _2u51edjuu *do form actimpdoc
ON SELECTION BAR 2 OF _2u51edjuu ;
	DO _39d0wfzg3 ;
	IN LOCFILE("PROG\MENUCAJ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCAJ?")

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _39d0wfzg4 ;
	IN LOCFILE("PROG\MENUCAJ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCAJ?")
ON SELECTION BAR 2 OF salir ;
	DO _39d0wfzg5 ;
	IN LOCFILE("PROG\MENUCAJ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCAJ?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _39D0WFZG3  ON SELECTION BAR 2 OF POPUP _2u51edjuu      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCAJ.PRG,            Record:   48        
*       * Called By:  ON SELECTION BAR 2 OF POPUP _2u51edjuu      
*       * Prompt:     Desactivar Impresión de Doc. Ventas         
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _39d0wfzg3
if type('_screen.objimp')='O'
	_screen.removeobject('objimp')
endif


*       *********************************************************
*       *                                                         
*       * _39D0WFZG4  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCAJ.PRG,            Record:   51        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _39d0wfzg4
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
*       * _39D0WFZG5  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCAJ.PRG,            Record:   52        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    3                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _39d0wfzg5
deactivate menu _msysmenu
clea even
clea read
final=1
return

