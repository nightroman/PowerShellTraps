
$v610 = $PSVersionTable.PSVersion -gt ([version]'6.0.9999')

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
	if ($v610) {
		equals $r[1].Name README.md
	}
	else {
		equals $r[1]
	}
}

task Test-3.expression.number {
	$r = .\Test-3.expression.number.ps1
	equals $r.Name README.md
}
