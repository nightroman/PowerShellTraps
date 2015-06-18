
function Test-MyDebug {
	[CmdletBinding()]
	param()
	foreach($_ in 1, 2, 3) {
		"Value: $_"
		Write-Debug "$_ (a): If you select 'Yes To All' it will have no effect."
		Write-Debug "$_ (b): If you select 'Yes To All' it will have no effect."
	}
}

Test-MyDebug -Debug
