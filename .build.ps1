
<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

# Synopsis: Test v2 and v3+.
task Test TestV2, TestStrict

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
