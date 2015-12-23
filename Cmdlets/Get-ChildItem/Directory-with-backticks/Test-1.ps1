
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Path)

# make directory with backticks and cd to it
$null = mkdir '``test``'
Set-Location -LiteralPath '``test``'

try {
	# it fails "Cannot find path '...\`test`'
	Get-ChildItem *
}
catch {
	$_
}

# remove test directory
Set-Location ..
Remove-Item -LiteralPath '``test``'
