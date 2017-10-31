
$object = [PSCustomObject]@{Name='Test'}

# v2: System.Collections.Hashtable, $false
# v3+: '', $true

$object.ToString()
'' -eq $object.ToString()
