
task Test-1-unexpected-method {
	($r = .\Test-1-unexpected-method.ps1)
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		assert ('Method(object, DateTime)|Method(bool, string)|Method(bool, string)' -eq $r -join '|')
	}
	else {
		assert ('Method(object, DateTime)|Method(bool, string)|Method(object, DateTime)' -eq $r -join '|')
	}
}
