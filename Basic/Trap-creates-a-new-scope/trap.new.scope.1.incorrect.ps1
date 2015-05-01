
# flag to be tested
$success = $true

# trap sets the flag
trap {
	$success = $false
	Write-Warning $_
	continue
}

# error
1/$null

# $true, "unexpected"
$success

# catch sets the flag
try {
	# error
	1/$null
}
catch {
	$success = $false
	Write-Warning $_
}

# $false, expected
$success
