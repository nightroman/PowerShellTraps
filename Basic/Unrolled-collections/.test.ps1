
task unrolled.on.adding {
	($r = .\unrolled.on.adding.ps1)
	assert ($r[0] -eq 9)
	assert ($r[1] -eq '11|12|13|21|22|23|31|32|33')
	assert ($r[2] -eq 3)
	assert ($r[3] -eq 'System.Object[]|System.Object[]|System.Object[]')
}

task unrolled.on.output {
	($r = .\unrolled.on.output.ps1)
	assert ($r[0].Name -eq 'Object[]')
	assert ($r[1].Name -eq 'ArrayList')
}

task unrolled.on.return {
	($r = .\unrolled.on.return.ps1)
	assert ($r[0].Name -eq 'Object[]')
	assert ($r[1].Name -eq 'ArrayList')
}
