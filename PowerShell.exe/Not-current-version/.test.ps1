
# The current version.
$PSVersion = $PSVersionTable.PSVersion

# This test makes sense in v3+, hence the `-if`.
task Not-current-version -if ($PSVersion.Major -ge 3) {
	($r = PowerShell -Version 2 .\Not-current-version.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq $PSVersion)
	assert ($r[1] -eq '2.0')
}
