local cantexi, item
*	Tabla de articulos
q1="select distinct iditem, icode, iname, itag "+;
	"from varticulos  "
	
if !sqli(q1,'articulos') then
	return
endif


select codigo, stock_actu, round(costod_act/iif(stock_actu=0,1,stock_actu),2) as costouni ;
from arbodb;
where stock_actu>0 ;
into cursor saldos1


x=0
if !sqli("begin;") then
	wait 'Problema de Comunicacion' wind nowait
	return
endif

*!*	q1="delete from saldosib where idsaldosi in "+;
*!*			"(select idsaldosi from saldosi ) ;"

*!*	=sqli(q1) 

*!*	q1="delete from saldosi ;"

*!*	=sqli(q1) 

sele articulos 
go top
do while !eof()
	item=articulos.icode
	n=0
	
	Select saldos1
	go top
	locate for val(codigo)=item
	If Found() then
		cantexi=saldos1.stock_actu

		q1="select idsaldosi, inicial "+;
			"from saldosi "+;
			"where iditem="+alup(articulos.iditem)

		if sqli(q1,'invreg')
			
			wait alltrim(str(articulos.icode))+' => '+alltrim(articulos.iname) wind nowait		
			if reccount('invreg')>0
				q1="update saldosi set inicial=inicial+"+alup(cantexi)
				=sqli(q1)
				
				select saldos1
				q1="insert into saldosib (idsaldosi, bodega, qtyini, qtypen) "+;
									"values "+pal(invreg.idsaldosi)+al(3925)+al(cantexi)+ual(0)
				=sqli(q1)
			else
				q1="select nextval('saldosi_idsaldosi_seq') as ncod "

				if sqli(q1,'seq')
					sele seq
					go top
					n=ncod
				endif
				
				sele articulos

				q1="insert into saldosi (idsaldosi, pdocode, iditem, inicial, precio, inipen) values "+;
					pal(n)+al(iprd)+al(articulos.iditem)+al(cantexi)+al(saldos1.costouni)+ual(0)
				=sqli(q1)

				select saldos1
				q1="insert into saldosib (idsaldosi, bodega, qtyini, qtypen) "+;
									"values "+pal(n)+al(3925)+al(cantexi)+ual(0)
				=sqli(q1)

			endif
		else
			x=1
		endif
	else
		cantexi=0
	endif	

	sele articulos
	skip
	
enddo	

************
do fintrans
************
