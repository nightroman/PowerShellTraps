
# Exit code 0 on a thrown error

PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File Error-Throw.ps1
"Exit code: $global:LASTEXITCODE"
