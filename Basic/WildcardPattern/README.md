
### WildcardPattern.Escape() does not escape some backticks

The escape character of `WildcardPattern` is backtick. It looks like if an
input string contains backticks which are not followed by characters `[]?*`
then `WildcardPattern.Escape()` keeps them intact instead of escaping each
backtick with a backtick.

Compare with `Regex`. The escape character is backslash. If an input string
contains backslashes then `Regex.Escape()` escapes each backslash with a
backslash.

By design an escaped string as a pattern should match the original string. This
is not always the case with `WildcardPattern`. If a string contains backticks
then its escaped pattern may not match the original string. Also, the method
`WildcardPattern.UnEscape()` applied to an escaped string may not produce the
original string.

#### Workaround

One possible workaround is to escape a string using this regular expression:

```powershell
    $escaped = $string -replace '([`*?[\]])', '`$1'
```

As a result, an escaped string matches the original with the operator `-like`
and the method `WildcardPattern.UnEscape()` gets the original string.

#### Scripts

- [Test-1-Escape-UnEscape-wildcard.ps1](Test-1-Escape-UnEscape-wildcard.ps1) shows that `WildcardPattern.Escape()`
  produces a pattern not matching the original string and `UnEscape()` does not
  get the original string.
- [Test-2-Escape-UnEscape-regex.ps1](Test-2-Escape-UnEscape-regex.ps1) shows how `Regex.Escape()` works in the
  similar case (backslashes instead of backticks).
- [Test-3-Escape-workaround.ps1](Test-3-Escape-workaround.ps1) tests the workaround.

---

- Microsoft Connect [336327](https://connect.microsoft.com/PowerShell/feedback/details/336327)
