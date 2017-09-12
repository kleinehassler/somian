
IF !USED('arprovee')
	USE arprovee.dbf IN 0 SHARED
ENDIF

SELE arprovee
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

select min(val(codigo)) as codigo from arprovee into cursor mincod

if mincod.codigo=1
	sele arprovee
	replace all codigo 	with alltrim(str(val(codigo)+8000))
endif

sele arprovee
GO TOP
SCAN
	ncodigo=0
	
	cate=3254
	
	ciud=3892
		
	sele arprovee
	
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
				" saddr, SADDR2, stelf, smoney, sprov, sciudad, numord, tipcli, scedula, sruc, FEC_APER, "+;
				" FEC_ULTCOM) values "+;
				pal(val(codigo)+5000) +al(.f.) +al(.t.) +al(.f.) +al(.t.) +al(.f.) +;
				al(ALLTRIM(APELLIDO)+' '+alltrim(nombre)) + al(alltrim(nombre)+' '+ALLTRIM(APELLIDO)) + al(dOMICILIO) +;
				AL(COMENTARIO)+al(SUBSTR(TELEFONOS,1,15))+ al(2) +al(19) +al(ciud) +al(1) +al(cate)+;
				al(substr(CEDULA,1,10))+al(iif(len(alltrim(ruc))=13,alltrim(ruc),''))+AL(FEC_APERTU)+UAL(FEC_ULTCOM)
	if sqli(q1)
		wait 'Registrado...' wind nowait
	endif
		
	sele arprovee
ENDSCAN

wait 'Proceso concluido...' wind nowait
