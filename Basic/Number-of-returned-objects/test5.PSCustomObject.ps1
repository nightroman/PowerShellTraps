
$Version = $PSVersionTable.PSVersion.Major
if ($Version -ge 3) {
	Set-StrictMode -Off
}

$object = [PSCustomObject]@{Name='Joe'; Age=42}

# v2: 2, $false, Hashtable
# v3+:
# - $null, $true, PSCustomObject
# - error in strict mode (v5)

$object.Count
$null -eq $object.Count
$object.GetType().Name
