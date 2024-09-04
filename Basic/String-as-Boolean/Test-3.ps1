
# Not empty strings work as true in Boolean expressions
$value = 'False'
if ($value) {
	'value works as true'
}

# Not empty strings may be cast to [bool] as true
$cast1 = [bool]$value
"cast1 is $cast1"

# But [bool]$var = ... may work or fail depending on invocation
try {
	[bool]$cast2 = $value
	"cast2 is $cast2"
}
catch {
	"$_"
}
