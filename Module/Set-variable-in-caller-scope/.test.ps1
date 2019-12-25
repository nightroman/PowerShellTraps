
task Test-1.script {
	($r = .\Test-1.script.ps1)
	equals ($r -join '|') 'myVar1=myValue1|myVar2=|myVar3=myValue3'
}

task Test-2.module {
	($r = .\Test-2.module.ps1)
	equals ($r -join '|') 'myVar1=|myVar2=myValue2|myVar3=myValue3'
}
