IF !USED('resul4')
	USE resul4.dbf 
ENDIF

SELE resul4
GO TOP

x=0
=sqli("begin;")

SCAN
	codigo=0
	q1="select max(icode)::int4 as coda from items where itipo=1"
	if sqli(q1,'coda')
		sele coda
		codigo=iif(isnull(coda.coda),1,coda.coda+1)
	endif
	
	color=2703
	
	sele resul4
	
	REPLACE ICODE WITH CODIGO
	
	DO CASE 
	CASE undart='JGO'
		unidad=653
	CASE undart='UNI' OR UNDART='UND'
		unidad=38
	CASE undart='MTS'
		UNIDAD=40
	OTHER
		UNIDAD=38
	ENDCASE
	
	if artgrupo>0 and artmarca>0
		q1="insert into items (artgrupo, artmarca, issell, isbuy, isreturn, itipo, iname, iunidad, "+;
							" isiva, itag, icode, stockmin, stockmax, imoney) values "+;
							pal(ARTGRUPO)+al(ARTMARCA)+al(.t.)+al(.t.)+al(.f.)+al(1)+al(nomart)+al(unidad)+;
							al(iif(ivaart='S',.t.,.f.))+al(refart)+al(codigo)+al(0)+al(0)+ual(2)					
		if !sqli(q1)
			wait 'No se guardo' wind nowait
		endif
	endif
	
	sele resul4
ENDSCAN

do fintrans