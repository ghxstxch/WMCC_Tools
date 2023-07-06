cd /d %~dp0
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\GenLenovoSetup.ps1
