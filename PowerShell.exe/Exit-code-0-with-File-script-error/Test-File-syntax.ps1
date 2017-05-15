
# Exit code 0 on a syntax error

. ../../Tools.ps1
Invoke-PowerShell -File Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
