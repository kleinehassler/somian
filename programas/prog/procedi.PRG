function creadsn

DECLARE Short SQLConfigDataSource IN ODBCCP32 Long hwndParent, Integer fRequest, String @lpszDriver, String @lpszAttributes
# DEFINE ODBC_ADD_DSN 4 && Agrega un Data Sourceln

Resp = SQLConfigDataSource( 0, ODBC_ADD_DSN, "PostgreSQL", ;
		"DSN=" + "PostgreSQL" + CHR(0) + ;
		"Database=" + "empresas" + CHR(0) + ;
		"Servername=" + "localhost" + CHR(0) + ;
		"Port=" + "5432" + CHR(0) + ;
		"UID=" + "postgres" + CHR(0) + ;
		"PWD=" + "postgres" + CHR(0) + ;
		"Protocol=" + "6.4" + CHR(0) + ;
		"TrueIsMinus1=" + "0" + CHR(0) + ;
		"BoolsAsChar=" + "0" + CHR(0) + ;
		"A7=" + "100" + CHR(0) + ;
		"A8=" + "4096" + CHR(0) + ;
		"B0=" + "254" + CHR(0) + ;
		"B1=" + "8190" + CHR(0) + ;
		"BI=" + "0" + CHR(0) + ;
		"C2=" + "dd_" + CHR(0) + ;
		"CX=" + "1b3a3" + CHR(0)  )

return resp=1

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql
************************************************
function alup
para x
do case
	case isnull(x)
		return 'NULL'
	case type('x')='N'
		if int(x)=x then
			return alltrim(str(int(x)))
		else
			return alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return "'"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return "'true'"
		else
			return "'false'"
		endif
	case type('x')='D'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif
endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye la coma al final de la 
*	cadena
************************************************
function al
para x
do case
	case isnull(x)
		return ', NULL'
	case type('x')='N'
		if int(x)=x then
			return ', '+alltrim(str(int(x)))
		else
			return ', '+alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return ", '"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return ", 'true' "
		else
			return ", 'false' "
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return ', null'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return ', null'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif
endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye al principio un parentesis
************************************************
function pal
para x
do case
	case isnull(x)
		return '( NULL'
	case type('x')='N'
		if int(x)=x then
			return '('+alltrim(str(int(x)))
		else
			return '( '+alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return "('"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return "('true'"
		else
			return "('false'"
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return '(null'
		else
			return "('"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return '( null'
		else
			return "('"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif

endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye al final un parentesis
*	cadena
************************************************
function ual
para x
do case
	case isnull(x)
		return ', NULL );'
	case type('x')='N'
		if int(x)=x then
			return ', '+alltrim(str(int(x)))+');'
		else
			return ', '+alltrim(str(x,18,6))+');'
		endif
	case type('x')='C'		
		return ", '"+alltrim(bsto2bs(x))+"');"
	case type('x')='L'		
		if x then
			return ", 'true'"+');'
		else
			return ", 'false'"+');'
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return ', null)'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'); "
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null);'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"');"
		endif

endcase	


function achar
para x
do case
	case isnull(x)
		return 'NULL'
	case type('x')='N' or type('x')='Y'
		if int(x)=x then
			return alltrim(str(int(x)))
		else
			return alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return alltrim(x)
	case type('x')='L'		
		if x then
			return 'true'
		else
			return 'false'
		endif
	case type('x')='D'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)
		endif
endcase	

******************************************************
*	Conversion de \ a \\ en una cadena de caractere
*	
******************************************************
function bsto2bs
para l
local i, j, a, b

j=len(alltrim(l)) 
if empty(l) then
	return l
endif
i=1
b=''
do while i<=j
	if substr(l,i,1)='\' then
		a=substr(l,1,i)+'\'
		b=substr(l,i+1,len(l))
		l=alltrim(a)+alltrim(b)
		i=i+1
		j=j+1
		if i=j then
			exit
		endif
	endif
	i=i+1
enddo
return l


******************************************************
*	Transformacion de fecha a letras
*	Formatos de Salida depende del parametro Tip:
*		Sin tip ==> dd de MMMMMMMMMMMMMM de YYYY
*		1 		==> DD de MMM de YYYY
*		2 		==> MMM-YYYY
*		3 		==> AAAAMMDD
*		4 		==> DD-MMM-YY
*		5 		==> DD-MMM-YYYY
******************************************************
function devfeclet
	parame pfechax, tip
	
	if empty(pfechax) or isnull(pfechax)
		return ''
	endif

	local mm, mms	
	mm=month(pfechax)
	mms=''
	do case
	case mm=1
		mms='Enero'
	case mm=2
		mms='Febrero'
	case mm=3
		mms='Marzo'
	case mm=4
		mms='Abril'
	case mm=5
		mms='Mayo'
	case mm=6
		mms='Junio'
	case mm=7
		mms='Julio'
	case mm=8
		mms='Agosto'
	case mm=9
		mms='Septiembre'
	case mm=10
		mms='Octubre'
	case mm=11
		mms='Noviembre'
	case mm=12
		mms='Diciembre'
	endcase
	if empty(tip) or isnull(tip) then	

		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+' de '+mms+iif(year(pfechax)>=2000,' del ',' de ')+;
				alltrim(str(year(pfechax)))

	endif
	do case 
	case tip=1 
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+substr(mms,1,3)+'-'+alltrim(str(year(pfechax)))
	case tip=2
		return substr(mms,1,3)+'-'+alltrim(str(year(pfechax)))
	case tip=3
		return alltrim(str(year(pfechax)))+;
			   iif(month(pfechax)<10,'0','')+alltrim(str(month(pfechax)))+;
			   iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))
	case tip=4
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+;
				substr(mms,1,3)+'-'+;
				alltrim(iif(mod(year(pfechax),100)<10,'0','')+alltrim(str(mod(year(pfechax),100))))
	case tip=5
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+;
				substr(mms,1,3)+'-'+;
				alltrim(str(year(pfechax)))

	endcase

******************************************************
*	Transformacion de fecha a formato DD-MMM-AA
******************************************************
function fecdma
	parame fecha
	local dia
	dia=day(fecha)
	frase=iif(dia<10,"0"+alltrim(str(dia)),alltrim(str(dia)))+'-'+;
	      substr(cmonth(fecha),1,3)+'-'+;
	      substr(alltrim(str(year(fecha))),3,2)
	return frase
	
******************************************************
*	Transformacion de fecha a formato DD-MMM-AAAA
******************************************************
function fecdmaa
	parame fecha
	local dia
	dia=day(fecha)
	frase=iif(dia<10,"0"+alltrim(str(dia)),alltrim(str(dia)))+'-'+;
	      substr(cmonth(fecha),1,3)+'-'+;
	      alltrim(str(year(fecha)))
	return frase

