cd /d %~dp0
powershell Set-ExecutionPolicy RemoteSigned

powershell -file .\Scripts\RemoveWindowsStoreApps.ps1
powershell -file .\Scripts\ReinstallWindowsStore.ps1
powershell -file .\Scripts\InstallerScript.ps1