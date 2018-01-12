
	
	#IfWinActive ahk_exe DarkSoulsIII.exe
	Esc::Numpad5
	
	#IfWinActive ahk_exe DarkSoulsIII.exe
	<^Esc::
	<^Numpad5::GoSub, Refresh
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	<^<+Esc::GoSub, Settings
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	^!WheelUp::	
		send {Numpad8 down}
		sleep, 60
		send {Numpad8 up}
		return
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	^!WheelDown::
		send {Numpad9 down}
		sleep, 60
		send {Numpad9 up}
		return
	
	/*
	#IfWinActive ahk_exe DarkSoulsIII.exe
	*w::
		if (wInterrupt = 1)
			exit
		
		wPressed := "1"
		send {w down}
		Loop
		{
			sleep, 25
			if GetKeyState(w, "P")
				break
		}
		send {w up}
		wPressed := "0"
		return
	
	#IfWinActive ahk_exe DarkSoulsIII.exe
	*WheelUp::	
		if GetKeyState(w, "P")
		{
			send {w up}
			sleep, 500
		}
		send {w down}
		send {%atkMHStrong% down}
		sleep, 60
		send {%atkMHStrong% up}
		send {w up}
		if GetKeyState(w, "P")
			send {w downtemp}
		return
	
	#IfWinActive ahk_exe DarkSoulsIII.exe
	*WheelDown::	
		send {%atkOHStrong% down}
		sleep, 60
		send {%atkOHStrong% up}
		return
	*/
		
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
		
	/*
	#IfWinActive ahk_exe DarkSoulsIII.exe
	Space::
		send {Space down}
		sleep, 30
		send {Space up}
		Loop
		{
			if not GetKeyState(Space, "P")
				break
			sleep, 50
		}
		return
		
	#IfWinActive ahk_exe DarkSoulsIII.exe
	~Shift::
		send {Space down}
		sleep, 250
		
		Loop
		{
			if not GetKeyState(Shift, "P")
				break
			sleep, 50
		}
		send {Space up}
		return
	*/