******************************************************
*	Codigo Contable en formato XX.XX.XX.XX.XXXX
******************************************************
function CCCPUNTO
	parame cuenta,auxiliar
	local g1, g2, g3, g4, g5, aux
	g1=" "
	g2=" "
	g3=" "
	g4=" "
	g5=" "
	aux=" "
	g1=alltrim(substr(cuenta,2,2))
	g2=alltrim(substr(cuenta,4,2))
	g3=alltrim(substr(cuenta,6,2))
	g4=alltrim(substr(cuenta,8,2))
	g5=alltrim(substr(cuenta,10,2))
	aux=alltrim(auxiliar)
	
	fraspc=g1
	if val(g2)!=0 then
		fraspc=fraspc+"."+g2
	endif
	if val(g3)!=0 then
		fraspc=fraspc+"."+g3
	endif
	if val(g4)!=0 then
		fraspc=fraspc+"."+g4
	endif
	if val(g5)!=0 then
		fraspc=fraspc+"."+g5
	endif
	if val(aux)!=0 then
		fraspc=fraspc+"."+aux
	endif
	return frase

******************************************************
*	Transformacion de Numeros a Letras
******************************************************
function devnumlet
	para numero	
	local num2, cnum, pos1, exp3, exp4, sw, sw1, digito, digant, digsig, digsi2, exp1
	num2=numero-int(numero)
	num2=num2*100
	cnum=alltrim(str(int(numero)))
	long=len(cnum)
	pos1=long
	exp3=" "
	do while pos1>0
	    sw=.f.
	    sw1=.f.
	    digito=substr(cnum,long-pos1+1,1)
	    if long-pos1> 0 then
	        digant=substr(cnum,long-pos1,1)
	    else 
	        digant="*"
	    endif
	    
		if pos1 > 1 then
			digsig=substr(cnum,long-pos1+2,1)
		else 
		    digsig="*"
		endif
		if pos1 > 2 then
			digsi2=substr(cnum,long-pos1+3,1)
	    else
	        digsi2="*"
	    endif
	    if digsig!="0" and (pos1=2 or pos1=5 or pos1=8) and digito!="1" and digito!='0' and digito!="2" then
			   exp2="y"
		else
			   exp2=" "
		endif
		do case
		   case digito="0"
		        exp1=""
		   case digito="1"
		   	    do case
		   	       case pos1=3 or pos1=6 or pos1=9
		   	            if (digsig="0") and (digsi2="0") then
		   	               sw1=.t.
		   	               exp1="cien"
		   	            else
		   	               exp1="ciento"
		   	            endif
		   	       case pos1=2 or pos1=5 or pos1=8
		   	            sw=.t.
		   	            do case
		   	               case digsig="0"
		   	                    exp1="diez"
		   	               case digsig="1"	
		   	                    exp1="once"
		   	               case digsig="2"	
		   	                    exp1="doce"
		   	               case digsig="3"	
		   	                    exp1="trece"
		   	               case digsig="4"	
		   	                    exp1="catorce"
		   	               case digsig="5"	
		   	                    exp1="quince"
		   	               case digsig="6"	
		   	                    exp1="dieciseis"
		   	               case digsig="7"	
		   	                    exp1="diecisiete"
		   	               case digsig="8"	
		   	                    exp1="dieciocho"
		   	               case digsig="9"	
		   	                    exp1="diecinueve"
		   	            endcase   
		   	       case pos1=1 or pos1=4 or pos1=7
		   	       		if pos1=1 then
		   	            	exp1="uno"
		   	            else
		   	            	if pos1=7 then
		   	            		exp1="un"
		   	            	else
		   	            		exp1=""
		   	            	endif
		   	            endif
		   	   endcase    
		   case digito="2"
		   	        do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="dos cientos"
		   	           case pos1=2 or pos1=5 or pos1=8 
		   	   *             exp1="veinte"
			   	            sw=.t.
			   	            do case
			   	               case digsig="0"
			   	                    exp1="veinte"
			   	               case digsig="1"	
			   	                    exp1="veintiuno"
			   	               case digsig="2"	
			   	                    exp1="veintidos"
			   	               case digsig="3"	
			   	                    exp1="veintitres"
			   	               case digsig="4"	
			   	                    exp1="veinticuatro"
			   	               case digsig="5"	
			   	                    exp1="veinticinco"
			   	               case digsig="6"	
			   	                    exp1="veintiseis"
			   	               case digsig="7"	
			   	                    exp1="vientisiete"
			   	               case digsig="8"	
			   	                    exp1="veintiocho"
			   	               case digsig="9"	
			   	                    exp1="veintinueve"
			   	            endcase   
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="dos"
		   	        endcase
		   case digito="3"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="tres cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="treinta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="tres"
		   	        endcase
		   case digito="4"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="cuatro cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="cuarenta "
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="cuatro"
		   	        endcase
		   case digito="5"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="quinientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="cincuenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="cinco"
		   	        endcase
		   case digito="6"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="seis cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="sesenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="seis"
		   	        endcase
		   case digito="7"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="setecientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="setenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="siete"
		   	        endcase
		   case digito="8"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="ocho cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="ochenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="ocho"
		   	        endcase
		   case digito="9"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="novecientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="noventa"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="nueve"
		   	        endcase   
		endcase
		exp4=" "

		if pos1=7 and digant!="1" then
	   		exp4="millones"
		endif
		if pos1=8 or (pos1=9 and digsig="0" and digsi2="0") then
	   		exp4="millones"
		endif
		if pos1=7 and digito="1" then
		   exp4="millon"
		endif
		
		if ((pos1=5 and sw)  or (pos1=6 and digsig='0' and digsi2='0' and digito!='0') or ;
			(pos1=5 and digsig='0' and digito!='0') or (pos1=4 and digito!='0')) then
		   exp4="mil"
		endif
		       
		if sw then
		   pos1=pos1-2
		else
		   if sw1 then
		      pos1=pos1-3
		   else
		      pos1=pos1-1
		   endif
		endif
		if exp4!=" " then
			exp3=alltrim(exp3)+" "+alltrim(exp1)+" "+exp4+" "+exp2
		else
		    exp3=alltrim(exp3)+" "+alltrim(exp1)+" "+exp2
		endif
	enddo	  
	if num2>0 then
		exp3=alltrim(exp3)+", "+iif(num2<10,'0','')+alltrim(str(num2))+"/100"
	else
	    exp3=alltrim(exp3)+", "+"00/100"
	endif
    return exp3


***********************************************
* CONTROL DE ACCESO A UN PROGRAMA
***********************************************
function acceso
para keyprog
if !programas() then
	return .f.
endif
locate for idprograma=keyprog
if found() and estapro='1' then
	if !accesos() then
		return .f.
	endif
	locate for idprograma=keyprog and idusuario=ide
	if found() then
		return .t.	
	else
		return .f.
	endif
