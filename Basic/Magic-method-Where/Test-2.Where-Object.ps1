$items = 'apple', 'banana', 'orange'

# Nothing, kind of null
$r = $items | Where-Object {$_ -like 'foo*'}
$null -eq $r

# String
$r = $items | Where-Object {$_ -like 'ban*'}
$r.GetType().Name

# Array
$r = $items | Where-Object {$_ -like '*an*'}
$r.GetType().Name
