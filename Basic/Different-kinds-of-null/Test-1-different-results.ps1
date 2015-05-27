
### Test with nothing null

# the command gets nothing, is $it1 null or what?
$it1 = 1..5 | Where-Object {$_ -gt 6}

# this gets $true, so $it1 looks like null
$null -eq $it1

# this gets 0 with $it1 (in v3+)
$list1 = @($it1)
$list1.Length

### Test with true null

# $it2 really is null
$it2 = $null

# this gets 1 with $it2, not 0 as with $it1
$list2 = @($it2)
$list2.Length
