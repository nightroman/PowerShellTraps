
task Test-DirectorySize {
	($r = .\Test-DirectorySize.ps1)

	if ($PSVersionTable.PSVersion.Major -le 2) {
		equals $r.size1 $r.size2
	}
	else {
		$n = (Get-ChildItem .. -Directory).Count
		assert $n
		equals $r.size1 ($r.size2 + $n)
	}
}
