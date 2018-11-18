
if ($PSVersionTable.PSVersion.Major -lt 5) {return task test5}

task Test-1.function {
	$r = ./Test-1.function.ps1
	assert $r "this-is-connection"
}

task Test-2.method {
	$r = try { ./Test-2.method.ps1 } catch { $_ }
	assert $r.FullyQualifiedErrorId VariableNotLocal
}

task Test-3.workaround {
	$r = ./Test-3.workaround.ps1
	assert $r "this-is-connection"
}
