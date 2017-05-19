
# Exit code 0 on a syntax error

Invoke-PowerShell -NoProfile -File Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
