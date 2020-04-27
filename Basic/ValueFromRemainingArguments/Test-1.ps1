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

# PS v7.1.0-preview.2: It fails with CommandArgsOnlyForSingleCmdlet.
# The behaviour is different but the reason is the same, PS treats
# the misspelled parameter name and its argument as ArgumentList.
# Instead of "invalid parameter" we get some not clear error.

Get-Command bar -ComandType Function
