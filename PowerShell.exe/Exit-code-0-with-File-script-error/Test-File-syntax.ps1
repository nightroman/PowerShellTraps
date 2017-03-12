
# Exit code 0 on a syntax error

PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File Error-Syntax.ps1
"Exit code: $global:LASTEXITCODE"
