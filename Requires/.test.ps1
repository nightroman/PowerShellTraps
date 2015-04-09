
# Synopsis: PS 2.0 correctly fails due to a valid #requires
task requires.v2 {
	($e = PowerShell -Version 2 -NoProfile .\requires.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 1)
	assert ($e -like '*FullyQualifiedErrorId : ScriptRequiresUnmatchedPSVersion*')
}

# Synopsis: PS 2.0 ignores `42 #requires ...`
task requires-not-first.v2 {
	($r = PowerShell -Version 2 -NoProfile .\requires-not-first.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 42)
}

# Synopsis: PS 2.0 recognizes incorrect format of #requiresGarbage
task requires-with-garbage.v2 {
	($e = PowerShell -Version 2 -NoProfile .\requires-with-garbage.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 1)
	assert ($e -like '*#requires -shellid <shellID>*FullyQualifiedErrorId : CommandNotFoundException*')
}

# Synopsis: PS 2.0 ignores `<space> #requires`
task requires-with-leading-space.v2 {
	($r = PowerShell -Version 2 -NoProfile .\requires-with-leading-space.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 42)
}

# The next tasks are for v3+
if ($PSVersionTable.PSVersion.Major -le 2) {return}

# Synopsis: PS 3.0 correctly fails due to a valid #requires
task requires.v3 {
	($e = try {.\requires.ps1} catch {$_})
	assert ($e.FullyQualifiedErrorId -eq 'ScriptRequiresUnmatchedPSVersion')
}

# Synopsis: PS 3.0 treats `42 #requires ...` as #requires, unlike PS 2.0
task requires-not-first.v3 {
	($e = try {.\requires-not-first.ps1} catch {$_})
	assert ($e.FullyQualifiedErrorId -eq 'ScriptRequiresUnmatchedPSVersion')
}

# Synopsis: PS 3.0 treats `#requiresGarbage ...` as #requires, unlike PS 2.0
task requires-with-garbage.v3 {
	($e = try {.\requires-with-garbage.ps1} catch {$_})
	assert ($e.FullyQualifiedErrorId -eq 'ScriptRequiresUnmatchedPSVersion')
}

# Synopsis: PS 3.0 treats `<space> #requires` as #requires, unlike PS 2.0
task requires-with-leading-space.v3 {
	($e = try {.\requires-with-leading-space.ps1} catch {$_})
	assert ($e.FullyQualifiedErrorId -eq 'ScriptRequiresUnmatchedPSVersion')
}
