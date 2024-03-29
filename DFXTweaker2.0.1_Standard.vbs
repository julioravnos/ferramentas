On Error Resume Next
Randomize

Set oWSH = CreateObject("WScript.Shell")
Set oAPP = CreateObject("Shell.Application")
Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oWMI = GetObject("winmgmts:\\.\root\CIMV2")
strUser = CreateObject("WScript.Network").UserName

Call ForceConsole()
Call checkNT10()
Call runElevated()
currentVersion = "2.0.1 "
currentLang = "English (Standard)"
Call archCheck()
Call startMenu()
Function startMenu()
	cls
	textf " "
	textf "   ____  _______  __  _____                    _             "
	textf "  |  _ \|  ___\ \/ / |_   _|_      _____  __ _| | _____ _ __ " & currentVersion
	textf "  | | | | |_   \  /    | | \ \ /\ / / _ \/ _` | |/ / _ \ '__|"
	textf "  | |_| |  _|  /  \    | |  \ V  V /  __/ (_| |   <  __/ |   "
	textf "  |____/|_|   /_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___|_|   "
      textf "     Created by ivandfx					" & currentLang
	textf " "
	textf "  Licensed under a GNU General Public License v3.0"
	textf " "
	textf "  Welcome, " & strUser
	textf " "
	textf " "
	textf "  1 = Tweak Settings"
	textf " "
	textf "  2 = Safe Mode Settings"
	textf " "
	textf "  3 = Quick Settings"
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf "  88 = Check for a new release						   If you find any issues, type '55'"
	textf "  99 = Open DFX Tweaker GitHub						(This will open GitHub on your browser)"
	textf "  44 = Open DFX Tweaker Web"
	textf " "
	textf "  0 = Close"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call startMenu()
		Exit Function
	End If
	Select Case RP
		Case 1
			Call dfxmain()		
		Case 88
			cls
			Call dfxrelease()
			wait 1
			Call startMenu
		Case 99
			cls
			Call dfxgithub()
			wait 1
			Call startMenu
		Case 55
			cls
			Call reportIssue()
			wait 1
			Call startMenu
		Case 2
			cls
			Call safemodesettings()
		Case 3
			cls
			Call quicksettings()
		Case 44
			cls
			wait 1
			Call dfxtweakerweb()
		Case 0
			Call tweakerexit()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call showMenu()
			Exit Function
	End Select
End Function

Function dfxtweakerweb()
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://ivandfx.github.io/DFXTweaker", 9
		Call startMenu()
	Exit Function
End Function

Function dfxgithub()
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://github.com/ivandfx/dfxtweaker", 9
		Call startMenu()
	Exit Function
End Function

Function dfxrelease()
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://github.com/ivandfx/dfxtweaker/releases", 9
		Call startMenu()
	Exit Function
End Function

Function reportIssue()
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://github.com/ivandfx/DFXTweaker/issues/new", 9
		Call startMenu()
	Exit Function
End Function

Function safemodesettings()
	cls
	textf " "
	textf "   ____         __        __  __           _        ____       _   _   _                 "
	textf "  / ___|  __ _ / _| ___  |  \/  | ___   __| | ___  / ___|  ___| |_| |_(_)_ __   __ _ ___ "
	textf "  \___ \ / _` | |_ / _ \ | |\/| |/ _ \ / _` |/ _ \ \___ \ / _ \ __| __| | '_ \ / _` / __|"
	textf "   ___) | (_| |  _|  __/ | |  | | (_) | (_| |  __/  ___) |  __/ |_| |_| | | | | (_| \__ \"
	textf "  |____/ \__,_|_|  \___| |_|  |_|\___/ \__,_|\___| |____/ \___|\__|\__|_|_| |_|\__, |___/"
	textf "                                                                              |___/      "
	textf " "
	textf " "
	textf "  Select an option:"
	textf " "
	textf " "
	textf "  1 = Restart in Safe Mode (Normal)"
	textf " "
	textf "  2 = Restart in Safe Mode (Networking)"
	textf " "
	textf "  3 = Reboot to Standard Windows"
	textf " "
	textf " "
	textf "  0 = Return to Start Menu"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call safemodesettings()
		Exit Function
	End If
	Select Case RP
	Case 1	
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot minimal"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 2
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot network"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 3
		MsgBox "Your PC will reboot right after you close this window, make sure you did all your changes", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /deletevalue {current} safeboot"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 0
		cls
		wait 1
		Call startMenu()
		Exit Function
	End Select
End Function

