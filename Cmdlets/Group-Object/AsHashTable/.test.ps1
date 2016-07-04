
task Test-1.property.string {
	$r = .\Test-1.property.string.ps1
	equals $r.Count 2
	equals $r[0] 2
	equals $r[1].Name README.md
}

task Test-2.expression.string {
	$r = .\Test-2.expression.string.ps1
	equals $r.Count 2
	equals $r[0] 2
	equals $r[1]
}

task Test-3.expression.number {
	$r = .\Test-3.expression.number.ps1
	equals $r.Name README.md
}
