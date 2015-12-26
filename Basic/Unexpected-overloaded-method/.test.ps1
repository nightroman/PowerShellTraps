
task Test-1-unexpected-method {
	($r = .\Test-1-unexpected-method.ps1)
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		equals 'Method(object, DateTime)|Method(bool, string)|Method(bool, string)' ($r -join '|')
	}
	else {
		equals 'Method(object, DateTime)|Method(bool, string)|Method(object, DateTime)' ($r -join '|')
	}
}
