IF !USED('resul4')
	USE resul4.dbf IN 0 SHARED
ENDIF
x=0
=sqli('begin;')
SELE resul4
GO TOP
SCAN
	q1="select iditem from items where icode="+alup(icode)
	if sqli(q1,'item')
		sele item
		go top
		q1="insert into preciosv (iditem, iddato, preciov) values "+;
			pal(iditem)+al(1190)+ual(resul4.p01art)
		if sqli(q1)
			wait 'registrado.' wind AT 1,1 nowait
		endif
*!*			q1="insert into preciosv (iditem, iddato, preciov) values "+;
*!*				pal(iditem)+al(1194)+ual(resul3.p02art)
*!*			if sqli(q1)
*!*				wait 'registrado...' wind AT 1,1 nowait
*!*			endif
*!*			q1="insert into preciosv (iditem, iddato, preciov) values "+;
*!*				pal(iditem)+al(2887)+ual(resul3.p03art)
*!*			if sqli(q1)
*!*				wait 'registrado......' wind AT 1,1 nowait
*!*			endif
	endif
	
	sele resul4
ENDSCAN

do fintrans