
Remove-Item z.xml -Force -ErrorAction 0
42 | Export-Clixml z.xml

(Get-Item z.xml).Attributes = 'Hidden'

try {
	42 | Export-Clixml z.xml -Force -ErrorAction Stop
}
catch {
	$_
}

Remove-Item z.xml -Force
