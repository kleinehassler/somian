if sqlexec(nconec,"select distinct * "+;
				"from viewvar "+;
				"where date(now())>=desde and date(now())<=hasta ;",'varhoy')<0 then
	wait 'Error al definir valores del iva, ice, etc.' wind nowait
	return
endif

sele varhoy
if reccount()>0 then
    sele  idvardiaria, max(desde) as desde, hasta, valor, variable, tipo ;
    	from varhoy ;
    	group by desde into cursor varhoy
	go top
	do while !eof()
		v=alltrim(variable)
		t=alltrim(tipo)
		do case 
			case t='N'
			    vd=val(varhoy.valor)
			case t='C'
			    vd=ALLTRIM(varhoy.valor)
			case tp='D'
			    v=ctod(alltrim(varhoy.valor))
			case t='L'
			    vd=iif(alltrim(varhoy.valor)='S','.t.','.f.')
		endcase
		wait v+'= '+varhoy.valor wind nowait
		public &v
		&v=vd
		skip
	enddo
	sele varhoy 
	use
else
	=messagebox('No existe variables definidas, comuniquese con el centro de computo',0,empresa)
endif
