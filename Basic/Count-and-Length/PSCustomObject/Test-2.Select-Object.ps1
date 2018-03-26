
#requires -Version 3

# gets some number of objects
function Get-Some($N) {
	for($i = 0; $i -lt $N; ++$i) {
		$Host
	}
}

# turn off the strict mode, otherwise cases with 1 fail
Set-StrictMode -Off

# get Count 2 and 1, expected
"Get-Some 2 : $((Get-Some 2).Count)"
"Get-Some 1 : $((Get-Some 1).Count)"

# v6.1.0 -- fixed, gets expected 1
# get Count 2 (expected) and $null/error (may be unexpected)
"Get-Some 2 | Select-Object : $((Get-Some 2 | Select-Object Name).Count)"
"Get-Some 1 | Select-Object : $((Get-Some 1 | Select-Object Name).Count)"
