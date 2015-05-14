
$ErrorActionPreference = 'Continue'

try {
	# non-terminating error
	Get-Item missing.txt

	# after the error
	'This is invoked.'
}
catch {
	'This is not invoked.'
}
