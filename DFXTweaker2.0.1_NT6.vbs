On Error Resume Next
Randomize

Set oWSH = CreateObject("WScript.Shell")
Set oAPP = CreateObject("Shell.Application")
Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oWMI = GetObject("winmgmts:\\.\root\CIMV2")
strUser = CreateObject("WScript.Network").UserName

Call ForceConsole()
Call runElevated()
currentVersion = "2.0.1_NT6"
Call legacymenu()

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

Function legacymenu()
	cls
	textf "   ____  _______  __  _____      For Windows 7 _ and 8.x     "
	textf "  |  _ \|  ___\ \/ / |_   _|_      _____  __ _| | _____ _ __ " & currentVersion
	textf "  | | | | |_   \  /    | | \ \ /\ / / _ \/ _` | |/ / _ \ '__|"
	textf "  | |_| |  _|  /  \    | |  \ V  V /  __/ (_| |   <  __/ |   "
	textf "  |____/|_|   /_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___|_|   "
        textf "     Created by ivandfx"
	textf " "
	textf "  Welcome, " & strUser
	textf "  Select an option:				44 = Reboot to Safe Mode"
	textf "						55 = Restart to Windows"
	textf " "
	textf "  1 = Disable Windows Update"
	textf "  2 = Disable Windows Defender (SF)"
	textf "  3 = Create a 'God Mode' icon on the Desktop"
	textf "  4 = Open Windows disk cleaner"
	textf "  5 = Additional Windows Features"
	textf " "
	textf " "
	textf " "
	textf "  88 = DFX Tweaker Web - Get updates or DFX Tweaker Standard for Windows 10"
	textf " "
	textf "  0 = Close				       99 = Restore"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call legacymenu()
		Exit Function
	End If
	Select Case RP
	Case 1
		oWSH.Run "sc stop wuauserv"
		oWSH.Run "sc config wuauserv start=disabled"
		Call legacymenu()
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
		Call legacymenu()
	Case 3
		godFolder = oWSH.SpecialFolders("Desktop") & "\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
		If oFSO.FolderExists(godFolder) = False Then oFSO.CreateFolder(godFolder)
			textf ""
			textf ""
			wait 1
			Call legacymenu()
		Case 4
		oWSH.Run "cleanmgr.exe"
			textf ""
			textf ""
			wait 1
			Call legacymenu()
		Case 5
		oWSH.Run "optionalfeatures.exe"
			textf ""
			textf ""
			wait 1
			Call legacymenu()
	Case 44
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot minimal"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 55
		MsgBox "Your PC will reboot right after you close this window, make sure you did all your changes", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /deletevalue {current} safeboot"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 88
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://ivandfx.github.io/DFXTweaker", 9
		Call legacymenu()
	Case 99
		Call dfxlegacyrestore()
	Case 0
		WScript.Quit
	End Select
End Function

Function dfxlegacyrestore()
cls
	textf "   ____  _______  __  _____      For Windows 7 _ and 8.x     "
	textf "  |  _ \|  ___\ \/ / |_   _|_      _____  __ _| | _____ _ __ " & currentVersion
	textf "  | | | | |_   \  /    | | \ \ /\ / / _ \/ _` | |/ / _ \ '__|"
	textf "  | |_| |  _|  /  \    | |  \ V  V /  __/ (_| |   <  __/ |   "
	textf "  |____/|_|   /_/\_\   |_|   \_/\_/ \___|\__,_|_|\_\___|_|   "
        textf "     Created by ivandfx		RESTORE MENU"
	textf " "
	textf " "
	textf "  Select an option:				44 = Reboot to Safe Mode"
	textf "						55 = Restart to Windows"
	textf " "
	textf "  1 = Enable Windows Update"
	textf "  2 = Enable Windows Defender (SF)"
	textf "  3 = Delete the 'God Mode' icon on the Desktop"
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf " "
	textf "  0 = Back to previous menu"
	textf " "
	textl " > "
	RP = scanf
	If isNumeric(RP) = False Then
		textf ""
		textf " Only numbers are allowed."
		wait 2
		Call dfxlegacyrestore()
		Exit Function
	End If
	Select Case RP
	Case 1
		oWSH.Run "sc start wuauserv"
		oWSH.Run "sc config wuauserv start=auto"
		Call dfxlegacyrestore()
	Case 2
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
		Call dfxlegacyrestore()
	Case 3
		godFolder = oWSH.SpecialFolders("Desktop") & "\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
		If oFSO.FolderExists(godFolder) = True Then oFSO.DeleteFolder(godFolder)
			wait 1
			Call dfxlegacyrestore()
	Case 44
		MsgBox "Your PC will reboot right after you close this window, make sure you saved all your data", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /set {current} safeboot minimal"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 55
		MsgBox "Your PC will reboot right after you close this window, make sure you did all your changes", vbInformation + vbOkOnly, "DFX Tweaker Safe Mode"
		Set objShell = WScript.CreateObject("WScript.Shell")
		oWSH.Run "bcdedit /deletevalue {current} safeboot"
		wait 1
		objShell.Run "C:\WINDOWS\system32\shutdown.exe -r -t 0"
	Case 88
		Dim url
		Set url= CreateObject("WScript.Shell")
		url.Run "https://ivandfx.github.io/DFXTweaker", 9
		Call dfxlegacyrestore()
	Case 0
		Call legacymenu()
	End Select
End Function

Function runElevated()
	If isUACRequired Then
		If Not isElevated Then RunAsUAC
	Else
		If Not isAdmin Then
			textf "  You need to run DFX Tweaker as Administrator"
			textf ""
			textf " Press Enter to exit"
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

Function CheckCredential(p)
	Set oWhoAmI = oWSH.Exec("whoami /groups")
	Set WhoAmIO = oWhoAmI.StdOut
	WhoAmIO = WhoAmIO.ReadAll
	CheckCredential = InStr(WhoAmIO, p) > 0
End Function
 
Function RunAsUAC()
	If isUAC Then
		textf ""
		textf "  DFX Tweaker needs to be ran with Administrator privileges..."
		wait 0.4
		textf "  Wait..."
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

Function getNTversion()
	Set cWin = oWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
	For Each OS In cWin
		getNTversion = Split(OS.Version,".")(0)
	Next
End Function