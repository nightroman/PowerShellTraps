
# array of strings and string joined with ' '
$array = 'apple', 'banana'
$joined = 'apple banana'

# This correct expression gets expected True
$joined -eq ($array -join ' ')

# This expression is incorrect because -eq and -join have the same precedence
# and -eq is evaluated first. But the result True may create an illusion of
# a correct expression.
$joined -eq $array -join ' '

# The incorrect expression may even work as the expected True, so the mistake
# may be missed at this point without more thorough testing.
if ($joined -eq $array -join ' ') {
	'works like expected True'
}
