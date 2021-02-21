if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}

$Version = $PSVersionTable.PSVersion.Major
if ($Version -ge 6 -and $PSVersionTable.PSEdition -eq 'Core') {return task v6Core}

task Test-1-command-fails {
	($r = .\Test-1-command-fails.ps1 | Out-String)
	assert ($r -match '(?s)\.\\Script1.ps1 -Option:( <<<< )?True.*FullyQualifiedErrorId : ParameterArgumentTransformationError,Script1\.ps1')
}

task Test-2-command-works {
	($r = .\Test-2-command-works.ps1)
	equals 'Option is True|Option is False' ($r -join '|')
}
