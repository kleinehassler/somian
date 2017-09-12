*       *********************************************************
*       *                                                         
*       * 01/02/2012            MENUROL.PRG             13:17:04  
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

DEFINE PAD _3f80sh1dt OF _MSYSMENU PROMPT "Ingreso de Datos" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _3f80sh1du OF _MSYSMENU PROMPT "Registro Rol" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _3f80sh1dv OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _3f80sh1dw OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _3f80sh1dx OF _MSYSMENU PROMPT "Configuracion" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _3f80sh1dy OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _3f80sh1dt OF _MSYSMENU ACTIVATE POPUP ingresoded
ON PAD _3f80sh1du OF _MSYSMENU ACTIVATE POPUP registroro
ON PAD _3f80sh1dv OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _3f80sh1dw OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _3f80sh1dx OF _MSYSMENU ACTIVATE POPUP configurac
ON PAD _3f80sh1dy OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP ingresoded MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ingresoded PROMPT "Creación de Personas"
DEFINE BAR 2 OF ingresoded PROMPT "\-"
DEFINE BAR 3 OF ingresoded PROMPT "Cancelacion del Rol"
DEFINE BAR 4 OF ingresoded PROMPT "Contabilizacion del Rol"
DEFINE BAR 5 OF ingresoded PROMPT "\-"
DEFINE BAR 6 OF ingresoded PROMPT "Generar Rol"
DEFINE BAR 7 OF ingresoded PROMPT "Rol 2da Forma"
DEFINE BAR 8 OF ingresoded PROMPT "\-"
DEFINE BAR 9 OF ingresoded PROMPT "Liquidacion de Sueldo"
ON BAR 1 OF ingresoded ACTIVATE POPUP creaciónde
ON SELECTION BAR 3 OF ingresoded do form rol0105
ON SELECTION BAR 4 OF ingresoded do form rol0106
ON SELECTION BAR 6 OF ingresoded do form rol0104
ON SELECTION BAR 7 OF ingresoded do form rol0108
ON SELECTION BAR 9 OF ingresoded do form rol0107

DEFINE POPUP creaciónde MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF creaciónde PROMPT "Datos Generales"
DEFINE BAR 2 OF creaciónde PROMPT "Agregar Datos de Empleados"
ON SELECTION BAR 1 OF creaciónde do form adm0303
ON SELECTION BAR 2 OF creaciónde do form rol0101b

