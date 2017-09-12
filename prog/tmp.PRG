SELE A AS ITAG, C AS INAME, F AS MARCA, A AS BODEGA, A AS LINEA ;
FROM ITEMS ;
into table items2


sele items2

go top

bod=bodega
mar=marca
if substr(linea,1,5)='LINEA'
	lin=linea
else
	lin=''
endif

do while !eof()
	if empty(marca)
		replace marca with mar
	else
		mar=marca
	endif

	replace bodega with bod
	
	if substr(linea,1,5)<>'LINEA'
		replace linea with lin
	else
		lin=linea
	endif
	
	if bod<>itag and substr(itag,1,6)='BODEGA'
		bod=itag
	endif

	skip
enddo


replace all linea with alltrim(substr(linea,10,50))
delete for empty(iname)
replace all marca with alltrim(substr(marca,10,50))

replace all iname with CHRTRAN(iname, "'",'')
replace all iname with substr(iname,1,iif(at('MOD :',INAME)=0,100,at('MOD :',INAME)-1))
