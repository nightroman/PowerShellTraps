
task test.1.file {
	($r = .\test.1.file.ps1)
	assert (5 -eq $r)
}

task test.2.command.script {
	($r = .\test.2.command.script.ps1)
	assert (1 -eq $r)
}

task test.3.command.dot-source {
	($r = .\test.3.command.dot-source.ps1)
	assert (1 -eq $r)
}

task test.4.command.workaround {
	($r = .\test.4.command.workaround.ps1)
	assert ('5|5' -eq $r -join '|')
}
