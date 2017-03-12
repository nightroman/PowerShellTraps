
# Exit code 1 on a syntax error

PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