else
	wait 'Este programa está inactivo' wind nowait
	return .f.
endif

***********************************************
*	CONTROLA SI UN CAMPO ESTA VACIO
***********************************************
function isvacio
para x
if isnull(x) then
	return .t.
else
	if empty(x) then
		return .t.
	else
		return .f.
	endif
endif	

******************************************************
*	Determinar La lista de rubros
******************************************************
function lista 
para frasx
local l,swl,frase1,i
FRASx=ALLTRIM(FRASx)
L=LEN(ALLTRIM(FRASx))
SWL=.f.
FRASE1=''
FOR I=1 TO L 
	IF SUBSTR(FRASx,I,1)='[' THEN
			SWL=.t.
	ENDIF	
	IF SWL THEN
		FRASE1=FRASE1+SUBSTR(FRASx,I,1)
	ENDIF
	IF SUBSTR(FRASx,I,1)=']' THEN
			SWL=.f.
	ENDIF	
ENDFOR
FRASE1=CHRTRAN(FRASE1,']',',')
FRASE1=CHRTRAN(FRASE1,'[()./*+-','')
L=LEN(ALLTRIM(FRASE1))
IF SUBSTR(FRASE1,L,1)=',' THEN
	FRASE1=SUBSTR(FRASE1,1,L-1)
ENDIF
return FRASE1

******************************************************
*	Determinar la formula del rubro
******************************************************
function formula
para frse
local  l, frse1, i, c, frse2
FRSE=ALLTRIM(FRSE)
L=LEN(ALLTRIM(FRSE))
FRSE1=''
FOR I=1 TO L 
	c=SUBSTR(FRSE,I,1)
	IF c='[' THEN
		FRSE1 = FRSE1 + c + 'v'
	else 
		FRSE1 = FRSE1 + c
	ENDIF	
ENDFOR
L=LEN(ALLTRIM(FRSE1))
frse2=''
FOR I=1 TO L 
	c=SUBSTR(FRSE1,I,1)
	IF c!='[' and c!=']' THEN
		FRSE2 = FRSE2 + c
	ENDIF	
ENDFOR
return FRSE2

************************************************
*	Calculo de Rubros
************************************************
function calculorub
	para formu, area
	local k, m, campo, r
	k = lista(formu)
	m = formula(formu)
	

	select * from &area where rubcode in(&k) into cursor adj
	sele adj
	go top
	do while !eof() 
		campo='v'+alltrim(str(rubcode))
		&campo=valor
		skip
	enddo
	sele adj
	use
	if !empty(area) then
		select &area
	endif
	select &area
	r = 0
	r = iif(type(m)='U',0,&m)
	return r
		
**************************************	
* VALIDACIONDE LA CEDULA
**************************************	
function valcedu
para x
local c, prov, terd, t, i, j, u

	if empty(x) then
		wait 'Sin Cedula' wind nowait
		return .f.
	endif
	if type('x')='N' then
		if x=9999999999 then
			return .t.
		endif
		if len(alltrim(str(x)))<9 then
			wait 'Numero incompleto' wind  nowait
			return .f.
		else
			if len(alltrim(str(x)))=9 then
				c='0'+alltrim(str(x))
			else
				if len(alltrim(str(x)))=10 then
					c=alltrim(str(x))
				else
					wait 'Cedula errada' wind  nowait
					return .f.
				endif
			endif
		endif
	else
		if type('x')='C' then
			if x='9999999999' then
				return .t.
			endif
			c=alltrim(x)
		else
			wait 'Tipo incorrecto' wind nowait
			return .f.
		endif
	endif

**************************
* Codigo Provincia
**************************
	prov=val(substr(c,1,2))
	if prov<1 or prov>22 then
		return .f.
	endif
**************************
*   Tercer Digito
**************************
	terd=val(substr(c,3,1))
	if terd>5 then
		return .f.
	endif

**************************

	t=0
	for i=1 to 9 step 2
		d=substr(c,i,1)
		do case
			case d='1'
				t=t+2
			case d='2'
				t=t+4
			case d='3'
				t=t+6
			case d='4'
				t=t+8
			case d='5'
				t=t+1
			case d='6'
				t=t+3
			case d='7'
				t=t+5
			case d='8'
				t=t+7
			case d='9'
				t=t+9
		endcase
	endfor
	for i=2 to 8 step 2
		j=val(substr(c,i,1))
		t=t+j
	endfor
	u=val(substr(c,10,1))
	if (mod(t,10)+u)=10 or (mod(t,10)+u)=0 then
		return .t.
	else
		return .f.
	endif
		
**********************************
* Validacion del RUC
**********************************
function valruc
para pcedula

local suma, residuo, natural, juridica, publica, numprovincias, todocorrecto

Suma=0
Residuo=0
Natural=.f.
Juridica=.f.
Publica=.f.

