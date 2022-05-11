@echo off

for %%I in (.) do set INSTANCE=%%~nxI

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%INSTANCE%.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%cd%\..\..\MultiMC.exe" >> %SCRIPT%
echo oLink.Arguments = "-l ""%INSTANCE%""" >> %SCRIPT%
echo oLink.IconLocation = "%cd%\icon.ico,0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

exit