# PowerShell Script to Download, Install, and Cleanup Revo Uninstaller

# Step 1: Define the URL of the Revo Uninstaller Installer
$installerUrl = "https://download.revouninstaller.com/download/revosetup.exe"

# Step 2: Define the output file path
$outputPath = "$env:USERPROFILE\Downloads\revosetup.exe"

# Step 3: Download the installer
Write-Host "Downloading Revo Uninstaller..."
Invoke-WebRequest -Uri $installerUrl -OutFile $outputPath

# Step 4: Install Revo Uninstaller
Write-Host "Installing Revo Uninstaller..."
Start-Process $outputPath -Wait

# Step 5: Clean up the installer file after installation
Write-Host "Cleaning up the installer..."
Remove-Item $outputPath

Write-Host "Revo Uninstaller has been installed successfully and the installer file has been removed."
