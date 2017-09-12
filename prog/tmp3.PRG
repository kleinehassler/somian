***abre un archivo, asociandolo con la aplicación correspondiente

? ShellExec("mailto:juanperez@mail.com")




FUNCTION ShellExec 


LPARAMETER lcLink, lcAction, lcParms

lcAction = IIF(EMPTY(lcAction), "Open", lcAction) 
lcParms = IIF(EMPTY(lcParms), "", lcParms)

DECLARE INTEGER ShellExecute ; 
IN SHELL32.dll ; 
INTEGER nWinHandle, ; 
STRING cOperation, ; 
STRING cFileName, ; 
STRING cParameters, ; 
STRING cDirectory, ; 
INTEGER nShowWindow

DECLARE INTEGER FindWindow ; 
IN WIN32API ; 
STRING cNull,STRING cWinName

RETURN ShellExecute(FindWindow(0, _SCREEN.caption), lcAction, lcLink,  lcParms, SYS(2023), 1)

ENDFUN
