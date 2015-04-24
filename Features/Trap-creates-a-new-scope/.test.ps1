
# override Invoke-Build Write-Warning to avoid noise on testing
function Write-Warning([Parameter()]$Message) {
	$PSCmdlet.WriteWarning($Message)
}

task trap.new.scope.1.incorrect {
	($r = .\trap.new.scope.1.incorrect.ps1)
	assert ($r[0] -eq $true)
	assert ($r[1] -eq $false)
}

task trap.new.scope.2.workaround {
	($r = .\trap.new.scope.2.workaround.ps1)
	assert ($r -eq $false)
}

task trap.new.scope.3.workaround.ps1 {
	($r = .\trap.new.scope.3.workaround.ps1)
	assert ($r -eq $false)
}
