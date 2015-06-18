
function Test-MyDebug {
	[CmdletBinding()]
	param(
		[Parameter(ValueFromPipeline=$true)]
		$InputObject
	)
	process {
		"Value: $_"
		Write-Debug "$_ (a): If you select 'Yes To All' it will have no effect."
		Write-Debug "$_ (b): If you select 'Yes To All' it will have no effect."
	}
}

1, 2, 3 | Test-MyDebug -Debug
