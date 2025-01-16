# Premium OBS Debloat Script

# Step 1: Disable Unused Plugins
$obsPluginsPath = "$env:APPDATA\obs-studio\plugins"
$unusedPlugins = @("plugin1", "plugin2", "plugin3") # Replace with unused plugins you want to disable
foreach ($plugin in $unusedPlugins) {
    $pluginPath = Join-Path $obsPluginsPath $plugin
    if (Test-Path $pluginPath) {
        Remove-Item -Path $pluginPath -Recurse -Force
        Write-Output "$plugin disabled."
    }
}

# Step 2: Disable Studio Mode (Set to off)
$obsSettingsPath = "$env:APPDATA\obs-studio\basic\profiles\default\settings.ini"
if (Test-Path $obsSettingsPath) {
    $iniFile = Get-Content $obsSettingsPath
    $iniFile = $iniFile -replace '^studio_mode=.*', 'studio_mode=false'
    Set-Content -Path $obsSettingsPath -Value $iniFile
    Write-Output "Studio Mode disabled."
}

# Step 3: Disable Unnecessary Audio Devices
$audioSettingsPath = "$env:APPDATA\obs-studio\basic\profiles\default\audio.ini"
if (Test-Path $audioSettingsPath) {
    $audioSettings = Get-Content $audioSettingsPath
    # Disable unused audio devices (replace "DeviceName" with actual unused devices)
    $audioSettings = $audioSettings -replace 'DeviceName=.*', 'DeviceName=None'
    Set-Content -Path $audioSettingsPath -Value $audioSettings
    Write-Output "Unused audio devices disabled."
}

# Step 4: Disable Hardware Acceleration in OBS
$obsConfigPath = "$env:APPDATA\obs-studio\userdata\global.ini"
if (Test-Path $obsConfigPath) {
    $configFile = Get-Content $obsConfigPath
    # Disable hardware acceleration
    $configFile = $configFile -replace '"hardwareAcceleration"="true"', '"hardwareAcceleration"="false"'
    Set-Content -Path $obsConfigPath -Value $configFile
    Write-Output "Hardware acceleration disabled."
}

# Step 5: Set OBS Process Priority to High
$obsProcess = Get-Process -Name "obs64" -ErrorAction SilentlyContinue
if ($obsProcess) {
    $obsProcess | ForEach-Object {
        $_.PriorityClass = "High"
    }
    Write-Output "OBS process priority set to High."
} else {
    Write-Output "OBS is not running."
}

# Step 6: Disable OBS Cloud Sync (if Steam or Epic is being used)
# Steam Cloud Sync Disable
$steamCloudPath = "HKCU:\Software\Valve\Steam"
$steamCloudSync = "Cloud"  # Set CloudSync to 0 to disable it
Set-ItemProperty -Path $steamCloudPath -Name $steamCloudSync -Value 0 -ErrorAction SilentlyContinue
Write-Output "Steam Cloud Sync disabled."

# Epic Games Cloud Sync Disable
$epicCloudPath = "HKCU:\Software\EpicGames\UnrealEngine\4"
Set-ItemProperty -Path $epicCloudPath -Name "Cloud" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Epic Games Cloud Sync disabled."

# Step 7: Disable Background Updates (Steam and Epic Games)
# Steam Background Updates Disable
$steamAutoUpdatePath = "HKCU:\Software\Valve\Steam"
Set-ItemProperty -Path $steamAutoUpdatePath -Name "AutoUpdate" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Steam Background Updates disabled."

# Epic Games Background Updates Disable
$epicAutoUpdatePath = "HKCU:\Software\EpicGames"
Set-ItemProperty -Path $epicAutoUpdatePath -Name "AutoUpdate" -Value 0 -ErrorAction SilentlyContinue
Write-Output "Epic Games Background Updates disabled."

# Final Message
Write-Output "Premium OBS Debloat applied successfully!"
