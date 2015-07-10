
# deliberately not $true but equivalent
$condition = 5

$data1 = @(1)
$data2 = @(2)

# this workaround loses the original type
$result = if ($condition) {$data1} else {$data2}
$result.GetType().FullName
$result

# this workaround preserves the original type
$result = ($data1, $data2)[!$condition]
$result.GetType().FullName
$result
