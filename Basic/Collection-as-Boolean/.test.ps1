
task Test-1-expected {
	$1, $2, $3, $4 = & ./Test-1-expected.ps1
	equals $1 $true
	equals $2 $true
	equals $3 $true
	equals $4 $true
}

task Test-2-may-be-unexpected {
	$1, $2, $3, $4 = & ./Test-2-may-be-unexpected.ps1
	equals $1 $false
	equals $2 $false
	equals $3 $false
	equals $4 $false
}
