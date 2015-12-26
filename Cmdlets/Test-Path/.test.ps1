
task Current.directory.with.odd.name {
	($r = .\Current.directory.with.odd.name.ps1)

	# test 1
	assert ($r.Location1.EndsWith('\`[1]'))
	equals $r.GetChildItem1.Name 'test'
	equals $r.TestPathNormal1 $false
	equals $r.TestPathLiteral1 $false

	# test 2
	assert ($r.Location2.EndsWith('\[1]'))
	equals $r.GetChildItem2.Name 'test'
	equals $r.TestPathNormal2 $true
	equals $r.TestPathLiteral2 $false

	Set-Location $BuildRoot
	Remove-Item -LiteralPath '`[1]', '[1]' -Force -Recurse
}