NumProvincias = 22
todocorrecto="N"
    
    If Len(alltrim(Pcedula)) >= 10 Then
        c1 = val(substr(Pcedula, 1, 1))
        c2 = val(substr(Pcedula, 2, 1))
        c3 = val(substr(Pcedula, 3, 1))
        c4 = val(substr(Pcedula, 4, 1))
        c5 = val(substr(Pcedula, 5, 1))
        c6 = val(substr(Pcedula, 6, 1))
        c7 = val(substr(Pcedula, 7, 1))
        c8 = val(substr(Pcedula, 8, 1))
        c9 = val(substr(Pcedula, 9, 1))
        C10 =val(substr(Pcedula, 10, 1))
        
        do case 
            Case c3 < 6
                Natural = .t.
            Case c3 = 6
                Publica = .t.
            Case c3 = 9
                Juridica = .t.
        Endcase
            
        If Natural = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                p1 = c1 * 2
                p2 = c2 * 1
                p3 = c3 * 2
                p4 = c4 * 1
                p5 = c5 * 2
                p6 = c6 * 1
                p7 = c7 * 2
                p8 = c8 * 1
                p9 = c9 * 2
                P10 = C10 * 1
                If p1 >= 10 Then
                     p1 = p1 - 9
                endif
                If p2 >= 10 Then
                     p2 = p2 - 9
                endif
                If p3 >= 10 Then
                     p3 = p3 - 9
                endif
                If p4 >= 10 Then
                     p4 = p4 - 9
                endif
                If p5 >= 10 Then
                     p5 = p5 - 9
                endif
                If p6 >= 10 Then
                     p6 = p6 - 9
                endif
                If p7 >= 10 Then
                     p7 = p7 - 9
                endif
                If p8 >= 10 Then
                     p8 = p8 - 9
                endif
                If p9 >= 10 Then
                     p9 = p9 - 9
                endif
                If P10 >= 10 Then
                     P10 = P10 - 9
                endif
                Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + P10
                Residuo = mod(Suma,10)
            
                
                If Len(alltrim(Pcedula)) = 10 Then
                    If Residuo = 0 Then
						wait "La cedula es valida." wind nowait
                         Todocorrecto = "S"
                    Else
                         wait "La cedula no es valida." wind nowait
                         Todocorrecto = "N"
                    endif
                Else
	                If Len(alltrim(Pcedula)) > 10 Then
	                    If Residuo = 0 Then
	                         If val(substr(Pcedula, 11, 3)) = 1 And Len(substr(Pcedula, 11, 3)) = 3 Then
	                            If Len(alltrim(substr(Pcedula, 11, 3))) = Len(substr(Pcedula, 11, 3)) Then
	                                wait "El ruc es valido." wind nowait
	                                Todocorrecto = "S"
	                            Else
	                                wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                                Todocorrecto = "N"
	                            endif
	                         Else
	                             wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                            Todocorrecto = "N"
	                         endif
	                    Else
	                       * 'If val(substr(Pcedula, 11, 3)) = 1 And Len(substr(Pcedula, 11, 3)) = 3 And val(substr(Pcedula, 1, 2)) >= 1 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
	                       * 'OJO SE AUMENTA ESTA LÍNEA
	                        If Residuo = 0 Then
	                            If Len(alltrim(substr(Pcedula, 11, 3))) = Len(substr(Pcedula, 11, 3)) Then
	                                wait "El ruc es valido." wind nowait
	                                Todocorrecto = "S"
	                            Else
	                                wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                                Todocorrecto = "N"
	                            endif
	                         Else
	                            wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                            Todocorrecto = "N"
	                         endif
	                    
	                    endif
 					endif               
                endif 
                
            Else
                Todocorrecto = "N"
                wait "Ruc de Persona Natural incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait
            endif
        endif 
        
        If Juridica = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                If Len(alltrim(Pcedula)) = 13 Then
                    p1 = c1 * 4
                    p2 = c2 * 3
                    p3 = c3 * 2
                    p4 = c4 * 7
                    p5 = c5 * 6
                    p6 = c6 * 5
                    p7 = c7 * 4
                    p8 = c8 * 3
                    p9 = c9 * 2
                    Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9
                    
                    ValDivision = Int(Suma / 11)
                    ValMultiplicacion = ValDivision * 11
                    VALRESTA = Suma - ValMultiplicacion 
                    
                    If VALRESTA = 0 Then
                        digitoverificador = 0
                    Else
                        digitoverificador = 11 - VALRESTA
                    endif
                 
                    If digitoverificador = C10 And val(substr(Pcedula, 11, 3)) = 1 Then
                       Todocorrecto = "S"
                       wait "Número de Ruc correcto" wind nowait
                    Else
                        Todocorrecto = "N"
                        wait "Número de Ruc correspondiente a Persona Jurídica es incorrecta, por favor verificar" wind nowait
                    endif
                endif
            Else
                Todocorrecto = "N"
                wait "Ruc de Persona Jurídica incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait 
            endif
        endif
        
        If Publica = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                If Len(alltrim(Pcedula)) = 13 Then
                    p1 = c1 * 3
                    p2 = c2 * 2
                    p3 = c3 * 7
                    p4 = c4 * 6
                    p5 = c5 * 5
                    p6 = c6 * 4
                    p7 = c7 * 3
                    p8 = c8 * 2
                    Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8
                    ValDivision = Int(Suma / 11)
                    ValMultiplicacion = ValDivision * 11
                    VALRESTA = Suma - ValMultiplicacion
                    digitoverificador = 11 - VALRESTA
                    If c9 = digitoverificador And val(substr(Pcedula, 10, 4)) > 0 And val(substr(Pcedula, 11, 3)) = 1 Or VALRESTA = 0 Then
                       Todocorrecto = "S"
                    Else
                        wait "Número de Ruc correspondiente a Empresas del Sector Público es incorrecta, por favor verificar" wind nowait
                        
                        Todocorrecto = "N"
                    endif
                endif
            Else
                Todocorrecto = "N"
                wait "Ruc de Empresas del Sector Público incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait
            endif
        endif
    Else
        wait "Numero de Documento no válido." wind nowait
        Todocorrecto = "N"
    endif
	
***********************************************
*	Tipo de Letra a ser Utilizado
***********************************************
function tipolet
para f
local lon, u, i
	f=alltrim(f)
	lon=len(f)
	if lon > 0 then
		u=0
		for i=1 to lon
			if substr(f,i,1) = ',' then
				u=i-1
				exit
			endif
		endfor
		if u=0 then
			return f
		else
			return substr(f,1,u)
		endif
	else
		return 'Times New Roman'
	endif
		
***********************************************
*	Formato del codigo contable
***********************************************
function fcodcon
para c,n
local i, k, frcp
c=alltrim(c)
if isnull(c) then
	return .f.
endif
if empty(c) then
	return .f.
endif

k=val(alltrim(substr(c,1,2)))

if k=0 then
	return .f.
endif

frcp=alltrim(str(k))

if iif(!empty(n),n=2,.f.) and k=1 then
	frcp=frcp+'.0'+alltrim(str(val(alltrim(substr(c,3,2)))))
else
	frcp=frcp+iif(val(alltrim(substr(c,3,2)))=0 ,' ','.0'+alltrim(str(val(alltrim(substr(c,3,2))))))
endif

for i=2 to 6
	k=val(alltrim(substr(c,i*2+1,2)))
	if k>0 then
		frcp=frcp+'.'+iif(k<10,'0'+alltrim(str(k)),alltrim(str(k)))
	else
		frcp=frcp+'  '
	endif
endfor
return frcp

***********************************************
*	Validacion de la fecha comprendida 
*	en el periodo contable
***********************************************
function valfec
para f
wait devfeclet(f) wind nowait
return f<=ffinp and f>=finip

***********************************************
*	Devolver la abreviacion de una frase
***********************************************
function abrevia
para f, d
local i, l, esw, fr, k, m, e
e=iif(empty(d) or isnull(d),4,d)
if type('f')!='C' then
	return ''
endif
i=1
l=len(alltrim(f))
esw=.t.
fr=''
do while i<l
	if esw then
		if i+e>l then
			k=(l-i)+1
		else
			for m=0 to e-1 
				if substr(f,i+m,1)=' ' or substr(f,i+m,1)='.' then
					exit
				endif
			endfor
			k=m
		endif
		fr=fr+substr(f,i,k)+' '
		i=i+k
		esw=.f.
	else
		i=i+1
	endif
	if substr(f,i,1)=' ' or substr(f,i,1)='.' then
		i=i+1
		esw=.t.
	endif
enddo
return fr

***********************************************
*	DIAS DEL MES
***********************************************
FUNCTION DIASMES
PARA NMESP,NAÑOP
IF NMESP=0 OR NMESP>12 THEN
	RETURN 0
