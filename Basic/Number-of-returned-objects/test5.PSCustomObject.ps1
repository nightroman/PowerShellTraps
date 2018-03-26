
$Version = $PSVersionTable.PSVersion
if ($Version -ge ([version]'3.0.0') -and $Version -lt ([version]'6.0.9999')) {
    Set-StrictMode -Off
}
else {
    Set-StrictMode -Version Latest
}

$object = [PSCustomObject]@{Name='Joe'; Age=42}

# v2: 2, $false, Hashtable
# v3+:
# - $null, $true, PSCustomObject
# - error in strict mode (v5)
# v6.1.0
# - 1, $false, PSCustomObject
# - no error in strict mode

$object.Count
$null -eq $object.Count
$object.GetType().Name
