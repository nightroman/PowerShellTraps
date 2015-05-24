
if ($PSVersionTable.PSVersion.Major -ne 3) {return task SkipNotV3}

task Test-1.1-EnterNestedPrompt-ignored {
	($r = .\Test-1.1-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}

task Test-1.2-EnterNestedPrompt-ignored {
	($r = .\Test-1.2-EnterNestedPrompt-ignored.ps1)
	assert ('Before nested prompt|After nested prompt' -eq $r -join '|')
}
