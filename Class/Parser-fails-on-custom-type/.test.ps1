
if ($PSVersionTable.PSVersion.Major -lt 5) {return task test5}

task Test-1.parser.fails {
	($r = try {.\Test-1.parser.fails.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId TypeNotFound
	assert ($r.InvocationInfo.PositionMessage -like '*_160205_162916*')
}

task Test-2.1.workaround {
	($r = .\Test-2.1.workaround.ps1)
	equals $r _160205_162916
}

task Test-2.2.workaround {
	($r = .\Test-2.2.workaround.ps1)
	equals $r _160205_162916
}

task Test-2.3.workaround {
	($r = .\Test-2.3.workaround.ps1)
	equals $r _160205_162916
}
