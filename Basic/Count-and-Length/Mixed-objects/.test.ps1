
task Test-DirectorySize {
	($r = .\Test-DirectorySize.ps1)

	if ($PSVersionTable.PSVersion.Major -le 2) {
		equals $r.size1 $r.size2
	}
	else {
		assert ($r.size1 -gt $r.size2)
	}
}
