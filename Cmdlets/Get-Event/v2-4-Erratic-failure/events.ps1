
# This script frequently changes a file

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path
for() {
	Set-Content $PSScriptRoot\z.txt 42
}
