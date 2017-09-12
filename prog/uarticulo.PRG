*
*

local archif1, uni1, codisc, nombsc, codigo2

select 0
archif1="ven001"
use &archif1 alias articulo
select articulo

=dg('TIAR')

=dg('SUAR')

* , t.iddato as tart, s.iddato as sart   ;

Select a.codart, a.desart, a.P_V_P, a.cos_uni, a.ultcos, a.categoria, a.subcatego, a.codprov, a.peso, ;
	a.ubica, c.describe as cdes, s.describe as sdes, a.unimed, a.emb, a.iv, a.b_desp  ;
	from articulo a left join VEN026 c on (a.categoria=c.categoria) ;
				left join ven027 s on (a.subcatego=s.subcatego) ;
	where len(alltrim(a.codart))>0 ;
	ORDER BY desart ;
	into table d:\coelsa\tempo\lisart1.dbf

if !dg('MEDI')
	return
endif

if !dg('UBIC')
	return
endif

SELECT a.*,  t.iddato as tart, s.iddato as sart   ;
from lisart1 a left join tipart t on (a.cdes=t.descripda) ;
			left join subart s on (a.sdes=s.descripda) ;
into cursor lisart	
		
GO top
codigo1=8830
SCAN

	select lisart
	
	codisc=lisart.codart
	nombsc=lisart.desart
	
	q1="select iditem, icode, itag, iname from items where itag="+alup(lisart.codart)
	
	IF !sqli(q1,'itemfnd')
		WAIT ' ERROR ARTICULO' WINDOWS NOWAIT
	ENDIF	
	
	If Reccount('itemfnd')=0 then
		
		uni1=38

		sele unidades
		go top
		locate for descripda=lisart.unimed

		if found()
			uni1=unidades.iddato
		endif
			
		select lisart

		q1="insert into items(artmarca, artcosto, issell, isbuy, isreturn, "+;
			" itipo, iname, iunidad, iunidad2, iunidad3, imoney, isiva, itag, icode, isformato, "+;
			" isdesc, artgrupo, artsgrupo, artpeso, "+;
			" isembala, ubicacion, costopro)"+;
			" values "+pal(4935)+al(lisart.cos_uni)+al(.t.)+al(.t.)+al(.t.)+;
			al(1)+al(chrtran(lisart.desart,"'",' '))+al(uni1)+al(uni1)+al(uni1)+al(2)+al(iif(lisart.iv='X',.t.,.f.))+al(lisart.codart)+al(codigo1)+al(.f.)+;
			al(.f.)+al(lisart.tart)+al(iif(isnull(lisart.sart),4994,lisart.sart))+al(lisart.peso)+;
			al(iif(lisart.emb='X',.t.,.f.))+al(iif(lisart.b_desp='01',5525,5526))+ual(lisart.ultcos)

		IF !sqli(q1)
			WAIT ' ERROR ARTICULO' WINDOWS NOWAIT
		ENDIF	
		
		codigo1=codigo1+1
		
		wait 'Registrando un Nuevo Articulo' windows nowait 
	
	
	else
*!*			select itemfnd
*!*			codigo2=itemfnd.iditem
*!*			select lisart

*!*			q1="Update items set artcosto="+alup(lisart.cos_uni)+;
*!*					", costopro="+alup(lisart.ultcos)+;
*!*					" where iditem="+alup(codigo2)
*!*			
*!*			IF !sqli(q1)
*!*				WAIT ' ERROR ARTICULO' WINDOWS NOWAIT
*!*			ENDIF	
*!*			
*!*			wait 'Actualizando Datos de los Articulos' Windows Nowait
				
	endif
	
	SELECT lisart
	
ENDSCAN
