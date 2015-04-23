
if ($PSVersionTable.PSVersion.Major -ge 3) {return 'Invoke this in PowerShell 2.0'}

1 | Export-Clixml -LiteralPath z.xml
