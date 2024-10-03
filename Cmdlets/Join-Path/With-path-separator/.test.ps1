
task test {
	$1 = ./Test-1.ps1
	if ($PSEdition -eq 'Desktop') {
		equals $1 C:\Test\Test\
	}
	else {
		equals $1 C:/Test/Test/\
	}
}
