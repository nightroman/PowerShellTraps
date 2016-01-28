
#requires -version 5

trap {
	$_
	continue
}

& $PSScriptRoot\Test-2.existing.item.ps1
