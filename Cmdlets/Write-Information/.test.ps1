
task Test-1 {
	($r = .\Test-1.ps1)
	equals ($r -join '|') 'ForEach-method|script-process|item 1|item 2|ForEach-Object|item 1|item 2'
}
