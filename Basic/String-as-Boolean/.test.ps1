
task Test-2.ps1 {
	($1, $2, $3, $4, $5, $6 = .\Test-2.ps1)
	equals $1 'Operator & works'
	equals $2 'Dot-sourcing with | Out-Null works'
	equals $3 'Dot-sourcing with > $null works'
	equals $4 'value works as false'
	equals $5 'cast1 is False'
	assert ($6 -like 'Cannot convert value "System.String" to type "System.Boolean".*')
}

task Test-4.ps1 {
	($1, $2, $3, $4, $5, $6 = .\Test-4.ps1)
	equals $1 'Operator & works'
	equals $2 'Dot-sourcing with | Out-Null works'
	equals $3 'Dot-sourcing with > $null works'
	equals $4 'value works as true'
	equals $5 'cast1 is True'
	assert ($6 -like 'Cannot convert value "System.String" to type "System.Boolean".*')
}
