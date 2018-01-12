#InstallKeybdHook
#InstallMouseHook
#NoEnv

#Include ds3_controlexpansion\variables.ahk

OnStart:
	Menu, tray, deleteall
	
	IniRead, currentSettingsFile, ds3_controlexpansion\session.ini, Session, current
	IniRead, DS3_installpath, ds3_controlexpansion\session.ini, Session, DS3_installpath
	
	CheckInstallPath()
	CheckIniFile()
	LoadSettingsFile()
	AssignSpellKeys()
	AssignItemKeys()
	BuildGUI()
	
	;/////// GUI / Functions / Labels ///////
	#include ds3_controlexpansion\ceFunc.ahk