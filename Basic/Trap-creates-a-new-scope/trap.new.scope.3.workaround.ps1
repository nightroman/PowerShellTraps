

# flag to be tested
$data = @{success = $true}

# trap sets the flag
trap {
	$data.success = $false
	Write-Warning $_
	continue
}

# error
1/$null

# $false
$data.success
