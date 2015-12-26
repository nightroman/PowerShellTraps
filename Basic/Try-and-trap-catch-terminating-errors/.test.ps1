
task test.1.1.try {
	($r = .\test.1.1.try.ps1)
	equals 'This is invoked.' $r
}

task test.1.2.try {
	($r = .\test.1.2.try.ps1)
	equals 'Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' $r
}

task test.2.1.trap {
	($r = .\test.2.1.trap)
	equals 'This is invoked.' $r
}

task test.2.2.trap {
	($r = .\test.2.2.trap.ps1)
	equals 'Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' $r[0]
	equals 'This is invoked due to continue in trap.' $r[1]
}

task test.2.3.trap {
	($r = try {.\test.2.3.trap.ps1} catch {$_})
	equals 'Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' $r[0]
	equals $r[1].FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand'
}
