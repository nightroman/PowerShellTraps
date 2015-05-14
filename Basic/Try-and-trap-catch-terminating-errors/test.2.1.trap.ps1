
$ErrorActionPreference = 'Continue'

# non-terminating error
Get-Item missing.txt

# after the error
'This is invoked.'

trap {
	'This is not invoked.'
}
