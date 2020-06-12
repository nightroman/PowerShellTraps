$ErrorView = 'NormalView'

task Test-1 {
	try {
		($r = .\Test-1.ps1)
		throw
	}
	catch {
		$err = $_
	}

	equals $r.Count 2
	equals $r[0].Name bar
	equals $r[1].Name Get-Variable
}