Function quicksettings()
	cls
	textf " "
	textf "    ___        _      _               _   _   _                 "  
	textf "   / _ \ _   _(_) ___| | __  ___  ___| |_| |_(_)_ __   __ _ ___ "  
	textf "  | | | | | | | |/ __| |/ / / __|/ _ \ __| __| | '_ \ / _` / __|"  
	textf "  | |_| | |_| | | (__|   <  \__ \  __/ |_| |_| | | | | (_| \__ \"  
	textf "   \__\_\\__,_|_|\___|_|\_\ |___/\___|\__|\__|_|_| |_|\__, |___/"  
	textf "                                                      |___/  1.2"  
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf "  1 = Disable Windows Update"
	textf " "
	textf "  2 = Disable Windows Defender (Safe Mode)"
	textf " "
	textf "  3 = Show file extensions"
	textf " "
	textf "  4 = Show Windows license status"
	textf " "
	textf "  5 = Open Additional Windows features"
	textf " "
	textf " "
	textf "  0 = Return to language menu"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call quicksettings()
		Exit Function
	End If
	Select Case RP
	Case 1
		oWSH.Run "sc stop wuauserv"
		oWSH.Run "sc config wuauserv start=disabled"
	cls
	textf ""
	textf "  Windows Update is now disabled"
	wait 2
		Call quicksettings()
	Case 2
		oWSH.Run "sc stop WdNisSvc"
		oWSH.Run "sc stop WinDefend"
		oWSH.Run "sc config WdNisSvc start=disabled"
		oWSH.Run "sc config WinDefend start=disabled"	
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Verification" & chr(34) & " /DISABLE"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableBehaviorMonitoring", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableOnAccessProtection", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableScanOnRealtimeEnable", 1, "REG_DWORD"
		oWSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\NOC_GLOBAL_SETTING_TOASTS_ENABLED", 0, "REG_DWORD"
		textf " "
		textf " INFO: Windows Defender has been disabled"
		wait 2
		Call quicksettings()
	Case 3
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 0, "REG_DWORD"
		textf ""
		textf "Files extensions will now be shown"
		wait 1
		Call quicksettings()
	Case 4
		textf " Your license status will appear in a few seconds..."
		wait 0.2
		textf " Collecting license data..."
		wait 2
		oWSH.Run "slmgr.vbs /dli"
		oWSH.Run "slmgr.vbs /xpr"
		wait 1
		Call quicksettings()
	Case 5
		textf " > Executing optionalfeatures.exe"
		oWSH.Run "optionalfeatures.exe"
		wait 1
		Call quicksettings()
	Case 0
		cls
		wait 1
		Call startMenu()
		Exit Function
	End Select
End Function

Function dfxmain()
	cls
	textf "  Wait..."
	wait 0.1
	Call showMenuEN()
	Exit Function
End Function

Function showBannerEN()
	textf" "
	textf "   ____  _______  __  _____                    _               ____    ___   "
	textf "  |  _ \|  ___\ \/ / |_   _|_      _____  __ _| | _____ _ __  |___ \  / _ \  "
	textf "  | | | | |_   \  /    | | \ \ /\ / / _ \/ _` | |/ / _ \ '__|   __) || | | | "
	textf "  | |_| |  _|  /  \    | |  \ V  V /  __/ (_| |   <  __/ |     / __/ | |_| | "
	textf "  |____/|_|   /_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___|_|    |_____(_)___/  "
      textf "     Created by ivandfx"
	textf " "
	textf "  Licensed under a GNU General Public License v3.0"
	textf " "
End Function

Function showMenuEN()
	cls
	Call showBannerEN
	textf "  "
	textf "  Select an option:                                          		   11 = Help about (1X) and (SF)"
	textf " "
	textf "  1 = Configure system tweaks            		     		   12 = Advanced shutdown options"
	textf "  2 = Configure performance tweaks			     		   13 = About my Windows version"
	textf "  3 = Uninstall Windows 10 default apps (1X)"
	textf ""
	textf "  4 = Configure tracking"
	textf "  5 = Configure MS OneDrive"
	textf "  6 = Configure MS Cortana"
	textf "  7 = Configure Windows Defender (SF)"
	textf "  8 = Configure Windows Update"
	textf ""
	textf "  9 = Show Windows license status"
	textf "  10 = Windows keyboard shortcuts"
	textf ""
	textf " 									   44 = Safe Mode Settings"
	textf "  0 = Exit						     		   55 = Return to Start Menu"
	textf ""
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call showMenuEN()
		Exit Function
	End If
	Select Case RP
		Case 1
			Call menuSysTweaksEN()
		Case 2
			Call menuPerformanceEN()
		Case 3
			Call menuCleanAppsEN()
		Case 4
			Call menuTrackingEN()
		Case 5
			Call menuOneDriveEN()
		Case 6
			Call menuCortanaEN()
		Case 7
			Call menuWindowsDefenderEN()
		Case 8
			Call menuWindowsUpdateEN()
		Case 9
			Call menuXPREN()
		Case 10
			Call showKeyboardTipsEN()
		Case 11
			MsgBox "Options with (1X) are only compatible with Windows 10. Options with (SF) need to be ran in Safe Mode.", vbInformation + vbOkOnly, "DFX Tweaker: Ayuda"
			Call showMenuEN()
		Case 12
			Call shutdownMenuEN()
		Case 13
			oWSH.Run "winver.exe"
			Call showMenuEN()
		Case 44
			Call safemodesettingsEN()
		Case 55
			Call startMenu()
		Case 66
			Call creativecommons()
		Case 0
			Call tweakerexit()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call showMenuEN()
			Exit Function
	End Select
End Function

Function menuXPREN()
	cls
	On Error Resume Next
	textf ""
	textf " Your license status will appear in a few seconds..."
	wait 0.2
	textf " Collecting license data..."
	wait 2
	oWSH.Run "slmgr.vbs /dli"
	oWSH.Run "slmgr.vbs /xpr"
	wait 1
	Call showMenuEN
End Function

Function showBannerWASTEN()
	textf "  __        ___    ____ _____   _____           _              _     _          _ "
	textf "  \ \      / / \  / ___|_   _| | ____|_ __ ___ | |__   ___  __| | __| | ___  __| |"
	textf "   \ \ /\ / / _ \ \___ \ | |   |  _| | '_ ` _ \| '_ \ / _ \/ _` |/ _` |/ _ \/ _` |"
	textf "    \ V  V / ___ \ ___) || |   | |___| | | | | | |_) |  __/ (_| | (_| |  __/ (_| |"
	textf "     \_/\_/_/   \_\____/ |_|   |_____|_| |_| |_|_.__/ \___|\__,_|\__,_|\___|\__,_|"
	textf "                          		Windows Advanced Shutdown Tool Embedded 1.2"
	textf " "
	End Function

