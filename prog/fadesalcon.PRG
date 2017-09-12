if used('cxcfinal')
	sele cxcfinal
else
	sele 0
	use cxcfinal
endif
go top

x=0
if !sqli('begin;')
	return
endif

q1="delete from saldosci where ctacon="+alup(8127)
=sqli(q1)

sele cxcfinal
do while !eof()
	r="stag="+alup(substr(codigo,5,10))

	q1="select idsujeto from sujetos where "+r

	if sqli(q1,'sujeto')
		if reccount('sujeto')=0
			=messagebox(cxcfinal.codigo+' no existe')
		else
			sele cxcfinal
			q1="insert into saldosci (idsujeto, saldo, monto, pdocode, fecultpag, ctacon, fecven, fecha, "+;
				"referencia) values "+;
				pal(sujeto.idsujeto)+al(mon_fac+monto)+al(mon_fac+monto)+al(iprd)+al(fec_ven)+al(8127)+;
				al(fec_ven)+al(emision)+;
				ual(alltrim(detalle)+' -  Fac: '+factura+' Por: '+alltrim(str(mon_fac,10,2))+' - Comp: '+comproban)

			=sqli(q1)
				
		endif
	else
		wait 'error' wind
	endif
	sele cxcfinal
	skip
enddo

do fintrans