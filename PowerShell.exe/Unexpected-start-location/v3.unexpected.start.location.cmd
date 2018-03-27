
:: Make directory "Test [2]", cd, run PowerShell Get-Location
:: PowerShell v3-v6.0.2 starts in $PSHOME instead of "...\Test [2]"

@echo off
mkdir "Test [2]"
cd "Test [2]"
powershell.exe -NoProfile -Command Get-Location
