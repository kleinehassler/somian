** Cliente
Set dele off
local archif1
archif1="VEN016"
select 0
use &archif1 alias cliente
select cliente

Select codigo, cliente, alltrim(ruc) as ruc, contacto, plazo, aviso, ;
	codzon, estado, direccion, telefono, fax, ciudad, ;
	codven ;
from cliente ;
where len(alltrim(ruc))>0 ;
into cursor tcliente

*
=dg('CIUD')
* CIUDADES

select c.*, d.iddato as idciuok ;
from tcliente c left join ciudades d on (c.ciudad=d.descripda) ;
group by ruc ;
into table gcliente1.dbf


q1="Select * from sujetos"

if !sqli(q1,'siscli')
	wait 'errror' windows nowait
endif

select gcliente1 

delete from gcliente1 where ruc in (select sruc from siscli where len(Alltrim(siscli.sruc))>0 )
delete from gcliente1 where ruc in (select scedula from siscli where len(Alltrim(siscli.scedula))>0 )
delete from gcliente1 where len(alltrim(ruc))=0

select gcliente1
pack

go top
If RecCount('gcliente1')>0 then

	select gcliente1
	go top

	codigo1=1926
	
	scan 
		
		select gcliente1
		
		ruc11=chrtran(gcliente1.ruc,'-','')
		If Len(alltrim(ruc11))>12 then
			q1="Select sruc as numident from sujetos where sruc="+alup(ruc11)
			
			if !sqli(q1,'existesuj')
				wait 'errror' windows nowait
			endif
			
			select existesuj
			if RecCount('existesuj')=0 then

				select gcliente1
				
				q1="insert into sujetos(scode,isproveedor, iscliente, sname, ssri, "+;
				" sruc, saddr, stelf, sfax, smoney, "+;
				" sciudad, sprov, tipcli ) values "+;
				pal(codigo1)+al(.f.)+al(.t.)+al(chrtran(gcliente1.cliente,"'",' '))+al(chrtran(gcliente1.cliente,"'",' '))+al(chrtran(gcliente1.ruc,'-',''))+;
				al(substr(alltrim(gcliente1.direccion),1,59))+al(substr(alltrim(gcliente1.telefono),1,15))+al(substr(alltrim(gcliente1.fax),1,15))+al(2)+;
				al(iif(isnull(gcliente1.idciuok),3892,gcliente1.idciuok))+al(19)+ual(3254)
				
				if !sqli(q1)
					wait 'errror' windows nowait
				endif
				
				select gcliente1
				codigo1=codigo1+1
			endif
				
		else
			q1="Select scedula as numident from sujetos where scedula="+alup(ruc11)
			
			if !sqli(q1,'existesuj')
				wait 'errror' windows nowait
			endif
			
			select existesuj
			if RecCount('existesuj')=0 then

				select gcliente1
				
				q1="insert into sujetos(scode,isproveedor, iscliente, sname, ssri, "+;
				" scedula, saddr, stelf, sfax, smoney, "+;
				" sciudad, sprov, tipcli ) values "+;
				pal(codigo1)+al(.f.)+al(.t.)+al(chrtran(gcliente1.cliente,"'",' '))+al(substr(chrtran(gcliente1.cliente,"'",' '),1,10))+al(chrtran(gcliente1.ruc,'-',''))+;
				al(substr(alltrim(gcliente1.direccion),1,59))+al(substr(alltrim(gcliente1.telefono),1,15))+al(substr(alltrim(gcliente1.fax),1,15))+al(2)+;
				al(iif(isnull(gcliente1.idciuok),3892,gcliente1.idciuok))+al(19)+ual(3254)
				
				if !sqli(q1)
					wait 'errror' windows nowait
				endif
				
				select gcliente1
				codigo1=codigo1+1
			endif
			
		endif
		

	endscan

EndIf
