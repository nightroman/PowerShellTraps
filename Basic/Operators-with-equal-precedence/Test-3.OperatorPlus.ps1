
# two strings and string joined with +
$str1, $str2 = 'apple', 'banana'
$joined = $str1 + $str2

# This expression is correct because + has higher precedence than -eq.
$joined -eq $str1 + $str2

# The above expression result is Boolean.
($joined -eq $str1 + $str2).GetType().Name
