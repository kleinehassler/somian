* actualizar rubros  de  detalle de documentos

IF basedd='fadese'
	Q1= "SELECT DISTINCT T.CODE, T.CODED, T.VALORT, U.RUBNAME AS RUBNFIN, C.RUBCODE AS RUBFIN, "+;
		" T.RUBCODE AS RUBINI, S.RUBNAME AS RUBNINI "+;
		"FROM VDOCUSMALL D LEFT JOIN COBROS C ON (D.CODE=C.CODE ) "+;
		"	  LEFT JOIN RUBROS U ON (C.RUBCODE=U.RUBCODE ) "+;
		"	  LEFT JOIN DDOCUSE R ON (D.IDDOCU=R.IDDOCU ) "+;
		"	  LEFT JOIN DETADOCD T ON (D.CODE=T.CODED) "+;
		"     LEFT JOIN RUBROS S ON (T.RUBCODE=S.RUBCODE) "+;
	"WHERE T.CODE<>459 AND U.RUBTYPE='C' AND C.RUBCODE=R.RUBCODE AND R.ISSALDO AND T.RUBCODE<>C.RUBCODE "
	if !SQLI(Q1,'DOCURUB')
		return
	endif

	x=0
	=sqli('begin;')
	sele docurub
	go top
	do while !eof()
		q1='update detadocd set rubcode='+alup(rubfin)+' where code='+alup(code)+' and coded='+;
				alup(coded)+' and rubcode='+alup(rubini)
		=sqli(q1)
		skip
	enddo

	do fintrans
else
	Q1= "SELECT DISTINCT T.CODE, T.CODED, T.VALORT, U.RUBNAME AS RUBNFIN, C.RUBCODE AS RUBFIN, "+;
		" T.RUBCODE AS RUBINI, S.RUBNAME AS RUBNINI "+;
		"FROM VDOCUSMALL D LEFT JOIN COBROS C ON (D.CODE=C.CODE ) "+;
		"	  LEFT JOIN RUBROS U ON (C.RUBCODE=U.RUBCODE ) "+;
		"	  LEFT JOIN DDOCUSE R ON (D.IDDOCU=R.IDDOCU ) "+;
		"	  LEFT JOIN DETADOCD T ON (D.CODE=T.CODED) "+;
		"     LEFT JOIN RUBROS S ON (T.RUBCODE=S.RUBCODE) "+;
	"WHERE T.CODE<>777 AND U.RUBTYPE='C' AND C.RUBCODE=R.RUBCODE AND R.ISSALDO AND T.RUBCODE<>C.RUBCODE "
	if !SQLI(Q1,'DOCURUB')
		return
	endif

	x=0
	=sqli('begin;')
	sele docurub
	go top
	do while !eof()
		q1='update detadocd set rubcode='+alup(rubfin)+' where code='+alup(code)+' and coded='+;
				alup(coded)+' and rubcode='+alup(rubini)
		=sqli(q1)
		skip
	enddo

	do fintrans

endif