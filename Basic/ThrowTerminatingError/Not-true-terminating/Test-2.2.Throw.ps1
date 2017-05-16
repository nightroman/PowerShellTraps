
$ErrorActionPreference = 'Continue'

# a true terminating error
& .\Test-2.1.Throw.ps1

# this is not invoked
throw 'oops'
