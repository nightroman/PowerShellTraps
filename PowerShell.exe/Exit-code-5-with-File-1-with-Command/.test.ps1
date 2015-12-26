
task test.1.file {
	($r = .\test.1.file.ps1)
	equals 5 $r
}

task test.2.command.script {
	($r = .\test.2.command.script.ps1)
	equals 1 $r
}

task test.3.command.dot-source {
	($r = .\test.3.command.dot-source.ps1)
	equals 1 $r
}

task test.4.command.workaround {
	($r = .\test.4.command.workaround.ps1)
	equals '5|5' ($r -join '|')
}
