
$ErrorActionPreference = 'Continue'
try {
	[DateTime]'invalid'
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
