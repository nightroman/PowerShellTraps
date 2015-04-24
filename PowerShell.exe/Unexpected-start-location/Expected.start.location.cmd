
:: Make directory "Test 1", cd, run PowerShell Get-Location

@echo off
if "%1" == "" (
	echo Please specify PowerShell version.
	exit 1
)

echo Test1: PS starts with its location set to "Test 1", OK

mkdir "Test 1"
cd "Test 1"
PowerShell.exe -Version %1 -NoProfile Get-Location
