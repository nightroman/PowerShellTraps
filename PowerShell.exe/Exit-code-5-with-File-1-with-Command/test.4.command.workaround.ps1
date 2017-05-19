
Invoke-PowerShell -NoProfile '.\exit-5.ps1; exit $LastExitCode'
$LASTEXITCODE

Invoke-PowerShell -NoProfile '. .\exit-5.ps1; ; exit $LastExitCode'
$LASTEXITCODE
