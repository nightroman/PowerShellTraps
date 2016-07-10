
# A function `bar`
function bar {}

# An alias `bar`
Set-Alias bar Get-Variable

# Gets the function, as expected
Get-Command bar -CommandType Function

# The same command with a typo in CommandType. It is not a syntax error because
# due to ValueFromRemainingArguments all unknown arguments go to ArgumentList.
# In this case by chance yet another command `bar` is found, so the incorrect
# command does not even write an error. But it gets the wrong result.
Get-Command bar -ComandType Function
