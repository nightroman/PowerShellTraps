
$object = [ConsoleColor]::Black

if ($object -eq 0) {
	'An object is equal to 0.'
}

if ($object) {
	'Evaluated to true in v2, v3, v4.'
}
else {
	'Evaluated to false in v5.'
}
