
# array of strings and string joined with '|'
$array = 'apple', 'banana'
$joined = 'apple|banana'

# This correct expression gets expected True
$joined -eq ($array -join '|')

# This expression is incorrect because -eq and -join have the same precedence
# and -eq is evaluated first. But the result False may create an illusion of
# a correct expression which just gets False in this case.
$joined -eq $array -join '|'

# The incorrect expression may even work as the expected True, so the mistake
# may be missed at this point without more thorough testing.
if ($joined -eq $array -join '|') {
	'works like expected True'
}

# It is a [string] 'False' and not empty strings are evaluated to $true.
($joined -eq $array -join '|').GetType().Name
