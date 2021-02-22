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
	$InvokeBuildVersion = '5.7.1'
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

# Synopsis: Generate the index in README.md
task index {
	function Get-List($Path, $Indent) {
		$tab = '    ' * $Indent
		foreach($_ in Get-ChildItem -Path $Path -Name -Directory) {
			if ($_ -eq 'Workaround') {continue}
			'{0}- [{1}]({2})' -f $tab, $_, "$Path/$_"
			Get-List "$Path/$_" ($Indent + 1)
		}
	}

	$(
		foreach($_ in Get-Content README.md) {
			$_
			if ($_ -eq '<!--Generated-->') {break}
		}

		Get-List . 0

		''
		'---'
	) | Set-Content README.md
}

# Synopsis: Tests markdown links
# Uses pandoc for markdown.
task link {
	# forbidden absolute links
	$ForbiddenLink = 'https://github.com/nightroman/PowerShellTraps/(tree|blob)/'

	# all relative markdown paths
	$files = Get-ChildItem . -Filter *.md -Recurse -Name
	"$($files.Count) markdown files"
	$ns = @{x = 'http://www.w3.org/1999/xhtml'}
	foreach($file in $files) {
		# convert to XML
		$xml = [xml](pandoc.exe --standalone --quiet --no-highlight --from=gfm --to=html $file)
		if ($global:LASTEXITCODE) {throw "Pandoc failed : $file"}

		# markdown folder full path
		$folder = Join-Path $BuildRoot (Split-Path $file)

		# test links
		foreach($node in Select-Xml //x:a $xml -Namespace $ns | Select-Object -ExpandProperty Node) {
			$link = $node.href

			# complex link
			if ($node.ChildNodes.Count -ne 1 -or $node.FirstChild.NodeType -ne 'Text') {
				Write-Warning "Complex link : $file : $($node.OuterXml)"
				continue
			}

			# outer link
			if ($link -cmatch '^http') {
				if ($link -cmatch $ForbiddenLink) {
					Write-Warning "Link : $file : $link"
				}
				continue
			}

			# link with "\"
			if ($link.Contains('\')) {
				Write-Warning "Link with '\': $file : $link"
				continue
			}

			# missing link
			$target = Join-Path $folder $link
			if (!(Test-Path -LiteralPath $target)) {
				Write-Warning "Missing link : $file : $link -> $target"
				continue
			}

			# mismatch link
			$ext = [System.IO.Path]::GetExtension($link)
			if ($ext -and $ext -ne '.md') {
				$text = $node.'#text'
				if (!$link.EndsWith($text)) {
					Write-Warning "Link and text mismatch: $file : $link ~ $text"
				}
			}
		}
	}
}

# Synopsis: Test.
task . test
