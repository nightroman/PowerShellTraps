
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# use the most strict mode
Set-StrictMode -Version Latest

# Synopsis: Invoke all tests
# Allow test file failures and show summary.
task Test3 {
	Invoke-Build ** -Safe -Summary
}

# Synopsis: Test with PowerShell v2.
# Check for the exit code, warn about failures.
task Test2 {
	#! do not use -Safe or we miss a warning
	PowerShell -Version 2 -NoProfile Invoke-Build **
	if ($global:LASTEXITCODE) {Write-Warning 'V2 tests failed.'}
}

# Synopsis: Test with PowerShell v6.
# Check for the exit code, warn about failures.
task Test6 -If $env:powershell6 {
	#! do not use -Safe or we miss a warning
	& $env:powershell6 -NoProfile -Command Invoke-Build **
	if ($global:LASTEXITCODE) {Write-Warning 'V6 tests failed.'}
}

# Synopsis: Open a random folder in Visual Studio Code
task Peek {
	code (Get-ChildItem . -Recurse -Directory | Get-Random).FullName
}

# Synopsis: Generate the index in README.md
task Index {
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
task Link {
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

# Synopsis: Test v2, v6, v3+.
task . Test2, Test6, Test3
