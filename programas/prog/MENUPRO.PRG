*       *********************************************************
*       *                                                         
*       * 29/08/2005            MENUPRO.PRG             16:58:41  
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

DEFINE PAD _1lo10e1io OF _MSYSMENU PROMPT "Agua Y Bebidas" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _1lo10e1ip OF _MSYSMENU PROMPT "Mantenimientos" COLOR SCHEME 3 ;
	KEY ALT+M, ""
DEFINE PAD _1lo10e1iq OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _1lo10e1io OF _MSYSMENU ACTIVATE POPUP aguaybebid
ON PAD _1lo10e1ip OF _MSYSMENU ACTIVATE POPUP mantenimie
ON PAD _1lo10e1iq OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP aguaybebid MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF aguaybebid PROMPT "Datos Generales"
DEFINE BAR 2 OF aguaybebid PROMPT "Insumos"
DEFINE BAR 3 OF aguaybebid PROMPT "Mano de Obra"
DEFINE BAR 4 OF aguaybebid PROMPT "Otros Gastos"
ON SELECTION BAR 1 OF aguaybebid do form pro0101
ON BAR 4 OF aguaybebid ACTIVATE POPUP registrode

DEFINE POPUP registrode MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF registrode PROMPT "Agua"
DEFINE BAR 2 OF registrode PROMPT "Luz"
DEFINE BAR 3 OF registrode PROMPT "Depreciación"
DEFINE BAR 4 OF registrode PROMPT "Seguros"

DEFINE POPUP mantenimie MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF mantenimie PROMPT "Datos Generales"
DEFINE BAR 2 OF mantenimie PROMPT "Insumos"
DEFINE BAR 3 OF mantenimie PROMPT "Mano de Obra"
DEFINE BAR 4 OF mantenimie PROMPT "Otros Gastos"
ON BAR 4 OF mantenimie ACTIVATE POPUP compraasie

DEFINE POPUP compraasie MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF compraasie PROMPT "Agua"
DEFINE BAR 2 OF compraasie PROMPT "Luz"
DEFINE BAR 3 OF compraasie PROMPT "Seguros"

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresal al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _1lo10e1ir ;
	IN LOCFILE("PROG\MENUPRO" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUPRO?")
ON SELECTION BAR 2 OF salir ;
	DO _1lo10e1j3 ;
	IN LOCFILE("PROG\MENUPRO" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUPRO?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _1LO10E1IR  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUPRO.PRG,            Record:   26        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresal al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1lo10e1ir
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
*       * _1LO10E1J3  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUPRO.PRG,            Record:   27        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1lo10e1j3
deactivate menu _msysmenu
clea even
clea read
final=1
return

