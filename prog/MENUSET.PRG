*       *********************************************************
*       *                                                         
*       * 02/07/2013            MENUSET.PRG             09:53:46  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2013 Nombre de compañía                   
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

DEFINE PAD _3tm0l7lr6 OF _MSYSMENU PROMPT "Accesos" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _3tm0l7lr7 OF _MSYSMENU PROMPT "Empresas" COLOR SCHEME 3 ;
	KEY ALT+E, ""
DEFINE PAD _3tm0l7lr8 OF _MSYSMENU PROMPT "Datos Generales" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _3tm0l7lr9 OF _MSYSMENU PROMPT "Mi configuración" COLOR SCHEME 3 ;
	KEY ALT+M, ""
DEFINE PAD _3tm0l7lra OF _MSYSMENU PROMPT "Agencias" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _3tm0l7lrb OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _3tm0l7lr6 OF _MSYSMENU ACTIVATE POPUP accesos
ON PAD _3tm0l7lr7 OF _MSYSMENU ACTIVATE POPUP empresas
ON PAD _3tm0l7lr8 OF _MSYSMENU ACTIVATE POPUP datosgener
ON PAD _3tm0l7lr9 OF _MSYSMENU ACTIVATE POPUP miconfigur
ON PAD _3tm0l7lra OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _3tm0l7lrb OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP accesos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF accesos PROMPT "Programas"
DEFINE BAR 2 OF accesos PROMPT "Usuarios"
DEFINE BAR 3 OF accesos PROMPT "Estaciones de Trabajo"
DEFINE BAR 4 OF accesos PROMPT "\-"
DEFINE BAR 5 OF accesos PROMPT "Restriccion x Usuario"
DEFINE BAR 6 OF accesos PROMPT "Restriccion x Perfil"
DEFINE BAR 7 OF accesos PROMPT "\-"
DEFINE BAR 8 OF accesos PROMPT "Anulaciones y Autorizaciones por Usuario"
DEFINE BAR 9 OF accesos PROMPT "Anulaciones y Autorizaciones por Perfil"
ON SELECTION BAR 1 OF accesos do form set0101
ON SELECTION BAR 2 OF accesos do form set0102
ON SELECTION BAR 3 OF accesos do form set0103
ON SELECTION BAR 5 OF accesos do form set0104
ON SELECTION BAR 6 OF accesos do form set0105
ON SELECTION BAR 8 OF accesos do form set0106
ON SELECTION BAR 9 OF accesos do form set0107

DEFINE POPUP empresas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF empresas PROMPT "Creación - Edición"
DEFINE BAR 2 OF empresas PROMPT "Periodos"
DEFINE BAR 3 OF empresas PROMPT "Crear nuevo periodo"
DEFINE BAR 4 OF empresas PROMPT "Iniciar Periodo"
DEFINE BAR 5 OF empresas PROMPT "Transferir Auxiliares"
ON SELECTION BAR 1 OF empresas do form set0201
ON SELECTION BAR 2 OF empresas do form set0202
ON SELECTION BAR 3 OF empresas do form set0203
ON SELECTION BAR 4 OF empresas do form set0204
ON BAR 5 OF empresas ACTIVATE POPUP transferir

DEFINE POPUP transferir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF transferir PROMPT "Exportar"
DEFINE BAR 2 OF transferir PROMPT "Importar"
ON SELECTION BAR 1 OF transferir do form set0205a
ON SELECTION BAR 2 OF transferir do form set0205b

DEFINE POPUP datosgener MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF datosgener PROMPT "Grupos de Datos"
DEFINE BAR 2 OF datosgener PROMPT "Datos Generales"
DEFINE BAR 3 OF datosgener PROMPT "\-"
DEFINE BAR 4 OF datosgener PROMPT "Secuencias"
DEFINE BAR 5 OF datosgener PROMPT "Variables del sistema"
ON SELECTION BAR 1 OF datosgener do form set0301
ON SELECTION BAR 2 OF datosgener do form set0302
ON SELECTION BAR 4 OF datosgener do form set0303
ON SELECTION BAR 5 OF datosgener do form set0305

