if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}

task Test-1.not.terminating {
	($r = Invoke-PowerShell .\Test-1.not.terminating.ps1)
	equals $LASTEXITCODE 0
	equals ($r -join '|') 'before throw|after throw, may be unexpected'
}

task Test-2.terminating {
	($r = Invoke-PowerShell .\Test-2.terminating.ps1)
	equals $LASTEXITCODE 1
	equals $r[0] 'before throw'
	assert ("$r" -like '*oops, terminating*')
}

task Test-3.but {
	($r = .\Test-3.but.ps1)
	equals ($r -join '|') 'before throw|oops, may not not throw'
}
