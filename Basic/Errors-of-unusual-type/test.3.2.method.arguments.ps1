
$ErrorActionPreference = 'Continue'
try {
	'a'.ToString([object[]])
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