ENDIF
IF NAÑOP<1993 OR NAÑOP>2019 THEN
	RETURN 0
ENDIF

DO CASE 
CASE NMESP=1 OR NMESP=3 OR NMESP=5 OR NMESP=7 OR NMESP=8 OR NMESP=10 OR NMESP=12
	RETURN 31
CASE NMESP=4 OR NMESP=6 OR NMESP=9 OR NMESP=11
	RETURN 30
CASE NAÑOP=1996 OR NAÑOP=2000 OR NAÑOP=2004 OR NAÑOP=2008 OR NAÑOP=2012 OR NAÑOP=2016
	RETURN 29
OTHER
	RETURN 28
ENDCASE
************************************************************************************
*	Devuelve un Nombre unico de 8 caracteres
************************************************************************************	
function nomunico
local eq
eq=''
eq=substr(sys(0),1,1)
if eq=' ' then
	eq=substr(sys(2015),6,4)
endif
return	alltrim(eq)+alltrim(substr(sys(2015),3,8))

***********************************************
*	MANEJO DE ERRORES EN LA PROGRAMACION
***********************************************
procedure manejo_err

x=1
=fintransq() && si se esta ejecuntando alguna transaccion, cancelarla.

merror	= ERROR( )
mess	= MESSAGE( )
mprog	= PROGRAM( )
mlineno	= LINENO( )

*? 'Número de línea del error: ' + mlineno
*? 'Programa con error: ' + mprog

=messagebox('Error : ' + mess,0,empresa)
do regerrbd
if type('_screen.activeform')#'U' then
	_screen.activeform.release
endif
if type('tbrdesktop')='O' and !isnull(tbrdesktop) then
	= tbrDesktop.cancelar1.click()
endif

***********************************************
*	REGISTRO DE ERRORES ODBC
***********************************************
procedure regerrbd
local cm
if used('errorbd') then
	sele errorbd
else
	sele 0
	use errorbd  share
endif
appen blank
e=sys(2018)
replace user with usuario
replace fecha   with datetime()
replace comandosql 	with iif(empty(e),MESSAGE( ),e)
replace ws	with equipo
replace q2 	with substr(q1,1,200)
replace q3 	with substr(q1,201,400)
replace q4 	with substr(q1,401,600)
replace q5 	with substr(q1,601,800)
replace progmaes with sys(16,1)
return

***********************************************
*	Borra registros duplicados en una tabla 
*	temporal, recibe como parametro:
*	- Nombre de la tabla
*	- Nombre del campo a verificarse
***********************************************
procedure borreg
parame nt, kt
local p, cod, fe, numrub, nomt, keyt, f

nomt=nt
keyt=kt
numrub=0
f=nomt+'.'+keyt

if &f#0 then
	_screen.activeform.grid1.recordsource=''
	sele &nomt

	cod=&f
	f=f+"=cod"
	count for &f to numrub

	if numrub>1 then
		go top
		f=keyt+'=cod'
		locate for &f
		_screen.activeform.gridremoveitem()
	endif
	
	sele &nomt
	go top
	locate for &f
	if !found() then
		go bott
	endif
	_screen.activeform.grid1.recordsource=nomt
endif
_screen.activeform.grid1.DoScroll(0)
_screen.activeform.grid1.refresh()
return

***********************************************
*	Procedimiento q no hace nada
***********************************************
procedure nada
return

***********************************************
*	Define algunas configuraciones del entorno
***********************************************
procedure ambiente
SET DATE TO DMY
SET CENTURY ON
SET SAFE OFF
set exclu off
set talk off
set dele on
set point to '.'
set separator to ',' 
set decimal to 8
SET COMPATIBLE OFF

***********************************************
*	Funcion q devuelve un numero rellenados con
*	ceros a la izquierda, recibe dos parametros
*	- La longuitud de la expresion q veduelve
*	- El numero q va a ser rellenado con ceros
*	La expresion devuelta es de tipo character
***********************************************
Function Nconcero
para l, nxf
local n
if empty(nxf) or isnull(nxf) then
	n=0
endif
do case 
case type('nxf')='C'
	n=int(val(nxf))
case type('nxf')='N' 
	n=nxf
case type('nxf')='D' 
	n=day(nxf)*1000000+month(nxf)*10000+year(nxf)
other 
	n=0
endcase


return padl(ltrim(str(n)),l,'0') && substr(repli('0',l),1,l-len(alltrim(str(n,20))))+alltrim(str(n,20))

*****************************************************************************************
*	Formar el Numero del Documento 
*****************************************************************************************
function fnumdoc
para n,f,t
do case
case t=1
	return nconcero(7,n)
case t=2
	return alltrim(str(year(f))) + '-'+ nconcero(5,n)
case t=3 
	return iif(mod(year(f),100)<10,'0','') + alltrim(str(mod(year(f),100))) + iif(month(f)<10,'0','') + alltrim(str(month(f))) + '-' + nconcero(5,n)
other
	return nconcero(7,n)
endcase

*****************************************************************************************
*	Ver los errores ocurridos
*****************************************************************************************
procedure verror
if used('errorbd') then
	sele errorbd
else
	sele 0
	use errorbd
endif

set filter to
set filter to ttod(fecha)=date()
=ireport('errorbd')

*****************************************************************************************
*	Impresion de reportes
*	Parametros:
*		xrep => Nompre del reporte
*		xres => Resumen? (.t.)
*****************************************************************************************
function ireport

parameter pxrep, pxres, palias, pdocu

if printofil 
	do form reportefrx WITH pxrep, pxres, palias
else
	local i, d, r
	i=0
	d=0

	if empty(pxrep) then
		return .f.
	endif

	if type('pxres')#'L' then
		pxres=.f.
	endif

	if reccount()=0 then
		wait 'No existen Registros' wind nowait
		return .t.
	endif

	if pxres then
		r='summary'
	else
		r=''
	endif
	
	if pdocu and !confimp
		if !empty(impresora) and !isnull(impresora)
			SET PRINTER TO NAME alltrim(impresora)
			report form &pxrep nowait to printer nocons &r
			set printer to default
		else
			report form &pxrep nowait to printer promp nocons &r
		endif
	else
		do while i<>6
			d=messagebox('Lo Envia a Pantalla?',35,empresa)
			do case
			case d=6
				wait 'Espere un momento...' wind nowait
				report form &pxrep preview nocons &r
			case d=7
				wait 'Espere un momento...' wind nowait
				report form &pxrep nowait to printer prompt nocons &r
			endcase
			if d=2 then
				i=6
			else
				i=messagebox('Imprimió correctamente',36)
			endif
		enddo
	endif
endif

