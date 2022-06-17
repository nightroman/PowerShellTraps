# `ConvertTo-Json` without `Compress` may change data

This issue is specific for PowerShell 3.0. It is fixed in 4.0.

`ConvertTo-Json` without `Compress` may change data and produce JSON which
causes problems for parsers.

The script [ConvertTo-Json.changes.data.ps1](ConvertTo-Json.changes.data.ps1) shows the problem.

---

- Microsoft Connect 1221685
