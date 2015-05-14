
$ErrorActionPreference = 'Stop'

try {
	# terminating error
	Get-Item missing.txt

	# after the error
	'This is not invoked.'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
