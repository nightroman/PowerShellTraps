
task Test-1-command-fails {
	($r = .\Test-1-command-fails.ps1 | Out-String)
	assert ($r -match '(?s)\.\\Script1.ps1 -Option:( <<<< )?True.*FullyQualifiedErrorId : ParameterArgumentTransformationError,Script1\.ps1')
}

task Test-2-command-works {
	($r = .\Test-2-command-works.ps1)
	assert ('Option is True|Option is False' -eq $r -join '|')
}
