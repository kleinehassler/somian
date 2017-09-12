if !dg('CUCO')
	return
endif

if used('plancta')
	sele plancta
else
	sele 0
	use plancta
endif
delete for empty(cuenta) or empty(codigo)

x=0
sele plancta
go top
if !sqli("begin;")
	return
endif

q1="delete from plancuenta ;"
if !sqli(q1)
	return
endif

do while !eof()
	l=len(alltrim(CODIGO))

	if l>11
		c=alltrim('0'+substr(codigo,1,1)+substr(codigo,3,2)+substr(codigo,6,2)+substr(codigo,9,2)+substr(codigo,13,2))+;
			'000000000000000000'
	else
		c=alltrim('0'+substr(codigo,1,1)+substr(codigo,3,2)+substr(codigo,6,2)+substr(codigo,9,2))+;
			'000000000000000000'
	endif
	
	c=substr(c,1,20)
			
	sele ctasctbs
	go top
	locate for alltrim(descripda)=alltrim(plancta.cuenta)
	if found()
		sele plancta
		q1="insert into plancuenta (plancod, idcuenta, plannivel, plantype, auxcode, pdocode) values "+;
			pal(c)+al(ctasctbs.iddato)+al( 	iif(l=1,1,iif(l=4,2,iif(l=7,3,iif(l=10,4,5 )))))+;
			al(iif(sujaux="De Detalle",'M','G'))+al(iif(sujaux="De Detalle",'S',null))+ual(54)
		=sqli(q1)
		*wait q1 wind
		
	else
		idd=0
		q1="select 	nextsecu('detagru_iddato_seq'::text, 'DETAGRU'::text) as idd"
		if	sqli(q1,'nit')
			sele nit
			if reccount('nit')>0
				idd=nit.idd
			endif
		endif
		
		sele plancta
		q1="insert into detagru (iddato, descripda, idgrupo) values "+;
			pal(idd)+al(cuenta)+ual(21)
		=sqli(q1)

		q1="insert into plancuenta (plancod, idcuenta, plannivel, plantype, auxcode, pdocode) values "+;
			pal(c)+al(idd)+al(iif(l=1,1,iif(l=4,2,iif(l=7,3,iif(l=10,4,5 )))))+al(iif(sujaux="De Detalle",'M','G'))+;
			al(iif(sujaux="De Detalle",'S',null))+ual(54)

		=sqli(q1)
		*wait q1 wind
		if !dg('CUCO')
			x=1
			exit
		endif
	endif
	sele plancta
	skip
enddo

do fintrans