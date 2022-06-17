
# the current major version
$Version = $PSVersionTable.PSVersion.Major

# ConvertTo-Json was introduced in v3, hence -If
task ConvertTo-Json.changes.data -If ($Version -ge 3) {
	($r = .\ConvertTo-Json.changes.data.ps1)

	# correct in all verstions
	equals $r[2].WithCompress '"{}"'

	# incorrect in v3
	if ($Version -eq 3) {
		assert ($r[2].WithoutCompress -ne '"{}"')
		Write-Build Red Incorrect
	}
	else {
		equals $r[2].WithoutCompress '"{}"'
		Write-Build Green Correct
	}
}
