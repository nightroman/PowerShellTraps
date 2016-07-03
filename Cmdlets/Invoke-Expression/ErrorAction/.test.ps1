
task Test-1.Continued {
	$r = .\Test-1.Continued.ps1
	equals $r Continued
	equals "$($Error[0])" 'non-terminating error'
}

task Test-2.Stopped {
	$r = try {.\Test-2.Stopped.ps1} catch {$_}
	equals "$r" 'non-terminating error'
}
