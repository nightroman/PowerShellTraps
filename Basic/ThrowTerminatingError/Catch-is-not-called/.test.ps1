
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
	($r1, $r2, $err = try {./Test-2.Write-Error.ps1} catch {$_})
	equals $r1 was-caught
	equals $r2 in-finally
	equals "$err" some-error
	equals $err.FullyQualifiedErrorId 'Microsoft.PowerShell.Commands.WriteErrorException,Test-2.Write-Error.ps1'
}