***********************************************************************************
*	Encriptacion
***********************************************************************************
function conversion
para f
na=rand()*100-1
c3=iif(na<10,'0','')+ALLTRIM(str(na))+alltrim(str(mod(mod(mod(DAY(F),30),20),10)))
nd=mod(mod(mod(mod(DAY(F),30),20),10),2)
IF nd=1 THEN
	aa=alltrim(str(year(f)))
	mm=iif(month(f)<10,'0','') + alltrim(str(month(f)))
	dd=iif(day(f)<10,'0','') + alltrim(str(day(f)))
	l=aa+mm+dd
	RETURN c3+chrtran(l,'1234567890','DANIEL.XYZ')
ELSE
	aa=alltrim(str(year(f)))
	mm=iif(month(f)<10,'0','') + alltrim(str(month(f)))
	dd=iif(day(f)<10,'0','') + alltrim(str(day(f)))
	l=mm+dd+aa
	RETURN c3+chrtran(l,'1234567890','PARDO.TUVW')
ENDIF

***********************************************************************************
*	Desifrado de Enpcriptacion
***********************************************************************************
function reversion
para j
nd=int(val(substr(j,3,1)))
IF MOD(nd,2)=1 THEN
	m=chrtran(substr(J,4,8),'DANIEL.XYZ','1234567890')
	aa=int(val(substr(m,1,4)))
	mm=int(val(substr(m,5,2)))
	dd=int(val(substr(m,7,2)))
else
	m=chrtran(substr(J,4,8),'PARDO.TUVW','1234567890')
	mm=int(val(substr(m,1,2)))
	dd=int(val(substr(m,3,2)))
	aa=int(val(substr(m,5,4)))
endif
return date(aa,mm,dd)

***********************************************************************************
*	Verificar Licencia
***********************************************************************************
function verilicen
para fl, c

return .t.

IF !FILE('licen.dbf')
	=messagebox('Su liencia a expirado, por favor contacte al proveedor',0)
	return .f.
ENDIF

if !used('licen') then
	sele 0
	use licen
endif
sele licen
if reccount()=0 then
	=messagebox('Su liencia a expirado, por favor contacte al preveedor',0)
	return .f.
endif

SELE MAX(REVERSION(dato)) AS FC FROM licen INTO CURSOR ULTF

IF FC<fl THEN
	=messagebox('Su liencia a expirado, por favor contacte al preveedor',0)
	return .f.
ENDIF

SELE ULTF
USE
SELE LICEN
USE
return .t.

*****************************************************************************************
*	Rellenar los valores del debe y el haber, un parametro opcional, como para saldo
*	Parametro el nombre de la tabla que se requiere rellenar, devuelve el nombre del 
*	cursor, con los campos rellenados
*****************************************************************************************
function rellenadh
para t, c1, c2, c3
local m, n, ct1, ct2, ct3, na, nx

m=nomunico()
n=nomunico()
o=nomunico()
if empty(t) or isnull(t) or empty(c1) or isnull(c1) or empty(c2) or isnull(c2) then
	wait 'No existen nombre de tabla o campos que acumular' wind nowait
	return .f.
endif

if !used(t) then
	return .f.
endif
sele &t
if reccount()=0 then
	return .f.
endif
sele * from &t ;
	into table &m ;
	order by plannivel desc
 
sw=.t.
sele max(plannivel) as nivel from &t into cursor tx
sele tx
if reccount()=0
	use
	return .f.
else
	nx=nivel
	use
endif
sele &m
go top
p=recno()
na=plannivel
do while !eof()
	if isnull(idaux) then
		sele &m
		cp=alltrim(plancod)
		if empty(c3) or isnull(c3) then
			sele sum(&c1) as &c1, sum(&c2) as &c2 ;
				from &m ;
				where plannivel=na+1 and like(cp+'*',plancod) ;
				into cursor  &n
			sele &n

			ct1=&c1
			ct2=&c2

			sele &m
			go top
			go p
			replace &c1 with iif(isnull(ct1),0,ct1)
			replace &c2 with iif(isnull(ct2),0,ct2)
		else
			sele sum(&c1) as &c1, sum(&c2) as &c2, sum(&c3) as &c3 ;
				from &m ;
				where plannivel=na+1 and like(cp+'*',plancod) ;
				into cursor  &n
			sele &n

			ct1=&c1
			ct2=&c2
			ct3=&c3

			sele &m
			go top
			go p
			replace &c1 with iif(isnull(ct1),0,ct1)
			replace &c2 with iif(isnull(ct2),0,ct2)
			replace &c3 with iif(isnull(ct3),0,ct3)
	
		endif
	else
		if isnull(&c1) then
			replace &c1 with 0
		endif
		if isnull(&c2) then
			replace &c2 with 0
		endif
		if !(empty(c3) or isnull(c3)) then
			if isnull(&c3) then
				replace &c3 with 0
			endif
		endif
	endif
	sele &m
	skip
	p=recno()
	na=plannivel
enddo

sele &n
use
sele * from &m order by plancod into cursor &o
sele &m
use

return o

function swadmin
local a
a=.f.
do form claveadm to a
return a

**********************************************************************

function diastrab
para fech, feci, fecs
local i, f, a

if empty(fecs) or isnull(fecs)
	fecs=fech
endif

if (fech=date(2008,02,29) and feci=date(2008,02,01)) or (fech=date(2012,02,29) and feci=date(2012,02,01))
	return 30
endif

if (feci<=fech - DAY(fech )+ 1) and (isnull(fecs) or empty(fecs)) 
	return 30
endif


if fecs<feci
	return 0
endif
if fecs=feci
	return 1
endif

if feci>fech-DAY(fech )+ 1
	i=feci
else
	i=fech - DAY(fech )+ 1

endif

if fecs< GOMONTH((fech - DAY(fech ) + 1),1)
	f=fecs
else
	f=GOMONTH((fech - DAY(fech ) + 1),1)
endif

a=0

do case
case month(fech)=2
	a=3
case month(fech)=3 or month(fech)=4 or month(fech)=6 or month(fech)=9 or month(fech)=11
	a=1
case month(fech)=1 or month(fech)=5 or month(fech)=7 or month(fech)=8 or month(fech)=10 or month(fech)=12
	a=0
endcase

if fecs<GOMONTH((fech - DAY(fech ) + 1),1)-1
	a=1
endif
	
return iif(f-i+a=0,1,iif(f-i+a>=31,30,f-i+a))

***************************************************************************************
function abreviacta
para nomcta

nomctares=nomcta

nomctares=STRTRAN(nomctares, ' POR ', ' X ')
nomctares=STRTRAN(nomctares, ' DE ', ' ')
nomctares=STRTRAN(nomctares, 'CUENTA ', 'CTA ')
nomctares=STRTRAN(nomctares, 'CUENTAS ', 'CTAS ')
nomctares=STRTRAN(nomctares, 'DOCUMENTO', 'DOC')
nomctares=STRTRAN(nomctares, 'DESCUENTO', 'DSCTO')
nomctares=STRTRAN(nomctares, 'CONSIGNACION', 'CONSIG')
nomctares=STRTRAN(nomctares, 'PENDIENTE', 'PENDTE')
nomctares=STRTRAN(nomctares, 'CHEQUE', 'CHQ')
nomctares=STRTRAN(nomctares, 'IMPUESTO ', 'IMP ')
nomctares=STRTRAN(nomctares, 'RETENCION ', 'RET ')
nomctares=STRTRAN(nomctares, 'FUENTE ', 'FTE ')
nomctares=STRTRAN(nomctares, 'GASTOS ', 'GTOS ')
return nomctares

