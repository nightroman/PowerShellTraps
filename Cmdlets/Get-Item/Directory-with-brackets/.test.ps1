
task Current.directory.with.odd.name {
	($r = .\Current.directory.with.odd.name.ps1)

	# test 1
	assert ($r.Location1.EndsWith('\`[1]'))
	equals $r.GetChildItem1.Name 'test'
	equals $r.GetItemNormal1.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetItemCommand'
	equals $r.GetItemLiteral1.FullyQualifiedErrorId 'ItemNotFound,Microsoft.PowerShell.Commands.GetItemCommand'

	# test 2
	assert ($r.Location2.EndsWith('\[1]'))
	equals $r.GetChildItem2.Name 'test'
	equals $r.GetItemNormal2.Name 'test'
	equals $r.GetItemLiteral2.FullyQualifiedErrorId 'ItemNotFound,Microsoft.PowerShell.Commands.GetItemCommand'

	Set-Location $BuildRoot
	Remove-Item -LiteralPath '`[1]', '[1]' -Force -Recurse
}
