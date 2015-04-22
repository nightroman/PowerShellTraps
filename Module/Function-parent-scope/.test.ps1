
task Test-Module1 {
	# use try because `Get-Variable Variable1` fails
	($r = try {.\Test-Module1.ps1} catch {$_})

	# error caught on `Get-Variable Variable1`
	assert ($r.FullyQualifiedErrorId -eq 'VariableNotFound,Microsoft.PowerShell.Commands.GetVariableCommand')
}

task Test-Script1 {
	# invoke normally, it does not fail
	($r = .\Test-Script1.ps1)

	# variable from `Get-Variable Variable1`
	assert ($r.Value -eq 'Value1')
}
