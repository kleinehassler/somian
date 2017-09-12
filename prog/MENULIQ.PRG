*       *********************************************************
*       *                                                         
*       * 28/05/2005            MENULIQ.PRG             15:53:47  
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

DEFINE PAD _1j30y2l1n OF _MSYSMENU PROMPT "Tablas" COLOR SCHEME 3 ;
	KEY ALT+T, "" ;
	MESSAGE 'TABLA DE LIQUIDACIONES'
DEFINE PAD _1j30y2l1o OF _MSYSMENU PROMPT "Creditos a Productores" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _1j30y2l1p OF _MSYSMENU PROMPT "Liquidaciones de Fruta" COLOR SCHEME 3 ;
	KEY ALT+L, ""
DEFINE PAD _1j30y2l1q OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _1j30y2l1r OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _1j30y2l1s OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _1j30y2l1n OF _MSYSMENU ACTIVATE POPUP tablas
ON PAD _1j30y2l1o OF _MSYSMENU ACTIVATE POPUP _1ep112mbp
ON PAD _1j30y2l1p OF _MSYSMENU ACTIVATE POPUP liquidacio
ON PAD _1j30y2l1q OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _1j30y2l1r OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _1j30y2l1s OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP tablas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF tablas PROMPT "Productores"
DEFINE BAR 2 OF tablas PROMPT "\-"
DEFINE BAR 3 OF tablas PROMPT "Grupos"
DEFINE BAR 4 OF tablas PROMPT "Detalle de Grupos"
ON BAR 1 OF tablas ACTIVATE POPUP productore
ON SELECTION BAR 3 OF tablas do form liq0103
ON SELECTION BAR 4 OF tablas do form liq0104

DEFINE POPUP productore MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF productore PROMPT "Datos Generales"
DEFINE BAR 2 OF productore PROMPT "Datos del Productor"
ON SELECTION BAR 1 OF productore do form liq0102a
ON SELECTION BAR 2 OF productore do form liq0102b

DEFINE POPUP _1ep112mbp MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1ep112mbp PROMPT "Anticipo de Produccion" ;
	SKIP FOR !accesos('liq0401')
DEFINE BAR 2 OF _1ep112mbp PROMPT "Prestamo a Productor" ;
	SKIP FOR !accesos('liq0402')
ON SELECTION BAR 1 OF _1ep112mbp do form liq0401
ON SELECTION BAR 2 OF _1ep112mbp do form liq0402

DEFINE POPUP liquidacio MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF liquidacio PROMPT "Datos Embarque"
DEFINE BAR 2 OF liquidacio PROMPT "Compra Fruta Adicional"
DEFINE BAR 3 OF liquidacio PROMPT "Alicuotas Carton Material"
DEFINE BAR 4 OF liquidacio PROMPT "Liquidacion Fruta (Ingresos-Egresos)"
DEFINE BAR 5 OF liquidacio PROMPT "Emision Cheques/Comp.Retencion"
ON SELECTION BAR 1 OF liquidacio do form liq0201
ON SELECTION BAR 2 OF liquidacio do form liq0202
ON SELECTION BAR 3 OF liquidacio do form liq0203
ON SELECTION BAR 4 OF liquidacio do form liq0204
ON SELECTION BAR 5 OF liquidacio do form liq0205

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Emisión de liquidaciones"
DEFINE BAR 2 OF reportes PROMPT "Valor Pagado por Embarque"
DEFINE BAR 3 OF reportes PROMPT "Detalle Simple de un Embarque"
DEFINE BAR 4 OF reportes PROMPT "Embarques x Periodo"
DEFINE BAR 5 OF reportes PROMPT "Total General del Embarque"
DEFINE BAR 6 OF reportes PROMPT "Detalle Cancelación de Ordenes"
DEFINE BAR 7 OF reportes PROMPT "Secuencial de Ordenes"
ON SELECTION BAR 1 OF reportes do form liq0301
ON SELECTION BAR 2 OF reportes do form liq0302
ON SELECTION BAR 3 OF reportes do form liq0303
ON SELECTION BAR 4 OF reportes do form liq0304
ON SELECTION BAR 5 OF reportes do form liq0305
ON SELECTION BAR 6 OF reportes do form liq0307
ON SELECTION BAR 7 OF reportes do form liq0308

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Multiples Valores"
DEFINE BAR 2 OF nuevoeleme PROMPT "\-"
DEFINE BAR 3 OF nuevoeleme PROMPT "Cancelación"
DEFINE BAR 4 OF nuevoeleme PROMPT "Documento Bancario"
DEFINE BAR 5 OF nuevoeleme PROMPT "Contabilización"
DEFINE BAR 6 OF nuevoeleme PROMPT "\-"
DEFINE BAR 7 OF nuevoeleme PROMPT "Anulación"
DEFINE BAR 8 OF nuevoeleme PROMPT "Consulta"
ON BAR 1 OF nuevoeleme ACTIVATE POPUP registrarm
ON SELECTION BAR 3 OF nuevoeleme do form adq0701b
ON SELECTION BAR 4 OF nuevoeleme do form adq0702b
ON SELECTION BAR 5 OF nuevoeleme do form adq0703b
ON SELECTION BAR 7 OF nuevoeleme do form adq0704
ON SELECTION BAR 8 OF nuevoeleme do form adq0705b

DEFINE POPUP registrarm MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF registrarm PROMPT "Registrar"
DEFINE BAR 2 OF registrarm PROMPT "Generar Individuales"
DEFINE BAR 3 OF registrarm PROMPT "Cancelar"
DEFINE BAR 4 OF registrarm PROMPT "Contabilizar"
DEFINE BAR 5 OF registrarm PROMPT "\-"
DEFINE BAR 6 OF registrarm PROMPT "Consulta"
ON SELECTION BAR 1 OF registrarm do form docmul
ON SELECTION BAR 2 OF registrarm do form genindi
ON SELECTION BAR 3 OF registrarm do form cancdocm
ON SELECTION BAR 4 OF registrarm do  form contdocm
ON SELECTION BAR 6 OF registrarm do form consdocm

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el sistema"
ON SELECTION BAR 1 OF salir ;
	DO _1j30y2l78 ;
	IN LOCFILE("PROG\MENULIQ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENULIQ?")
ON SELECTION BAR 2 OF salir ;
	DO _1j30y2l8m ;
	IN LOCFILE("PROG\MENULIQ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENULIQ?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _1J30Y2L78  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENULIQ.PRG,            Record:   52        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1j30y2l78
do while type('_screen.activeform')='O'
	_screen.activeform.release
enddo	

deactivate menu _msysmenu
clea even
clea read
return



*       *********************************************************
*       *                                                         
*       * _1J30Y2L8M  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENULIQ.PRG,            Record:   53        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el sistema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _1j30y2l8m
deactivate menu _msysmenu
clea even
clea read
final=1
return

