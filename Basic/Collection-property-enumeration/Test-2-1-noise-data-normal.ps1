
Set-StrictMode -Off

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

# v2: False
# v3: True, i.e. traditional comparison does not reveal the noise
$result.Name -eq 'Name1'

# v2: False
# v3: True, i.e. and reversed comparison does not reveal the noise
'Name1' -eq $result.Name
