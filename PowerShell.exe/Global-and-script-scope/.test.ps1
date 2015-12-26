
task Test-1-Command-normal {
	($r = .\Test-1-Command-normal.ps1)
	equals $null $r
}

task Test-2-Command-global {
	($r = .\Test-2-Command-global.ps1)
	equals 'MyScriptAlias|MyScriptVariable' ($r -join '|')
}

task Test-3-File-global {
	($r = .\Test-3-File-global.ps1)
	equals 'MyScriptAlias|MyScriptVariable' ($r -join '|')
}
