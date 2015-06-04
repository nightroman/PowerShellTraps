
$ErrorActionPreference = 'Continue'
try {
	Set-StrictMode -Version 2
	$MissingVariable
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
