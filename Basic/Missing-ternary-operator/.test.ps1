
$Version = $PSVersionTable.PSVersion.Major

task Test-1-ternary-workaround {
	($r = .\Test-1-ternary-workaround.ps1)
	equals 'System.Int32|1|System.Object[]|1' ($r -join '|')
}

task Test-2-ternary-workaround {
	($r = .\Test-2-ternary-workaround.ps1)
	equals 'System.Object[]|1|2|System.Collections.ArrayList|1|2' ($r -join '|')
}

task Test-3-part-of-expression {
	($r = .\Test-3-part-of-expression.ps1)
	equals '84|84' ($r -join '|')
}

task Test-4-v7 -if ($Version -ge 7) {
	($r = .\Test-4-v7.ps1)
	equals $r.Count 3
	equals $r[0] System.Object[]
	equals $r[1] 1
	equals $r[2] 84
}
