#requires -version 3

# Input JSON is an array of three items
$json = @'
[
	{name: "a"},
	{name: "b"},
	{name: "c"}
]
'@

# The result is an array of three items
# Object[]
(ConvertFrom-Json $json).GetType().Name
# 3
(ConvertFrom-Json $json).Count

# But the result is not unrolled array, i.e. one item (which is an array of three)
# So this loop iterates through one item, Object[], not three as one may expect
# **Fixed in v7.0.0-preview.6**
foreach($item in ConvertFrom-Json $json) {
	$item.GetType().Name
}

# And this measurement counts 1
# **Fixed in v7.0.0-preview.6** (count is 3)
(ConvertFrom-Json $json | Measure-Object).Count
