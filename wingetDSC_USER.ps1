#Install-PackageProvider -Name NuGet -Force
#Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery
#Repair-WinGetPackageManager
#Install-Module Microsoft.WinGet.DSC -Force -Repository PSGallery
#winget configure --enable
#Invoke-WebRequest -UseBasicParsing -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile "${env:temp}\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Add-AppxPackage -Path "C:\Windows\Temp\WinGet-Stage\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
# Wait until the package appears in Get-AppxPackage
while (-not (Get-AppxPackage -Name "Microsoft.DesktopAppInstaller")) {
    Start-Sleep -Seconds 1
}
# Wait for AppX Deployment Server to finish processing
while (Get-Process -Name AppXDeploymentServer -ErrorAction SilentlyContinue) {
    Start-Sleep -Seconds 1
}
winget configure --file "C:\Windows\Temp\devbox\DEPSIT\joeri.yaml" --accept-configuration-agreements
Clear-Host

Write-Host "====================================================="
Write-Host " A system reboot is required to continue."
Write-Host " Please save your work before proceeding."
Write-Host "====================================================="
Write-Host ""
Write-Host "Press ENTER to reboot the computer..."
[void][System.Console]::ReadLine()

Write-Host "Rebooting now..."
Restart-Computer -Force
