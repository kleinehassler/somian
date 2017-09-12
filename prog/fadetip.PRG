IF !USED('INVCOD08')
	USE c:\fadese\fade\ca082003\invcod08.dbf IN 0 SHARED
ENDIF

IF !USED('INVLIN08')
	USE c:\fadese\fade\ca082003\invlin08.dbf IN 0 SHARED
ENDIF
select * from invlin08 where codlin in (select distinc linart from invcod08 ) into cursor tipoa

SELE tipoa
GO TOP
scan
	q1="insert into detagru (idgrupo, descripda, valorda) values "+pal(44)+al(nomlin)+ual(codlin)
	=sqli(q1)
endscan
