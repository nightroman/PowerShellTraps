
task Test-1.ps1 {
	$1, $2, $3, $4 = ./Test-1.ps1

	if ($PSEdition -eq 'Core') {
		equals $1 Int64
		equals $2 Int64
		equals $3 Double
	}
	else {
		equals $1 Int32
		equals $2 Int32
		equals $3 Decimal
	}

	equals $4 Int64
}
