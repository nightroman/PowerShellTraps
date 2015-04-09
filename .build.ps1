
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# Synopsis: Test with PowerShell 2.0 and the current.
task Test TestV2, TestV3

# Synopsis: Test with PowerShell 3.0+.
task TestV3 {
	Invoke-Build **
}

# Synopsis: Test with PowerShell 2.0.
task TestV2 {
	exec {PowerShell -Version 2 -NoProfile Invoke-Build **}
}