Function RestarHoras
Parameter chora1,chora2
m.hora1 = SUBSTR(chora1,1,2)+":"+SUBSTR(chora1,3,2)
m.hora2 = SUBSTR(chora2,1,2)+":"+SUBSTR(chora2,3,2)

Horas1 = Val(Substr(m.hora1,1,2)) * 60
Minutos1 = Val(Substr(m.hora1,4,2)) * 60
Segundos1 = Val(Substr(m.hora1,7,2)) * 60
Horas2 = Val(Substr(m.hora2,1,2)) * 60
Minutos2 = Val(Substr(m.hora2,4,2)) * 60
Segundos2 = Val(Substr(m.hora2,7,2)) * 60
Horas3 = (Horas1 - Horas2)/60
Minutos3 = (Minutos1 - Minutos2)/60
Segundos3 = (Segundos1 - Segundos2)/60
If Segundos3 < 0
	Minutos3 = Minutos3 - 1
	Segundos3 = Segundos3 + 60
Endif
If Minutos3 < 0
	Horas3 = Horas3 - 1
	Minutos3 = Minutos3 + 60
Endif
If Horas3 < 0
	Horas3 = 0
Endif
m.HoraFin = Padl(Alltrim(Str(Horas3)),2,'0') + ':' + ;
		PADL(Alltrim(Str(Minutos3)),2,'0') + ':' + ;
		PADL(Alltrim(Str(Segundos3)),2,'0')
Return m.HoraFin
 
*********************************************************************************
* =HorasNumeros(4.25)
* Retorna ... ('04:15:00')
Function NumeroHoras
Parameter pNumero
pNumero = Round((pNumero/100),2)
Entero = Int(pNumero)
Decimales = ((60*(pNumero - Int(pNumero))* 100))/100
m.HoraFin = Padl(Alltrim(Str(Entero)),2,'0') + ':' + ;
 			PADL(Alltrim(Str(Decimales)),2,'0') + ':00'
Return m.HoraFin

*********************************************************************************
* =HorasNumeros('04:15:00')
* Retorna ... (4.25)
Function HorasNumeros
Parameter pHora
m.HoraFin = (Val(Substr(pHora,1,2)) + (Val(Substr(pHora,4,2))/60))*100
Return m.HoraFin
****

FUNCTION dhora
PARAMETERS hmayor, hmenor

RETURN PADL(ALLTRIM(STR(INT((CTOT(hmayor)-CTOT(hmenor))/3600))),2,"0") + ":" + PADL(ALLTRIM(STR(INT((CTOT(hmayor)-CTOT(hmenor))%3600)/60)),2,"0")
*

**********************************************************************
*!*  Funcion que permite determinar la suma de 2 Horas con intervalo de tiempo
*!*	    chorae = "09:05:00"
*!*	    cHoraSC= "13:05:00"
*!*	    cHoraEC= "13:30:00"
*!*	    CHORAS = "17:30:00"
*!*	    clear
*!*	    ? suma_Horas( ctot( choraE ),ctot(cHoraSC),ctot( cHoraEC) , ctot( choraS ) )
* Kleine
**********************************************************************

Function Suma_Horas( _dtE,_dtSC,_dtEC,_dtS )
    nRet = ""
    Store 0 to H1, H2, H3, H4, M1, M2, M3, M4
    
    If !ISNULL( _dtE )
	    H1 = hour( _dtE )
	    M1 = Minute( _dtE )
    EndIf
    If !ISNULL( _dtSC )
	    H2 = hour( _dtSC )
	    M2 = Minute( _dtSC )
    EndIf
    If !ISNULL( _dtEC )
	    H3 = hour( _dtEC )
	    M3 = Minute( _dtEC )
    EndIf
    If !ISNULL( _dtS )
	    H4 = hour( _dtS )
	    M4 = Minute( _dtS )
    EndIf
    
	nH1 = 0 && horas del primer tiempo
    nM1 = 0 && minutos del primer tiempo
    nH2 = 0 && Horas despues de comer
    nM2 = 0 &&' Minutos despues de comer
    
    If h1>0 and H2>0 and h3>0 and h4>0 && se trata de un horario con comida
	    If M2 - M1 >= 0 && '' hora cubierta
	    	nH1 = H2 - H1
	      	nM1 = ABS( M2 - M1 )
	    Else
	    	nH1 = H2 - H1 - 1
	      	If M2 <> M1
	       		nM1 = 60 - ABS( M1 - M2  )
	      	Else
	       		nM1=0
	      	EndIf
	    EndIf
		 **AHORA CON EL SEGUDNO HORARIO nM2, nH2
	   	If M4 - M3 >= 0 &&HORA CUBIERTA
		    nH2 = H4-H3
		    nM2 = ABS( M4 - M3 ) 
	    Else
		    nH2 = H4 - H3 - 1
		    If M4 <> M3
			    nM2 = 60- ABS( M4 - M3 )
		    Else
			    nM2 = 0
		    EndIf
	    EndIf
    EndIf
    
    If ( H1> 0 .AND. H2 = 0 .AND. H4> 0 )  &&no tiene comida 
	    *? "ENTRO3"
	    If M4 - M1 >= 0 && ES HORA CUMPLIDA
		    nH1 = H4 - H1
		    nM1 = ABS( M4 - M1 )
	    Else  && NO ES HORA CUMPLIDA, DEPENDE DE LOS MIN AVANSADOS.
		    nH1 = H4 - H1 - 1
		    If M1 <> M4
	    		nM1 = 60 - ABS( M1 - M4 )
		    Else
			    nM1 = 0
		    EndIf
	    EndIf
    EndIf   
    *!* ? nh1
    *!* ? nm1
    *!* ? nh2
    *!* ? nm2
    
    If nH2>0 and nH1>0 && SE SUMAN LAS DOS HORAS PROCESADAS,  CON Y SIN COMIDA
    *? "ENTRO AMBAS"
		nH1 = nH1 + nH2
     	If nM2 + nM1 >= 60 && SE COMPLETO LA OTRA HORA
			nH1 = nH1 + 1
		    nM1 = ABS( 60 - ( nM1 + nM2 ) )
		Else
      		nM1 = abs(nM2 - nM1)
     	EndIf
    EndIf
    *? "Horas = " + str( nH1 ) + " Min = " + str( nM1 )
    If nM1 >= 45
    	nH1 = nH1 +1
    EndIf  
   	nM1 = 0
    cValor = str( nH1,2) + "." + str( nM1,2 )
    nRet = val( cValor )
    RETURN nRet

