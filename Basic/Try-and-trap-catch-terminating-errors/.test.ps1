
task test.1.1.try {
	($r = .\test.1.1.try.ps1)
	assert ('This is invoked.' -eq $r)
}

task test.1.2.try {
	($r = .\test.1.2.try.ps1)
	assert ('Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' -eq $r)
}

task test.2.1.trap {
	($r = .\test.2.1.trap)
	assert ('This is invoked.' -eq $r)
}

task test.2.2.trap {
	($r = .\test.2.2.trap.ps1)
	assert ('Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' -eq $r[0])
	assert ('This is invoked due to continue in trap.' -eq $r[1])
}

task test.2.3.trap {
	($r = try {.\test.2.3.trap.ps1} catch {$_})
	assert ('Caught PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand' -eq $r[0])
	assert ($r[1].FullyQualifiedErrorId -eq 'PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand')
}
