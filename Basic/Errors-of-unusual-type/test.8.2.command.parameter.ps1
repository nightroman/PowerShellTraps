
$ErrorActionPreference = 'Continue'
try {
	Copy-Item Source Target -Recurce
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
