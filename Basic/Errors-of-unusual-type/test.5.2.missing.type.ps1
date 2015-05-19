
$ErrorActionPreference = 'Continue'
try {
	[SomeNamespace.SomeClass]::Test()
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
