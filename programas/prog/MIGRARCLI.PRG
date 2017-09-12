on error
if !dg('CIUD') then
	wait 'Error en ciudades' wind nowait
	return
endif

if !dg('PROV') then
	wait 'Error en ciudades' wind nowait
	return
endif

sele t_cliente
go top
do while !eof()
	cod=int(val(substr(codigo,4,7)))
	ced=iif(len(alltrim(ced_ruc))=10,ced_ruc,'')
	ruc=iif(len(alltrim(ced_ruc))=13,ced_ruc,'')
	dir=direccion
	odir=dir_tra
	sele ciudades
	go top
	locate for descripda=t_cliente.ciudad
	if found() then
		ciu=iddato
	else
		ciu=75	&& machala
	endif

	sele provincias
	go top
	locate for descripda=t_cliente.provincia
	if found() then
		pro=iddato
	else
		pro=19  && el oro
	endif
	
	sele t_cliente
	q1="insert into sujetos (scode, scedula, sruc, sname, ssri, saddr, saddr2, stelf, smoney, "+;
			"sciudad, sprov, isempleado, isproveedor, isproductor, iscliente, issocio) values "+; 
			pal(cod)+al(ced)+al(ruc)+al(nombres)+al(iif(!empty(ruc),nombres,''))+al(dir)+;
			al(odir)+al(telefono)+al(2)+al(ciu)+al(pro)+al(.f.)+;
			al(.f.)+al(.f.)+al(.t.)+ual(.f.)

	if !sqli(q1) then
		sele t_cliente
		wait pal(cod)+al(ced)+al(ruc)+al(nombres)+al(iif(!empty(ruc),nombres,''))+al(dir)+;
			al(odir)+al(telefono)+al(2)+al(ciu)+al(pro)+al(.f.)+;
			al(.f.)+al(.f.)+al(.t.)+ual(.f.) wind
	endif
	
	skip
enddo
wait 'Proceso concluido' wind nowait