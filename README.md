run it on powershell as adminsrator  
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/cleanup_temp.bat -OutFile "cleanup_temp.bat"; Start-Process "cleanup_temp.bat"
```

#DISCORD 
```
iwr https://raw.githubusercontent.com/PaingVisal/clean_temp_file/main/tweak_discord.ps1 -OutFile "tweak_discord.ps1"; Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File tweak_discord.ps1" -NoNewWindow -Wait
```
