if used('precgrif')
	sele precgrif
else
	sele 0
	use precgrif
endif
go top

x=0
= sqli('begin;')
sele precgrif
go top
scan
	q1="insert into preciosv (iditem, iddato, preciov, pordes, poruti) values "+;
		pal(iditem)+al(iddato)+al(preciov)+al(pordes)+ual(poruti)
	=sqli(q1) 
endscan
do fintrans