
task Test-DirectorySize {
	($r = .\Test-DirectorySize.ps1)

	if ($PSVersionTable.PSVersion.Major -le 2) {
		assert ($r.size1 -eq $r.size2)
	}
	else {
		$n = (Get-ChildItem .. -Directory).Count
		assert ($n)
		assert ($r.size1 -eq $r.size2 + $n)
	}
}
