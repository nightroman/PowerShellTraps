
task Test-1-Command-no-conflicts {
	($r = .\Test-1-Command-no-conflicts.ps1)
	assert ('module function MyCommand|module function MyCommand' -eq $r -join '|')
}

task Test-2-Command-conflicts {
	($r = .\Test-2-Command-conflicts.ps1)
	assert ('module function MyCommand|script function Test-ScriptFunction' -eq $r -join '|')
}

task Test-3-File-conflicts {
	($r = .\Test-3-File-conflicts.ps1)
	assert ('module function MyCommand|script function Test-ScriptFunction' -eq $r -join '|')
}
