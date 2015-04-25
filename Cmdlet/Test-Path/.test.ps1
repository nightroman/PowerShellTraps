
Set-StrictMode -Version 2

task Current.directory.with.odd.name {
	($r = .\Current.directory.with.odd.name.ps1)

	# test 1
	assert ($r.Location1.EndsWith('\`[1]'))
	assert ($r.GetChildItem1.Name -eq 'test')
	assert ($r.TestPathNormal1 -eq $false)
	assert ($r.TestPathLiteral1 -eq $false)

	# test 2
	assert ($r.Location2.EndsWith('\[1]'))
	assert ($r.GetChildItem2.Name -eq 'test')
	assert ($r.TestPathNormal2 -eq $true)
	assert ($r.TestPathLiteral2 -eq $false)

	Set-Location $BuildRoot
	Remove-Item -LiteralPath '`[1]', '[1]' -Force -Recurse
}
