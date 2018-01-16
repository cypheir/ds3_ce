#InstallKeybdHook
#InstallMouseHook
#NoEnv

#Include ds3_controlexpansion\variables.ahk

OnStart:
	
	;////////// Initialize Session //////////
	IniRead, currentSettingsFile, ds3_controlexpansion\session.ini, Session, current
	IniRead, DS3_installpath, ds3_controlexpansion\session.ini, Session, DS3_installpath
	
	;//////// Initialize Application ////////
	CheckInstallPath()
	LoadSettingsFile()
	AssignSpellKeys()
	AssignItemKeys()
	BuildGUI()
	
	;/////// GUI / Functions / Labels ///////
	#include ds3_controlexpansion\ceFunc.ahk

	;/////// Import My Customizations ///////
	#include ds3_controlexpansion\MyCustoms.ahk
		
	;///////// Hotkey Control Binds /////////
	#IfWinActive ahk_exe DarkSoulsIII.exe
	<^F1::GoSub, Refresh
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	<^<+F1::GoSub, Settings
	
	#IfWinActive ahk_exe DarkSoulsIII.exe
	^!WheelUp::	
		send {%nextSpell% down}
		sleep, 60
		send {%nextSpell% up}
		return
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	^!WheelDown::
		send {%nextItem% down}
		sleep, 60
		send {%nextItem% up}
		return