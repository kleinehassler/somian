*!*	select int(val(a)) as codigo, b as iname, c as itag, int(val(d)) as total ;
*!*	from inv2010_b_t where a<>'codigo' into table inv2010_brame

*!*	select a as itag, space(100) as tipo, c as iname, '' as marca,  'LITRO' as presenta, ;
*!*		round(val(G) ,2) as pormayor, round(val(F) ,2) as pormenor ;
*!*		from inventario   WHERE VAL(D)>0 into table inv2011

if used('items2')
	sele items2
else
	sele 0
	use items2
endif

sele * from items2 into cursor invini

*select * from items2 where substr(alltrim(itag),1,7)<>'Categor' into cursor invini

select distinct linea as tipo from invini into cursor grupos
select distinct marca from invini into cursor marcas
select distinct '' from invini where .f. into cursor unidades

x=0

=sqli("begin;")

q1="delete from preciosv "
=sqli(q1)

q1="delete from saldosib "
=sqli(q1)

q1="delete from saldosi "
=sqli(q1)

q1="delete from items where itipo=1"
=sqli(q1)

&& tipos de items
q1="delete from detagru where iddato<>2912 and idgrupo=44"
=sqli(q1)

&& marcas de items
q1="delete from detagru where iddato<>4836 and idgrupo=43"
=sqli(q1)

&& unidades
q1="delete from detagru where iddato<>38 and idgrupo=9"
=sqli(q1)

q1="ALTER SEQUENCE auxiliarescon_seq RESTART WITH 12001"
=sqli(q1)

q1="ALTER SEQUENCE detagru_iddato_seq RESTART WITH 6600"
=sqli(q1)


if !fintransq()
	wait 'error' wind nowait
	return
endif

wait 'importanto Tipos' wind at 2,2 nowait

sele grupos
GO TOP
do while !eof()
	if !empty(tipo)
		q1="insert into detagru (valorda, descripda, idgrupo) values "+;
				pal('PT')+al(TIPO)+ual(44)
					
		=sqli(q1)
	endif	
	sele grupos
	skip
enddo

wait 'importanto Marcas' wind at 2,2 nowait

sele marcas
go top
do while !eof()
	if !empty(marca)
		q1="insert into detagru (descripda, idgrupo) values "+;
				pal(marca)+ual(43)
		=sqli(q1)
	endif
	sele marcas
	skip
enddo

wait 'importanto Unidades' wind at 2,2 nowait

sele unidades
go top
do while !eof()
	if !empty(presenta)
		q1="insert into detagru (descripda, idgrupo) values "+;
				pal(presenta)+ual(9)
		=sqli(q1)
	endif
	sele unidades
	skip
enddo


IF !dg('MAIT')
	RETURN
ENDIF

IF !dg('TIAR')
	RETURN
ENDIF

IF !dg('MEDI')
	RETURN
ENDIF

icde=0
sele invini
go top
do while !eof() 
	
	wait 'importanto '+alltrim(iname) wind at 2,2 nowait
	
	ICODE=0
	q1="select max(icode)+1::int2 as maxcod from items ;"
	if sqli(q1,'numcod') then
		sele numcod
		icode=iif(isnull(maxcod),1,maxcod)
	endif
	
	idi=0
	q1="select 	nextsecu('auxiliarescon_seq'::text, 'ITEMS'::text) as idi"
	if	sqli(q1,'nit')
		sele nit
		if reccount('nit')>0
			idi=nit.idi
		endif
	endif

	ntip=2912
	sele TIPART
	go top
	locate for alltrim(DESCRIPDA)=alltrim(invini.linea)
	if found()
		ntip=tipart.iddato
	endif

	marc=4836
	sele marcasit
	go top
	locate for alltrim(descripda)=alltrim(invini.marca)
	if found()
		marc=marcasit.iddato
	endif	
	
	uni=38
*!*		sele unidades
*!*		go top
*!*		locate for alltrim(descripda)=alltrim(invini.presenta)
*!*		if found()
*!*			uni=unidades.iddato
*!*		endif	
	
	sele invini
	q1="insert into items (artgrupo, artmarca, issell, isbuy, isreturn, itipo, iname, iunidad, iunidad2, "+;
			" isiva, itag, icode, stockmin, stockmax, imoney, artpeso, costopro, artcosto, isdesc, "+;
			" iditem) values "+;
			pal(ntip)+al(marc)+al(.t.)+al(.t.)+al(.f.)+al(1)+al(iname)+al(38)+al(uni)+;
			al(.t.)+al(itag)+al(ICODE)+al(0)+al(0)+al(2)+;
			al(0)+al(0)+al(0)+al(.t.)+  Ual(idi)
	
	if !sqli(q1)
		=messagebox('error en articulo: '+alltrim(invini.iname),0,empresa)
	endif
	
	sele invini
	
*!*		if Pormenor>0 
*!*			q1="insert into preciosv (iditem, iddato, preciov) values "+;
*!*					pal(idi)+al(1190)+ual(pormenor)
*!*			=sqli(q1)
*!*		endif

*!*		sele invini
*!*		
*!*		if pormayor>0
*!*			q1="insert into preciosv (iditem, iddato, preciov) values "+;
*!*					pal(idi)+al(3254)+ual(pormayor)
*!*			=sqli(q1)
*!*		endif
*!*		
*!*		q1="select nextval('saldosi_idsaldosi_seq'::text)::int4 as secu ;"
*!*		if sqli(q1,'secuen')
*!*			idsi=secuen.secu
*!*		endif
	
*!*		sele invini 
*!*		
*!*		q1="insert into saldosi ( idsaldosi,  pdocode,  iditem, inicial, precio, cospro, fecsaldo) "+;
*!*			"values "+pal(idsi)+al(iprd)+al(idi)+al(BODEGA24+ALMACEN)+;
*!*			al(costopro)+al(costopro)+ual(date(2011,1,1))
*!*			
*!*		=sqli(q1)
*!*			
*!*		q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
*!*						pal(idsi)+ al(2651) + al(0) + ual(ALMACEN)
*!*		=sqli(q1)

*!*		q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
*!*						pal(idsi)+ al(6619) + al(0) + ual(BODEGA24)
*!*		=sqli(q1)

	sele invini
	skip
enddo

