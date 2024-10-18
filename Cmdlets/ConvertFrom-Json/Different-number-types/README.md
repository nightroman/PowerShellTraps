# `ConvertTo-Json` different number types

## Integer numbers

- PowerShell Desktop imports integers as `Int32` or `Int64`.
- PowerShell Core imports integers as `Int64`.

## Floating point numbers

- PowerShell Desktop imports floating point numbers as `Decimal`.
- PowerShell Core imports floating point numbers as `Doubles`.

The script [Test-1.ps1](Test-1.ps1) shows results for various numbers.
