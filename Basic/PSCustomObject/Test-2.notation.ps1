
$object = [PSCustomObject]@{Name='Test'}

# v2: System.Collections.Hashtable
# v3+ PSCustomObject
$object.GetType().Name
