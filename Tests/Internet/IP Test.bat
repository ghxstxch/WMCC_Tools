@ECHO off
cls

@ECHO Setting working directory.
cd /d %~dp0
cls
goto :pingtest

:pingtest
ECHO Running ping test. Please check the contents of the "Results.log" file for results. 
ping 8.8.8.8 -t6000>>Results.log
goto end

:end
PAUSE



