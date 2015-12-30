
# allow Length
Set-StrictMode -Off

# to show and test
$data = New-Object System.Collections.Specialized.OrderedDictionary

# straightforward way (correct in v2, not in v3)
$totalLength = 0
Get-ChildItem .. -Force -Recurse | .{process{
    $totalLength += $_.Length
}}
$data.size1 = $totalLength

# correct way for v3
$totalLength = 0
Get-ChildItem .. -Force -Recurse | .{process{
	if (!$_.PSIsContainer) {
    	$totalLength += $_.Length
    }
}}
$data.size2 = $totalLength

# output
$data
