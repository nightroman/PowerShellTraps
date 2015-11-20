
task Current.directory.with.odd.name {
	($r = .\Current.directory.with.odd.name.ps1)

	# test 1
	assert ($r.Location1.EndsWith('\`[1]'))
	assert ($r.GetChildItem1.Name -eq 'test')
	assert ($r.GetItemNormal1.FullyQualifiedErrorId -eq 'PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand')
	assert ($r.GetItemLiteral1.FullyQualifiedErrorId -eq 'ItemNotFound,Microsoft.PowerShell.Commands.GetItemCommand')

	# test 2
	assert ($r.Location2.EndsWith('\[1]'))
	assert ($r.GetChildItem2.Name -eq 'test')
	assert ($r.GetItemNormal2.Name -eq 'test')
	assert ($r.GetItemLiteral2.FullyQualifiedErrorId -eq 'ItemNotFound,Microsoft.PowerShell.Commands.GetItemCommand')

	Set-Location $BuildRoot
	Remove-Item -LiteralPath '`[1]', '[1]' -Force -Recurse
}
