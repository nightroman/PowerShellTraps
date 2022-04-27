<#
	v6.2.0-preview.4 started to use `…` instead of `...`.
#>

task Test-1-local-value-ignored {
	($r = .\Test-1-local-value-ignored.ps1)
	if ($PSVersionTable.PSVersion.Major -ge 6) {
		$r = $r -replace "`e\[[0-9;]*m"
		equals 'Data1 : {1, 2, 3, 4…}' $r.Trim()
	}
	else {
		equals 'Data1 : {1, 2, 3, 4...}' $r.Trim()
	}
}

task Test-2-global-value-works {
	($r = .\Test-2-global-value-works.ps1)
	if ($PSVersionTable.PSVersion.Major -ge 6) {
		$r = $r -replace "`e\[[0-9;]*m"
		equals 'Data1 : {1, 2, 3, 4, 5, 6, 7, 8…}' $r.Trim()
	}
	else {
		equals 'Data1 : {1, 2, 3, 4, 5, 6, 7, 8...}' $r.Trim()
	}
}
