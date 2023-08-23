# Unattended Install of Google Chrome
Set-ExecutionPolicy RemoteSigned


$Installer = $env:TEMP + "\chrome_installer.exe";
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Installer;


$Installer = $env:TEMP + "\adobe_installer.exe";
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300320201/AcroRdrDC2300320201_en_US.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/sAll /a /qn" -Verb RunAs -Wait; 
Remove-Item $Installer;
