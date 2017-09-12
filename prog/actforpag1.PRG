
q1=" select code "+;
	"from vdocusmall "+;
	"where iddocu in (select distinct d.iddocu from gdoc g, dgdoc t, docuse d  "+;  
				" where g.tag='ANXCOM' and g.idgdoc=t.idgdoc and t.dtag=d.dtag) "
				
if sqli(q1,'anxcom')
	sele anxcom
	go top
	do while !eof()
		wait 'Procesando '+alltrim(str(code)) wind nowait
		q1="select distinct case when rubname like '%CAJA%' 		then 1 else "+;
			      		"   case when rubname like '%NOTA%DEBITO%' 	then 6 else "+;
			      		"   case when rubname like '%CHEQUE%'		then 2 else "+;
			      		"   case when rubname like '%CUENTA%PAGAR%'	then 2 else "+;
			      		"   case when rubname like '%TARJETA%CREDITO%' then 10 end end end end end as tipopag1 "+;
		"from vdocusmall d left join cobros c on (d.code=c.code) "+;
				 		"  left join rubros r on (c.rubcode=r.rubcode) "+;
		"where d.code="+alup(anxcom.code)+" and not r.isdocret and "+;
			" d.iddocu in (select distinct d.iddocu from gdoc g, dgdoc t, docuse d  "+;  
						" where g.tag='ANXCOM' and g.idgdoc=t.idgdoc and t.dtag=d.dtag) and "+;
		    			" ( rubname like '%CAJA%' or rubname like '%NOTA%DEBITO%' or rubname like '%CHEQUE%' or rubname like '%TARJETA%CREDITO%' ) "+;
		" union "+;
		"select distinct case when rubname like '%CAJA%' 		then 1 else "+;
			    	"  case when rubname like '%NOTA%DEBITO%' 	then 6 else "+;
			      	"  case when rubname like '%CHEQUE%'		then 2 else "+;
			      	"  case when rubname like '%CUENTA%PAGAR%'	then 2 else "+;
			      	"  case when rubname like '%TARJETA%CREDITO%' then 10 end end end end end as tipopag1 "+;
		" from vdocusmall d left join cobros c on (d.code=c.code) "+;
				 " left join rubros r on (c.rubcode=r.rubcode) "+;
				 " left join detadocd t on (d.code=t.code) "+;
				 " left join vdocusmall p on (t.coded=p.code) "+;
		"where not r.isdocret and p.code="+alup(anxcom.code)+" and "+;
			" p.iddocu in (select distinct d.iddocu from gdoc g, dgdoc t, docuse d    "+;
				" where g.tag='ANXCOM' and g.idgdoc=t.idgdoc and t.dtag=d.dtag) and "+;
		    " ( rubname like '%CAJA%' or rubname like '%NOTA%DEBITO%' or rubname like '%CHEQUE%' or rubname like '%TARJETA%CREDITO%' ) "
		
		if sqli(q1,'forpag')
			sele forpag
			do case
				case reccount('forpag')=0
					q1="update aneiva set forpag1=1 where code="+alup(anxcom.code)
					=sqli(q1)
				case reccount('forpag')=1
					sele forpag
					go top
					q1="update aneiva set forpag1="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
				case reccount('forpag')=2
					sele forpag
					go top
					q1="update aneiva set forpag1="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
					skip
					q1="update aneiva set forpag2="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
				case reccount('forpag')>2
					sele forpag
					go top
					q1="update aneiva set forpag1="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
					skip
					q1="update aneiva set forpag2="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
					skip
					q1="update aneiva set forpag3="+alup(forpag.tipopag1)+" where code="+alup(anxcom.code)
					=sqli(q1)
			endcase
		endif	
		sele anxcom
		skip
	enddo
endif