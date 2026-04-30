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