DEFINE POPUP miconfigur MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF miconfigur PROMPT "Configuración"
DEFINE BAR 2 OF miconfigur PROMPT "Cambiar Clave"
DEFINE BAR 3 OF miconfigur PROMPT "Cambiar Clave Otro Usuario"
DEFINE BAR 4 OF miconfigur PROMPT "Otra Empresa y/o Periodo"
DEFINE BAR 5 OF miconfigur PROMPT "Apariencia de Formularios"
DEFINE BAR 6 OF miconfigur PROMPT "Actualizar Acceso a Programas"
DEFINE BAR 7 OF miconfigur PROMPT "\-"
DEFINE BAR 8 OF miconfigur PROMPT "Actualizar Forma de Pago (ANEIVA)"
DEFINE BAR 9 OF miconfigur PROMPT "\-"
DEFINE BAR 10 OF miconfigur PROMPT "Respaldar Base de Datos"
DEFINE BAR 11 OF miconfigur PROMPT "Optimizar Rendimiento"
ON SELECTION BAR 1 OF miconfigur do form configura
ON SELECTION BAR 2 OF miconfigur Do form set0401
ON SELECTION BAR 3 OF miconfigur do form set0401a
ON SELECTION BAR 4 OF miconfigur ;
	DO _3tm0l7lrc ;
	IN LOCFILE("PROG\MENUSET" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUSET?")
ON SELECTION BAR 5 OF miconfigur do form set0403
ON SELECTION BAR 6 OF miconfigur ;
	DO _3tm0l7lre ;
	IN LOCFILE("PROG\MENUSET" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUSET?")
ON SELECTION BAR 8 OF miconfigur do actforpag1.prg
ON SELECTION BAR 10 OF miconfigur do form respaldo
ON SELECTION BAR 11 OF miconfigur do form vacuum

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Tablas"
DEFINE BAR 2 OF nuevoeleme PROMPT "Secuencias de Tablas"
DEFINE BAR 3 OF nuevoeleme PROMPT "\-"
DEFINE BAR 4 OF nuevoeleme PROMPT "Actualizar Secuencias"
DEFINE BAR 5 OF nuevoeleme PROMPT "\-"
DEFINE BAR 6 OF nuevoeleme PROMPT "Envio de Datos"
DEFINE BAR 7 OF nuevoeleme PROMPT "Recepción de Datos"
ON SELECTION BAR 1 OF nuevoeleme do form set0502
ON SELECTION BAR 2 OF nuevoeleme do form set0501
ON SELECTION BAR 4 OF nuevoeleme do form set0505
ON SELECTION BAR 6 OF nuevoeleme do form set0503
ON SELECTION BAR 7 OF nuevoeleme do form set0504

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el Sistema"
ON SELECTION BAR 1 OF salir ;
	DO _3tm0l7lri ;
	IN LOCFILE("PROG\MENUSET" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUSET?")
ON SELECTION BAR 2 OF salir ;
	DO _3tm0l7lrm ;
	IN LOCFILE("PROG\MENUSET" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUSET?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _3TM0L7LRC  ON SELECTION BAR 4 OF POPUP miconfigur      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUSET.PRG,            Record:   38        
*       * Called By:  ON SELECTION BAR 4 OF POPUP miconfigur      
*       * Prompt:     Otra Empresa y/o Periodo                    
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3tm0l7lrc
do form clave
with _screen
	.titulo.caption=alltrim(empresa)
	.titulo.left=(.width - .titulo.width)/2

	.periodo.caption='USUARIO: '+alltrim(USUARIO)+space(10)+'PERIODO: '+alltrim(devfeclet(finip))+;
	'  al  '+alltrim(devfeclet(ffinp))+space(4)
	.periodo.left=(.width - .periodo.width)/2

	.fecequi.caption='EQUIPO: '+equipo+SPACE(5)+'FECHA: '+alltrim(DEVFECLET(HOY))
	.fecequi.left=(.width - .fecequi.width)/2
	.refresh
endwith


*       *********************************************************
*       *                                                         
*       * _3TM0L7LRE  ON SELECTION BAR 6 OF POPUP miconfigur      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUSET.PRG,            Record:   40        
*       * Called By:  ON SELECTION BAR 6 OF POPUP miconfigur      
*       * Prompt:     Actualizar Acceso a Programas               
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3tm0l7lre
if !used('accesos') then
	sele accesos
	use
endif

q1="select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+;
	"from accesos a, programas p "+;
	"where p.idprograma=a.idprog and a.idsujeto="+alup(idu)+;
		" and p.estapro union "+;
			"(select distinct p.progname, p.cgdoc, p.cdocu, a.actu, a.inser, a.anu "+;
			"from acceper a, programas p, usuarios u "+;
			"where p.idprograma=a.idprog and a.idperfil=u.tipou "+;
			" and p.estapro and u.idsujeto="+alup(idu)+") order by progname;"
			
if !sqli(q1,'accesos') then
	wait 'No se actualizo!!!' wind nowait
else
	wait 'Actualización realizada' wind nowait
endif
	



*       *********************************************************
*       *                                                         
*       * _3TM0L7LRI  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUSET.PRG,            Record:   60        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    3                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3tm0l7lri
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
*       * _3TM0L7LRM  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUSET.PRG,            Record:   61        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el Sistema                        
*       * Snippet:    4                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _3tm0l7lrm
deactivate menu _msysmenu
clea even
clea read
final=1
return

