sele items
GO TOP
DO WHILE !EOF()
	q1="insert into items (iditem, artgrupo, artmarca, issell, isbuy, itipo, iname, "+;
		"iunidad, imoney, isiva, itag, icode, isdesc) values "+pal(iditem)+al(artgrupo)+;
		al(artmarca)+al(issell)+al(isbuy)+al(itipo)+al(iname)+al(iunidad)+al(imoney)+;
		al(isiva)+al(itag)+al(icode)+ual(isdesc)
	=sqli(q1)
	skip
enddo