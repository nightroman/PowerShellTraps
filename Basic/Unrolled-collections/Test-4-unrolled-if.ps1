
# array with an item
$list = @(42)

# Int32
$result1 = if (1) {$list}
$result1.GetType().FullName

# Object[]
$result2 = if (1) {, $list}
$result2.GetType().FullName
