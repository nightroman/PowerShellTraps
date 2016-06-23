
# This Module3 function calls a function from Module2.
# Module2 is supposed to be imported by a caller.

function Set-Something {
	Get-Something
	'Set-Something'
}
