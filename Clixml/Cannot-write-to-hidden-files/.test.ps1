
task Test-1-cannot-write-to-hidden {
	($r = .\Test-1-cannot-write-to-hidden.ps1)
	assert $r.FullyQualifiedErrorId.Equals('FileOpenFailure,Microsoft.PowerShell.Commands.ExportClixmlCommand')
}
