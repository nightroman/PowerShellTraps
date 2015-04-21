
task case.sensitive {
	($r = .\case.sensitive.ps1)
	assert ($r[0] -ceq 'apple')
	assert ($r[1] -ceq 'Apple')
}

task requires.sorted.input {
	($r = .\requires.sorted.input.ps1)
	assert ($r[0] -ceq 'apple')
	assert ($r[1] -ceq 'banana')
	assert ($r[2] -ceq 'apple')
}
