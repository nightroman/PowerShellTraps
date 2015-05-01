
# flag to be tested
$success = $true

# trap sets the flag
trap {
	Set-Variable -Name success -Value $false -Scope 1
	Write-Warning $_
	continue
}

# error
1/$null

# $false
$success
