* *********************************************************
* *
* * 06-08-2003           BDDSISCONIN.DBC           11:15:50
* *
* *********************************************************
* *
* * Descripción:
* * Este programa lo ha generado automáticamente GENDBC
* * Versión 2.26.67
* *
* *********************************************************


DisplayStatus([Creando base de datos...])
CLOSE DATA ALL
CREATE DATABASE 'BDDSISCONIN.DBC'
DisplayStatus([Creando conexión CONBDD...])
MakeConn_CONBDD()
DisplayStatus([Creando vista DETADOC...])
MakeView_DETADOC()
DisplayStatus([Creando vista MONEDAS...])
MakeView_MONEDAS()
DisplayStatus([Creando vista PROGRAMAS...])
MakeView_PROGRAMAS()
DisplayStatus([Creando vista ACCESOS...])
MakeView_ACCESOS()
DisplayStatus([Creando vista USUEMPRE...])
MakeView_USUEMPRE()
DisplayStatus([Creando vista USUARIOS...])
MakeView_USUARIOS()
DisplayStatus([Creando vista SECUENCIAS...])
MakeView_SECUENCIAS()
DisplayStatus([Creando vista DSECUENCIAS...])
MakeView_DSECUENCIAS()
DisplayStatus([Creando vista EMPLEADOS...])
MakeView_EMPLEADOS()
DisplayStatus([Creando vista PRODUCTORES...])
MakeView_PRODUCTORES()
DisplayStatus([Creando vista SUJETOS...])
MakeView_SUJETOS()
DisplayStatus([Creando vista HACIENDAS...])
MakeView_HACIENDAS()
DisplayStatus([Creando vista DOCUREVERSO...])
MakeView_DOCUREVERSO()
DisplayStatus([Creando vista SUBTIPOS...])
MakeView_SUBTIPOS()
DisplayStatus([Creando vista AMBIEMPRE...])
MakeView_AMBIEMPRE()
DisplayStatus([Creando vista RUBROS...])
MakeView_RUBROS()
DisplayStatus([Creando vista DDOCUSE...])
MakeView_DDOCUSE()
DisplayStatus([Creando vista PLANCUENTA...])
MakeView_PLANCUENTA()
DisplayStatus([Creando vista PERIODOS...])
MakeView_PERIODOS()
DisplayStatus([Creando vista DETAGRU...])
MakeView_DETAGRU()
DisplayStatus([Creando vista TEMPRESAS...])
MakeView_TEMPRESAS()
DisplayStatus([Creando vista EMPRESAS...])
MakeView_EMPRESAS()
DisplayStatus([Creando vista TUSUEMPRE...])
MakeView_TUSUEMPRE()
DisplayStatus([Creando vista TAMBIEMPRE...])
MakeView_TAMBIEMPRE()
DisplayStatus([Creando vista REVERSODOC...])
MakeView_REVERSODOC()
DisplayStatus([Creando vista SPRODUCTORES...])
MakeView_SPRODUCTORES()
DisplayStatus([Creando vista SEMPLEADOS...])
MakeView_SEMPLEADOS()
DisplayStatus([Creando vista SPROVEEDOR...])
MakeView_SPROVEEDOR()
DisplayStatus([Creando vista SCLIENTES...])
MakeView_SCLIENTES()
DisplayStatus([Creando vista VARIBLES...])
MakeView_VARIBLES()
DisplayStatus([Creando vista ARTICULOS...])
MakeView_ARTICULOS()
DisplayStatus([Creando vista DOCUMENTS...])
MakeView_DOCUMENTS()
DisplayStatus([Creando vista GRUDAT...])
MakeView_GRUDAT()
DisplayStatus([Creando vista DOCUSE...])
MakeView_DOCUSE()
DisplayStatus([Creando vista DATOSGEN...])
MakeView_DATOSGEN()
DisplayStatus([Creando vista VDOCUMENTS...])
MakeView_VDOCUMENTS()
DisplayStatus([Terminado.])

FUNCTION MakeConn_CONBDD
***************** Definiciones de conexiones CONBDD ***************

CREATE CONNECTION CONBDD ; 
   CONNSTRING "DSN=PostgreSQL;DATABASE=BDD;SERVER=192.168.5.1;PORT=5432;UID=postgres;PWD=postgres;A6=;A7=100;A8=4096;B0=254;B1=8190;BI=0;C2=dd_;CX=18503a9"
****
DBSetProp('CONBDD', 'Connection', 'Asynchronous', .F.)
DBSetProp('CONBDD', 'Connection', 'BatchMode', .T.)
DBSetProp('CONBDD', 'Connection', 'Comment', '')
DBSetProp('CONBDD', 'Connection', 'DispLogin', 1)
DBSetProp('CONBDD', 'Connection', 'ConnectTimeOut', 15)
DBSetProp('CONBDD', 'Connection', 'DispWarnings', .F.)
DBSetProp('CONBDD', 'Connection', 'IdleTimeOut', 0)
DBSetProp('CONBDD', 'Connection', 'QueryTimeOut', 0)
DBSetProp('CONBDD', 'Connection', 'Transactions', 1)
DBSetProp('CONBDD', 'Connection', 'Database', '')

ENDFUNC
 
FUNCTION MakeView_DETADOC
***************** Ver la configuración para DETADOC ***************

CREATE SQL VIEW "DETADOC" ; 
   REMOTE CONNECT "conbdd" ; 
   AS SELECT * FROM detadoc Detadoc

