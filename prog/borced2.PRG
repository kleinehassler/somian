
q1="select count(scode), scedula "+;
	"from sujetos "+;
	"where char_length(scedula)>=9 "+;
	"group by scedula having count(scode)>=2"
if !sqli(q1,'ced_rep')
	return
endif
sele ced_rep

go top
scan
	wait 'Procesando '+alltrim(scedula) wind nowait
	
	q1="select count(idsujeto), sname "+;
		"from sujetos "+;
		"where scedula="+alup(ced_rep.scedula)+;
		" group by sname"
	
	if !sqli(q1,'sujtra')
		loop
	else
		if reccount('sujtra')<=1
			loop
		endif
	endif
	
	q1="update sujetos set scedula='' where scedula="+alup(ced_rep.scedula)

	=sqli(q1)
	
	sele ced_rep
endscan