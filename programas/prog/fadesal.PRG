*	Tabla de articulos
q1="select distinct iditem, icode, iname, itag "+;
	"from varticulos  "
	
if !sqli(q1,'articulos') then
	return
endif


if !dg('BODE')
	return
endif

select producto, valorda as bodega, max(fecha) as fecha, iif(saldo<=0,00000001,saldo) as saldo ;
from ini050 i left join bodegas b on (i.bodega=b.valorda);
where costo_p>0 and val(valorda)>0 ;
order by producto ;
group by producto, bodega ;
into cursor saldos


select iditem, bodega, saldo ;
from articulos a left join saldos s on (a.itag=s.producto) ;
into cursor saldosi

select producto, max(fecha) as fecha, costo_p ;
from ini050 ;
where costo_p>0 ;
order by producto ;
group by producto ;
into cursor costos

select a.*, costo_p, sum(saldo) as saldo ;
from articulos a left join costos c on (a.itag=c.producto) ;
				 left join saldos s on (a.itag=s.producto) ;
where costo_p>0 and saldo>0;
group by a.iditem ;				 
into cursor articulos

x=0
if !sqli("begin;") then
	wait 'Problema de Comunicacion' wind nowait
	return
endif

q1="delete from saldosib where idsaldosi in "+;
		"(select idsaldosi from saldosi where pdocode="+alup(iprd)+") ;"

=sqli(q1) 

q1="delete from saldosi where pdocode="+alup(iprd)+";"

=sqli(q1) 

sele articulos 
go top
do while !eof()

	item=iditem
	n=0
	
	q1="select nextval('saldosi_idsaldosi_seq') as ncod "
	
	if sqli(q1,'seq')
		sele seq
		go top
		n=ncod
	endif
	
	sele articulos
	wait alltrim(str(icode))+' => '+alltrim(iname) wind nowait
		
	q1="insert into saldosi (idsaldosi, pdocode, iditem, inicial, precio,  "+;
			"inipen) values "+pal(n)+al(iprd)+al(iditem)+al(saldo)+;
			al(costo_p)+ual(0)
	=sqli(q1)

	sele saldosi
	set filter to
	set filter to iditem=item
	go top

	do while !eof()
		bod=0
		sele bodegas
		go top
		locate for val(valorda)=val(saldosi.bodega)
		if found()
			bod=iddato
		endif

		sele saldosi
		q1="insert into saldosib (idsaldosi, bodega, qtyini, qtypen) "+;
						"values "+pal(n)+al(bod)+al(saldo)+;
						ual(0)
		=sqli(q1)
	
		skip
	enddo
	
	sele articulos
	skip
enddo	

***********************************************************************
do fintrans
***********************************************************************
