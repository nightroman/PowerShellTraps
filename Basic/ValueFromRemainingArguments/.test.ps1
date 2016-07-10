
task Test-1 {
	($r = .\Test-1.ps1)
	equals $r.Count 2
	equals $r[0].Name bar
	equals $r[1].Name Get-Variable
}
