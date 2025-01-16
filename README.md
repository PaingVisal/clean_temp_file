run it on powershell as adminsrator  
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/cleanup_temp.bat -OutFile "cleanup_temp.bat"; Start-Process "cleanup_temp.bat"
```

# DISCORD 
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/tweak_discord.ps1 -OutFile "tweak_discord.ps1"; Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File tweak_discord.ps1" -NoNewWindow -Wait
```
# Clean Disk
```
Start-Process "cleanmgr.exe" -ArgumentList "/sageset:1"; Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1"
```
-----------------------------------------------------------------------------------------------------------------
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1>How to Enable Ultimate Performance on Windows 10 Home (Workaround)</h1>

<p>If you're using <strong>Windows 10 Home</strong>, the Ultimate Performance plan is not officially available, but you can manually enable it with the following steps:</p>

<h2>Step 1: Open Command Prompt as Administrator</h2>
<ol>
    <li>Press <strong>Win + X</strong> and select <strong>Command Prompt (Admin)</strong> or <strong>Windows PowerShell (Admin)</strong>.</li>
    <li>If prompted, click <strong>Yes</strong> to allow the application to make changes.</li>
</ol>

<h2>Step 2: Enable the Ultimate Performance Plan (via command line)</h2>
<p>Run the following command in the Command Prompt or PowerShell:</p>
<pre><code>powercfg -duplicatescheme SCHEME_MIN</code></pre>
<p>This will enable the <strong>Ultimate Performance</strong> plan on Windows 10 Home, even though it’s not officially listed in the settings.</p>

<h2>Step 3: Activate the Ultimate Performance Plan</h2>
<p>Now, you can activate the <strong>Ultimate Performance</strong> plan by running:</p>
<pre><code>powercfg -setactive SCHEME_MAX</code></pre>
<p>You can now see <strong>Ultimate Performance</strong> listed under the available power plans.</p>

</body>
</html>

# Pubg Amd optimize 

Run powershell as admin and past this 
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/GameOptimization_AMD.ps1 -OutFile "GameOptimization_AMD.ps1"; Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File GameOptimization_AMD.ps1" -NoNewWindow -Wait
```
# Pubg Nvidia optimize 
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/GameOptimization_NVIDIA.ps1 -OutFile "GameOptimization_NVIDIA.ps1"; Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File GameOptimization_NVIDIA.ps1" -NoNewWindow -Wait
```
# game launcher tweak
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/gamelaunchertweaks.ps1 -OutFile "gamelaunchertweaks.ps1"; Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File gamelaunchertweaks.ps1" -NoNewWindow -Wait
```
