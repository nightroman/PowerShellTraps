
### Group-Object -AsHashTable and custom expressions

When `Group-Object` is used with the switch `AsHashTable` and `Property`
specified as a string expression then the result hashtable indexer
(`$table[key]`) does not find expected entries.

Other expressions, i.e. not strings, may produce expected results.

Scripts

- [Test-1.property.string.ps1](Test-1.property.string.ps1) - expected results with a property name
- [Test-2.expression.string.ps1](Test-2.expression.string.ps1) - unexpected results with the seemingly same string expression
- [Test-3.expression.number.ps1](Test-3.expression.number.ps1) - expected results with a numeric expression

***

- [UserVoice](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/15053526--bug-group-object-with-ashashtable-and-custom-ex)
- [StackOverflow](http://stackoverflow.com/questions/28190053/group-object-diffencies-with-or-without-code-block)
