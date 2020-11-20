# Dictionary Count, Keys, Values may misbehave

Given a hashtable or dictionary, it looks natural accessing its properties
`Count`, `Keys`, `Values` using the classic dot notation. Unfortunately, in
PowerShell the dot notation is also used for accessing dictionary values by
keys, and keys have higher precedence than properties with the same names.

**Workaround**

The reliable workaround seems to be accessing properties `Count`, `Keys`,
`Values` as `.get_Count()`, `.get_Keys()`, `.get_Values()` respectively.

Workarounds like `.PSBase.Count` are not ideal for the same issue. If a
hashtable or dictionary contains the key `PSBase` then it's a problem.

**Scripts**

- [Test-1.Hashtable.ps1](Test-1.Hashtable.ps1) shows the problems with a hashtable.
- [Test-2.Dictionary.ps1](Test-2.Dictionary.ps1) shows the problems with a dictionary.
- [Test-3.Workaround.ps1](Test-3.Workaround.ps1) shows the workaround.

---

- [Properties-of-IDictionary](../Properties-of-IDictionary)
- [PowerShell/issues/7758](https://github.com/PowerShell/PowerShell/issues/7758)
