
# Empty strings work as false in Boolean expressions
$value = ''
if (!$value) {
	'value works as false'
}

# Empty strings may be cast to [bool] as false
$cast1 = [bool]$value
"cast1 is $cast1"

# But [bool]$var = '' may work or fail depending on invocation
try {
	[bool]$cast2 = $value
	"cast2 is $cast2"
}
catch {
	"$_"
}
