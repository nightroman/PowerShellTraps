
# make some XML file
Set-Content z.xml @'
<root>
	<elem1/>
	<elem2/>
</root>
'@

# read lines, convert to a string, pipe to Select-Xml
Get-Content z.xml | Out-String | Select-Xml //*

# clean
Remove-Item z.xml
