
# WARNING: This test creates a file "0" in the current location.

# $x is 42
$x = 42

# incorrect comparison instead of $x -gt 0
if ($x > 0) {
	'This is not called'
}

# in fact, the file "0" is created with 42 in it
Get-Content 0
