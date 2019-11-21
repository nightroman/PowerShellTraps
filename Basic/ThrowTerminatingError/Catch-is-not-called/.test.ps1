
$Version = $PSVersionTable.PSVersion.Major
$ErrorView = 'NormalView' #! v7

task Test-1.ThrowTerminatingError {
	($r = try {./Test-1.ThrowTerminatingError.ps1} catch {$_})
	if ($Version -eq 2) {
		assert (($r | Out-String) -like 'was-caught*in-finally*some-error*FullyQualifiedErrorId : Test-1.ThrowTerminatingError.ps1*')
	}
	else {
		assert (($r | Out-String) -like 'not-caught*in-finally*some-error*FullyQualifiedErrorId : Test-1.ThrowTerminatingError.ps1*')
	}
}

task Test-2.Write-Error {
	($r = try {./Test-2.Write-Error.ps1} catch {$_})
	assert (($r | Out-String) -like 'was-caught*in-finally*some-error*FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,*')
}
