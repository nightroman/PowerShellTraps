
# Exit code 0 on a thrown error

. ../../Tools.ps1
Invoke-PowerShell -File Error-Throw.ps1
"Exit code: $global:LASTEXITCODE"
