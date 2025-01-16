# Disable Discord from starting on boot
Write-Output "Disabling Discord from starting on boot..."
Start-Process cmd -ArgumentList '/c reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Discord /t REG_SZ /d "" /f' -NoNewWindow -Wait

# Disable Discord overlay
Write-Output "Disabling Discord overlay..."
Start-Process cmd -ArgumentList '/c reg add "HKCU\Software\Discord" /v OverlayEnabled /t REG_DWORD /d 0 /f' -NoNewWindow -Wait

# Set Discord process priority to low
Write-Output "Setting Discord process priority to low..."
Start-Process cmd -ArgumentList '/c wmic process where name="discord.exe" call setpriority 64' -NoNewWindow -Wait

# Disable toast notifications
Write-Output "Disabling toast notifications..."
Start-Process cmd -ArgumentList '/c reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f' -NoNewWindow -Wait

# Disable hardware acceleration
Write-Output "Disabling hardware acceleration in Discord..."
$filePath = "$env:APPDATA\discord\settings.json"
if (Test-Path $filePath) {
    (Get-Content $filePath) -replace '"hardwareAcceleration":true', '"hardwareAcceleration":false' | Set-Content $filePath
    Write-Output "hardwareAcceleration has been disabled."
} else {
    Write-Output "settings.json not found!"
}

# Completion message
Write-Output "All tweaks applied successfully!"
Pause
