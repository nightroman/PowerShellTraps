if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}
$ErrorView = 'NormalView' #! v7

task Test-1.2.ThrowTerminatingError {
	($r = Invoke-PowerShell -NoProfile -Command '$ErrorView = ''NormalView''; .\Test-1.2.ThrowTerminatingError.ps1')
	assert (($r | Out-String) -clike '*invalid-input*\Test-1.2.ThrowTerminatingError.ps1:5 *Invoked!!!*')
}

task Test-2.2.Throw {
	($r = try {.\Test-2.2.Throw.ps1} catch {$_})
	assert (($r | Out-String) -clike "*invalid-input*\Test-2.1.Throw.ps1:5 *")
}

task Test-3.2.Write-Error {
	($r = try {.\Test-3.2.Write-Error.ps1} catch {$_})
	assert (($r | Out-String) -clike "*invalid-input*\Test-3.2.Write-Error.ps1:5 *")
}
