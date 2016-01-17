
#requires -version 3

# Input JSON is an array of three items
$json = @'
[
	{name: "a"},
	{name: "b"},
	{name: "c"}
]
'@

# The workaround: Cache ConvertFrom-Json result in a variable
$result = ConvertFrom-Json $json

# 3 items
foreach($item in $result) {
	$item.GetType().Name
}

# 3 items
($result | Measure-Object).Count
