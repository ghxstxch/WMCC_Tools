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


:settings
::Applies changes to settings found in Settings.ps1. At the time of writing, all this does is change the TZ to CST. 
@ECHO Applying settings.
powershell -ExecutionPolicy ByPass -file .\Scripts\Settings.ps1

:installers
::Multiple choice options, lets you select between different install scenarios. 
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
::Installs Generic apps
@ECHO Installing general applications
powershell -ExecutionPolicy ByPass -file .\Scripts\GenSetup.ps1
goto end && cls

:lenovoapps
::Installs Generic apps + Lenovo System Update
@ECHO Installing Lenovo & General applications
powershell -ExecutionPolicy ByPass -file .\Scripts\GenLenovoSetup.ps1
goto end && cls

:test
::Not set up yet, lol
cls
ECHO "This option has not been setup yet. Ask the script's creator for more details."
PAUSE

goto installers && cls


:end
:: This does what you think it does. 
powershell Set-ExecutionPolicy -Scope CurrentUser %execpol%
@ECHO The script has finished running! :)  
PAUSE

