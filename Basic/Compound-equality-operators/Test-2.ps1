
$x = 1

# v2 and v3: 2
& {
	New-Variable -Name z -Value 42
	$x += 1
	$x
}
