
$x = 1

# 2 in v2
# 2 in v3+, expected 1 as in Test-1.1.ps1
& {
	New-Variable -Name z -Value 42
	$x += 1
	$x
}
