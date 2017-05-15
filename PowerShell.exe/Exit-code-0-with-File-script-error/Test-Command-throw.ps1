
# Exit code 1 on a thrown error

. ../../Tools.ps1
Invoke-PowerShell -Command .\Error-Throw.ps1
"Exit code: $global:LASTEXITCODE"
