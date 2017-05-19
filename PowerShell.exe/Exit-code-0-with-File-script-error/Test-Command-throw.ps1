
# Exit code 1 on a thrown error

Invoke-PowerShell -NoProfile -Command .\Error-Throw.ps1
"Exit code: $global:LASTEXITCODE"