DBSetProp('DETADOC', 'View', 'UpdateType', 1)
DBSetProp('DETADOC', 'View', 'WhereType', 3)
DBSetProp('DETADOC', 'View', 'FetchMemo', .T.)
DBSetProp('DETADOC', 'View', 'SendUpdates', .F.)
DBSetProp('DETADOC', 'View', 'UseMemoSize', 255)
DBSetProp('DETADOC', 'View', 'FetchSize', 100)
DBSetProp('DETADOC', 'View', 'MaxRecords', -1)
DBSetProp('DETADOC', 'View', 'Tables', '')
DBSetProp('DETADOC', 'View', 'Prepared', .F.)
DBSetProp('DETADOC', 'View', 'CompareMemo', .T.)
DBSetProp('DETADOC', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DETADOC', 'View', 'FetchSize', 100)
DBSetProp('DETADOC', 'View', 'Comment', "")
DBSetProp('DETADOC', 'View', 'BatchUpdateCount', 1)
DBSetProp('DETADOC', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DETADOC
* Props for the DETADOC.code field.
DBSetProp('DETADOC.code', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.code', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.code', 'Field', 'UpdateName', 'detadoc.code')
DBSetProp('DETADOC.code', 'Field', 'DataType', "I")
* Props for the DETADOC.item field.
DBSetProp('DETADOC.item', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.item', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.item', 'Field', 'UpdateName', 'detadoc.item')
DBSetProp('DETADOC.item', 'Field', 'DataType', "I")
* Props for the DETADOC.marca field.
DBSetProp('DETADOC.marca', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.marca', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.marca', 'Field', 'UpdateName', 'detadoc.marca')
DBSetProp('DETADOC.marca', 'Field', 'DataType', "I")
* Props for the DETADOC.grupo field.
DBSetProp('DETADOC.grupo', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.grupo', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.grupo', 'Field', 'UpdateName', 'detadoc.grupo')
DBSetProp('DETADOC.grupo', 'Field', 'DataType', "I")
* Props for the DETADOC.tarifa field.
DBSetProp('DETADOC.tarifa', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.tarifa', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.tarifa', 'Field', 'UpdateName', 'detadoc.tarifa')
DBSetProp('DETADOC.tarifa', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.tarifadesc field.
DBSetProp('DETADOC.tarifadesc', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.tarifadesc', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.tarifadesc', 'Field', 'UpdateName', 'detadoc.tarifadesc')
DBSetProp('DETADOC.tarifadesc', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.artcode field.
DBSetProp('DETADOC.artcode', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.artcode', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.artcode', 'Field', 'UpdateName', 'detadoc.artcode')
DBSetProp('DETADOC.artcode', 'Field', 'DataType', "I")
* Props for the DETADOC.arttype field.
DBSetProp('DETADOC.arttype', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.arttype', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.arttype', 'Field', 'UpdateName', 'detadoc.arttype')
DBSetProp('DETADOC.arttype', 'Field', 'DataType', "C(1)")
* Props for the DETADOC.isfob field.
DBSetProp('DETADOC.isfob', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.isfob', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.isfob', 'Field', 'UpdateName', 'detadoc.isfob')
DBSetProp('DETADOC.isfob', 'Field', 'DataType', "C(1)")
* Props for the DETADOC.qty field.
DBSetProp('DETADOC.qty', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.qty', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.qty', 'Field', 'UpdateName', 'detadoc.qty')
DBSetProp('DETADOC.qty', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.qtybodega field.
DBSetProp('DETADOC.qtybodega', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.qtybodega', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.qtybodega', 'Field', 'UpdateName', 'detadoc.qtybodega')
DBSetProp('DETADOC.qtybodega', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.qtyreturn field.
DBSetProp('DETADOC.qtyreturn', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.qtyreturn', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.qtyreturn', 'Field', 'UpdateName', 'detadoc.qtyreturn')
DBSetProp('DETADOC.qtyreturn', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.qtyactivo field.
DBSetProp('DETADOC.qtyactivo', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.qtyactivo', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.qtyactivo', 'Field', 'UpdateName', 'detadoc.qtyactivo')
DBSetProp('DETADOC.qtyactivo', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.impuesto field.
DBSetProp('DETADOC.impuesto', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.impuesto', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.impuesto', 'Field', 'UpdateName', 'detadoc.impuesto')
DBSetProp('DETADOC.impuesto', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.descuento field.
DBSetProp('DETADOC.descuento', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.descuento', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.descuento', 'Field', 'UpdateName', 'detadoc.descuento')
DBSetProp('DETADOC.descuento', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.flete field.
DBSetProp('DETADOC.flete', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.flete', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.flete', 'Field', 'UpdateName', 'detadoc.flete')
DBSetProp('DETADOC.flete', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.atfob field.
DBSetProp('DETADOC.atfob', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.atfob', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.atfob', 'Field', 'UpdateName', 'detadoc.atfob')
DBSetProp('DETADOC.atfob', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.artcosto field.
DBSetProp('DETADOC.artcosto', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.artcosto', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.artcosto', 'Field', 'UpdateName', 'detadoc.artcosto')
DBSetProp('DETADOC.artcosto', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.punitario field.
DBSetProp('DETADOC.punitario', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.punitario', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.punitario', 'Field', 'UpdateName', 'detadoc.punitario')
DBSetProp('DETADOC.punitario', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.ptyped field.
DBSetProp('DETADOC.ptyped', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.ptyped', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.ptyped', 'Field', 'UpdateName', 'detadoc.ptyped')
DBSetProp('DETADOC.ptyped', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.punitdesc field.
DBSetProp('DETADOC.punitdesc', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.punitdesc', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.punitdesc', 'Field', 'UpdateName', 'detadoc.punitdesc')
DBSetProp('DETADOC.punitdesc', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.valor field.
DBSetProp('DETADOC.valor', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.valor', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.valor', 'Field', 'UpdateName', 'detadoc.valor')
DBSetProp('DETADOC.valor', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.valconiva field.
DBSetProp('DETADOC.valconiva', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.valconiva', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.valconiva', 'Field', 'UpdateName', 'detadoc.valconiva')
DBSetProp('DETADOC.valconiva', 'Field', 'DataType', "B(8,2)")
* Props for the DETADOC.qflag field.
DBSetProp('DETADOC.qflag', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.qflag', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.qflag', 'Field', 'UpdateName', 'detadoc.qflag')
DBSetProp('DETADOC.qflag', 'Field', 'DataType', "C(1)")
* Props for the DETADOC.pflag field.
DBSetProp('DETADOC.pflag', 'Field', 'KeyField', .F.)
DBSetProp('DETADOC.pflag', 'Field', 'Updatable', .F.)
DBSetProp('DETADOC.pflag', 'Field', 'UpdateName', 'detadoc.pflag')
DBSetProp('DETADOC.pflag', 'Field', 'DataType', "C(1)")
ENDFUNC
 
FUNCTION MakeView_MONEDAS
***************** Ver la configuración para MONEDAS ***************

CREATE SQL VIEW "MONEDAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM monedas Monedas ORDER BY Monedas.moname

DBSetProp('MONEDAS', 'View', 'UpdateType', 1)
DBSetProp('MONEDAS', 'View', 'WhereType', 3)
DBSetProp('MONEDAS', 'View', 'FetchMemo', .T.)
DBSetProp('MONEDAS', 'View', 'SendUpdates', .T.)
DBSetProp('MONEDAS', 'View', 'UseMemoSize', 255)
DBSetProp('MONEDAS', 'View', 'FetchSize', 100)
DBSetProp('MONEDAS', 'View', 'MaxRecords', -1)
DBSetProp('MONEDAS', 'View', 'Tables', 'monedas')
DBSetProp('MONEDAS', 'View', 'Prepared', .F.)
DBSetProp('MONEDAS', 'View', 'CompareMemo', .T.)
DBSetProp('MONEDAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MONEDAS', 'View', 'FetchSize', 100)
DBSetProp('MONEDAS', 'View', 'Comment', "")
DBSetProp('MONEDAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('MONEDAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for MONEDAS
* Props for the MONEDAS.moname field.
DBSetProp('MONEDAS.moname', 'Field', 'KeyField', .F.)
DBSetProp('MONEDAS.moname', 'Field', 'Updatable', .T.)
DBSetProp('MONEDAS.moname', 'Field', 'UpdateName', 'monedas.moname')
DBSetProp('MONEDAS.moname', 'Field', 'DataType', "C(40)")
* Props for the MONEDAS.mosimbolo field.
DBSetProp('MONEDAS.mosimbolo', 'Field', 'KeyField', .F.)
DBSetProp('MONEDAS.mosimbolo', 'Field', 'Updatable', .T.)
DBSetProp('MONEDAS.mosimbolo', 'Field', 'UpdateName', 'monedas.mosimbolo')
DBSetProp('MONEDAS.mosimbolo', 'Field', 'DataType', "C(5)")
* Props for the MONEDAS.mocode field.
DBSetProp('MONEDAS.mocode', 'Field', 'KeyField', .T.)
DBSetProp('MONEDAS.mocode', 'Field', 'Updatable', .F.)
DBSetProp('MONEDAS.mocode', 'Field', 'UpdateName', 'monedas.mocode')
DBSetProp('MONEDAS.mocode', 'Field', 'DataType', "I")
* Props for the MONEDAS.mocoti field.
DBSetProp('MONEDAS.mocoti', 'Field', 'KeyField', .F.)
DBSetProp('MONEDAS.mocoti', 'Field', 'Updatable', .T.)
DBSetProp('MONEDAS.mocoti', 'Field', 'UpdateName', 'monedas.mocoti')
DBSetProp('MONEDAS.mocoti', 'Field', 'InputMask', "999,999.9999")
DBSetProp('MONEDAS.mocoti', 'Field', 'DataType', "B(8,2)")
ENDFUNC
 
FUNCTION MakeView_PROGRAMAS
***************** Ver la configuración para PROGRAMAS ***************

CREATE SQL VIEW "PROGRAMAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Programas.descrippro, Programas.estapro, Programas.idprograma,  Programas.progname FROM programas Programas

DBSetProp('PROGRAMAS', 'View', 'UpdateType', 1)
DBSetProp('PROGRAMAS', 'View', 'WhereType', 3)
DBSetProp('PROGRAMAS', 'View', 'FetchMemo', .T.)
DBSetProp('PROGRAMAS', 'View', 'SendUpdates', .T.)
DBSetProp('PROGRAMAS', 'View', 'UseMemoSize', 255)
DBSetProp('PROGRAMAS', 'View', 'FetchSize', 100)
DBSetProp('PROGRAMAS', 'View', 'MaxRecords', -1)
DBSetProp('PROGRAMAS', 'View', 'Tables', 'programas')
DBSetProp('PROGRAMAS', 'View', 'Prepared', .F.)
DBSetProp('PROGRAMAS', 'View', 'CompareMemo', .T.)
DBSetProp('PROGRAMAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PROGRAMAS', 'View', 'FetchSize', 100)
DBSetProp('PROGRAMAS', 'View', 'Comment', "")
DBSetProp('PROGRAMAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('PROGRAMAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for PROGRAMAS
* Props for the PROGRAMAS.descrippro field.
DBSetProp('PROGRAMAS.descrippro', 'Field', 'KeyField', .F.)
DBSetProp('PROGRAMAS.descrippro', 'Field', 'Updatable', .T.)
DBSetProp('PROGRAMAS.descrippro', 'Field', 'UpdateName', 'programas.descrippro')
DBSetProp('PROGRAMAS.descrippro', 'Field', 'DataType', "C(40)")
* Props for the PROGRAMAS.estapro field.
DBSetProp('PROGRAMAS.estapro', 'Field', 'KeyField', .F.)
DBSetProp('PROGRAMAS.estapro', 'Field', 'Updatable', .T.)
DBSetProp('PROGRAMAS.estapro', 'Field', 'UpdateName', 'programas.estapro')
DBSetProp('PROGRAMAS.estapro', 'Field', 'DataType', "C(1)")
* Props for the PROGRAMAS.idprograma field.
DBSetProp('PROGRAMAS.idprograma', 'Field', 'KeyField', .T.)
DBSetProp('PROGRAMAS.idprograma', 'Field', 'Updatable', .T.)
DBSetProp('PROGRAMAS.idprograma', 'Field', 'UpdateName', 'programas.idprograma')
DBSetProp('PROGRAMAS.idprograma', 'Field', 'DataType', "C(6)")
* Props for the PROGRAMAS.progname field.
DBSetProp('PROGRAMAS.progname', 'Field', 'KeyField', .F.)
DBSetProp('PROGRAMAS.progname', 'Field', 'Updatable', .T.)
DBSetProp('PROGRAMAS.progname', 'Field', 'UpdateName', 'programas.progname')
DBSetProp('PROGRAMAS.progname', 'Field', 'DataType', "C(30)")
ENDFUNC
 
FUNCTION MakeView_ACCESOS
***************** Ver la configuración para ACCESOS ***************

CREATE SQL VIEW "ACCESOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM accesos Accesos

DBSetProp('ACCESOS', 'View', 'UpdateType', 1)
DBSetProp('ACCESOS', 'View', 'WhereType', 3)
DBSetProp('ACCESOS', 'View', 'FetchMemo', .T.)
DBSetProp('ACCESOS', 'View', 'SendUpdates', .F.)
DBSetProp('ACCESOS', 'View', 'UseMemoSize', 255)
DBSetProp('ACCESOS', 'View', 'FetchSize', 100)
DBSetProp('ACCESOS', 'View', 'MaxRecords', -1)
DBSetProp('ACCESOS', 'View', 'Tables', 'accesos')
DBSetProp('ACCESOS', 'View', 'Prepared', .F.)
DBSetProp('ACCESOS', 'View', 'CompareMemo', .T.)
DBSetProp('ACCESOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ACCESOS', 'View', 'FetchSize', 100)
DBSetProp('ACCESOS', 'View', 'Comment', "")
DBSetProp('ACCESOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('ACCESOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for ACCESOS
* Props for the ACCESOS.idusuario field.
DBSetProp('ACCESOS.idusuario', 'Field', 'KeyField', .T.)
DBSetProp('ACCESOS.idusuario', 'Field', 'Updatable', .T.)
DBSetProp('ACCESOS.idusuario', 'Field', 'UpdateName', 'accesos.idusuario')
DBSetProp('ACCESOS.idusuario', 'Field', 'DataType', "I")
* Props for the ACCESOS.idprograma field.
DBSetProp('ACCESOS.idprograma', 'Field', 'KeyField', .T.)
DBSetProp('ACCESOS.idprograma', 'Field', 'Updatable', .T.)
DBSetProp('ACCESOS.idprograma', 'Field', 'UpdateName', 'accesos.idprograma')
DBSetProp('ACCESOS.idprograma', 'Field', 'DataType', "C(6)")
* Props for the ACCESOS.noanu field.
DBSetProp('ACCESOS.noanu', 'Field', 'KeyField', .F.)
DBSetProp('ACCESOS.noanu', 'Field', 'Updatable', .T.)
DBSetProp('ACCESOS.noanu', 'Field', 'UpdateName', 'accesos.noanu')
DBSetProp('ACCESOS.noanu', 'Field', 'DataType', "C(1)")
* Props for the ACCESOS.noactu field.
DBSetProp('ACCESOS.noactu', 'Field', 'KeyField', .F.)
DBSetProp('ACCESOS.noactu', 'Field', 'Updatable', .T.)
DBSetProp('ACCESOS.noactu', 'Field', 'UpdateName', 'accesos.noactu')
DBSetProp('ACCESOS.noactu', 'Field', 'DataType', "C(1)")
* Props for the ACCESOS.noinser field.
DBSetProp('ACCESOS.noinser', 'Field', 'KeyField', .F.)
DBSetProp('ACCESOS.noinser', 'Field', 'Updatable', .T.)
DBSetProp('ACCESOS.noinser', 'Field', 'UpdateName', 'accesos.noinser')
DBSetProp('ACCESOS.noinser', 'Field', 'DataType', "C(1)")
ENDFUNC
 
FUNCTION MakeView_USUEMPRE
***************** Ver la configuración para USUEMPRE ***************

CREATE SQL VIEW "USUEMPRE" ; 
   REMOTE CONNECT "conbdd" ; 
   AS SELECT U.idusuario, U.nombreu, U.contrau, E.ecode, E.ssri, U.tipou,  D.descripda, U.colortext, U.fonttext, U.colorform FROM usuarios U, empresas E, detagru D WHERE U.empreu = E.ecode   AND U.tipou = D.iddato   AND U.empreu = ?ide

DBSetProp('USUEMPRE', 'View', 'UpdateType', 1)
DBSetProp('USUEMPRE', 'View', 'WhereType', 3)
DBSetProp('USUEMPRE', 'View', 'FetchMemo', .T.)
DBSetProp('USUEMPRE', 'View', 'SendUpdates', .T.)
DBSetProp('USUEMPRE', 'View', 'UseMemoSize', 255)
DBSetProp('USUEMPRE', 'View', 'FetchSize', 100)
DBSetProp('USUEMPRE', 'View', 'MaxRecords', -1)
DBSetProp('USUEMPRE', 'View', 'Tables', 'usuarios')
DBSetProp('USUEMPRE', 'View', 'Prepared', .F.)
DBSetProp('USUEMPRE', 'View', 'CompareMemo', .T.)
DBSetProp('USUEMPRE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('USUEMPRE', 'View', 'FetchSize', 100)
DBSetProp('USUEMPRE', 'View', 'Comment', "")
DBSetProp('USUEMPRE', 'View', 'BatchUpdateCount', 1)
DBSetProp('USUEMPRE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for USUEMPRE
* Props for the USUEMPRE.idusuario field.
DBSetProp('USUEMPRE.idusuario', 'Field', 'KeyField', .T.)
DBSetProp('USUEMPRE.idusuario', 'Field', 'Updatable', .F.)
DBSetProp('USUEMPRE.idusuario', 'Field', 'UpdateName', 'usuarios.idusuario')
DBSetProp('USUEMPRE.idusuario', 'Field', 'DataType', "N(6)")
* Props for the USUEMPRE.nombreu field.
DBSetProp('USUEMPRE.nombreu', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.nombreu', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.nombreu', 'Field', 'UpdateName', 'usuarios.nombreu')
DBSetProp('USUEMPRE.nombreu', 'Field', 'DataType', "C(40)")
* Props for the USUEMPRE.contrau field.
DBSetProp('USUEMPRE.contrau', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.contrau', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.contrau', 'Field', 'UpdateName', 'usuarios.contrau')
DBSetProp('USUEMPRE.contrau', 'Field', 'DataType', "C(6)")
* Props for the USUEMPRE.ecode field.
DBSetProp('USUEMPRE.ecode', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.ecode', 'Field', 'Updatable', .F.)
DBSetProp('USUEMPRE.ecode', 'Field', 'UpdateName', 'empresas.ecode')
DBSetProp('USUEMPRE.ecode', 'Field', 'DataType', "I")
* Props for the USUEMPRE.ssri field.
DBSetProp('USUEMPRE.ssri', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.ssri', 'Field', 'Updatable', .F.)
DBSetProp('USUEMPRE.ssri', 'Field', 'UpdateName', 'empresas.ssri')
DBSetProp('USUEMPRE.ssri', 'Field', 'DataType', "C(60)")
* Props for the USUEMPRE.tipou field.
DBSetProp('USUEMPRE.tipou', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.tipou', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.tipou', 'Field', 'UpdateName', 'usuarios.tipou')
DBSetProp('USUEMPRE.tipou', 'Field', 'DataType', "I")
* Props for the USUEMPRE.descripda field.
DBSetProp('USUEMPRE.descripda', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.descripda', 'Field', 'Updatable', .F.)
DBSetProp('USUEMPRE.descripda', 'Field', 'UpdateName', 'detagru.descripda')
DBSetProp('USUEMPRE.descripda', 'Field', 'DataType', "C(40)")
* Props for the USUEMPRE.colortext field.
DBSetProp('USUEMPRE.colortext', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.colortext', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.colortext', 'Field', 'UpdateName', 'usuarios.colortext')
DBSetProp('USUEMPRE.colortext', 'Field', 'DataType', "I")
* Props for the USUEMPRE.fonttext field.
DBSetProp('USUEMPRE.fonttext', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.fonttext', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.fonttext', 'Field', 'UpdateName', 'usuarios.fonttext')
DBSetProp('USUEMPRE.fonttext', 'Field', 'DataType', "C(35)")
* Props for the USUEMPRE.colorform field.
DBSetProp('USUEMPRE.colorform', 'Field', 'KeyField', .F.)
DBSetProp('USUEMPRE.colorform', 'Field', 'Updatable', .T.)
DBSetProp('USUEMPRE.colorform', 'Field', 'UpdateName', 'usuarios.colorform')
DBSetProp('USUEMPRE.colorform', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_USUARIOS
***************** Ver la configuración para USUARIOS ***************

CREATE SQL VIEW "USUARIOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM usuarios Usuarios WHERE Usuarios.empreu = ?ide ORDER BY Usuarios.empreu, Usuarios.nombreu

DBSetProp('USUARIOS', 'View', 'UpdateType', 1)
DBSetProp('USUARIOS', 'View', 'WhereType', 3)
DBSetProp('USUARIOS', 'View', 'FetchMemo', .T.)
DBSetProp('USUARIOS', 'View', 'SendUpdates', .T.)
DBSetProp('USUARIOS', 'View', 'UseMemoSize', 255)
DBSetProp('USUARIOS', 'View', 'FetchSize', 100)
DBSetProp('USUARIOS', 'View', 'MaxRecords', -1)
DBSetProp('USUARIOS', 'View', 'Tables', 'usuarios')
DBSetProp('USUARIOS', 'View', 'Prepared', .F.)
DBSetProp('USUARIOS', 'View', 'CompareMemo', .T.)
DBSetProp('USUARIOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('USUARIOS', 'View', 'FetchSize', 100)
DBSetProp('USUARIOS', 'View', 'Comment', "")
DBSetProp('USUARIOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('USUARIOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for USUARIOS
* Props for the USUARIOS.codusu field.
DBSetProp('USUARIOS.codusu', 'Field', 'KeyField', .T.)
DBSetProp('USUARIOS.codusu', 'Field', 'Updatable', .F.)
DBSetProp('USUARIOS.codusu', 'Field', 'UpdateName', 'usuarios.codusu')
DBSetProp('USUARIOS.codusu', 'Field', 'DataType', "I")
* Props for the USUARIOS.idusuario field.
DBSetProp('USUARIOS.idusuario', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.idusuario', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.idusuario', 'Field', 'UpdateName', 'usuarios.idusuario')
DBSetProp('USUARIOS.idusuario', 'Field', 'DataType', "I")
* Props for the USUARIOS.nombreu field.
DBSetProp('USUARIOS.nombreu', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.nombreu', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.nombreu', 'Field', 'UpdateName', 'usuarios.nombreu')
DBSetProp('USUARIOS.nombreu', 'Field', 'DataType', "C(40)")
* Props for the USUARIOS.contrau field.
DBSetProp('USUARIOS.contrau', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.contrau', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.contrau', 'Field', 'UpdateName', 'usuarios.contrau')
DBSetProp('USUARIOS.contrau', 'Field', 'DataType', "C(6)")
* Props for the USUARIOS.empreu field.
DBSetProp('USUARIOS.empreu', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.empreu', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.empreu', 'Field', 'UpdateName', 'usuarios.empreu')
DBSetProp('USUARIOS.empreu', 'Field', 'DataType', "I")
* Props for the USUARIOS.tipou field.
DBSetProp('USUARIOS.tipou', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.tipou', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.tipou', 'Field', 'UpdateName', 'usuarios.tipou')
DBSetProp('USUARIOS.tipou', 'Field', 'DataType', "I")
* Props for the USUARIOS.colortext field.
DBSetProp('USUARIOS.colortext', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.colortext', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.colortext', 'Field', 'UpdateName', 'usuarios.colortext')
DBSetProp('USUARIOS.colortext', 'Field', 'DataType', "I")
* Props for the USUARIOS.fonttext field.
DBSetProp('USUARIOS.fonttext', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.fonttext', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.fonttext', 'Field', 'UpdateName', 'usuarios.fonttext')
DBSetProp('USUARIOS.fonttext', 'Field', 'DataType', "C(35)")
* Props for the USUARIOS.colorform field.
DBSetProp('USUARIOS.colorform', 'Field', 'KeyField', .F.)
DBSetProp('USUARIOS.colorform', 'Field', 'Updatable', .T.)
DBSetProp('USUARIOS.colorform', 'Field', 'UpdateName', 'usuarios.colorform')
DBSetProp('USUARIOS.colorform', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SECUENCIAS
***************** Ver la configuración para SECUENCIAS ***************

CREATE SQL VIEW "SECUENCIAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM secuencias Secuencias

DBSetProp('SECUENCIAS', 'View', 'UpdateType', 1)
DBSetProp('SECUENCIAS', 'View', 'WhereType', 3)
DBSetProp('SECUENCIAS', 'View', 'FetchMemo', .T.)
DBSetProp('SECUENCIAS', 'View', 'SendUpdates', .T.)
DBSetProp('SECUENCIAS', 'View', 'UseMemoSize', 255)
DBSetProp('SECUENCIAS', 'View', 'FetchSize', 100)
DBSetProp('SECUENCIAS', 'View', 'MaxRecords', -1)
DBSetProp('SECUENCIAS', 'View', 'Tables', 'secuencias')
DBSetProp('SECUENCIAS', 'View', 'Prepared', .F.)
DBSetProp('SECUENCIAS', 'View', 'CompareMemo', .T.)
DBSetProp('SECUENCIAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SECUENCIAS', 'View', 'FetchSize', 100)
DBSetProp('SECUENCIAS', 'View', 'Comment', "")
DBSetProp('SECUENCIAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('SECUENCIAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SECUENCIAS
* Props for the SECUENCIAS.idsecu field.
DBSetProp('SECUENCIAS.idsecu', 'Field', 'KeyField', .T.)
DBSetProp('SECUENCIAS.idsecu', 'Field', 'Updatable', .F.)
DBSetProp('SECUENCIAS.idsecu', 'Field', 'UpdateName', 'secuencias.idsecu')
DBSetProp('SECUENCIAS.idsecu', 'Field', 'DataType', "I")
* Props for the SECUENCIAS.idempresa field.
DBSetProp('SECUENCIAS.idempresa', 'Field', 'KeyField', .F.)
DBSetProp('SECUENCIAS.idempresa', 'Field', 'Updatable', .T.)
DBSetProp('SECUENCIAS.idempresa', 'Field', 'UpdateName', 'secuencias.idempresa')
DBSetProp('SECUENCIAS.idempresa', 'Field', 'DataType', "I")
* Props for the SECUENCIAS.idsecuencia field.
DBSetProp('SECUENCIAS.idsecuencia', 'Field', 'KeyField', .F.)
DBSetProp('SECUENCIAS.idsecuencia', 'Field', 'Updatable', .T.)
DBSetProp('SECUENCIAS.idsecuencia', 'Field', 'UpdateName', 'secuencias.idsecuencia')
DBSetProp('SECUENCIAS.idsecuencia', 'Field', 'DataType', "I")
* Props for the SECUENCIAS.numese field.
DBSetProp('SECUENCIAS.numese', 'Field', 'KeyField', .F.)
DBSetProp('SECUENCIAS.numese', 'Field', 'Updatable', .T.)
DBSetProp('SECUENCIAS.numese', 'Field', 'UpdateName', 'secuencias.numese')
DBSetProp('SECUENCIAS.numese', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_DSECUENCIAS
***************** Ver la configuración para DSECUENCIAS ***************

CREATE SQL VIEW "DSECUENCIAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Secuencias.*, Detagru.descripda FROM detagru Detagru, secuencias Secuencias WHERE Detagru.iddato = Secuencias.idsecuencia   AND Secuencias.idempresa = ?ide ORDER BY Detagru.descripda

DBSetProp('DSECUENCIAS', 'View', 'UpdateType', 1)
DBSetProp('DSECUENCIAS', 'View', 'WhereType', 3)
DBSetProp('DSECUENCIAS', 'View', 'FetchMemo', .T.)
DBSetProp('DSECUENCIAS', 'View', 'SendUpdates', .T.)
DBSetProp('DSECUENCIAS', 'View', 'UseMemoSize', 255)
DBSetProp('DSECUENCIAS', 'View', 'FetchSize', 100)
DBSetProp('DSECUENCIAS', 'View', 'MaxRecords', -1)
DBSetProp('DSECUENCIAS', 'View', 'Tables', 'secuencias')
DBSetProp('DSECUENCIAS', 'View', 'Prepared', .F.)
DBSetProp('DSECUENCIAS', 'View', 'CompareMemo', .T.)
DBSetProp('DSECUENCIAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DSECUENCIAS', 'View', 'FetchSize', 100)
DBSetProp('DSECUENCIAS', 'View', 'Comment', "")
DBSetProp('DSECUENCIAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('DSECUENCIAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DSECUENCIAS
* Props for the DSECUENCIAS.idsecu field.
DBSetProp('DSECUENCIAS.idsecu', 'Field', 'KeyField', .T.)
DBSetProp('DSECUENCIAS.idsecu', 'Field', 'Updatable', .F.)
DBSetProp('DSECUENCIAS.idsecu', 'Field', 'UpdateName', 'secuencias.idsecu')
DBSetProp('DSECUENCIAS.idsecu', 'Field', 'DataType', "I")
* Props for the DSECUENCIAS.idempresa field.
DBSetProp('DSECUENCIAS.idempresa', 'Field', 'KeyField', .F.)
DBSetProp('DSECUENCIAS.idempresa', 'Field', 'Updatable', .T.)
DBSetProp('DSECUENCIAS.idempresa', 'Field', 'UpdateName', 'secuencias.idempresa')
DBSetProp('DSECUENCIAS.idempresa', 'Field', 'DataType', "I")
* Props for the DSECUENCIAS.idsecuencia field.
DBSetProp('DSECUENCIAS.idsecuencia', 'Field', 'KeyField', .F.)
DBSetProp('DSECUENCIAS.idsecuencia', 'Field', 'Updatable', .T.)
DBSetProp('DSECUENCIAS.idsecuencia', 'Field', 'UpdateName', 'secuencias.idsecuencia')
DBSetProp('DSECUENCIAS.idsecuencia', 'Field', 'DataType', "I")
* Props for the DSECUENCIAS.numese field.
DBSetProp('DSECUENCIAS.numese', 'Field', 'KeyField', .F.)
DBSetProp('DSECUENCIAS.numese', 'Field', 'Updatable', .T.)
DBSetProp('DSECUENCIAS.numese', 'Field', 'UpdateName', 'secuencias.numese')
DBSetProp('DSECUENCIAS.numese', 'Field', 'DataType', "I")
* Props for the DSECUENCIAS.descripda field.
DBSetProp('DSECUENCIAS.descripda', 'Field', 'KeyField', .F.)
DBSetProp('DSECUENCIAS.descripda', 'Field', 'Updatable', .F.)
DBSetProp('DSECUENCIAS.descripda', 'Field', 'UpdateName', 'detagru.descripda')
DBSetProp('DSECUENCIAS.descripda', 'Field', 'DataType', "C(40)")
ENDFUNC
 
FUNCTION MakeView_EMPLEADOS
***************** Ver la configuración para EMPLEADOS ***************

CREATE SQL VIEW "EMPLEADOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Empleados.*, Sujetos.scode FROM empleados Empleados, sujetos Sujetos WHERE Empleados.idsujeto = Sujetos.idsujeto   AND Sujetos.semp = ?ide

DBSetProp('EMPLEADOS', 'View', 'UpdateType', 1)
DBSetProp('EMPLEADOS', 'View', 'WhereType', 3)
DBSetProp('EMPLEADOS', 'View', 'FetchMemo', .T.)
DBSetProp('EMPLEADOS', 'View', 'SendUpdates', .T.)
DBSetProp('EMPLEADOS', 'View', 'UseMemoSize', 255)
DBSetProp('EMPLEADOS', 'View', 'FetchSize', 100)
DBSetProp('EMPLEADOS', 'View', 'MaxRecords', -1)
DBSetProp('EMPLEADOS', 'View', 'Tables', 'empleados')
DBSetProp('EMPLEADOS', 'View', 'Prepared', .F.)
DBSetProp('EMPLEADOS', 'View', 'CompareMemo', .T.)
DBSetProp('EMPLEADOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('EMPLEADOS', 'View', 'FetchSize', 100)
DBSetProp('EMPLEADOS', 'View', 'Comment', "")
DBSetProp('EMPLEADOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('EMPLEADOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for EMPLEADOS
* Props for the EMPLEADOS.idsujeto field.
DBSetProp('EMPLEADOS.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('EMPLEADOS.idsujeto', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.idsujeto', 'Field', 'UpdateName', 'empleados.idsujeto')
DBSetProp('EMPLEADOS.idsujeto', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emcargo field.
DBSetProp('EMPLEADOS.emcargo', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emcargo', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emcargo', 'Field', 'UpdateName', 'empleados.emcargo')
DBSetProp('EMPLEADOS.emcargo', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emsexo field.
DBSetProp('EMPLEADOS.emsexo', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emsexo', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emsexo', 'Field', 'UpdateName', 'empleados.emsexo')
DBSetProp('EMPLEADOS.emsexo', 'Field', 'DataType', "C(1)")
* Props for the EMPLEADOS.emsueldo field.
DBSetProp('EMPLEADOS.emsueldo', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emsueldo', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emsueldo', 'Field', 'UpdateName', 'empleados.emsueldo')
DBSetProp('EMPLEADOS.emsueldo', 'Field', 'DataType', "B(8,2)")
* Props for the EMPLEADOS.emnumcar field.
DBSetProp('EMPLEADOS.emnumcar', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emnumcar', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emnumcar', 'Field', 'UpdateName', 'empleados.emnumcar')
DBSetProp('EMPLEADOS.emnumcar', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emestciv field.
DBSetProp('EMPLEADOS.emestciv', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emestciv', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emestciv', 'Field', 'UpdateName', 'empleados.emestciv')
DBSetProp('EMPLEADOS.emestciv', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emnumiess field.
DBSetProp('EMPLEADOS.emnumiess', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emnumiess', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emnumiess', 'Field', 'UpdateName', 'empleados.emnumiess')
DBSetProp('EMPLEADOS.emnumiess', 'Field', 'DataType', "C(10)")
* Props for the EMPLEADOS.emfecing field.
DBSetProp('EMPLEADOS.emfecing', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emfecing', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emfecing', 'Field', 'UpdateName', 'empleados.emfecing')
DBSetProp('EMPLEADOS.emfecing', 'Field', 'DataType', "D")
* Props for the EMPLEADOS.emfecnac field.
DBSetProp('EMPLEADOS.emfecnac', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emfecnac', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emfecnac', 'Field', 'UpdateName', 'empleados.emfecnac')
DBSetProp('EMPLEADOS.emfecnac', 'Field', 'DataType', "D")
* Props for the EMPLEADOS.emfecsal field.
DBSetProp('EMPLEADOS.emfecsal', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emfecsal', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emfecsal', 'Field', 'UpdateName', 'empleados.emfecsal')
DBSetProp('EMPLEADOS.emfecsal', 'Field', 'DataType', "D")
* Props for the EMPLEADOS.emcodocuiess field.
DBSetProp('EMPLEADOS.emcodocuiess', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emcodocuiess', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emcodocuiess', 'Field', 'UpdateName', 'empleados.emcodocuiess')
DBSetProp('EMPLEADOS.emcodocuiess', 'Field', 'DataType', "C(10)")
* Props for the EMPLEADOS.emnumcta field.
DBSetProp('EMPLEADOS.emnumcta', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emnumcta', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emnumcta', 'Field', 'UpdateName', 'empleados.emnumcta')
DBSetProp('EMPLEADOS.emnumcta', 'Field', 'DataType', "C(10)")
* Props for the EMPLEADOS.emtipcta field.
DBSetProp('EMPLEADOS.emtipcta', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emtipcta', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emtipcta', 'Field', 'UpdateName', 'empleados.emtipcta')
DBSetProp('EMPLEADOS.emtipcta', 'Field', 'DataType', "C(1)")
* Props for the EMPLEADOS.emcoddep field.
DBSetProp('EMPLEADOS.emcoddep', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emcoddep', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emcoddep', 'Field', 'UpdateName', 'empleados.emcoddep')
DBSetProp('EMPLEADOS.emcoddep', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emisiess field.
DBSetProp('EMPLEADOS.emisiess', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emisiess', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emisiess', 'Field', 'UpdateName', 'empleados.emisiess')
DBSetProp('EMPLEADOS.emisiess', 'Field', 'DataType', "C(1)")
* Props for the EMPLEADOS.emcodtit field.
DBSetProp('EMPLEADOS.emcodtit', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emcodtit', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emcodtit', 'Field', 'UpdateName', 'empleados.emcodtit')
DBSetProp('EMPLEADOS.emcodtit', 'Field', 'DataType', "I")
* Props for the EMPLEADOS.emisactivo field.
DBSetProp('EMPLEADOS.emisactivo', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.emisactivo', 'Field', 'Updatable', .T.)
DBSetProp('EMPLEADOS.emisactivo', 'Field', 'UpdateName', 'empleados.emisactivo')
DBSetProp('EMPLEADOS.emisactivo', 'Field', 'DataType', "C(1)")
* Props for the EMPLEADOS.scode field.
DBSetProp('EMPLEADOS.scode', 'Field', 'KeyField', .F.)
DBSetProp('EMPLEADOS.scode', 'Field', 'Updatable', .F.)
DBSetProp('EMPLEADOS.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('EMPLEADOS.scode', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_PRODUCTORES
***************** Ver la configuración para PRODUCTORES ***************

CREATE SQL VIEW "PRODUCTORES" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Productores.*, Sujetos.scode FROM productores Productores, sujetos Sujetos WHERE Productores.idsujeto = Sujetos.idsujeto   AND Sujetos.semp = ?ide

DBSetProp('PRODUCTORES', 'View', 'UpdateType', 1)
DBSetProp('PRODUCTORES', 'View', 'WhereType', 3)
DBSetProp('PRODUCTORES', 'View', 'FetchMemo', .T.)
DBSetProp('PRODUCTORES', 'View', 'SendUpdates', .T.)
DBSetProp('PRODUCTORES', 'View', 'UseMemoSize', 255)
DBSetProp('PRODUCTORES', 'View', 'FetchSize', 100)
DBSetProp('PRODUCTORES', 'View', 'MaxRecords', -1)
DBSetProp('PRODUCTORES', 'View', 'Tables', 'productores')
DBSetProp('PRODUCTORES', 'View', 'Prepared', .F.)
DBSetProp('PRODUCTORES', 'View', 'CompareMemo', .T.)
DBSetProp('PRODUCTORES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PRODUCTORES', 'View', 'FetchSize', 100)
DBSetProp('PRODUCTORES', 'View', 'Comment', "")
DBSetProp('PRODUCTORES', 'View', 'BatchUpdateCount', 1)
DBSetProp('PRODUCTORES', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for PRODUCTORES
* Props for the PRODUCTORES.idsujeto field.
DBSetProp('PRODUCTORES.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('PRODUCTORES.idsujeto', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.idsujeto', 'Field', 'UpdateName', 'productores.idsujeto')
DBSetProp('PRODUCTORES.idsujeto', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.procodree field.
DBSetProp('PRODUCTORES.procodree', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.procodree', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.procodree', 'Field', 'UpdateName', 'productores.procodree')
DBSetProp('PRODUCTORES.procodree', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.codzona field.
DBSetProp('PRODUCTORES.codzona', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.codzona', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.codzona', 'Field', 'UpdateName', 'productores.codzona')
DBSetProp('PRODUCTORES.codzona', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.isactivo field.
DBSetProp('PRODUCTORES.isactivo', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.isactivo', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.isactivo', 'Field', 'UpdateName', 'productores.isactivo')
DBSetProp('PRODUCTORES.isactivo', 'Field', 'DataType', "C(1)")
* Props for the PRODUCTORES.codfumi field.
DBSetProp('PRODUCTORES.codfumi', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.codfumi', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.codfumi', 'Field', 'UpdateName', 'productores.codfumi')
DBSetProp('PRODUCTORES.codfumi', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.codpobla field.
DBSetProp('PRODUCTORES.codpobla', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.codpobla', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.codpobla', 'Field', 'UpdateName', 'productores.codpobla')
DBSetProp('PRODUCTORES.codpobla', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.profecing field.
DBSetProp('PRODUCTORES.profecing', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.profecing', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.profecing', 'Field', 'UpdateName', 'productores.profecing')
DBSetProp('PRODUCTORES.profecing', 'Field', 'DataType', "D")
* Props for the PRODUCTORES.idemp field.
DBSetProp('PRODUCTORES.idemp', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.idemp', 'Field', 'Updatable', .T.)
DBSetProp('PRODUCTORES.idemp', 'Field', 'UpdateName', 'productores.idemp')
DBSetProp('PRODUCTORES.idemp', 'Field', 'DataType', "I")
* Props for the PRODUCTORES.scode field.
DBSetProp('PRODUCTORES.scode', 'Field', 'KeyField', .F.)
DBSetProp('PRODUCTORES.scode', 'Field', 'Updatable', .F.)
DBSetProp('PRODUCTORES.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('PRODUCTORES.scode', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SUJETOS
***************** Ver la configuración para SUJETOS ***************

CREATE SQL VIEW "SUJETOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM sujetos Sujetos WHERE Sujetos.semp = ?ide

DBSetProp('SUJETOS', 'View', 'UpdateType', 1)
DBSetProp('SUJETOS', 'View', 'WhereType', 3)
DBSetProp('SUJETOS', 'View', 'FetchMemo', .T.)
DBSetProp('SUJETOS', 'View', 'SendUpdates', .T.)
DBSetProp('SUJETOS', 'View', 'UseMemoSize', 255)
DBSetProp('SUJETOS', 'View', 'FetchSize', 100)
DBSetProp('SUJETOS', 'View', 'MaxRecords', -1)
DBSetProp('SUJETOS', 'View', 'Tables', 'sujetos')
DBSetProp('SUJETOS', 'View', 'Prepared', .F.)
DBSetProp('SUJETOS', 'View', 'CompareMemo', .T.)
DBSetProp('SUJETOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SUJETOS', 'View', 'FetchSize', 100)
DBSetProp('SUJETOS', 'View', 'Comment', "")
DBSetProp('SUJETOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('SUJETOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SUJETOS
* Props for the SUJETOS.idsujeto field.
DBSetProp('SUJETOS.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('SUJETOS.idsujeto', 'Field', 'Updatable', .F.)
DBSetProp('SUJETOS.idsujeto', 'Field', 'UpdateName', 'sujetos.idsujeto')
DBSetProp('SUJETOS.idsujeto', 'Field', 'DataType', "I")
* Props for the SUJETOS.scode field.
DBSetProp('SUJETOS.scode', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.scode', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('SUJETOS.scode', 'Field', 'DataType', "I")
* Props for the SUJETOS.isempleado field.
DBSetProp('SUJETOS.isempleado', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.isempleado', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.isempleado', 'Field', 'UpdateName', 'sujetos.isempleado')
DBSetProp('SUJETOS.isempleado', 'Field', 'DataType', "C(1)")
* Props for the SUJETOS.isproveedor field.
DBSetProp('SUJETOS.isproveedor', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.isproveedor', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.isproveedor', 'Field', 'UpdateName', 'sujetos.isproveedor')
DBSetProp('SUJETOS.isproveedor', 'Field', 'DataType', "C(1)")
* Props for the SUJETOS.isproductor field.
DBSetProp('SUJETOS.isproductor', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.isproductor', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.isproductor', 'Field', 'UpdateName', 'sujetos.isproductor')
DBSetProp('SUJETOS.isproductor', 'Field', 'DataType', "C(1)")
* Props for the SUJETOS.iscliente field.
DBSetProp('SUJETOS.iscliente', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.iscliente', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.iscliente', 'Field', 'UpdateName', 'sujetos.iscliente')
DBSetProp('SUJETOS.iscliente', 'Field', 'DataType', "C(1)")
* Props for the SUJETOS.sname field.
DBSetProp('SUJETOS.sname', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sname', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sname', 'Field', 'UpdateName', 'sujetos.sname')
DBSetProp('SUJETOS.sname', 'Field', 'DataType', "C(40)")
* Props for the SUJETOS.ssri field.
DBSetProp('SUJETOS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.ssri', 'Field', 'UpdateName', 'sujetos.ssri')
DBSetProp('SUJETOS.ssri', 'Field', 'DataType', "C(60)")
* Props for the SUJETOS.scedula field.
DBSetProp('SUJETOS.scedula', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.scedula', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.scedula', 'Field', 'UpdateName', 'sujetos.scedula')
DBSetProp('SUJETOS.scedula', 'Field', 'DataType', "C(10)")
* Props for the SUJETOS.sruc field.
DBSetProp('SUJETOS.sruc', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sruc', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sruc', 'Field', 'UpdateName', 'sujetos.sruc')
DBSetProp('SUJETOS.sruc', 'Field', 'DataType', "C(13)")
* Props for the SUJETOS.spasaporte field.
DBSetProp('SUJETOS.spasaporte', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.spasaporte', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.spasaporte', 'Field', 'UpdateName', 'sujetos.spasaporte')
DBSetProp('SUJETOS.spasaporte', 'Field', 'DataType', "C(25)")
* Props for the SUJETOS.saddr field.
DBSetProp('SUJETOS.saddr', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.saddr', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.saddr', 'Field', 'UpdateName', 'sujetos.saddr')
DBSetProp('SUJETOS.saddr', 'Field', 'DataType', "C(60)")
* Props for the SUJETOS.saddr2 field.
DBSetProp('SUJETOS.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.saddr2', 'Field', 'UpdateName', 'sujetos.saddr2')
DBSetProp('SUJETOS.saddr2', 'Field', 'DataType', "C(60)")
* Props for the SUJETOS.stelf field.
DBSetProp('SUJETOS.stelf', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.stelf', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.stelf', 'Field', 'UpdateName', 'sujetos.stelf')
DBSetProp('SUJETOS.stelf', 'Field', 'DataType', "C(15)")
* Props for the SUJETOS.sfax field.
DBSetProp('SUJETOS.sfax', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sfax', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sfax', 'Field', 'UpdateName', 'sujetos.sfax')
DBSetProp('SUJETOS.sfax', 'Field', 'DataType', "C(15)")
* Props for the SUJETOS.scel field.
DBSetProp('SUJETOS.scel', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.scel', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.scel', 'Field', 'UpdateName', 'sujetos.scel')
DBSetProp('SUJETOS.scel', 'Field', 'DataType', "C(15)")
* Props for the SUJETOS.smail field.
DBSetProp('SUJETOS.smail', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.smail', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.smail', 'Field', 'UpdateName', 'sujetos.smail')
DBSetProp('SUJETOS.smail', 'Field', 'DataType', "C(50)")
* Props for the SUJETOS.swww field.
DBSetProp('SUJETOS.swww', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.swww', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.swww', 'Field', 'UpdateName', 'sujetos.swww')
DBSetProp('SUJETOS.swww', 'Field', 'DataType', "C(50)")
* Props for the SUJETOS.semp field.
DBSetProp('SUJETOS.semp', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.semp', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.semp', 'Field', 'UpdateName', 'sujetos.semp')
DBSetProp('SUJETOS.semp', 'Field', 'DataType', "I")
* Props for the SUJETOS.smoney field.
DBSetProp('SUJETOS.smoney', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.smoney', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.smoney', 'Field', 'UpdateName', 'sujetos.smoney')
DBSetProp('SUJETOS.smoney', 'Field', 'DataType', "I")
* Props for the SUJETOS.sprov field.
DBSetProp('SUJETOS.sprov', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sprov', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sprov', 'Field', 'UpdateName', 'sujetos.sprov')
DBSetProp('SUJETOS.sprov', 'Field', 'DataType', "I")
* Props for the SUJETOS.ssaldo field.
DBSetProp('SUJETOS.ssaldo', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.ssaldo', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.ssaldo', 'Field', 'UpdateName', 'sujetos.ssaldo')
DBSetProp('SUJETOS.ssaldo', 'Field', 'DataType', "B(8,2)")
* Props for the SUJETOS.scredito field.
DBSetProp('SUJETOS.scredito', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.scredito', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.scredito', 'Field', 'UpdateName', 'sujetos.scredito')
DBSetProp('SUJETOS.scredito', 'Field', 'DataType', "B(8,2)")
* Props for the SUJETOS.scheques field.
DBSetProp('SUJETOS.scheques', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.scheques', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.scheques', 'Field', 'UpdateName', 'sujetos.scheques')
DBSetProp('SUJETOS.scheques', 'Field', 'DataType', "B(8,2)")
* Props for the SUJETOS.sprotesto field.
DBSetProp('SUJETOS.sprotesto', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sprotesto', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sprotesto', 'Field', 'UpdateName', 'sujetos.sprotesto')
DBSetProp('SUJETOS.sprotesto', 'Field', 'DataType', "C(1)")
* Props for the SUJETOS.stag field.
DBSetProp('SUJETOS.stag', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.stag', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.stag', 'Field', 'UpdateName', 'sujetos.stag')
DBSetProp('SUJETOS.stag', 'Field', 'DataType', "C(10)")
* Props for the SUJETOS.sciudad field.
DBSetProp('SUJETOS.sciudad', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.sciudad', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.sciudad', 'Field', 'UpdateName', 'sujetos.sciudad')
DBSetProp('SUJETOS.sciudad', 'Field', 'DataType', "I")
* Props for the SUJETOS.snumcasa field.
DBSetProp('SUJETOS.snumcasa', 'Field', 'KeyField', .F.)
DBSetProp('SUJETOS.snumcasa', 'Field', 'Updatable', .T.)
DBSetProp('SUJETOS.snumcasa', 'Field', 'UpdateName', 'sujetos.snumcasa')
DBSetProp('SUJETOS.snumcasa', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_HACIENDAS
***************** Ver la configuración para HACIENDAS ***************

CREATE SQL VIEW "HACIENDAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM haciendas Haciendas

DBSetProp('HACIENDAS', 'View', 'UpdateType', 1)
DBSetProp('HACIENDAS', 'View', 'WhereType', 3)
DBSetProp('HACIENDAS', 'View', 'FetchMemo', .T.)
DBSetProp('HACIENDAS', 'View', 'SendUpdates', .T.)
DBSetProp('HACIENDAS', 'View', 'UseMemoSize', 255)
DBSetProp('HACIENDAS', 'View', 'FetchSize', 100)
DBSetProp('HACIENDAS', 'View', 'MaxRecords', -1)
DBSetProp('HACIENDAS', 'View', 'Tables', 'haciendas')
DBSetProp('HACIENDAS', 'View', 'Prepared', .F.)
DBSetProp('HACIENDAS', 'View', 'CompareMemo', .T.)
DBSetProp('HACIENDAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HACIENDAS', 'View', 'FetchSize', 100)
DBSetProp('HACIENDAS', 'View', 'Comment', "")
DBSetProp('HACIENDAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('HACIENDAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for HACIENDAS
* Props for the HACIENDAS.hacode field.
DBSetProp('HACIENDAS.hacode', 'Field', 'KeyField', .T.)
DBSetProp('HACIENDAS.hacode', 'Field', 'Updatable', .F.)
DBSetProp('HACIENDAS.hacode', 'Field', 'UpdateName', 'haciendas.hacode')
DBSetProp('HACIENDAS.hacode', 'Field', 'DataType', "I")
* Props for the HACIENDAS.idsujeto field.
DBSetProp('HACIENDAS.idsujeto', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.idsujeto', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.idsujeto', 'Field', 'UpdateName', 'haciendas.idsujeto')
DBSetProp('HACIENDAS.idsujeto', 'Field', 'DataType', "I")
* Props for the HACIENDAS.haname field.
DBSetProp('HACIENDAS.haname', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.haname', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.haname', 'Field', 'UpdateName', 'haciendas.haname')
DBSetProp('HACIENDAS.haname', 'Field', 'DataType', "C(35)")
* Props for the HACIENDAS.hacodmin field.
DBSetProp('HACIENDAS.hacodmin', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.hacodmin', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.hacodmin', 'Field', 'UpdateName', 'haciendas.hacodmin')
DBSetProp('HACIENDAS.hacodmin', 'Field', 'DataType', "C(10)")
* Props for the HACIENDAS.hanumins field.
DBSetProp('HACIENDAS.hanumins', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.hanumins', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.hanumins', 'Field', 'UpdateName', 'haciendas.hanumins')
DBSetProp('HACIENDAS.hanumins', 'Field', 'DataType', "C(10)")
* Props for the HACIENDAS.haprovin field.
DBSetProp('HACIENDAS.haprovin', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.haprovin', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.haprovin', 'Field', 'UpdateName', 'haciendas.haprovin')
DBSetProp('HACIENDAS.haprovin', 'Field', 'DataType', "I")
* Props for the HACIENDAS.hacodzo field.
DBSetProp('HACIENDAS.hacodzo', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.hacodzo', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.hacodzo', 'Field', 'UpdateName', 'haciendas.hacodzo')
DBSetProp('HACIENDAS.hacodzo', 'Field', 'DataType', "I")
* Props for the HACIENDAS.hahectec field.
DBSetProp('HACIENDAS.hahectec', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.hahectec', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.hahectec', 'Field', 'UpdateName', 'haciendas.hahectec')
DBSetProp('HACIENDAS.hahectec', 'Field', 'DataType', "B(8,2)")
* Props for the HACIENDAS.hahecins field.
DBSetProp('HACIENDAS.hahecins', 'Field', 'KeyField', .F.)
DBSetProp('HACIENDAS.hahecins', 'Field', 'Updatable', .T.)
DBSetProp('HACIENDAS.hahecins', 'Field', 'UpdateName', 'haciendas.hahecins')
DBSetProp('HACIENDAS.hahecins', 'Field', 'DataType', "B(8,2)")
ENDFUNC
 
FUNCTION MakeView_DOCUREVERSO
***************** Ver la configuración para DOCUREVERSO ***************

CREATE SQL VIEW "DOCUREVERSO" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM docuse Docuse

DBSetProp('DOCUREVERSO', 'View', 'UpdateType', 1)
DBSetProp('DOCUREVERSO', 'View', 'WhereType', 3)
DBSetProp('DOCUREVERSO', 'View', 'FetchMemo', .T.)
DBSetProp('DOCUREVERSO', 'View', 'SendUpdates', .F.)
DBSetProp('DOCUREVERSO', 'View', 'UseMemoSize', 255)
DBSetProp('DOCUREVERSO', 'View', 'FetchSize', 100)
DBSetProp('DOCUREVERSO', 'View', 'MaxRecords', -1)
DBSetProp('DOCUREVERSO', 'View', 'Tables', '')
DBSetProp('DOCUREVERSO', 'View', 'Prepared', .F.)
DBSetProp('DOCUREVERSO', 'View', 'CompareMemo', .T.)
DBSetProp('DOCUREVERSO', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOCUREVERSO', 'View', 'FetchSize', 100)
DBSetProp('DOCUREVERSO', 'View', 'Comment', "")
DBSetProp('DOCUREVERSO', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOCUREVERSO', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DOCUREVERSO
* Props for the DOCUREVERSO.iddocu field.
DBSetProp('DOCUREVERSO.iddocu', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.iddocu', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.iddocu', 'Field', 'UpdateName', 'docuse.iddocu')
DBSetProp('DOCUREVERSO.iddocu', 'Field', 'DataType', "I")
* Props for the DOCUREVERSO.idemp field.
DBSetProp('DOCUREVERSO.idemp', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.idemp', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.idemp', 'Field', 'UpdateName', 'docuse.idemp')
DBSetProp('DOCUREVERSO.idemp', 'Field', 'DataType', "I")
* Props for the DOCUREVERSO.numactual field.
DBSetProp('DOCUREVERSO.numactual', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.numactual', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.numactual', 'Field', 'UpdateName', 'docuse.numactual')
DBSetProp('DOCUREVERSO.numactual', 'Field', 'DataType', "I")
* Props for the DOCUREVERSO.tipodoc field.
DBSetProp('DOCUREVERSO.tipodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.tipodoc', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.tipodoc', 'Field', 'UpdateName', 'docuse.tipodoc')
DBSetProp('DOCUREVERSO.tipodoc', 'Field', 'DataType', "I")
* Props for the DOCUREVERSO.subtipodoc field.
DBSetProp('DOCUREVERSO.subtipodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.subtipodoc', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.subtipodoc', 'Field', 'UpdateName', 'docuse.subtipodoc')
DBSetProp('DOCUREVERSO.subtipodoc', 'Field', 'DataType', "I")
* Props for the DOCUREVERSO.idreversodoc field.
DBSetProp('DOCUREVERSO.idreversodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUREVERSO.idreversodoc', 'Field', 'Updatable', .F.)
DBSetProp('DOCUREVERSO.idreversodoc', 'Field', 'UpdateName', 'docuse.idreversodoc')
DBSetProp('DOCUREVERSO.idreversodoc', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SUBTIPOS
***************** Ver la configuración para SUBTIPOS ***************

CREATE SQL VIEW "SUBTIPOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM subtipos Subtipos

DBSetProp('SUBTIPOS', 'View', 'UpdateType', 1)
DBSetProp('SUBTIPOS', 'View', 'WhereType', 3)
DBSetProp('SUBTIPOS', 'View', 'FetchMemo', .T.)
DBSetProp('SUBTIPOS', 'View', 'SendUpdates', .T.)
DBSetProp('SUBTIPOS', 'View', 'UseMemoSize', 255)
DBSetProp('SUBTIPOS', 'View', 'FetchSize', 100)
DBSetProp('SUBTIPOS', 'View', 'MaxRecords', -1)
DBSetProp('SUBTIPOS', 'View', 'Tables', 'subtipos')
DBSetProp('SUBTIPOS', 'View', 'Prepared', .F.)
DBSetProp('SUBTIPOS', 'View', 'CompareMemo', .T.)
DBSetProp('SUBTIPOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SUBTIPOS', 'View', 'FetchSize', 100)
DBSetProp('SUBTIPOS', 'View', 'Comment', "")
DBSetProp('SUBTIPOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('SUBTIPOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SUBTIPOS
* Props for the SUBTIPOS.idsubtipo field.
DBSetProp('SUBTIPOS.idsubtipo', 'Field', 'KeyField', .T.)
DBSetProp('SUBTIPOS.idsubtipo', 'Field', 'Updatable', .F.)
DBSetProp('SUBTIPOS.idsubtipo', 'Field', 'UpdateName', 'subtipos.idsubtipo')
DBSetProp('SUBTIPOS.idsubtipo', 'Field', 'DataType', "I")
* Props for the SUBTIPOS.iddato field.
DBSetProp('SUBTIPOS.iddato', 'Field', 'KeyField', .F.)
DBSetProp('SUBTIPOS.iddato', 'Field', 'Updatable', .T.)
DBSetProp('SUBTIPOS.iddato', 'Field', 'UpdateName', 'subtipos.iddato')
DBSetProp('SUBTIPOS.iddato', 'Field', 'DataType', "B(8,2)")
* Props for the SUBTIPOS.subname field.
DBSetProp('SUBTIPOS.subname', 'Field', 'KeyField', .F.)
DBSetProp('SUBTIPOS.subname', 'Field', 'Updatable', .T.)
DBSetProp('SUBTIPOS.subname', 'Field', 'UpdateName', 'subtipos.subname')
DBSetProp('SUBTIPOS.subname', 'Field', 'DataType', "C(30)")
ENDFUNC
 
FUNCTION MakeView_AMBIEMPRE
***************** Ver la configuración para AMBIEMPRE ***************

CREATE SQL VIEW "AMBIEMPRE" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM ambiempre Ambiempre WHERE Ambiempre.ecode = ?ide

DBSetProp('AMBIEMPRE', 'View', 'UpdateType', 1)
DBSetProp('AMBIEMPRE', 'View', 'WhereType', 3)
DBSetProp('AMBIEMPRE', 'View', 'FetchMemo', .T.)
DBSetProp('AMBIEMPRE', 'View', 'SendUpdates', .F.)
DBSetProp('AMBIEMPRE', 'View', 'UseMemoSize', 255)
DBSetProp('AMBIEMPRE', 'View', 'FetchSize', 100)
DBSetProp('AMBIEMPRE', 'View', 'MaxRecords', -1)
DBSetProp('AMBIEMPRE', 'View', 'Tables', '')
DBSetProp('AMBIEMPRE', 'View', 'Prepared', .F.)
DBSetProp('AMBIEMPRE', 'View', 'CompareMemo', .T.)
DBSetProp('AMBIEMPRE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('AMBIEMPRE', 'View', 'FetchSize', 100)
DBSetProp('AMBIEMPRE', 'View', 'Comment', "")
DBSetProp('AMBIEMPRE', 'View', 'BatchUpdateCount', 1)
DBSetProp('AMBIEMPRE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for AMBIEMPRE
* Props for the AMBIEMPRE.ecode field.
DBSetProp('AMBIEMPRE.ecode', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.ecode', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.ecode', 'Field', 'UpdateName', 'ambiempre.ecode')
DBSetProp('AMBIEMPRE.ecode', 'Field', 'DataType', "I")
* Props for the AMBIEMPRE.ssri field.
DBSetProp('AMBIEMPRE.ssri', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.ssri', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.ssri', 'Field', 'UpdateName', 'ambiempre.ssri')
DBSetProp('AMBIEMPRE.ssri', 'Field', 'DataType', "C(60)")
* Props for the AMBIEMPRE.fecini field.
DBSetProp('AMBIEMPRE.fecini', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.fecini', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.fecini', 'Field', 'UpdateName', 'ambiempre.fecini')
DBSetProp('AMBIEMPRE.fecini', 'Field', 'DataType', "D")
* Props for the AMBIEMPRE.fecfin field.
DBSetProp('AMBIEMPRE.fecfin', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.fecfin', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.fecfin', 'Field', 'UpdateName', 'ambiempre.fecfin')
DBSetProp('AMBIEMPRE.fecfin', 'Field', 'DataType', "D")
* Props for the AMBIEMPRE.pdocode field.
DBSetProp('AMBIEMPRE.pdocode', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.pdocode', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.pdocode', 'Field', 'UpdateName', 'ambiempre.pdocode')
DBSetProp('AMBIEMPRE.pdocode', 'Field', 'DataType', "I")
* Props for the AMBIEMPRE.moneda field.
DBSetProp('AMBIEMPRE.moneda', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.moneda', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.moneda', 'Field', 'UpdateName', 'ambiempre.moneda')
DBSetProp('AMBIEMPRE.moneda', 'Field', 'DataType', "I")
* Props for the AMBIEMPRE.moname field.
DBSetProp('AMBIEMPRE.moname', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.moname', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.moname', 'Field', 'UpdateName', 'ambiempre.moname')
DBSetProp('AMBIEMPRE.moname', 'Field', 'DataType', "C(40)")
* Props for the AMBIEMPRE.nivelplan field.
DBSetProp('AMBIEMPRE.nivelplan', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.nivelplan', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.nivelplan', 'Field', 'UpdateName', 'ambiempre.nivelplan')
DBSetProp('AMBIEMPRE.nivelplan', 'Field', 'DataType', "I")
* Props for the AMBIEMPRE.isupdate field.
DBSetProp('AMBIEMPRE.isupdate', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.isupdate', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.isupdate', 'Field', 'UpdateName', 'ambiempre.isupdate')
DBSetProp('AMBIEMPRE.isupdate', 'Field', 'DataType', "C(1)")
* Props for the AMBIEMPRE.isopen field.
DBSetProp('AMBIEMPRE.isopen', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.isopen', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.isopen', 'Field', 'UpdateName', 'ambiempre.isopen')
DBSetProp('AMBIEMPRE.isopen', 'Field', 'DataType', "C(1)")
* Props for the AMBIEMPRE.codemp field.
DBSetProp('AMBIEMPRE.codemp', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.codemp', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.codemp', 'Field', 'UpdateName', 'ambiempre.codemp')
DBSetProp('AMBIEMPRE.codemp', 'Field', 'DataType', "I")
* Props for the AMBIEMPRE.actual field.
DBSetProp('AMBIEMPRE.actual', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.actual', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.actual', 'Field', 'UpdateName', 'ambiempre.actual')
DBSetProp('AMBIEMPRE.actual', 'Field', 'DataType', "C(15)")
* Props for the AMBIEMPRE.openx field.
DBSetProp('AMBIEMPRE.openx', 'Field', 'KeyField', .F.)
DBSetProp('AMBIEMPRE.openx', 'Field', 'Updatable', .F.)
DBSetProp('AMBIEMPRE.openx', 'Field', 'UpdateName', 'ambiempre.openx')
DBSetProp('AMBIEMPRE.openx', 'Field', 'DataType', "C(15)")
ENDFUNC
 
FUNCTION MakeView_RUBROS
***************** Ver la configuración para RUBROS ***************

CREATE SQL VIEW "RUBROS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM rubros Rubros WHERE Rubros.idemp = ?ide

DBSetProp('RUBROS', 'View', 'UpdateType', 1)
DBSetProp('RUBROS', 'View', 'WhereType', 3)
DBSetProp('RUBROS', 'View', 'FetchMemo', .T.)
DBSetProp('RUBROS', 'View', 'SendUpdates', .T.)
DBSetProp('RUBROS', 'View', 'UseMemoSize', 255)
DBSetProp('RUBROS', 'View', 'FetchSize', 100)
DBSetProp('RUBROS', 'View', 'MaxRecords', -1)
DBSetProp('RUBROS', 'View', 'Tables', 'rubros')
DBSetProp('RUBROS', 'View', 'Prepared', .F.)
DBSetProp('RUBROS', 'View', 'CompareMemo', .T.)
DBSetProp('RUBROS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('RUBROS', 'View', 'FetchSize', 100)
DBSetProp('RUBROS', 'View', 'Comment', "")
DBSetProp('RUBROS', 'View', 'BatchUpdateCount', 1)
DBSetProp('RUBROS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for RUBROS
* Props for the RUBROS.rubcode field.
DBSetProp('RUBROS.rubcode', 'Field', 'KeyField', .T.)
DBSetProp('RUBROS.rubcode', 'Field', 'Updatable', .F.)
DBSetProp('RUBROS.rubcode', 'Field', 'UpdateName', 'rubros.rubcode')
DBSetProp('RUBROS.rubcode', 'Field', 'DataType', "I")
* Props for the RUBROS.rubtab field.
DBSetProp('RUBROS.rubtab', 'Field', 'KeyField', .F.)
DBSetProp('RUBROS.rubtab', 'Field', 'Updatable', .T.)
DBSetProp('RUBROS.rubtab', 'Field', 'UpdateName', 'rubros.rubtab')
DBSetProp('RUBROS.rubtab', 'Field', 'DataType', "C(15)")
* Props for the RUBROS.rubname field.
DBSetProp('RUBROS.rubname', 'Field', 'KeyField', .F.)
DBSetProp('RUBROS.rubname', 'Field', 'Updatable', .T.)
DBSetProp('RUBROS.rubname', 'Field', 'UpdateName', 'rubros.rubname')
DBSetProp('RUBROS.rubname', 'Field', 'DataType', "C(40)")
* Props for the RUBROS.rubtype field.
DBSetProp('RUBROS.rubtype', 'Field', 'KeyField', .F.)
DBSetProp('RUBROS.rubtype', 'Field', 'Updatable', .T.)
DBSetProp('RUBROS.rubtype', 'Field', 'UpdateName', 'rubros.rubtype')
DBSetProp('RUBROS.rubtype', 'Field', 'DataType', "C(1)")
* Props for the RUBROS.rubformula field.
DBSetProp('RUBROS.rubformula', 'Field', 'KeyField', .F.)
DBSetProp('RUBROS.rubformula', 'Field', 'Updatable', .T.)
DBSetProp('RUBROS.rubformula', 'Field', 'UpdateName', 'rubros.rubformula')
DBSetProp('RUBROS.rubformula', 'Field', 'DataType', "C(100)")
* Props for the RUBROS.idemp field.
DBSetProp('RUBROS.idemp', 'Field', 'KeyField', .F.)
DBSetProp('RUBROS.idemp', 'Field', 'Updatable', .T.)
DBSetProp('RUBROS.idemp', 'Field', 'UpdateName', 'rubros.idemp')
DBSetProp('RUBROS.idemp', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_DDOCUSE
***************** Ver la configuración para DDOCUSE ***************

CREATE SQL VIEW "DDOCUSE" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Ddocuse.*, Rubros.rubname FROM ddocuse Ddocuse, rubros Rubros WHERE Ddocuse.rubcode = Rubros.rubcode ORDER BY Rubros.rubname

DBSetProp('DDOCUSE', 'View', 'UpdateType', 1)
DBSetProp('DDOCUSE', 'View', 'WhereType', 3)
DBSetProp('DDOCUSE', 'View', 'FetchMemo', .T.)
DBSetProp('DDOCUSE', 'View', 'SendUpdates', .T.)
DBSetProp('DDOCUSE', 'View', 'UseMemoSize', 255)
DBSetProp('DDOCUSE', 'View', 'FetchSize', 100)
DBSetProp('DDOCUSE', 'View', 'MaxRecords', -1)
DBSetProp('DDOCUSE', 'View', 'Tables', 'ddocuse')
DBSetProp('DDOCUSE', 'View', 'Prepared', .F.)
DBSetProp('DDOCUSE', 'View', 'CompareMemo', .T.)
DBSetProp('DDOCUSE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DDOCUSE', 'View', 'FetchSize', 100)
DBSetProp('DDOCUSE', 'View', 'Comment', "")
DBSetProp('DDOCUSE', 'View', 'BatchUpdateCount', 1)
DBSetProp('DDOCUSE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DDOCUSE
* Props for the DDOCUSE.iddocu field.
DBSetProp('DDOCUSE.iddocu', 'Field', 'KeyField', .T.)
DBSetProp('DDOCUSE.iddocu', 'Field', 'Updatable', .T.)
DBSetProp('DDOCUSE.iddocu', 'Field', 'UpdateName', 'ddocuse.iddocu')
DBSetProp('DDOCUSE.iddocu', 'Field', 'DataType', "I")
* Props for the DDOCUSE.rubcode field.
DBSetProp('DDOCUSE.rubcode', 'Field', 'KeyField', .T.)
DBSetProp('DDOCUSE.rubcode', 'Field', 'Updatable', .T.)
DBSetProp('DDOCUSE.rubcode', 'Field', 'UpdateName', 'ddocuse.rubcode')
DBSetProp('DDOCUSE.rubcode', 'Field', 'DataType', "I")
* Props for the DDOCUSE.rubname field.
DBSetProp('DDOCUSE.rubname', 'Field', 'KeyField', .F.)
DBSetProp('DDOCUSE.rubname', 'Field', 'Updatable', .F.)
DBSetProp('DDOCUSE.rubname', 'Field', 'UpdateName', 'rubros.rubname')
DBSetProp('DDOCUSE.rubname', 'Field', 'DataType', "C(40)")
ENDFUNC
 
FUNCTION MakeView_PLANCUENTA
***************** Ver la configuración para PLANCUENTA ***************

CREATE SQL VIEW "PLANCUENTA" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM plancuenta Plancuenta WHERE Plancuenta.pdocode = ?iprd

DBSetProp('PLANCUENTA', 'View', 'UpdateType', 1)
DBSetProp('PLANCUENTA', 'View', 'WhereType', 3)
DBSetProp('PLANCUENTA', 'View', 'FetchMemo', .T.)
DBSetProp('PLANCUENTA', 'View', 'SendUpdates', .T.)
DBSetProp('PLANCUENTA', 'View', 'UseMemoSize', 255)
DBSetProp('PLANCUENTA', 'View', 'FetchSize', 100)
DBSetProp('PLANCUENTA', 'View', 'MaxRecords', -1)
DBSetProp('PLANCUENTA', 'View', 'Tables', 'plancuenta')
DBSetProp('PLANCUENTA', 'View', 'Prepared', .F.)
DBSetProp('PLANCUENTA', 'View', 'CompareMemo', .T.)
DBSetProp('PLANCUENTA', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PLANCUENTA', 'View', 'FetchSize', 100)
DBSetProp('PLANCUENTA', 'View', 'Comment', "")
DBSetProp('PLANCUENTA', 'View', 'BatchUpdateCount', 1)
DBSetProp('PLANCUENTA', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for PLANCUENTA
* Props for the PLANCUENTA.idplancuenta field.
DBSetProp('PLANCUENTA.idplancuenta', 'Field', 'KeyField', .T.)
DBSetProp('PLANCUENTA.idplancuenta', 'Field', 'Updatable', .F.)
DBSetProp('PLANCUENTA.idplancuenta', 'Field', 'UpdateName', 'plancuenta.idplancuenta')
DBSetProp('PLANCUENTA.idplancuenta', 'Field', 'DataType', "I")
* Props for the PLANCUENTA.plancod field.
DBSetProp('PLANCUENTA.plancod', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.plancod', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.plancod', 'Field', 'UpdateName', 'plancuenta.plancod')
DBSetProp('PLANCUENTA.plancod', 'Field', 'DataType', "C(20)")
* Props for the PLANCUENTA.idcuenta field.
DBSetProp('PLANCUENTA.idcuenta', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.idcuenta', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.idcuenta', 'Field', 'UpdateName', 'plancuenta.idcuenta')
DBSetProp('PLANCUENTA.idcuenta', 'Field', 'DataType', "I")
* Props for the PLANCUENTA.plannivel field.
DBSetProp('PLANCUENTA.plannivel', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.plannivel', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.plannivel', 'Field', 'UpdateName', 'plancuenta.plannivel')
DBSetProp('PLANCUENTA.plannivel', 'Field', 'DataType', "I")
* Props for the PLANCUENTA.plantype field.
DBSetProp('PLANCUENTA.plantype', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.plantype', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.plantype', 'Field', 'UpdateName', 'plancuenta.plantype')
DBSetProp('PLANCUENTA.plantype', 'Field', 'DataType', "C(1)")
* Props for the PLANCUENTA.auxcode field.
DBSetProp('PLANCUENTA.auxcode', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.auxcode', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.auxcode', 'Field', 'UpdateName', 'plancuenta.auxcode')
DBSetProp('PLANCUENTA.auxcode', 'Field', 'DataType', "I")
* Props for the PLANCUENTA.pdocode field.
DBSetProp('PLANCUENTA.pdocode', 'Field', 'KeyField', .F.)
DBSetProp('PLANCUENTA.pdocode', 'Field', 'Updatable', .T.)
DBSetProp('PLANCUENTA.pdocode', 'Field', 'UpdateName', 'plancuenta.pdocode')
DBSetProp('PLANCUENTA.pdocode', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_PERIODOS
***************** Ver la configuración para PERIODOS ***************

CREATE SQL VIEW "PERIODOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM vperiodos Vperiodos WHERE Vperiodos.codemp = ?ide ORDER BY Vperiodos.fecini DESC

DBSetProp('PERIODOS', 'View', 'UpdateType', 1)
DBSetProp('PERIODOS', 'View', 'WhereType', 3)
DBSetProp('PERIODOS', 'View', 'FetchMemo', .T.)
DBSetProp('PERIODOS', 'View', 'SendUpdates', .T.)
DBSetProp('PERIODOS', 'View', 'UseMemoSize', 255)
DBSetProp('PERIODOS', 'View', 'FetchSize', 100)
DBSetProp('PERIODOS', 'View', 'MaxRecords', -1)
DBSetProp('PERIODOS', 'View', 'Tables', 'vperiodos')
DBSetProp('PERIODOS', 'View', 'Prepared', .F.)
DBSetProp('PERIODOS', 'View', 'CompareMemo', .T.)
DBSetProp('PERIODOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PERIODOS', 'View', 'FetchSize', 100)
DBSetProp('PERIODOS', 'View', 'Comment', "")
DBSetProp('PERIODOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERIODOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for PERIODOS
* Props for the PERIODOS.pdocode field.
DBSetProp('PERIODOS.pdocode', 'Field', 'KeyField', .T.)
DBSetProp('PERIODOS.pdocode', 'Field', 'Updatable', .F.)
DBSetProp('PERIODOS.pdocode', 'Field', 'UpdateName', 'vperiodos.pdocode')
DBSetProp('PERIODOS.pdocode', 'Field', 'DataType', "I")
* Props for the PERIODOS.fecini field.
DBSetProp('PERIODOS.fecini', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.fecini', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.fecini', 'Field', 'UpdateName', 'vperiodos.fecini')
DBSetProp('PERIODOS.fecini', 'Field', 'DataType', "D")
* Props for the PERIODOS.fecfin field.
DBSetProp('PERIODOS.fecfin', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.fecfin', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.fecfin', 'Field', 'UpdateName', 'vperiodos.fecfin')
DBSetProp('PERIODOS.fecfin', 'Field', 'DataType', "D")
* Props for the PERIODOS.moneda field.
DBSetProp('PERIODOS.moneda', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.moneda', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.moneda', 'Field', 'UpdateName', 'vperiodos.moneda')
DBSetProp('PERIODOS.moneda', 'Field', 'DataType', "I")
* Props for the PERIODOS.nivelplan field.
DBSetProp('PERIODOS.nivelplan', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.nivelplan', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.nivelplan', 'Field', 'UpdateName', 'vperiodos.nivelplan')
DBSetProp('PERIODOS.nivelplan', 'Field', 'DataType', "I")
* Props for the PERIODOS.isupdate field.
DBSetProp('PERIODOS.isupdate', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.isupdate', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.isupdate', 'Field', 'UpdateName', 'vperiodos.isupdate')
DBSetProp('PERIODOS.isupdate', 'Field', 'DataType', "C(1)")
* Props for the PERIODOS.codemp field.
DBSetProp('PERIODOS.codemp', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.codemp', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.codemp', 'Field', 'UpdateName', 'vperiodos.codemp')
DBSetProp('PERIODOS.codemp', 'Field', 'DataType', "I")
* Props for the PERIODOS.isopen field.
DBSetProp('PERIODOS.isopen', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.isopen', 'Field', 'Updatable', .T.)
DBSetProp('PERIODOS.isopen', 'Field', 'UpdateName', 'vperiodos.isopen')
DBSetProp('PERIODOS.isopen', 'Field', 'DataType', "C(1)")
* Props for the PERIODOS.dopen field.
DBSetProp('PERIODOS.dopen', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.dopen', 'Field', 'Updatable', .F.)
DBSetProp('PERIODOS.dopen', 'Field', 'UpdateName', 'vperiodos.dopen')
DBSetProp('PERIODOS.dopen', 'Field', 'DataType', "C(15)")
* Props for the PERIODOS.dactual field.
DBSetProp('PERIODOS.dactual', 'Field', 'KeyField', .F.)
DBSetProp('PERIODOS.dactual', 'Field', 'Updatable', .F.)
DBSetProp('PERIODOS.dactual', 'Field', 'UpdateName', 'vperiodos.dactual')
DBSetProp('PERIODOS.dactual', 'Field', 'DataType', "C(15)")
ENDFUNC
 
FUNCTION MakeView_DETAGRU
***************** Ver la configuración para DETAGRU ***************

CREATE SQL VIEW "DETAGRU" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Detagru.*, Grudat.tipo, Grudat.gtag FROM detagru Detagru, grudat Grudat WHERE Detagru.idgrupo = Grudat.idgrupo   AND Detagru.idemp = ?ide ORDER BY Grudat.gtag, Detagru.descripda

DBSetProp('DETAGRU', 'View', 'UpdateType', 1)
DBSetProp('DETAGRU', 'View', 'WhereType', 1)
DBSetProp('DETAGRU', 'View', 'FetchMemo', .T.)
DBSetProp('DETAGRU', 'View', 'SendUpdates', .T.)
DBSetProp('DETAGRU', 'View', 'UseMemoSize', 255)
DBSetProp('DETAGRU', 'View', 'FetchSize', 100)
DBSetProp('DETAGRU', 'View', 'MaxRecords', -1)
DBSetProp('DETAGRU', 'View', 'Tables', 'detagru')
DBSetProp('DETAGRU', 'View', 'Prepared', .F.)
DBSetProp('DETAGRU', 'View', 'CompareMemo', .T.)
DBSetProp('DETAGRU', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DETAGRU', 'View', 'FetchSize', 100)
DBSetProp('DETAGRU', 'View', 'Comment', "")
DBSetProp('DETAGRU', 'View', 'BatchUpdateCount', 1)
DBSetProp('DETAGRU', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DETAGRU
* Props for the DETAGRU.idgrupo field.
DBSetProp('DETAGRU.idgrupo', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.idgrupo', 'Field', 'Updatable', .T.)
DBSetProp('DETAGRU.idgrupo', 'Field', 'UpdateName', 'detagru.idgrupo')
DBSetProp('DETAGRU.idgrupo', 'Field', 'DataType', "I")
* Props for the DETAGRU.iddato field.
DBSetProp('DETAGRU.iddato', 'Field', 'KeyField', .T.)
DBSetProp('DETAGRU.iddato', 'Field', 'Updatable', .F.)
DBSetProp('DETAGRU.iddato', 'Field', 'UpdateName', 'detagru.iddato')
DBSetProp('DETAGRU.iddato', 'Field', 'DataType', "I")
* Props for the DETAGRU.descripda field.
DBSetProp('DETAGRU.descripda', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.descripda', 'Field', 'Updatable', .T.)
DBSetProp('DETAGRU.descripda', 'Field', 'UpdateName', 'detagru.descripda')
DBSetProp('DETAGRU.descripda', 'Field', 'DataType', "C(40)")
* Props for the DETAGRU.valorda field.
DBSetProp('DETAGRU.valorda', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.valorda', 'Field', 'Updatable', .T.)
DBSetProp('DETAGRU.valorda', 'Field', 'UpdateName', 'detagru.valorda')
DBSetProp('DETAGRU.valorda', 'Field', 'DataType', "C(15)")
* Props for the DETAGRU.idemp field.
DBSetProp('DETAGRU.idemp', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.idemp', 'Field', 'Updatable', .T.)
DBSetProp('DETAGRU.idemp', 'Field', 'UpdateName', 'detagru.idemp')
DBSetProp('DETAGRU.idemp', 'Field', 'DataType', "I")
* Props for the DETAGRU.tipo field.
DBSetProp('DETAGRU.tipo', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.tipo', 'Field', 'Updatable', .F.)
DBSetProp('DETAGRU.tipo', 'Field', 'UpdateName', 'grudat.tipo')
DBSetProp('DETAGRU.tipo', 'Field', 'DataType', "C(1)")
* Props for the DETAGRU.gtag field.
DBSetProp('DETAGRU.gtag', 'Field', 'KeyField', .F.)
DBSetProp('DETAGRU.gtag', 'Field', 'Updatable', .F.)
DBSetProp('DETAGRU.gtag', 'Field', 'UpdateName', 'grudat.gtag')
DBSetProp('DETAGRU.gtag', 'Field', 'DataType', "C(4)")
ENDFUNC
 
FUNCTION MakeView_TEMPRESAS
***************** Ver la configuración para TEMPRESAS ***************

CREATE SQL VIEW "TEMPRESAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Empresas.ssri, Empresas.ecode, Empresas.sruc, Empresas.saddr,  Empresas.saddr2, Empresas.stelf, Empresas.sfax, Empresas.scel,  Empresas.smail, Empresas.swww FROM empresas Empresas

DBSetProp('TEMPRESAS', 'View', 'UpdateType', 1)
DBSetProp('TEMPRESAS', 'View', 'WhereType', 3)
DBSetProp('TEMPRESAS', 'View', 'FetchMemo', .T.)
DBSetProp('TEMPRESAS', 'View', 'SendUpdates', .T.)
DBSetProp('TEMPRESAS', 'View', 'UseMemoSize', 255)
DBSetProp('TEMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('TEMPRESAS', 'View', 'MaxRecords', -1)
DBSetProp('TEMPRESAS', 'View', 'Tables', 'empresas')
DBSetProp('TEMPRESAS', 'View', 'Prepared', .F.)
DBSetProp('TEMPRESAS', 'View', 'CompareMemo', .T.)
DBSetProp('TEMPRESAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TEMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('TEMPRESAS', 'View', 'ParameterList', "ide,'N'")
DBSetProp('TEMPRESAS', 'View', 'Comment', "")
DBSetProp('TEMPRESAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('TEMPRESAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for TEMPRESAS
* Props for the TEMPRESAS.ssri field.
DBSetProp('TEMPRESAS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.ssri', 'Field', 'UpdateName', 'empresas.ssri')
DBSetProp('TEMPRESAS.ssri', 'Field', 'DataType', "C(60)")
* Props for the TEMPRESAS.ecode field.
DBSetProp('TEMPRESAS.ecode', 'Field', 'KeyField', .T.)
DBSetProp('TEMPRESAS.ecode', 'Field', 'Updatable', .F.)
DBSetProp('TEMPRESAS.ecode', 'Field', 'UpdateName', 'empresas.ecode')
DBSetProp('TEMPRESAS.ecode', 'Field', 'DataType', "I")
* Props for the TEMPRESAS.sruc field.
DBSetProp('TEMPRESAS.sruc', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.sruc', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.sruc', 'Field', 'UpdateName', 'empresas.sruc')
DBSetProp('TEMPRESAS.sruc', 'Field', 'DataType', "C(13)")
* Props for the TEMPRESAS.saddr field.
DBSetProp('TEMPRESAS.saddr', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.saddr', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.saddr', 'Field', 'UpdateName', 'empresas.saddr')
DBSetProp('TEMPRESAS.saddr', 'Field', 'DataType', "C(60)")
* Props for the TEMPRESAS.saddr2 field.
DBSetProp('TEMPRESAS.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.saddr2', 'Field', 'UpdateName', 'empresas.saddr2')
DBSetProp('TEMPRESAS.saddr2', 'Field', 'DataType', "C(60)")
* Props for the TEMPRESAS.stelf field.
DBSetProp('TEMPRESAS.stelf', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.stelf', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.stelf', 'Field', 'UpdateName', 'empresas.stelf')
DBSetProp('TEMPRESAS.stelf', 'Field', 'DataType', "C(15)")
* Props for the TEMPRESAS.sfax field.
DBSetProp('TEMPRESAS.sfax', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.sfax', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.sfax', 'Field', 'UpdateName', 'empresas.sfax')
DBSetProp('TEMPRESAS.sfax', 'Field', 'DataType', "C(15)")
* Props for the TEMPRESAS.scel field.
DBSetProp('TEMPRESAS.scel', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.scel', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.scel', 'Field', 'UpdateName', 'empresas.scel')
DBSetProp('TEMPRESAS.scel', 'Field', 'DataType', "C(15)")
* Props for the TEMPRESAS.smail field.
DBSetProp('TEMPRESAS.smail', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.smail', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.smail', 'Field', 'UpdateName', 'empresas.smail')
DBSetProp('TEMPRESAS.smail', 'Field', 'DataType', "C(50)")
* Props for the TEMPRESAS.swww field.
DBSetProp('TEMPRESAS.swww', 'Field', 'KeyField', .F.)
DBSetProp('TEMPRESAS.swww', 'Field', 'Updatable', .T.)
DBSetProp('TEMPRESAS.swww', 'Field', 'UpdateName', 'empresas.swww')
DBSetProp('TEMPRESAS.swww', 'Field', 'DataType', "C(50)")
ENDFUNC
 
FUNCTION MakeView_EMPRESAS
***************** Ver la configuración para EMPRESAS ***************

CREATE SQL VIEW "EMPRESAS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Empresas.ssri, Empresas.ecode, Empresas.sruc, Empresas.saddr,  Empresas.saddr2, Empresas.stelf, Empresas.sfax, Empresas.scel,  Empresas.smail, Empresas.swww FROM empresas Empresas WHERE Empresas.ecode = ?ide

DBSetProp('EMPRESAS', 'View', 'UpdateType', 1)
DBSetProp('EMPRESAS', 'View', 'WhereType', 3)
DBSetProp('EMPRESAS', 'View', 'FetchMemo', .T.)
DBSetProp('EMPRESAS', 'View', 'SendUpdates', .T.)
DBSetProp('EMPRESAS', 'View', 'UseMemoSize', 255)
DBSetProp('EMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('EMPRESAS', 'View', 'MaxRecords', -1)
DBSetProp('EMPRESAS', 'View', 'Tables', 'empresas')
DBSetProp('EMPRESAS', 'View', 'Prepared', .F.)
DBSetProp('EMPRESAS', 'View', 'CompareMemo', .T.)
DBSetProp('EMPRESAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('EMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('EMPRESAS', 'View', 'ParameterList', "ide,'N'")
DBSetProp('EMPRESAS', 'View', 'Comment', "")
DBSetProp('EMPRESAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('EMPRESAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for EMPRESAS
* Props for the EMPRESAS.ssri field.
DBSetProp('EMPRESAS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.ssri', 'Field', 'UpdateName', 'empresas.ssri')
DBSetProp('EMPRESAS.ssri', 'Field', 'DataType', "C(60)")
* Props for the EMPRESAS.ecode field.
DBSetProp('EMPRESAS.ecode', 'Field', 'KeyField', .T.)
DBSetProp('EMPRESAS.ecode', 'Field', 'Updatable', .F.)
DBSetProp('EMPRESAS.ecode', 'Field', 'UpdateName', 'empresas.ecode')
DBSetProp('EMPRESAS.ecode', 'Field', 'DataType', "I")
* Props for the EMPRESAS.sruc field.
DBSetProp('EMPRESAS.sruc', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.sruc', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.sruc', 'Field', 'UpdateName', 'empresas.sruc')
DBSetProp('EMPRESAS.sruc', 'Field', 'DataType', "C(13)")
* Props for the EMPRESAS.saddr field.
DBSetProp('EMPRESAS.saddr', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.saddr', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.saddr', 'Field', 'UpdateName', 'empresas.saddr')
DBSetProp('EMPRESAS.saddr', 'Field', 'DataType', "C(60)")
* Props for the EMPRESAS.saddr2 field.
DBSetProp('EMPRESAS.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.saddr2', 'Field', 'UpdateName', 'empresas.saddr2')
DBSetProp('EMPRESAS.saddr2', 'Field', 'DataType', "C(60)")
* Props for the EMPRESAS.stelf field.
DBSetProp('EMPRESAS.stelf', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.stelf', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.stelf', 'Field', 'UpdateName', 'empresas.stelf')
DBSetProp('EMPRESAS.stelf', 'Field', 'DataType', "C(15)")
* Props for the EMPRESAS.sfax field.
DBSetProp('EMPRESAS.sfax', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.sfax', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.sfax', 'Field', 'UpdateName', 'empresas.sfax')
DBSetProp('EMPRESAS.sfax', 'Field', 'DataType', "C(15)")
* Props for the EMPRESAS.scel field.
DBSetProp('EMPRESAS.scel', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.scel', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.scel', 'Field', 'UpdateName', 'empresas.scel')
DBSetProp('EMPRESAS.scel', 'Field', 'DataType', "C(15)")
* Props for the EMPRESAS.smail field.
DBSetProp('EMPRESAS.smail', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.smail', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.smail', 'Field', 'UpdateName', 'empresas.smail')
DBSetProp('EMPRESAS.smail', 'Field', 'DataType', "C(50)")
* Props for the EMPRESAS.swww field.
DBSetProp('EMPRESAS.swww', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.swww', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.swww', 'Field', 'UpdateName', 'empresas.swww')
DBSetProp('EMPRESAS.swww', 'Field', 'DataType', "C(50)")
ENDFUNC
 
FUNCTION MakeView_TUSUEMPRE
***************** Ver la configuración para TUSUEMPRE ***************

CREATE SQL VIEW "TUSUEMPRE" ; 
   REMOTE CONNECT "conbdd" ; 
   AS SELECT U.idusuario, U.nombreu, U.contrau, E.ecode, E.ssri, U.tipou,  D.descripda, U.colortext, U.fonttext, U.colorform FROM usuarios U, empresas E, detagru D WHERE U.empreu = E.ecode   AND U.tipou = D.iddato

DBSetProp('TUSUEMPRE', 'View', 'UpdateType', 1)
DBSetProp('TUSUEMPRE', 'View', 'WhereType', 3)
DBSetProp('TUSUEMPRE', 'View', 'FetchMemo', .T.)
DBSetProp('TUSUEMPRE', 'View', 'SendUpdates', .T.)
DBSetProp('TUSUEMPRE', 'View', 'UseMemoSize', 255)
DBSetProp('TUSUEMPRE', 'View', 'FetchSize', 100)
DBSetProp('TUSUEMPRE', 'View', 'MaxRecords', -1)
DBSetProp('TUSUEMPRE', 'View', 'Tables', 'usuarios')
DBSetProp('TUSUEMPRE', 'View', 'Prepared', .F.)
DBSetProp('TUSUEMPRE', 'View', 'CompareMemo', .T.)
DBSetProp('TUSUEMPRE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TUSUEMPRE', 'View', 'FetchSize', 100)
DBSetProp('TUSUEMPRE', 'View', 'Comment', "")
DBSetProp('TUSUEMPRE', 'View', 'BatchUpdateCount', 1)
DBSetProp('TUSUEMPRE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for TUSUEMPRE
* Props for the TUSUEMPRE.idusuario field.
DBSetProp('TUSUEMPRE.idusuario', 'Field', 'KeyField', .T.)
DBSetProp('TUSUEMPRE.idusuario', 'Field', 'Updatable', .F.)
DBSetProp('TUSUEMPRE.idusuario', 'Field', 'UpdateName', 'usuarios.idusuario')
DBSetProp('TUSUEMPRE.idusuario', 'Field', 'DataType', "N(6)")
* Props for the TUSUEMPRE.nombreu field.
DBSetProp('TUSUEMPRE.nombreu', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.nombreu', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.nombreu', 'Field', 'UpdateName', 'usuarios.nombreu')
DBSetProp('TUSUEMPRE.nombreu', 'Field', 'DataType', "C(40)")
* Props for the TUSUEMPRE.contrau field.
DBSetProp('TUSUEMPRE.contrau', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.contrau', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.contrau', 'Field', 'UpdateName', 'usuarios.contrau')
DBSetProp('TUSUEMPRE.contrau', 'Field', 'DataType', "C(6)")
* Props for the TUSUEMPRE.ecode field.
DBSetProp('TUSUEMPRE.ecode', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.ecode', 'Field', 'Updatable', .F.)
DBSetProp('TUSUEMPRE.ecode', 'Field', 'UpdateName', 'empresas.ecode')
DBSetProp('TUSUEMPRE.ecode', 'Field', 'DataType', "I")
* Props for the TUSUEMPRE.ssri field.
DBSetProp('TUSUEMPRE.ssri', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.ssri', 'Field', 'Updatable', .F.)
DBSetProp('TUSUEMPRE.ssri', 'Field', 'UpdateName', 'empresas.ssri')
DBSetProp('TUSUEMPRE.ssri', 'Field', 'DataType', "C(60)")
* Props for the TUSUEMPRE.tipou field.
DBSetProp('TUSUEMPRE.tipou', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.tipou', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.tipou', 'Field', 'UpdateName', 'usuarios.tipou')
DBSetProp('TUSUEMPRE.tipou', 'Field', 'DataType', "I")
* Props for the TUSUEMPRE.descripda field.
DBSetProp('TUSUEMPRE.descripda', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.descripda', 'Field', 'Updatable', .F.)
DBSetProp('TUSUEMPRE.descripda', 'Field', 'UpdateName', 'detagru.descripda')
DBSetProp('TUSUEMPRE.descripda', 'Field', 'DataType', "C(40)")
* Props for the TUSUEMPRE.colortext field.
DBSetProp('TUSUEMPRE.colortext', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.colortext', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.colortext', 'Field', 'UpdateName', 'usuarios.colortext')
DBSetProp('TUSUEMPRE.colortext', 'Field', 'DataType', "I")
* Props for the TUSUEMPRE.fonttext field.
DBSetProp('TUSUEMPRE.fonttext', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.fonttext', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.fonttext', 'Field', 'UpdateName', 'usuarios.fonttext')
DBSetProp('TUSUEMPRE.fonttext', 'Field', 'DataType', "C(35)")
* Props for the TUSUEMPRE.colorform field.
DBSetProp('TUSUEMPRE.colorform', 'Field', 'KeyField', .F.)
DBSetProp('TUSUEMPRE.colorform', 'Field', 'Updatable', .T.)
DBSetProp('TUSUEMPRE.colorform', 'Field', 'UpdateName', 'usuarios.colorform')
DBSetProp('TUSUEMPRE.colorform', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_TAMBIEMPRE
***************** Ver la configuración para TAMBIEMPRE ***************

CREATE SQL VIEW "TAMBIEMPRE" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM ambiempre Ambiempre

DBSetProp('TAMBIEMPRE', 'View', 'UpdateType', 1)
DBSetProp('TAMBIEMPRE', 'View', 'WhereType', 3)
DBSetProp('TAMBIEMPRE', 'View', 'FetchMemo', .T.)
DBSetProp('TAMBIEMPRE', 'View', 'SendUpdates', .F.)
DBSetProp('TAMBIEMPRE', 'View', 'UseMemoSize', 255)
DBSetProp('TAMBIEMPRE', 'View', 'FetchSize', 100)
DBSetProp('TAMBIEMPRE', 'View', 'MaxRecords', -1)
DBSetProp('TAMBIEMPRE', 'View', 'Tables', '')
DBSetProp('TAMBIEMPRE', 'View', 'Prepared', .F.)
DBSetProp('TAMBIEMPRE', 'View', 'CompareMemo', .T.)
DBSetProp('TAMBIEMPRE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAMBIEMPRE', 'View', 'FetchSize', 100)
DBSetProp('TAMBIEMPRE', 'View', 'Comment', "")
DBSetProp('TAMBIEMPRE', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAMBIEMPRE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for TAMBIEMPRE
* Props for the TAMBIEMPRE.ecode field.
DBSetProp('TAMBIEMPRE.ecode', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.ecode', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.ecode', 'Field', 'UpdateName', 'ambiempre.ecode')
DBSetProp('TAMBIEMPRE.ecode', 'Field', 'DataType', "I")
* Props for the TAMBIEMPRE.ssri field.
DBSetProp('TAMBIEMPRE.ssri', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.ssri', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.ssri', 'Field', 'UpdateName', 'ambiempre.ssri')
DBSetProp('TAMBIEMPRE.ssri', 'Field', 'DataType', "C(60)")
* Props for the TAMBIEMPRE.fecini field.
DBSetProp('TAMBIEMPRE.fecini', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.fecini', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.fecini', 'Field', 'UpdateName', 'ambiempre.fecini')
DBSetProp('TAMBIEMPRE.fecini', 'Field', 'DataType', "D")
* Props for the TAMBIEMPRE.fecfin field.
DBSetProp('TAMBIEMPRE.fecfin', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.fecfin', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.fecfin', 'Field', 'UpdateName', 'ambiempre.fecfin')
DBSetProp('TAMBIEMPRE.fecfin', 'Field', 'DataType', "D")
* Props for the TAMBIEMPRE.pdocode field.
DBSetProp('TAMBIEMPRE.pdocode', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.pdocode', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.pdocode', 'Field', 'UpdateName', 'ambiempre.pdocode')
DBSetProp('TAMBIEMPRE.pdocode', 'Field', 'DataType', "I")
* Props for the TAMBIEMPRE.moneda field.
DBSetProp('TAMBIEMPRE.moneda', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.moneda', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.moneda', 'Field', 'UpdateName', 'ambiempre.moneda')
DBSetProp('TAMBIEMPRE.moneda', 'Field', 'DataType', "I")
* Props for the TAMBIEMPRE.moname field.
DBSetProp('TAMBIEMPRE.moname', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.moname', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.moname', 'Field', 'UpdateName', 'ambiempre.moname')
DBSetProp('TAMBIEMPRE.moname', 'Field', 'DataType', "C(40)")
* Props for the TAMBIEMPRE.nivelplan field.
DBSetProp('TAMBIEMPRE.nivelplan', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.nivelplan', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.nivelplan', 'Field', 'UpdateName', 'ambiempre.nivelplan')
DBSetProp('TAMBIEMPRE.nivelplan', 'Field', 'DataType', "I")
* Props for the TAMBIEMPRE.isupdate field.
DBSetProp('TAMBIEMPRE.isupdate', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.isupdate', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.isupdate', 'Field', 'UpdateName', 'ambiempre.isupdate')
DBSetProp('TAMBIEMPRE.isupdate', 'Field', 'DataType', "C(1)")
* Props for the TAMBIEMPRE.isopen field.
DBSetProp('TAMBIEMPRE.isopen', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.isopen', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.isopen', 'Field', 'UpdateName', 'ambiempre.isopen')
DBSetProp('TAMBIEMPRE.isopen', 'Field', 'DataType', "C(1)")
* Props for the TAMBIEMPRE.codemp field.
DBSetProp('TAMBIEMPRE.codemp', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.codemp', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.codemp', 'Field', 'UpdateName', 'ambiempre.codemp')
DBSetProp('TAMBIEMPRE.codemp', 'Field', 'DataType', "I")
* Props for the TAMBIEMPRE.actual field.
DBSetProp('TAMBIEMPRE.actual', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.actual', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.actual', 'Field', 'UpdateName', 'ambiempre.actual')
DBSetProp('TAMBIEMPRE.actual', 'Field', 'DataType', "C(15)")
* Props for the TAMBIEMPRE.openx field.
DBSetProp('TAMBIEMPRE.openx', 'Field', 'KeyField', .F.)
DBSetProp('TAMBIEMPRE.openx', 'Field', 'Updatable', .F.)
DBSetProp('TAMBIEMPRE.openx', 'Field', 'UpdateName', 'ambiempre.openx')
DBSetProp('TAMBIEMPRE.openx', 'Field', 'DataType', "C(15)")
ENDFUNC
 
FUNCTION MakeView_REVERSODOC
***************** Ver la configuración para REVERSODOC ***************

CREATE SQL VIEW "REVERSODOC" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM reversodoc Reversodoc WHERE Reversodoc.idemp = ?ide ORDER BY Reversodoc.tipo, Reversodoc.subtipo

DBSetProp('REVERSODOC', 'View', 'UpdateType', 1)
DBSetProp('REVERSODOC', 'View', 'WhereType', 3)
DBSetProp('REVERSODOC', 'View', 'FetchMemo', .T.)
DBSetProp('REVERSODOC', 'View', 'SendUpdates', .T.)
DBSetProp('REVERSODOC', 'View', 'UseMemoSize', 255)
DBSetProp('REVERSODOC', 'View', 'FetchSize', 100)
DBSetProp('REVERSODOC', 'View', 'MaxRecords', -1)
DBSetProp('REVERSODOC', 'View', 'Tables', 'reversodoc')
DBSetProp('REVERSODOC', 'View', 'Prepared', .F.)
DBSetProp('REVERSODOC', 'View', 'CompareMemo', .T.)
DBSetProp('REVERSODOC', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REVERSODOC', 'View', 'FetchSize', 100)
DBSetProp('REVERSODOC', 'View', 'Comment', "")
DBSetProp('REVERSODOC', 'View', 'BatchUpdateCount', 1)
DBSetProp('REVERSODOC', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for REVERSODOC
* Props for the REVERSODOC.iddocu field.
DBSetProp('REVERSODOC.iddocu', 'Field', 'KeyField', .T.)
DBSetProp('REVERSODOC.iddocu', 'Field', 'Updatable', .F.)
DBSetProp('REVERSODOC.iddocu', 'Field', 'UpdateName', 'reversodoc.iddocu')
DBSetProp('REVERSODOC.iddocu', 'Field', 'DataType', "I")
* Props for the REVERSODOC.idemp field.
DBSetProp('REVERSODOC.idemp', 'Field', 'KeyField', .F.)
DBSetProp('REVERSODOC.idemp', 'Field', 'Updatable', .F.)
DBSetProp('REVERSODOC.idemp', 'Field', 'UpdateName', 'reversodoc.idemp')
DBSetProp('REVERSODOC.idemp', 'Field', 'DataType', "I")
* Props for the REVERSODOC.tipo field.
DBSetProp('REVERSODOC.tipo', 'Field', 'KeyField', .F.)
DBSetProp('REVERSODOC.tipo', 'Field', 'Updatable', .T.)
DBSetProp('REVERSODOC.tipo', 'Field', 'UpdateName', 'reversodoc.tipo')
DBSetProp('REVERSODOC.tipo', 'Field', 'DataType', "C(40)")
* Props for the REVERSODOC.subtipo field.
DBSetProp('REVERSODOC.subtipo', 'Field', 'KeyField', .F.)
DBSetProp('REVERSODOC.subtipo', 'Field', 'Updatable', .T.)
DBSetProp('REVERSODOC.subtipo', 'Field', 'UpdateName', 'reversodoc.subtipo')
DBSetProp('REVERSODOC.subtipo', 'Field', 'DataType', "C(40)")
ENDFUNC
 
FUNCTION MakeView_SPRODUCTORES
***************** Ver la configuración para SPRODUCTORES ***************

CREATE SQL VIEW "SPRODUCTORES" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM sujetos Sujetos WHERE Sujetos.semp = ?ide   AND Sujetos.isproductor = '1'

DBSetProp('SPRODUCTORES', 'View', 'UpdateType', 1)
DBSetProp('SPRODUCTORES', 'View', 'WhereType', 3)
DBSetProp('SPRODUCTORES', 'View', 'FetchMemo', .T.)
DBSetProp('SPRODUCTORES', 'View', 'SendUpdates', .T.)
DBSetProp('SPRODUCTORES', 'View', 'UseMemoSize', 255)
DBSetProp('SPRODUCTORES', 'View', 'FetchSize', 100)
DBSetProp('SPRODUCTORES', 'View', 'MaxRecords', -1)
DBSetProp('SPRODUCTORES', 'View', 'Tables', 'sujetos')
DBSetProp('SPRODUCTORES', 'View', 'Prepared', .F.)
DBSetProp('SPRODUCTORES', 'View', 'CompareMemo', .T.)
DBSetProp('SPRODUCTORES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SPRODUCTORES', 'View', 'FetchSize', 100)
DBSetProp('SPRODUCTORES', 'View', 'Comment', "")
DBSetProp('SPRODUCTORES', 'View', 'BatchUpdateCount', 1)
DBSetProp('SPRODUCTORES', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SPRODUCTORES
* Props for the SPRODUCTORES.idsujeto field.
DBSetProp('SPRODUCTORES.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('SPRODUCTORES.idsujeto', 'Field', 'Updatable', .F.)
DBSetProp('SPRODUCTORES.idsujeto', 'Field', 'UpdateName', 'sujetos.idsujeto')
DBSetProp('SPRODUCTORES.idsujeto', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.scode field.
DBSetProp('SPRODUCTORES.scode', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.scode', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('SPRODUCTORES.scode', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.isempleado field.
DBSetProp('SPRODUCTORES.isempleado', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.isempleado', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.isempleado', 'Field', 'UpdateName', 'sujetos.isempleado')
DBSetProp('SPRODUCTORES.isempleado', 'Field', 'DataType', "C(1)")
* Props for the SPRODUCTORES.isproveedor field.
DBSetProp('SPRODUCTORES.isproveedor', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.isproveedor', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.isproveedor', 'Field', 'UpdateName', 'sujetos.isproveedor')
DBSetProp('SPRODUCTORES.isproveedor', 'Field', 'DataType', "C(1)")
* Props for the SPRODUCTORES.isproductor field.
DBSetProp('SPRODUCTORES.isproductor', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.isproductor', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.isproductor', 'Field', 'UpdateName', 'sujetos.isproductor')
DBSetProp('SPRODUCTORES.isproductor', 'Field', 'DataType', "C(1)")
* Props for the SPRODUCTORES.iscliente field.
DBSetProp('SPRODUCTORES.iscliente', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.iscliente', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.iscliente', 'Field', 'UpdateName', 'sujetos.iscliente')
DBSetProp('SPRODUCTORES.iscliente', 'Field', 'DataType', "C(1)")
* Props for the SPRODUCTORES.sname field.
DBSetProp('SPRODUCTORES.sname', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sname', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sname', 'Field', 'UpdateName', 'sujetos.sname')
DBSetProp('SPRODUCTORES.sname', 'Field', 'DataType', "C(40)")
* Props for the SPRODUCTORES.ssri field.
DBSetProp('SPRODUCTORES.ssri', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.ssri', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.ssri', 'Field', 'UpdateName', 'sujetos.ssri')
DBSetProp('SPRODUCTORES.ssri', 'Field', 'DataType', "C(60)")
* Props for the SPRODUCTORES.scedula field.
DBSetProp('SPRODUCTORES.scedula', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.scedula', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.scedula', 'Field', 'UpdateName', 'sujetos.scedula')
DBSetProp('SPRODUCTORES.scedula', 'Field', 'DataType', "C(10)")
* Props for the SPRODUCTORES.sruc field.
DBSetProp('SPRODUCTORES.sruc', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sruc', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sruc', 'Field', 'UpdateName', 'sujetos.sruc')
DBSetProp('SPRODUCTORES.sruc', 'Field', 'DataType', "C(13)")
* Props for the SPRODUCTORES.spasaporte field.
DBSetProp('SPRODUCTORES.spasaporte', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.spasaporte', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.spasaporte', 'Field', 'UpdateName', 'sujetos.spasaporte')
DBSetProp('SPRODUCTORES.spasaporte', 'Field', 'DataType', "C(25)")
* Props for the SPRODUCTORES.saddr field.
DBSetProp('SPRODUCTORES.saddr', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.saddr', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.saddr', 'Field', 'UpdateName', 'sujetos.saddr')
DBSetProp('SPRODUCTORES.saddr', 'Field', 'DataType', "C(60)")
* Props for the SPRODUCTORES.saddr2 field.
DBSetProp('SPRODUCTORES.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.saddr2', 'Field', 'UpdateName', 'sujetos.saddr2')
DBSetProp('SPRODUCTORES.saddr2', 'Field', 'DataType', "C(60)")
* Props for the SPRODUCTORES.stelf field.
DBSetProp('SPRODUCTORES.stelf', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.stelf', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.stelf', 'Field', 'UpdateName', 'sujetos.stelf')
DBSetProp('SPRODUCTORES.stelf', 'Field', 'DataType', "C(15)")
* Props for the SPRODUCTORES.sfax field.
DBSetProp('SPRODUCTORES.sfax', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sfax', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sfax', 'Field', 'UpdateName', 'sujetos.sfax')
DBSetProp('SPRODUCTORES.sfax', 'Field', 'DataType', "C(15)")
* Props for the SPRODUCTORES.scel field.
DBSetProp('SPRODUCTORES.scel', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.scel', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.scel', 'Field', 'UpdateName', 'sujetos.scel')
DBSetProp('SPRODUCTORES.scel', 'Field', 'DataType', "C(15)")
* Props for the SPRODUCTORES.smail field.
DBSetProp('SPRODUCTORES.smail', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.smail', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.smail', 'Field', 'UpdateName', 'sujetos.smail')
DBSetProp('SPRODUCTORES.smail', 'Field', 'DataType', "C(50)")
* Props for the SPRODUCTORES.swww field.
DBSetProp('SPRODUCTORES.swww', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.swww', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.swww', 'Field', 'UpdateName', 'sujetos.swww')
DBSetProp('SPRODUCTORES.swww', 'Field', 'DataType', "C(50)")
* Props for the SPRODUCTORES.semp field.
DBSetProp('SPRODUCTORES.semp', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.semp', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.semp', 'Field', 'UpdateName', 'sujetos.semp')
DBSetProp('SPRODUCTORES.semp', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.smoney field.
DBSetProp('SPRODUCTORES.smoney', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.smoney', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.smoney', 'Field', 'UpdateName', 'sujetos.smoney')
DBSetProp('SPRODUCTORES.smoney', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.sprov field.
DBSetProp('SPRODUCTORES.sprov', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sprov', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sprov', 'Field', 'UpdateName', 'sujetos.sprov')
DBSetProp('SPRODUCTORES.sprov', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.ssaldo field.
DBSetProp('SPRODUCTORES.ssaldo', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.ssaldo', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.ssaldo', 'Field', 'UpdateName', 'sujetos.ssaldo')
DBSetProp('SPRODUCTORES.ssaldo', 'Field', 'DataType', "B(8,2)")
* Props for the SPRODUCTORES.scredito field.
DBSetProp('SPRODUCTORES.scredito', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.scredito', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.scredito', 'Field', 'UpdateName', 'sujetos.scredito')
DBSetProp('SPRODUCTORES.scredito', 'Field', 'DataType', "B(8,2)")
* Props for the SPRODUCTORES.scheques field.
DBSetProp('SPRODUCTORES.scheques', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.scheques', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.scheques', 'Field', 'UpdateName', 'sujetos.scheques')
DBSetProp('SPRODUCTORES.scheques', 'Field', 'DataType', "B(8,2)")
* Props for the SPRODUCTORES.sprotesto field.
DBSetProp('SPRODUCTORES.sprotesto', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sprotesto', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sprotesto', 'Field', 'UpdateName', 'sujetos.sprotesto')
DBSetProp('SPRODUCTORES.sprotesto', 'Field', 'DataType', "C(1)")
* Props for the SPRODUCTORES.stag field.
DBSetProp('SPRODUCTORES.stag', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.stag', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.stag', 'Field', 'UpdateName', 'sujetos.stag')
DBSetProp('SPRODUCTORES.stag', 'Field', 'DataType', "C(10)")
* Props for the SPRODUCTORES.sciudad field.
DBSetProp('SPRODUCTORES.sciudad', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.sciudad', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.sciudad', 'Field', 'UpdateName', 'sujetos.sciudad')
DBSetProp('SPRODUCTORES.sciudad', 'Field', 'DataType', "I")
* Props for the SPRODUCTORES.snumcasa field.
DBSetProp('SPRODUCTORES.snumcasa', 'Field', 'KeyField', .F.)
DBSetProp('SPRODUCTORES.snumcasa', 'Field', 'Updatable', .T.)
DBSetProp('SPRODUCTORES.snumcasa', 'Field', 'UpdateName', 'sujetos.snumcasa')
DBSetProp('SPRODUCTORES.snumcasa', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SEMPLEADOS
***************** Ver la configuración para SEMPLEADOS ***************

CREATE SQL VIEW "SEMPLEADOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM sujetos Sujetos WHERE Sujetos.semp = ?ide   AND Sujetos.isempleado = '1'

DBSetProp('SEMPLEADOS', 'View', 'UpdateType', 1)
DBSetProp('SEMPLEADOS', 'View', 'WhereType', 3)
DBSetProp('SEMPLEADOS', 'View', 'FetchMemo', .T.)
DBSetProp('SEMPLEADOS', 'View', 'SendUpdates', .T.)
DBSetProp('SEMPLEADOS', 'View', 'UseMemoSize', 255)
DBSetProp('SEMPLEADOS', 'View', 'FetchSize', 100)
DBSetProp('SEMPLEADOS', 'View', 'MaxRecords', -1)
DBSetProp('SEMPLEADOS', 'View', 'Tables', 'sujetos')
DBSetProp('SEMPLEADOS', 'View', 'Prepared', .F.)
DBSetProp('SEMPLEADOS', 'View', 'CompareMemo', .T.)
DBSetProp('SEMPLEADOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SEMPLEADOS', 'View', 'FetchSize', 100)
DBSetProp('SEMPLEADOS', 'View', 'Comment', "")
DBSetProp('SEMPLEADOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('SEMPLEADOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SEMPLEADOS
* Props for the SEMPLEADOS.idsujeto field.
DBSetProp('SEMPLEADOS.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('SEMPLEADOS.idsujeto', 'Field', 'Updatable', .F.)
DBSetProp('SEMPLEADOS.idsujeto', 'Field', 'UpdateName', 'sujetos.idsujeto')
DBSetProp('SEMPLEADOS.idsujeto', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.scode field.
DBSetProp('SEMPLEADOS.scode', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.scode', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('SEMPLEADOS.scode', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.isempleado field.
DBSetProp('SEMPLEADOS.isempleado', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.isempleado', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.isempleado', 'Field', 'UpdateName', 'sujetos.isempleado')
DBSetProp('SEMPLEADOS.isempleado', 'Field', 'DataType', "C(1)")
* Props for the SEMPLEADOS.isproveedor field.
DBSetProp('SEMPLEADOS.isproveedor', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.isproveedor', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.isproveedor', 'Field', 'UpdateName', 'sujetos.isproveedor')
DBSetProp('SEMPLEADOS.isproveedor', 'Field', 'DataType', "C(1)")
* Props for the SEMPLEADOS.isproductor field.
DBSetProp('SEMPLEADOS.isproductor', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.isproductor', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.isproductor', 'Field', 'UpdateName', 'sujetos.isproductor')
DBSetProp('SEMPLEADOS.isproductor', 'Field', 'DataType', "C(1)")
* Props for the SEMPLEADOS.iscliente field.
DBSetProp('SEMPLEADOS.iscliente', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.iscliente', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.iscliente', 'Field', 'UpdateName', 'sujetos.iscliente')
DBSetProp('SEMPLEADOS.iscliente', 'Field', 'DataType', "C(1)")
* Props for the SEMPLEADOS.sname field.
DBSetProp('SEMPLEADOS.sname', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sname', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sname', 'Field', 'UpdateName', 'sujetos.sname')
DBSetProp('SEMPLEADOS.sname', 'Field', 'DataType', "C(40)")
* Props for the SEMPLEADOS.ssri field.
DBSetProp('SEMPLEADOS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.ssri', 'Field', 'UpdateName', 'sujetos.ssri')
DBSetProp('SEMPLEADOS.ssri', 'Field', 'DataType', "C(60)")
* Props for the SEMPLEADOS.scedula field.
DBSetProp('SEMPLEADOS.scedula', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.scedula', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.scedula', 'Field', 'UpdateName', 'sujetos.scedula')
DBSetProp('SEMPLEADOS.scedula', 'Field', 'DataType', "C(10)")
* Props for the SEMPLEADOS.sruc field.
DBSetProp('SEMPLEADOS.sruc', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sruc', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sruc', 'Field', 'UpdateName', 'sujetos.sruc')
DBSetProp('SEMPLEADOS.sruc', 'Field', 'DataType', "C(13)")
* Props for the SEMPLEADOS.spasaporte field.
DBSetProp('SEMPLEADOS.spasaporte', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.spasaporte', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.spasaporte', 'Field', 'UpdateName', 'sujetos.spasaporte')
DBSetProp('SEMPLEADOS.spasaporte', 'Field', 'DataType', "C(25)")
* Props for the SEMPLEADOS.saddr field.
DBSetProp('SEMPLEADOS.saddr', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.saddr', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.saddr', 'Field', 'UpdateName', 'sujetos.saddr')
DBSetProp('SEMPLEADOS.saddr', 'Field', 'DataType', "C(60)")
* Props for the SEMPLEADOS.saddr2 field.
DBSetProp('SEMPLEADOS.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.saddr2', 'Field', 'UpdateName', 'sujetos.saddr2')
DBSetProp('SEMPLEADOS.saddr2', 'Field', 'DataType', "C(60)")
* Props for the SEMPLEADOS.stelf field.
DBSetProp('SEMPLEADOS.stelf', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.stelf', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.stelf', 'Field', 'UpdateName', 'sujetos.stelf')
DBSetProp('SEMPLEADOS.stelf', 'Field', 'DataType', "C(15)")
* Props for the SEMPLEADOS.sfax field.
DBSetProp('SEMPLEADOS.sfax', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sfax', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sfax', 'Field', 'UpdateName', 'sujetos.sfax')
DBSetProp('SEMPLEADOS.sfax', 'Field', 'DataType', "C(15)")
* Props for the SEMPLEADOS.scel field.
DBSetProp('SEMPLEADOS.scel', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.scel', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.scel', 'Field', 'UpdateName', 'sujetos.scel')
DBSetProp('SEMPLEADOS.scel', 'Field', 'DataType', "C(15)")
* Props for the SEMPLEADOS.smail field.
DBSetProp('SEMPLEADOS.smail', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.smail', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.smail', 'Field', 'UpdateName', 'sujetos.smail')
DBSetProp('SEMPLEADOS.smail', 'Field', 'DataType', "C(50)")
* Props for the SEMPLEADOS.swww field.
DBSetProp('SEMPLEADOS.swww', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.swww', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.swww', 'Field', 'UpdateName', 'sujetos.swww')
DBSetProp('SEMPLEADOS.swww', 'Field', 'DataType', "C(50)")
* Props for the SEMPLEADOS.semp field.
DBSetProp('SEMPLEADOS.semp', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.semp', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.semp', 'Field', 'UpdateName', 'sujetos.semp')
DBSetProp('SEMPLEADOS.semp', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.smoney field.
DBSetProp('SEMPLEADOS.smoney', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.smoney', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.smoney', 'Field', 'UpdateName', 'sujetos.smoney')
DBSetProp('SEMPLEADOS.smoney', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.sprov field.
DBSetProp('SEMPLEADOS.sprov', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sprov', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sprov', 'Field', 'UpdateName', 'sujetos.sprov')
DBSetProp('SEMPLEADOS.sprov', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.ssaldo field.
DBSetProp('SEMPLEADOS.ssaldo', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.ssaldo', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.ssaldo', 'Field', 'UpdateName', 'sujetos.ssaldo')
DBSetProp('SEMPLEADOS.ssaldo', 'Field', 'DataType', "B(8,2)")
* Props for the SEMPLEADOS.scredito field.
DBSetProp('SEMPLEADOS.scredito', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.scredito', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.scredito', 'Field', 'UpdateName', 'sujetos.scredito')
DBSetProp('SEMPLEADOS.scredito', 'Field', 'DataType', "B(8,2)")
* Props for the SEMPLEADOS.scheques field.
DBSetProp('SEMPLEADOS.scheques', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.scheques', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.scheques', 'Field', 'UpdateName', 'sujetos.scheques')
DBSetProp('SEMPLEADOS.scheques', 'Field', 'DataType', "B(8,2)")
* Props for the SEMPLEADOS.sprotesto field.
DBSetProp('SEMPLEADOS.sprotesto', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sprotesto', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sprotesto', 'Field', 'UpdateName', 'sujetos.sprotesto')
DBSetProp('SEMPLEADOS.sprotesto', 'Field', 'DataType', "C(1)")
* Props for the SEMPLEADOS.stag field.
DBSetProp('SEMPLEADOS.stag', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.stag', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.stag', 'Field', 'UpdateName', 'sujetos.stag')
DBSetProp('SEMPLEADOS.stag', 'Field', 'DataType', "C(10)")
* Props for the SEMPLEADOS.sciudad field.
DBSetProp('SEMPLEADOS.sciudad', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.sciudad', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.sciudad', 'Field', 'UpdateName', 'sujetos.sciudad')
DBSetProp('SEMPLEADOS.sciudad', 'Field', 'DataType', "I")
* Props for the SEMPLEADOS.snumcasa field.
DBSetProp('SEMPLEADOS.snumcasa', 'Field', 'KeyField', .F.)
DBSetProp('SEMPLEADOS.snumcasa', 'Field', 'Updatable', .T.)
DBSetProp('SEMPLEADOS.snumcasa', 'Field', 'UpdateName', 'sujetos.snumcasa')
DBSetProp('SEMPLEADOS.snumcasa', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SPROVEEDOR
***************** Ver la configuración para SPROVEEDOR ***************

CREATE SQL VIEW "SPROVEEDOR" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM sujetos Sujetos WHERE Sujetos.semp = ?ide   AND Sujetos.isproveedor = '1'

DBSetProp('SPROVEEDOR', 'View', 'UpdateType', 1)
DBSetProp('SPROVEEDOR', 'View', 'WhereType', 3)
DBSetProp('SPROVEEDOR', 'View', 'FetchMemo', .T.)
DBSetProp('SPROVEEDOR', 'View', 'SendUpdates', .T.)
DBSetProp('SPROVEEDOR', 'View', 'UseMemoSize', 255)
DBSetProp('SPROVEEDOR', 'View', 'FetchSize', 100)
DBSetProp('SPROVEEDOR', 'View', 'MaxRecords', -1)
DBSetProp('SPROVEEDOR', 'View', 'Tables', 'sujetos')
DBSetProp('SPROVEEDOR', 'View', 'Prepared', .F.)
DBSetProp('SPROVEEDOR', 'View', 'CompareMemo', .T.)
DBSetProp('SPROVEEDOR', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SPROVEEDOR', 'View', 'FetchSize', 100)
DBSetProp('SPROVEEDOR', 'View', 'Comment', "")
DBSetProp('SPROVEEDOR', 'View', 'BatchUpdateCount', 1)
DBSetProp('SPROVEEDOR', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SPROVEEDOR
* Props for the SPROVEEDOR.idsujeto field.
DBSetProp('SPROVEEDOR.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('SPROVEEDOR.idsujeto', 'Field', 'Updatable', .F.)
DBSetProp('SPROVEEDOR.idsujeto', 'Field', 'UpdateName', 'sujetos.idsujeto')
DBSetProp('SPROVEEDOR.idsujeto', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.scode field.
DBSetProp('SPROVEEDOR.scode', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.scode', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('SPROVEEDOR.scode', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.isempleado field.
DBSetProp('SPROVEEDOR.isempleado', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.isempleado', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.isempleado', 'Field', 'UpdateName', 'sujetos.isempleado')
DBSetProp('SPROVEEDOR.isempleado', 'Field', 'DataType', "C(1)")
* Props for the SPROVEEDOR.isproveedor field.
DBSetProp('SPROVEEDOR.isproveedor', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.isproveedor', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.isproveedor', 'Field', 'UpdateName', 'sujetos.isproveedor')
DBSetProp('SPROVEEDOR.isproveedor', 'Field', 'DataType', "C(1)")
* Props for the SPROVEEDOR.isproductor field.
DBSetProp('SPROVEEDOR.isproductor', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.isproductor', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.isproductor', 'Field', 'UpdateName', 'sujetos.isproductor')
DBSetProp('SPROVEEDOR.isproductor', 'Field', 'DataType', "C(1)")
* Props for the SPROVEEDOR.iscliente field.
DBSetProp('SPROVEEDOR.iscliente', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.iscliente', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.iscliente', 'Field', 'UpdateName', 'sujetos.iscliente')
DBSetProp('SPROVEEDOR.iscliente', 'Field', 'DataType', "C(1)")
* Props for the SPROVEEDOR.sname field.
DBSetProp('SPROVEEDOR.sname', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sname', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sname', 'Field', 'UpdateName', 'sujetos.sname')
DBSetProp('SPROVEEDOR.sname', 'Field', 'DataType', "C(40)")
* Props for the SPROVEEDOR.ssri field.
DBSetProp('SPROVEEDOR.ssri', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.ssri', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.ssri', 'Field', 'UpdateName', 'sujetos.ssri')
DBSetProp('SPROVEEDOR.ssri', 'Field', 'DataType', "C(60)")
* Props for the SPROVEEDOR.scedula field.
DBSetProp('SPROVEEDOR.scedula', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.scedula', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.scedula', 'Field', 'UpdateName', 'sujetos.scedula')
DBSetProp('SPROVEEDOR.scedula', 'Field', 'DataType', "C(10)")
* Props for the SPROVEEDOR.sruc field.
DBSetProp('SPROVEEDOR.sruc', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sruc', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sruc', 'Field', 'UpdateName', 'sujetos.sruc')
DBSetProp('SPROVEEDOR.sruc', 'Field', 'DataType', "C(13)")
* Props for the SPROVEEDOR.spasaporte field.
DBSetProp('SPROVEEDOR.spasaporte', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.spasaporte', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.spasaporte', 'Field', 'UpdateName', 'sujetos.spasaporte')
DBSetProp('SPROVEEDOR.spasaporte', 'Field', 'DataType', "C(25)")
* Props for the SPROVEEDOR.saddr field.
DBSetProp('SPROVEEDOR.saddr', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.saddr', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.saddr', 'Field', 'UpdateName', 'sujetos.saddr')
DBSetProp('SPROVEEDOR.saddr', 'Field', 'DataType', "C(60)")
* Props for the SPROVEEDOR.saddr2 field.
DBSetProp('SPROVEEDOR.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.saddr2', 'Field', 'UpdateName', 'sujetos.saddr2')
DBSetProp('SPROVEEDOR.saddr2', 'Field', 'DataType', "C(60)")
* Props for the SPROVEEDOR.stelf field.
DBSetProp('SPROVEEDOR.stelf', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.stelf', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.stelf', 'Field', 'UpdateName', 'sujetos.stelf')
DBSetProp('SPROVEEDOR.stelf', 'Field', 'DataType', "C(15)")
* Props for the SPROVEEDOR.sfax field.
DBSetProp('SPROVEEDOR.sfax', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sfax', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sfax', 'Field', 'UpdateName', 'sujetos.sfax')
DBSetProp('SPROVEEDOR.sfax', 'Field', 'DataType', "C(15)")
* Props for the SPROVEEDOR.scel field.
DBSetProp('SPROVEEDOR.scel', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.scel', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.scel', 'Field', 'UpdateName', 'sujetos.scel')
DBSetProp('SPROVEEDOR.scel', 'Field', 'DataType', "C(15)")
* Props for the SPROVEEDOR.smail field.
DBSetProp('SPROVEEDOR.smail', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.smail', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.smail', 'Field', 'UpdateName', 'sujetos.smail')
DBSetProp('SPROVEEDOR.smail', 'Field', 'DataType', "C(50)")
* Props for the SPROVEEDOR.swww field.
DBSetProp('SPROVEEDOR.swww', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.swww', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.swww', 'Field', 'UpdateName', 'sujetos.swww')
DBSetProp('SPROVEEDOR.swww', 'Field', 'DataType', "C(50)")
* Props for the SPROVEEDOR.semp field.
DBSetProp('SPROVEEDOR.semp', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.semp', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.semp', 'Field', 'UpdateName', 'sujetos.semp')
DBSetProp('SPROVEEDOR.semp', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.smoney field.
DBSetProp('SPROVEEDOR.smoney', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.smoney', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.smoney', 'Field', 'UpdateName', 'sujetos.smoney')
DBSetProp('SPROVEEDOR.smoney', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.sprov field.
DBSetProp('SPROVEEDOR.sprov', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sprov', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sprov', 'Field', 'UpdateName', 'sujetos.sprov')
DBSetProp('SPROVEEDOR.sprov', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.ssaldo field.
DBSetProp('SPROVEEDOR.ssaldo', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.ssaldo', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.ssaldo', 'Field', 'UpdateName', 'sujetos.ssaldo')
DBSetProp('SPROVEEDOR.ssaldo', 'Field', 'DataType', "B(8,2)")
* Props for the SPROVEEDOR.scredito field.
DBSetProp('SPROVEEDOR.scredito', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.scredito', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.scredito', 'Field', 'UpdateName', 'sujetos.scredito')
DBSetProp('SPROVEEDOR.scredito', 'Field', 'DataType', "B(8,2)")
* Props for the SPROVEEDOR.scheques field.
DBSetProp('SPROVEEDOR.scheques', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.scheques', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.scheques', 'Field', 'UpdateName', 'sujetos.scheques')
DBSetProp('SPROVEEDOR.scheques', 'Field', 'DataType', "B(8,2)")
* Props for the SPROVEEDOR.sprotesto field.
DBSetProp('SPROVEEDOR.sprotesto', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sprotesto', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sprotesto', 'Field', 'UpdateName', 'sujetos.sprotesto')
DBSetProp('SPROVEEDOR.sprotesto', 'Field', 'DataType', "C(1)")
* Props for the SPROVEEDOR.stag field.
DBSetProp('SPROVEEDOR.stag', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.stag', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.stag', 'Field', 'UpdateName', 'sujetos.stag')
DBSetProp('SPROVEEDOR.stag', 'Field', 'DataType', "C(10)")
* Props for the SPROVEEDOR.sciudad field.
DBSetProp('SPROVEEDOR.sciudad', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.sciudad', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.sciudad', 'Field', 'UpdateName', 'sujetos.sciudad')
DBSetProp('SPROVEEDOR.sciudad', 'Field', 'DataType', "I")
* Props for the SPROVEEDOR.snumcasa field.
DBSetProp('SPROVEEDOR.snumcasa', 'Field', 'KeyField', .F.)
DBSetProp('SPROVEEDOR.snumcasa', 'Field', 'Updatable', .T.)
DBSetProp('SPROVEEDOR.snumcasa', 'Field', 'UpdateName', 'sujetos.snumcasa')
DBSetProp('SPROVEEDOR.snumcasa', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_SCLIENTES
***************** Ver la configuración para SCLIENTES ***************

CREATE SQL VIEW "SCLIENTES" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM sujetos Sujetos WHERE Sujetos.semp = ?ide   AND Sujetos.iscliente = '1'

DBSetProp('SCLIENTES', 'View', 'UpdateType', 1)
DBSetProp('SCLIENTES', 'View', 'WhereType', 3)
DBSetProp('SCLIENTES', 'View', 'FetchMemo', .T.)
DBSetProp('SCLIENTES', 'View', 'SendUpdates', .T.)
DBSetProp('SCLIENTES', 'View', 'UseMemoSize', 255)
DBSetProp('SCLIENTES', 'View', 'FetchSize', 100)
DBSetProp('SCLIENTES', 'View', 'MaxRecords', -1)
DBSetProp('SCLIENTES', 'View', 'Tables', 'sujetos')
DBSetProp('SCLIENTES', 'View', 'Prepared', .F.)
DBSetProp('SCLIENTES', 'View', 'CompareMemo', .T.)
DBSetProp('SCLIENTES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SCLIENTES', 'View', 'FetchSize', 100)
DBSetProp('SCLIENTES', 'View', 'Comment', "")
DBSetProp('SCLIENTES', 'View', 'BatchUpdateCount', 1)
DBSetProp('SCLIENTES', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for SCLIENTES
* Props for the SCLIENTES.idsujeto field.
DBSetProp('SCLIENTES.idsujeto', 'Field', 'KeyField', .T.)
DBSetProp('SCLIENTES.idsujeto', 'Field', 'Updatable', .F.)
DBSetProp('SCLIENTES.idsujeto', 'Field', 'UpdateName', 'sujetos.idsujeto')
DBSetProp('SCLIENTES.idsujeto', 'Field', 'DataType', "I")
* Props for the SCLIENTES.scode field.
DBSetProp('SCLIENTES.scode', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.scode', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.scode', 'Field', 'UpdateName', 'sujetos.scode')
DBSetProp('SCLIENTES.scode', 'Field', 'DataType', "I")
* Props for the SCLIENTES.isempleado field.
DBSetProp('SCLIENTES.isempleado', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.isempleado', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.isempleado', 'Field', 'UpdateName', 'sujetos.isempleado')
DBSetProp('SCLIENTES.isempleado', 'Field', 'DataType', "C(1)")
* Props for the SCLIENTES.isproveedor field.
DBSetProp('SCLIENTES.isproveedor', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.isproveedor', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.isproveedor', 'Field', 'UpdateName', 'sujetos.isproveedor')
DBSetProp('SCLIENTES.isproveedor', 'Field', 'DataType', "C(1)")
* Props for the SCLIENTES.isproductor field.
DBSetProp('SCLIENTES.isproductor', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.isproductor', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.isproductor', 'Field', 'UpdateName', 'sujetos.isproductor')
DBSetProp('SCLIENTES.isproductor', 'Field', 'DataType', "C(1)")
* Props for the SCLIENTES.iscliente field.
DBSetProp('SCLIENTES.iscliente', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.iscliente', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.iscliente', 'Field', 'UpdateName', 'sujetos.iscliente')
DBSetProp('SCLIENTES.iscliente', 'Field', 'DataType', "C(1)")
* Props for the SCLIENTES.sname field.
DBSetProp('SCLIENTES.sname', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sname', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sname', 'Field', 'UpdateName', 'sujetos.sname')
DBSetProp('SCLIENTES.sname', 'Field', 'DataType', "C(40)")
* Props for the SCLIENTES.ssri field.
DBSetProp('SCLIENTES.ssri', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.ssri', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.ssri', 'Field', 'UpdateName', 'sujetos.ssri')
DBSetProp('SCLIENTES.ssri', 'Field', 'DataType', "C(60)")
* Props for the SCLIENTES.scedula field.
DBSetProp('SCLIENTES.scedula', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.scedula', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.scedula', 'Field', 'UpdateName', 'sujetos.scedula')
DBSetProp('SCLIENTES.scedula', 'Field', 'DataType', "C(10)")
* Props for the SCLIENTES.sruc field.
DBSetProp('SCLIENTES.sruc', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sruc', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sruc', 'Field', 'UpdateName', 'sujetos.sruc')
DBSetProp('SCLIENTES.sruc', 'Field', 'DataType', "C(13)")
* Props for the SCLIENTES.spasaporte field.
DBSetProp('SCLIENTES.spasaporte', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.spasaporte', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.spasaporte', 'Field', 'UpdateName', 'sujetos.spasaporte')
DBSetProp('SCLIENTES.spasaporte', 'Field', 'DataType', "C(25)")
* Props for the SCLIENTES.saddr field.
DBSetProp('SCLIENTES.saddr', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.saddr', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.saddr', 'Field', 'UpdateName', 'sujetos.saddr')
DBSetProp('SCLIENTES.saddr', 'Field', 'DataType', "C(60)")
* Props for the SCLIENTES.saddr2 field.
DBSetProp('SCLIENTES.saddr2', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.saddr2', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.saddr2', 'Field', 'UpdateName', 'sujetos.saddr2')
DBSetProp('SCLIENTES.saddr2', 'Field', 'DataType', "C(60)")
* Props for the SCLIENTES.stelf field.
DBSetProp('SCLIENTES.stelf', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.stelf', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.stelf', 'Field', 'UpdateName', 'sujetos.stelf')
DBSetProp('SCLIENTES.stelf', 'Field', 'DataType', "C(15)")
* Props for the SCLIENTES.sfax field.
DBSetProp('SCLIENTES.sfax', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sfax', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sfax', 'Field', 'UpdateName', 'sujetos.sfax')
DBSetProp('SCLIENTES.sfax', 'Field', 'DataType', "C(15)")
* Props for the SCLIENTES.scel field.
DBSetProp('SCLIENTES.scel', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.scel', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.scel', 'Field', 'UpdateName', 'sujetos.scel')
DBSetProp('SCLIENTES.scel', 'Field', 'DataType', "C(15)")
* Props for the SCLIENTES.smail field.
DBSetProp('SCLIENTES.smail', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.smail', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.smail', 'Field', 'UpdateName', 'sujetos.smail')
DBSetProp('SCLIENTES.smail', 'Field', 'DataType', "C(50)")
* Props for the SCLIENTES.swww field.
DBSetProp('SCLIENTES.swww', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.swww', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.swww', 'Field', 'UpdateName', 'sujetos.swww')
DBSetProp('SCLIENTES.swww', 'Field', 'DataType', "C(50)")
* Props for the SCLIENTES.semp field.
DBSetProp('SCLIENTES.semp', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.semp', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.semp', 'Field', 'UpdateName', 'sujetos.semp')
DBSetProp('SCLIENTES.semp', 'Field', 'DataType', "I")
* Props for the SCLIENTES.smoney field.
DBSetProp('SCLIENTES.smoney', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.smoney', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.smoney', 'Field', 'UpdateName', 'sujetos.smoney')
DBSetProp('SCLIENTES.smoney', 'Field', 'DataType', "I")
* Props for the SCLIENTES.sprov field.
DBSetProp('SCLIENTES.sprov', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sprov', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sprov', 'Field', 'UpdateName', 'sujetos.sprov')
DBSetProp('SCLIENTES.sprov', 'Field', 'DataType', "I")
* Props for the SCLIENTES.ssaldo field.
DBSetProp('SCLIENTES.ssaldo', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.ssaldo', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.ssaldo', 'Field', 'UpdateName', 'sujetos.ssaldo')
DBSetProp('SCLIENTES.ssaldo', 'Field', 'DataType', "B(8,2)")
* Props for the SCLIENTES.scredito field.
DBSetProp('SCLIENTES.scredito', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.scredito', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.scredito', 'Field', 'UpdateName', 'sujetos.scredito')
DBSetProp('SCLIENTES.scredito', 'Field', 'DataType', "B(8,2)")
* Props for the SCLIENTES.scheques field.
DBSetProp('SCLIENTES.scheques', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.scheques', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.scheques', 'Field', 'UpdateName', 'sujetos.scheques')
DBSetProp('SCLIENTES.scheques', 'Field', 'DataType', "B(8,2)")
* Props for the SCLIENTES.sprotesto field.
DBSetProp('SCLIENTES.sprotesto', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sprotesto', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sprotesto', 'Field', 'UpdateName', 'sujetos.sprotesto')
DBSetProp('SCLIENTES.sprotesto', 'Field', 'DataType', "C(1)")
* Props for the SCLIENTES.stag field.
DBSetProp('SCLIENTES.stag', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.stag', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.stag', 'Field', 'UpdateName', 'sujetos.stag')
DBSetProp('SCLIENTES.stag', 'Field', 'DataType', "C(10)")
* Props for the SCLIENTES.sciudad field.
DBSetProp('SCLIENTES.sciudad', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.sciudad', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.sciudad', 'Field', 'UpdateName', 'sujetos.sciudad')
DBSetProp('SCLIENTES.sciudad', 'Field', 'DataType', "I")
* Props for the SCLIENTES.snumcasa field.
DBSetProp('SCLIENTES.snumcasa', 'Field', 'KeyField', .F.)
DBSetProp('SCLIENTES.snumcasa', 'Field', 'Updatable', .T.)
DBSetProp('SCLIENTES.snumcasa', 'Field', 'UpdateName', 'sujetos.snumcasa')
DBSetProp('SCLIENTES.snumcasa', 'Field', 'DataType', "I")
ENDFUNC
 
FUNCTION MakeView_VARIBLES
***************** Ver la configuración para VARIBLES ***************

CREATE SQL VIEW "VARIBLES" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM variables Variables ORDER BY Variables.fecha, Variables.descripda

DBSetProp('VARIBLES', 'View', 'UpdateType', 1)
DBSetProp('VARIBLES', 'View', 'WhereType', 3)
DBSetProp('VARIBLES', 'View', 'FetchMemo', .T.)
DBSetProp('VARIBLES', 'View', 'SendUpdates', .T.)
DBSetProp('VARIBLES', 'View', 'UseMemoSize', 255)
DBSetProp('VARIBLES', 'View', 'FetchSize', 100)
DBSetProp('VARIBLES', 'View', 'MaxRecords', -1)
DBSetProp('VARIBLES', 'View', 'Tables', 'variables')
DBSetProp('VARIBLES', 'View', 'Prepared', .F.)
DBSetProp('VARIBLES', 'View', 'CompareMemo', .T.)
DBSetProp('VARIBLES', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VARIBLES', 'View', 'FetchSize', 100)
DBSetProp('VARIBLES', 'View', 'Comment', "")
DBSetProp('VARIBLES', 'View', 'BatchUpdateCount', 1)
DBSetProp('VARIBLES', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VARIBLES
* Props for the VARIBLES.fecha field.
DBSetProp('VARIBLES.fecha', 'Field', 'KeyField', .T.)
DBSetProp('VARIBLES.fecha', 'Field', 'Updatable', .T.)
DBSetProp('VARIBLES.fecha', 'Field', 'UpdateName', 'variables.fecha')
DBSetProp('VARIBLES.fecha', 'Field', 'DataType', "D")
* Props for the VARIBLES.descripda field.
DBSetProp('VARIBLES.descripda', 'Field', 'KeyField', .F.)
DBSetProp('VARIBLES.descripda', 'Field', 'Updatable', .T.)
DBSetProp('VARIBLES.descripda', 'Field', 'UpdateName', 'variables.descripda')
DBSetProp('VARIBLES.descripda', 'Field', 'DataType', "C(40)")
* Props for the VARIBLES.valor field.
DBSetProp('VARIBLES.valor', 'Field', 'KeyField', .F.)
DBSetProp('VARIBLES.valor', 'Field', 'Updatable', .T.)
DBSetProp('VARIBLES.valor', 'Field', 'UpdateName', 'variables.valor')
DBSetProp('VARIBLES.valor', 'Field', 'DataType', "C(15)")
ENDFUNC
 
FUNCTION MakeView_ARTICULOS
***************** Ver la configuración para ARTICULOS ***************

CREATE SQL VIEW "ARTICULOS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM articulos Articulos WHERE Articulos.codemp = ?ide

DBSetProp('ARTICULOS', 'View', 'UpdateType', 1)
DBSetProp('ARTICULOS', 'View', 'WhereType', 3)
DBSetProp('ARTICULOS', 'View', 'FetchMemo', .T.)
DBSetProp('ARTICULOS', 'View', 'SendUpdates', .T.)
DBSetProp('ARTICULOS', 'View', 'UseMemoSize', 255)
DBSetProp('ARTICULOS', 'View', 'FetchSize', 100)
DBSetProp('ARTICULOS', 'View', 'MaxRecords', -1)
DBSetProp('ARTICULOS', 'View', 'Tables', 'articulos')
DBSetProp('ARTICULOS', 'View', 'Prepared', .F.)
DBSetProp('ARTICULOS', 'View', 'CompareMemo', .T.)
DBSetProp('ARTICULOS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ARTICULOS', 'View', 'FetchSize', 100)
DBSetProp('ARTICULOS', 'View', 'Comment', "")
DBSetProp('ARTICULOS', 'View', 'BatchUpdateCount', 1)
DBSetProp('ARTICULOS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for ARTICULOS
* Props for the ARTICULOS.idarticulo field.
DBSetProp('ARTICULOS.idarticulo', 'Field', 'KeyField', .T.)
DBSetProp('ARTICULOS.idarticulo', 'Field', 'Updatable', .F.)
DBSetProp('ARTICULOS.idarticulo', 'Field', 'UpdateName', 'articulos.idarticulo')
DBSetProp('ARTICULOS.idarticulo', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artcode field.
DBSetProp('ARTICULOS.artcode', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artcode', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artcode', 'Field', 'UpdateName', 'articulos.artcode')
DBSetProp('ARTICULOS.artcode', 'Field', 'DataType', "I")
* Props for the ARTICULOS.arttag field.
DBSetProp('ARTICULOS.arttag', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.arttag', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.arttag', 'Field', 'UpdateName', 'articulos.arttag')
DBSetProp('ARTICULOS.arttag', 'Field', 'DataType', "C(20)")
* Props for the ARTICULOS.artname field.
DBSetProp('ARTICULOS.artname', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artname', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artname', 'Field', 'UpdateName', 'articulos.artname')
DBSetProp('ARTICULOS.artname', 'Field', 'DataType', "C(50)")
* Props for the ARTICULOS.artgrupo field.
DBSetProp('ARTICULOS.artgrupo', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artgrupo', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artgrupo', 'Field', 'UpdateName', 'articulos.artgrupo')
DBSetProp('ARTICULOS.artgrupo', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artsgrupo field.
DBSetProp('ARTICULOS.artsgrupo', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artsgrupo', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artsgrupo', 'Field', 'UpdateName', 'articulos.artsgrupo')
DBSetProp('ARTICULOS.artsgrupo', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artmarca field.
DBSetProp('ARTICULOS.artmarca', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artmarca', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artmarca', 'Field', 'UpdateName', 'articulos.artmarca')
DBSetProp('ARTICULOS.artmarca', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artunid field.
DBSetProp('ARTICULOS.artunid', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artunid', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artunid', 'Field', 'UpdateName', 'articulos.artunid')
DBSetProp('ARTICULOS.artunid', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artmoney field.
DBSetProp('ARTICULOS.artmoney', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artmoney', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artmoney', 'Field', 'UpdateName', 'articulos.artmoney')
DBSetProp('ARTICULOS.artmoney', 'Field', 'DataType', "I")
* Props for the ARTICULOS.artpeso field.
DBSetProp('ARTICULOS.artpeso', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artpeso', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artpeso', 'Field', 'UpdateName', 'articulos.artpeso')
DBSetProp('ARTICULOS.artpeso', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artsell field.
DBSetProp('ARTICULOS.artsell', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artsell', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artsell', 'Field', 'UpdateName', 'articulos.artsell')
DBSetProp('ARTICULOS.artsell', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artcosto field.
DBSetProp('ARTICULOS.artcosto', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artcosto', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artcosto', 'Field', 'UpdateName', 'articulos.artcosto')
DBSetProp('ARTICULOS.artcosto', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artfob field.
DBSetProp('ARTICULOS.artfob', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artfob', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artfob', 'Field', 'UpdateName', 'articulos.artfob')
DBSetProp('ARTICULOS.artfob', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artcosto2 field.
DBSetProp('ARTICULOS.artcosto2', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artcosto2', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artcosto2', 'Field', 'UpdateName', 'articulos.artcosto2')
DBSetProp('ARTICULOS.artcosto2', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artfob2 field.
DBSetProp('ARTICULOS.artfob2', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artfob2', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artfob2', 'Field', 'UpdateName', 'articulos.artfob2')
DBSetProp('ARTICULOS.artfob2', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artwin1 field.
DBSetProp('ARTICULOS.artwin1', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artwin1', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artwin1', 'Field', 'UpdateName', 'articulos.artwin1')
DBSetProp('ARTICULOS.artwin1', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artwin2 field.
DBSetProp('ARTICULOS.artwin2', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artwin2', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artwin2', 'Field', 'UpdateName', 'articulos.artwin2')
DBSetProp('ARTICULOS.artwin2', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.artwin3 field.
DBSetProp('ARTICULOS.artwin3', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.artwin3', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.artwin3', 'Field', 'UpdateName', 'articulos.artwin3')
DBSetProp('ARTICULOS.artwin3', 'Field', 'DataType', "B(8,2)")
* Props for the ARTICULOS.issell field.
DBSetProp('ARTICULOS.issell', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.issell', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.issell', 'Field', 'UpdateName', 'articulos.issell')
DBSetProp('ARTICULOS.issell', 'Field', 'DataType', "C(1)")
* Props for the ARTICULOS.isbuy field.
DBSetProp('ARTICULOS.isbuy', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.isbuy', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.isbuy', 'Field', 'UpdateName', 'articulos.isbuy')
DBSetProp('ARTICULOS.isbuy', 'Field', 'DataType', "C(1)")
* Props for the ARTICULOS.isreturn field.
DBSetProp('ARTICULOS.isreturn', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.isreturn', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.isreturn', 'Field', 'UpdateName', 'articulos.isreturn')
DBSetProp('ARTICULOS.isreturn', 'Field', 'DataType', "C(1)")
* Props for the ARTICULOS.isfob field.
DBSetProp('ARTICULOS.isfob', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.isfob', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.isfob', 'Field', 'UpdateName', 'articulos.isfob')
DBSetProp('ARTICULOS.isfob', 'Field', 'DataType', "C(1)")
* Props for the ARTICULOS.arttype field.
DBSetProp('ARTICULOS.arttype', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.arttype', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.arttype', 'Field', 'UpdateName', 'articulos.arttype')
DBSetProp('ARTICULOS.arttype', 'Field', 'DataType', "C(1)")
* Props for the ARTICULOS.codemp field.
DBSetProp('ARTICULOS.codemp', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.codemp', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.codemp', 'Field', 'UpdateName', 'articulos.codemp')
DBSetProp('ARTICULOS.codemp', 'Field', 'DataType', "I")
* Props for the ARTICULOS.isiva field.
DBSetProp('ARTICULOS.isiva', 'Field', 'KeyField', .F.)
DBSetProp('ARTICULOS.isiva', 'Field', 'Updatable', .T.)
DBSetProp('ARTICULOS.isiva', 'Field', 'UpdateName', 'articulos.isiva')
DBSetProp('ARTICULOS.isiva', 'Field', 'DataType', "C(1)")
ENDFUNC
 
FUNCTION MakeView_DOCUMENTS
***************** Ver la configuración para DOCUMENTS ***************

CREATE SQL VIEW "DOCUMENTS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM documents Documents

DBSetProp('DOCUMENTS', 'View', 'UpdateType', 1)
DBSetProp('DOCUMENTS', 'View', 'WhereType', 3)
DBSetProp('DOCUMENTS', 'View', 'FetchMemo', .T.)
DBSetProp('DOCUMENTS', 'View', 'SendUpdates', .T.)
DBSetProp('DOCUMENTS', 'View', 'UseMemoSize', 255)
DBSetProp('DOCUMENTS', 'View', 'FetchSize', 100)
DBSetProp('DOCUMENTS', 'View', 'MaxRecords', -1)
DBSetProp('DOCUMENTS', 'View', 'Tables', 'documents')
DBSetProp('DOCUMENTS', 'View', 'Prepared', .F.)
DBSetProp('DOCUMENTS', 'View', 'CompareMemo', .T.)
DBSetProp('DOCUMENTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOCUMENTS', 'View', 'FetchSize', 100)
DBSetProp('DOCUMENTS', 'View', 'Comment', "")
DBSetProp('DOCUMENTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOCUMENTS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DOCUMENTS
* Props for the DOCUMENTS.idumo field.
DBSetProp('DOCUMENTS.idumo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.idumo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.idumo', 'Field', 'UpdateName', 'documents.idumo')
DBSetProp('DOCUMENTS.idumo', 'Field', 'DataType', "N(6)")
* Props for the DOCUMENTS.fecmo field.
DBSetProp('DOCUMENTS.fecmo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.fecmo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.fecmo', 'Field', 'UpdateName', 'documents.fecmo')
DBSetProp('DOCUMENTS.fecmo', 'Field', 'DataType', "T")
* Props for the DOCUMENTS.idua field.
DBSetProp('DOCUMENTS.idua', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.idua', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.idua', 'Field', 'UpdateName', 'documents.idua')
DBSetProp('DOCUMENTS.idua', 'Field', 'DataType', "N(6)")
* Props for the DOCUMENTS.feca field.
DBSetProp('DOCUMENTS.feca', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.feca', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.feca', 'Field', 'UpdateName', 'documents.feca')
DBSetProp('DOCUMENTS.feca', 'Field', 'DataType', "T")
* Props for the DOCUMENTS.idugra field.
DBSetProp('DOCUMENTS.idugra', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.idugra', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.idugra', 'Field', 'UpdateName', 'documents.idugra')
DBSetProp('DOCUMENTS.idugra', 'Field', 'DataType', "N(6)")
* Props for the DOCUMENTS.fecgra field.
DBSetProp('DOCUMENTS.fecgra', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.fecgra', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.fecgra', 'Field', 'UpdateName', 'documents.fecgra')
DBSetProp('DOCUMENTS.fecgra', 'Field', 'DataType', "T")
* Props for the DOCUMENTS.code field.
DBSetProp('DOCUMENTS.code', 'Field', 'KeyField', .T.)
DBSetProp('DOCUMENTS.code', 'Field', 'Updatable', .F.)
DBSetProp('DOCUMENTS.code', 'Field', 'UpdateName', 'documents.code')
DBSetProp('DOCUMENTS.code', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.pdocode field.
DBSetProp('DOCUMENTS.pdocode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.pdocode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.pdocode', 'Field', 'UpdateName', 'documents.pdocode')
DBSetProp('DOCUMENTS.pdocode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.succode field.
DBSetProp('DOCUMENTS.succode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.succode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.succode', 'Field', 'UpdateName', 'documents.succode')
DBSetProp('DOCUMENTS.succode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.depcode field.
DBSetProp('DOCUMENTS.depcode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.depcode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.depcode', 'Field', 'UpdateName', 'documents.depcode')
DBSetProp('DOCUMENTS.depcode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.userstore field.
DBSetProp('DOCUMENTS.userstore', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.userstore', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.userstore', 'Field', 'UpdateName', 'documents.userstore')
DBSetProp('DOCUMENTS.userstore', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.usercaja field.
DBSetProp('DOCUMENTS.usercaja', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.usercaja', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.usercaja', 'Field', 'UpdateName', 'documents.usercaja')
DBSetProp('DOCUMENTS.usercaja', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.doccode field.
DBSetProp('DOCUMENTS.doccode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.doccode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.doccode', 'Field', 'UpdateName', 'documents.doccode')
DBSetProp('DOCUMENTS.doccode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.num field.
DBSetProp('DOCUMENTS.num', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.num', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.num', 'Field', 'UpdateName', 'documents.num')
DBSetProp('DOCUMENTS.num', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.fecha field.
DBSetProp('DOCUMENTS.fecha', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.fecha', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.fecha', 'Field', 'UpdateName', 'documents.fecha')
DBSetProp('DOCUMENTS.fecha', 'Field', 'DataType', "D")
* Props for the DOCUMENTS.hacienda field.
DBSetProp('DOCUMENTS.hacienda', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.hacienda', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.hacienda', 'Field', 'UpdateName', 'documents.hacienda')
DBSetProp('DOCUMENTS.hacienda', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.barcode field.
DBSetProp('DOCUMENTS.barcode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.barcode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.barcode', 'Field', 'UpdateName', 'documents.barcode')
DBSetProp('DOCUMENTS.barcode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.grupo field.
DBSetProp('DOCUMENTS.grupo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.grupo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.grupo', 'Field', 'UpdateName', 'documents.grupo')
DBSetProp('DOCUMENTS.grupo', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.marca field.
DBSetProp('DOCUMENTS.marca', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.marca', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.marca', 'Field', 'UpdateName', 'documents.marca')
DBSetProp('DOCUMENTS.marca', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.embcode field.
DBSetProp('DOCUMENTS.embcode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.embcode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.embcode', 'Field', 'UpdateName', 'documents.embcode')
DBSetProp('DOCUMENTS.embcode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.ffrom field.
DBSetProp('DOCUMENTS.ffrom', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.ffrom', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.ffrom', 'Field', 'UpdateName', 'documents.ffrom')
DBSetProp('DOCUMENTS.ffrom', 'Field', 'DataType', "D")
* Props for the DOCUMENTS.fto field.
DBSetProp('DOCUMENTS.fto', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.fto', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.fto', 'Field', 'UpdateName', 'documents.fto')
DBSetProp('DOCUMENTS.fto', 'Field', 'DataType', "D")
* Props for the DOCUMENTS.seller field.
DBSetProp('DOCUMENTS.seller', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.seller', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.seller', 'Field', 'UpdateName', 'documents.seller')
DBSetProp('DOCUMENTS.seller', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.casher field.
DBSetProp('DOCUMENTS.casher', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.casher', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.casher', 'Field', 'UpdateName', 'documents.casher')
DBSetProp('DOCUMENTS.casher', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.linkdoc field.
DBSetProp('DOCUMENTS.linkdoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.linkdoc', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.linkdoc', 'Field', 'UpdateName', 'documents.linkdoc')
DBSetProp('DOCUMENTS.linkdoc', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.cliente field.
DBSetProp('DOCUMENTS.cliente', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.cliente', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.cliente', 'Field', 'UpdateName', 'documents.cliente')
DBSetProp('DOCUMENTS.cliente', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.auxcode field.
DBSetProp('DOCUMENTS.auxcode', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.auxcode', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.auxcode', 'Field', 'UpdateName', 'documents.auxcode')
DBSetProp('DOCUMENTS.auxcode', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.auxitem field.
DBSetProp('DOCUMENTS.auxitem', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.auxitem', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.auxitem', 'Field', 'UpdateName', 'documents.auxitem')
DBSetProp('DOCUMENTS.auxitem', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.duracion field.
DBSetProp('DOCUMENTS.duracion', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.duracion', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.duracion', 'Field', 'UpdateName', 'documents.duracion')
DBSetProp('DOCUMENTS.duracion', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.taza field.
DBSetProp('DOCUMENTS.taza', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.taza', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.taza', 'Field', 'UpdateName', 'documents.taza')
DBSetProp('DOCUMENTS.taza', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.valcuota field.
DBSetProp('DOCUMENTS.valcuota', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.valcuota', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.valcuota', 'Field', 'UpdateName', 'documents.valcuota')
DBSetProp('DOCUMENTS.valcuota', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.numcuota field.
DBSetProp('DOCUMENTS.numcuota', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.numcuota', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.numcuota', 'Field', 'UpdateName', 'documents.numcuota')
DBSetProp('DOCUMENTS.numcuota', 'Field', 'DataType', "I")
* Props for the DOCUMENTS.poriva field.
DBSetProp('DOCUMENTS.poriva', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.poriva', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.poriva', 'Field', 'UpdateName', 'documents.poriva')
DBSetProp('DOCUMENTS.poriva', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.descuconiva field.
DBSetProp('DOCUMENTS.descuconiva', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.descuconiva', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.descuconiva', 'Field', 'UpdateName', 'documents.descuconiva')
DBSetProp('DOCUMENTS.descuconiva', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.descusiniva field.
DBSetProp('DOCUMENTS.descusiniva', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.descusiniva', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.descusiniva', 'Field', 'UpdateName', 'documents.descusiniva')
DBSetProp('DOCUMENTS.descusiniva', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.recargo field.
DBSetProp('DOCUMENTS.recargo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.recargo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.recargo', 'Field', 'UpdateName', 'documents.recargo')
DBSetProp('DOCUMENTS.recargo', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.flete field.
DBSetProp('DOCUMENTS.flete', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.flete', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.flete', 'Field', 'UpdateName', 'documents.flete')
DBSetProp('DOCUMENTS.flete', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.subconiva field.
DBSetProp('DOCUMENTS.subconiva', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.subconiva', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.subconiva', 'Field', 'UpdateName', 'documents.subconiva')
DBSetProp('DOCUMENTS.subconiva', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.subsiniva field.
DBSetProp('DOCUMENTS.subsiniva', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.subsiniva', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.subsiniva', 'Field', 'UpdateName', 'documents.subsiniva')
DBSetProp('DOCUMENTS.subsiniva', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.montoivaart field.
DBSetProp('DOCUMENTS.montoivaart', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.montoivaart', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.montoivaart', 'Field', 'UpdateName', 'documents.montoivaart')
DBSetProp('DOCUMENTS.montoivaart', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.montoivaser field.
DBSetProp('DOCUMENTS.montoivaser', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.montoivaser', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.montoivaser', 'Field', 'UpdateName', 'documents.montoivaser')
DBSetProp('DOCUMENTS.montoivaser', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.subtotal field.
DBSetProp('DOCUMENTS.subtotal', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.subtotal', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.subtotal', 'Field', 'UpdateName', 'documents.subtotal')
DBSetProp('DOCUMENTS.subtotal', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.ivavalor field.
DBSetProp('DOCUMENTS.ivavalor', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.ivavalor', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.ivavalor', 'Field', 'UpdateName', 'documents.ivavalor')
DBSetProp('DOCUMENTS.ivavalor', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.icevalor field.
DBSetProp('DOCUMENTS.icevalor', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.icevalor', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.icevalor', 'Field', 'UpdateName', 'documents.icevalor')
DBSetProp('DOCUMENTS.icevalor', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.ipsvalor field.
DBSetProp('DOCUMENTS.ipsvalor', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.ipsvalor', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.ipsvalor', 'Field', 'UpdateName', 'documents.ipsvalor')
DBSetProp('DOCUMENTS.ipsvalor', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.montototal field.
DBSetProp('DOCUMENTS.montototal', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.montototal', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.montototal', 'Field', 'UpdateName', 'documents.montototal')
DBSetProp('DOCUMENTS.montototal', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.montopagado field.
DBSetProp('DOCUMENTS.montopagado', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.montopagado', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.montopagado', 'Field', 'UpdateName', 'documents.montopagado')
DBSetProp('DOCUMENTS.montopagado', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.saldo field.
DBSetProp('DOCUMENTS.saldo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.saldo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.saldo', 'Field', 'UpdateName', 'documents.saldo')
DBSetProp('DOCUMENTS.saldo', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.tmpsaldo field.
DBSetProp('DOCUMENTS.tmpsaldo', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.tmpsaldo', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.tmpsaldo', 'Field', 'UpdateName', 'documents.tmpsaldo')
DBSetProp('DOCUMENTS.tmpsaldo', 'Field', 'DataType', "B(8,2)")
* Props for the DOCUMENTS.isguia field.
DBSetProp('DOCUMENTS.isguia', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isguia', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isguia', 'Field', 'UpdateName', 'documents.isguia')
DBSetProp('DOCUMENTS.isguia', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.isupdate field.
DBSetProp('DOCUMENTS.isupdate', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isupdate', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isupdate', 'Field', 'UpdateName', 'documents.isupdate')
DBSetProp('DOCUMENTS.isupdate', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.isprint field.
DBSetProp('DOCUMENTS.isprint', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isprint', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isprint', 'Field', 'UpdateName', 'documents.isprint')
DBSetProp('DOCUMENTS.isprint', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.isaccount field.
DBSetProp('DOCUMENTS.isaccount', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isaccount', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isaccount', 'Field', 'UpdateName', 'documents.isaccount')
DBSetProp('DOCUMENTS.isaccount', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.isbodega field.
DBSetProp('DOCUMENTS.isbodega', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isbodega', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isbodega', 'Field', 'UpdateName', 'documents.isbodega')
DBSetProp('DOCUMENTS.isbodega', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.ispagado field.
DBSetProp('DOCUMENTS.ispagado', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.ispagado', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.ispagado', 'Field', 'UpdateName', 'documents.ispagado')
DBSetProp('DOCUMENTS.ispagado', 'Field', 'DataType', "C(1)")
* Props for the DOCUMENTS.isautorizado field.
DBSetProp('DOCUMENTS.isautorizado', 'Field', 'KeyField', .F.)
DBSetProp('DOCUMENTS.isautorizado', 'Field', 'Updatable', .T.)
DBSetProp('DOCUMENTS.isautorizado', 'Field', 'UpdateName', 'documents.isautorizado')
DBSetProp('DOCUMENTS.isautorizado', 'Field', 'DataType', "C(1)")
ENDFUNC
 
FUNCTION MakeView_GRUDAT
***************** Ver la configuración para GRUDAT ***************

CREATE SQL VIEW "GRUDAT" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM grudat Grudat ORDER BY Grudat.descripgru

DBSetProp('GRUDAT', 'View', 'UpdateType', 1)
DBSetProp('GRUDAT', 'View', 'WhereType', 3)
DBSetProp('GRUDAT', 'View', 'FetchMemo', .T.)
DBSetProp('GRUDAT', 'View', 'SendUpdates', .T.)
DBSetProp('GRUDAT', 'View', 'UseMemoSize', 255)
DBSetProp('GRUDAT', 'View', 'FetchSize', 100)
DBSetProp('GRUDAT', 'View', 'MaxRecords', -1)
DBSetProp('GRUDAT', 'View', 'Tables', 'grudat')
DBSetProp('GRUDAT', 'View', 'Prepared', .F.)
DBSetProp('GRUDAT', 'View', 'CompareMemo', .T.)
DBSetProp('GRUDAT', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GRUDAT', 'View', 'FetchSize', 100)
DBSetProp('GRUDAT', 'View', 'Comment', "")
DBSetProp('GRUDAT', 'View', 'BatchUpdateCount', 1)
DBSetProp('GRUDAT', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for GRUDAT
* Props for the GRUDAT.idgrupo field.
DBSetProp('GRUDAT.idgrupo', 'Field', 'KeyField', .T.)
DBSetProp('GRUDAT.idgrupo', 'Field', 'Updatable', .F.)
DBSetProp('GRUDAT.idgrupo', 'Field', 'UpdateName', 'grudat.idgrupo')
DBSetProp('GRUDAT.idgrupo', 'Field', 'DataType', "I")
* Props for the GRUDAT.descripgru field.
DBSetProp('GRUDAT.descripgru', 'Field', 'KeyField', .F.)
DBSetProp('GRUDAT.descripgru', 'Field', 'Updatable', .T.)
DBSetProp('GRUDAT.descripgru', 'Field', 'UpdateName', 'grudat.descripgru')
DBSetProp('GRUDAT.descripgru', 'Field', 'DataType', "C(40)")
* Props for the GRUDAT.gtag field.
DBSetProp('GRUDAT.gtag', 'Field', 'KeyField', .F.)
DBSetProp('GRUDAT.gtag', 'Field', 'Updatable', .T.)
DBSetProp('GRUDAT.gtag', 'Field', 'UpdateName', 'grudat.gtag')
DBSetProp('GRUDAT.gtag', 'Field', 'DataType', "C(4)")
* Props for the GRUDAT.tipo field.
DBSetProp('GRUDAT.tipo', 'Field', 'KeyField', .F.)
DBSetProp('GRUDAT.tipo', 'Field', 'Updatable', .T.)
DBSetProp('GRUDAT.tipo', 'Field', 'UpdateName', 'grudat.tipo')
DBSetProp('GRUDAT.tipo', 'Field', 'DataType', "C(1)")
ENDFUNC
 
FUNCTION MakeView_DOCUSE
***************** Ver la configuración para DOCUSE ***************

CREATE SQL VIEW "DOCUSE" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM docuse Docuse

DBSetProp('DOCUSE', 'View', 'UpdateType', 1)
DBSetProp('DOCUSE', 'View', 'WhereType', 3)
DBSetProp('DOCUSE', 'View', 'FetchMemo', .T.)
DBSetProp('DOCUSE', 'View', 'SendUpdates', .T.)
DBSetProp('DOCUSE', 'View', 'UseMemoSize', 255)
DBSetProp('DOCUSE', 'View', 'FetchSize', 100)
DBSetProp('DOCUSE', 'View', 'MaxRecords', -1)
DBSetProp('DOCUSE', 'View', 'Tables', 'docuse')
DBSetProp('DOCUSE', 'View', 'Prepared', .F.)
DBSetProp('DOCUSE', 'View', 'CompareMemo', .T.)
DBSetProp('DOCUSE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOCUSE', 'View', 'FetchSize', 100)
DBSetProp('DOCUSE', 'View', 'Comment', "")
DBSetProp('DOCUSE', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOCUSE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DOCUSE
* Props for the DOCUSE.iddocu field.
DBSetProp('DOCUSE.iddocu', 'Field', 'KeyField', .T.)
DBSetProp('DOCUSE.iddocu', 'Field', 'Updatable', .F.)
DBSetProp('DOCUSE.iddocu', 'Field', 'UpdateName', 'docuse.iddocu')
DBSetProp('DOCUSE.iddocu', 'Field', 'DataType', "I")
* Props for the DOCUSE.idemp field.
DBSetProp('DOCUSE.idemp', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.idemp', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.idemp', 'Field', 'UpdateName', 'docuse.idemp')
DBSetProp('DOCUSE.idemp', 'Field', 'DataType', "I")
* Props for the DOCUSE.numactual field.
DBSetProp('DOCUSE.numactual', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.numactual', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.numactual', 'Field', 'UpdateName', 'docuse.numactual')
DBSetProp('DOCUSE.numactual', 'Field', 'DataType', "I")
* Props for the DOCUSE.tipodoc field.
DBSetProp('DOCUSE.tipodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.tipodoc', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.tipodoc', 'Field', 'UpdateName', 'docuse.tipodoc')
DBSetProp('DOCUSE.tipodoc', 'Field', 'DataType', "I")
* Props for the DOCUSE.subtipodoc field.
DBSetProp('DOCUSE.subtipodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.subtipodoc', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.subtipodoc', 'Field', 'UpdateName', 'docuse.subtipodoc')
DBSetProp('DOCUSE.subtipodoc', 'Field', 'DataType', "I")
* Props for the DOCUSE.idreversodoc field.
DBSetProp('DOCUSE.idreversodoc', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.idreversodoc', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.idreversodoc', 'Field', 'UpdateName', 'docuse.idreversodoc')
DBSetProp('DOCUSE.idreversodoc', 'Field', 'DataType', "I")
* Props for the DOCUSE.dtag field.
DBSetProp('DOCUSE.dtag', 'Field', 'KeyField', .F.)
DBSetProp('DOCUSE.dtag', 'Field', 'Updatable', .T.)
DBSetProp('DOCUSE.dtag', 'Field', 'UpdateName', 'docuse.dtag')
DBSetProp('DOCUSE.dtag', 'Field', 'DataType', "C(10)")
ENDFUNC
 
FUNCTION MakeView_DATOSGEN
***************** Ver la configuración para DATOSGEN ***************

CREATE SQL VIEW "DATOSGEN" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT Detagru.*, Grudat.tipo, Grudat.gtag FROM detagru Detagru, grudat Grudat WHERE Detagru.idgrupo = Grudat.idgrupo   AND Detagru.idemp = ?ide ORDER BY Grudat.gtag, Detagru.descripda

DBSetProp('DATOSGEN', 'View', 'UpdateType', 1)
DBSetProp('DATOSGEN', 'View', 'WhereType', 1)
DBSetProp('DATOSGEN', 'View', 'FetchMemo', .T.)
DBSetProp('DATOSGEN', 'View', 'SendUpdates', .T.)
DBSetProp('DATOSGEN', 'View', 'UseMemoSize', 255)
DBSetProp('DATOSGEN', 'View', 'FetchSize', 100)
DBSetProp('DATOSGEN', 'View', 'MaxRecords', -1)
DBSetProp('DATOSGEN', 'View', 'Tables', 'detagru')
DBSetProp('DATOSGEN', 'View', 'Prepared', .F.)
DBSetProp('DATOSGEN', 'View', 'CompareMemo', .T.)
DBSetProp('DATOSGEN', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DATOSGEN', 'View', 'FetchSize', 100)
DBSetProp('DATOSGEN', 'View', 'Comment', "")
DBSetProp('DATOSGEN', 'View', 'BatchUpdateCount', 1)
DBSetProp('DATOSGEN', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for DATOSGEN
* Props for the DATOSGEN.idgrupo field.
DBSetProp('DATOSGEN.idgrupo', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.idgrupo', 'Field', 'Updatable', .T.)
DBSetProp('DATOSGEN.idgrupo', 'Field', 'UpdateName', 'detagru.idgrupo')
DBSetProp('DATOSGEN.idgrupo', 'Field', 'DataType', "I")
* Props for the DATOSGEN.iddato field.
DBSetProp('DATOSGEN.iddato', 'Field', 'KeyField', .T.)
DBSetProp('DATOSGEN.iddato', 'Field', 'Updatable', .F.)
DBSetProp('DATOSGEN.iddato', 'Field', 'UpdateName', 'detagru.iddato')
DBSetProp('DATOSGEN.iddato', 'Field', 'DataType', "I")
* Props for the DATOSGEN.descripda field.
DBSetProp('DATOSGEN.descripda', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.descripda', 'Field', 'Updatable', .T.)
DBSetProp('DATOSGEN.descripda', 'Field', 'UpdateName', 'detagru.descripda')
DBSetProp('DATOSGEN.descripda', 'Field', 'DataType', "C(40)")
* Props for the DATOSGEN.valorda field.
DBSetProp('DATOSGEN.valorda', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.valorda', 'Field', 'Updatable', .T.)
DBSetProp('DATOSGEN.valorda', 'Field', 'UpdateName', 'detagru.valorda')
DBSetProp('DATOSGEN.valorda', 'Field', 'DataType', "C(15)")
* Props for the DATOSGEN.idemp field.
DBSetProp('DATOSGEN.idemp', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.idemp', 'Field', 'Updatable', .T.)
DBSetProp('DATOSGEN.idemp', 'Field', 'UpdateName', 'detagru.idemp')
DBSetProp('DATOSGEN.idemp', 'Field', 'DataType', "I")
* Props for the DATOSGEN.tipo field.
DBSetProp('DATOSGEN.tipo', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.tipo', 'Field', 'Updatable', .F.)
DBSetProp('DATOSGEN.tipo', 'Field', 'UpdateName', 'grudat.tipo')
DBSetProp('DATOSGEN.tipo', 'Field', 'DataType', "C(1)")
* Props for the DATOSGEN.gtag field.
DBSetProp('DATOSGEN.gtag', 'Field', 'KeyField', .F.)
DBSetProp('DATOSGEN.gtag', 'Field', 'Updatable', .F.)
DBSetProp('DATOSGEN.gtag', 'Field', 'UpdateName', 'grudat.gtag')
DBSetProp('DATOSGEN.gtag', 'Field', 'DataType', "C(4)")
ENDFUNC
 
FUNCTION MakeView_VDOCUMENTS
***************** Ver la configuración para VDOCUMENTS ***************

CREATE SQL VIEW "VDOCUMENTS" ; 
   REMOTE CONNECT "CONBDD" ; 
   AS SELECT * FROM vdocuments Vdocuments WHERE Vdocuments.codemp = ?ide   AND Vdocuments.pdocode = ?iprd ORDER BY Vdocuments.code, Vdocuments.artname

DBSetProp('VDOCUMENTS', 'View', 'UpdateType', 1)
DBSetProp('VDOCUMENTS', 'View', 'WhereType', 3)
DBSetProp('VDOCUMENTS', 'View', 'FetchMemo', .T.)
DBSetProp('VDOCUMENTS', 'View', 'SendUpdates', .F.)
DBSetProp('VDOCUMENTS', 'View', 'UseMemoSize', 255)
DBSetProp('VDOCUMENTS', 'View', 'FetchSize', 100)
DBSetProp('VDOCUMENTS', 'View', 'MaxRecords', -1)
DBSetProp('VDOCUMENTS', 'View', 'Tables', 'vdocuments')
DBSetProp('VDOCUMENTS', 'View', 'Prepared', .F.)
DBSetProp('VDOCUMENTS', 'View', 'CompareMemo', .T.)
DBSetProp('VDOCUMENTS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VDOCUMENTS', 'View', 'FetchSize', 100)
DBSetProp('VDOCUMENTS', 'View', 'Comment', "")
DBSetProp('VDOCUMENTS', 'View', 'BatchUpdateCount', 1)
DBSetProp('VDOCUMENTS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VDOCUMENTS
* Props for the VDOCUMENTS.idugra field.
DBSetProp('VDOCUMENTS.idugra', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.idugra', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.idugra', 'Field', 'UpdateName', 'vdocuments.idugra')
DBSetProp('VDOCUMENTS.idugra', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.fecgra field.
DBSetProp('VDOCUMENTS.fecgra', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.fecgra', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.fecgra', 'Field', 'UpdateName', 'vdocuments.fecgra')
DBSetProp('VDOCUMENTS.fecgra', 'Field', 'DataType', "T")
* Props for the VDOCUMENTS.code field.
DBSetProp('VDOCUMENTS.code', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.code', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.code', 'Field', 'UpdateName', 'vdocuments.code')
DBSetProp('VDOCUMENTS.code', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.succode field.
DBSetProp('VDOCUMENTS.succode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.succode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.succode', 'Field', 'UpdateName', 'vdocuments.succode')
DBSetProp('VDOCUMENTS.succode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.depcode field.
DBSetProp('VDOCUMENTS.depcode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.depcode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.depcode', 'Field', 'UpdateName', 'vdocuments.depcode')
DBSetProp('VDOCUMENTS.depcode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.usercaja field.
DBSetProp('VDOCUMENTS.usercaja', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.usercaja', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.usercaja', 'Field', 'UpdateName', 'vdocuments.usercaja')
DBSetProp('VDOCUMENTS.usercaja', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.doccode field.
DBSetProp('VDOCUMENTS.doccode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.doccode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.doccode', 'Field', 'UpdateName', 'vdocuments.doccode')
DBSetProp('VDOCUMENTS.doccode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.tipo field.
DBSetProp('VDOCUMENTS.tipo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.tipo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.tipo', 'Field', 'UpdateName', 'vdocuments.tipo')
DBSetProp('VDOCUMENTS.tipo', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.subtipo field.
DBSetProp('VDOCUMENTS.subtipo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.subtipo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.subtipo', 'Field', 'UpdateName', 'vdocuments.subtipo')
DBSetProp('VDOCUMENTS.subtipo', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.num field.
DBSetProp('VDOCUMENTS.num', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.num', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.num', 'Field', 'UpdateName', 'vdocuments.num')
DBSetProp('VDOCUMENTS.num', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.fecha field.
DBSetProp('VDOCUMENTS.fecha', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.fecha', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.fecha', 'Field', 'UpdateName', 'vdocuments.fecha')
DBSetProp('VDOCUMENTS.fecha', 'Field', 'DataType', "D")
* Props for the VDOCUMENTS.pdocode field.
DBSetProp('VDOCUMENTS.pdocode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.pdocode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.pdocode', 'Field', 'UpdateName', 'vdocuments.pdocode')
DBSetProp('VDOCUMENTS.pdocode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.hacienda field.
DBSetProp('VDOCUMENTS.hacienda', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.hacienda', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.hacienda', 'Field', 'UpdateName', 'vdocuments.hacienda')
DBSetProp('VDOCUMENTS.hacienda', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.barcode field.
DBSetProp('VDOCUMENTS.barcode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.barcode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.barcode', 'Field', 'UpdateName', 'vdocuments.barcode')
DBSetProp('VDOCUMENTS.barcode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.grupo field.
DBSetProp('VDOCUMENTS.grupo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.grupo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.grupo', 'Field', 'UpdateName', 'vdocuments.grupo')
DBSetProp('VDOCUMENTS.grupo', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.marca field.
DBSetProp('VDOCUMENTS.marca', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.marca', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.marca', 'Field', 'UpdateName', 'vdocuments.marca')
DBSetProp('VDOCUMENTS.marca', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.embcode field.
DBSetProp('VDOCUMENTS.embcode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.embcode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.embcode', 'Field', 'UpdateName', 'vdocuments.embcode')
DBSetProp('VDOCUMENTS.embcode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.ffrom field.
DBSetProp('VDOCUMENTS.ffrom', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.ffrom', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.ffrom', 'Field', 'UpdateName', 'vdocuments.ffrom')
DBSetProp('VDOCUMENTS.ffrom', 'Field', 'DataType', "D")
* Props for the VDOCUMENTS.fto field.
DBSetProp('VDOCUMENTS.fto', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.fto', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.fto', 'Field', 'UpdateName', 'vdocuments.fto')
DBSetProp('VDOCUMENTS.fto', 'Field', 'DataType', "D")
* Props for the VDOCUMENTS.seller field.
DBSetProp('VDOCUMENTS.seller', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.seller', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.seller', 'Field', 'UpdateName', 'vdocuments.seller')
DBSetProp('VDOCUMENTS.seller', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.casher field.
DBSetProp('VDOCUMENTS.casher', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.casher', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.casher', 'Field', 'UpdateName', 'vdocuments.casher')
DBSetProp('VDOCUMENTS.casher', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.linkdoc field.
DBSetProp('VDOCUMENTS.linkdoc', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.linkdoc', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.linkdoc', 'Field', 'UpdateName', 'vdocuments.linkdoc')
DBSetProp('VDOCUMENTS.linkdoc', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.cliente field.
DBSetProp('VDOCUMENTS.cliente', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.cliente', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.cliente', 'Field', 'UpdateName', 'vdocuments.cliente')
DBSetProp('VDOCUMENTS.cliente', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.auxcode field.
DBSetProp('VDOCUMENTS.auxcode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.auxcode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.auxcode', 'Field', 'UpdateName', 'vdocuments.auxcode')
DBSetProp('VDOCUMENTS.auxcode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.auxitem field.
DBSetProp('VDOCUMENTS.auxitem', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.auxitem', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.auxitem', 'Field', 'UpdateName', 'vdocuments.auxitem')
DBSetProp('VDOCUMENTS.auxitem', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.duracion field.
DBSetProp('VDOCUMENTS.duracion', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.duracion', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.duracion', 'Field', 'UpdateName', 'vdocuments.duracion')
DBSetProp('VDOCUMENTS.duracion', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.taza field.
DBSetProp('VDOCUMENTS.taza', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.taza', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.taza', 'Field', 'UpdateName', 'vdocuments.taza')
DBSetProp('VDOCUMENTS.taza', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.valcuota field.
DBSetProp('VDOCUMENTS.valcuota', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.valcuota', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.valcuota', 'Field', 'UpdateName', 'vdocuments.valcuota')
DBSetProp('VDOCUMENTS.valcuota', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.numcuota field.
DBSetProp('VDOCUMENTS.numcuota', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.numcuota', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.numcuota', 'Field', 'UpdateName', 'vdocuments.numcuota')
DBSetProp('VDOCUMENTS.numcuota', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.poriva field.
DBSetProp('VDOCUMENTS.poriva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.poriva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.poriva', 'Field', 'UpdateName', 'vdocuments.poriva')
DBSetProp('VDOCUMENTS.poriva', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.descuconiva field.
DBSetProp('VDOCUMENTS.descuconiva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.descuconiva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.descuconiva', 'Field', 'UpdateName', 'vdocuments.descuconiva')
DBSetProp('VDOCUMENTS.descuconiva', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.descusiniva field.
DBSetProp('VDOCUMENTS.descusiniva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.descusiniva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.descusiniva', 'Field', 'UpdateName', 'vdocuments.descusiniva')
DBSetProp('VDOCUMENTS.descusiniva', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.recargo field.
DBSetProp('VDOCUMENTS.recargo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.recargo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.recargo', 'Field', 'UpdateName', 'vdocuments.recargo')
DBSetProp('VDOCUMENTS.recargo', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.flete field.
DBSetProp('VDOCUMENTS.flete', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.flete', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.flete', 'Field', 'UpdateName', 'vdocuments.flete')
DBSetProp('VDOCUMENTS.flete', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.subconiva field.
DBSetProp('VDOCUMENTS.subconiva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.subconiva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.subconiva', 'Field', 'UpdateName', 'vdocuments.subconiva')
DBSetProp('VDOCUMENTS.subconiva', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.subsiniva field.
DBSetProp('VDOCUMENTS.subsiniva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.subsiniva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.subsiniva', 'Field', 'UpdateName', 'vdocuments.subsiniva')
DBSetProp('VDOCUMENTS.subsiniva', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.montoivaart field.
DBSetProp('VDOCUMENTS.montoivaart', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.montoivaart', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.montoivaart', 'Field', 'UpdateName', 'vdocuments.montoivaart')
DBSetProp('VDOCUMENTS.montoivaart', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.montoivaser field.
DBSetProp('VDOCUMENTS.montoivaser', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.montoivaser', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.montoivaser', 'Field', 'UpdateName', 'vdocuments.montoivaser')
DBSetProp('VDOCUMENTS.montoivaser', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.subtotal field.
DBSetProp('VDOCUMENTS.subtotal', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.subtotal', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.subtotal', 'Field', 'UpdateName', 'vdocuments.subtotal')
DBSetProp('VDOCUMENTS.subtotal', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.ivavalor field.
DBSetProp('VDOCUMENTS.ivavalor', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.ivavalor', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.ivavalor', 'Field', 'UpdateName', 'vdocuments.ivavalor')
DBSetProp('VDOCUMENTS.ivavalor', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.icevalor field.
DBSetProp('VDOCUMENTS.icevalor', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.icevalor', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.icevalor', 'Field', 'UpdateName', 'vdocuments.icevalor')
DBSetProp('VDOCUMENTS.icevalor', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.ipsvalor field.
DBSetProp('VDOCUMENTS.ipsvalor', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.ipsvalor', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.ipsvalor', 'Field', 'UpdateName', 'vdocuments.ipsvalor')
DBSetProp('VDOCUMENTS.ipsvalor', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.montototal field.
DBSetProp('VDOCUMENTS.montototal', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.montototal', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.montototal', 'Field', 'UpdateName', 'vdocuments.montototal')
DBSetProp('VDOCUMENTS.montototal', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.montopagado field.
DBSetProp('VDOCUMENTS.montopagado', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.montopagado', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.montopagado', 'Field', 'UpdateName', 'vdocuments.montopagado')
DBSetProp('VDOCUMENTS.montopagado', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.saldo field.
DBSetProp('VDOCUMENTS.saldo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.saldo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.saldo', 'Field', 'UpdateName', 'vdocuments.saldo')
DBSetProp('VDOCUMENTS.saldo', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.tmpsaldo field.
DBSetProp('VDOCUMENTS.tmpsaldo', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.tmpsaldo', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.tmpsaldo', 'Field', 'UpdateName', 'vdocuments.tmpsaldo')
DBSetProp('VDOCUMENTS.tmpsaldo', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.isguia field.
DBSetProp('VDOCUMENTS.isguia', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isguia', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isguia', 'Field', 'UpdateName', 'vdocuments.isguia')
DBSetProp('VDOCUMENTS.isguia', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.isupdate field.
DBSetProp('VDOCUMENTS.isupdate', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isupdate', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isupdate', 'Field', 'UpdateName', 'vdocuments.isupdate')
DBSetProp('VDOCUMENTS.isupdate', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.isprint field.
DBSetProp('VDOCUMENTS.isprint', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isprint', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isprint', 'Field', 'UpdateName', 'vdocuments.isprint')
DBSetProp('VDOCUMENTS.isprint', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.isaccount field.
DBSetProp('VDOCUMENTS.isaccount', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isaccount', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isaccount', 'Field', 'UpdateName', 'vdocuments.isaccount')
DBSetProp('VDOCUMENTS.isaccount', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.isbodega field.
DBSetProp('VDOCUMENTS.isbodega', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isbodega', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isbodega', 'Field', 'UpdateName', 'vdocuments.isbodega')
DBSetProp('VDOCUMENTS.isbodega', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.ispagado field.
DBSetProp('VDOCUMENTS.ispagado', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.ispagado', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.ispagado', 'Field', 'UpdateName', 'vdocuments.ispagado')
DBSetProp('VDOCUMENTS.ispagado', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.isautorizado field.
DBSetProp('VDOCUMENTS.isautorizado', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isautorizado', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isautorizado', 'Field', 'UpdateName', 'vdocuments.isautorizado')
DBSetProp('VDOCUMENTS.isautorizado', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.sname field.
DBSetProp('VDOCUMENTS.sname', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.sname', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.sname', 'Field', 'UpdateName', 'vdocuments.sname')
DBSetProp('VDOCUMENTS.sname', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.ssri field.
DBSetProp('VDOCUMENTS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.ssri', 'Field', 'UpdateName', 'vdocuments.ssri')
DBSetProp('VDOCUMENTS.ssri', 'Field', 'DataType', "C(60)")
* Props for the VDOCUMENTS.punitario field.
DBSetProp('VDOCUMENTS.punitario', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.punitario', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.punitario', 'Field', 'UpdateName', 'vdocuments.punitario')
DBSetProp('VDOCUMENTS.punitario', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.qty field.
DBSetProp('VDOCUMENTS.qty', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.qty', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.qty', 'Field', 'UpdateName', 'vdocuments.qty')
DBSetProp('VDOCUMENTS.qty', 'Field', 'DataType', "B(8,2)")
* Props for the VDOCUMENTS.isiva field.
DBSetProp('VDOCUMENTS.isiva', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.isiva', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.isiva', 'Field', 'UpdateName', 'vdocuments.isiva')
DBSetProp('VDOCUMENTS.isiva', 'Field', 'DataType', "C(1)")
* Props for the VDOCUMENTS.nombreu field.
DBSetProp('VDOCUMENTS.nombreu', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.nombreu', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.nombreu', 'Field', 'UpdateName', 'vdocuments.nombreu')
DBSetProp('VDOCUMENTS.nombreu', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.artname field.
DBSetProp('VDOCUMENTS.artname', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.artname', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.artname', 'Field', 'UpdateName', 'vdocuments.artname')
DBSetProp('VDOCUMENTS.artname', 'Field', 'DataType', "C(50)")
* Props for the VDOCUMENTS.artcode field.
DBSetProp('VDOCUMENTS.artcode', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.artcode', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.artcode', 'Field', 'UpdateName', 'vdocuments.artcode')
DBSetProp('VDOCUMENTS.artcode', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.marcaa field.
DBSetProp('VDOCUMENTS.marcaa', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.marcaa', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.marcaa', 'Field', 'UpdateName', 'vdocuments.marcaa')
DBSetProp('VDOCUMENTS.marcaa', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.grupoa field.
DBSetProp('VDOCUMENTS.grupoa', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.grupoa', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.grupoa', 'Field', 'UpdateName', 'vdocuments.grupoa')
DBSetProp('VDOCUMENTS.grupoa', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.unidad field.
DBSetProp('VDOCUMENTS.unidad', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.unidad', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.unidad', 'Field', 'UpdateName', 'vdocuments.unidad')
DBSetProp('VDOCUMENTS.unidad', 'Field', 'DataType', "C(40)")
* Props for the VDOCUMENTS.codemp field.
DBSetProp('VDOCUMENTS.codemp', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.codemp', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.codemp', 'Field', 'UpdateName', 'vdocuments.codemp')
DBSetProp('VDOCUMENTS.codemp', 'Field', 'DataType', "I")
* Props for the VDOCUMENTS.moneda field.
DBSetProp('VDOCUMENTS.moneda', 'Field', 'KeyField', .F.)
DBSetProp('VDOCUMENTS.moneda', 'Field', 'Updatable', .T.)
DBSetProp('VDOCUMENTS.moneda', 'Field', 'UpdateName', 'vdocuments.moneda')
DBSetProp('VDOCUMENTS.moneda', 'Field', 'DataType', "C(40)")
ENDFUNC
 

FUNCTION DisplayStatus(lcMessage)
WAIT WINDOW NOWAIT lcMessage
ENDFUNC