Function shutdownMenuEN()
	cls
	Call showBannerWASTEN()
	textf " "
	textf "  Loading WAST for DFX Tweaker..."
	wait 0.4
	textf "  Loading..."
	wait 3
	cls
	On Error Resume Next
	Call showBannerWASTEN()
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf "  Select an option:"
	textf "                                            55 = Restart Windows Explorer"
	textf ""
	textf "  1 = Shut down the PC"
	textf " "
	textf "  2 = Restart the PC"
	textf " "
	textf "  3 = Log off from this user"
	textf " "
	textf "  4 = Go to advanced options"
	textf ""
	textf "  5 = Cause a BSOD (Blue Screen Of Death)"
	textf " "
	textf " "
	textf "  0 = Return to main menu"
	textf ""
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		Call shutdownMenuEN()
		Exit Function
	End If
	Select Case RP
		Case 1
			result = MsgBox ("Shut down?", vbYesNo, "WAST Shutdown")
Select Case result
    Case vbYes
	Set objShell = WScript.CreateObject("WScript.Shell")
	objShell.Run "C:\WINDOWS\system32\shutdown.exe -s -t 0"
        Dim objShell
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
		Case 2
						result = MsgBox ("Restart?", vbYesNo, "WAST Restart")
Select Case result
    Case vbYes
	Set objShell = WScript.CreateObject("WScript.Shell")
	objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
		Case 3
						result = MsgBox ("Log off? Unsaved data will be lost.", vbYesNo, "WAST Logoff")
Select Case result
    Case vbYes
	Set objShell = WScript.CreateObject("WScript.Shell")
	objShell.Run "C:\WINDOWS\system32\shutdown.exe -l"
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
		Case 4
						result = MsgBox ("Go to advanced options menu? This will close all active user sessions.", vbYesNo, "WAST Advanced")
Select Case result
    Case vbYes
	Set objShell = WScript.CreateObject("WScript.Shell")
	objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -o -t 0"
	wait 1
		Call shutdownMenuEN()
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
		Case 5
						result = MsgBox ("Cause a BSOD? Make sure you saved ALL the data you were using.", vbYesNo, "WAST BSOD")
Select Case result
    Case vbYes
	Set objShell = WScript.CreateObject("WScript.Shell")
	objShell.Run "taskkill /f /im crss.exe"
	objShell.Run "taskkill /f /im winnit.exe"
	objShell.Run "taskkill /f /im winlogon.exe"
	objShell.Run "taskkill /f /im svchost.exe"
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
		Case 55
						result = MsgBox ("Restart Windows Explorer?", vbYesNo, "WAST Explorer")
Select Case result
    Case vbYes
	textf = "  Wait..."
		textf " >> Restarting Windows Explorer..."
		oWSH.Run "taskkill.exe /F /IM explorer.exe"
		wait 5
		oWSH.Run "explorer.exe"
		Call shutdownMenuEN()
    Case vbNo
	cls
	textf = "  Wait..."
		wait 1
		Call shutdownMenuEN()
End Select
Case 0
		cls
		textf "  Going back to DFX Tweaker..."
		wait 0.3
		textf "  Wait..."
		wait 2.7
		Call showMenuEN()
	End Select
End Function

Function menuSysTweaksEN()
	cls
	On Error Resume Next
	textf ""
	textf "   ____            _                   _                      _        "
	textf "  / ___| _   _ ___| |_ ___ _ __ ___   | |___      _____  __ _| | _____ "
	textf "  \___ \| | | / __| __/ _ \ '_ ` _ \  | __\ \ /\ / / _ \/ _` | |/ / __|"
	textf "   ___) | |_| \__ \ ||  __/ | | | | | | |_ \ V  V /  __/ (_| |   <\__ \"
	textf "  |____/ \__, |___/\__\___|_| |_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/"
	textf "         |___/                                                         "
	textf ""
	textf "  Select an option:"
	textf ""
	textf " "
	textf "  1 = Enable Dark mode"
	textf "  2 = Create a 'God Mode' icon on the Desktop"
	textf "  3 = Enable 'Quick Access' on Windows Explorer"
	textf "  4 = Show file extensions" 
	textf "  5 = Enable 'Classic View' on the Control Panel"
	textf "  6 = Enable Classic Volume slider"
	textf "  7 = Open CMD on pressing Win+U (SF)"
	textf "  8 = Enable/Disable User Account Control"
	textf "  9 = Enable/Disable login without password"
	textf " "
	textf ""
	textf "  0 = Back to menu		99 = Restore"
	textf ""
	textl "  > "
	Select Case scanf
		Case 1
			textf ""
		oWSH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme", 0, "REG_DWORD"
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme", 0, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 2
			textf ""
		godFolder = oWSH.SpecialFolders("Desktop") & "\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
		If oFSO.FolderExists(godFolder) = False Then oFSO.CreateFolder(godFolder)
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 3
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LaunchTo", 1, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 4
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 0, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 5
		oWSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ForceClassicControlPanel", 1, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 6
		oWSH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC\EnableMtcUvc", 0, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 7
		oWSH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe\Debugger", "cmd.exe", "REG_SZ"
			textf ""
			textf ""
			wait 1
			Call menuSysTweaksEN()
		Case 9
			cls
			textf " Uncheck the option: Users must enter their name and password to use the PC"
			textf " Accept changes and restart your PC"
			wait 1
			oWSH.Run "control userpasswords2"
			wait 2
			Call menuSysTweaksEN()
		Case 99
			Call restoreSysTweaksEN()
		Case 0
			Call showMenuEN()
		Case 8
			cls
			textf "  Wait..."
			wait 2
			textf ""
			oWSH.Run "UserAccountControlSettings.exe"
			MsgBox "After changing this setting, you must restart the PC. Do you want to do it now?", vbInformation + vbYesNo, "DFX Tweaker UAC"
	Select Case result
  	  Case vbYes
		Set objShell = WScript.CreateObject("WScript.Shell")
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
  	  Case vbNo
		cls
		textf = "  Wait..."
			Call menuSysTweaksEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuSysTweaksEN()
			Exit Function
		End Select
	End Select
