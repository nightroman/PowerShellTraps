
Set-StrictMode -Version 2

# This function is supposed to get a single object.
# "By mistake" it also outputs some unexpected data.
function Get-It {
	# some unexpected noise data
	'bar', 42

	# this is the expected data
	@{Name = 'Name1'}
}

# Get the object
$result = Get-It

# Fails in v2 and v3 in the strict mode
$result.Name
