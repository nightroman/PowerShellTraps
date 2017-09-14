
$Version = $PSVersionTable.PSVersion.Major

task Test.1.works.in.any.host {
	($r = .\Test.1.works.in.any.host.ps1)
	equals 42 $r
}

task Test.2.works.in.ConsoleHost -If ($Host.Name -eq 'ConsoleHost') {
	($r = .\Test.2.works.in.ConsoleHost.ps1)
	# changed v6-beta.7
	if ($Version -ge 6) {
		assert ($r -like 'powershell v*')
	}
	else {
		equals 42 $r
	}
}

task Test.3.fails.in.DefaultHost {
	($r = .\Test.3.fails.in.DefaultHost.ps1)
	# changed v6-beta.7
	if ($Version -ge 6) {
		assert ($r -like 'powershell v*')
	}
	else {
		assert ((-join $r).Contains('ObjectNotFound: (-Version:String) [], CommandNotFoundException'))
	}
}

task Test.4.fails.in.PowerShell.job {
	($r = try {.\Test.4.fails.in.PowerShell.job.ps1} catch {$_})
	# changed v6-beta.7
	if ($Version -ge 6) {
		assert ($r -like 'powershell v*')
	}
	else {
		equals $r.FullyQualifiedErrorId 'NativeCommandError'
	}
}
