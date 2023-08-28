@ECHO off
cls
:start



@ECHO Setting enviroment variables
:: Get in the correct drive (~d0) and path (~dp0). Sometimes needed when run from a network or thumb drive.
:: We stay in the root directory for the rest of the script
%~d0 2>NUL
pushd "%~dp0" 2>NUL
call Scripts\functions\pre-run.bat

@ECHO Applying settings


:installers
powershell Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
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
powershell -file .\Scripts\GenSetup.ps1
goto end

:lenovoapps
@ECHO "Installing Lenovo & General applications"
powershell -file .\Scripts\GenLenovoSetup.ps1
goto end

:test
cls
ECHO "This option has not been setup yet. Ask the script's creator for more details."
PAUSE
cls
goto installers


:end
powershell Set-ExecutionPolicy -Scope CurrentUser %execpol%
PAUSE

