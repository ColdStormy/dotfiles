;#SETUP START
#SingleInstance force
ListLines 0
SendMode "Input"
SetWorkingDir A_ScriptDir
KeyHistory 0
#WinActivateForce

ProcessSetPriority "H"

SetWinDelay -1
SetControlDelay -1


;include the library
;#Include VD.ah2
#Include %A_LineFile%\..\VD.ah2
; VD.init() ;COMMENT OUT `static dummyStatic1 := VD.init()` if you don't want to init at start of script

return

; WIN+CTRL+(Left|Right)
^#Left::VD.goToRelativeDesktopNum(-1)
^#Right::VD.goToRelativeDesktopNum(+1)

; WIN+ALT+(Left|Right)
#!Left::{
	VD.MoveWindowToRelativeDesktopNum("A", -1)
}
#!Right::{
	VD.MoveWindowToRelativeDesktopNum("A", 1)
}