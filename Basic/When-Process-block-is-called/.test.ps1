
task Test-1.Simple.function {
	($r = .\Test-1.Simple.function.ps1)
	equals ($r -join '|') 'begin|process|end|True|begin|end|False'
}

task Test-2.Advanced.function {
	($r = .\Test-2.Advanced.function.ps1)
	equals ($r -join '|') 'begin|process|end|True|begin|end|False'
}
