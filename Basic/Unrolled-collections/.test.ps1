
task Test-1-unrolled-adding {
	($r = .\Test-1-unrolled-adding.ps1)
	equals $r[0] 9
	equals $r[1] '11|12|13|21|22|23|31|32|33'
	equals $r[2] 3
	equals $r[3] 'System.Object[]|System.Object[]|System.Object[]'
}

task Test-2-unrolled-output {
	($r = .\Test-2-unrolled-output.ps1)
	equals $r[0].Name 'Object[]'
	equals $r[1].Name 'ArrayList'
}

task Test-3-unrolled-return {
	($r = .\Test-3-unrolled-return.ps1)
	equals $r[0].Name 'Object[]'
	equals $r[1].Name 'ArrayList'
}

task Test-4-unrolled-if {
	($r = .\Test-4-unrolled-if.ps1)
	equals 'System.Int32|System.Object[]' ($r -join '|')
}
