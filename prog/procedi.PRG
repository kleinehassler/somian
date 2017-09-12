**
FUNCTION creadsn
 DECLARE SHORT SQLConfigDataSource IN ODBCCP32 LONG, INTEGER, STRING @, STRING @
 resp = sqlconfigdatasource(0, 4, "PostgreSQL", "DSN="+"PostgreSQL"+CHR(0)+"Database="+"empresas"+CHR(0)+"Servername="+"localhost"+CHR(0)+"Port="+"5432"+CHR(0)+"UID="+"postgres"+CHR(0)+"PWD="+"postgres"+CHR(0)+"Protocol="+"6.4"+CHR(0)+"TrueIsMinus1="+"0"+CHR(0)+"BoolsAsChar="+"0"+CHR(0)+"A7="+"100"+CHR(0)+"A8="+"4096"+CHR(0)+"B0="+"254"+CHR(0)+"B1="+"8190"+CHR(0)+"BI="+"0"+CHR(0)+"C2="+"dd_"+CHR(0)+"CX="+"1b3a3"+CHR(0))
 RETURN resp=1
ENDFUNC
**
FUNCTION alup
 PARAMETER x
 DO CASE
    CASE ISNULL(x)
       RETURN 'NULL'
    CASE TYPE('x')='N'
       IF INT(x)=x
          RETURN ALLTRIM(STR(INT(x)))
       ELSE
          RETURN ALLTRIM(STR(x, 18, 6))
       ENDIF
    CASE TYPE('x')='C'
       RETURN "'"+ALLTRIM(bsto2bs(x))+"'"
    CASE TYPE('x')='L'
       IF x
          RETURN "'true'"
       ELSE
          RETURN "'false'"
       ENDIF
    CASE TYPE('x')='D'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN 'null'
       ELSE
          RETURN "'"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+"'"
       ENDIF
    CASE TYPE('x')='T'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN 'null'
       ELSE
          RETURN "'"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+' '+TIME(x)+"'"
       ENDIF
 ENDCASE
ENDFUNC
**
FUNCTION al
 PARAMETER x
 DO CASE
    CASE ISNULL(x)
       RETURN ', NULL'
    CASE TYPE('x')='N'
       IF INT(x)=x
          RETURN ', '+ALLTRIM(STR(INT(x)))
       ELSE
          RETURN ', '+ALLTRIM(STR(x, 18, 6))
       ENDIF
    CASE TYPE('x')='C'
       RETURN ", '"+ALLTRIM(bsto2bs(x))+"'"
    CASE TYPE('x')='L'
       IF x
          RETURN ", 'true' "
       ELSE
          RETURN ", 'false' "
       ENDIF
    CASE TYPE('x')='D'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN ', null'
       ELSE
          RETURN ", '"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+"'"
       ENDIF
    CASE TYPE('x')='T'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN ', null'
       ELSE
          RETURN ", '"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+' '+TIME(x)+"'"
       ENDIF
 ENDCASE
ENDFUNC
**
FUNCTION pal
 PARAMETER x
 DO CASE
    CASE ISNULL(x)
       RETURN '( NULL'
    CASE TYPE('x')='N'
       IF INT(x)=x
          RETURN '('+ALLTRIM(STR(INT(x)))
       ELSE
          RETURN '( '+ALLTRIM(STR(x, 18, 6))
       ENDIF
    CASE TYPE('x')='C'
       RETURN "('"+ALLTRIM(bsto2bs(x))+"'"
    CASE TYPE('x')='L'
       IF x
          RETURN "('true'"
       ELSE
          RETURN "('false'"
       ENDIF
    CASE TYPE('x')='D'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN '(null'
       ELSE
          RETURN "('"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+"'"
       ENDIF
    CASE TYPE('x')='T'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN '( null'
       ELSE
          RETURN "('"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+' '+TIME(x)+"'"
       ENDIF
 ENDCASE
ENDFUNC
**
FUNCTION ual
 PARAMETER x
 DO CASE
    CASE ISNULL(x)
       RETURN ', NULL );'
    CASE TYPE('x')='N'
       IF INT(x)=x
          RETURN ', '+ALLTRIM(STR(INT(x)))+');'
       ELSE
          RETURN ', '+ALLTRIM(STR(x, 18, 6))+');'
       ENDIF
    CASE TYPE('x')='C'
       RETURN ", '"+ALLTRIM(bsto2bs(x))+"');"
    CASE TYPE('x')='L'
       IF x
          RETURN ", 'true'"+');'
       ELSE
          RETURN ", 'false'"+');'
       ENDIF
    CASE TYPE('x')='D'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN ', null)'
       ELSE
          RETURN ", '"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+"'); "
       ENDIF
    CASE TYPE('x')='T'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN 'null);'
       ELSE
          RETURN "'"+ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+' '+TIME(x)+"');"
       ENDIF
 ENDCASE
ENDFUNC
**
FUNCTION achar
 PARAMETER x
 DO CASE
    CASE ISNULL(x)
       RETURN 'NULL'
    CASE TYPE('x')='N' .OR. TYPE('x')='Y'
       IF INT(x)=x
          RETURN ALLTRIM(STR(INT(x)))
       ELSE
          RETURN ALLTRIM(STR(x, 18, 6))
       ENDIF
    CASE TYPE('x')='C'
       RETURN ALLTRIM(x)
    CASE TYPE('x')='L'
       IF x
          RETURN 'true'
       ELSE
          RETURN 'false'
       ENDIF
    CASE TYPE('x')='D'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN 'null'
       ELSE
          RETURN ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))
       ENDIF
    CASE TYPE('x')='T'
       IF EMPTY(x) .OR. ISNULL(x)
          RETURN 'null'
       ELSE
          RETURN ALLTRIM(STR(YEAR(x)))+'-'+ALLTRIM(STR(MONTH(x)))+'-'+ALLTRIM(STR(DAY(x)))+' '+TIME(x)
       ENDIF
 ENDCASE
ENDFUNC
**
FUNCTION bsto2bs
 PARAMETER l
 LOCAL i, j, a, b
 j = LEN(ALLTRIM(l))
 IF EMPTY(l)
    RETURN l
 ENDIF
 i = 1
 b = ''
 DO WHILE i<=j
    IF SUBSTR(l, i, 1)='\'
       a = SUBSTR(l, 1, i)+'\'
       b = SUBSTR(l, i+1, LEN(l))
       l = ALLTRIM(a)+ALLTRIM(b)
       i = i+1
       j = j+1
       IF i=j
          EXIT
       ENDIF
    ENDIF
    i = i+1
 ENDDO
 RETURN l
