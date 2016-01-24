
$object = 1, 2

if ($object -eq 1) {
	# -eq gets 1, it is evaluated to true by if
	'This is called.'
}

if ($object -ne 1) {
	# -ne gets 2, it is evaluated to true by if
	'This is also called.'
}
