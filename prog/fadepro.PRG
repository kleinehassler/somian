if !dg('CIUD')
	WAIT 'ERROR EN CIUDADES' WIND NOWAIT
	RETURN
ENDIF

IF !USED('ini070')
	USE ini070.dbf IN 0 SHARED
ENDIF

q1="delete from sujetos where isproveedor and scode<>1 and idsujeto not in (select idsujeto from usuarios) and "+;
		" idsujeto not in (select idsujeto from empleados);"
if !sqli(q1)
	return
endif

SELE ini070
replace all telefono1 with strtran(telefono1,'-','')
replace all telefono1 with strtran(telefono1,' ','')

replace all telefono2 with strtran(telefono2,'-','')
replace all telefono2 with strtran(telefono2,' ','')

replace all telefono3 with strtran(telefono3,'-','')
replace all telefono3 with strtran(telefono3,' ','')

GO TOP
SCAN
	ncodigo=0
	q1="select max(scode)::int4 as coda from sujetos "
	if sqli(q1,'coda')
		sele coda
		ncodigo=iif(isnull(coda.coda),1,coda.coda+1)
	endif
	
	cate=3254
	
	ciud=0
	
	sele ciudades
	go top
	locate for alltrim(descripda)=alltrim(upper(ini070.ciudad))
	if found()
		ciud=ciudades.iddato
	else
		ciud=75
	endif
		
	sele INI070
	q1="insert into sujetos ( scode, isempleado, isproveedor, isproductor, iscliente, issocio, sname, ssri, "+;
				" saddr, stelf, sfax, scel, smoney, sprov, sciudad, smail, numord, tipcli, sruc) values "+;
				pal(ncodigo) +al(.f.) +al(.t.) +al(.f.) +al(.t.) +al(.f.) +;
				al(alltrim(nombre)) + al(empresa) + al(direccion) +al(telefono1)+ ;
				al(telefono2) +al(telefono3) +al(2) +al(19) +al(ciud) +al(email) +al(1) +al(cate)+ ual(ruc)
	if sqli(q1)
		wait 'Registrado...' wind nowait
	endif
	sele INI070
ENDSCAN

wait 'Proceso concluido...' wind nowait