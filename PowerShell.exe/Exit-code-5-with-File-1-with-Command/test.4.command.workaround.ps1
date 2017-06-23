
Invoke-PowerShell -NoProfile -Command '.\exit-5.ps1; exit $LastExitCode'
$LASTEXITCODE

Invoke-PowerShell -NoProfile -Command '. .\exit-5.ps1; ; exit $LastExitCode'
$LASTEXITCODE
