
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# Synopsis: Test with PowerShell 2.0 and the current.
task Test TestV2, TestV3

# Synopsis: Test with PowerShell 3.0+.
# Invoke safe with summary to allow test file failues and print them.
task TestV3 {
	Invoke-Build ** -Safe -Summary
}

# Synopsis: Test with PowerShell 2.0.
# Invoke normally, check for the exit code, and warn about a failure.
task TestV2 {
	PowerShell -Version 2 -NoProfile Invoke-Build **
	if ($LASTEXITCODE) {Write-Warning 'V2 tests failed.'}
}
