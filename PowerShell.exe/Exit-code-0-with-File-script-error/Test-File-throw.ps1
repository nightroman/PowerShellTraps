
# Exit code 0 on a thrown error

Invoke-PowerShell -NoProfile -File Error-Throw.ps1
"Exit code: $global:LASTEXITCODE"