ENDFUNC
**
FUNCTION devfeclet
 PARAMETER pfechax, tip
 IF EMPTY(pfechax) .OR. ISNULL(pfechax)
    RETURN ''
 ENDIF
 LOCAL mm, mms
 mm = MONTH(pfechax)
 mms = ''
 DO CASE
    CASE mm=1
       mms = 'Enero'
    CASE mm=2
       mms = 'Febrero'
    CASE mm=3
       mms = 'Marzo'
    CASE mm=4
       mms = 'Abril'
    CASE mm=5
       mms = 'Mayo'
    CASE mm=6
       mms = 'Junio'
    CASE mm=7
       mms = 'Julio'
    CASE mm=8
       mms = 'Agosto'
    CASE mm=9
       mms = 'Septiembre'
    CASE mm=10
       mms = 'Octubre'
    CASE mm=11
       mms = 'Noviembre'
    CASE mm=12
       mms = 'Diciembre'
 ENDCASE
 IF EMPTY(tip) .OR. ISNULL(tip)
    RETURN IIF(DAY(pfechax)<10, '0', '')+ALLTRIM(STR(DAY(pfechax)))+' de '+mms+IIF(YEAR(pfechax)>=2000, ' del ', ' de ')+ALLTRIM(STR(YEAR(pfechax)))
 ENDIF
 DO CASE
    CASE tip=1
       RETURN IIF(DAY(pfechax)<10, '0', '')+ALLTRIM(STR(DAY(pfechax)))+'-'+SUBSTR(mms, 1, 3)+'-'+ALLTRIM(STR(YEAR(pfechax)))
    CASE tip=2
       RETURN SUBSTR(mms, 1, 3)+'-'+ALLTRIM(STR(YEAR(pfechax)))
    CASE tip=3
       RETURN ALLTRIM(STR(YEAR(pfechax)))+IIF(MONTH(pfechax)<10, '0', '')+ALLTRIM(STR(MONTH(pfechax)))+IIF(DAY(pfechax)<10, '0', '')+ALLTRIM(STR(DAY(pfechax)))
    CASE tip=4
       RETURN IIF(DAY(pfechax)<10, '0', '')+ALLTRIM(STR(DAY(pfechax)))+'-'+SUBSTR(mms, 1, 3)+'-'+ALLTRIM(IIF(MOD(YEAR(pfechax), 100)<10, '0', '')+ALLTRIM(STR(MOD(YEAR(pfechax), 100))))
    CASE tip=5
       RETURN IIF(DAY(pfechax)<10, '0', '')+ALLTRIM(STR(DAY(pfechax)))+'-'+SUBSTR(mms, 1, 3)+'-'+ALLTRIM(STR(YEAR(pfechax)))
 ENDCASE
ENDFUNC
**
FUNCTION fecdma
 PARAMETER fecha
 LOCAL dia
 dia = DAY(fecha)
 frase = IIF(dia<10, "0"+ALLTRIM(STR(dia)), ALLTRIM(STR(dia)))+'-'+SUBSTR(CMONTH(fecha), 1, 3)+'-'+SUBSTR(ALLTRIM(STR(YEAR(fecha))), 3, 2)
 RETURN frase
ENDFUNC
**
FUNCTION fecdmaa
 PARAMETER fecha
 LOCAL dia
 dia = DAY(fecha)
 frase = IIF(dia<10, "0"+ALLTRIM(STR(dia)), ALLTRIM(STR(dia)))+'-'+SUBSTR(CMONTH(fecha), 1, 3)+'-'+ALLTRIM(STR(YEAR(fecha)))
 RETURN frase
ENDFUNC
**
FUNCTION CCCPUNTO
 PARAMETER cuenta, auxiliar
 LOCAL g1, g2, g3, g4, g5, aux
 g1 = " "
 g2 = " "
 g3 = " "
 g4 = " "
 g5 = " "
 aux = " "
 g1 = ALLTRIM(SUBSTR(cuenta, 2, 2))
 g2 = ALLTRIM(SUBSTR(cuenta, 4, 2))
 g3 = ALLTRIM(SUBSTR(cuenta, 6, 2))
 g4 = ALLTRIM(SUBSTR(cuenta, 8, 2))
 g5 = ALLTRIM(SUBSTR(cuenta, 10, 2))
 aux = ALLTRIM(auxiliar)
 fraspc = g1
 IF VAL(g2)<>0
    fraspc = fraspc+"."+g2
 ENDIF
 IF VAL(g3)<>0
    fraspc = fraspc+"."+g3
 ENDIF
 IF VAL(g4)<>0
    fraspc = fraspc+"."+g4
 ENDIF
 IF VAL(g5)<>0
    fraspc = fraspc+"."+g5
 ENDIF
 IF VAL(aux)<>0
    fraspc = fraspc+"."+aux
 ENDIF
 RETURN frase
ENDFUNC
**
FUNCTION devnumlet
 PARAMETER numero
 LOCAL num2, cnum, pos1, exp3, exp4, sw, sw1, digito, digant, digsig, digsi2, exp1
 num2 = numero-INT(numero)
 num2 = num2*100
 cnum = ALLTRIM(STR(INT(numero)))
 long = LEN(cnum)
 pos1 = long
 exp3 = " "
 DO WHILE pos1>0
    sw = .F.
    sw1 = .F.
    digito = SUBSTR(cnum, long-pos1+1, 1)
    IF long-pos1>0
       digant = SUBSTR(cnum, long-pos1, 1)
    ELSE
       digant = "*"
    ENDIF
    IF pos1>1
       digsig = SUBSTR(cnum, long-pos1+2, 1)
    ELSE
       digsig = "*"
    ENDIF
    IF pos1>2
       digsi2 = SUBSTR(cnum, long-pos1+3, 1)
    ELSE
       digsi2 = "*"
    ENDIF
    IF digsig<>"0" .AND. (pos1=2 .OR. pos1=5 .OR. pos1=8) .AND. digito<>"1" .AND. digito<>'0' .AND. digito<>"2"
       exp2 = "y"
    ELSE
       exp2 = " "
    ENDIF
    DO CASE
       CASE digito="0"
          exp1 = ""
       CASE digito="1"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                   exp1 = "cien"
                ELSE
                   exp1 = "ciento"
                ENDIF
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                sw = .T.
                DO CASE
                   CASE digsig="0"
                      exp1 = "diez"
                   CASE digsig="1"
                      exp1 = "once"
                   CASE digsig="2"
                      exp1 = "doce"
                   CASE digsig="3"
                      exp1 = "trece"
                   CASE digsig="4"
                      exp1 = "catorce"
                   CASE digsig="5"
                      exp1 = "quince"
                   CASE digsig="6"
                      exp1 = "dieciseis"
                   CASE digsig="7"
                      exp1 = "diecisiete"
                   CASE digsig="8"
                      exp1 = "dieciocho"
                   CASE digsig="9"
                      exp1 = "diecinueve"
                ENDCASE
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                IF pos1=1
                   exp1 = "uno"
                ELSE
                   IF pos1=7
                      exp1 = "un"
                   ELSE
                      exp1 = ""
                   ENDIF
                ENDIF
          ENDCASE
       CASE digito="2"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "dos cientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                sw = .T.
                DO CASE
                   CASE digsig="0"
                      exp1 = "veinte"
                   CASE digsig="1"
                      exp1 = "veintiuno"
                   CASE digsig="2"
                      exp1 = "veintidos"
                   CASE digsig="3"
                      exp1 = "veintitres"
                   CASE digsig="4"
                      exp1 = "veinticuatro"
                   CASE digsig="5"
                      exp1 = "veinticinco"
                   CASE digsig="6"
                      exp1 = "veintiseis"
                   CASE digsig="7"
                      exp1 = "vientisiete"
                   CASE digsig="8"
                      exp1 = "veintiocho"
                   CASE digsig="9"
                      exp1 = "veintinueve"
                ENDCASE
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "dos"
          ENDCASE
       CASE digito="3"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "tres cientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "treinta"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "tres"
          ENDCASE
       CASE digito="4"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "cuatro cientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "cuarenta "
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "cuatro"
          ENDCASE
       CASE digito="5"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "quinientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "cincuenta"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "cinco"
          ENDCASE
       CASE digito="6"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "seis cientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "sesenta"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "seis"
          ENDCASE
       CASE digito="7"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "setecientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "setenta"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "siete"
          ENDCASE
       CASE digito="8"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "ocho cientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "ochenta"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "ocho"
          ENDCASE
       CASE digito="9"
          DO CASE
             CASE pos1=3 .OR. pos1=6 .OR. pos1=9
                IF (digsig="0") .AND. (digsi2="0")
                   sw1 = .T.
                ENDIF
                exp1 = "novecientos"
             CASE pos1=2 .OR. pos1=5 .OR. pos1=8
                exp1 = "noventa"
             CASE pos1=1 .OR. pos1=4 .OR. pos1=7
                exp1 = "nueve"
          ENDCASE
    ENDCASE
    exp4 = " "
    IF pos1=7 .AND. digant<>"1"
       exp4 = "millones"
    ENDIF
    IF pos1=8 .OR. (pos1=9 .AND. digsig="0" .AND. digsi2="0")
       exp4 = "millones"
    ENDIF
    IF pos1=7 .AND. digito="1"
       exp4 = "millon"
    ENDIF
    IF ((pos1=5 .AND. sw) .OR. (pos1=6 .AND. digsig='0' .AND. digsi2='0' .AND. digito<>'0') .OR. (pos1=5 .AND. digsig='0' .AND. digito<>'0') .OR. (pos1=4 .AND. digito<>'0'))
       exp4 = "mil"
    ENDIF
    IF sw
       pos1 = pos1-2
    ELSE
       IF sw1
          pos1 = pos1-3
       ELSE
          pos1 = pos1-1
       ENDIF
    ENDIF
    IF exp4<>" "
       exp3 = ALLTRIM(exp3)+" "+ALLTRIM(exp1)+" "+exp4+" "+exp2
    ELSE
       exp3 = ALLTRIM(exp3)+" "+ALLTRIM(exp1)+" "+exp2
    ENDIF
 ENDDO
 IF num2>0
    exp3 = ALLTRIM(exp3)+", "+IIF(num2<10, '0', '')+ALLTRIM(STR(num2))+"/100"
 ELSE
    exp3 = ALLTRIM(exp3)+", "+"00/100"
 ENDIF
 RETURN exp3
