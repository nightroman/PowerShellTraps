
$ErrorActionPreference = 'Stop'
$v610 = $PSVersionTable.PSVersion -ge ([version]'6.0.9999')

# make directory with backticks, cd to it
$root = Split-Path $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $root
$null = mkdir '``test``'
Set-Location -LiteralPath '``test``'

# try Get-ChildItem * in the directory with backticks
try {
	# v2-v6.0.2 - fails "Cannot find path '...\`test`'
	Get-ChildItem *

	# v6.1.0 - does not fail in the empty directory, but see next
	'v6.1.0 worked'
}
catch {
	$_
}

# v6.1.0
if ($v610) {
	# make a file
	[System.IO.File]::WriteAllText((Join-Path $root '``test``/z.txt'), 'text')

	# try Get-ChildItem * again in the directory with a file
	try {
		# fails "Could not find item ...\`test`\z.txt"
		Get-ChildItem *
	}
	catch {
		$_
	}
}

# remove test directory
Set-Location ..
Remove-Item -LiteralPath '``test``' -Force -Recurse
