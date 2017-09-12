*       *********************************************************
*       *                                                         
*       * 13/07/2005            MENUREC.PRG             14:32:14  
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

DEFINE PAD _1kd0v5xla OF _MSYSMENU PROMPT "Opciones Generales" COLOR SCHEME 3 ;
	KEY ALT+O, ""
DEFINE PAD _1kd0v5xlb OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _1kd0v5xla OF _MSYSMENU ACTIVATE POPUP opcionesge
ON PAD _1kd0v5xlb OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP opcionesge MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF opcionesge PROMPT "Empleados"
DEFINE BAR 2 OF opcionesge PROMPT "Observaciones"
DEFINE BAR 3 OF opcionesge PROMPT "Imp. Observaciones por Empleado"
DEFINE BAR 4 OF opcionesge PROMPT "Imp. Observaciones por Tipo"

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _1kd0v5xlc ;
	IN LOCFILE("PROG\MENUREC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUREC?")
ON SELECTION BAR 2 OF salir ;
	DO _1kd0v5xlg ;
	IN LOCFILE("PROG\MENUREC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUREC?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _1KD0V5XLC  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUREC.PRG,            Record:   11        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1kd0v5xlc
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
*       * _1KD0V5XLG  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUREC.PRG,            Record:   12        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1kd0v5xlg
for i=1 to 15
	release windows
endfor
deactivate menu _msysmenu
clea even
clea read
final=1
return