ENDFUNC
**
FUNCTION acceso
 PARAMETER keyprog
 IF  .NOT. programas()
    RETURN .F.
 ENDIF
 LOCATE FOR idprograma=keyprog
 IF FOUND() .AND. estapro='1'
    IF  .NOT. accesos()
       RETURN .F.
    ENDIF
    LOCATE FOR idprograma=keyprog .AND. idusuario=ide
    IF FOUND()
       RETURN .T.
    ELSE
       RETURN .F.
    ENDIF
 ELSE
    WAIT WINDOW NOWAIT 'Este programa está inactivo'
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION isvacio
 PARAMETER x
 IF ISNULL(x)
    RETURN .T.
 ELSE
    IF EMPTY(x)
       RETURN .T.
    ELSE
       RETURN .F.
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION lista
 PARAMETER frasx
 LOCAL l, swl, frase1, i
 frasx = ALLTRIM(frasx)
 l = LEN(ALLTRIM(frasx))
 swl = .F.
 frase1 = ''
 FOR i = 1 TO l
    IF SUBSTR(frasx, i, 1)='['
       swl = .T.
    ENDIF
    IF swl
       frase1 = frase1+SUBSTR(frasx, i, 1)
    ENDIF
    IF SUBSTR(frasx, i, 1)=']'
       swl = .F.
    ENDIF
 ENDFOR
 frase1 = CHRTRAN(frase1, ']', ',')
 frase1 = CHRTRAN(frase1, '[()./*+-', '')
 l = LEN(ALLTRIM(frase1))
 IF SUBSTR(frase1, l, 1)=','
    frase1 = SUBSTR(frase1, 1, l-1)
 ENDIF
 RETURN frase1
ENDFUNC
**
FUNCTION formula
 PARAMETER frse
 LOCAL l, frse1, i, c, frse2
 frse = ALLTRIM(frse)
 l = LEN(ALLTRIM(frse))
 frse1 = ''
 FOR i = 1 TO l
    c = SUBSTR(frse, i, 1)
    IF c='['
       frse1 = frse1+c+'v'
    ELSE
       frse1 = frse1+c
    ENDIF
 ENDFOR
 l = LEN(ALLTRIM(frse1))
 frse2 = ''
 FOR i = 1 TO l
    c = SUBSTR(frse1, i, 1)
    IF c<>'[' .AND. c<>']'
       frse2 = frse2+c
    ENDIF
 ENDFOR
 RETURN frse2
ENDFUNC
**
FUNCTION calculorub
 PARAMETER formu, area
 LOCAL k, m, campo, r
 k = lista(formu)
 m = formula(formu)
 SELECT * FROM &area WHERE rubcode IN(&k) INTO CURSOR adj
 SELECT adj
 GOTO TOP
 DO WHILE  .NOT. EOF()
    campo = 'v'+ALLTRIM(STR(rubcode))
    &campo=valor
    SKIP
 ENDDO
 SELECT adj
 USE
 IF  .NOT. EMPTY(area)
    SELECT &area
 ENDIF
 SELECT &area
 r = 0
 r = IIF(TYPE(m)='U',0,&m)
 RETURN r
