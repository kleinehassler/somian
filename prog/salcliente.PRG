local cantexi, item
*	Tabla de articulos

q1="select distinct idsujeto, codigo as scode, nombre as sname "+;
	"from vsujetos  "
	
if !sqli(q1,'sujetos1') then
	return
endif

SELECT int(secuencia) as secuencia, tipo_doc, num_compte, fecha_comp, valor_comp, valor_abon, alltrim(str(val(cliente)+6000)) as cliente, ;
	fecha_venc, referencia, cobrador, num_cuota, comentario ;
FROM ARCARTER ;
WHERE valor_comp>0 and (TIPO_DOC='PAG' or TIPO_DOC='N/D' or TIPO_DOC='FAC') AND (VALOR_ABON=0 OR VALOR_ABON<VALOR_COMP) ;
order by cliente ;
into cursor saldocli

select distinct s.*, c.idsujeto ;
from saldocli s left join sujetos1 c on int(val(s.cliente))=c.scode ;
order by idsujeto into cursor cliente


x=0
if !sqli("begin;") then
	wait 'Problema de Comunicacion' wind nowait
	return
endif

*!*	q1="delete from saldosci ;"

*!*	=sqli(q1) 

sele CLIENTE
go top
SCAN FOR IDSUJETO>0

*	IDSUJETO1=CLIENTE.IDSUJETO
	
	wait alltrim(str(CLIENTE.IDSUJETO))+' => '+alltrim(CLIENTE.cliente) wind nowait
		
	q1="insert into saldosci (code, idsujeto, saldo, monto, pdocode, fecultpag, ctacon, fecven, cuota, referencia, fecha) values "+;
				pal(0)+al(cliente.idsujeto)+al(cliente.valor_comp-cliente.valor_abon)+al(cliente.valor_comp-cliente.valor_abon)+;
				al(iprd)+al(cliente.fecha_comp)+al(4198)+al(cliente.fecha_venc)+al(cliente.valor_comp-cliente.valor_abon)+;
				al('T.doc:'+alltrim(cliente.tipo_doc)+" - Ref:"+alltrim(cliente.referencia)+;
				' - Num.Cuota:'+alltrim(num_cuota)+' - Comen:'+alltrim(comentario))+ual(cliente.fecha_comp)
			
	=sqli(q1)

	sele CLIENTE
	
EndScan	

************
do fintrans
************