End Function

Function restoreSysTweaksEN()
	cls
	On Error Resume Next	
	textf ""
	textf "   ____            _                   _       Restore        _        "
	textf "  / ___| _   _ ___| |_ ___ _ __ ___   | |___      _____  __ _| | _____ "
	textf "  \___ \| | | / __| __/ _ \ '_ ` _ \  | __\ \ /\ / / _ \/ _` | |/ / __|"
	textf "   ___) | |_| \__ \ ||  __/ | | | | | | |_ \ V  V /  __/ (_| |   <\__ \"
	textf "  |____/ \__, |___/\__\___|_| |_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/"
	textf "         |___/                                                         "
	textf ""
	textf "  Select an option:"
	textf ""
	textf " "
	textf "  1 = Disable Dark mode"
	textf "  2 = Remove the 'God Mode' icon on the Desktop"
	textf "  3 = Disable 'Quick Access' on Windows Explorer"
	textf "  4 = Stop showing file extensions" 
	textf "  5 = Disable 'Classic View' on the Control Panel"
	textf "  6 = Disable Classic Volume slider"
	textf "  7 = Disable CMD on pressing Win+U (SF)"
	textf " "
	textf ""
	textf "  0 = Back to previous menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case 1
			textf ""
		oWSH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme", 1, "REG_DWORD"
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme", 1, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 2
			textf ""
		godFolder = oWSH.SpecialFolders("Desktop") & "\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
		If oFSO.FolderExists(godFolder) = True Then oFSO.DeleteFolder(godFolder)
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 3
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LaunchTo", 2, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 4
		oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 5
		oWSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ForceClassicControlPanel", 0, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 6
		oWSH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC\EnableMtcUvc", 1, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 7
		oWSH.RegDelete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe\Debugger"
			textf ""
			textf ""
			wait 1
			Call restoreSysTweaksEN()
		Case 0
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call restoreSysTweaksEN()
			Exit Function
		End Select
End Function

Function menuOneDriveEN()
	cls
	On Error Resume Next	
	textf "   __  __ ____     ___             ____       _           "
	textf "  |  \/  / ___|   / _ \ _ __   ___|  _ \ _ __(_)_   _____ "
	textf "  | |\/| \___ \  | | | | '_ \ / _ \ | | | '__| \ \ / / _ \"
	textf "  | |  | |___) | | |_| | | | |  __/ |_| | |  | |\ V /  __/"
	textf "  |_|  |_|____/   \___/|_| |_|\___|____/|_|  |_| \_/ \___|"                                                               
	textf ""
	textf "  Select an option:"
	textf ""
	textf "  1 = Disable MS OneDrive"
	textf "  2 = Enable MS OneDrive"
	textf ""
	textf "  0 = Return to main menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case "1"
			textf ""
			textf " Disabling OneDrive..."
			wait 1
				oWSH.Run "taskkill.exe /F /IM OneDrive.exe /T"
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC", 1, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC", 1, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableLibrariesDefaultSaveToOneDrive", 1, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableMeteredNetworkFileSync", 1, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive\DisableLibrariesDefaultSaveToOneDrive", 1, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive\DisableMeteredNetworkFileSync", 1, "REG_DWORD"
				oWSH.RegWrite "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 0, "REG_DWORD"
				oWSH.RegWrite "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 0, "REG_DWORD"
				oWSH.RegWrite "HKCU\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 0, "REG_DWORD"
				oWSH.RegWrite "HKCU\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 0, "REG_DWORD"
				oWSH.RegDelete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\OneDrive"
			textf ""
			textf " INFO: OneDrive has been disabled"
			wait 2
		Case "2"
			textf ""
			textf " Enabling OneDrive..."
			wait 1
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC", 0, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC", 0, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableLibrariesDefaultSaveToOneDrive", 0, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableMeteredNetworkFileSync", 0, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive\DisableLibrariesDefaultSaveToOneDrive", 0, "REG_DWORD"
				oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive\DisableMeteredNetworkFileSync", 0, "REG_DWORD"
				oWSH.RegWrite "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 1, "REG_DWORD"
				oWSH.RegWrite "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 1, "REG_DWORD"
				oWSH.RegWrite "HKCU\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 1, "REG_DWORD"
				oWSH.RegWrite "HKCU\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\System.IsPinnedToNameSpaceTree", 1, "REG_DWORD"
			textf ""
			textf " INFO: OneDrive is now enabled"
			wait 2
		Case "0"
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuOneDriveEN()
	End Select
	Call menuOneDriveEN()
End Function

