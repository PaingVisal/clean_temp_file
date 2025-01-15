@echo off
:: Owner: sal24k
:: This script is designed to clean up temporary files

echo Cleaning up temporary files...

:: Clean up %temp%
echo Taking ownership of files in %temp%...
takeown /f "%temp%\*" /r /d y
icacls "%temp%\*" /grant sal24k:F /t

echo Deleting files in %temp%...
del /q /f /s "%temp%\*.*"

:: Clean up C:\Windows\Temp
echo Taking ownership of files in C:\Windows\Temp...
takeown /f "C:\Windows\Temp\*" /r /d y
icacls "C:\Windows\Temp\*" /grant sal24k:F /t

echo Deleting files in C:\Windows\Temp...
del /q /f /s "C:\Windows\Temp\*.*"

echo Cleanup complete.
pause
