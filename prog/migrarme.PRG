close all
use tmpkarde in 0 exclu

use tmpitem in 0 exclu
sele tmpitem
zap

if sqlexec(nconec,"select * from datosgen order by gtag;",'datosgen') <0 then
	wait 'Error en datos generales' wind
	return
endif
if sqlexec(nconec,"select grudes, idgrupo from acti_inven  where  grutype=1 "+;
                   " order by grudes;",'contabil')<0 then
    wait 'Error en auxiliares' wind nowait
    return
endif

sele datosgen
go top
locate for gtag='TIAR' and descripda='MATERIAL DE EMBARQUE'
if found() then
	m.artgrupo=iddato
endif

sele contabil
go top
locate for grudes='MATERIAL DE EMBARQUE'
if found() then
	m.artsubgrupo=idgrupo
endif

sele datosgen
go top
locate for gtag='MAIT' and descripda='NINGUN'
if found() then
	m.artmarca=iddato
endif

m.artpeso=0
m.artfob=0
m.artcosto2=0
m.artfob2=0
m.artwin1=0
m.artwin2=0
m.artwin3=0
m.issell=.t.
m.isbuy=.t.
m.isfob=.f.
m.isreturn=.f.
m.imoney=2
m.isiva=.t.
m.itipo=1
sele datosgen
go top
locate for gtag='MAEM' and descripda='NINGUN'
if found() then
	m.artipo=iddato
endif

sele tmpkarde
go top
do while !eof()
	m.iname=nombre
	m.icode=codmat
	m.artcosto=costo
	m.itag=substr(nombre,1,6)
	
	sele datosgen
	go top
	locate for gtag='MEDI' and descripda=ALLTRIM(tmpkarde.UNIDAD)
	if found() then
		m.iunidad=iddato
	endif
	
	insert into tmpitem from memvar
	sele tmpkarde
	skip
enddo