ENDFUNC
**
FUNCTION valcedu
 PARAMETER x
 LOCAL c, prov, terd, t, i, j, u
 IF EMPTY(x)
    WAIT WINDOW NOWAIT 'Sin Cedula'
    RETURN .F.
 ENDIF
 IF TYPE('x')='N'
    IF x=9999999999 
       RETURN .T.
    ENDIF
    IF LEN(ALLTRIM(STR(x)))<9
       WAIT WINDOW NOWAIT 'Numero incompleto'
       RETURN .F.
    ELSE
       IF LEN(ALLTRIM(STR(x)))=9
          c = '0'+ALLTRIM(STR(x))
       ELSE
          IF LEN(ALLTRIM(STR(x)))=10
             c = ALLTRIM(STR(x))
          ELSE
             WAIT WINDOW NOWAIT 'Cedula errada'
             RETURN .F.
          ENDIF
       ENDIF
    ENDIF
 ELSE
    IF TYPE('x')='C'
       IF x='9999999999'
          RETURN .T.
       ENDIF
       c = ALLTRIM(x)
    ELSE
       WAIT WINDOW NOWAIT 'Tipo incorrecto'
       RETURN .F.
    ENDIF
 ENDIF
 prov = VAL(SUBSTR(c, 1, 2))
 IF prov<1 .OR. prov>22
    RETURN .F.
 ENDIF
 terd = VAL(SUBSTR(c, 3, 1))
 IF terd>5
    RETURN .F.
 ENDIF
 t = 0
 FOR i = 1 TO 9 STEP 2
    d = SUBSTR(c, i, 1)
    DO CASE
       CASE d='1'
          t = t+2
       CASE d='2'
          t = t+4
       CASE d='3'
          t = t+6
       CASE d='4'
          t = t+8
       CASE d='5'
          t = t+1
       CASE d='6'
          t = t+3
       CASE d='7'
          t = t+5
       CASE d='8'
          t = t+7
       CASE d='9'
          t = t+9
    ENDCASE
 ENDFOR
 FOR i = 2 TO 8 STEP 2
    j = VAL(SUBSTR(c, i, 1))
    t = t+j
 ENDFOR
 u = VAL(SUBSTR(c, 10, 1))
 IF (MOD(t, 10)+u)=10 .OR. (MOD(t, 10)+u)=0
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
ENDFUNC
**
PROCEDURE valruc
 PARAMETER pcedula
 LOCAL suma, residuo, natural, juridica, publica, numprovincias, todocorrecto
 suma = 0
 residuo = 0
 natural = .F.
 juridica = .F.
 publica = .F.
 numprovincias = 22
 todocorrecto = "N"
 IF LEN(ALLTRIM(pcedula))>=10
    c1 = VAL(SUBSTR(pcedula, 1, 1))
    c2 = VAL(SUBSTR(pcedula, 2, 1))
    c3 = VAL(SUBSTR(pcedula, 3, 1))
    c4 = VAL(SUBSTR(pcedula, 4, 1))
    c5 = VAL(SUBSTR(pcedula, 5, 1))
    c6 = VAL(SUBSTR(pcedula, 6, 1))
    c7 = VAL(SUBSTR(pcedula, 7, 1))
    c8 = VAL(SUBSTR(pcedula, 8, 1))
    c9 = VAL(SUBSTR(pcedula, 9, 1))
    c10 = VAL(SUBSTR(pcedula, 10, 1))
    DO CASE
       CASE c3<6
          natural = .T.
       CASE c3=6
          publica = .T.
       CASE c3=9
          juridica = .T.
    ENDCASE
    IF natural=.T.
       IF VAL(SUBSTR(pcedula, 1, 2))>0 .AND. VAL(SUBSTR(pcedula, 1, 2))<=numprovincias
          p1 = c1*2
          p2 = c2*1
          p3 = c3*2
          p4 = c4*1
          p5 = c5*2
          p6 = c6*1
          p7 = c7*2
          p8 = c8*1
          p9 = c9*2
          p10 = c10*1
          IF p1>=10
             p1 = p1-9
          ENDIF
          IF p2>=10
             p2 = p2-9
          ENDIF
          IF p3>=10
             p3 = p3-9
          ENDIF
          IF p4>=10
             p4 = p4-9
          ENDIF
          IF p5>=10
             p5 = p5-9
          ENDIF
          IF p6>=10
             p6 = p6-9
          ENDIF
          IF p7>=10
             p7 = p7-9
          ENDIF
          IF p8>=10
             p8 = p8-9
          ENDIF
          IF p9>=10
             p9 = p9-9
          ENDIF
          IF p10>=10
             p10 = p10-9
          ENDIF
          suma = p1+p2+p3+p4+p5+p6+p7+p8+p9+p10
          residuo = MOD(suma, 10)
          IF LEN(ALLTRIM(pcedula))=10
             IF residuo=0
                WAIT WINDOW NOWAIT "La cedula es valida."
                todocorrecto = "S"
             ELSE
                WAIT WINDOW NOWAIT "La cedula no es valida."
                todocorrecto = "N"
             ENDIF
          ELSE
             IF LEN(ALLTRIM(pcedula))>10
                IF residuo=0
                   IF VAL(SUBSTR(pcedula, 11, 3))=1 .AND. LEN(SUBSTR(pcedula, 11, 3))=3
                      IF LEN(ALLTRIM(SUBSTR(pcedula, 11, 3)))=LEN(SUBSTR(pcedula, 11, 3))
                         WAIT WINDOW NOWAIT "El ruc es valido."
                         todocorrecto = "S"
                      ELSE
                         WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar"
                         todocorrecto = "N"
                      ENDIF
                   ELSE
                      WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar"
                      todocorrecto = "N"
                   ENDIF
                ELSE
                   IF residuo=0
                      IF LEN(ALLTRIM(SUBSTR(pcedula, 11, 3)))=LEN(SUBSTR(pcedula, 11, 3))
                         WAIT WINDOW NOWAIT "El ruc es valido."
                         todocorrecto = "S"
                      ELSE
                         WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar"
                         todocorrecto = "N"
                      ENDIF
                   ELSE
                      WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar"
                      todocorrecto = "N"
                   ENDIF
                ENDIF
             ENDIF
          ENDIF
       ELSE
          todocorrecto = "N"
          WAIT WINDOW NOWAIT "Ruc de Persona Natural incorrecto, por favor verificar los digitos correspondientes a la Provincia"
       ENDIF
    ENDIF
    IF juridica=.T.
       IF VAL(SUBSTR(pcedula, 1, 2))>0 .AND. VAL(SUBSTR(pcedula, 1, 2))<=numprovincias
          IF LEN(ALLTRIM(pcedula))=13
             p1 = c1*4
             p2 = c2*3
             p3 = c3*2
             p4 = c4*7
             p5 = c5*6
             p6 = c6*5
             p7 = c7*4
             p8 = c8*3
             p9 = c9*2
             suma = p1+p2+p3+p4+p5+p6+p7+p8+p9
             valdivision = INT(suma/11)
             valmultiplicacion = valdivision*11
             valresta = suma-valmultiplicacion
             IF valresta=0
                digitoverificador = 0
             ELSE
                digitoverificador = 11-valresta
             ENDIF
             IF digitoverificador=c10 .AND. VAL(SUBSTR(pcedula, 11, 3))=1
                todocorrecto = "S"
                WAIT WINDOW NOWAIT "Número de Ruc correcto"
             ELSE
                todocorrecto = "N"
                WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Persona Jurídica es incorrecta, por favor verificar"
             ENDIF
          ENDIF
       ELSE
          todocorrecto = "N"
          WAIT WINDOW NOWAIT "Ruc de Persona Jurídica incorrecto, por favor verificar los digitos correspondientes a la Provincia"
       ENDIF
    ENDIF
    IF publica=.T.
       IF VAL(SUBSTR(pcedula, 1, 2))>0 .AND. VAL(SUBSTR(pcedula, 1, 2))<=numprovincias
          IF LEN(ALLTRIM(pcedula))=13
             p1 = c1*3
             p2 = c2*2
             p3 = c3*7
             p4 = c4*6
             p5 = c5*5
             p6 = c6*4
             p7 = c7*3
             p8 = c8*2
             suma = p1+p2+p3+p4+p5+p6+p7+p8
             valdivision = INT(suma/11)
             valmultiplicacion = valdivision*11
             valresta = suma-valmultiplicacion
             digitoverificador = 11-valresta
             IF c9=digitoverificador .AND. VAL(SUBSTR(pcedula, 10, 4))>0 .AND. VAL(SUBSTR(pcedula, 11, 3))=1 .OR. valresta=0
                todocorrecto = "S"
             ELSE
                WAIT WINDOW NOWAIT "Número de Ruc correspondiente a Empresas del Sector Público es incorrecta, por favor verificar"
                todocorrecto = "N"
             ENDIF
          ENDIF
       ELSE
          todocorrecto = "N"
          WAIT WINDOW NOWAIT "Ruc de Empresas del Sector Público incorrecto, por favor verificar los digitos correspondientes a la Provincia"
       ENDIF
    ENDIF
 ELSE
    WAIT WINDOW NOWAIT "Numero de Documento no válido."
    todocorrecto = "N"
 ENDIF
ENDPROC
**
FUNCTION tipolet
 PARAMETER f
 LOCAL lon, u, i
 f = ALLTRIM(f)
 lon = LEN(f)
 IF lon>0
    u = 0
    FOR i = 1 TO lon
       IF SUBSTR(f, i, 1)=','
          u = i-1
          EXIT
       ENDIF
    ENDFOR
    IF u=0
       RETURN f
    ELSE
       RETURN SUBSTR(f, 1, u)
    ENDIF
 ELSE
    RETURN 'Times New Roman'
 ENDIF
