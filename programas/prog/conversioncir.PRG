create cursor conversion ( 	codigo n(3), descripcion c(200), valor n(5,2), idsritabla n(5), ;
							ncod n(3),	ndescrip c(200), nvalor n(5,2), nidsri n(5) )

q1="select codigo, descrip "+;
	" from sritabla "+;
	" where substr(descrip,1,23)='HONORARIO PROFESIONALES' and iddato=2755 and codigo="+alup(303)
	
if sqli(q1,'codret')
	if reccount('codret')=1
		wait 'Codigos actualizados' wind nowait
		return
	endif
else
	return
endif	

q1="select codigo from sritabla where iddato=2755 and codigo="+alup(340)
if sqli(q1,'codret')
	if reccount('codret')=0
		q1="insert into sritabla (iddato, codigo, descrip, anio, mes, valor) values "+;
				pal(2755)+al(340)+al('OTRAS RETENCIONES APLICABLES EL 1%')+al(0)+al(0)+ual(1)
		=sqli(q1)
	endif
endif	

q1="select codigo from sritabla where iddato=2755 and codigo="+alup(341)
if sqli(q1,'codret')
	if reccount('codret')=0
		q1="insert into sritabla (iddato, codigo, descrip, anio, mes, valor) values "+;
				pal(2755)+al(341)+al('OTRAS RETENCIONES APLICABLES EL 2%')+al(0)+al(0)+ual(2)
		=sqli(q1)
	endif
endif	

q1="select codigo from sritabla where iddato=2755 and codigo="+alup(342)
if sqli(q1,'codret')
	if reccount('codret')=0
		q1="insert into sritabla (iddato, codigo, descrip, anio, mes, valor) values "+;
				pal(2755)+al(342)+al('OTRAS RETENCIONES APLICABLES EL 8%')+al(0)+al(0)+ual(8)
		=sqli(q1)
	endif
endif	

if !sritabla('CAIR')
	RETURN
endif

sele codair
go top
do while !eof()
	scatter memvar
	insert into conversion from memvar
	sele codair
	skip
enddo

select conversion
go top
do while !eof()
	do case
	case codigo=303
		replace ncod 		with 303 
		replace ndescrip	with 'HONORARIO PROFESIONALES Y DIETAS'
		replace nvalor		with 8
		replace nidsri		with idsritabla
	case codigo=307
		replace ncod 		with 312 
		replace ndescrip	with 'TRANSFERENCIA DE BIENES MUEBLES DE NATURALEZA CORPORAL'
		replace nvalor		with 1
		select  codair
		go top
		locate for codigo=312
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=309 or codigo=310 or codigo=311 or codigo=312 or codigo=317 or codigo=324 or codigo=326
		replace ncod 		with 340 
		replace ndescrip	with 'OTRAS RETENCIONES APLICABLES EL 1%'
		replace nvalor		with 1
		select  codair
		go top
		locate for codigo=340
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=313
		replace ncod 		with 310 
		replace ndescrip	with 'SERVICIO TRANSPORTE PRIVADO PASAJEROS O SERV. PUB. O PRIV. CARGA'
		replace nvalor		with 1
		select  codair
		go top
		locate for codigo=310
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=316
		replace ncod 		with 342
		replace ndescrip	with 'OTRAS RETENCIONES APLICABLES EL 8%'
		replace nvalor		with 8
		select  codair
		go top
		locate for codigo=342
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=318
		replace ncod 		with 309
		replace ndescrip	with 'SERVICIOS PUBLICIDAD Y COMUNICACION'
		replace nvalor		with 1
		select  codair
		go top
		locate for codigo=309
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=319
		replace ncod 		with 319
		replace ndescrip	with 'ARRENDAMIENTO MERCANTIL'
		replace nvalor		with 1
		replace nidsri		with idsritabla
	case codigo=320
		replace ncod 		with 320
		replace ndescrip	with 'ARRENDAMIENTO DE BIENES INMUEBLES'
		replace nvalor		with 8
		replace nidsri		with idsritabla
	case codigo=322
		replace ncod 		with 322
		replace ndescrip	with 'SEGUROS Y REASEGUROS (PRIMAS Y CESIONES)'
		replace nvalor		with 1
		replace nidsri		with idsritabla
	case codigo=323
		replace ncod 		with 323
		replace ndescrip	with 'POR RENDIMIENTO FIRNANCIEROS (NO APLICA IFIS)'
		replace nvalor		with 2
		replace nidsri		with idsritabla
	case codigo=329
		replace ncod 		with 341
		replace ndescrip	with 'OTRAS RETENCIONES APLICABLES EL 2%'
		replace nvalor		with 2
		select  codair
		go top
		locate for codigo=341
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=331
		replace ncod 		with 341
		replace ndescrip	with 'OTRAS RETENCIONES APLICABLES EL 2%'
		replace nvalor		with 2
		select  codair
		go top
		locate for codigo=341
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	case codigo=308 or codigo=332
		replace ncod 		with 332
		replace ndescrip	with 'OTRAS COMPRAS DE BIENES Y SERVICIOS NO SUJETAS A RETENCION'
		replace nvalor		with 0
		select  codair
		go top
		locate for codigo=332
		if found()
			replace conversion.nidsri	with codair.idsritabla
		else
			replace conversion.nidsri	with 0
		endif
	endcase
	selec conversion
	skip
enddo

brow

if messagebox('Desea continuar? ',36)<>6
	return
endif

x=0
if !sqli("begin")
	return
endif

sele conversion
go top
do while !eof()
	
	if ncod>0
		q1="update sritabla set codigo="+alup(ncod)+;
							",  descrip="+alup(ndescrip)+;
				" where idsritabla="+alup(idsritabla)

		=sqli(q1)
	endif
	sele conversion
	skip
enddo

do fintrans


*!*	UNIFICAR 340, 341 Y 342
if !sritabla('CAIR')
	RETURN
endif

select distinct codigo, min(idsritabla) as idsritabla ;
from codair ;
where codigo>=340 and codigo<=342  ;
group by codigo ;
into cursor uncod

sele uncod
go top
do while !eof()
	q1="update cobros set idsritabla="+alup(idsritabla)+;
			" where idsritabla in (select idsritabla from sritabla where codigo="+alup(codigo)+")"
	=sqli(q1)
	sele uncod
	skip
enddo

sele codair

go top
do while !eof()
	if codigo<>332
		q1="select distinct idsritabla from cobros where idsritabla="+alup(idsritabla)
		if sqli(q1,'retcob')
			if reccount('retcob')=0
				q1="delete from sritabla where idsritabla="+alup(codair.idsritabla)
				=sqli(q1)
			endif
		endif
	endif
	sele codair
	skip
enddo
