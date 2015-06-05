
# Exit code 1 on a thrown error

PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Error-Throw.ps1
"Exit code: $LASTEXITCODE"