DEFINE POPUP registroro MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF registroro PROMPT "Anticipos/Haberes"
DEFINE BAR 2 OF registroro PROMPT "Anticipos Almacenes"
DEFINE BAR 3 OF registroro PROMPT "Quincena"
DEFINE BAR 4 OF registroro PROMPT "\-"
DEFINE BAR 5 OF registroro PROMPT "Multas/Descuentos"
DEFINE BAR 6 OF registroro PROMPT "\-"
DEFINE BAR 7 OF registroro PROMPT "Asistencia y Horas Extras"
DEFINE BAR 8 OF registroro PROMPT "Recalculo de Valor de Horas Extras"
DEFINE BAR 9 OF registroro PROMPT "Actividades Diarias en bananeras"
DEFINE BAR 10 OF registroro PROMPT "Feriados"
DEFINE BAR 11 OF registroro PROMPT "\-"
DEFINE BAR 12 OF registroro PROMPT "Cancelacion de Comisiones X Pagar"
ON SELECTION BAR 1 OF registroro do form rol0302
ON SELECTION BAR 2 OF registroro do form rol0302a
ON SELECTION BAR 3 OF registroro do form rol0303
ON SELECTION BAR 5 OF registroro do form rol0310
ON SELECTION BAR 7 OF registroro do form rol0315
ON SELECTION BAR 8 OF registroro do form rol0315a
ON SELECTION BAR 9 OF registroro do form rol0308
ON SELECTION BAR 10 OF registroro do form rol0316
ON SELECTION BAR 12 OF registroro do form rol0301

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Valor a Recibir"
DEFINE BAR 2 OF reportes PROMPT "Liquidacion de sueldo"
DEFINE BAR 3 OF reportes PROMPT "Resumen mensual"
DEFINE BAR 4 OF reportes PROMPT "Decimo XIII"
DEFINE BAR 5 OF reportes PROMPT "Acumulados"
DEFINE BAR 6 OF reportes PROMPT "Reporte por Rubros"
DEFINE BAR 7 OF reportes PROMPT "Nomina"
DEFINE BAR 8 OF reportes PROMPT "Actividades Diarias en Bananeras"
DEFINE BAR 9 OF reportes PROMPT "Horas Extras"
DEFINE BAR 10 OF reportes PROMPT "\-"
DEFINE BAR 11 OF reportes PROMPT "Montos Totales (Grupos Doc)"
DEFINE BAR 12 OF reportes PROMPT "Creditos de Terceros"
ON SELECTION BAR 1 OF reportes do form rol0401
ON SELECTION BAR 2 OF reportes do form rol0402
ON SELECTION BAR 3 OF reportes do form rol0403
ON SELECTION BAR 4 OF reportes do form rol0404
ON SELECTION BAR 5 OF reportes do form rol0405
ON SELECTION BAR 6 OF reportes do form rol0406
ON SELECTION BAR 7 OF reportes do form rol0408
ON SELECTION BAR 8 OF reportes do form rol0410
ON SELECTION BAR 9 OF reportes do form rol0420
ON SELECTION BAR 11 OF reportes do form fac0303a
ON SELECTION BAR 12 OF reportes do form rol0407

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Multiples Valores"
DEFINE BAR 2 OF documentos PROMPT "\-"
DEFINE BAR 3 OF documentos PROMPT "Forma de Pago/Cobro"
DEFINE BAR 4 OF documentos PROMPT "Documento Bancario"
DEFINE BAR 5 OF documentos PROMPT "Contabilización"
DEFINE BAR 6 OF documentos PROMPT "\-"
DEFINE BAR 7 OF documentos PROMPT "Correccion"
DEFINE BAR 8 OF documentos PROMPT "Anulación"
DEFINE BAR 9 OF documentos PROMPT "Consulta"
DEFINE BAR 10 OF documentos PROMPT "\-"
DEFINE BAR 11 OF documentos PROMPT "Conversion de Prestamos"
ON BAR 1 OF documentos ACTIVATE POPUP registrarm
ON SELECTION BAR 3 OF documentos do form adq0701b
ON SELECTION BAR 4 OF documentos do form adq0702b
ON SELECTION BAR 5 OF documentos do form adq0703b
ON SELECTION BAR 7 OF documentos do form adq0706
ON SELECTION BAR 8 OF documentos do form adq0704
ON SELECTION BAR 9 OF documentos do form adq0705b
ON SELECTION BAR 11 OF documentos do form tablamort

DEFINE POPUP registrarm MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF registrarm PROMPT "Registrar"
DEFINE BAR 2 OF registrarm PROMPT "Generar Individuales"
DEFINE BAR 3 OF registrarm PROMPT "Cancelar"
DEFINE BAR 4 OF registrarm PROMPT "Contabilizar"
DEFINE BAR 5 OF registrarm PROMPT "\-"
DEFINE BAR 6 OF registrarm PROMPT "Consultar"
ON SELECTION BAR 1 OF registrarm do form docmul
ON SELECTION BAR 2 OF registrarm do form genindi
ON SELECTION BAR 3 OF registrarm do form  cancdocm
ON SELECTION BAR 4 OF registrarm do form contdocm
ON SELECTION BAR 6 OF registrarm do form consdocm

DEFINE POPUP configurac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF configurac PROMPT "Rubros"
DEFINE BAR 2 OF configurac PROMPT "Contabilizacion de Rubros"
DEFINE BAR 3 OF configurac PROMPT "Turnos"
ON SELECTION BAR 1 OF configurac do form adm0101
ON SELECTION BAR 2 OF configurac do form rol0102
ON SELECTION BAR 3 OF configurac do form rol0103

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _3f80sh1ef ;
	IN LOCFILE("PROG\MENUROL" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUROL?")
ON SELECTION BAR 2 OF salir ;
	DO _3f80sh1eg ;
	IN LOCFILE("PROG\MENUROL" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUROL?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _3F80SH1EF  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUROL.PRG,            Record:   78        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3f80sh1ef
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
*       * _3F80SH1EG  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUROL.PRG,            Record:   79        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3f80sh1eg
deactivate menu _msysmenu
clea even
clea read
final=1
return

