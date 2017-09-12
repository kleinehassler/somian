if !used('ven001')
	sele 0
	use ven001
endif

select codart, nuevo_cod, emb, b_desp, iv, unimed ;
from ven001 ;
into cursor ven002

sele ven001
use

if !dg('MEDI')
	return
endif

if !dg('UBIC')
	return
endif

q1="select iditem, itag, unidad, iunidad from vitems "

if !sqli(q1,'items')
	return
endif

sele items
index on itag tag itag

x=0
=sqli('begin')

sele ven002
go top
do while !eof()
	busq=.f.
	sele items
	seek( ven002.codart )
	if !found()
		seek ( ven002.nuevo_cod )
		if found()
			busq=.t.
		endif
	else
		busq=.t.
	endif
	
	if busq
		uni=items.iunidad
		ubi=5525
		sele unidades
		go top
		locate for descripda=VEN002.unimed
		if found()
			uni=unidades.iddato
		endif
		
		q1="update items set iunidad="	+alup(uni)+;
						",	 iunidad2="	+alup(uni)+;
						",	 iunidad3="	+alup(uni)+;
						",	 isembala="	+alup(iif(ven002.emb='X',.t.,.f.))+;
						",	 ubicacion="+alup(iif(ven002.b_desp='01',5525,5526))+; 
						",	 isiva="	+alup(iif(ven002.iv='X',.t.,.f.))+;
				" where iditem="+alup(items.iditem)
		=sqli(q1)
	else
		&& Grabar el item
	endif
	sele ven002
	skip
enddo

do fintrans