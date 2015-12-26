
task Test-MyScript {
	($r = .\Test-MyScript.ps1)
	equals $r[0] 'Internal function MyCommand'
	equals $r[1] 'Outer function Test-OuterFunction'
}