Function menuCortanaEN()
	cls
	On Error Resume Next
	textf "   __  __ ____     ____           _                    "
	textf "  |  \/  / ___|   / ___|___  _ __| |_ __ _ _ __   __ _ "
	textf "  | |\/| \___ \  | |   / _ \| '__| __/ _` | '_ \ / _` |"
	textf "  | |  | |___) | | |__| (_) | |  | || (_| | | | | (_| |"
	textf "  |_|  |_|____/   \____\___/|_|   \__\__,_|_| |_|\__,_|"                                                         
	textf " "
	textf "  Select an option:"
	textf ""
	textf "  1 = Disable MS Cortana"
	textf "  2 = Enable MS Cortana"
	textf ""
	textf "  0 = Return to main menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case "1"
			oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana", 0, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\CortanaEnabled", 0, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\SearchboxTaskbarMode", 0, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\BingSearchEnabled", 0, "REG_DWORD"
			textf ""
			textf " >> Restarting Windows Explorer..."
			oWSH.Run "taskkill.exe /F /IM explorer.exe"
			wait 5
			oWSH.Run "explorer.exe"
		Case "2"
			oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana", 1, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\CortanaEnabled", 1, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\SearchboxTaskbarMode", 1, "REG_DWORD"
			oWSH.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\BingSearchEnabled", 1, "REG_DWORD"
			textf ""
			textf " >> Restarting Windows Explorer..."
			oWSH.Run "taskkill.exe /F /IM explorer.exe"
			wait 5
			oWSH.Run "explorer.exe"
		Case "0"
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuCortanaEN()
	End Select
	Call menuCortanaEN()
End Function

Function menuTrackingEN()
	cls
	On Error Resume Next
	textf "   _____               _    _             "
	textf "  |_   _| __ __ _  ___| | _(_)_ __   __ _ "
	textf "    | || '__/ _` |/ __| |/ / | '_ \ / _` |"
	textf "    | || | | (_| | (__|   <| | | | | (_| |"
	textf "    |_||_|  \__,_|\___|_|\_\_|_| |_|\__, |"
	textf "                                     |___/" 
	textf ""
	textf "  Select an option:"
	textf ""
	textf "  1 = Disable tracking"
	textf ""
	textf "  2 = Enable tracking"
	textf " "
	textf " "
	textf "  0 = Return to menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case 1
			textf ""
			textf " Disabling tracking services..."
			oWSH.Run "sc stop DiagTrack"
			oWSH.Run "sc config DiagTrack start= disabled"
			oWSH.Run "sc stop dmwappushservice"
			oWSH.Run "sc config dmwappushservice start= disabled"
			wait 2
			Call menuTrackingEN()
		Case 2
			textf ""
			textf " Enabling tracking services..."
			oWSH.Run "sc start DiagTrack"
			oWSH.Run "sc config DiagTrack start= enabled"
			oWSH.Run "sc start dmwappushservice"
			oWSH.Run "sc config dmwappushservice start= enabled"
			wait 2
			Call menuTrackingEN()
		Case 0
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuTrackingEN()
	End Select
	Call menuTrackingEN()
End Function

Function menuWindowsDefenderEN()
	cls
	On Error Resume Next
	textf "   __  __ ____    ____        __                _           "
	textf "  |  \/  / ___|  |  _ \  ___ / _| ___ _ __   __| | ___ _ __ "
	textf "  | |\/| \___ \  | | | |/ _ \ |_ / _ \ '_ \ / _` |/ _ \ '__|"
	textf "  | |  | |___) | | |_| |  __/  _|  __/ | | | (_| |  __/ |   "
	textf "  |_|  |_|____/  |____/ \___|_|  \___|_| |_|\__,_|\___|_|   "
	textf ""
	textf "  In Windows 10 and Windows 11 version 2004 and higher, it is recommended to disable MS Defender in Safe Mode"
	textf "  since disabling MS Defender in normal mode will not work."
	textf ""
	textf "  Select an option:"
	textf ""
	textf "  1 = Disable MS Defender"
	textf "  2 = Enable MS Defender"
	textf " "
	textf "  3 = Safe Mode Settings"
	textf ""
	textf "  0 = Return to main menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case "1"
			textf ""
			textf " Disabling MS Defender..."
			wait 1
		oWSH.Run "sc stop WdNisSvc"
		oWSH.Run "sc stop WinDefend"
		oWSH.Run "sc config WdNisSvc start=disabled"
		oWSH.Run "sc config WinDefend start=disabled"	
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" & chr(34) & " /DISABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Verification" & chr(34) & " /DISABLE"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableBehaviorMonitoring", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableOnAccessProtection", 1, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableScanOnRealtimeEnable", 1, "REG_DWORD"
		oWSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\NOC_GLOBAL_SETTING_TOASTS_ENABLED", 0, "REG_DWORD"	
			textf ""
			textf " INFO: MS Defender has been disabled"
			wait 2
		Case "2"
			textf ""
			textf " Enabling MS Defender..."
			wait 2
		oWSH.Run "sc config WdNisSvc start=auto"
		oWSH.Run "sc config WinDefend start=auto"	
		oWSH.Run "sc start WdNisSvc"
		oWSH.Run "sc start WinDefend"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" & chr(34) & " /ENABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" & chr(34) & " /ENABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" & chr(34) & " /ENABLE"
		oWSH.Run "schtasks /change /TN " & chr(34) & "\Microsoft\Windows\Windows Defender\Windows Defender Verification" & chr(34) & " /ENABLE"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 0, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 0, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableBehaviorMonitoring", 0, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableOnAccessProtection", 0, "REG_DWORD"
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableScanOnRealtimeEnable", 0, "REG_DWORD"
		oWSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\NOC_GLOBAL_SETTING_TOASTS_ENABLED", 1, "REG_DWORD"
			textf ""
			textf " INFO: MS Defender is now enabled"
			wait 2
		Case 3
			Call safemodesettingsEN()
		Case "0"
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuWindowsDefenderEN()
	End Select
	Call menuWindowsDefenderEN()
End Function

