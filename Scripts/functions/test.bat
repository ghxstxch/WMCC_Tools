@ECHO OFF
:start
goto execpol

:execpol
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell Get-ExecutionPolicy`) DO (
SET execpol=%%F
)
powershell Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
ECHO The current Execution-Policy will be setset to Bypass.
ECHO This will be set back to the original value, %execpol% at the end of this script.
goto end

:end
