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
if (!$MyInvocation.ScriptName.EndsWith('Invoke-Build.ps1')) {
	$ErrorActionPreference = 1
	$InvokeBuildVersion = '5.14.14'
	$ib = "$PSScriptRoot/packages/InvokeBuild/$InvokeBuildVersion/Invoke-Build.ps1"

	if (!(Test-Path -LiteralPath $ib)) {
		Write-Host 'Save-Module InvokeBuild'
		Save-Module InvokeBuild -Path "$PSScriptRoot/packages" -RequiredVersion $InvokeBuildVersion -Force
	}

	if (!(Test-Path -LiteralPath "$PSScriptRoot/packages/Invoke-PowerShell.ps1")) {
		Write-Host 'Save-Script Invoke-PowerShell'
		Save-Script Invoke-PowerShell -Path "$PSScriptRoot/packages" -Force
	}

	return & $ib -Task $Tasks -File $MyInvocation.MyCommand.Path @PSBoundParameters
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

task linkMarkdown {
	Test-MarkdownLink.ps1
}

task linkWeb {
	Test-WebLink.ps1 -SkipUrl {
		param($Url)
		$Url -in @(
			'https://api.github.com/users/nightroman/repos'
		)
	}
}

# Synopsis: Test links.
task link linkMarkdown, linkWeb

# Synopsis: Test.
task . test
