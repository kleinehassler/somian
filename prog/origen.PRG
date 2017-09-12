if used('tablavis') then
	sele tablavis
else
	sele 0
	use tablavis
endif

go top
do while !eof()
	if tipo!='sequence' then
		q1='select * from '+alltrim(nombre)+' where '+alup(.f.)
		  = sqli(q1) 
	endif
	sele tablavis
	skip
enddo