ENDFUNC
**
FUNCTION fcodcon
 PARAMETER c, n
 LOCAL i, k, frcp
 c = ALLTRIM(c)
 IF ISNULL(c)
    RETURN .F.
 ENDIF
 IF EMPTY(c)
    RETURN .F.
 ENDIF
 k = VAL(ALLTRIM(SUBSTR(c, 1, 2)))
 IF k=0
    RETURN .F.
 ENDIF
 frcp = ALLTRIM(STR(k))
 IF IIF( .NOT. EMPTY(n), n=2, .F.) .AND. k=1
    frcp = frcp+'.0'+ALLTRIM(STR(VAL(ALLTRIM(SUBSTR(c, 3, 2)))))
 ELSE
    frcp = frcp+IIF(VAL(ALLTRIM(SUBSTR(c, 3, 2)))=0, ' ', '.0'+ALLTRIM(STR(VAL(ALLTRIM(SUBSTR(c, 3, 2))))))
 ENDIF
 FOR i = 2 TO 6
    k = VAL(ALLTRIM(SUBSTR(c, i*2+1, 2)))
    IF k>0
       frcp = frcp+'.'+IIF(k<10, '0'+ALLTRIM(STR(k)), ALLTRIM(STR(k)))
    ELSE
       frcp = frcp+'  '
    ENDIF
 ENDFOR
 RETURN frcp
ENDFUNC
**
FUNCTION valfec
 PARAMETER f
 WAIT WINDOW NOWAIT devfeclet(f)
 RETURN f<=ffinp .AND. f>=finip
ENDFUNC
**
FUNCTION abrevia
 PARAMETER f, d
 LOCAL i, l, esw, fr, k, m, e
 e = IIF(EMPTY(d) .OR. ISNULL(d), 4, d)
 IF TYPE('f')<>'C'
    RETURN ''
 ENDIF
 i = 1
 l = LEN(ALLTRIM(f))
 esw = .T.
 fr = ''
 DO WHILE i<l
    IF esw
       IF i+e>l
          k = (l-i)+1
       ELSE
          FOR m = 0 TO e-1
             IF SUBSTR(f, i+m, 1)=' ' .OR. SUBSTR(f, i+m, 1)='.'
                EXIT
             ENDIF
          ENDFOR
          k = m
       ENDIF
       fr = fr+SUBSTR(f, i, k)+' '
       i = i+k
       esw = .F.
    ELSE
       i = i+1
    ENDIF
    IF SUBSTR(f, i, 1)=' ' .OR. SUBSTR(f, i, 1)='.'
       i = i+1
       esw = .T.
    ENDIF
 ENDDO
 RETURN fr
ENDFUNC
**
FUNCTION DIASMES
 PARAMETER nmesp, nañop
 IF nmesp=0 .OR. nmesp>12
    RETURN 0
 ENDIF
 IF nañop<1993 .OR. nañop>2019
    RETURN 0
 ENDIF
 DO CASE
    CASE nmesp=1 .OR. nmesp=3 .OR. nmesp=5 .OR. nmesp=7 .OR. nmesp=8 .OR. nmesp=10 .OR. nmesp=12
       RETURN 31
    CASE nmesp=4 .OR. nmesp=6 .OR. nmesp=9 .OR. nmesp=11
       RETURN 30
    CASE nañop=1996 .OR. nañop=2000 .OR. nañop=2004 .OR. nañop=2008 .OR. nañop=2012 .OR. nañop=2016
       RETURN 29
    OTHERWISE
       RETURN 28
 ENDCASE
ENDFUNC
**
FUNCTION nomunico
 LOCAL eq
 eq = ''
 eq = SUBSTR(SYS(0), 1, 1)
 IF eq=' '
    eq = SUBSTR(SYS(2015), 6, 4)
 ENDIF
 RETURN ALLTRIM(eq)+ALLTRIM(SUBSTR(SYS(2015), 3, 8))
ENDFUNC
**
PROCEDURE manejo_err
 x = 1
 = fintransq()
 merror = ERROR()
 mess = MESSAGE()
 mprog = PROGRAM()
 mlineno = LINENO()
 = MESSAGEBOX('Error : '+mess, 0, empresa)
 DO regerrbd
 IF TYPE('_screen.activeform')<>'U'
    _SCREEN.activeform.release
 ENDIF
 IF TYPE('tbrdesktop')='O' .AND.  .NOT. ISNULL(tbrdesktop)
    = tbrdesktop.cancelar1.click()
 ENDIF
ENDPROC
**
PROCEDURE regerrbd
 LOCAL cm
 IF USED('errorbd')
    SELECT errorbd
 ELSE
    SELECT 0
    USE SHARED errorbd
 ENDIF
 APPEND BLANK
 e = SYS(2018)
 REPLACE user WITH usuario
 REPLACE fecha WITH DATETIME()
 REPLACE comandosql WITH IIF(EMPTY(e), MESSAGE(), e)
 REPLACE ws WITH equipo
 REPLACE q2 WITH SUBSTR(q1, 1, 200)
 REPLACE q3 WITH SUBSTR(q1, 201, 400)
 REPLACE q4 WITH SUBSTR(q1, 401, 600)
 REPLACE q5 WITH SUBSTR(q1, 601, 800)
 REPLACE progmaes WITH SYS(16, 1)
 RETURN
ENDPROC
**
PROCEDURE borreg
 PARAMETER nt, kt
 LOCAL p, cod, fe, numrub, nomt, keyt, f
 nomt = nt
 keyt = kt
 numrub = 0
 f = nomt+'.'+keyt
 IF &f#0 THEN
    _SCREEN.activeform.grid1.recordsource = ''
    SELE &nomt
    cod=&f
    f = f+"=cod"
    COUNT FOR &f TO numrub
    IF numrub>1
       GOTO TOP
       f = keyt+'=cod'
       LOCATE FOR &f
       _SCREEN.activeform.gridremoveitem()
    ENDIF
    SELE &nomt
    GOTO TOP
    LOCATE FOR &f
    IF  .NOT. FOUND()
       GOTO BOTTOM
    ENDIF
    _SCREEN.activeform.grid1.recordsource = nomt
 ENDIF
 _SCREEN.activeform.grid1.doscroll(0)
 _SCREEN.activeform.grid1.refresh()
 RETURN
ENDPROC
**
PROCEDURE nada
 RETURN
ENDPROC
**
PROCEDURE ambiente
 SET DATE TO DMY
 SET CENTURY ON
 SET SAFETY OFF
 SET EXCLUSIVE OFF
 SET TALK OFF
 SET DELETED ON
 SET POINT TO '.'
 SET SEPARATOR TO ','
 SET DECIMALS TO 8
 SET COMPATIBLE FOXPLUS
ENDPROC
**
FUNCTION Nconcero
 PARAMETER l, nxf
 LOCAL n
 IF EMPTY(nxf) .OR. ISNULL(nxf)
    n = 0
 ENDIF
 DO CASE
    CASE TYPE('nxf')='C'
       n = INT(VAL(nxf))
    CASE TYPE('nxf')='N'
       n = nxf
    CASE TYPE('nxf')='D'
       n = DAY(nxf)*1000000+MONTH(nxf)*10000+YEAR(nxf)
    OTHERWISE
       n = 0
 ENDCASE
 RETURN PADL(LTRIM(STR(n)), l, '0')
ENDFUNC
**
FUNCTION fnumdoc
 PARAMETER n, f, t
 DO CASE
    CASE t=1
       RETURN nconcero(7, n)
    CASE t=2
       RETURN ALLTRIM(STR(YEAR(f)))+'-'+nconcero(5, n)
    CASE t=3
       RETURN IIF(MOD(YEAR(f), 100)<10, '0', '')+ALLTRIM(STR(MOD(YEAR(f), 100)))+IIF(MONTH(f)<10, '0', '')+ALLTRIM(STR(MONTH(f)))+'-'+nconcero(5, n)
    OTHERWISE
       RETURN nconcero(7, n)
 ENDCASE
ENDFUNC
**
PROCEDURE verror
 IF USED('errorbd')
    SELECT errorbd
 ELSE
    SELECT 0
    USE errorbd
 ENDIF
 SET FILTER TO
 SET FILTER TO TTOD(fecha)=DATE()
 = ireport('errorbd')
