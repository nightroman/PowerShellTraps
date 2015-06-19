
# Outputs some data.
# Note that it calls Push-Location after the first output.
function Get-Data1 {
	'some output'
	Push-Location z
	'more output'
	Pop-Location
}

# Outputs the same data as Get-Data1.
# Note that it calls Push-Location before the first output.
function Get-Data2 {
	Push-Location z
	'some output'
	Pop-Location
	'more output'
}

# make the test directory "z"
if (!(Test-Path z)) {$null = mkdir z}

# Output file is in the current directory
Get-Data1 | Set-Content z.expected.Set-Content.log

# Output file is in the directory "z"
Get-Data2 | Set-Content z.unexpected.Set-Content.log

# Output file is in the current directory
Get-Data2 | Out-File z.expected.Out-File.log
