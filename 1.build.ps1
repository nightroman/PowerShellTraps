<#
.Synopsis
	Build script, https://github.com/nightroman/Invoke-Build
#>

param(
	[string[]]$Tasks
)

Set-StrictMode -Version Latest
$Major = $PSVersionTable.PSVersion.Major

# bootstrap
if ($MyInvocation.ScriptName -notlike '*Invoke-Build.ps1') {
	$InvokeBuildVersion = '5.9.6'
	$ErrorActionPreference = 'Stop'
	$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
	$ib = "$PSScriptRoot/packages/InvokeBuild/$InvokeBuildVersion/Invoke-Build.ps1"

	if (!(Test-Path -LiteralPath $ib)) {
		Write-Host 'Save-Module InvokeBuild'
		Save-Module InvokeBuild -Path "$PSScriptRoot/packages" -RequiredVersion $InvokeBuildVersion -Force
	}

	if (!(Test-Path -LiteralPath "$PSScriptRoot/packages/Invoke-PowerShell.ps1")) {
		Write-Host 'Save-Script Invoke-PowerShell'
		Save-Script Invoke-PowerShell -Path "$PSScriptRoot/packages" -Force
	}

	& $ib -Task $Tasks -File $MyInvocation.MyCommand.Path @PSBoundParameters
	return
}

# saved script alias
if (Test-Path "$BuildRoot/packages/Invoke-PowerShell.ps1") {
	Set-Alias Invoke-PowerShell "$BuildRoot/packages/Invoke-PowerShell.ps1"
}

# custom task header
Set-BuildHeader {
	Write-Build 11 "Task $($args[0]) *".PadRight(79, '*')
}

# Synopsis: Invoke tests.
task test {
	# show PowerShell version
	"PowerShell version: $($PSVersionTable.PSVersion)"
	# undo pwsh ConciseView
	$global:ErrorView = 'NormalView'
	# do tests
	Invoke-Build **
}

# Synopsis: Open a random folder in Visual Studio Code
task peek {
	code (Get-ChildItem . -Recurse -Directory | Get-Random).FullName
}

# Synopsis: Generate README index.
task index {
	# https://www.powershellgallery.com/packages/Update-ReadmeIndex
	$param = @{
		Depth = 99
		Skip = { $args[0] -like '*workaround*' }
	}
	Update-ReadmeIndex.ps1 Basic @param
	Update-ReadmeIndex.ps1 Class @param
	Update-ReadmeIndex.ps1 Clixml @param
	Update-ReadmeIndex.ps1 Cmdlets @param
	Update-ReadmeIndex.ps1 Module @param
	Update-ReadmeIndex.ps1 PowerShell.exe @param
}

# Synopsis: Tests markdown links
# Uses pandoc for markdown.
task link {
	Test-MarkdownLink.ps1
}

# Synopsis: Test.
task . test
