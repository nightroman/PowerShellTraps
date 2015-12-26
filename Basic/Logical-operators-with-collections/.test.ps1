
task looks-like-object-is-null {
	($r = .\looks-like-object-is-null.ps1)
	equals $r 'This is called.'
}

task object-is-eq-and-ne-to-1 {
	($r = .\object-is-eq-and-ne-to-1.ps1)
	equals $r[0] 'This is called.'
	equals $r[1] 'This is also called.'
}

