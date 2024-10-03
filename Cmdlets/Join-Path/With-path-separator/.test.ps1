
task test {
	$1, $2 = ./Test-1.ps1
	if ($PSEdition -eq 'Desktop') {
		equals $1 C:\Test\Test\
		equals $2 Test\Test\
	}
	else {
		equals $1 C:/Test/Test/\
		equals $2 Test/Test/\
	}
}
