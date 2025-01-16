# Disable Auto-Start for Game Launcher
# This removes both Steam and Epic Games from auto-start (Modify this list if using another launcher)
$launcherPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run\Steam",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run\EpicGamesLauncher"
)

foreach ($launcherPath in $launcherPaths) {
    Remove-ItemProperty -Path $launcherPath -ErrorAction SilentlyContinue
    Write-Output "$launcherPath auto-start disabled."
}

# Enable High Performance Mode for PUBG (TslGame.exe)
# Set the game's process priority to High for better performance
$gameProcessName = "TslGame.exe"
$gamePriority = "High"  # Set to "High" or "Realtime"
$gameProcess = Get-Process -Name $gameProcessName -ErrorAction SilentlyContinue
if ($gameProcess) {
    $gameProcess | ForEach-Object {
        $_.PriorityClass = $gamePriority
    }
    Write-Output "PUBG process priority set to $gamePriority."
} else {
    Write-Output "PUBG (TslGame.exe) is not running."
}

# Disable Overlay for Steam or Epic Games
# Steam Overlay Disable
$steamPath = "HKCU:\Software\Valve\Steam"
$steamOverlay = "OverlayEnabled"
Set-ItemProperty -Path $steamPath -Name $steamOverlay -Value 0 -ErrorAction SilentlyContinue
Write-Output "Steam Overlay disabled."

# Epic Games Launcher Overlay Disable
$gameBarPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR"
Set-ItemProperty -Path $gameBarPath -Name "AllowGameDVR" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Epic Games Launcher Overlay disabled."

# Disable Cloud Sync (Steam or Epic Games)
# Steam Cloud Sync Disable
$steamCloudPath = "HKCU:\Software\Valve\Steam"
$steamCloudSync = "Cloud"  # Set CloudSync to 0 to disable it
Set-ItemProperty -Path $steamCloudPath -Name $steamCloudSync -Value 0 -ErrorAction SilentlyContinue
Write-Output "Steam Cloud Sync disabled."

# Epic Games Cloud Sync Disable
$epicCloudPath = "HKCU:\Software\EpicGames\UnrealEngine\4"
Set-ItemProperty -Path $epicCloudPath -Name "Cloud" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Epic Games Cloud Sync disabled."

# Disable Background Updates (Steam and Epic Games)
# Steam Background Updates Disable
$steamAutoUpdatePath = "HKCU:\Software\Valve\Steam"
Set-ItemProperty -Path $steamAutoUpdatePath -Name "AutoUpdate" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Steam Background Updates disabled."

# Epic Games Background Updates Disable
$epicAutoUpdatePath = "HKCU:\Software\EpicGames"
Set-ItemProperty -Path $epicAutoUpdatePath -Name "AutoUpdate" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Epic Games Background Updates disabled."

# Disable Notifications (Windows Game Bar Notifications)
$notificationPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
Set-ItemProperty -Path $notificationPath -Name "ToastEnabled" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Windows Notifications disabled."

# Final Message
Write-Output "Game Launcher Tweaks for PUBG (TslGame.exe) applied successfully!"
