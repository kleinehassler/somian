if !used('ven001')
	sele 0
	use ven001
endif

select distinct upper(unimed) as unimed from ven001 ;
where !empty(alltrim(unimed)) and upper(unimed)!='3NIDAD' and upper(unimed)!='UNIDAD';
into cursor coeluni

sele ven001
use

x=0
if !sqli('begin')
	return
endif

sele coeluni
go top
do while !eof()
	q1='insert into detagru (idgrupo, descripda) values '+pal(9)+ual(unimed)
	=sqli(q1)
	sele coeluni
	skip
enddo

do fintrans