
### ValidateScript and cryptic error messages

The rules for a validation script are

1. On invalid values it may return false or nothing.
2. On invalid values it may throw an exception.
3. On valid values it must return true.

The case 1 tends to produce cryptic error messages because all that PowerShell
can do is to show the validation script itself. Such a message is often not
user friendly even for relatively simple scripts.

The case 2 may be preferable because it explains the problem with a user
friendly message specified on `throw`.

And now the rule 3 comes. A script cannot just throw an exception on invalid
values. It still has to return true for valid. As a result, the approach 2
should look like `{ if (<$_ is valid>) {$true} else {throw <message>} }`.

Scripts

- *Test-1-simple-but-poor-error-message.ps1* uses a simple script resulting in cryptic errors.
- *Test-2.1-good-message-but-incorrect.ps1* uses `throw` with a user friendly message.
- *Test-2.2-good-message-but-incorrect.ps1* shows that 2.1 is not yet correct for valid input.
- *Test-3-correct-and-good-but-not-simple.ps1* - corrected test 2, the script is not that simple now.

### ValidateScript is invoked for each item in a collection

It may be not obvious but when an input value is a collection then a script is
invoked for each item in it. In many cases this is a handy feature, it just has
to be kept in mind.

- *Test-4-invoked-for-each-item.ps1* shows multiple invocations of a script.
- Microsoft Connect [812137](https://connect.microsoft.com/PowerShell/feedback/details/812137)

### ValidateScript does not allow null

If null is a valid input value then `ValidateScript` cannot be used.

- *Test-5-value-cannot-be-null.ps1* shows the issue.
- Microsoft Connect [812136](https://connect.microsoft.com/PowerShell/feedback/details/812136)

---

See also

- Help *about_Functions_Advanced_Parameters*.
