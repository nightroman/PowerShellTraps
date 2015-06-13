
$ErrorActionPreference = 'Continue'
try {
	$HOME = 42
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
