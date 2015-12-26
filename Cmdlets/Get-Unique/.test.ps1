
task case.sensitive {
	($r = .\case.sensitive.ps1)
	equals $r[0] 'apple'
	equals $r[1] 'Apple'
}

task requires.sorted.input {
	($r = .\requires.sorted.input.ps1)
	equals $r[0] 'apple'
	equals $r[1] 'banana'
	equals $r[2] 'apple'
}
