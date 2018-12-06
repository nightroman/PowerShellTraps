
Negative number literals used as command arguments are treated as strings, not
numbers as one may expect. When this matters, use parenthesis to ensure
numbers.

Scripts

- [Test-1.ps1](Test-1.ps1) - shows how "negative number literals" are actually strings
- [Test-2.ps1](Test-2.ps1) - example of a function that may or may not work correctly
