
task Test-1.issue {
	($r = try {.\Test-1.issue.ps1} catch {$_})
	assert ($r -like 'fatal: not a git repository*')
}

task Test-2.workaround {
	$r = .\Test-2.workaround.ps1
	equals $r $true
}
