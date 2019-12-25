# But if Test-1.not.terminating.ps1 is called in try/catch then throw terminates.

try {
	.\Test-1.not.terminating.ps1
}
catch {
	"$_"
}
