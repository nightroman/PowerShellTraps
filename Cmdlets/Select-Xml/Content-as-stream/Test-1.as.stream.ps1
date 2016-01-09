
$ErrorActionPreference = 'SilentlyContinue'

# make some XML file
Set-Content z.xml @'
<root>
	<elem1/>
	<elem2/>
</root>
'@

# try to read lines and pipe to Select-Xml, it fails
# it works in v2 but only <elem*> lines are processed
Get-Content z.xml | Select-Xml //* -ErrorVariable err
$err

# clean
Remove-Item z.xml
