IF USED('plancuenta')
	sele plancuenta
else
	sele 0
	USE PLANCUENTA
endif
x=0
=sqli('begin')
=sqli('delete from saldoscon')
=sqli('delete from saldosci')
=sqli('delete from plancuenta')
sele plancuenta
go top
do while !eof()
	q1="insert into plancuenta (idplancuenta, pdocode, idcuenta, plancod, plannivel, plantype, auxcode) values "+;
		pal(idplancuen)+al(iprd)+al(idcuenta)+al(plancod)+al(plannivel)+al(plantype)+ual(auxcode)
	=sqli(q1)
	skip
enddo
do fintrans