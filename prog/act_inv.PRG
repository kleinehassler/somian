*!*	select val(a) as codigo, b as nombre, e as marca, f as grupo, val(g) as iditem, val(h) as costo, ;
*!*			val(t) as stock, u as xlitro ;
*!*	from articulos_new ;
*!*	where a<>'codigo'

if used('art_new')
	sele art_new
else
	sele 0
	use art_new
endif

*select * from items2 where substr(alltrim(itag),1,7)<>'Categor' into cursor invini

select distinct grupo from art_new into cursor grupos
select distinct marca from art_new into cursor artmar

x=0

=sqli("begin;")

q1="delete from preciosv "
=sqli(q1)

q1="delete from saldosib "
=sqli(q1)

q1="delete from saldosi "
=sqli(q1)

*!*	q1="delete from items where itipo=1"
*!*	=sqli(q1)

&& tipos de items
*!*	q1="delete from detagru where iddato<>2912 and idgrupo=44"
*!*	=sqli(q1)

&& marcas de items
*!*	q1="delete from detagru where iddato<>4836 and idgrupo=43"
*!*	=sqli(q1)

&& unidades
*!*	q1="delete from detagru where iddato<>38 and idgrupo=9"
*!*	=sqli(q1)

*!*	q1="ALTER SEQUENCE auxiliarescon_seq RESTART WITH 12001"
*!*	=sqli(q1)

*!*	q1="ALTER SEQUENCE detagru_iddato_seq RESTART WITH 6600"
*!*	=sqli(q1)


if !fintransq()
	wait 'error' wind nowait
	return
endif

wait 'importanto Tipos' wind at 2,2 nowait

IF !dg('MAIT')
	RETURN
ENDIF

IF !dg('TIAR')
	RETURN
ENDIF

sele grupos
GO TOP
do while !eof()
	sele tipart
	go top
	locate for alltrim(descripda)=alltrim(grupos.grupo)
	if !found()
		sele grupos
		q1="insert into detagru (valorda, descripda, idgrupo) values "+;
				pal('PT')+al(grupo)+ual(44)
					
		=sqli(q1)
	endif	
	sele grupos
	skip
enddo

wait 'importanto Marcas' wind at 2,2 nowait

sele artmar
go top
do while !eof()
	sele marcasit
	go top
	locate for alltrim(descripda)=alltrim(artmar.marca)
	if !found()
		sele artmar
		q1="insert into detagru (descripda, idgrupo) values "+;
				pal(marca)+ual(43)
		=sqli(q1)
	endif
	sele artmar
	skip
enddo

wait 'importanto Unidades' wind at 2,2 nowait

IF !dg('MEDI')
	RETURN
ENDIF

IF !dg('MAIT')
	RETURN
ENDIF

IF !dg('TIAR')
	RETURN
ENDIF

icde=0
sele art_new
go top
do while !eof() 
	
	wait 'importanto '+alltrim(nombre) wind at 2,2 nowait
	
	if codigo=0 and !empty(nombre)
*!*			ICODE=0
*!*			q1="select max(icode)+1::int2 as maxcod from items ;"
*!*			if sqli(q1,'numcod') then
*!*				sele numcod
*!*				icode=iif(isnull(maxcod),1,maxcod)
*!*			endif
*!*			
*!*			idi=0
*!*			q1="select 	nextsecu('auxiliarescon_seq'::text, 'ITEMS'::text) as idi"
*!*			if	sqli(q1,'nit')
*!*				sele nit
*!*				if reccount('nit')>0
*!*					idi=nit.idi
*!*				endif
*!*			endif

*!*			ntip=2912
*!*			sele TIPART
*!*			go top
*!*			locate for alltrim(DESCRIPDA)=alltrim(art_new.grupo)
*!*			if found()
*!*				ntip=tipart.iddato
*!*			endif

*!*			marc=4836
*!*			sele marcasit
*!*			go top
*!*			locate for alltrim(descripda)=alltrim(art_new.marca)
*!*			if found()
*!*				marc=marcasit.iddato
*!*			endif	
*!*			
*!*			uni=38
*!*			
*!*			sele art_new
*!*			q1="insert into items (artgrupo, artmarca, itag, issell, isbuy, isreturn, itipo, iname, iunidad, iunidad2, "+;
*!*					" isiva, icode, stockmin, stockmax, imoney, artpeso, costopro, artcosto, isdesc, "+;
*!*					" iditem) values "+;
*!*					pal(ntip)+al(marc)+al('00000')+al(.t.)+al(.t.)+al(.f.)+al(1)+al(nombre)+al(38)+al(uni)+;
*!*					al(.t.)+al(ICODE)+al(0)+al(0)+al(2)+;
*!*					al(0)+al(costo)+al(costo)+al(.t.)+  Ual(idi)
*!*			
*!*			if !sqli(q1)
*!*				=messagebox('error en articulo: '+alltrim(art_new.nombre),0,empresa)
*!*			endif

*!*			idsi=0		
*!*			q1="select nextval('saldosi_idsaldosi_seq'::text)::int4 as secu ;"
*!*			if sqli(q1,'secuen')
*!*				idsi=secuen.secu
*!*			endif
*!*			
*!*			sele art_new 
*!*			
*!*			q1="insert into saldosi ( idsaldosi,  pdocode,  iditem, inicial, precio, cospro, fecsaldo) "+;
*!*				"values "+pal(idsi)+al(iprd)+al(idi)+al(stock)+;
*!*				al(costo)+al(costo)+ual(date(2011,1,1))
*!*				
*!*			=sqli(q1)
*!*				
*!*			q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
*!*							pal(idsi)+ al(2651) + al(0) + ual(stock)
*!*			=sqli(q1)

	else
	
		ntip=2912
		sele TIPART
		go top
		locate for alltrim(DESCRIPDA)=alltrim(art_new.grupo)
		if found()
			ntip=tipart.iddato
		endif

		marc=4836
		sele marcasit
		go top
		locate for alltrim(descripda)=alltrim(art_new.marca)
		if found()
			marc=marcasit.iddato
		endif	

		sele art_new
		q1="update items set artmarca="+alup(marc)+;
						",   artgrupo="+alup(ntip)+;
						",   artcosto="+alup(costo)+;
						",   costopro="+alup(costo)+;
						",   iname="+alup(nombre)+;
					" where iditem="+alup(int(iditem))
		
		if !sqli(q1)
			=messagebox('error en articulo: '+alltrim(art_new.nombre),0,empresa)
		endif

		idsi=0		
		q1="select nextval('saldosi_idsaldosi_seq'::text)::int4 as secu ;"
		if sqli(q1,'secuen')
			idsi=secuen.secu
		endif

		sele art_new

		q1="insert into saldosi ( idsaldosi,  pdocode,  iditem, inicial, precio, cospro, fecsaldo) "+;
			"values "+pal(idsi)+al(iprd)+al(int(iditem))+al(stock)+;
			al(costo)+al(costo)+ual(date(2011,1,1))
			
		=sqli(q1)
			
		sele art_new	
		q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
						pal(idsi)+ al(2651) + al(0) + ual(stock)
		=sqli(q1)
	
	endif
	sele art_new
	skip
enddo

