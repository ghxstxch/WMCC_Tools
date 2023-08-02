cd /d %~dp0
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\Settings.ps1
powershell -file .\Scripts\GenLenovoSetup.ps1
