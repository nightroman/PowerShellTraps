
function Get-Something {
	# new list
	$list = [System.Collections.ArrayList]@()

	# add items with unexpected output
	$list.Add('Hello')
	$list.Add('World')

	# return items
	$list
}

# 0, 1, Hello, World
Get-Something
