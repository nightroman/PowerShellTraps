
function Test-MyDebug {
	[CmdletBinding()]
	param()
	foreach($_ in 1, 2, 3) {
		"Value: $_"
		$PSCmdlet.WriteDebug("$_ (a): If you select 'Yes To All' it will have no effect.")
		$PSCmdlet.WriteDebug("$_ (b): If you select 'Yes To All' it will have no effect.")
	}
}

Test-MyDebug -Debug
