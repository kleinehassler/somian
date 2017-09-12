=rubros('D')

q1="select d.* "+;
	"from documents d "+;
	"where code not in (select c.code "+;
						"from cobros c left join rubros r on (c.rubcode=r.rubcode) "+;
						      		"  left join vdocusmall d on (c.code=d.code) "+;
						"where r.rubtype='D' and isaccount and not isanulado) "

if !sqli(q1,'doc')
	return
endif

sele doc
go top

do while !eof()
	sele rubros
	go top
	x=0
	if !sqli("begin;")
		exit
	endif
	do while !eof()
		f=alltrim(rubformula)
		sele doc
		if &f>0
			q1="insert into cobros ( code, rubcode, valor, tipo) values "+pal(code)+;
			   al(rubros.rubcode)+al(&f)+ual('D')
				=sqli(q1)
		endif
		sele rubros
		skip
	enddo
	=fintransq()
	sele doc
	skip
enddo

wait 'Concluido...' wind nowait