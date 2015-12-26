
task object-looks-like-0-and-true {
	($r = .\object-looks-like-0-and-true.ps1)

	if ($PSVersionTable.PSVersion.Major -ge 5) {
		equals $r[0] 'An object is equal to 0.'
		equals $r[1] 'Evaluated to false in v5.'
	}
	else {
		equals $r[0] 'An object is equal to 0.'
		equals $r[1] 'Evaluated to true in v2, v3, v4.'
	}
}