Function menuWindowsUpdateEN()
	cls
	On Error Resume Next
	textf "  __        ___           _                     _   _           _       _       "
	textf "  \ \      / (_)_ __   __| | _____      _____  | | | |_ __   __| | __ _| |_ ___ "
	textf "   \ \ /\ / /| | '_ \ / _` |/ _ \ \ /\ / / __| | | | | '_ \ / _` |/ _` | __/ _ \"
	textf "    \ V  V / | | | | | (_| | (_) \ V  V /\__ \ | |_| | |_) | (_| | (_| | ||  __/"
	textf "     \_/\_/  |_|_| |_|\__,_|\___/ \_/\_/ |___/  \___/| .__/ \__,_|\__,_|\__\___|"
	textf "                                                     |_|                        "
	textf " "
	textf " "
	textf "  Select an option:"
	textf " "
	textf " "
	textf "  1 = Disable Windows Update"
	textf " "
	textf "  2 = Enable Windows Update" 
	textf " "
	textf " "
	textf "  0 = Return to menu"
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
	Call menuWindowsUpdateEN()
		Exit Function
	End If
	Select Case RP
		Case 1
		oWSH.Run "sc stop wuauserv"
		oWSH.Run "sc config wuauserv start=disabled"
	cls
	textf ""
	textf "  Windows Update is now disabled"
	wait 2
	Call menuWindowsUpdateEN()
		Case 2
		oWSH.Run "sc config wuauserv start=auto"
		oWSH.Run "sc start wuauserv"
	cls
	textf ""
	textf "  Windows Update is now enabled"
	wait 2
	Call menuWindowsUpdateEN()		
		Case 0
	Call showMenuEN()
End Select
End Function

Function menuPerformanceEN()
	cls
	On Error Resume Next	
	textf "   ____            __                                             _                      _        "
	textf "  |  _ \ ___ _ __ / _| ___  _ __ _ __ ___   __ _ _ __   ___ ___  | |___      _____  __ _| | _____ "
	textf "  | |_) / _ \ '__| |_ / _ \| '__| '_ ` _ \ / _` | '_ \ / __/ _ \ | __\ \ /\ / / _ \/ _` | |/ / __|"
	textf "  |  __/  __/ |  |  _| (_) | |  | | | | | | (_| | | | | (_|  __/ | |_ \ V  V /  __/ (_| |   <\__ \"
	textf "  |_|   \___|_|  |_|  \___/|_|  |_| |_| |_|\__,_|_| |_|\___\___|  \__| \_/\_/ \___|\__,_|_|\_\___/"                                                             
	textf ""
	textf ""
	textf ""
	textf "  Select an option:"
	textf ""
	textf ""
	textf "  1 = Disable BitLocker, Encryption and OfflineFiles"
	textf ""
	textf "  2 = Disable WiFi services"
	textf ""
	textf "  3 = Open Windows disk cleaner"
	textf ""
	textf "  4 = Additional Windows Features"
	textf ""
	textf "  5 = Enable all system bandwith"
	textf ""
	textf ""
	textf "  0 = Back to menu			99 = Restore"
	textf ""
	textl "  > "
	Select Case scanf
		Case 1
			textf ""
		oWSH.Run "sc config BDESVC start=disabled"
		oWSH.Run "sc config EFS start=disabled"
		oWSH.Run "sc config CscService start=disabled"
		oWSH.Run "sc stop BDESVC"
		oWSH.Run "sc stop EFS"
		oWSH.Run "sc stop CscService"
			textf ""
			textf ""
			wait 1
			Call menuPerformanceEN()
		Case 2
			textf ""
		oWSH.Run "sc config WlanSvc start=disabled"
		oWSH.Run "sc stop WlanSvc"
			textf ""
			textf ""
			wait 1
			Call menuPerformanceEN()
		Case 3
		oWSH.Run "cleanmgr.exe"
			textf ""
			textf ""
			wait 1
			Call menuPerformanceEN()
		Case 4
		oWSH.Run "optionalfeatures.exe"
			textf ""
			textf ""
			wait 1
			Call menuPerformanceEN()
		Case 5
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched\Psched", 0, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call menuPerformanceEN()
		Case 99
			Call restorePerformanceEN()
		Case 0
			Call showMenuEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call menuPerformanceEN()
			Exit Function
		End Select
End Function

Function restorePerformanceEN()
	cls
	On Error Resume Next	
	textf "   ____            __                                             _       Restore        _        "
	textf "  |  _ \ ___ _ __ / _| ___  _ __ _ __ ___   __ _ _ __   ___ ___  | |___      _____  __ _| | _____ "
	textf "  | |_) / _ \ '__| |_ / _ \| '__| '_ ` _ \ / _` | '_ \ / __/ _ \ | __\ \ /\ / / _ \/ _` | |/ / __|"
	textf "  |  __/  __/ |  |  _| (_) | |  | | | | | | (_| | | | | (_|  __/ | |_ \ V  V /  __/ (_| |   <\__ \"
	textf "  |_|   \___|_|  |_|  \___/|_|  |_| |_| |_|\__,_|_| |_|\___\___|  \__| \_/\_/ \___|\__,_|_|\_\___/"                                                            
	textf ""
	textf ""
	textf ""
	textf "  Select an option:"
	textf ""
	textf ""
	textf "  1 = Enable BitLocker, Encryption and OfflineFiles"
	textf ""
	textf "  2 = Enable WiFi services"
	textf ""
	textf "  3 = Disable all system bandwith"
	textf ""
	textf ""
	textf "  0 = Back to previous menu"
	textf ""
	textl "  > "
	Select Case scanf
		Case 1
			textf ""
		oWSH.Run "sc config BDESVC start=auto"
		oWSH.Run "sc config EFS start=auto"
		oWSH.Run "sc config CscService start=auto"
		oWSH.Run "sc start BDESVC"
		oWSH.Run "sc start EFS"
		oWSH.Run "sc start CscService"
			textf ""
			textf ""
			wait 1
			Call restorePerformanceEN()
		Case 2
			textf ""
		oWSH.Run "sc config WlanSvc start=auto"
		oWSH.Run "sc start WlanSvc"
			textf ""
			textf ""
			wait 1
			Call restorePerformanceEN()
		Case 3
		oWSH.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched\Psched", 20, "REG_DWORD"
			textf ""
			textf ""
			wait 1
			Call restorePerformanceEN()
		Case 0
			Call menuPerformanceEN()
		Case Else
			textf ""
			textf " Only numbers are allowed."
			wait 2
			Call restorePerformanceEN()
			Exit Function
		End Select
