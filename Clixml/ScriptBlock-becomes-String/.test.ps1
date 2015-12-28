
task Test-1 {
	($r = .\Test-1.ps1)
	equals ($r -join '|') 'ScriptBlock|  <SBK>42</SBK>|String'
}
