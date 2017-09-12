q1="update detadocb set fecha=rubdoc(code,'fecha')::date "+;
	"where fecha isnull and code in (select code from documents) "
if !sqli(q1)
	=messagebox('Ocurrio un error al confirmar las fechas',0,empresa)
endif

q1="update detadocb set isaccount=rubdoc(code,'isaccount')='t' "+;
	" where code in (select code from documents) "
if !sqli(q1)
	=messagebox('Ocurrio un error al confirmar las contabilizaciones',0,empresa)
endif

q1="update detadocb set isanulado=rubdoc(code,'isanulado')='t' "+;
	" where code in (select code from documents) "
if !sqli(q1)
	=messagebox('Ocurrio un error al confirmar las contabilizaciones',0,empresa)
endif

wait 'Proceso de actualizacion exitoso' wind nowait