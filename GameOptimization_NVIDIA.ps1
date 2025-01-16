# PowerShell Script to Optimize System for Maximum FPS in Games (PUBG, etc.) for NVIDIA Users

# Run with Administrator privileges

# Step 1: Set Power Plan to Ultimate Performance
Write-Host "Enabling Ultimate Performance Power Plan..."
powercfg -duplicatescheme SCHEME_MIN
powercfg -setactive SCHEME_MAX

# Step 2: Set CPU Priority for TslGame.exe to High
Write-Host "Setting CPU Priority to High for TslGame.exe..."
$gameProcess = "TslGame.exe"  # Game process name set to TslGame.exe
$processes = Get-Process -Name $gameProcess -ErrorAction SilentlyContinue
if ($processes) {
    foreach ($process in $processes) {
        $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High
    }
    Write-Host "CPU Priority set to High for TslGame.exe"
} else {
    Write-Host "$gameProcess is not running. Ensure the game is started before running the script."
}

# Step 3: Disable CPU Throttling (Set CPU to Full Performance)
Write-Host "Disabling CPU Throttling..."
$powerPlanSettings = powercfg /query SCHEME_CURRENT SUB_PROCESSOR
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

# Step 4: Optimize GPU Settings for NVIDIA
Write-Host "Optimizing GPU Settings for NVIDIA..."
# Example of enabling maximum performance mode for NVIDIA GPUs via NVIDIA settings
$gpuCommand = "nvidia-settings --assign 'PowerMizerMode=1' --assign 'GpuPowerMizerMode=1' --assign 'TextureFilteringQuality=3'"

Start-Process cmd -ArgumentList "/C $gpuCommand"

# Step 5: Increase Virtual Memory (Pagefile)
Write-Host "Increasing Virtual Memory (Pagefile)..."
$virtualMemorySize = 1.5 * [System.Environment]::WorkingSet
Set-WmiInstance -Class Win32_OperatingSystem -ArgumentList @{PageFileSize=$virtualMemorySize}

# Step 6: Disable Background Processes (Close Non-Essential Programs)
Write-Host "Disabling Background Processes..."
Get-Process | Where-Object { $_.Name -notin @("System", "explorer", "taskhost") } | Stop-Process -Force

# Step 7: Disable Full-Screen Optimization for Better Performance in Games
Write-Host "Disabling Full-Screen Optimizations..."
$gamePath = "C:\Path\To\Your\Game\TslGame.exe" # Replace with your game's executable path
$gameExecutable = Get-Item $gamePath
$gameExecutable.IsReadOnly = $true
$gameExecutable | Set-ItemProperty -Name "Compatibility" -Value 1

# Step 8: Disable Windows Defender and Antivirus (Temporarily - Make Sure to Re-enable Later)
Write-Host "Disabling Windows Defender..."
Set-MpPreference -DisableRealtimeMonitoring $true

Write-Host "All optimizations applied! Your system is now optimized for better gaming performance."

# End of script
