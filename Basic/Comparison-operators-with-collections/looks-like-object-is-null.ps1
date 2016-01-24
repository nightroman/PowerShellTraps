
$object = @(1, $null, 2, $null)

# "not safe" comparison with $null, perhaps a mistake
if ($object -eq $null) {
	# -eq gets @($null, $null) which is evaluated to $true by if
	'This is called.'
}

# safe comparison with $null
if ($null -eq $object) {
	'This is not called.'
}
