
As expected, `Get-ItemPropertyValue` respects `ErrorAction` if a specified item
does not exists.

But if a property of an existing item is missing then `Get-ItemPropertyValue`
ignores `ErrorAction`. According to the tests, it writes terminating errors if
it is called with `try` or `trap`. Otherwise it writes non-terminating errors.

Scripts

- [Test-1.missing.item.ps1](Test-1.missing.item.ps1)
- [Test-2.existing.item.ps1](Test-2.existing.item.ps1)
- [Test-3.unexpected.stop.try.ps1](Test-3.unexpected.stop.try.ps1)
- [Test-4.unexpected.stop.trap.ps1](Test-4.unexpected.stop.trap.ps1)

***

- UserVoice [Get-ItemPropertyValue does not respect -ErrorAction SilentlyContinue](http://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11587617-bug-get-itempropertyvalue-does-not-respect-error)
