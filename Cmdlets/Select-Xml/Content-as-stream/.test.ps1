
$Version = $PSVersionTable.PSVersion.Major

task Test-1.as.stream {
	($r = .\Test-1.as.stream.ps1)

	if ($Version -eq 2) {
		equals $r.Count 2
		equals $r[0].Node.Name elem1
		equals $r[1].Node.Name elem2
	}
	else {
		equals $r.Count 4
		equals $r[0].Node.Name elem1
		equals $r[1].Node.Name elem2
		equals $r[2].FullyQualifiedErrorId 'InvalidCastToXmlDocument,Microsoft.PowerShell.Commands.SelectXmlCommand'
		equals $r[3].FullyQualifiedErrorId 'InvalidCastToXmlDocument,Microsoft.PowerShell.Commands.SelectXmlCommand'
	}
}

task Test-2.as.string {
	($r = .\Test-2.as.string.ps1)

	equals $r.Count 3
	equals $r[0].Node.Name root
	equals $r[1].Node.Name elem1
	equals $r[2].Node.Name elem2
}
