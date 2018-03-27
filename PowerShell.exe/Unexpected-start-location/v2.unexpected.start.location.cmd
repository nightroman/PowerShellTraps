
:: Make directory "Test [2]", cd, run PowerShell Get-Location
:: PowerShell v2 starts in "C:\" instead of "...\Test [2]"

@echo off
mkdir "Test [2]"
cd "Test [2]"
powershell.exe -Version 2 -NoProfile Get-Location
