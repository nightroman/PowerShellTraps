
$ErrorActionPreference = 'Stop'

# terminating error
Get-Item missing.txt

# after the error
'This is not invoked.'

trap {
	"Caught $($_.FullyQualifiedErrorId)"
	break
}
