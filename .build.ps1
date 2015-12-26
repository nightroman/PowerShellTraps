
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# use the most strict mode
Set-StrictMode -Version Latest

# Synopsis: Test v2 and v3+.
task Test Test2, Test3

# Synopsis: Invoke all tests
# Allow test file failures and show summary.
task Test3 {
	Invoke-Build ** -Safe -Summary
}

# Synopsis: Invoke tests with PowerShell 2.0
# Check for the exit code, warn about failures.
task Test2 {
	#! do not use -Safe or we miss a warning
	PowerShell -Version 2 -NoProfile Invoke-Build **
	if ($LASTEXITCODE) {Write-Warning 'V2 tests failed.'}
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
# Uses pandoc for markdown -> HTML.
task Link {
	# forbidden absolute links
	$ForbiddenLink = 'https://github.com/nightroman/PowerShellTraps/(tree|blob)/'
	# regex for links in HTML
	$RegexLink = [regex]'<a href="(.*?)">'
	# regex for files *name.ext* in HTML
	$RegexFile = [regex]'<em>(\S+?\.\w+?)</em>'

	# all relative markdown paths
	$files = Get-ChildItem . -Filter *.md -Recurse -Name
	"$($files.Count) markdown files"
	foreach($file in $files) {
		# convert to HTML
		$html = pandoc --from=markdown_github $file
		if ($LASTEXITCODE) {throw "Pandoc failed : $file"}

		# markdown folder full path
		$folder = Join-Path $BuildRoot (Split-Path $file)

		# test links
		foreach($match in $RegexLink.Matches($html)) {
			$link = $match.Groups[1].Value

			# outer link
			if ($link -match '^http') {
				if ($link -match $ForbiddenLink) {
					Write-Warning "Link : $file : $link"
				}
				continue
			}

			# inner link
			$target = Join-Path $folder $link
			if (!(Test-Path -LiteralPath $target)) {
				Write-Warning "Link : $file : $link -> $target"
			}
		}

		# test files
		foreach($match in $RegexFile.Matches($html)) {
			$name = $match.Groups[1].Value
			if (!(Test-Path -LiteralPath "$folder\$name")) {
				Write-Warning "File : $file : $name"
			}
		}
	}
}
