
`Get-Unique` is an odd cmdlet.

Firstly, unlike almost all tools in PowerShell, `Get-Unique` is case sensitive.
Not by default, it is just case sensitive, there is not an option to change this.

Secondly, `Get-Unique` requires its input to be pre-sorted. If this is not the
case then one has to use `Sort-Object`. But `Sort-Object` has the option
`Unique` itself, so that use of `Get-Unique` becomes redundant. Besides,
`Sort-Object` provides the options `Property`, `CaseSensitive`, `Culture`.

Yet another alternative is `Select-Object -Unique`.

`Get-Unique` can be useful though. If only adjacent case sensitive duplicates
should be removed then the cmdlet does this exactly. But the name is confusing.

Scripts

- [case.sensitive.ps1](case.sensitive.ps1) shows that `Get-Unique` is case sensitive.
- [requires.sorted.input.ps1](requires.sorted.input.ps1) shows that `Get-Unique` does not work for not sorted list.

---

- Microsoft Connect [77601](https://connect.microsoft.com/PowerShell/Feedback/Details/77601)
- Microsoft Connect [872943](https://connect.microsoft.com/PowerShell/Feedback/Details/872943)
