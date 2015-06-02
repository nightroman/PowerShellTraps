
task Test-1-unrolled-adding {
	($r = .\Test-1-unrolled-adding.ps1)
	assert ($r[0] -eq 9)
	assert ($r[1] -eq '11|12|13|21|22|23|31|32|33')
	assert ($r[2] -eq 3)
	assert ($r[3] -eq 'System.Object[]|System.Object[]|System.Object[]')
}

task Test-2-unrolled-output {
	($r = .\Test-2-unrolled-output.ps1)
	assert ($r[0].Name -eq 'Object[]')
	assert ($r[1].Name -eq 'ArrayList')
}

task Test-3-unrolled-return {
	($r = .\Test-3-unrolled-return.ps1)
	assert ($r[0].Name -eq 'Object[]')
	assert ($r[1].Name -eq 'ArrayList')
}

task Test-4-unrolled-if {
	($r = .\Test-4-unrolled-if.ps1)
	assert ('System.Int32|System.Object[]' -eq $r -join '|')
}
