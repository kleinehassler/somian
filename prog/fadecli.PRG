*!*	select b as stag, alltrim(d)+alltrim(c)+space(10) as nombre, e as fec_aper, ;
*!*	f as ruc, g as ciudad, n as direccion, o as direcc2, p as telef, q as telef2, ;
*!*	r as representa, u as observ ;
*!*	from cliente into table cliente_ae

=dg('CIUD')

if used('cliente_ae')
	sele cliente_ae
else
	sele 0
	use cliente_ae exclu
endif


q1="delete from accesos where idsujeto  in (select idsujeto from sujetos where scode>10);"
=sqli(q1)

q1="delete from accdoc where idsujeto  in (select idsujeto from sujetos where scode>10);"
=sqli(q1)

q1="delete from usuarios where idsujeto  in (select idsujeto from sujetos where scode>10);"
=sqli(q1)

q1="delete from sujetos where scode>10;"
=sqli(q1)

*!*	q1="delete from detagru where idgrupo=244 and iddato not in (select sciudad from sujetos) "
*!*	=sqli(q1)

SELE cliente_ae

replace all RUC with strtran(ruc,'-','')

replace all telef with strtran(telef,'-','')
replace all telef with strtran(telef,' ','')

replace all telef2 with strtran(telef2,'-','')
replace all telef2 with strtran(telef2,' ','')

replace all nombre    with strtran(NOMBRE,"'","")

GO TOP
SCAN
	ncodigo=0
	q1="select max(scode)::int4 as coda from sujetos "
	if sqli(q1,'coda')
		sele coda
		ncodigo=iif(isnull(coda.coda),1,coda.coda+1)
	endif
	
	cate=1190
	
	ciud=3892
	selec ciudades
	go top
	locate for descripda=cliente_ae.ciudad
	if found()
		ciud=ciudades.iddato
	endif
	
	rutcli=0

	sele cliente_ae
	
	r=iif(len(alltrim(ruc))=10,"scedula="+alup(ruc),;
	  iif(len(alltrim(ruc))=13,"sruc="+alup(ruc),;
	  		  alup(.t.)))

	q1="select scode from sujetos where  "+r+;
			" or sname like '%"+alltrim(upper(NOMBRE))+"%' or ssri like '%"+alltrim(upper(nombre))+"%'"
	if sqli(q1,'sujeto')
		if reccount('sujeto')=0
			sele cliente_ae
			
	*!*	select b as stag, alltrim(d)+alltrim(c)+space(10) as nombre, e as fec_aper, ;
*!*	f as ruc, g as ciudad, n as direccion, o as direcc2, p as telef, q as telef2, ;
*!*	r as representa, u as observ ;
*!*	from cliente into table cliente_ae		
			
			q1="insert into sujetos ( scode, stag, isempleado, isproveedor, isproductor, iscliente, issocio, sname, ssri, fec_aper, "+;
						" saddr, saddr2, stelf, sfax, smoney, sprov, sciudad, numord, tipcli, scedula, observ, srepre, "+;
						" sruc ) values "+;
						pal(ncodigo) +al(substr(stag,5,10)) + al(.f.) +al(.f.) +al(.f.) +al(.t.) +al(.f.) +;
						al(alltrim(nombre)) + al(nombre) + al(fec_aper) + al(direccion) + al(direcc2) + al(telef)+ ;
						al(telef2) + al(2) +al(19) +al(ciud) +al(1) +al(cate)+;
						al(iif(len(alltrim(ruc))=10,alltrim(ruc),''))+ al(observ)+ al(representa)+;
						ual(iif(len(alltrim(ruc))=13,alltrim(ruc),''))

			if sqli(q1)
				wait 'Registrado...' wind nowait
			endif
		endif
	else
		wait 'error' wind nowait
	endif
		
	sele cliente_ae
ENDSCAN

wait 'Proceso concluido...' wind nowait
