
. ../../Tools.ps1

Invoke-PowerShell '.\exit-5.ps1; exit $LastExitCode'
$LASTEXITCODE

Invoke-PowerShell '. .\exit-5.ps1; ; exit $LastExitCode'
$LASTEXITCODE
