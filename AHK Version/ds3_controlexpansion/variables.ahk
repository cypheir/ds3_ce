
	; .ini file tracker
	global currentSettingsFile
	
	; Tracker
	global BindsActive := 0
		
	; Declare globals
	global spellMacro := ""
	global otherMacro := ""
	global spellMacroR := ""
	global otherMacroR := ""
	global weapCast := ""
	
	global DS3_installpath := ""
	
	global itemCnt := ""				; Number of Item Slots
	global spellCnt := ""				; Number of Spell Slots	
	global spellMode := ""				; 1 = Sorc/Pyro |  2 = Faith

	global useItem := ""				; Use Item Key (default: r)
	global atkMHLight := ""				; Main Hand Light (default: LButton)
	global atkMHStrong := ""			; Main Hand Heavy (default: RButton)
	global atkOHLight := ""				; Off Hand Light (default: +LButton)
	global atkOHStrong := ""			; Off Hand Heavy (default: +RButton)
	global nextSpell := ""				; Next Spell (default: WheelUp)
	global nextItem := ""				; Next Item (default: WheelDown)

	global item1 := "1"					; 1
	global item2 := "2"					; 2
	global item3 := "3"					; 3
	global item4 := "4"					; 4		Use-item "N" keys.
	global item5 := "5"					; 5
	global item6 := "6"					; 6
	global item7 := "7"					; 7
	global item8 := "8"					; 8
	global item9 := "9"					; 9
	global item10 := "0"				; 10

	global item1a := ""					; 1
	global item2a := ""					; 2
	global item3a := ""					; 3
	global item4a := ""					; 4		Alt use-item "N" keys.
	global item5a := ""					; 5
	global item6a := ""					; 6
	global item7a := ""					; 7
	global item8a := ""					; 8
	global item9a := ""					; 9
	global item10a := ""				; 10
	
	global spell1 := "SPELLMACRO"		; 1
	global spell1_hold := 1				; 1
	global spell1_UP := 0				; 1
	global spell1_hand := "L"			; 1
	global spell1_typeOverride := 0		; 1
	
	global spell2 := ""					; 2
	global spell2_hold := 0				; 2
	global spell2_UP := 0				; 2
	global spell2_hand := "L"			; 2
	global spell2_typeOverride := 0		; 2
	
	global spell3 := ""					; 3
	global spell3_hold := 0				; 3
	global spell3_UP := 0				; 3
	global spell3_hand := "L"			; 3
	global spell3_typeOverride := 0		; 3
	
	global spell4 := ""					; 4
	global spell4_hold := 0				; 4
	global spell4_UP := 0				; 4
	global spell4_hand := "L"			; 4
	global spell4_typeOverride := 0		; 4
	
	global spell5 := ""					; 5
	global spell5_hold := 0				; 5
	global spell5_UP := 0				; 5
	global spell5_hand := "L"			; 5
	global spell5_typeOverride := 0		; 5
	
	global spell6 := ""					; 6
	global spell6_hold := 0				; 6
	global spell6_UP := 0				; 6
	global spell6_hand := "L"			; 6
	global spell6_typeOverride := 0		; 6
	
	global spell7 := ""					; 7
	global spell7_hold := 0				; 7
	global spell7_UP := 0				; 7
	global spell7_hand := "L"			; 7
	global spell7_typeOverride := 0		; 7
	
	global spell8 := ""					; 8
	global spell8_hold := 0				; 8
	global spell8_UP := 0				; 8
	global spell8_hand := "L"			; 8
	global spell8_typeOverride := 0		; 8
	
	global spell9 := ""					; 9
	global spell9_hold := 0				; 9
	global spell9_UP := 0				; 9
	global spell9_hand := "L"			; 9
	global spell9_typeOverride := 0		; 9
	
	global spell10 := ""				; 10
	global spell10_hold := 0			; 10
	global spell10_UP := 0				; 10
	global spell10_hand := "L"			; 10
	global spell10_typeOverride := 0	; 10
	
 	
	global spell1a := ""				; 1 alt
	global spell1a_hold := 0			; 1 alt
	global spell1a_UP := 0				; 1 alt
	global spell1a_hand := "L"			; 1 alt
	global spell1a_typeOverride := 0	; 1 alt
	
	global spell2a := ""				; 2 alt
	global spell2a_hold := 0			; 2 alt
	global spell2a_UP := 0				; 2 alt
	global spell2a_hand := "L"			; 2 alt
	global spell2a_typeOverride := 0	; 2 alt
	
	global spell3a := ""				; 3 alt
	global spell3a_hold := 0			; 3 alt
	global spell3a_UP := 1				; 3 alt
	global spell3a_hand := "L"			; 3 alt
	global spell3a_typeOverride := 0	; 3 alt
	
	global spell4a := ""				; 4 alt
	global spell4a_hold := 0			; 4 alt
	global spell4a_UP := 0				; 4 alt
	global spell4a_hand := "L"			; 4 alt
	global spell4a_typeOverride := 0	; 4 alt
	
	global spell5a := ""				; 5 alt
	global spell5a_hold := 0			; 5 alt
	global spell5a_UP := 0				; 5 alt
	global spell5a_hand := "L"			; 5 alt
	global spell5a_typeOverride := 0	; 5 alt
	
	global spell6a := ""				; 6 alt
	global spell6a_hold := 0			; 6 alt
	global spell6a_UP := 0				; 6 alt
	global spell6a_hand := "L"			; 6 alt
	global spell6a_typeOverride := 0	; 6 alt
	
	global spell7a := ""				; 7 alt
	global spell7a_hold := 0			; 7 alt
	global spell7a_UP := 0				; 7 alt
	global spell7a_hand := "L"			; 7 alt
	global spell7a_typeOverride := 0	; 7 alt
	
	global spell8a := ""				; 8 alt
	global spell8a_hold := 0			; 8 alt
	global spell8a_UP := 0				; 8 alt
	global spell8a_hand := "L"			; 8 alt
	global spell8a_typeOverride := 0	; 8 alt
	
	global spell9a := ""				; 9 alt
	global spell9a_hold := 0			; 9 alt
	global spell9a_UP := 0				; 9 alt
	global spell9a_hand := "L"			; 9 alt
	global spell9a_typeOverride := 0	; 9 alt
	
	global spell10a := ""				; 10 alt
	global spell10a_hold := 0			; 10 alt
	global spell10a_UP := 0				; 10 alt
	global spell10a_hand := "L"			; 10 alt
	global spell10a_typeOverride := 0	; 10 alt