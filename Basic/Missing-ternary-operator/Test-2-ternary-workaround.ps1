
# deliberately not $true but equivalent
$condition = 5

$data1 = [System.Collections.ArrayList](1,2)
$data2 = [System.Collections.ArrayList](3,4)

# this workaround loses the original type
$result = if ($condition) {$data1} else {$data2}
$result.GetType().FullName
$result

# this workaround preserves the original type
$result = ($data1, $data2)[!$condition]
$result.GetType().FullName
$result
