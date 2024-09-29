
task Test-1.magic-Where.ps1 {
	($1, $2, $3, $4, $5, $6 = ./Test-1.magic-Where.ps1)
	equals $1 'Collection`1'
	equals $2 0
	equals $3 'Collection`1'
	equals $4 1
	equals $5 'Collection`1'
	equals $6 2
}

task Test-2.Where-Object.ps1 {
	($1, $2, $3 = ./Test-2.Where-Object.ps1)
	equals $1 $true
	equals $2 String
	equals $3 Object[]
}
