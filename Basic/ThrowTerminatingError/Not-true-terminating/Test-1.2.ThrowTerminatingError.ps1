
$ErrorActionPreference = 'Continue'

# one may expect a terminating error
& .\Test-1.1.ThrowTerminatingError.ps1 -ErrorAction Stop

# but this is invoked
'Invoked!!!'
