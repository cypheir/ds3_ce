
	
	
	
	/* <- Anything after this is inactive, anything above it is active.
	
	
	
	; --- Example Custom Binds ---

	; On press or hold f, continue to change weapon in favor of the Main hand
	#IfWinActive ahk_exe DarkSoulsIII.exe
	*f::
		Loop
		{
			send {f down}
			sleep, 30
			send {f up}
			sleep, 70
			
			if not GetKeyState(f, "P") 
				break
		}
		return
		
	; On press or hold shift+f, continue to change weapon in favor of the Off hand
	#IfWinActive ahk_exe DarkSoulsIII.exe
	*<+f::
		Loop
		{
			send {f down}
			sleep, 300
			send {f up}
			
			if not GetKeyState(f, "P") 
				break
		}
		return