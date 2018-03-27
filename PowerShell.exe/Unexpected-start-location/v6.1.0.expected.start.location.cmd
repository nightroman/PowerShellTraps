
:: Make directory "Test [2]", cd, run PowerShell Get-Location
:: PowerShell v6.1.0 correctly starts in "...\Test [2]"

@echo off
mkdir "Test [2]"
cd "Test [2]"
pwsh.exe -NoProfile -Command Get-Location
