@ECHO off
@ECHO Setting working directory
cd /d %~dp0

@ECHO Applying settings
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\Settings.ps1

@ECHO Installing applications
powershell -file .\Scripts\GenLenovoSetup.ps1
