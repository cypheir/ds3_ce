;   __ GUI ____________________________________

	
	BuildGUI()
	{
		Menu, Tray, Icon, %DS3_installpath%
		Menu, Tray, Tip, Dark Souls 3`nHotbar Conversion 1.4b

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
		{
			WinActivate
		}
		else
		{
			Run, %DS3_installpath%DarkSoulsIII.exe
		}
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
			
			Gui, Add, Text, x12 y69 w90 h20 +Center, Spell Count
			Gui, Add, DropDownList, x112 y65 w40 +Center vspellChoice, 1|2|3|4|5|6|7|8|9|10
							
			Gui, Add, Radio, x94 y100 w80 Group Checked%spellMode% vcastChoice, Sorc/Pyro
			Gui, Add, Radio, x30 y100 w50 Checked%faithOn%, Faith
			
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
			
			
		; Column 2a  |  X Starting at 194, Y starting at 9
			Gui, Add, Text, x194 y9 w102 h20 +Center, [ Item Binds ]
			
			col2a_y := 9
			
			iteration := 1
			new_y := col2a_y + 30
			
			Loop 10
			{
				if (iteration > itemCnt)
					ROvar := "ReadOnly"
				else
					ROvar := ""
					
				currentItem := "item" . iteration
				
				Gui, Add, Text, x182 y%new_y% w50 h20 +Right, Slot %iteration% = 
				
				new_y -= 3
				tempItem := (%currentItem%)
				
				Gui, Add, Edit, x240 y%new_y% w60 h20 %ROvar% cGreen +Center vitem%iteration%, %tempItem%
				
				iteration++
				new_y += 33
			}
		
		; Column 2b  |  X Starting at 308, Y starting at 9
			Gui, Add, Text, x308 y9 w102 h20 +Center, [ Alt-Item Binds ]

			col2b_y := 9
			new_y := col2b_y + 30
			
			iteration := 1
			Loop 10
			{
				if (iteration > itemCnt)
					ROvar := "ReadOnly"
				else
					ROvar := ""
					
				currentItem := "item" . iteration . "a"
				
				Gui, Add, Text, x308 y%new_y% w50 h20 +Right, Slot %iteration%a = 
				
				new_y -= 3
				
				tempItem := (%currentItem%)
				Gui, Add, Edit, x366 y%new_y% w60 h20 %ROvar% cGreen +Center vitem%iteration%a, %tempItem%
				
				iteration++
				new_y += 33
			}
			
		; Column 3  |  X Starting at 446, Y starting at 9
			Gui, Add, Text, x446 y9 w120 h20 +Center, [ Spell Binds ]
			Gui, Add, Text, x590 y9 w120 h20 +Center, L / R       Chg | OR | UP 
			
			col3a_y := 9
			new_y := col3a_y + 30
			
			iteration := 1
			
			Loop 10
			{
				Gui, Add, Text, x446 y%new_y% w50 h20 +Right, Slot %iteration% = 
					
				new_y -= 3
					
				currentSpell := "spell" . iteration
				tempSpell := (%currentSpell%)
				if (iteration > spellCnt)
					ROvar := "ReadOnly"
				else
					ROvar := ""
				Gui, Add, Edit, x500 y%new_y% w80 h20 %ROvar% cGreen +Center vspell%iteration%, %tempSpell%
					
				Gui, Add, DropDownList, x592 y%new_y% w36 h70 cGreen +Center vspell%iteration%_hand, L|R
					
				currentHand := "spell" . iteration . "_hand"
				temp_Hand := (%currentHand%)
				GuiControl, Choose, spell%iteration%_hand, |%temp_hand%
					
				currentHold := "spell" . iteration . "_hold"
				temp_Hold := (%currentHold%)				
				Gui, Add, Checkbox, x644 y%new_y% w20 h20 Checked%temp_hold% vspell%iteration%_holdM, 
					
				currentTypeOverride := "spell" . iteration . "_typeOverride"
				temp_TypeOverride := (%currentTypeOverride%)			
				Gui, Add, Checkbox, x668 y%new_y% w20 h20 Checked%temp_typeOverride% vspell%iteration%_typeOverrideM,
				
				if (faithOn)
				{
					currentUP := "spell" . iteration . "_UP"
					temp_UP := (%currentUP%)
					Gui, Add, Checkbox, x692 y%new_y% w20 h20 Checked%temp_UP% vspell%iteration%_UPM, 
				}
					
				iteration++
				new_y += 33
			}
			
		; Column 4  |  X Starting at 722, Y starting at 9
			Gui, Add, Text, x722 y9 w120 h20 +Center, [ Alt-Spell Binds ]
			Gui, Add, Text, x866 y9 w120 h20 +Center, L / R       Chg | OR | UP 
			
			col4_x := 722
			col4_y := 9
			new_y := col4_y + 30
				
			iteration := 1
			
			Loop 10
			{
				Gui, Add, Text, x722 y%new_y% w50 h20 +Right, Slot %iteration%a = 
				
				new_y -= 3
				
				currentSpell := "spell" . iteration . "a"
				tempSpell := (%currentSpell%)
				if (iteration > spellCnt)
					ROvar := "ReadOnly"
				else
					ROvar := ""
				Gui, Add, Edit, x776 y%new_y% w80 h20 %ROvar% cGreen +Center vspell%iteration%a, %tempSpell%
				
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
				
				if (faithOn)
				{
					currentUP := "spell" . iteration . "a_UP"
					temp_UP := (%currentUP%)
					Gui, Add, Checkbox, x968 y%new_y% w20 h20 Checked%temp_UP% vspell%iteration%a_UPM, 
				}
				
				iteration++
				new_y += 33
			}
			
		; Install Path  |  X Starting at 12, Y starting at 439, W about 446
		Gui, Add, Text, x24 y352 w64 h20 +Left, Install Path = 
		Gui, Add, Text, x88 y352 w700 h20 cGreen +Left, %DS3_installpath%
		
		Gui, Add, Text, x96 y388 w80 h20 +Left, Current .ini File = 
		Gui, Add, Text, x178 y388 w700 h20 cGreen +Left, %currentSettingsFile%
			
		GuiControl, Text, Folder, %DS3_installpath% 
		GuiControl, Choose, itemChoice, |%itemCnt% 
		GuiControl, Choose, spellChoice, |%spellCnt% 
				
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
				
				Sleep, 300
				GoSub, Settings
				return
				
			ButtonApply:
				Gui, Submit, NoHide
				iteration := 1
				Loop 6
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
					
				Gui, Destroy
				Gosub, OnStart
				
				Sleep, 300
				GoSub, Settings
				Return
				
			ButtonOK:
				Gui, Submit, NoHide
				
				iteration := 1
				Loop 6
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
				
				Gui, Destroy
				Gosub, OnStart
				
				IfWinExist ahk_exe DarkSoulsIII.exe
					WinActivate				
				Return
			
	