*       *********************************************************
*       *                                                         
*       * 13/07/2005            MENUDOC.PRG             14:31:09  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2005 Nombre de compañía                   
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

DEFINE PAD _1kd0v4jv2 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _1kd0v4jv3 OF _MSYSMENU PROMPT "Re-Impresiones" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _1kd0v4jv4 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _1kd0v4jv2 OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _1kd0v4jv3 OF _MSYSMENU ACTIVATE POPUP reimpresio
ON PAD _1kd0v4jv4 OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Compras"
DEFINE BAR 2 OF documentos PROMPT "Ventas"
DEFINE BAR 3 OF documentos PROMPT "Pago de Utilidades"
DEFINE BAR 4 OF documentos PROMPT "Registro de Utilidades"

DEFINE POPUP reimpresio MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reimpresio PROMPT "Compra"
DEFINE BAR 2 OF reimpresio PROMPT "Venta"
DEFINE BAR 3 OF reimpresio PROMPT "Compra Asiento"
DEFINE BAR 4 OF reimpresio PROMPT "Venta Asiento"
DEFINE BAR 5 OF reimpresio PROMPT "Secuencial Documento"

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresal al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _1kd0v4jv5 ;
	IN LOCFILE("PROG\MENUDOC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUDOC?")
ON SELECTION BAR 2 OF salir ;
	DO _1kd0v4jva ;
	IN LOCFILE("PROG\MENUDOC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUDOC?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _1KD0V4JV5  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUDOC.PRG,            Record:   18        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresal al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1kd0v4jv5
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
*       * _1KD0V4JVA  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUDOC.PRG,            Record:   19        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1kd0v4jva
deactivate menu _msysmenu
clea even
clea read
final=1
return

