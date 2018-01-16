
;   __ GUI ____________________________________

	BuildGUI()
	{
		; Menu, Tray, Icon, %DS3_installpath%
		Menu, Tray, Icon, ds3icon.ico
		Menu, Tray, Tip, Dark Souls 3`nHotbar Conversion 1.5

		Menu, tray, add, Launch Dark Souls 3, LaunchDS3  ; Creates a new menu item.
		Menu, tray, add, Reload Script, Refresh
		Menu, tray, add, Settings, Settings
		Menu, tray, add  ; Creates a separator line.
		
		Menu, Tray, NoStandard
		Menu, Tray, Standard
		Return
	}
	
		LaunchDS3:
			IfWinExist ahk_exe DarkSoulsIII.exe
				WinActivate
			else
				Run, %DS3_installpath%
			Return

		Refresh:
			Reload
			Sleep 1000
			MsgBox, 4,, The script could not be reloaded. Please close and relaunch manually.
			Return
		
		Settings:		
			; Column 1
				Gui, Add, Text, x12 y9 w194 h20 +Center, [ Main Settings ]
				
				Gui, Add, Text, x12 y39 w90 h20 +Center, Item Count
				Gui, Add, DropDownList, x112 y35 w40 +Center vitemChoice, 1|2|3|4|5|6|7|8|9|10
				GuiControl, Choose, itemChoice, |%itemCnt% 
				
				Gui, Add, Text, x12 y69 w90 h20 +Center, Spell Count
				Gui, Add, DropDownList, x112 y65 w40 +Center vspellChoice, 0|1|2|3|4|5|6|7|8|9|10
				tempSpellCnt := spellCnt + 1
				GuiControl, Choose, spellChoice, |%tempSpellCnt% 
								
				Gui, Add, Radio, x104 y100 w80 Group Checked%spellMode% vcastChoice, Focus
				Gui, Add, Radio, x30 y100 w70 Checked%weapCast%, Weapon
				
				Gui, Add, Text, x12 y129 w70 h20 +Right, Use Item = 
				Gui, Add, Edit, x86 y126 w80 h20 cGreen +Center vuseItemM, %useItem%
			
				Gui, Add, Text, x12 y159 w70 h20 +Right, RH Light = 
				Gui, Add, Edit, x86 y156 w80 h20 cGreen +Center vRHLightM, %atkMHLight%
			
				Gui, Add, Text, x12 y189 w70 h20 +Right, RH Strong = 
				Gui, Add, Edit, x86 y186 w80 h20 cGreen +Center vRHStrongM, %atkMHStrong%
			
				Gui, Add, Text, x12 y219 w70 h20 +Right, LH Light = 
				Gui, Add, Edit, x86 y216 w80 h20 cGreen +Center vLHLightM, %atkOHLight%
			
				Gui, Add, Text, x12 y249 w70 h20 +Right, LH Strong = 
				Gui, Add, Edit, x86 y246 w80 h20 cGreen +Center vLHStrongM, %atkOHStrong%
			
				Gui, Add, Text, x12 y279 w70 h20 +Right, Next Spell = 
				Gui, Add, Edit, x86 y276 w80 h20 cGreen +Center vnextSpellM, %nextSpell%
				
				Gui, Add, Text, x12 y309 w70 h20 +Right, Next Item = 
				Gui, Add, Edit, x86 y306 w80 h20 cGreen +Center vnextItemM, %nextItem%
				
				
			; Column 2a  ItemBinds |  X Starting at 194, Y starting at 9
				Gui, Add, Text, x194 y9 w102 h20 +Center, [ Item Binds ]
				
				col2a_y := 9
				
				iteration := 1
				new_y := col2a_y + 30
				
				Loop 10
				{
					if (iteration > itemCnt)
						ROvar := "cSilver"
					else
						ROvar := "cBlack"
						
					currentItem := "item" . iteration
					
					Gui, Add, Text, x182 y%new_y% w50 h20 %ROvar% +Right, Slot %iteration% = 
					
					new_y -= 3
					tempItem := (%currentItem%)
					
					if (iteration > itemCnt)
						ROvar := "cSilver"
					else
						ROvar := "cGreen"
					Gui, Add, Edit, x240 y%new_y% w60 h20 %ROvar% +Center vitem%iteration%, %tempItem%
					
					iteration++
					new_y += 33
				}
			
			; Column 2b  AltItems |  X Starting at 308, Y starting at 9
				Gui, Add, Text, x308 y9 w102 h20 +Center, [ Alt-Item Binds ]

				col2b_y := 9
				new_y := col2b_y + 30
				
				iteration := 1
				Loop 10
				{
					if (iteration > itemCnt)
						ROvar := "cSilver"
					else
						ROvar := "cBlack"
						
					currentItem := "item" . iteration . "a"
					
					Gui, Add, Text, x308 y%new_y% w50 h20 %ROvar% +Right, Slot %iteration%a = 
					
					new_y -= 3
					tempItem := (%currentItem%)
					
					if (iteration > itemCnt)
						ROvar := "cSilver"
					else
						ROvar := "cGreen"
					Gui, Add, Edit, x366 y%new_y% w60 h20 %ROvar% +Center vitem%iteration%a, %tempItem%
					
					iteration++
					new_y += 33
				}
				
			; Column 3  SpellsMain |  X Starting at 446, Y starting at 9
				Gui, Add, Text, x446 y9 w120 h20 +Center, [ Spell Binds ]
				Gui, Add, Text, x590 y9 w120 h20 +Center, L / R       Chg | OR | UP 
				
				col3a_y := 9
				new_y := col3a_y + 30
				
				iteration := 1
				
				Loop 10
				{
					if (iteration > spellCnt)
						ROvar := "cSilver"
					else
						ROvar := "cBlack"
					Gui, Add, Text, x446 y%new_y% w50 h20 %ROvar% +Right, Slot %iteration% = 
					
					new_y -= 3
					
					currentSpell := "spell" . iteration
					tempSpell := (%currentSpell%)
					
					if (iteration > spellCnt)
						ROvar := "cSilver"
					else
						ROvar := "cGreen"
					if (iteration = 1)
						ROvar2 := "ReadOnly"
					else
						ROvar2 := ""
					Gui, Add, Edit, x500 y%new_y% w80 h20 %ROvar% %ROvar2% +Center vspell%iteration%, %tempSpell%
					
					Gui, Add, DropDownList, x592 y%new_y% w36 h70 cGreen +Center vspell%iteration%_hand, L|R
					
					currentHand := "spell" . iteration . "_hand"
					temp_Hand := (%currentHand%)
					GuiControl, Choose, spell%iteration%_hand, |%temp_hand%
					
					if (iteration != 1)
					{
						currentHold := "spell" . iteration . "_hold"
						temp_Hold := (%currentHold%)				
						Gui, Add, Checkbox, x644 y%new_y% w20 h20 Checked%temp_hold% vspell%iteration%_holdM, 
						
						currentTypeOverride := "spell" . iteration . "_typeOverride"
						temp_TypeOverride := (%currentTypeOverride%)			
						Gui, Add, Checkbox, x668 y%new_y% w20 h20 Checked%temp_typeOverride% vspell%iteration%_typeOverrideM,
						
						currentUP := "spell" . iteration . "_UP"
						temp_UP := (%currentUP%)
						Gui, Add, Checkbox, x692 y%new_y% w20 h20 Checked%temp_UP% vspell%iteration%_UPM, 
					}
					
					iteration++
					ROvar := ""
					new_y += 33
				}
				
			; Column 4  AltSpells |  X Starting at 722, Y starting at 9
				Gui, Add, Text, x722 y9 w120 h20 +Center, [ Alt-Spell Binds ]
				Gui, Add, Text, x866 y9 w120 h20 +Center, L / R       Chg | OR | UP 
				
				col4_x := 722
				col4_y := 9
				new_y := col4_y + 30
					
				iteration := 1
				
				Loop 10
				{
					if (iteration > spellCnt)
						ROvar := "cSilver"
					else
						ROvar := "cBlack"
					Gui, Add, Text, x722 y%new_y% w50 h20 %ROvar% +Right, Slot %iteration%a = 
					
					new_y -= 3
					
					currentSpell := "spell" . iteration . "a"
					tempSpell := (%currentSpell%)
					
					if (iteration > spellCnt)
						ROvar := "cSilver"
					else
						ROvar := "cGreen"
					Gui, Add, Edit, x776 y%new_y% w80 h20 %ROvar% +Center vspell%iteration%a, %tempSpell%
					
					Gui, Add, DropDownList, x868 y%new_y% w36 h70 cGreen +Center vspell%iteration%a_hand, L|R
					
					currentHand := "spell" . iteration . "a_hand"
					temp_Hand := (%currentHand%)
					GuiControl, Choose, spell%iteration%a_hand, |%temp_hand%
					
					currentHold := "spell" . iteration . "a_hold"
					temp_Hold := (%currentHold%)				
					Gui, Add, Checkbox, x920 y%new_y% w20 h20 Checked%temp_hold% vspell%iteration%a_holdM, 
					
					currentTypeOverride := "spell" . iteration . "a_typeOverride"
					temp_TypeOverride := (%currentTypeOverride%)			
					Gui, Add, Checkbox, x944 y%new_y% w20 h20 Checked%temp_typeOverride% vspell%iteration%a_typeOverrideM, 
					
					currentUP := "spell" . iteration . "a_UP"
					temp_UP := (%currentUP%)
					Gui, Add, Checkbox, x968 y%new_y% w20 h20 Checked%temp_UP% vspell%iteration%a_UPM, 
					
					iteration++
					ROvar := ""
					new_y += 33
				}
				
			; Install Path  |  X Starting at 12, Y starting at 439, W about 446
			Gui, Add, Text, x24 y352 w64 h20 +Left, Install Path = 
			Gui, Add, Text, x88 y352 w700 h20 cGreen +Left, %DS3_installpath%
			GuiControl, Text, Folder, %DS3_installpath% 
			
			; Show Current ini
			Gui, Add, Text, x96 y388 w80 h20 +Left, Current .ini File = 
			Gui, Add, Text, x178 y388 w700 h20 cGreen +Left, %currentSettingsFile%
			
			; Buttons
			Gui, Add, Button, x12 y380 w80 h30, ChangeIni
			Gui, Add, Button, x716 y380 w80 h30, Abandon
			Gui, Add, Button, x806 y380 w80 h30, Apply
			Gui, Add, Button, x896 y380 w80 h30 Default, OK
			
			Gui, Show, w998 h418, Settings
			Return
			
				GuiEscape:
				GuiClose:
				ButtonAbandon:
					Gui, Destroy
					
					IfWinExist ahk_exe DarkSoulsIII.exe
						WinActivate
					Return
					
				ButtonChangeIni:
					FileSelectFile, selectedFile, 9, %A_WorkingDir%, "Select your config file", (*.ini)
					IniWrite, %selectedFile%, ds3_controlexpansion\session.ini, Session, current
					
					Gui, Destroy
					Gosub, OnStart
					
					IfWinExist ahk_exe DarkSoulsIII.exe
						WinActivate
					
					; Sleep, 300
					; GoSub, Settings
					return
					
				ButtonApply:
					Gui, Submit, NoHide
					iteration := 1
					Loop 10
					{
						spell%iteration%_hold := spell%iteration%_holdM
						spell%iteration%_typeOverride := spell%iteration%_typeOverrideM
						spell%iteration%_UP := spell%iteration%_UPM
						
						spell%iteration%a_hold := spell%iteration%a_holdM
						spell%iteration%a_typeOverride := spell%iteration%a_typeOverrideM
						spell%iteration%a_UP := spell%iteration%a_UPM
						
						iteration++
					}
					
					itemCnt := itemChoice
					spellCnt := spellChoice
					spellMode := castChoice
						
					useItem := UseItemM
					atkMHLight := RHLightM
					atkMHStrong := RHStrongM
					atkOHLight := LHLightM
					atkOHStrong := LHStrongM
					nextSpell := nextSpellM
					nextItem := nextItemM
					
					SaveSettingsFile()
					Sleep, 300
					
					Gui, Destroy
					Menu, tray, deleteall
					Gosub, OnStart
					
					IfWinExist ahk_class AutoHotkeyGUI
						WinActivate		
					
					GoSub, Settings
					Return
					
				ButtonOK:
					Gui, Submit, NoHide
					
					iteration := 1
					Loop 10
					{
						spell%iteration%_hold := spell%iteration%_holdM
						spell%iteration%_typeOverride := spell%iteration%_typeOverrideM
						spell%iteration%_UP := spell%iteration%_UPM
						
						spell%iteration%a_hold := spell%iteration%a_holdM
						spell%iteration%a_typeOverride := spell%iteration%a_typeOverrideM
						spell%iteration%a_UP := spell%iteration%a_UPM
						
						iteration++
					}
					
					itemCnt := itemChoice
					spellCnt := spellChoice
					spellMode := castChoice
						
					useItem := UseItemM
					atkMHLight := RHLightM
					atkMHStrong := RHStrongM
					atkOHLight := LHLightM
					atkOHStrong := LHStrongM
					nextSpell := nextSpellM
					nextItem := nextItemM
					
					SaveSettingsFile()
					Sleep, 300
					
					Gui, Destroy
					Menu, tray, deleteall
					Gosub, OnStart
					
					IfWinExist ahk_exe DarkSoulsIII.exe
						WinActivate				
					Return


;   __ FUNCTIONS ____________________________________	
	
	; Item User
	#IfWinActive ahk_exe DarkSoulsIII.exe
	UseItem(F_itemNmbr, F_itemCnt, F_sendKey)
	{
		; ///////// Set Locks /////////
		if (BindsActive = 1 || F_itemCnt < F_itemNmbr)
			Exit
		global BindsActive := 1
		
		; /////// Set Variables ///////
		F_start := F_itemNmbr - 1
		F_end := F_itemCnt - F_start
		
		; //// Select item ////
		SelectUse(F_start, "item")
		
		; ///////// Loop to simulate use item press //////////		
		Loop 
		{	
			send {%useItem% down}
			sleep, 60
			send {%useItem% up}
			
			Loop 12
			{
				if not GetKeyState(CleanKey(F_sendKey), "P") 
					break 2				
				sleep, 50
			}
		}
		sleep, 100
		
		; ///////// Loop to reselect home-item //////////
		ReselectHome(F_start, F_end, "item")
		sleep, 100
		
		; ///////// Reset Locks /////////
		global BindsActive := 0
		Return
	}
	
	; Spell User
	#IfWinActive ahk_exe DarkSoulsIII.exe
	UseSpell(F_spellNmbr, F_spellCnt, F_sendKey, F_spellHold, F_spellUP, F_spellHand, F_spellOverride)
	{
		if (BindsActive = 1 || F_spellCnt < F_spellNmbr)
			Exit
		global BindsActive := 1
		
		F_start := F_spellNmbr - 1
		F_end := F_spellCnt - F_start
		
		SelectUse(F_start, "spell")
		
		; Charge up Loop
		if (F_spellHold = 1 || F_sendKey = atkMHLight || F_sendKey = atkMHStrong || F_sendKey = atkOHLight || F_sendKey = atkOHStrong)
		{
			tempKey := MacroCheck(F_spellHand, F_spellOverride, F_spellUP)
			pressKeyDown := pressKeyDown(tempKey)
			global ADownResult := pressKeyDown
			pressKeyUp := pressKeyUp(tempKey)
			global AnUpResult := pressKeyUp
			
			send %pressKeyDown%
			cleanKey := CleanKey(F_sendKey)
			Loop 
			{				
				if not GetKeyState(cleanKey, "P") 
					break
				sleep, 30
			} 
			send %pressKeyUp%
		}
		; Rapid Fire Loop
		else
		{
			tempKey := MacroCheck(F_spellHand, F_spellOverride, F_spellUP)
			pressKeyDown := pressKeyDown(tempKey)
			global ADownResult := pressKeyDown
			pressKeyUp := pressKeyUp(tempKey)
			global AnUpResult := pressKeyUp
			
			Loop
			{
				send %pressKeyDown%
				sleep, 60
				send %pressKeyUp%
				
				cleanKey := CleanKey(F_sendKey)
				Loop 12
				{
					if not GetKeyState(cleanKey, "P")
						break 2
					sleep, 50
				}
			}
		}
		sleep, 100
		
		ReselectHome(F_start, F_end, "spell")
		sleep, 200
		
		global BindsActive := 0	
		Return
	}
	
	CheckInstallPath()
	{
		if !(DS3_installpath)
		{
			FileSelectFile, SelectedFile, 1, , Select folder containing "DarkSoulsIII.exe", (DarkSoulsIII.exe)
			if !(SelectedFile)
			{
				MsgBox, No file selected
				ExitApp
			}
			else
			{
				IniWrite, %SelectedFile%, ds3_controlexpansion\session.ini, Session, DS3_installpath
				GoSub, OnStart
			}
		}
		else if InStr(DS3_installpath, "\Game\DarkSoulsIII.exe")
		{
			return
		}		
		else
		{
			MsgBox There was a problem locating game file.
			ExitApp
		}
		return
	}
		
	MacroCheck(F_spellHand, F_spellOverride, F_spellUP)
	{
		if (F_spellHand = "R")
		{
			if (F_spellOverride = 1 && spellMode = 1 || F_spellUP = 1 && spellMode = 2)
				return otherMacroR
			else
				return spellMacroR
		}
		else 
		{
			if (F_spellOverride = 1 && spellMode = 1 || F_spellUP = 1 && spellMode = 2)
				return otherMacro
			else
				return spellMacro
		}
	}
	
	MacroReplace(F_inName)
	{
		if InStr(F_inName, "SPELLMACRO")
			StringReplace, F_inName, F_inName, SPELLMACRO, %spellMacro%, All
		if InStr(F_inName, "ALTMACRO")
			StringReplace, F_inName, F_inName, ALTMACRO, %otherMacro%, All		
		Return, F_inName
	}
	
	CleanKey(F_sendKey)
	{
		StringReplace, F_cleanKey, F_sendKey, *, , All 
		;if !InStr(F_sendKey, "<")
		StringReplace, F_cleanKey, F_cleanKey, <, , All 
		StringReplace, F_cleanKey, F_cleanKey, >, , All 
		StringReplace, F_cleanKey, F_cleanKey, ^, , All 
		StringReplace, F_cleanKey, F_cleanKey, +, , All 
		StringReplace, F_cleanKey, F_cleanKey, !, , All 
		return F_cleanKey
	}
	
	PressKeyDown(F_sendKey)
	{
		F_pressKeyDown := "{" . F_sendKey . " Down}"
		StringReplace, F_pressKeyDown, F_pressKeyDown, +, Shift Down}{, All 
		StringReplace, F_pressKeyDown, F_pressKeyDown, ^, Ctrl Down}{, All 
		StringReplace, F_pressKeyDown, F_pressKeyDown, !, Alt Down}{, All 
		StringReplace, F_pressKeyDown, F_pressKeyDown, <, L, All 
		StringReplace, F_pressKeyDown, F_pressKeyDown, >, R, All 
		StringReplace, F_pressKeyDown, F_pressKeyDown, *, , All 
		return F_pressKeyDown
	}
	
	PressKeyUp(F_sendKey)
	{
		F_pressKeyUp := "{" . F_sendKey . " Up}"
		StringReplace, F_pressKeyUp, F_pressKeyUp, +, Shift Up}{, All 
		StringReplace, F_pressKeyUp, F_pressKeyUp, ^, Ctrl Up}{, All 
		StringReplace, F_pressKeyUp, F_pressKeyUp, !, Alt Up}{, All 
		StringReplace, F_pressKeyUp, F_pressKeyUp, <, L, All 
		StringReplace, F_pressKeyUp, F_pressKeyUp, >, R, All 
		StringReplace, F_pressKeyUp, F_pressKeyUp, *, , All 
		return F_pressKeyUp
	}
	
	SelectUse(F_start, itemORspell)
	{
		if (F_start > 0)
		{
			cnt := 0
			
			if (nextItem = "WheelDown" || nextItem = "WheelUp")
			{
				Loop
				{
					if (cnt = F_start)
						break
					if (itemORspell = "Item")
						send {%nextItem%}
					else if (itemORspell = "Spell")
					send {%nextSpell%}
					sleep, 60
					cnt++
				}
				sleep, 100
			}
			else
			{
				Loop
				{
					if (cnt = F_start)
						break
					if (itemORspell = "Item")
						send {%nextItem% down}
					else if (itemORspell = "Spell")
						send {%nextSpell% down}
					sleep, 30
					if (itemORspell = "Item")
						send {%nextItem% up}
					else if (itemORspell = "Spell")
						send {%nextSpell% up}
					sleep, 30
					cnt++
				}	
				sleep, 100			
			}
		}
	}
	
	ReselectHome(F_start, F_end, itemORspell)
	{
		if (F_start > 0)
		{
			cnt := 0
			
			if (next%itemORspell% = "WheelDown" || next%itemORspell% = "WheelUp")
			{
				Loop
				{
					if (cnt = F_end)
						break
					sleep, 60
					if (itemORspell = "item")
						send {%nextItem%}
					if (itemORspell = "spell")
						send {%nextSpell%}
					cnt++
				}
			}
			else
			{
				Loop
				{
					if (cnt = F_end)
						break
					sleep, 30
					if (itemORspell = "item")
						send {%nextItem% down}
					if (itemORspell = "spell")
						send {%nextSpell% down}
					sleep, 30
					if (itemORspell = "item")
						send {%nextItem% up}
					if (itemORspell = "spell")
						send {%nextSpell% up}
					cnt++
				}
			}
			sleep, 250
		}
	}
	
	AssignSpellKeys()
	{	
		if (spellMode = 2) 	;Weapon
		{
			global weapCast := 1
			spellMacro := atkOHStrong
			otherMacro := atkOHLight 
			spellMacroR := atkMHStrong
			otherMacroR := atkMHLight
		}
		else 				;Focus
		{
			global weapCast := 0
			spellMacro := atkOHLight 
			otherMacro := atkOHStrong
			spellMacroR := atkMHLight 
			otherMacroR := atkMHStrong
		}
		
		/*
		if !(spell1 = "")
		{
			spell1 := MacroReplace(spell1)
			Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
			Hotkey, %spell1%, b_spell1		
		}
		if !(spell1a = "")
		{
			spell1a := MacroReplace(spell1a)
			Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
			Hotkey, %spell1a%, b_spell1a		
		}
		*/
		
		if (spellCnt > 1)
		{
			if (spell2)
			{
				spell2Temp := MacroReplace(spell2)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell2Temp%, b_spell2
			}
			if (spell2a)
			{
				spell2aTemp := MacroReplace(spell2a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell2aTemp%, b_spell2a		
			}
			
			if (spell3)
			{
				spell3Temp := MacroReplace(spell3)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell3Temp%, b_spell3		
			}
			if (spell3a)
			{
				spell3aTemp := MacroReplace(spell3a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell3aTemp%, b_spell3a		
			}
			
			if (spell4)
			{
				spell4Temp := MacroReplace(spell4)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell4Temp%, b_spell4		
			}
			if (spell4a)
			{
				spell4aTemp := MacroReplace(spell4a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell4aTemp%, b_spell4a		
			}
			
			if (spell5)
			{
				spell5Temp := MacroReplace(spell5)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell5Temp%, b_spell5		
			}
			if (spell5a)
			{
				spell5aTemp := MacroReplace(spell5a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell5aTemp%, b_spell5a		
			}
			
			if (spell6)
			{
				spell6Temp := MacroReplace(spell6)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell6Temp%, b_spell6		
			}
			if (spell6a)
			{
				spell6aTemp := MacroReplace(spell6a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell6aTemp%, b_spell6a		
			}
			
			if (spell7)
			{
				spell7Temp := MacroReplace(spell7)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell7Temp%, b_spell7		
			}
			if (spell7a)
			{
				spell7aTemp := MacroReplace(spell7a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell7aTemp%, b_spell7a		
			}
			
			if (spell8)
			{
				spell8Temp := MacroReplace(spell8)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell8Temp%, b_spell8		
			}
			if (spell8a)
			{
				spell8aTemp := MacroReplace(spell8a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell8aTemp%, b_spell8a		
			}
			
			if (spell9)
			{
				spell9Temp := MacroReplace(spell9)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell9Temp%, b_spell9		
			}
			if (spell9a)
			{
				spell9aTemp := MacroReplace(spell9a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell9aTemp%, b_spell9a		
			}
			
			if (spell10)
			{
				spell10Temp := MacroReplace(spell10)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell10Temp%, b_spell10		
			}
			if (spell10a)
			{
				spell10aTemp := MacroReplace(spell10a)
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %spell10aTemp%, b_spell10a		
			}
		}
		Return
	}
	
	AssignItemKeys()
	{
		if (item1)
		{
			Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
			Hotkey, %item1%, b_item1		
		}
		if (item1a)
		{
			Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
			Hotkey, %item1a%, b_item1a
		}
		
		if (itemCnt > 1)
		{	
			if (item2)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item2%, b_item2	
			}
			if (item2a)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item2a%, b_item2a
			}
			
			if (item3)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item3%, b_item3		
			}
			if (item3a)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item3a%, b_item3a
			}
			
			if (item4)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item4%, b_item4
			}		
			if (item4a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item4a%, b_item4a
			}
			
			if (item5)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item5%, b_item5	
			}		
			if (item5a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item5a%, b_item5a
			}
			
			if (item6)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item6%, b_item6		
			}		
			if (item6a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item6a%, b_item6a
			}
			
			if (item7)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item7%, b_item7		
			}		
			if (item7a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item7a%, b_item7a
			}
			
			if (item8)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item8%, b_item8			
			}		
			if (item8a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item8a%, b_item8a
			}
			
			if (item9)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item9%, b_item9			
			}		
			if (item9a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item9a%, b_item9a
			}
			
			if (item10)
			{
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item10%, b_item10			
			}		
			if (item10a)
			{	
				Hotkey, IfWinActive, ahk_exe DarkSoulsIII.exe
				Hotkey, %item10a%, b_item10a
			}
		}
		return
	}
	
	
	
	;/////// Load Func ///////
	LoadSettingsFile()
	{
		if !(currentSettingsFile)
			GoSub, ButtonChangeIni
		
		IniRead, itemCnt, %currentSettingsFile%, General, itemCnt
		IniRead, spellCnt, %currentSettingsFile%, General, spellCnt
		IniRead, spellMode, %currentSettingsFile%, General, spellMode
		
		IniRead, useItem, %currentSettingsFile%, DefaultKeys, useItem
		IniRead, atkMHLight, %currentSettingsFile%, DefaultKeys, atkMHLight
		IniRead, atkMHStrong, %currentSettingsFile%, DefaultKeys, atkMHStrong
		IniRead, atkOHLight, %currentSettingsFile%, DefaultKeys, atkOHLight
		IniRead, atkOHStrong, %currentSettingsFile%, DefaultKeys, atkOHStrong
		IniRead, nextSpell, %currentSettingsFile%, DefaultKeys, nextSpell
		IniRead, nextItem, %currentSettingsFile%, DefaultKeys, nextItem
		
		IniRead, item1, %currentSettingsFile%, Items, item1
		IniRead, item2, %currentSettingsFile%, Items, item2
		IniRead, item3, %currentSettingsFile%, Items, item3
		IniRead, item4, %currentSettingsFile%, Items, item4
		IniRead, item5, %currentSettingsFile%, Items, item5
		IniRead, item6, %currentSettingsFile%, Items, item6
		IniRead, item7, %currentSettingsFile%, Items, item7
		IniRead, item8, %currentSettingsFile%, Items, item8
		IniRead, item9, %currentSettingsFile%, Items, item9
		IniRead, item10, %currentSettingsFile%, Items, item10
		
		IniRead, item1a, %currentSettingsFile%, Items, item1a
		IniRead, item2a, %currentSettingsFile%, Items, item2a
		IniRead, item3a, %currentSettingsFile%, Items, item3a
		IniRead, item4a, %currentSettingsFile%, Items, item4a
		IniRead, item5a, %currentSettingsFile%, Items, item5a
		IniRead, item6a, %currentSettingsFile%, Items, item6a
		IniRead, item7a, %currentSettingsFile%, Items, item7a
		IniRead, item8a, %currentSettingsFile%, Items, item8a
		IniRead, item9a, %currentSettingsFile%, Items, item9a
		IniRead, item10a, %currentSettingsFile%, Items, item10a
		
		/*
		IniRead, spell1, %currentSettingsFile%, Spells, spell1
		IniRead, spell1_hand, %currentSettingsFile%, Spells, spell1_hand
		IniRead, spell1_hold, %currentSettingsFile%, Spells, spell1_hold
		IniRead, spell1_typeOverride, %currentSettingsFile%, Spells, spell1_typeOverride
		IniRead, spell1_UP, %currentSettingsFile%, Spells, spell1_UP
		*/
		
		IniRead, spell2, %currentSettingsFile%, Spells, spell2
		IniRead, spell2_hand, %currentSettingsFile%, Spells, spell2_hand
		IniRead, spell2_hold, %currentSettingsFile%, Spells, spell2_hold
		IniRead, spell2_typeOverride, %currentSettingsFile%, Spells, spell2_typeOverride
		IniRead, spell2_UP, %currentSettingsFile%, Spells, spell2_UP
		
		IniRead, spell3, %currentSettingsFile%, Spells, spell3
		IniRead, spell3_hand, %currentSettingsFile%, Spells, spell3_hand
		IniRead, spell3_hold, %currentSettingsFile%, Spells, spell3_hold
		IniRead, spell3_typeOverride, %currentSettingsFile%, Spells, spell3_typeOverride
		IniRead, spell3_UP, %currentSettingsFile%, Spells, spell3_UP
		
		IniRead, spell4, %currentSettingsFile%, Spells, spell4
		IniRead, spell4_hand, %currentSettingsFile%, Spells, spell4_hand
		IniRead, spell4_hold, %currentSettingsFile%, Spells, spell4_hold
		IniRead, spell4_typeOverride, %currentSettingsFile%, Spells, spell4_typeOverride
		IniRead, spell4_UP, %currentSettingsFile%, Spells, spell4_UP
		
		IniRead, spell5, %currentSettingsFile%, Spells, spell5
		IniRead, spell5_hand, %currentSettingsFile%, Spells, spell5_hand
		IniRead, spell5_hold, %currentSettingsFile%, Spells, spell5_hold
		IniRead, spell5_typeOverride, %currentSettingsFile%, Spells, spell5_typeOverride
		IniRead, spell5_UP, %currentSettingsFile%, Spells, spell5_UP
		
		IniRead, spell6, %currentSettingsFile%, Spells, spell6
		IniRead, spell6_hand, %currentSettingsFile%, Spells, spell6_hand
		IniRead, spell6_hold, %currentSettingsFile%, Spells, spell6_hold
		IniRead, spell6_typeOverride, %currentSettingsFile%, Spells, spell6_typeOverride
		IniRead, spell6_UP, %currentSettingsFile%, Spells, spell6_UP
		
		IniRead, spell7, %currentSettingsFile%, Spells, spell7
		IniRead, spell7_hand, %currentSettingsFile%, Spells, spell7_hand
		IniRead, spell7_hold, %currentSettingsFile%, Spells, spell7_hold
		IniRead, spell7_typeOverride, %currentSettingsFile%, Spells, spell7_typeOverride
		IniRead, spell7_UP, %currentSettingsFile%, Spells, spell7_UP
		
		IniRead, spell8, %currentSettingsFile%, Spells, spell8
		IniRead, spell8_hand, %currentSettingsFile%, Spells, spell8_hand
		IniRead, spell8_hold, %currentSettingsFile%, Spells, spell8_hold
		IniRead, spell8_typeOverride, %currentSettingsFile%, Spells, spell8_typeOverride
		IniRead, spell8_UP, %currentSettingsFile%, Spells, spell8_UP
		
		IniRead, spell9, %currentSettingsFile%, Spells, spell9
		IniRead, spell9_hand, %currentSettingsFile%, Spells, spell9_hand
		IniRead, spell9_hold, %currentSettingsFile%, Spells, spell9_hold
		IniRead, spell9_typeOverride, %currentSettingsFile%, Spells, spell9_typeOverride
		IniRead, spell9_UP, %currentSettingsFile%, Spells, spell9_UP
		
		IniRead, spell10, %currentSettingsFile%, Spells, spell10
		IniRead, spell10_hand, %currentSettingsFile%, Spells, spell10_hand
		IniRead, spell10_hold, %currentSettingsFile%, Spells, spell10_hold
		IniRead, spell10_typeOverride, %currentSettingsFile%, Spells, spell10_typeOverride
		IniRead, spell10_UP, %currentSettingsFile%, Spells, spell10_UP
		
		IniRead, spell1a, %currentSettingsFile%, Spells, spell1a
		IniRead, spell1a_hand, %currentSettingsFile%, Spells, spell1a_hand
		IniRead, spell1a_hold, %currentSettingsFile%, Spells, spell1a_hold
		IniRead, spell1a_typeOverride, %currentSettingsFile%, Spells, spell1a_typeOverride
		IniRead, spell1a_UP, %currentSettingsFile%, Spells, spell1a_UP
		
		IniRead, spell2a, %currentSettingsFile%, Spells, spell2a
		IniRead, spell2a_hand, %currentSettingsFile%, Spells, spell2a_hand
		IniRead, spell2a_hold, %currentSettingsFile%, Spells, spell2a_hold
		IniRead, spell2a_typeOverride, %currentSettingsFile%, Spells, spell2a_typeOverride
		IniRead, spell2a_UP, %currentSettingsFile%, Spells, spell2a_UP
		
		IniRead, spell3a, %currentSettingsFile%, Spells, spell3a
		IniRead, spell3a_hand, %currentSettingsFile%, Spells, spell3a_hand
		IniRead, spell3a_hold, %currentSettingsFile%, Spells, spell3a_hold
		IniRead, spell3a_typeOverride, %currentSettingsFile%, Spells, spell3a_typeOverride
		IniRead, spell3a_UP, %currentSettingsFile%, Spells, spell3a_UP
		
		IniRead, spell4a, %currentSettingsFile%, Spells, spell4a
		IniRead, spell4a_hand, %currentSettingsFile%, Spells, spell4a_hand
		IniRead, spell4a_hold, %currentSettingsFile%, Spells, spell4a_hold
		IniRead, spell4a_typeOverride, %currentSettingsFile%, Spells, spell4a_typeOverride
		IniRead, spell4a_UP, %currentSettingsFile%, Spells, spell4a_UP
		
		IniRead, spell5a, %currentSettingsFile%, Spells, spell5a
		IniRead, spell5a_hand, %currentSettingsFile%, Spells, spell5a_hand
		IniRead, spell5a_hold, %currentSettingsFile%, Spells, spell5a_hold
		IniRead, spell5a_typeOverride, %currentSettingsFile%, Spells, spell5a_typeOverride
		IniRead, spell5a_UP, %currentSettingsFile%, Spells, spell5a_UP
		
		IniRead, spell6a, %currentSettingsFile%, Spells, spell6a
		IniRead, spell6a_hand, %currentSettingsFile%, Spells, spell6a_hand
		IniRead, spell6a_hold, %currentSettingsFile%, Spells, spell6a_hold
		IniRead, spell6a_typeOverride, %currentSettingsFile%, Spells, spell6a_typeOverride
		IniRead, spell6a_UP, %currentSettingsFile%, Spells, spell6a_UP
		
		IniRead, spell7a, %currentSettingsFile%, Spells, spell7a
		IniRead, spell7a_hand, %currentSettingsFile%, Spells, spell7a_hand
		IniRead, spell7a_hold, %currentSettingsFile%, Spells, spell7a_hold
		IniRead, spell7a_typeOverride, %currentSettingsFile%, Spells, spell7a_typeOverride
		IniRead, spell7a_UP, %currentSettingsFile%, Spells, spell7a_UP
		
		IniRead, spell8a, %currentSettingsFile%, Spells, spell8a
		IniRead, spell8a_hand, %currentSettingsFile%, Spells, spell8a_hand
		IniRead, spell8a_hold, %currentSettingsFile%, Spells, spell8a_hold
		IniRead, spell8a_typeOverride, %currentSettingsFile%, Spells, spell8a_typeOverride
		IniRead, spell8a_UP, %currentSettingsFile%, Spells, spell8a_UP
		
		IniRead, spell9a, %currentSettingsFile%, Spells, spell9a
		IniRead, spell9a_hand, %currentSettingsFile%, Spells, spell9a_hand
		IniRead, spell9a_hold, %currentSettingsFile%, Spells, spell9a_hold
		IniRead, spell9a_typeOverride, %currentSettingsFile%, Spells, spell9a_typeOverride
		IniRead, spell9a_UP, %currentSettingsFile%, Spells, spell9a_UP
		
		IniRead, spell10a, %currentSettingsFile%, Spells, spell10a
		IniRead, spell10a_hand, %currentSettingsFile%, Spells, spell10a_hand
		IniRead, spell10a_hold, %currentSettingsFile%, Spells, spell10a_hold
		IniRead, spell10a_typeOverride, %currentSettingsFile%, Spells, spell10a_typeOverride
		IniRead, spell10a_UP, %currentSettingsFile%, Spells, spell10a_UP
		
		return
	}
	
	;/////// Load Func ///////
	SaveSettingsFile()
	{	
		; IniWrite, %DS3_installpath%, ds3_controlexpansion\session.ini, Session, DS3_installpath
		
		IniWrite, %itemCnt%, %currentSettingsFile%, General, itemCnt
		IniWrite, %spellCnt%, %currentSettingsFile%, General, spellCnt
		IniWrite, %spellMode%, %currentSettingsFile%, General, spellMode
		
		IniWrite, %useItem%, %currentSettingsFile%, DefaultKeys, useItem
		IniWrite, %atkMHLight%, %currentSettingsFile%, DefaultKeys, atkMHLight
		IniWrite, %atkMHStrong%, %currentSettingsFile%, DefaultKeys, atkMHStrong
		IniWrite, %atkOHLight%, %currentSettingsFile%, DefaultKeys, atkOHLight
		IniWrite, %atkOHStrong%, %currentSettingsFile%, DefaultKeys, atkOHStrong
		IniWrite, %nextSpell%, %currentSettingsFile%, DefaultKeys, nextSpell
		IniWrite, %nextItem%, %currentSettingsFile%, DefaultKeys, nextItem
		
		IniWrite, %item1%, %currentSettingsFile%, Items, item1
		IniWrite, %item2%, %currentSettingsFile%, Items, item2
		IniWrite, %item3%, %currentSettingsFile%, Items, item3
		IniWrite, %item4%, %currentSettingsFile%, Items, item4
		IniWrite, %item5%, %currentSettingsFile%, Items, item5
		IniWrite, %item6%, %currentSettingsFile%, Items, item6
		IniWrite, %item7%, %currentSettingsFile%, Items, item7
		IniWrite, %item8%, %currentSettingsFile%, Items, item8
		IniWrite, %item9%, %currentSettingsFile%, Items, item9
		IniWrite, %item10%, %currentSettingsFile%, Items, item10
		
		IniWrite, %item1a%, %currentSettingsFile%, Items, item1a
		IniWrite, %item2a%, %currentSettingsFile%, Items, item2a
		IniWrite, %item3a%, %currentSettingsFile%, Items, item3a
		IniWrite, %item4a%, %currentSettingsFile%, Items, item4a
		IniWrite, %item5a%, %currentSettingsFile%, Items, item5a
		IniWrite, %item6a%, %currentSettingsFile%, Items, item6a
		IniWrite, %item7a%, %currentSettingsFile%, Items, item7a
		IniWrite, %item8a%, %currentSettingsFile%, Items, item8a
		IniWrite, %item9a%, %currentSettingsFile%, Items, item9a
		IniWrite, %item10a%, %currentSettingsFile%, Items, item10a
		
		/*
		IniWrite, %spell1%, %currentSettingsFile%, Spells, spell1
		IniWrite, %spell1_hand%, %currentSettingsFile%, Spells, spell1_hand
		IniWrite, %spell1_hold%, %currentSettingsFile%, Spells, spell1_hold
		IniWrite, %spell1_typeOverride%, %currentSettingsFile%, Spells, spell1_typeOverride
		IniWrite, %spell1_UP%, %currentSettingsFile%, Spells, spell1_UP
		*/
		
		IniWrite, %spell2%, %currentSettingsFile%, Spells, spell2
		IniWrite, %spell2_hand%, %currentSettingsFile%, Spells, spell2_hand
		IniWrite, %spell2_hold%, %currentSettingsFile%, Spells, spell2_hold
		IniWrite, %spell2_typeOverride%, %currentSettingsFile%, Spells, spell2_typeOverride
		IniWrite, %spell2_UP%, %currentSettingsFile%, Spells, spell2_UP
		
		IniWrite, %spell3%, %currentSettingsFile%, Spells, spell3
		IniWrite, %spell3_hand%, %currentSettingsFile%, Spells, spell3_hand
		IniWrite, %spell3_hold%, %currentSettingsFile%, Spells, spell3_hold
		IniWrite, %spell3_typeOverride%, %currentSettingsFile%, Spells, spell3_typeOverride
		IniWrite, %spell3_UP%, %currentSettingsFile%, Spells, spell3_UP
		
		IniWrite, %spell4%, %currentSettingsFile%, Spells, spell4
		IniWrite, %spell4_hand%, %currentSettingsFile%, Spells, spell4_hand
		IniWrite, %spell4_hold%, %currentSettingsFile%, Spells, spell4_hold
		IniWrite, %spell4_typeOverride%, %currentSettingsFile%, Spells, spell4_typeOverride
		IniWrite, %spell4_UP%, %currentSettingsFile%, Spells, spell4_UP
		
		IniWrite, %spell5%, %currentSettingsFile%, Spells, spell5
		IniWrite, %spell5_hand%, %currentSettingsFile%, Spells, spell5_hand
		IniWrite, %spell5_hold%, %currentSettingsFile%, Spells, spell5_hold
		IniWrite, %spell5_typeOverride%, %currentSettingsFile%, Spells, spell5_typeOverride
		IniWrite, %spell5_UP%, %currentSettingsFile%, Spells, spell5_UP
		
		IniWrite, %spell6%, %currentSettingsFile%, Spells, spell6
		IniWrite, %spell6_hand%, %currentSettingsFile%, Spells, spell6_hand
		IniWrite, %spell6_hold%, %currentSettingsFile%, Spells, spell6_hold
		IniWrite, %spell6_typeOverride%, %currentSettingsFile%, Spells, spell6_typeOverride
		IniWrite, %spell6_UP%, %currentSettingsFile%, Spells, spell6_UP
		
		IniWrite, %spell7%, %currentSettingsFile%, Spells, spell7
		IniWrite, %spell7_hand%, %currentSettingsFile%, Spells, spell7_hand
		IniWrite, %spell7_hold%, %currentSettingsFile%, Spells, spell7_hold
		IniWrite, %spell7_typeOverride%, %currentSettingsFile%, Spells, spell7_typeOverride
		IniWrite, %spell7_UP%, %currentSettingsFile%, Spells, spell7_UP
		
		IniWrite, %spell8%, %currentSettingsFile%, Spells, spell8
		IniWrite, %spell8_hand%, %currentSettingsFile%, Spells, spell8_hand
		IniWrite, %spell8_hold%, %currentSettingsFile%, Spells, spell8_hold
		IniWrite, %spell8_typeOverride%, %currentSettingsFile%, Spells, spell8_typeOverride
		IniWrite, %spell8_UP%, %currentSettingsFile%, Spells, spell8_UP
		
		IniWrite, %spell9%, %currentSettingsFile%, Spells, spell9
		IniWrite, %spell9_hand%, %currentSettingsFile%, Spells, spell9_hand
		IniWrite, %spell9_hold%, %currentSettingsFile%, Spells, spell9_hold
		IniWrite, %spell9_typeOverride%, %currentSettingsFile%, Spells, spell9_typeOverride
		IniWrite, %spell9_UP%, %currentSettingsFile%, Spells, spell9_UP
		
		IniWrite, %spell10%, %currentSettingsFile%, Spells, spell10
		IniWrite, %spell10_hand%, %currentSettingsFile%, Spells, spell10_hand
		IniWrite, %spell10_hold%, %currentSettingsFile%, Spells, spell10_hold
		IniWrite, %spell10_typeOverride%, %currentSettingsFile%, Spells, spell10_typeOverride
		IniWrite, %spell10_UP%, %currentSettingsFile%, Spells, spell10_UP
		
		IniWrite, %spell1a%, %currentSettingsFile%, Spells, spell1a
		IniWrite, %spell1a_hand%, %currentSettingsFile%, Spells, spell1a_hand
		IniWrite, %spell1a_hold%, %currentSettingsFile%, Spells, spell1a_hold
		IniWrite, %spell1a_typeOverride%, %currentSettingsFile%, Spells, spell1a_typeOverride
		IniWrite, %spell1a_UP%, %currentSettingsFile%, Spells, spell1a_UP
		
		IniWrite, %spell2a%, %currentSettingsFile%, Spells, spell2a
		IniWrite, %spell2a_hand%, %currentSettingsFile%, Spells, spell2a_hand
		IniWrite, %spell2a_hold%, %currentSettingsFile%, Spells, spell2a_hold
		IniWrite, %spell2a_typeOverride%, %currentSettingsFile%, Spells, spell2a_typeOverride
		IniWrite, %spell2a_UP%, %currentSettingsFile%, Spells, spell2a_UP
		
		IniWrite, %spell3a%, %currentSettingsFile%, Spells, spell3a
		IniWrite, %spell3a_hand%, %currentSettingsFile%, Spells, spell3a_hand
		IniWrite, %spell3a_hold%, %currentSettingsFile%, Spells, spell3a_hold
		IniWrite, %spell3a_typeOverride%, %currentSettingsFile%, Spells, spell3a_typeOverride
		IniWrite, %spell3a_UP%, %currentSettingsFile%, Spells, spell3a_UP
		
		IniWrite, %spell4a%, %currentSettingsFile%, Spells, spell4a
		IniWrite, %spell4a_hand%, %currentSettingsFile%, Spells, spell4a_hand
		IniWrite, %spell4a_hold%, %currentSettingsFile%, Spells, spell4a_hold
		IniWrite, %spell4a_typeOverride%, %currentSettingsFile%, Spells, spell4a_typeOverride
		IniWrite, %spell4a_UP%, %currentSettingsFile%, Spells, spell4a_UP
		
		IniWrite, %spell5a%, %currentSettingsFile%, Spells, spell5a
		IniWrite, %spell5a_hand%, %currentSettingsFile%, Spells, spell5a_hand
		IniWrite, %spell5a_hold%, %currentSettingsFile%, Spells, spell5a_hold
		IniWrite, %spell5a_typeOverride%, %currentSettingsFile%, Spells, spell5a_typeOverride
		IniWrite, %spell5a_UP%, %currentSettingsFile%, Spells, spell5a_UP
		
		IniWrite, %spell6a%, %currentSettingsFile%, Spells, spell6a
		IniWrite, %spell6a_hand%, %currentSettingsFile%, Spells, spell6a_hand
		IniWrite, %spell6a_hold%, %currentSettingsFile%, Spells, spell6a_hold
		IniWrite, %spell6a_typeOverride%, %currentSettingsFile%, Spells, spell6a_typeOverride
		IniWrite, %spell6a_UP%, %currentSettingsFile%, Spells, spell6a_UP
		
		IniWrite, %spell7a%, %currentSettingsFile%, Spells, spell7a
		IniWrite, %spell7a_hand%, %currentSettingsFile%, Spells, spell7a_hand
		IniWrite, %spell7a_hold%, %currentSettingsFile%, Spells, spell7a_hold
		IniWrite, %spell7a_typeOverride%, %currentSettingsFile%, Spells, spell7a_typeOverride
		IniWrite, %spell7a_UP%, %currentSettingsFile%, Spells, spell7a_UP
		
		IniWrite, %spell8a%, %currentSettingsFile%, Spells, spell8a
		IniWrite, %spell8a_hand%, %currentSettingsFile%, Spells, spell8a_hand
		IniWrite, %spell8a_hold%, %currentSettingsFile%, Spells, spell8a_hold
		IniWrite, %spell8a_typeOverride%, %currentSettingsFile%, Spells, spell8a_typeOverride
		IniWrite, %spell8a_UP%, %currentSettingsFile%, Spells, spell8a_UP
		
		IniWrite, %spell9a%, %currentSettingsFile%, Spells, spell9a
		IniWrite, %spell9a_hand%, %currentSettingsFile%, Spells, spell9a_hand
		IniWrite, %spell9a_hold%, %currentSettingsFile%, Spells, spell9a_hold
		IniWrite, %spell9a_typeOverride%, %currentSettingsFile%, Spells, spell9a_typeOverride
		IniWrite, %spell9a_UP%, %currentSettingsFile%, Spells, spell9a_UP
		
		IniWrite, %spell10a%, %currentSettingsFile%, Spells, spell10a
		IniWrite, %spell10a_hand%, %currentSettingsFile%, Spells, spell10a_hand
		IniWrite, %spell10a_hold%, %currentSettingsFile%, Spells, spell10a_hold
		IniWrite, %spell10a_typeOverride%, %currentSettingsFile%, Spells, spell10a_typeOverride
		IniWrite, %spell10a_UP%, %currentSettingsFile%, Spells, spell10a_UP
		return
	}
	
	
	
;   __ Binds ____________________________________
	
	b_spell1:
		UseSpell("1", spellCnt, spell1, spell1_hold, spell1_UP, spell1_hand, spell1_typeOverride)
		Return
	b_spell1a:
		UseSpell("1", spellCnt, spell1a, spell1a_hold, spell1a_UP, spell1a_hand, spell1a_typeOverride)
		Return
	
	b_spell2:
		UseSpell("2", spellCnt, spell2, spell2_hold, spell2_UP, spell2_hand, spell2_typeOverride)
		Return	
	b_spell2a:
		UseSpell("2", spellCnt, spell2a, spell2a_hold, spell2a_UP, spell2a_hand, spell2a_typeOverride)
		Return
	
	b_spell3:
		UseSpell("3", spellCnt, spell3, spell3_hold, spell3_UP, spell3_hand, spell3_typeOverride)
		Return	
	b_spell3a:
		UseSpell("3", spellCnt, spell3a, spell3a_hold, spell3a_UP, spell3a_hand, spell3a_typeOverride)
		Return

	b_spell4:
		UseSpell("4", spellCnt, spell4, spell4_hold, spell4_UP, spell4_hand, spell4_typeOverride)
		Return	
	b_spell4a:
		UseSpell("4", spellCnt, spell4a, spell4a_hold, spell4a_UP, spell4a_hand, spell4a_typeOverride)
		Return

	b_spell5:
		UseSpell("5", spellCnt, spell5, spell5_hold, spell5_UP, spell5_hand, spell5_typeOverride)
		Return	
	b_spell5a:
		UseSpell("5", spellCnt, spell5a, spell5a_hold, spell5a_UP, spell5a_hand, spell5a_typeOverride)
		Return

	b_spell6:
		UseSpell("6", spellCnt, spell6, spell6_hold, spell6_UP, spell6_hand, spell6_typeOverride)
		Return	
	b_spell6a:
		UseSpell("6", spellCnt, spell6a, spell6a_hold, spell6a_UP, spell6a_hand, spell6a_typeOverride)
		Return

	b_spell7:
		UseSpell("7", spellCnt, spell7, spell7_hold, spell7_UP, spell7_hand, spell7_typeOverride)
		Return	
	b_spell7a:
		UseSpell("7", spellCnt, spell7a, spell7a_hold, spell7a_UP, spell7a_hand, spell7a_typeOverride)
		Return

	b_spell8:
		UseSpell("8", spellCnt, spell8, spell8_hold, spell8_UP, spell8_hand, spell8_typeOverride)
		Return	
	b_spell8a:
		UseSpell("8", spellCnt, spell8a, spell8a_hold, spell8a_UP, spell8a_hand, spell8a_typeOverride)
		Return

	b_spell9:
		UseSpell("9", spellCnt, spell9, spell9_hold, spell9_UP, spell9_hand, spell9_typeOverride)
		Return	
	b_spell9a:
		UseSpell("9", spellCnt, spell9a, spell9a_hold, spell9a_UP, spell9a_hand, spell9a_typeOverride)
		Return

	b_spell10:
		UseSpell("10", spellCnt, spell10, spell10_hold, spell10_UP, spell10_hand, spell10_typeOverride)
		Return	
	b_spell10a:
		UseSpell("10", spellCnt, spell10a, spell10a_hold, spell10a_UP, spell10a_hand, spell10a_typeOverride)
		Return
		
	b_item1:
		UseItem("1", itemCnt, item1)
		Return	
	b_item1a:
		UseItem("1", itemCnt, item1a)
		Return
	
	b_item2:
		UseItem("2", itemCnt, item2)
		Return	
	b_item2a:
		UseItem("2", itemCnt, item2a)
		Return
	
	b_item3:
		UseItem("3", itemCnt, item3)
		Return	
	b_item3a:
		UseItem("3", itemCnt, item3a)
		Return
	
	b_item4:
		UseItem("4", itemCnt, item4)
		Return	
	b_item4a:
		UseItem("4", itemCnt, item4a)
		Return
	
	b_item5:
		UseItem("5", itemCnt, item5)
		Return	
	b_item5a:
		UseItem("5", itemCnt, item5a)
		Return
	
	b_item6:
		UseItem("6", itemCnt, item6)
		Return	
	b_item6a:
		UseItem("6", itemCnt, item6a)
		Return
	
	b_item7:
		UseItem("7", itemCnt, item7)
		Return	
	b_item7a:
		UseItem("7", itemCnt, item7a)
		Return
	
	b_item8:
		UseItem("8", itemCnt, item8)
		Return	
	b_item8a:
		UseItem("8", itemCnt, item8a)
		Return
	
	b_item9:
		UseItem("9", itemCnt, item9)
		Return	
	b_item9a:
		UseItem("9", itemCnt, item9a)
		Return
	
	b_item10:
		UseItem("10", itemCnt, item10)
		Return	
	b_item10a:
		UseItem("10", itemCnt, item10a)
		Return
		
	
