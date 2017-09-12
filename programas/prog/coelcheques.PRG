if !used('cheques')
	sele 0
	use cheques
endif


*!*	if !dg('BANC')
*!*		return
*!*	endif


*!*	sele cheques 
*!*	go top
*!*	do while !eof()
*!*		q1="select scode from sujetos where sname like "+alup('%'+chrtran(cliente,"'",' ')+'%')
*!*		if sqli(q1,'sujeto')
*!*			if reccount('sujeto')=1
*!*				replace cheques.scode with sujeto.scode
*!*			endif
*!*		endif
*!*		sele bancos
*!*		go top
*!*		locate for alltrim(descripda)=alltrim(cheques.banco)
*!*		if found()
*!*			replace cheques.idbanco with bancos.iddato
*!*		endif
*!*		sele cheques
*!*		skip
*!*	enddo
select fecord, fecha, sum(valor) as valor, referencia, cliente, numfac, banco, cheque, codven, scode, idbanco ;
from cheques ;
group by cliente, banco, cheque ; 
into cursor cheque2

x=0
=sqli('begin')

=sqli('delete from cheques')

sele cheque2
go top
do while !eof()
	ncod=0
	q1="select idsujeto from sujetos where scode="+alup(scode)
	if sqli(q1,'suj')
		ncod=suj.idsujeto
	endif
	
	sele cheque2	
	if scode=421
		q1="insert into cheques (code, fecheque, banco, numcta, observa, numche, valor, cliente, fecha ) values "+;
					pal(0)+al(fecord)+al(idbanco)+al(0)+al(alltrim(chrtran(cliente,"'",' '))+' = '+alltrim(str(referencia)))+;
					al(cheque)+al(valor)+al(ncod)+ual(fecha)
		=sqli(q1)
	else
		q1="insert into cheques (code, fecheque, banco, numcta, observa, numche, valor, cliente, fecha ) values "+;
					pal(0)+al(fecord)+al(idbanco)+al(0)+al(referencia)+;
					al(cheque)+al(valor)+al(ncod)+ual(fecha)
		=sqli(q1)
	
	endif
	sele cheque2
	skip
enddo

do fintrans