
#requires -version 3

# Input JSON is an array of three items
$json = @'
[
	{name: "a"},
	{name: "b"},
	{name: "c"}
]
'@

# The workaround: Use parenthesis enclosing ConvertFrom-Json command

# 3 items
foreach($item in (ConvertFrom-Json $json)) {
	$item.GetType().Name
}

# 3 items
((ConvertFrom-Json $json) | Measure-Object).Count
