local codigo
set exclusive off
Select 0
*use F:\coelsa\SAICW21\BASES\ven001 alias artc
use ven001 alias artc

q1="select iditem, itag from items;"

If !sqli(q1,'arts')
	return
endif

*!*	cancel


*!*	select arts
*!*	go top
*!*	scan
*!*		select arts
*!*		codigo=alltrim(arts.itag)
*!*		Select artc
*!*		go top
*!*		locate for artc.codart=codigo
*!*		if found()
*!*			q1="insert into preciosv(iddato, iditem, preciov) values "+;
*!*			pal(2887)+al(arts.iditem)+ual(artc.cosven)
*!*			
*!*			If !sqli(q1)
*!*				wait 'Error en la Lista de Precios' windows nowait
*!*			endif
*!*			
*!*			select arts
*!*		endif
*!*	endscan

*!*	select arts
*!*	go top
*!*	scan
*!*		select arts
*!*		codigo=alltrim(arts.itag)
*!*		Select artc
*!*		go top
*!*		locate for artc.codart=codigo
*!*		if found()
*!*			q1="insert into preciosv(iddato, iditem, preciov) values "+;
*!*			pal(3254)+al(arts.iditem)+ual(artc.p_v_p)
*!*			
*!*			If !sqli(q1)
*!*				wait 'Error en la Lista de Precios' windows nowait
*!*			endif
*!*			
*!*			select arts
*!*		endif
*!*	endscan

select arts
go top
scan
	select arts
	codigo=alltrim(arts.itag)
	Select artc
	go top
	locate for artc.codart=codigo
	if found()
		q1="insert into preciosv(iddato, iditem, preciov) values "+;
		pal(1190)+al(arts.iditem)+ual(artc.otroprecio)
		
		If !sqli(q1)
			wait 'Error en la Lista de Precios' windows nowait
		endif
		
		select arts
	endif
endscan