$items = 'apple', 'banana', 'orange'

# Empty collection
$r = $items.Where({$_ -like 'foo*'})
$r.GetType().Name
$r.Count

# Collection of 1 item
$r = $items.Where({$_ -like 'ban*'})
$r.GetType().Name
$r.Count

# Collection of 2 items
$r = $items.Where({$_ -like '*an*'})
$r.GetType().Name
$r.Count
