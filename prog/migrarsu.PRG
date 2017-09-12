ON ERROR

SET PROCEDURE TO PROCEDIMIENTOS.fxp, FCONSULTAS.fxp ADDIT

IF USED('proveedo') then
	sele proveedo
else
	USE PROVEEDO in 0 EXCLU
endif
sele proveedo
index on cobsa tag cobsa

sele * from proveedo into cursor tmpprov

IF USED('tmpsuj') then
	sele tmpsuj
else
	USE tmpsuj in 0 EXCLU
endif

sele tmpsuj
zap
index on scode tag scode

if !dg('SECU') then
	wait 'Error en secuencias' wind nowait
	return
endif

if sqlexec(nconec,"select * from datosgen order by descripda;",'datosgen') <0 then
	wait 'Error en datos generales' wind
	return
endif

if sqlexec(nconec,"select * from monedas ;",'monedas')<0 then
    wait 'Error en monedas' wind nowait
    return
endif

m.scode = 0
m.isempleado = .f.
m.isproveedo = .f.
m.isproducto = .f.
m.iscliente = .t.
m.emppro=.f.
m.sname = ''
m.ssri = ''
m.scedula = ''
m.sruc = ''
m.spasaporte = ''
m.saddr = ''
m.saddr2 = ''
m.stelf = ''
m.sfax = ''
m.scel = ''
m.smail = ''
m.swww = ''
m.smoney = 0
m.sprov = 0
m.ssaldo = 0.0
m.scredito = 0.0
m.scheques = 0.0
m.sprotesto	= .f.
m.stag = ''
m.idsujeto=0
m.sciudad=0
m.snumcasa=0
m.emppro=.f.

sele monedas
go top
locate for moname='DOLAR'
if found() then
	m.smoney=mocode
endif

sele tmpprov
go top
do while !eof()
	
	m.scedula=iif(len(alltrim(ciruc))=10 and valcedu(ciruc),ciruc,'')
	m.sruc=iif(len(alltrim(ciruc))=13 and valruc(ciruc),ciruc,'')
	m.sname=iif(len(alltrim(ciruc))=10,nombre,'')
	m.ssri=iif(len(alltrim(ciruc))=13,nombre,'')
	m.stag=substr(abrevia(nombre),1,4)+'-'+substr(abrevia(nombre),6,4)
	m.saddr=direcc
	m.snumcasa=iif(!empty(num),val(num),0)
	m.scode=cobsa
	m.isempleado = isempleado
	m.isproducto = isproduc
	m.stelf = telef
	
	sele datosgen
	go top
	locate for gtag='CIUD' and descripda=ALLTRIM(proveedo.ciudad)
	if found() then
		m.sciudad=iddato
	endif

	sele datosgen
	go top
	locate for gtag='PROV' and descripda=ALLTRIM(proveedo.PROVINCIA)
	if found() then
		m.sprov=iddato
	endif
*
	if empty(m.scode) then

		SELE secuencias
		GO TOP
		
		locate for substr(valorda,1,6)='CLIENT'
		IF FOUND() THEN
			ids=iddato
		else
			wait 'NO EXISTE SECUENCIA DE SUJETOS ' wind nowait
			exit
		endif
		fin=.f.
		do while !fin
			if sqlexec(nconec,"select numese + 1 as numero from secuencias " +;
				           "where idsecuencia = "+alup(ids)+" ;",'secuencial')<0 then
				do regerrbd
				wait 'Error al obtener codigo' wind nowait
				exit
			endif
				
			sele secuencial
			m.scode=numero
			if (sqlexec(nconec,"update secuencias set numese = "+alup(scode)+" where idsecuencia = "+;
				    alup(ids)+" ;")<0) then
			    wait 'Error en actualizacion de secuencia' wind nowait
			    do regerrbd
			    exit
			endif	
			sele proveedo
			seek m.scode
			if !found() then
				fin=.t.
			endif
		enddo
	endif
*	
	a=.f.
	sele tmpsuj 
	seek m.scode
	if !found() then
		appen blank
		a=.t.
	endif
	if a then
		replace scode 		with m.scode
		replace isempleado 	with m.isempleado
		replace isproveedo 	with m.isproveedo
		replace isproducto 	with m.isproducto
		replace iscliente	with m.iscliente
		replace emppro		with m.emppro
		replace sname		with m.sname
		replace ssri		with m.ssri
		replace scedula		with m.scedula
		replace sruc		with m.sruc
		replace spasaporte	with m.spasaporte
		replace saddr		with m.saddr
		replace saddr2		with m.saddr2
		replace stelf		with m.stelf
		replace sfax		with m.sfax
		replace scel		with m.scel
		replace smail		with m.smail
		replace swww		with m.swww
		replace smoney		with m.smoney
		replace sprov		with m.sprov
		replace ssaldo		with m.ssaldo
		replace scredito	with m.scredito
		replace scheques	with m.scheques
		replace sprotesto	with m.sprotesto
		replace stag		with m.stag
		replace idsujeto	with m.idsujeto
		replace sciudad		with m.sciudad
		replace snumcasa	with m.snumcasa
	else
		if !empty(m.ssri) then
			replace scode 		with m.scode
			replace isempleado 	with m.isempleado
			replace isproveedo 	with m.isproveedo
			replace isproducto 	with m.isproducto
			replace iscliente	with m.iscliente
			replace emppro		with m.emppro
			replace sname		with m.sname
			replace ssri		with m.ssri
			replace scedula		with m.scedula
			replace sruc		with m.sruc
			replace spasaporte	with m.spasaporte
			replace saddr		with m.saddr
			replace saddr2		with m.saddr2
			replace stelf		with m.stelf
			replace sfax		with m.sfax
			replace scel		with m.scel
			replace smail		with m.smail
			replace swww		with m.swww
			replace smoney		with m.smoney
			replace sprov		with m.sprov
			replace ssaldo		with m.ssaldo
			replace scredito	with m.scredito
			replace scheques	with m.scheques
			replace sprotesto	with m.sprotesto
			replace stag		with m.stag
			replace idsujeto	with m.idsujeto
			replace sciudad		with m.sciudad
			replace snumcasa	with m.snumcasa
		endif
	endif

	sele tmpprov
	skip
enddo

