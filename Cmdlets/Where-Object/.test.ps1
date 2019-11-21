$ErrorView = 'NormalView' #! v7

task test1.Where-Object.bad.error.info {
	($r = try {.\test1.Where-Object.bad.error.info.ps1} catch {$_ | Out-String})
	assert ($r -like 'Get-ChildItem : Oops*At *\test1.Where-Object.bad.error.info.ps1*+ Get-ChildItem*')
}

task test2.ScriptBlock.good.error.info {
	($r = try {.\test2.ScriptBlock.good.error.info.ps1} catch {$_ | Out-String})
	assert ($r -like "*Oops*At *\Oops.ps1*+ throw *'Oops'*")
}
