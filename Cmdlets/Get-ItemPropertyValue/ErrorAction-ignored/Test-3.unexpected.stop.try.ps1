
#requires -version 5

try {
	& $PSScriptRoot\Test-2.existing.item.ps1
}
catch {
	$_
}
