
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Path)
Set-Content z.txt 42

# works in v2+ because LiteralPath is provided
Move-Item -LiteralPath z.txt -Destination z.tmp -Verbose

Remove-Item z.tmp
