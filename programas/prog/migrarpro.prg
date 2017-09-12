on error
if !dg('CIUD') then
	wait 'Error en ciudades' wind nowait
	return
endif

if !dg('PROV') then
	wait 'Error en ciudades' wind nowait
	return
endif

sele t_proveedor
go top
do while !eof()
	cod=int(val(substr(codigo,1,5)))+2000
	ced=iif(len(alltrim(ced_ruc))=10,ced_ruc,'')
	ruc=iif(len(alltrim(ced_ruc))=13,ced_ruc,'')
	dir=direccion
	sele ciudades
	go top
	locate for descripda=t_proveedor.ciudad
	if found() then
		ciu=iddato
	else
		ciu=75	&& machala
	endif

	sele provincias
	go top
	locate for descripda=t_proveedor.provincia
	if found() then
		pro=iddato
	else
		pro=19  && el oro
	endif
	
	sele t_proveedor
	q1="insert into sujetos (scode, scedula, sruc, sname, ssri, saddr, stelf, smoney, "+;
			"sciudad, sprov, isempleado, isproveedor, isproductor, iscliente, issocio) values "+; 
			pal(cod)+al(ced)+al(ruc)+al(nombre)+al(iif(!empty(ruc),nombre,''))+al(dir)+;
			al(telefono)+al(2)+al(ciu)+al(pro)+al(.f.)+;
			al(.t.)+al(.f.)+al(.t.)+ual(.f.)

	if !sqli(q1) then
		sele t_proveedor
		wait pal(cod)+al(ced)+al(ruc)+al(nombre)+al(iif(!empty(ruc),nombre,''))+al(dir)+;
			al(telefono)+al(2)+al(ciu)+al(pro)+al(.f.)+;
			al(.f.)+al(.f.)+al(.t.)+ual(.f.) wind
	endif
	
	skip
enddo
wait 'Proceso concluido' wind nowait