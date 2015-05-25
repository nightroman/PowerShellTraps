
### WildcardPattern.Escape() does not escape backticks

The escape character of `WildcardPattern` is backtick. It looks like if an
input string contains backticks then `WildcardPattern.Escape()` keeps them
intact instead of escaping each backtick with a backtick.

Compare with `Regex`. The escape character is backslash. If an input string
contains backslashes then `Regex.Escape()` escapes each backslash with a
backslash.

By design an escaped string as a pattern should match the original string. This
is not always the case with `WildcardPattern`. If a string contains backticks
then its escaped pattern may not match the original string.

Scripts

- *Test-1-Escape-UnEscape-wildcard.ps1* - shows that `WildcardPattern.Escape()` produces a pattern not matching the original string.
- *Test-2-Escape-UnEscape-regex.ps1* - shows how `Regex.Escape()` works in the similar case (backslashes instead of backticks).

---

- Microsoft Connect [336327](https://connect.microsoft.com/PowerShell/feedback/details/336327)
