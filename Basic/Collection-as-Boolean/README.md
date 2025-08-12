# Collection as Boolean

When a collection type (.NET array, generic list, `ArrayList`, etc.) is used
in a Boolean context, in many cases PowerShell evaluates it as `$true` if it
contains at least one item, and `$false` if it is empty.

This is not true and may be unexpected if a collection has a single item which
is evaluated as `$false` in a Boolean context. Such not empty collections are
evaluated as `$false`.

Scripts

- [Test-1-expected.ps1](Test-1-expected.ps1) shows expected results
- [Test-2-may-be-unexpected.ps1](Test-2-may-be-unexpected.ps1) shows potentially unexpected results
