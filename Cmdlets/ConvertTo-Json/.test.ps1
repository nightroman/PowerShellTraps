
# https://connect.microsoft.com/PowerShell/Feedback/Details/1221685

# the current major version
$Version = $PSVersionTable.PSVersion.Major

# ConvertTo-Json was introduced in v3, hence -If
task ConvertTo-Json.changes.data -If ($Version -ge 3) {
	($r = .\ConvertTo-Json.changes.data.ps1)

	# correct in all verstions
	assert ($r[2].WithCompress -eq '"{}"')

	# incorrect in v3
	if ($Version -eq 3) {
		assert ($r[2].WithoutCompress -ne '"{}"')
		Write-Build Red Incorrect
	}
	else {
		assert ($r[2].WithoutCompress -eq '"{}"')
		Write-Build Green Correct
	}
}
