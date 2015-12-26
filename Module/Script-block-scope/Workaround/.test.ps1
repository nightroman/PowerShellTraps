
task Workaround {
	($r = .\Test-Module2.ps1)
	equals $r 'Local message: New custom message.'
}
