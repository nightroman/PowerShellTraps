
$v2 = $PSVersionTable.PSVersion.Major -eq 2
$v3 = $PSVersionTable.PSVersion.Major -eq 3

# Synopsis: Unexpected behaviour in v3.
# In v2 and v4 the nested prompt is entered.
# This is not tested because user interaction is involved.
task Test-1.1-EnterNestedPrompt-ignored -If $v3 {
	($r = .\Test-1.1-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}

# Synopsis: Unexpected behaviour in v3.
# In v2 and v4 the nested prompt is entered.
# This is not tested because user interaction is involved.
task Test-1.2-EnterNestedPrompt-ignored -If $v3 {
	($r = .\Test-1.2-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}

# Synopsis: Expected behaviour in v2.
# In v3 and v4 the test is not exiting as expected.
# This is not tested because user interaction is involved.
task Test-3-NoExit-exit -If $v2 {
	($r = .\Test-3-NoExit-exit.ps1)
	assert (42 -eq $r)
}
