# `ConvertFrom-Json` long integers in v6

`ConvertFrom-Json` returns integers as `[long]` or `[int]` depending on the
current PowerShell version:

- v6+: integers are returned as `[long]`
- v5-: integers are returned as `[int]`

Scripts

- [Test-1.long.integer.ps1](Test-1.long.integer.ps1)
