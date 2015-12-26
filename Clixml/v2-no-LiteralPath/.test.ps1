
<#
.Synopsis
	Tests missing LiteralPath in PowerShell v2.

.Description
	This test is for PowerShell v2, in v3+ invoke it as

		PowerShell -Version 2 -NoProfile Invoke-Build * .test.ps1
#>

# skip v3+
if ($PSVersionTable.PSVersion.Major -ne 2) {return task v2}

task v2.Export-Clixml-no-LiteralPath {
	($r = try {.\v2.Export-Clixml-no-LiteralPath.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NamedParameterNotFound,Microsoft.PowerShell.Commands.ExportClixmlCommand'
}

task v2.Import-Clixml-no-LiteralPath {
	($r = try {.\v2.Import-Clixml-no-LiteralPath.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NamedParameterNotFound,Microsoft.PowerShell.Commands.ImportClixmlCommand'
}