End Function


Function menuCleanAppsEN()
	cls
	On Error Resume Next
	textf "      _                      _   ___        ______  "
	textf "     / \   _ __  _ __  ___  | | | \ \      / /  _ \ "
	textf "    / _ \ | '_ \| '_ \/ __| | | | |\ \ /\ / /| |_) |"
	textf "   / ___ \| |_) | |_) \__ \ | |_| | \ V  V / |  __/ "
	textf "  /_/   \_\ .__/| .__/|___/  \___/   \_/\_/  |_|    "
	textf "          |_|   |_|                                 "
	textf " "
	textf "  This will uninstall the next apps:"
	textf ""
	textf "  > Bing, Zune, Skype, XboxApp"
	textf "  > Getstarted, Messagin, 3D Builder"
	textf "  > Windows Maps, Phone, Camera, Alarms, People"
	textf "  > Windows Communications Apps, Sound Recorder"
	textf "  > Microsoft Office Hub, Office Sway, OneNote"
	textf "  > Solitaire Collection, CandyCrushSaga"
	textf ""
	textl "  This option is NOT reversible. Do you want to continue? (s/n) "
	
	If scanf = "s" Then
		oWSH.Run "powershell get-appxpackage -Name *Bing* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *Zune* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *XboxApp* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *OneNote* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *SkypeApp* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *3DBuilder* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *Getstarted* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *Microsoft.People* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *MicrosoftOfficeHub* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *MicrosoftSolitaireCollection* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *WindowsCamera* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *WindowsAlarms* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *WindowsMaps* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *WindowsPhone* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *WindowsSoundRecorder* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *windowscommunicationsapps* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *CandyCrushSaga* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *Messagin* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *ConnectivityStore* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *CommsPhone* | Remove-AppxPackage", 1, True
		oWSH.Run "powershell get-appxpackage -Name *Office.Sway* | Remove-AppxPackage", 1, True
		textf ""
		textf " > All apps have been successfully uninstalled..."
	Else
		textf ""
		textf " > Operation cancelled."
	End If
	wait 2
	Call showMenuEN(2)
End Function

Function safemodesettingsEN()
	cls
	textf " "
	textf "   ____         __        __  __           _        ____       _   _   _                 "
	textf "  / ___|  __ _ / _| ___  |  \/  | ___   __| | ___  / ___|  ___| |_| |_(_)_ __   __ _ ___ "
	textf "  \___ \ / _` | |_ / _ \ | |\/| |/ _ \ / _` |/ _ \ \___ \ / _ \ __| __| | '_ \ / _` / __|"
	textf "   ___) | (_| |  _|  __/ | |  | | (_) | (_| |  __/  ___) |  __/ |_| |_| | | | | (_| \__ \"
	textf "  |____/ \__,_|_|  \___| |_|  |_|\___/ \__,_|\___| |____/ \___|\__|\__|_|_| |_|\__, |___/"
	textf "                                                                              |___/      "
	textf " "
	textf " "
	textf "  Select an option:"
	textf " "
	textf " "
	textf "  1 = Restart in Safe Mode (Normal)"
	textf " "
	textf "  2 = Restart in Safe Mode (Networking)"
	textf " "
	textf "  3 = Reboot to Standard Windows"
	textf " "
	textf " "
	textf "  0 = Return to menu"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call safemodesettingsEN()
		Exit Function
	End If
	Select Case RP
	Case 1	
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot minimal"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 2
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot network"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 3
		MsgBox "Your PC will reboot right after you close this window, make sure you did all your changes", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /deletevalue {current} safeboot"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 0
		cls
		wait 1
		Call showMenuEN()
		Exit Function
	End Select
End Function

Function showKeyboardTipsEN()
	msg = msg & "WIN+A		Open the activity center" & vbcrlf
	msg = msg & "WIN+C		Turn on Cortana's voice recognition" & vbcrlf
	msg = msg & "WIN+D		Show desktop" & vbcrlf
	msg = msg & "WIN+E		Open Windows Explorer" & vbcrlf
	msg = msg & "WIN+G		Activate Game DVR to record the screen" & vbcrlf
	msg = msg & "WIN+H		Share in Modern apps for Windows 10" & vbcrlf
	msg = msg & "WIN+I		Open system settings" & vbcrlf
	msg = msg & "WIN+K		Launch 'Connect' to send data to devices" & vbcrlf
	msg = msg & "WIN+L		Lock the PC" & vbcrlf
	msg = msg & "WIN+R		Run a command" & vbcrlf
	msg = msg & "WIN+S		Open Cortana" & vbcrlf
	msg = msg & "WIN+X		Open advanced options menu" & vbcrlf
	msg = msg & "WIN+TAB		Open the task view" & vbcrlf
	msg = msg & "WIN+Arrows		Move a windows around the screen (Windows Snap)" & vbcrlf
	msg = msg & "WIN+CTRL+D		Create a Virtual Desktop" & vbcrlf
	msg = msg & "WIN+CTRL+F4	Close a Virtual Desktop" & vbcrlf
	msg = msg & "WIN+CTRL+Arrows	Change Virtual Desktop" & vbcrlf
	msg = msg & "WIN+SHIFT+Arrows	Move the actual window to another monitor" & vbcrlf
	
	MsgBox msg, vbOkOnly, "DFX Tweaker: Keyboard shortcuts"
	Call showMenuEN(0)
