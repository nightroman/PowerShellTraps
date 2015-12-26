
# The current version.
$PSVersion = $PSVersionTable.PSVersion

# This test makes sense in v3+, hence the `-if`.
task Not-current-version -if ($PSVersion.Major -ge 3) {
	($r = PowerShell -Version 2 .\Not-current-version.ps1)
	equals $r.Count 2
	equals $r[0] "$PSVersion"
	equals $r[1] '2.0'
}
