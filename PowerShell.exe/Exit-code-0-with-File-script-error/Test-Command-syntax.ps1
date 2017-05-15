
# Exit code 1 on a syntax error

. ../../Tools.ps1
Invoke-PowerShell -Command .\Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
