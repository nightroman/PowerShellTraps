
task Test-1-ternary-workaround {
	($r = .\Test-1-ternary-workaround.ps1)
	assert ('System.Int32|1|System.Object[]|1' -eq $r -join '|')
}

task Test-2-ternary-workaround {
	($r = .\Test-2-ternary-workaround.ps1)
	assert ('System.Object[]|1|2|System.Collections.ArrayList|1|2' -eq $r -join '|')
}

task Test-3-part-of-expression {
	($r = .\Test-3-part-of-expression.ps1)
	assert ('84|84' -eq $r -join '|')
}
