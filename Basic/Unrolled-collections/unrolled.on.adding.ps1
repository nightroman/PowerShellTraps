
# Items to be added to an array
$array1 = "11","12","13"
$array2 = "21","22","23"
$array3 = "31","32","33"

### Test 1

# Items are unrolled (i.e. it works as append, not add)
$array = @()
$array += $array1
$array += $array2
$array += $array3

# 9 items
$array.Count

# 11|12|13|21|22|23|31|32|33
$array -join '|'

### Test 2

# Items are not unrolled (i.e. it works as add)
$array = @()
$array += , $array1
$array += , $array2
$array += , $array3

# 3 items
$array.Count

# System.Object[]|System.Object[]|System.Object[]
$array -join '|'
