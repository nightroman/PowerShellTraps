
if ($PSVersionTable.PSVersion.Major -ge 3) {return 'Invoke this in PowerShell 2.0'}

Import-Clixml -LiteralPath z.xml
