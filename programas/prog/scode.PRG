local n

if !fsujetos() 
	return
endif

n=200000
x=0
=sqli("begin;")

sele sujetos
go top
do while !eof()
	q1="update sujetos set scode="+alup(n)+" where idsujeto="+alup(idsujeto)
	=sqli(q1)
	n=n+1
	skip
enddo
do fintrans

n=1

sele sujetos
go top
do while !eof()
	
	do while .t.
		x=0
		=sqli("begin;")
		q1="update sujetos set scode="+alup(n)+" where idsujeto="+alup(idsujeto)
		=sqli(q1)
		n=n+1
		if fintransq()
			exit
		endif
	enddo
	skip
enddo
do fintrans
