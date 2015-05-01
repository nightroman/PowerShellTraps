
$v3 = $PSVersionTable.PSVersion.Major -ge 3

task count.works -if $v3 {
	($r = .\count.works.ps1)
	assert ($r -eq 1)
}

task count.fails -if $v3 {
	($r = try {.\count.fails.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
}
