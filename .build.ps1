
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# Synopsis: Test v2 and v3+.
task Test Link, TestV2, TestStrict

# Synopsis: Test all in the strict mode.
# Allow test file failures and show summary.
task TestStrict {
	Set-StrictMode -Version Latest
	Invoke-Build ** -Safe -Summary
}

# Synopsis: Test with PowerShell 2.0.
# Check for the exit code, warn about failures.
task TestV2 {
	PowerShell -Version 2 -NoProfile Invoke-Build TestStrict
	if ($LASTEXITCODE) {Write-Warning 'V2 tests failed.'}
}

# Synopsis: Open a random folder in Visual Studio Code.
task Peek {
	code (Get-ChildItem . -Recurse -Directory | Get-Random).FullName
}

# Synopsis: Generate the index in "README.md".
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

# Synopsis: Tests markdown links.
# Uses pandoc for markdown -> HTML.
task Link {
	$BadLinkPattern = 'https://github.com/nightroman/PowerShellTraps/(tree|blob)/'
	$regexLink = [regex]'<a href="(.*?)">'
	$regexFile = [regex]'<em>(\S+?\.\w+?)</em>'

	$files = Get-ChildItem . -Filter *.md -Recurse -Name
	foreach($file in $files) {
		$html = pandoc --from=markdown_github "$BuildRoot\$file"
		if ($LASTEXITCODE) {
			Write-Warning "Pandoc failed : $file"
			continue
		}
		$folder = Join-Path $BuildRoot (Split-Path $file)
		# links
		foreach($match in $regexLink.Matches($html)) {
			$href = $match.Groups[1].Value

			if ($href -match '^http') {
				if ($href -match $BadLinkPattern) {
					Write-Warning "Link : $file : $href"
				}
				continue
			}

			$ref = Join-Path $folder $href
			if (!(Test-Path -LiteralPath $ref)) {
				Write-Warning "Link : $file : $href -> $ref"
			}
		}
		# files
		foreach($match in $regexFile.Matches($html)) {
			$name = $match.Groups[1].Value
			if (!(Test-Path -LiteralPath "$folder\$name")) {
				Write-Warning "File : $file : $name"
			}
		}
	}
}
