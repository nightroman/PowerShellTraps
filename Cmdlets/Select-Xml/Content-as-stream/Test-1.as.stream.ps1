
$ErrorActionPreference = 'SilentlyContinue'

# make some XML file
Set-Content z.xml @'
<root>
	<elem1/>
	<elem2/>
</root>
'@

# get lines and pipe to Select-Xml, it processes only lines <elem*/>
# and writes non-terminating errors for others (v2 ignores them)
Get-Content z.xml | Select-Xml //* -ErrorVariable err
$err

# clean
Remove-Item z.xml
