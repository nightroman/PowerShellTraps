
task test1.trap.same.scope {
	($r = .\test1.trap.same.scope.ps1)
	equals 'Caught 13|This is invoked due to continue in trap.|After Test-Trap' ($r -join '|')
}

task test2.trap.parent.scope {
	($r = .\test2.trap.parent.scope.ps1)
	equals 'Caught 13|After Test-Trap' ($r -join '|')
}
