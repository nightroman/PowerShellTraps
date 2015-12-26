
task Test-1-cannot-write-to-hidden {
	($r = .\Test-1-cannot-write-to-hidden.ps1)
	equals $r.FullyQualifiedErrorId 'FileOpenFailure,Microsoft.PowerShell.Commands.ExportClixmlCommand'
}