*********************************************************************************
* =sumarhoras('01:15:02', '01:15:02')
* Retorna ... ('02:30:04')
Function sumarhoras
Parameter chora1,chora2
nhoras = 0
nmin = 0
nseg = Val(Substr(chora1,7,2)) + Val(Substr(chora2,7,2))
Do While nseg >= 60
	nmin = nmin + 1
	nseg = nseg - 60
Enddo
nmin = nmin + Val(Substr(chora1,4,2)) + Val(Substr(chora2,4,2))
Do While nmin >= 60
	nhoras = nhoras + 1
	nmin = nmin - 60
Enddo
nhoras = nhoras + Val(Substr(chora1,1,2)) + Val(Substr(chora2,1,2))
m.HoraFin = Padl(Ltrim(Str(nhoras)),2,'0')+ ':' + ;
	Padl(Ltrim(Str(nmin)),2,'0')+ ':' + ;
	Padl(Ltrim(Str(nseg)),2,'0')
Return m.HoraFin

*------------------------------------------------------
* FUNCTION _StrTo128C(tcString) * CODIGO 128C
*------------------------------------------------------
* Convierte un string para ser impreso con
* fuente True Type "PF Barcode 128"
* Solo caracteres numéricos
* USO: _StrTo128C('1234567890')
* RETORNA: Caracter
*------------------------------------------------------
FUNCTION _StrTo128C(tcString)
  LOCAL lcStart, lcStop, lcRet, lcCheck, lcCar, ;
    lnLong, lnI, lnCheckSum, lnAsc
  lcStart = CHR(105 + 32)
  lcStop = CHR(106 + 32)
  lnCheckSum = ASC(lcStart) - 32
  lcRet = ALLTRIM(tcString)
  lnLong = LEN(lcRet)
  *--- La longitud debe ser par
  IF MOD(lnLong,2) # 0
    lcRet = '0' + lcRet
    lnLong = LEN(lcRet)
  ENDIF
  *--- Convierto los pares a caracteres
  lcCar = ''
  FOR lnI = 1 TO lnLong STEP 2
    lcCar = lcCar + CHR(VAL(SUBS(lcRet,lnI,2)) + 32)
  ENDFOR
  lcRet = lcCar
  lnLong = LEN(lcRet)
  FOR lnI = 1 TO lnLong
    lnAsc = ASC(SUBS(lcRet,lnI,1)) - 32
    lnCheckSum = lnCheckSum + (lnAsc * lnI)
  ENDFOR
  lcCheck = CHR(MOD(lnCheckSum,103) + 32)
  lcRet = lcStart + lcRet + lcCheck + lcStop
  *--- Esto es para cambiar los espacios y caracteres invalidos
  lcRet = STRTRAN(lcRet,CHR(32),CHR(232))
  lcRet = STRTRAN(lcRet,CHR(127),CHR(192))
  lcRet = STRTRAN(lcRet,CHR(128),CHR(193))
  RETURN lcRet
ENDFUNC

*********************************************************************************
* 
*********************************************************************************
function numtxt
para nin, lon
local l
l=len(alltrim(str(nin,14,2)))
nt=iif(l>6,substr(alltrim(str(nin,14,2)),1,l-6)+','+substr(alltrim(str(nin,14,2)),l-5,l),alltrim(str(nin,14,2)))
if empty(lon) or isnull(lon)
	return nt
else
	return iif(len(nt)<lon,replicate(' ',lon-len(nt))+nt,nt)	
endif

*********************************************************************************
* 	impresion de autoimpresores con autorizacion
*********************************************************************************
procedure ticket

local fila, arch, ni, columnas, ndoc, lnfile, fi

columnas=40

set echo off
set talk off

arch=alltrim(nomunico())+'.txt'

lnFile=FCreate(arch)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(arch)
	If lnFile<0
		Messagebox("Error al Crear Archivo de impresion "+chr(13)+cFILE,0,empresa)
		Return(.f.)
	EndIf	
EndIf

if used('documents')
	sele documents
	go top
else
	return
endif

fila=2
ni=0

*fputs(lnFile,space((columnas-len(alltrim(achar(empresa2))))/2)+achar(empresa2))
*fputs(lnFile,space((columnas-len(alltrim(achar(diremp))))/2)+achar(diremp))
*fputs(lnFile,space((columnas-len(alltrim(achar("LISTA DE PEDIDO"))))/2)+achar("LISTA DE PEDIDO"))

do case
case like('*FACTURA*',nomdoc)
	ndoc='FACTURA'
case like('*NOTA DE VENTA*',nomdoc)
	ndoc='NOTA DE VENTA'
other
	ndoc=nomdoc
endcase	
fputs(lnFile,'No Factura: _______ T. Pagar:________ ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(ndoc)))/2)+alltrim(ndoc))
fputs(lnFile,'Cod. Trans: '+nconcero(6,code))
*fputs(lnFile,'  Cliente: CONSUMIDOR FINAL')
fputs(lnFile,'Cliente:   '+substr(Alltrim(sname),1,22))
fputs(lnFile,'Direccion: '+substr(Alltrim(saddr),1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'FECHA:      '+substr(achar(fecgra),1,len(achar(fecgra))-6))
fputs(lnFile,'VENDEDOR:   '+substr(VENDEDOR,1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'CANT   UNI      UNITARIO      VALOR   ')
fputs(lnFile,'--------------------------------------')

do while !eof()
	fputs(lnFile,substr(iname,1,38)+'  '+str(qty,6,2)+' '+substr(unidad,1,4)+;
			' '+STR(iif(isiva,round(punitario*(1+iva/100),6),round(punitario,6)),10,4)+;
			' '+numtxt(iif(isiva,round(punitario*qty*(1+iva/100),2),round(punitario*qty,2)),10)+;
			' '+iif(isiva,'*',''))
	ni=ni+1
	skip
enddo
go top

fputs(lnFile,'--------------------------------------')
fputs(lnFile,'# Items: '+str(ni,3)+'      TOTAL: '+numtxt(montototal,8))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,' ')
fputs(lnFile,' EMPACADO POR:_______________________')
fputs(lnFile,' ')
fputs(lnFile,' ROLLO/RESMA:______      FUNDA:______')
fputs(lnFile,' ')
fputs(lnFile,' CARTONES:______  TOTAL BULTOS:______')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim('**GRACIAS POR SU COMPRA**')))/2)+'**GRACIAS POR SU COMPRA**')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')

fClose(lnFile)

fi='type '+sys(2003)+'\'+arch+' >prn'
! &fi

fi=sys(2003)+'\'+arch
delete file &fi
****