ENDPROC
**
FUNCTION ireport
 PARAMETER pxrep, pxres, palias, pdocu
 IF printofil
    DO FORM reportefrx WITH pxrep, pxres, palias
 ELSE
    LOCAL i, d, r
    i = 0
    d = 0
    IF EMPTY(pxrep)
       RETURN .F.
    ENDIF
    IF TYPE('pxres')<>'L'
       pxres = .F.
    ENDIF
    IF RECCOUNT()=0
       WAIT WINDOW NOWAIT 'No existen Registros'
       RETURN .T.
    ENDIF
    IF pxres
       r = 'summary'
    ELSE
       r = ''
    ENDIF
    IF pdocu .AND.  .NOT. confimp
       IF  .NOT. EMPTY(impresora) .AND.  .NOT. ISNULL(impresora)
          SET PRINTER TO NAME ALLTRIM(impresora)
          REPORT FORM &pxrep NOWAIT TO PRINTER NOCONS &r
          SET PRINTER TO DEFAULT
       ELSE
          REPORT FORM &pxrep NOWAIT TO PRINTER PROMP NOCONS &r
       ENDIF
    ELSE
       DO WHILE i<>6
          d = MESSAGEBOX('Lo Envia a Pantalla?', 35, empresa)
          DO CASE
             CASE d=6
                WAIT WINDOW NOWAIT 'Espere un momento...'
                REPORT FORM &pxrep PREVIEW NOCONS &r
             CASE d=7
                WAIT WINDOW NOWAIT 'Espere un momento...'
                REPORT FORM &pxrep NOWAIT TO PRINTER PROMPT NOCONS &r
          ENDCASE
          IF d=2
             i = 6
          ELSE
             i = MESSAGEBOX('Imprimió correctamente', 36)
          ENDIF
       ENDDO
    ENDIF
 ENDIF
ENDFUNC
**
FUNCTION conversion
 PARAMETER f
 na = RAND()*100-1
 c3 = IIF(na<10, '0', '')+ALLTRIM(STR(na))+ALLTRIM(STR(MOD(MOD(MOD(DAY(f), 30), 20), 10)))
 nd = MOD(MOD(MOD(MOD(DAY(f), 30), 20), 10), 2)
 IF nd=1
    aa = ALLTRIM(STR(YEAR(f)))
    mm = IIF(MONTH(f)<10, '0', '')+ALLTRIM(STR(MONTH(f)))
    dd = IIF(DAY(f)<10, '0', '')+ALLTRIM(STR(DAY(f)))
    l = aa+mm+dd
    RETURN c3+CHRTRAN(l, '1234567890', 'DANIEL.XYZ')
 ELSE
    aa = ALLTRIM(STR(YEAR(f)))
    mm = IIF(MONTH(f)<10, '0', '')+ALLTRIM(STR(MONTH(f)))
    dd = IIF(DAY(f)<10, '0', '')+ALLTRIM(STR(DAY(f)))
    l = mm+dd+aa
    RETURN c3+CHRTRAN(l, '1234567890', 'PARDO.TUVW')
 ENDIF
ENDFUNC
**
FUNCTION reversion
 PARAMETER j
 nd = INT(VAL(SUBSTR(j, 3, 1)))
 IF MOD(nd, 2)=1
    m = CHRTRAN(SUBSTR(j, 4, 8), 'DANIEL.XYZ', '1234567890')
    aa = INT(VAL(SUBSTR(m, 1, 4)))
    mm = INT(VAL(SUBSTR(m, 5, 2)))
    dd = INT(VAL(SUBSTR(m, 7, 2)))
 ELSE
    m = CHRTRAN(SUBSTR(j, 4, 8), 'PARDO.TUVW', '1234567890')
    mm = INT(VAL(SUBSTR(m, 1, 2)))
    dd = INT(VAL(SUBSTR(m, 3, 2)))
    aa = INT(VAL(SUBSTR(m, 5, 4)))
 ENDIF
 RETURN DATE(aa, mm, dd)
ENDFUNC
**
FUNCTION verilicen
 PARAMETER fl, c
 RETURN .T.
 IF  .NOT. FILE('licen.dbf')
    = MESSAGEBOX('Su liencia a expirado, por favor contacte al proveedor', 0)
    RETURN .F.
 ENDIF
 IF  .NOT. USED('licen')
    SELECT 0
    USE licen
 ENDIF
 SELECT licen
 IF RECCOUNT()=0
    = MESSAGEBOX('Su liencia a expirado, por favor contacte al preveedor', 0)
    RETURN .F.
 ENDIF
 SELECT MAX(reversion(dato)) AS fc FROM licen INTO CURSOR ULTF
 IF fc<fl
    = MESSAGEBOX('Su liencia a expirado, por favor contacte al preveedor', 0)
    RETURN .F.
 ENDIF
 SELECT ultf
 USE
 SELECT licen
 USE
 RETURN .T.
ENDFUNC
**
FUNCTION rellenadh
 PARAMETER t, c1, c2, c3
 LOCAL m, n, ct1, ct2, ct3, na, nx
 m = nomunico()
 n = nomunico()
 o = nomunico()
 IF EMPTY(t) .OR. ISNULL(t) .OR. EMPTY(c1) .OR. ISNULL(c1) .OR. EMPTY(c2) .OR. ISNULL(c2)
    WAIT WINDOW NOWAIT 'No existen nombre de tabla o campos que acumular'
    RETURN .F.
 ENDIF
 IF  .NOT. USED(t)
    RETURN .F.
 ENDIF
 SELE &t
 IF RECCOUNT()=0
    RETURN .F.
 ENDIF
 SELE * FROM &t  INTO TABLE &m  ORDER BY plannivel DESC
 sw = .T.
 SELE MAX(plannivel) AS nivel FROM &t INTO CURSOR tx
 SELECT tx
 IF RECCOUNT()=0
    USE
    RETURN .F.
 ELSE
    nx = nivel
    USE
 ENDIF
 SELE &m
 GOTO TOP
 p = RECNO()
 na = plannivel
 DO WHILE  .NOT. EOF()
    IF ISNULL(idaux)
       SELE &m
       cp = ALLTRIM(plancod)
       IF EMPTY(c3) .OR. ISNULL(c3)
          SELE SUM(&c1) AS &c1, SUM(&c2) AS &c2  FROM &m  WHERE plannivel=na+1 AND LIKE(cp+'*',plancod)  INTO CURSOR  &n
          SELE &n
          ct1=&c1
          ct2=&c2
          SELE &m
          GOTO TOP
          GOTO p
          REPLACE &c1 WITH IIF(ISNULL(ct1),0,ct1)
          REPLACE &c2 WITH IIF(ISNULL(ct2),0,ct2)
       ELSE
          SELE SUM(&c1) AS &c1, SUM(&c2) AS &c2, SUM(&c3) AS &c3  FROM &m  WHERE plannivel=na+1 AND LIKE(cp+'*',plancod)  INTO CURSOR  &n
          SELE &n
          ct1=&c1
          ct2=&c2
          ct3=&c3
          SELE &m
          GOTO TOP
          GOTO p
          REPLACE &c1 WITH IIF(ISNULL(ct1),0,ct1)
          REPLACE &c2 WITH IIF(ISNULL(ct2),0,ct2)
          REPLACE &c3 WITH IIF(ISNULL(ct3),0,ct3)
       ENDIF
    ELSE
       IF ISNULL(&c1) THEN
          REPLACE &c1 WITH 0
       ENDIF
       IF ISNULL(&c2) THEN
          REPLACE &c2 WITH 0
       ENDIF
       IF  .NOT. (EMPTY(c3) .OR. ISNULL(c3))
          IF ISNULL(&c3) THEN
             REPLACE &c3 WITH 0
          ENDIF
       ENDIF
    ENDIF
    SELE &m
    SKIP
    p = RECNO()
    na = plannivel
 ENDDO
 SELE &n
 USE
 SELE * FROM &m ORDER BY plancod INTO CURSOR &o
 SELE &m
 USE
 RETURN o
