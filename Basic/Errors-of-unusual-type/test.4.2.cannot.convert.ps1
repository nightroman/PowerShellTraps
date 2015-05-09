
$ErrorActionPreference = 'Continue'
try {
	[System.Collections.Generic.List[string]]@(1, 2)
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
