= dg('SECT')
sele cxcrut_cod, cxcrut_des from rutas into cursor rutas2

SELE sectores
GO TOP
do while !eof()
	sele rutas2
	go top
	locate for alltrim(RUTAS2.cxcrut_cod)=alltrim(sectores.descripda)
	if found ()
		q1="update detagru set valorda=descripda, descripda="+alup(rutas2.cxcrut_des)+;
			"where iddato="+alup(sectores.iddato)
		=sqli(q1)
	endif
	sele sectores
	skip
enddo