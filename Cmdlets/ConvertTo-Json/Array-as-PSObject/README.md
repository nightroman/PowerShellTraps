# `ConvertTo-Json` Array as PSObject

**Fixed in v6**

If an array is assigned to a variable declared as `[PSObject]` and this
variable is piped to `ConvertTo-Json` then the result JSON does not
represent the original array. It is some sort of wrapper around it.

Scripts

- [Test-1.unexpected.ps1](Test-1.unexpected.ps1) shows the unexpected result with `[PSObject]`
- [Test-2.expected.ps1](Test-2.expected.ps1) shows the expected result without `[PSObject]`

***

- windowsserver.uservoice.com/forums/301869-powershell/suggestions/15123162-convertto-json-doesn-t-serialize-simple-objects-pr
