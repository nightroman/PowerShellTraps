
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Element {
	($r = .\Test-1.Element.ps1)
	equals $r elem1
}

task Test-2.Attribute {
	($r = .\Test-2.Attribute.ps1)
	equals ($r -join '|') 'value1|elem1'
}

task Test-3.ChildNode {
	($r = .\Test-3.ChildNode.ps1)
	equals ($r -join '|') 'value1|elem1'
}

task Test-4.Cannot.set.number {
	($r = try {.\Test-4.Cannot.set.number.ps1} catch {$_})
	if ($Version -ge 6) {
		equals $r '42'
	}
	elseif ($Version -ge 3) {
		equals $r.FullyQualifiedErrorId XmlNodeSetShouldBeAString
	}
	else {
		equals $r.FullyQualifiedErrorId PropertyAssignmentException
	}
}

task Test-5.Cannot.set.string {
	($r = .\Test-5.Cannot.set.string.ps1)

	equals $r.Count 6
	equals $r[0] String
	equals $r[1] 'new attr'
	equals $r[2] String
	equals $r[3] 'new text'
	equals $r[4] Object[]
	if ($Version -eq 2) {
		equals $r[5].FullyQualifiedErrorId PropertyAssignmentException
	}
	else {
		equals $r[5].FullyQualifiedErrorId XmlNodeSetRestrictionsMoreThanOneNode
	}
}
