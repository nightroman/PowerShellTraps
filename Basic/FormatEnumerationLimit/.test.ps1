<#
	v6.2.0-preview.4 started to use `…` instead of `...`.
#>

$Version = $PSVersionTable.PSVersion.Major

task Test-1-local-value-ignored {
	if ($Version -ge 6) {
		$PSStyle.OutputRendering = 'PlainText'
		($r = .\Test-1-local-value-ignored.ps1)
		equals 'Data1 : {1, 2, 3, 4…}' $r.Trim()
	}
	else {
		($r = .\Test-1-local-value-ignored.ps1)
		equals 'Data1 : {1, 2, 3, 4...}' $r.Trim()
	}
}

task Test-2-global-value-works {
	($r = .\Test-2-global-value-works.ps1)
	if ($Version -ge 6) {
		equals 'Data1 : {1, 2, 3, 4, 5, 6, 7, 8…}' $r.Trim()
	}
	else {
		equals 'Data1 : {1, 2, 3, 4, 5, 6, 7, 8...}' $r.Trim()
	}
}