End Function

Function tweakerexit()
textf " "
textf " "
textf " "
textf " "
textf "________________________________________________________________________________________________________________________"
textf " "
textf " "
textf " "
textf " "
textf " "
textf " 		    ____  _______  __  _____                    _		    "
textf "  		   |  _ \|  ___\ \/ / |_   _|_      _____  __ _| | _____ _ __ "
textf "  		   | | | | |_   \  /    | | \ \ /\ / / _ \/ _` | |/ / _ \ '__|"
textf "  		   | |_| |  _|  /  \    | |  \ V  V /  __/ (_| |   <  __/ |   "
textf "  		   |____/|_|   /_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___|_| is now closing...  "
textf " "
textf " "
textf " "
textf " 						2023 ivandfx"
textf " "
textf " "
textf " "
textf "________________________________________________________________________________________________________________________"
textf " "
textf " "
textf " "
textf " "
wait 2
WScript.Quit
End Function

Function textf(txt)
	WScript.StdOut.WriteLine txt
End Function

Function textl(txt)
	WScript.StdOut.Write txt
End Function

Function scanf()
	scanf = LCase(WScript.StdIn.ReadLine)
End Function

Function wait(n)
	WScript.Sleep Int(n * 1000)
End Function

Function cls()
	For i = 1 To 50
		textf ""
	Next
End Function

Function ForceConsole()
	If InStr(LCase(WScript.FullName), "cscript.exe") = 0 Then
		oWSH.Run "cscript //NoLogo " & Chr(34) & WScript.ScriptFullName & Chr(34)
		WScript.Quit
	End If
End Function

Function checkNT10()
If getNTversion < 10 Then
	result = MsgBox ("This release of DFX Tweaker requires Windows 10 or newer. Do you want to download DFX Tweaker NT6, which is supported on Windows 7 and 8.x?", vbCritical + vbYesNo, "DFX Tweaker Standard")
Select Case result
Case vbYes
	Dim url
	Set url= CreateObject("WScript.Shell")
	url.Run "https://ivandfx.github.io/DFXTweaker", 9
	WScript.Quit
Case vbNo
	WScript.Quit
End Select
End If
End Function

Function runElevated()
	If isUACRequired Then
		If Not isElevated Then RunAsUAC
	Else
		If Not isAdmin Then
			textf "  You need to run DFX Tweaker as Administrator"
			textf ""
			textf " Press ENTER to exit"
			scanf
			WScript.Quit
		End If
	End If
End Function
 
Function isUACRequired()
	r = isUAC()
	If r Then
		intUAC = oWSH.RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA")
		r = 1 = intUAC
	End If
	isUACRequired = r
End Function

Function isElevated()
	isElevated = CheckCredential("S-1-16-12288")
End Function

Function isAdmin()
	isAdmin = CheckCredential("S-1-5-32-544")
End Function
 
Function CheckCredential(p)
	Set oWhoAmI = oWSH.Exec("whoami /groups")
	Set WhoAmIO = oWhoAmI.StdOut
	WhoAmIO = WhoAmIO.ReadAll
	CheckCredential = InStr(WhoAmIO, p) > 0
End Function
 
Function RunAsUAC()
	If isUAC Then
		textf ""
		textf "  DFX Tweaker needs to be ran with Administrator privileges"
		oAPP.ShellExecute "cscript", "//NoLogo " & Chr(34) & WScript.ScriptFullName & Chr(34), "", "runas", 1
		WScript.Quit
	End If
End Function
 
Function isUAC()
	Set cWin = oWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
	r = False
	For Each OS In cWin
		If Split(OS.Version,".")(0) > 5 Then
			r = True
		Else
			r = False
		End If
	Next
	isUAC = r
End Function

Function archCheck()
Dim WshShell
Dim WshProcEnv
Dim system_architecture
Dim process_architecture

Set WshShell =  CreateObject("WScript.Shell")
Set WshProcEnv = WshShell.Environment("Process")

process_architecture= WshProcEnv("PROCESSOR_ARCHITECTURE") 

If process_architecture = "x86" Then    
    system_architecture= WshProcEnv("PROCESSOR_ARCHITEW6432")

    If system_architecture = ""  Then    
        system_architecture = "x86"
    End if    
Else    
    system_architecture = process_architecture    
End If

textf " "
textf "  Detected " & process_architecture & " process, " & system_architecture & " system."
End Function

Function CheckCredential(p)
	Set oWhoAmI = oWSH.Exec("whoami /groups")
	Set WhoAmIO = oWhoAmI.StdOut
	WhoAmIO = WhoAmIO.ReadAll
	CheckCredential = InStr(WhoAmIO, p) > 0
End Function
 
Function isUAC()
	Set cWin = oWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
	r = False
	For Each OS In cWin
		If Split(OS.Version,".")(0) > 5 Then
			r = True
		Else
			r = False
		End If
	Next
	isUAC = r
End Function

Function getNTversion()
	Set cWin = oWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
	For Each OS In cWin
		getNTversion = Split(OS.Version,".")(0)
	Next
End Function