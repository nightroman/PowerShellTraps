
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Path)
Set-Content z.txt 42

try {
	# fails in v2 because LiteralPath is not provided
	Rename-Item -LiteralPath z.txt -NewName z.tmp -Verbose
}
finally {
	Remove-Item z.t??
}
