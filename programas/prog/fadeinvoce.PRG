select a as iname, val(b) as costo, val(c) as bulto, val(e) as oferta, val(g) as normal, ;
		val(I) as credito ;
from ocean ;
where substr(a,1,8)<>'PRODUCTO' ;
into table articulos2 

sele articulos2
go top

SELE  upper(iname) as iname, costo, bulto, oferta, normal, credito ;
from articulos2 ;
into table items2
	
sele items2
replace all iname with strtran(iname,"'",'')

delete for empty(iname)

x=0

=sqli("begin;")

q1="delete from preciosv "
=sqli(q1)

q1="delete from items where itipo=1"
=sqli(q1)

q1="delete from detagru where iddato<>2912 and idgrupo=44"
=sqli(q1)

q1="delete from detagru where iddato<>4836 and idgrupo=43"
=sqli(q1)

q1="delete from detagru where iddato<>38 and idgrupo=9"
=sqli(q1)

*!*	q1="ALTER SEQUENCE detagru_iddato_seq RESTART WITH 5020"
*!*	=sqli(q1)

if !fintransq()
	wait 'error' wind nowait
	return
endif

IF !dg('TIAR')
	RETURN
ENDIF

IF !dg('MEDI')
	RETURN
ENDIF


icde=0
sele ITEMS2
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

	marc=4836
	
	uni=38
	
	sele items2
	q1="insert into items (artgrupo, artmarca, issell, isbuy, isreturn, itipo, iname, iunidad, iunidad2, "+;
			" isiva, icode, stockmin, stockmax, imoney, isdesc, artcosto, iditem) values "+;
			pal(ntip)+al(marc)+al(.t.)+al(.t.)+al(.f.)+al(1)+al(iname)+al(uni)+al(uni)+;
			al(.t.)+al(ICODE)+al(0)+al(0)+al(2)+;
			al(.t.)+ al(costo)+Ual(idi)
	
	if !sqli(q1)
		=messagebox('error en articulo: '+alltrim(items2.iname),0,empresa)
	endif
	
	sele items2
	q1="insert into preciosv (iditem, iddato, preciov) values "+;
			pal(idi)+al(6242)+ual(bulto)
	=sqli(q1)

	q1="insert into preciosv (iditem, iddato, preciov) values "+;
			pal(idi)+al(3254)+ual(normal)
	=sqli(q1)

	q1="insert into preciosv (iditem, iddato, preciov) values "+;
			pal(idi)+al(1190)+ual(oferta)
	=sqli(q1)

	q1="insert into preciosv (iditem, iddato, preciov) values "+;
			pal(idi)+al(5853)+ual(credito)
	=sqli(q1)
	
	sele items2
	skip
enddo

