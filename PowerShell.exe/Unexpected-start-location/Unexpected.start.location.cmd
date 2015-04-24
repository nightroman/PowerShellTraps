
:: Make directory "Test [2]", cd, run PowerShell Get-Location

@echo off
if "%1" == "" (
	echo Please specify PowerShell version.
	exit 1
)

echo Test2: PS starts with its location not set to "Test [2]", not OK
echo In v2 it is C:\
echo In v3 it is $PSHOME

mkdir "Test [2]"
cd "Test [2]"
PowerShell.exe -Version %1 -NoProfile Get-Location
