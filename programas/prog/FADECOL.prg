IF !USED('INVCOD08')
	USE c:\fadese\fade\ca082003\invcod08.dbf IN 0 SHARED
ENDIF
SELEC DISTINC REFART FROM INVCOD08 WHERE !EMPTY(REFART) INTO CURSOR COLORES
SELE COLORES
GO TOP
scan
	q1="insert into detagru (idgrupo, descripda) values "+pal(6)+ual(refart)
	=sqli(q1)
endscan
