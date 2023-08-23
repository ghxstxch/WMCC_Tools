@ECHO off
cls
:start


@ECHO Setting working directory
cd /d %~dp0

@ECHO Applying settings
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\Settings.ps1

:installers
@ECHO.
@ECHO 1. Install Generic Applications
@ECHO 2. Install Lenovo AND Generic Applications
@ECHO 3. Test
set installers=
set /p choice="Type the number for the option you would like to select and press the 'Enter' Key="
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto genericapps
if '%choice%'=='2' goto lenovoapps
if '%choice%'=='3' goto test
@ECHO "%choice%" is not valid, try again

:genericapps
@ECHO "Installing General applications"
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\GenSetup.ps1
goto end

:lenovoapps
@ECHO "Installing Lenovo & General applications"
powershell Set-ExecutionPolicy RemoteSigned
powershell -file .\Scripts\GenLenovoSetup.ps1
goto end

:test
cls
ECHO "This option has not been setup yet. Ask the script's creator for more details."
PAUSE
cls
goto installers


:end
PAUSE

