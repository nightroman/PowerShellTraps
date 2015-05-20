
# $x is 1
$x = 1

# incorrect comparison instead of $x -eq 42
if ($x = 42) {
	'This is called'
}

# in fact, $x is set to 42
$x
