
frmprin = CREATEOBJECT("FORM")
frmprin.AddObject("label1", "LABEL")
frmprin.AddObject("LABEL2", "LABEL")
frmprin.AddObject("TEXT1", "TEXTBOX")
frmprin.AddObject("TEXT2", "TEXTBOX")
frmprin.AddObject("COMMAND1", "CMDACEPTAR")
frmprin.AddObject("COMMAND2", "CMDSALIR")

frmprin.visible=.t.
frmprin.enabled=.t.
frmprin.autocenter=.t.
frmprin.caption='Registrar fecha de Vencimiento'
frmprin.height=140
frmprin.width=300

WITH frmprin.LABEL1
	.AUTOSIZE=.T.
	.HEIGHT=17
	.LEFT=12
	.TOP=25
	.WIDTH=58
	.CAPTION='Password'
	.fontbold=.t.
	.visible=.t.
endwith

WITH frmprin.LABEL2
	.AUTOSIZE=.T.
	.HEIGHT=17
	.LEFT=12
	.TOP=64
	.WIDTH=124
	.CAPTION='Fecha de Vencimiento'
	.fontbold=.t.
	.visible=.t.
endwith

WITH frmprin.text1
	.HEIGHT=23
	.LEFT=152
	.TOP=19
	.WIDTH=100
	.inputmask='!!!!!!!!!!!!!!'
	.passwordchar='*'
	.visible=.t.
endwith

WITH frmprin.text2
	.alignment=3
	.HEIGHT=23
	.LEFT=152
	.TOP=58
	.WIDTH=100
	.value={}
	.visible=.t.
endwith

WITH frmprin.command1
	.caption='Aceptar'
	.HEIGHT=27
	.LEFT=48
	.TOP=97
	.WIDTH=84
	.fontbold=.t.
	.visible=.t.
endwith

WITH frmprin.command2
	.caption='Salir'
	.HEIGHT=27
	.LEFT=148
	.TOP=97
	.WIDTH=84
	.fontbold=.t.
	.visible=.t.
endwith

read even


DEFINE CLASS cmdaceptar AS COMMANDBUTTON

    PROCEDURE Click
    if thisform.text1.value='DANIELPARDO' then
    	m.dato=conversion(thisform.text2.value)
    	insert into licen from memvar
    	sele licen
    	use
    	=messagebox('Registrado',0)
    endif
   	thisform.command2.click
    	
ENDDEFINE

DEFINE CLASS cmdsalir AS COMMANDBUTTON

    PROCEDURE Click
    	CLEAR EVENTS
    	thisform.release
ENDDEFINE

