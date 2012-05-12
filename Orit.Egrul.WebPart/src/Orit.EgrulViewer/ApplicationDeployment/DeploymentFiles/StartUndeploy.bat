@echo off

set verbosity=normal
set target=Undeploy
set logfile=Deployment.log

IF EXIST C:\Windows\Microsoft.NET\Framework64\v2.0.50727\MSBuild.exe GOTO INSTALL64

:INSTALL32
ECHO Installing with 32bit msbuild process
set msbuildversion=C:\Windows\Microsoft.NET\Framework\v2.0.50727\MSBuild.exe

GOTO START

:INSTALL64
ECHO Installing with 64bit msbuild process
set msbuildversion=C:\Windows\Microsoft.NET\Framework64\v2.0.50727\MSBuild.exe

:START
%msbuildversion% Deployment.msbuild /target:%target% /noconsolelogger /logger:UILogger,MSBuild/SPALM.MSBuildTasks.dll /logger:ULSFormatLogger,MSBuild/SPALM.MSBuildTasks.dll;logfile=%logfile%;Verbosity=%verbosity% /nologo /verbosity:%verbosity%

:: We close the cmd window automatically because of SPALM Automated Staging
:: remove the lines and use the following to leave the window open
:: pause >nul

ping localhost -n 11 >nul
exit 0
