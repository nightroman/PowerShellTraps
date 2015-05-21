
PowerShell.exe -Version $PSVersionTable.PSVersion -NoProfile '.\exit-5.ps1; exit $LastExitCode'
$LASTEXITCODE

PowerShell.exe -Version $PSVersionTable.PSVersion -NoProfile '. .\exit-5.ps1; ; exit $LastExitCode'
$LASTEXITCODE
