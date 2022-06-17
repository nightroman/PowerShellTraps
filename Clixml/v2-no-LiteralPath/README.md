# No `LiteralPath` in v2

The parameter `LiteralPath` of `Export-Clixml` and `Import-Clixml` is missing
in PowerShell v2. The current help does not mention this fact, hence the trap.

Scripts

- [v2.Export-Clixml-no-LiteralPath.ps1](v2.Export-Clixml-no-LiteralPath.ps1) fails in v2 due to `LiteralPath`.
- [v2.Import-Clixml-no-LiteralPath.ps1](v2.Import-Clixml-no-LiteralPath.ps1) fails in v2 due to `LiteralPath`.
