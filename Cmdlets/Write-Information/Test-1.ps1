
function test-me {
	[CmdletBinding()]
	param()

	$items = 1, 2

	# KO, Write-Information writes nothing
	Write-Information ForEach-method
	$items.ForEach({ Write-Information "item $_"} )

	# ok
	Write-Information script-process
	$items | .{process{ Write-Information "item $_"} }

	# ok
	Write-Information ForEach-Object
	$items | ForEach-Object { Write-Information "item $_"}
}

test-me -InformationVariable iv
$iv
