local idsuj1, idsuj2

idsuj1=0
idsuj2=0

q1="select count(scode), sruc, sname "+;
	"from sujetos "+;
	"where char_length(sname)>=25 "+;
	"group by sruc, sname having count(scode)>=2"
if !sqli(q1,'ced_rep')
	return
endif
sele ced_rep


go top
scan
	wait 'Procesando '+alltrim(sname) wind nowait
	
	q1="select distinct idsujeto "+;
		"from sujetos "+;
		"where sname="+alup(ced_rep.sname)+" and sruc="+alup(ced_rep.sruc)
	
	if !sqli(q1,'sujtra')
		loop
	else
		if reccount('sujtra')<2
			loop
		endif
	endif
	
	select sujtra
		
	go top
	
	idsuj1=idsujeto
	skip
	idsuj2=idsujeto
	

	X=0
	if !sqli('begin')
		return
	endif

	q1="update documents set idgarante="+alup(idsuj1)+" where  idgarante="+alup(idsuj2) 
	=sqli(q1)

	q1="update documents set sujter="+alup(idsuj1)+" where  sujter="+alup(idsuj2) 
	=sqli(q1)

	q1="update documents set seller="+alup(idsuj1)+" where  seller="+alup(idsuj2)  
	=sqli(q1)

	q1="update documents set casher="+alup(idsuj1)+" where  casher="+alup(idsuj2)  
	=sqli(q1)

	q1="update documents set chofer="+alup(idsuj1)+" where  chofer="+alup(idsuj2)  
	=sqli(q1)

	q1="update documents set usercaja="+alup(idsuj1)+" where  usercaja="+alup(idsuj2)  
	=sqli(q1)

	q1="update documents set idugra="+alup(idsuj1)+" where  idugra="+alup(idsuj2)  
	=sqli(q1)

	q1="update documents set cliente="+alup(idsuj1)+" where  cliente="+alup(idsuj2)  
	=sqli(q1)

	q1="update accdoc set idsujeto="+alup(idsuj1)+" where idsujeto="+alup(idsuj2)  
	=sqli(q1)

	q1="update saldosci set idsujeto="+alup(idsuj1)+" where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="update saldosci set seller="+alup(idsuj1)+" where  seller="+alup(idsuj2)  
	=sqli(q1)

	q1="update saldosci set casher="+alup(idsuj1)+" where  casher="+alup(idsuj2)  
	=sqli(q1)

	q1="update detadocs set idsujeto="+alup(idsuj1)+" where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="update saldoscon set idaux="+alup(idsuj1)+" where idaux="+alup(idsuj2) 
	=sqli(q1)

	q1="update asientosmov set idaux="+alup(idsuj1)+" where idaux="+alup(idsuj2) 
	=sqli(q1)

	q1="update empleados set idsujeto="+alup(idsuj1)+" where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="update cheques set cliente="+alup(idsuj1)+" where cliente="+alup(idsuj2) 
	=sqli(q1)

	q1="update cheques set usercaja="+alup(idsuj1)+" where usercaja="+alup(idsuj2) 
	=sqli(q1)

	q1="update usuarios set idsujeto="+alup(idsuj1)+" where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="delete from empleados where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="delete from usuarios where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	q1="delete from sujetos  where idsujeto="+alup(idsuj2) 
	=sqli(q1)

	if !fintransq()
		=messagebox('No pudo ser actualizado '+alltrim(ced_rep.sname),0,empresa)
	endif

	idsuj1=0
	idsuj2=0
	
	sele ced_rep
endscan