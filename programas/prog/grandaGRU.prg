IF !USED('arindex')
	USE arindex IN 0 SHARED
ENDIF
SELEC DISTINC codigo, nombre FROM arindex WHERE data='L' INTO CURSOR grupos

q1="delete from detagru where idgrupo="+alup(44)
if !sqli(q1)
	return
endif

SELE grupos
GO TOP
scan
	q1="insert into detagru (idgrupo, descripda, valorda) values "+pal(44)+al(upper(nombre))+ual(codigo)
	=sqli(q1)
endscan
wait 'Proceso concluido' wind nowait