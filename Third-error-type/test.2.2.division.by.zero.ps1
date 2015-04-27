
try {
	1/$null
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
