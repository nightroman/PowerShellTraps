# `Get-ItemPropertyValue` ignores `ErrorAction`

As expected, `Get-ItemPropertyValue` respects `ErrorAction` if a specified item
does not exists.

But if a property of an existing item is missing then `Get-ItemPropertyValue`
ignores `ErrorAction`. According to the tests, it writes terminating errors if
it is called with `try` or `trap`. Otherwise it writes non-terminating errors.

The symptoms are similar to [Errors-of-unusual-type](../../../Basic/Errors-of-unusual-type).
The test 2 error is caused by `PSArgumentException` "Property NonExistentProperty does
not exist at ...". Presumably the cmdlet does not catch such exceptions
in order to process them with `WriteError()`.

Scripts

- [Test-1.missing.item.ps1](Test-1.missing.item.ps1)
- [Test-2.existing.item.ps1](Test-2.existing.item.ps1)
- [Test-3.unexpected.stop.try.ps1](Test-3.unexpected.stop.try.ps1)
- [Test-4.unexpected.stop.trap.ps1](Test-4.unexpected.stop.trap.ps1)

***

- windowsserver.uservoice.com/forums/301869-powershell/suggestions/11587617-bug-get-itempropertyvalue-does-not-respect-error
