
$ErrorActionPreference = 'Stop'

# terminating error
Get-Item missing.txt

# after the error
'This is invoked due to continue in trap.'

trap {
	"Caught $($_.FullyQualifiedErrorId)"
	continue
}
