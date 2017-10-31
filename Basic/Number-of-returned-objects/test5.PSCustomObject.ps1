
$object = [PSCustomObject]@{Name='Joe'; Age=42}

# v2: 2, $false, Hashtable
# v3+: $null, $true, PSCustomObject

$object.Count
$null -eq $object.Count
$object.GetType().Name
