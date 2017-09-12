IF !USED('ini020')
	USE ini020 IN 0 SHARED
ENDIF
SELEC DISTINC codigo, nombre FROM INi020 WHERE !EMPTY(nombre) INTO CURSOR marcas

q1="delete from detagru where idgrupo="+alup(43)
if !sqli(q1)
	return
endif

SELE marcas
GO TOP
scan
	q1="insert into detagru (idgrupo, descripda, valorda) values "+pal(43)+al(upper(nombre))+ual(codigo)
	=sqli(q1)
endscan
wait 'Proceso concluido' wind nowait