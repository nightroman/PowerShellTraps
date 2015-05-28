
$ErrorActionPreference = 'Continue'
try {
	Set-StrictMode -Version 2
	$Host.MissingProperty
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
