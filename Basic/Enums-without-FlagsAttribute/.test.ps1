
task Test-1-enum-works.ps1 {
	($1, $2, $3 = .\Test-1-enum-works.ps1)

	equals $1 ([DayOfWeek]::Wednesday)
	equals $2 ([DayOfWeek]::Wednesday)
	equals $3 ([DayOfWeek]::Wednesday)
}

task Test-2-enum-fails.ps1 {
	($1, $2, $3 = .\Test-2-enum-fails.ps1)

	assert ($1.StartsWith('Cannot convert value "Monday,Saturday" to type "System.DayOfWeek"'))
	assert ($2.StartsWith('Cannot convert value "Monday,Saturday" to type "System.DayOfWeek"'))
	equals ([int]$3) 7
}
