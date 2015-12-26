
<#
.Synopsis
	Tests #requires

.Description
	PowerShell v2 and v3 treat #requires differently.

	Invoke in v3+

		Invoke-Build * .test.ps1

	Invoke in v2

		PowerShell -Version 2 -NoProfile Invoke-Build * .test.ps1
#>

# is it v3+?
$v3 = $PSVersionTable.PSVersion.Major -ge 3

# Synopsis: Correct failure due to a valid #requires
task requires {
	($e = try {.\requires.ps1} catch {$_})
	equals $e.FullyQualifiedErrorId 'ScriptRequiresUnmatchedPSVersion'
}

# Synopsis: v2 ignores `42 #requires ...`, v3 does not
task requires-not-first {
	($r = try {.\requires-not-first.ps1} catch {$_})
	if ($v3) {
		equals $r.FullyQualifiedErrorId 'ScriptRequiresUnmatchedPSVersion'
	}
	else {
		equals $r 42
	}
}

# Synopsis: v2 recognizes garbage, v3 behaves strange
task requires-with-garbage {
	($r = try {.\requires-with-garbage.ps1} catch {$_})
	if ($v3) {
		equals $r.FullyQualifiedErrorId 'ScriptRequiresUnmatchedPSVersion'
	}
	else {
		assert (($r | Out-String) -like '*#requires -version *FullyQualifiedErrorId : CommandNotFoundException*')
	}
}

# Synopsis: v2 ignores `<space> #requires`, v3 does not
task requires-with-leading-space {
	($r = try {.\requires-with-leading-space.ps1} catch {$_})
	if ($v3) {
		equals $r.FullyQualifiedErrorId 'ScriptRequiresUnmatchedPSVersion'
	}
	else {
		equals $r 42
	}
}
