
$ErrorActionPreference = 'Continue'
try {
	Get-ChildItem env: -Filter *user*
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
