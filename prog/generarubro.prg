q1="select d.iddocu, t.rubcode, issaldo "+;
	"from docuse d left join ddocuse t on (d.iddocu=t.iddocu) "+;
				"  left join rubros r on (t.rubcode=r.rubcode) "+;
	" where rubtype='D' and issaldo "
if !sqli(q1,'confsal')
	return
endif

q1="select code, iddocu "+;
	" from vdocusmall d "+;
	" where swconta and code not in (select distinct code from cobros where tipo='D') "
=sqli(q1,'docsinrub')

sele docsinrub
go top
do while !eof()
	wait str(code) wind nowait
	=rubdoc(code)
	sele confsal
	set filter to 
	set filter to iddocu=docsinrub.iddocu
	go top
	do while !eof()
		sele vardoc
		go top
		locate for rubcode=confsal.rubcode
		if found()
			q1="insert into cobros ( code, rubcode, valor, tipo) values "+pal(docsinrub.code)+;
		   		al(vardoc.rubcode)+al(vardoc.valor)+ual('D')
			=sqli(q1)

		endif
		sele confsal
		skip
	enddo
	sele docsinrub
	skip
enddo 	
