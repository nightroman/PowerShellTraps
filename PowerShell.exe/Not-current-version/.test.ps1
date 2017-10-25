
# The current version details
$PSVersion = $PSVersionTable.PSVersion
$IsV6Core = $PSVersion.Major -ge 6 -and $PSVersionTable.PSEdition -eq 'Core'
$IsV3Win = $PSVersion.Major -ge 3 -and !$IsV6Core

task Not-current-version -If $IsV3Win {
	($r = powershell.exe -Version 2 -Command .\Not-current-version.ps1)
	equals $r.Count 2
	equals $r[0] "$PSVersion"
	equals $r[1] '2.0'
}

task Not-same-exe -If $IsV6Core {
	($r = ./Not-same-exe.ps1)
	equals $r.Count 2
	# fixed in v6-beta.7
	# changed in v6-beta.9
	assert ($r[0] -ne "$PSVersion")
	equals $r[1] "$PSVersion"
}
