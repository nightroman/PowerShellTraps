
task Test-Fails {
	($e = try {.\Test-Fails.ps1} catch {$_})
	assert ('ObjectNotFound: (Get-Something:String) [], CommandNotFoundException' -eq $e.CategoryInfo)
}

task Test-Works {
	($r = .\Test-Works.ps1)
	equals $r[0] 'Get-Something'
	equals $r[1] 'Set-Something'
}