ENDFUNC
**
FUNCTION swadmin
 LOCAL a
 a = .F.
 DO FORM claveadm TO a
 RETURN a
ENDFUNC
**
FUNCTION diastrab
 PARAMETER fech, feci, fecs
 LOCAL i, f, a
 IF EMPTY(fecs) .OR. ISNULL(fecs)
    fecs = fech
 ENDIF
 IF (fech=DATE(2008, 02, 29) .AND. feci=DATE(2008, 02, 01)) .OR. (fech=DATE(2012, 02, 29) .AND. feci=DATE(2012, 02, 01))
    RETURN 30
 ENDIF
 IF (feci<=fech-DAY(fech)+1) .AND. (ISNULL(fecs) .OR. EMPTY(fecs))
    RETURN 30
 ENDIF
 IF fecs<feci
    RETURN 0
 ENDIF
 IF fecs=feci
    RETURN 1
 ENDIF
 IF feci>fech-DAY(fech)+1
    i = feci
 ELSE
    i = fech-DAY(fech)+1
 ENDIF
 IF fecs<GOMONTH((fech-DAY(fech)+1), 1)
    f = fecs
 ELSE
    f = GOMONTH((fech-DAY(fech)+1), 1)
 ENDIF
 a = 0
 DO CASE
    CASE MONTH(fech)=2
       a = 3
    CASE MONTH(fech)=3 .OR. MONTH(fech)=4 .OR. MONTH(fech)=6 .OR. MONTH(fech)=9 .OR. MONTH(fech)=11
       a = 1
    CASE MONTH(fech)=1 .OR. MONTH(fech)=5 .OR. MONTH(fech)=7 .OR. MONTH(fech)=8 .OR. MONTH(fech)=10 .OR. MONTH(fech)=12
       a = 0
 ENDCASE
 IF fecs<GOMONTH((fech-DAY(fech)+1), 1)-1
    a = 1
 ENDIF
 RETURN IIF(f-i+a=0, 1, IIF(f-i+a>=31, 30, f-i+a))
ENDFUNC
**
FUNCTION abreviacta
 PARAMETER nomcta
 nomctares = nomcta
 nomctares = STRTRAN(nomctares, ' POR ', ' X ')
 nomctares = STRTRAN(nomctares, ' DE ', ' ')
 nomctares = STRTRAN(nomctares, 'CUENTA ', 'CTA ')
 nomctares = STRTRAN(nomctares, 'CUENTAS ', 'CTAS ')
 nomctares = STRTRAN(nomctares, 'DOCUMENTO', 'DOC')
 nomctares = STRTRAN(nomctares, 'DESCUENTO', 'DSCTO')
 nomctares = STRTRAN(nomctares, 'CONSIGNACION', 'CONSIG')
 nomctares = STRTRAN(nomctares, 'PENDIENTE', 'PENDTE')
 nomctares = STRTRAN(nomctares, 'CHEQUE', 'CHQ')
 nomctares = STRTRAN(nomctares, 'IMPUESTO ', 'IMP ')
 nomctares = STRTRAN(nomctares, 'RETENCION ', 'RET ')
 nomctares = STRTRAN(nomctares, 'FUENTE ', 'FTE ')
 nomctares = STRTRAN(nomctares, 'GASTOS ', 'GTOS ')
 RETURN nomctares
ENDFUNC
**
FUNCTION RestarHoras
 PARAMETER chora1, chora2
 m.hora1 = SUBSTR(chora1, 1, 2)+":"+SUBSTR(chora1, 3, 2)
 m.hora2 = SUBSTR(chora2, 1, 2)+":"+SUBSTR(chora2, 3, 2)
 horas1 = VAL(SUBSTR(m.hora1, 1, 2))*60
 minutos1 = VAL(SUBSTR(m.hora1, 4, 2))*60
 segundos1 = VAL(SUBSTR(m.hora1, 7, 2))*60
 horas2 = VAL(SUBSTR(m.hora2, 1, 2))*60
 minutos2 = VAL(SUBSTR(m.hora2, 4, 2))*60
 segundos2 = VAL(SUBSTR(m.hora2, 7, 2))*60
 horas3 = (horas1-horas2)/60
 minutos3 = (minutos1-minutos2)/60
 segundos3 = (segundos1-segundos2)/60
 IF segundos3<0
    minutos3 = minutos3-1
    segundos3 = segundos3+60
 ENDIF
 IF minutos3<0
    horas3 = horas3-1
    minutos3 = minutos3+60
 ENDIF
 IF horas3<0
    horas3 = 0
 ENDIF
 m.horafin = PADL(ALLTRIM(STR(horas3)), 2, '0')+':'+PADL(ALLTRIM(STR(minutos3)), 2, '0')+':'+PADL(ALLTRIM(STR(segundos3)), 2, '0')
 RETURN m.horafin
ENDFUNC
**
FUNCTION NumeroHoras
 PARAMETER pnumero
 pnumero = ROUND((pnumero/100), 2)
 entero = INT(pnumero)
 decimales = ((60*(pnumero-INT(pnumero))*100))/100
 m.horafin = PADL(ALLTRIM(STR(entero)), 2, '0')+':'+PADL(ALLTRIM(STR(decimales)), 2, '0')+':00'
 RETURN m.horafin
ENDFUNC
**
FUNCTION HorasNumeros
 PARAMETER phora
 m.horafin = (VAL(SUBSTR(phora, 1, 2))+(VAL(SUBSTR(phora, 4, 2))/60))*100
 RETURN m.horafin
ENDFUNC
**
FUNCTION dhora
 PARAMETER hmayor, hmenor
 RETURN PADL(ALLTRIM(STR(INT((CTOT(hmayor)-CTOT(hmenor))/3600))), 2, "0")+":"+PADL(ALLTRIM(STR(INT(MOD((CTOT(hmayor)-CTOT(hmenor)), 3600))/60)), 2, "0")
ENDFUNC
**
FUNCTION Suma_Horas
 LPARAMETERS _dte, _dtsc, _dtec, _dts
 nret = ""
 STORE 0 TO h1, h2, h3, h4, m1, m2, m3, m4
 IF  .NOT. ISNULL(_dte)
    h1 = HOUR(_dte)
    m1 = MINUTE(_dte)
 ENDIF
 IF  .NOT. ISNULL(_dtsc)
    h2 = HOUR(_dtsc)
    m2 = MINUTE(_dtsc)
 ENDIF
 IF  .NOT. ISNULL(_dtec)
    h3 = HOUR(_dtec)
    m3 = MINUTE(_dtec)
 ENDIF
 IF  .NOT. ISNULL(_dts)
    h4 = HOUR(_dts)
    m4 = MINUTE(_dts)
 ENDIF
 nh1 = 0
 nm1 = 0
 nh2 = 0
 nm2 = 0
 IF h1>0 .AND. h2>0 .AND. h3>0 .AND. h4>0
    IF m2-m1>=0
       nh1 = h2-h1
       nm1 = ABS(m2-m1)
    ELSE
       nh1 = h2-h1-1
       IF m2<>m1
          nm1 = 60-ABS(m1-m2)
       ELSE
          nm1 = 0
       ENDIF
    ENDIF
    IF m4-m3>=0
       nh2 = h4-h3
       nm2 = ABS(m4-m3)
    ELSE
       nh2 = h4-h3-1
       IF m4<>m3
          nm2 = 60-ABS(m4-m3)
       ELSE
          nm2 = 0
       ENDIF
    ENDIF
 ENDIF
 IF (h1>0 .AND. h2=0 .AND. h4>0)
    IF m4-m1>=0
       nh1 = h4-h1
       nm1 = ABS(m4-m1)
    ELSE
       nh1 = h4-h1-1
       IF m1<>m4
          nm1 = 60-ABS(m1-m4)
       ELSE
          nm1 = 0
       ENDIF
    ENDIF
 ENDIF
 IF nh2>0 .AND. nh1>0
    nh1 = nh1+nh2
    IF nm2+nm1>=60
       nh1 = nh1+1
       nm1 = ABS(60-(nm1+nm2))
    ELSE
       nm1 = ABS(nm2-nm1)
    ENDIF
 ENDIF
 IF nm1>=45
    nh1 = nh1+1
 ENDIF
 nm1 = 0
 cvalor = STR(nh1, 2)+"."+STR(nm1, 2)
 nret = VAL(cvalor)
 RETURN nret
