
$v3 = $PSVersionTable.PSVersion.Major -eq 3

task Test-1.1-EnterNestedPrompt-ignored -If $v3 {
	($r = .\Test-1.1-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}

task Test-1.2-EnterNestedPrompt-ignored -If $v3 {
	($r = .\Test-1.2-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}

task Test-3-NoExit-exit -If (!$v3) {
	($r = .\Test-3-NoExit-exit.ps1)
	assert (42 -eq $r)
}
