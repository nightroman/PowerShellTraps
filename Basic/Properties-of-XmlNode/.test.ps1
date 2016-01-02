
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