ENDFUNC
**
FUNCTION sumarhoras
 PARAMETER chora1, chora2
 nhoras = 0
 nmin = 0
 nseg = VAL(SUBSTR(chora1, 7, 2))+VAL(SUBSTR(chora2, 7, 2))
 DO WHILE nseg>=60
    nmin = nmin+1
    nseg = nseg-60
 ENDDO
 nmin = nmin+VAL(SUBSTR(chora1, 4, 2))+VAL(SUBSTR(chora2, 4, 2))
 DO WHILE nmin>=60
    nhoras = nhoras+1
    nmin = nmin-60
 ENDDO
 nhoras = nhoras+VAL(SUBSTR(chora1, 1, 2))+VAL(SUBSTR(chora2, 1, 2))
 m.horafin = PADL(LTRIM(STR(nhoras)), 2, '0')+':'+PADL(LTRIM(STR(nmin)), 2, '0')+':'+PADL(LTRIM(STR(nseg)), 2, '0')
 RETURN m.horafin
ENDFUNC
**
FUNCTION _StrTo128C
 LPARAMETERS tcstring
 LOCAL lcstart, lcstop, lcret, lccheck, lccar, lnlong, lni, lnchecksum, lnasc
 lcstart = CHR((0137))
 lcstop = CHR((0138))
 lnchecksum = ASC(lcstart)-32
 lcret = ALLTRIM(tcstring)
 lnlong = LEN(lcret)
 IF MOD(lnlong, 2)<>0
    lcret = '0'+lcret
    lnlong = LEN(lcret)
 ENDIF
 lccar = ''
 FOR lni = 1 TO lnlong STEP 2
    lccar = lccar+CHR(VAL(SUBSTR(lcret, lni, 2))+32)
 ENDFOR
 lcret = lccar
 lnlong = LEN(lcret)
 FOR lni = 1 TO lnlong
    lnasc = ASC(SUBSTR(lcret, lni, 1))-32
    lnchecksum = lnchecksum+(lnasc*lni)
 ENDFOR
 lccheck = CHR(MOD(lnchecksum, 103)+32)
 lcret = lcstart+lcret+lccheck+lcstop
 lcret = STRTRAN(lcret, CHR(32), CHR(232))
 lcret = STRTRAN(lcret, CHR(127), CHR(192))
 lcret = STRTRAN(lcret, CHR(128), CHR(193))
 RETURN lcret
ENDFUNC
**
FUNCTION numtxt
 PARAMETER nin, lon
 LOCAL l
 l = LEN(ALLTRIM(STR(nin, 14, 2)))
 nt = IIF(l>6, SUBSTR(ALLTRIM(STR(nin, 14, 2)), 1, l-6)+','+SUBSTR(ALLTRIM(STR(nin, 14, 2)), l-5, l), ALLTRIM(STR(nin, 14, 2)))
 IF EMPTY(lon) .OR. ISNULL(lon)
    RETURN nt
 ELSE
    RETURN IIF(LEN(nt)<lon, REPLICATE(' ', lon-LEN(nt))+nt, nt)
 ENDIF
ENDFUNC
**
FUNCTION ticket
 LOCAL fila, arch, ni, columnas, ndoc, lnfile, fi
 columnas = 40
 SET ECHO OFF
 SET TALK OFF
 arch = ALLTRIM(nomunico())+'.txt'
 lnfile = FCREATE(arch)
 IF lnfile<0
    FCLOSE(lnfile)
    lnfile = FCREATE(arch)
    IF lnfile<0
       MESSAGEBOX("Error al Crear Archivo de impresion "+CHR(13)+cfile, 0, empresa)
       RETURN (.F.)
    ENDIF
 ENDIF
 IF USED('documents')
    SELECT documents
    GOTO TOP
 ELSE
    RETURN
 ENDIF
 fila = 2
 ni = 0
 DO CASE
    CASE LIKE('*FACTURA*', nomdoc)
       ndoc = 'FACTURA'
    CASE LIKE('*NOTA DE VENTA*', nomdoc)
       ndoc = 'NOTA DE VENTA'
    OTHERWISE
       ndoc = nomdoc
 ENDCASE
 FPUTS(lnfile, 'No Factura: _______ T. Pagar:________ ')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, SPACE((columnas-LEN(ALLTRIM(ndoc)))/2)+ALLTRIM(ndoc))
 FPUTS(lnfile, 'Cod. Trans: '+nconcero(6, code))
 FPUTS(lnfile, 'Cliente:   '+SUBSTR(ALLTRIM(sname), 1, 22))
 FPUTS(lnfile, 'Direccion: '+SUBSTR(ALLTRIM(saddr), 1, 22))
 FPUTS(lnfile, '--------------------------------------')
 FPUTS(lnfile, 'FECHA:      '+SUBSTR(achar(fecgra), 1, LEN(achar(fecgra))-6))
 FPUTS(lnfile, 'VENDEDOR:   '+SUBSTR(vendedor, 1, 22))
 FPUTS(lnfile, '--------------------------------------')
 FPUTS(lnfile, 'CANT   UNI      UNITARIO      VALOR   ')
 FPUTS(lnfile, '--------------------------------------')
 DO WHILE  .NOT. EOF()
    FPUTS(lnfile, SUBSTR(iname, 1, 38)+'  '+STR(qty, 6, 2)+' '+SUBSTR(unidad, 1, 4)+' '+STR(IIF(isiva, ROUND(punitario*(1+iva/100), 6), ROUND(punitario, 6)), 10, 4)+' '+numtxt(IIF(isiva, ROUND(punitario*qty*(1+iva/100), 2), ROUND(punitario*qty, 2)), 10)+' '+IIF(isiva, '*', ''))
    ni = ni+1
    SKIP
 ENDDO
 GOTO TOP
 FPUTS(lnfile, '--------------------------------------')
 FPUTS(lnfile, '# Items: '+STR(ni, 3)+'      TOTAL: '+numtxt(montototal, 8))
 FPUTS(lnfile, '--------------------------------------')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, ' EMPACADO POR:_______________________')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, ' ROLLO/RESMA:______      FUNDA:______')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, ' CARTONES:______  TOTAL BULTOS:______')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, ' ')
 FPUTS(lnfile, SPACE((columnas-LEN(ALLTRIM('**GRACIAS POR SU COMPRA**')))/2)+'**GRACIAS POR SU COMPRA**')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FPUTS(lnfile, '')
 FCLOSE(lnfile)
 fi = 'type '+SYS(2003)+'\'+arch+' >prn'
 ! &fi
 fi = SYS(2003)+'\'+arch
 DELETE FILE &fi
ENDFUNC
**
