
task Test.1.works.in.any.host {
	($r = .\Test.1.works.in.any.host.ps1)
	assert (42 -eq $r)
}

task Test.2.works.in.ConsoleHost -If ($Host.Name -eq 'ConsoleHost') {
	($r = .\Test.2.works.in.ConsoleHost.ps1)
	assert (42 -eq $r)
}

task Test.3.fails.in.DefaultHost {
	($r = .\Test.3.fails.in.DefaultHost.ps1)
	assert ((-join $r).Contains('ObjectNotFound: (-Version:String) [], CommandNotFoundException'))
}
