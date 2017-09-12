SELEC DISTINC ciudad FROM cliente_ae into cursor ciudades

q1="delete from detagru where idgrupo="+alup(23)+" and iddato not in (select idciudad from workstations) "+;
						+" and iddato not in (select sciudad from sujetos) "
if !sqli(q1)
	return
endif

SELE Ciudades
GO TOP
scan
	if UPPER(ciudad)<>'MACHALA'
		q1="insert into detagru (idgrupo, descripda, valorda) values "+pal(23)+al(upper(ciudad))+ual('')
		=sqli(q1)
	ENDIF
endscan
WAIT 'PROCEDO CONCLUIDO...' WIND NOWAIT