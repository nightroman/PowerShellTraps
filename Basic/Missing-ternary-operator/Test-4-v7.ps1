
#requires -version 7.0

### Ternary operator preserves types

# deliberately not $true but equivalent
$condition = 5
$data1 = @(1)
$data2 = @(2)

$result = $condition ? $data1 : $data2
$result.GetType().FullName
$result

### Ternary operator as part of expression

$condition = $true
$data1 = 2
$data2 = 3

42 * ($condition ? $data1 : $data2)
