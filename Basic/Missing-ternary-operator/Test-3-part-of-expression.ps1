
$condition = $true
$data1 = 2
$data2 = 3

# the workaround 1 requires $()
42 * $(if ($condition) {$data1} else {$data2})

# the workaround 2 is used as is
42 * ($data1, $data2)[!$condition]
