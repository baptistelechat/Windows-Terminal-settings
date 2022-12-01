Write-Host "----------------------------------------------------"
Write-Host "Microsoft Desktop App Installer"
Write-Host ""
if(Get-AppPackage *Microsoft.DesktopAppInstaller*|select Name,PackageFullName) {
  Write-Host "Microsoft.DesktopAppInstaller is installed" -ForegroundColor White -BackgroundColor Green
} else {
  Write-Host "Microsoft.DesktopAppInstaller is not installed" -ForegroundColor White -BackgroundColor Red
  Write-Host "Launching installation of Microsoft.DesktopAppInstaller ..." -ForegroundColor White -BackgroundColor Blue
  Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.1.12653/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile ".\src\WinGet.msixbundle"
  Add-AppxPackage ".\src\WinGet.msixbundle"
  Write-Host "Microsoft.DesktopAppInstaller successfuly installed" -ForegroundColor White -BackgroundColor Green
  Remove-Item -Path ".\src\WinGet.msixbundle" -Force
}
Write-Host ""
Write-Host "----------------------------------------------------"

Write-Host "----------------------------------------------------"
Write-Host "Microsoft Windows Terminal Installer"
Write-Host ""
if(Get-AppPackage *Microsoft.WindowsTerminal*|select Name,PackageFullName) {
  Write-Host "Microsoft.WindowsTerminal is installed" -ForegroundColor White -BackgroundColor Green
} else {
  Write-Host "Microsoft.WindowsTerminal is not installed" -ForegroundColor White -BackgroundColor Red
  Write-Host "Launching installation of Microsoft.WindowsTerminal ..." -ForegroundColor White -BackgroundColor Blue
  winget install --id=Microsoft.WindowsTerminal  -e
  Write-Host "Microsoft.DesktopAppInstaller successfuly installed" -ForegroundColor White -BackgroundColor Green
  Write-Host "Setup Microsoft.WindowsTerminal with settings.json" -ForegroundColor White -BackgroundColor Blue
  Copy-Item -Path ".\src\settings.json" -Destination "~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Force
}
Write-Host ""
Write-Host "----------------------------------------------------"

Write-Host "----------------------------------------------------"
Write-Host "JanDeDobbeleer.OhMyPosh Installer"
Write-Host ""
Write-Host "Launching installation of anDeDobbeleer.OhMyPosh Installer ..." -ForegroundColor White -BackgroundColor Blue
winget install JanDeDobbeleer.OhMyPosh
Install-Module oh-my-posh -Scope CurrentUser -Force
Write-Host "JanDeDobbeleer.OhMyPosh successfuly installed" -ForegroundColor White -BackgroundColor Green
Write-Host ""
Write-Host "----------------------------------------------------"

Write-Host "----------------------------------------------------"
Write-Host "Terminal-Icons Module"
Write-Host ""
Write-Host "Launching installation of Terminal-Icons Module ..." -ForegroundColor White -BackgroundColor Blue
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
Write-Host "Terminal-Icons Module successfuly installed" -ForegroundColor White -BackgroundColor Green
Write-Host ""
Write-Host "----------------------------------------------------"

Write-Host "----------------------------------------------------"
Write-Host "Setup PowerShell Profile and Theme"
Write-Host ""
# If(!(test-path ".\Documents\WindowsPowerShell"))
# {
#   New-Item -ItemType Directory -Force -Path $path
# }
Write-Host "Copy Files for PowerShell profile..." -ForegroundColor White -BackgroundColor Blue
Copy-Item -Path ".\src\Microsoft.PowerShell_profile.ps1" -Destination "~/Documents/WindowsPowerShell" -Force
Write-Host "Copy Files for PowerShell Theme..." -ForegroundColor White -BackgroundColor Blue
Copy-Item -Path ".\src\myBubblesextraTheme.omp.json" -Destination "~/Documents/WindowsPowerShell" -Force
Write-Host ""
Write-Host "----------------------------------------------------"

Write-Host "----------------------------------------------------"
Write-Host "Active Autocomplete"
Write-Host ""
Get-InstalledModule -Name psreadline -AllVersions | Uninstall-Module
Install-Module PSReadLine -Force
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Write-Host ""
Write-Host "----------------------------------------------------"

wt

