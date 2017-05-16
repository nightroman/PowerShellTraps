
$ErrorActionPreference = 'Continue'

# a true terminating error
& .\Test-3.1.Write-Error.ps1

# this is not invoked
throw 'oops'
