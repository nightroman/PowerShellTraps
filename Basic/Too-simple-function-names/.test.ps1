
task Test-MyScript {
	($r = .\Test-MyScript.ps1)
	assert ($r[0] -eq 'Internal function MyCommand')
	assert ($r[1] -eq 'Outer function Test-OuterFunction')
}
