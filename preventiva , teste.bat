@ECHO OFF
TITLE PREVENTIVA GERAL DARDIN – Atualizado 18/08/2014
color C0
ECHO.
ECHO.
ECHO.
ECHO :: PREVENTIVA ::
ECHO.
ECHO * Aguarde *
ECHO.
ECHO.
ECHO.
ping -n 5 localhost > nul
CLS
del %WINDIR%\Prefetch /F /S /Q
del %WINDIR%\Temp /F /S /Q /F
del %WINDIR%\Temporary Internet Files /F /S /Q /F
del /F /S /q c:\windows\temp\*.*
REM rd /s /q c:\windows\temp
REM md c:\windows\temp

REM del /F /S /q c:\temp\*.*
REM rd /s /q c:\temp
REM md c:\TEMP

del /F /S /Q c:\*.log
del /F /S /Q c:\*.lck
del /s /Q c:\*.bak
del /F /S /Q c:\*.tmp
REM del c:\*.chk /s /Q
del /F /S /Q c:\*.old
REM del c:\*.wbk /s /Q
REM del c:\*.fts /s /Q
REM del c:\*.gid /s /Q
del /F /S /Q d:\E811\*.log
del /F /S /Q D:\*.lck

del c:\*.log /F /S /Q
deltree /y c:\*.bak /s /Q
del c:\*.tmp /F /S /Q
REM deltree /y c:\*.chk /s /Q
del c:\*.old /F /S /Q
REM del c:\*.wbk /s /Q
REM del c:\*.fts /s /Q
REM del c:\*.gid /s /Q
del d:\E811\*.log /F /S /Q
del D:\*.LOG /F /S /Q

del /F /S /Q c:\windows\tempor~1
del /F /S /Q C:\Windows\temp
del /F /S /Q c:\windows\tmp
del /F /S /Q D:\users\Default\AppData\Local\Microsoft\Windows\Temporary Internet Files
del /F /S /Q “c:\documents and Settings\%username%\Configura‡äes locais\Temporary Internet Files\Content.IE5\*.*”
del /F /S /Q “c:\documents and Settings\%username%\Configura‡äes locais\Temporary Internet Files\*.*”
del /F /S /Q “c:\documents and Settings\%username%\Configura‡äes locais\Temp\*.*”
del /F /S /Q “C:\Documents and Settings\%username%\Cookies\*.*”
del /F /S /Q D:\users\adardin\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*
del /F /S /Q D:\users\adardin\AppData\Local\Temp

del /F /S /Q D:\users\%username%\AppData\Local\Microsoft\Windows\Temporary Internet Files
rem del *.* D:\users\%username%\AppData\Local\Temp
del /F /S /Q D:\users\%username%\AppData\Local\Temp
CLS
color A0
ECHO.
ECHO.
ECHO.
ECHO :: CONCLUIDO ::
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
EXIT