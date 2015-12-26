
# override Invoke-Build Write-Warning to avoid noise on testing
function Write-Warning([Parameter()]$Message) {
	$PSCmdlet.WriteWarning($Message)
}

task trap.new.scope.1.incorrect {
	($r = .\trap.new.scope.1.incorrect.ps1)
	equals $r[0] $true
	equals $r[1] $false
}

task trap.new.scope.2.workaround {
	($r = .\trap.new.scope.2.workaround.ps1)
	equals $r $false
}

task trap.new.scope.3.workaround.ps1 {
	($r = .\trap.new.scope.3.workaround.ps1)
	equals $r $false
}
