
task Test-Fails {
	($e = try {.\Test-Fails.ps1} catch {$_})
	assert ('ObjectNotFound: (Get-Something:String) [], CommandNotFoundException' -eq $e.CategoryInfo)
}

task Test-Works {
	($r = .\Test-Works.ps1)
	assert ($r[0] -eq 'Get-Something')
	assert ($r[1] -eq 'Set-Something')
}
