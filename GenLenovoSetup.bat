cd /d %~dp0
@powershell Set-ExecutionPolicy RemoteSigned >NUL
ECHO Changing settings...
@powershell -file .\Scripts\Settings.ps1 >NUL
ECHO Installing Programs...
@powershell -file .\Scripts\GenLenovoSetup.ps1 >NUL
