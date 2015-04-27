
try {
	'a'.Split([object[]])
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
