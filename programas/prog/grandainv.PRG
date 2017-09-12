IF !dg('TIAR')
	return
endif

IF !dg('MAIT')
	return
endif

IF !USED('arbodb')
	USE arbodb IN 0 SHARED
ENDIF

sele arbodb
replace all descripcio with strtran(descripcio,"'",'')
	
unid=38


sele arbodb
GO TOP
SCAN
	sele tipart
	go top
	locate for alltrim(valorda)=alltrim(arbodb.linea)
	if found()
		ntip=tipart.iddato
	endif

	sele marcasit
	go top
	locate for alltrim(valorda)=alltrim(arbodb.grupo)
	if found()
		marc=marcasit.iddato
	endif	
	

	sele arbodb
	
	x=0
	
	q1="begin;"

	if sqli(q1)
		q1="insert into items (artgrupo, artmarca, issell, isbuy, isreturn, itipo, iname, iunidad, iunidad2, "+;
							" isiva, itag, icode, stockmin, stockmax, imoney, artpeso, isdesc) values "+;
							pal(ntip)+al(marc)+al(.t.)+al(.t.)+al(.f.)+al(1)+al(descripcio)+al(unid)+al(unid)+;
							al(.t.)+al(codigo)+al(codigo)+al(0)+al(0)+al(2)+;
							al(0)+ual(.t.)
		=sqli(q1)
		

	endif
	
	if !fintransq()
		wait 'error al registrar '+alltrim(arbodb.descripcio) wind nowai 
	else
		wait 'registrado '+alltrim(arbodb.descripcio) wind nowai 
	endif
		
	sele arbodb
ENDSCAN
q1="update detagru set valorda='PT' where idgrupo="+alup(44)
sqli(q1)
