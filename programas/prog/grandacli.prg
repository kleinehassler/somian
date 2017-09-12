
IF !USED('arclient')
	USE arclient.dbf IN 0 SHARED
ENDIF

SELE arclient
replace all nombre    with strtran(nombre,"'","")
replace all nombre    with strtran(nombre,'"',"")
replace all nombre    with strtran(nombre,'.',"")


replace all apellido     with strtran(apellido,"'","")
replace all apellido     with strtran(apellido,'"',"")
replace all apellido     with strtran(apellido,'.',"")

replace all domicilio     with strtran(domicilio,"'","")
replace all domicilio     with strtran(domicilio,'"',"")

replace all comentario     with strtran(comentario,"'","")
replace all comentario     with strtran(comentario,'"',"")

replace all cEDULA     	with strtran(cEDULA,'-',"")
replace all RUC     	with strtran(RUC,'-',"")

REPLACE ALL TELEFONOS 	WITH SUBSTR(TELEFONOS,1,15)

REPLACE ALL FAX 	WITH strtran(UPPER(fax),'A'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'R'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'G'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'T'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'.'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'E'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'B'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'J'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'C'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'O'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'P'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'I'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'N'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'V'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'('," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),')'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),':'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'H'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'M'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'L'," ")
REPLACE ALL FAX 	WITH strtran(UPPER(fax),'X'," ")
REPLACE ALL FAX 	WITH ALLTRIM(FAX)

GO TOP
SCAN
	ncodigo=0
	
	cate=3254
	
	ciud=3892
		
	sele arclient
	
	do case
	case ciudad='01'
		ciud=3892
	case ciudad='08'
		ciud=4151
	case ciudad='19'
		ciud=4127
	case ciudad='10'
		ciud=4147
	case ciudad='16'
		ciud=4116
	case ciudad='17'
		ciud=4119
	case ciudad='18'
		ciud=4130
	case ciudad='22'
		ciud=4148
	case ciudad='27'
		ciud=5603
	case ciudad='28'
		ciud=5604
	case ciudad='29'
		ciud=5602
	endcase
	
	q1="insert into sujetos ( scode, isempleado, isproveedor, isproductor, iscliente, issocio, sname, ssri, "+;
				" saddr, SADDR2, stelf, sfax, smoney, sprov, sciudad, numord, tipcli, scedula, sruc, FEC_APER, "+;
				" FEC_ULTCOM) values "+;
				pal(val(codigo)+6000) +al(.f.) +al(.f.) +al(.f.) +al(.t.) +al(.f.) +;
				al(ALLTRIM(APELLIDO)+' '+alltrim(nombre)) + al(alltrim(nombre)+' '+ALLTRIM(APELLIDO)) + al(dOMICILIO) +;
				AL(COMENTARIO)+al(SUBSTR(TELEFONOS,1,15))+ al(SUBSTR(FAX,1,15)) +al(2) +al(19) +al(ciud) +al(1) +al(cate)+;
				al(substr(CEDULA,1,10))+al(iif(len(alltrim(ruc))=13,alltrim(ruc),''))+AL(FEC_APERTU)+UAL(FEC_ULTCOM)
	if sqli(q1)
		wait 'Registrado...' wind nowait
	endif
		
	sele ARCLIENT
ENDSCAN

wait 'Proceso concluido...' wind nowait
