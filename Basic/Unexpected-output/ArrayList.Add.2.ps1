
function Get-Something {
	# new list
	$list = [System.Collections.ArrayList]@()

	# add items, discard output
	$null = $list.Add('Hello')
	$null = $list.Add('World')

	# return items
	$list
}

# Hello, World
Get-Something
