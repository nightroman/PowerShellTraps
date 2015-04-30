
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# Synopsis: Test with PowerShell 2.0 and the current.
task Test TestV2, TestV3

# Synopsis: Test with PowerShell 3.0+.
# Invoke safe with summary to allow test file failures and print them.
task TestV3 {
	Invoke-Build ** -Safe -Summary
}

# Synopsis: Test with PowerShell 2.0.
# Invoke normally, check for the exit code, and warn about a failure.
task TestV2 {
	PowerShell -Version 2 -NoProfile Invoke-Build **
	if ($LASTEXITCODE) {Write-Warning 'V2 tests failed.'}
}

# Synopsis: Generate index in README.
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

		Get-List '.' 0

		''
		'---'
	) | Set-Content README.md
}
