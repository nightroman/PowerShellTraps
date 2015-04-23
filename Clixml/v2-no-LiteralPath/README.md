
The parameter `LiteralPath` of `Export-Clixml` and `Import-Clixml` is missing
in PowerShell v2.

Scripts

- *v2.Export-Clixml-no-LiteralPath.ps1* fails in v2 due to `LiteralPath`.
- *v2.Import-Clixml-no-LiteralPath.ps1* fails in v2 due to `LiteralPath`.
- *.test.ps1* tests the above.
