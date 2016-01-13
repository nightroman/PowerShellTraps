
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Simple.function {
	($r = .\Test-1.Simple.function.ps1)
	equals ($r -join '|') 'begin|process|end|True|begin|end|False'
}

task Test-2.Advanced.function {
	($r = .\Test-2.Advanced.function.ps1)
	equals ($r -join '|') 'begin|process|end|True|begin|end|False'
}

task Test-3.Pipe.nothing {
	($r = .\Test-3.Pipe.nothing.ps1)
	if ($Version -eq 2) {
		equals ($r -join '|') 'begin|end|False|begin|process|end|True'
	}
	else {
		equals ($r -join '|') 'begin|end|False|begin|end|False'
	}
}
