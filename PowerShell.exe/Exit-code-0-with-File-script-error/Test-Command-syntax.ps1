
# Exit code 1 on a syntax error

Invoke-PowerShell -NoProfile -Command .\Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
