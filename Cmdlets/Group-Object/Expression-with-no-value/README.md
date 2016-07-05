
### Group-Object and properties made by expressions with no values

`Group-Object` may fail with `NullReferenceException` if input objects have a
`NoteProperty` made by an expression with no value. It works fine in v2, so the
issue was introduced by a later version.

A workaround, if applicable, is to change an expression so that it returns
`$null` instead of nothing.

Scripts

- [Test-1.ps1](Test-1.ps1) shows the issue
- [Test-2.ps1](Test-2.ps1) shows a workaround

***

- [Different-kinds-of-null](../../../Basic/Different-kinds-of-null)
- [UserVoice](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/13833771-group-object-fails-with-a-nullreferenceexception-f)
