if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}

$Major = $PSVersionTable.PSVersion.Major
if ($Major -ge 6) {return task SKIP_CORE}

$NET_20 = Test-Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v2.0.50727'

task Test.1.works.in.any.host {
	($r = .\Test.1.works.in.any.host.ps1)
	equals 42 $r
}

task Test.2.works.in.ConsoleHost -If ($NET_20 -and $Host.Name -eq 'ConsoleHost') {
	($r = .\Test.2.works.in.ConsoleHost.ps1)
	equals 42 $r
}

task Test.3.fails.in.DefaultHost -If ($NET_20) {
	($r = .\Test.3.fails.in.DefaultHost.ps1)
	assert ((-join $r).Contains('ObjectNotFound: (-Version:String) [], CommandNotFoundException'))
}

task Test.4.fails.in.PowerShell.job {
	($r = try {.\Test.4.fails.in.PowerShell.job.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NativeCommandError'
}
