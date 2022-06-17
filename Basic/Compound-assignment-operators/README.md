# Compound assignment operators

### Differences between PowerShell v2 and v3

From *WMF 3 Release Notes.docx* at [WMF 3.0](https://www.microsoft.com/en-gb/download/details.aspx?id=34595):

Change

    Read/Modify/Write operators no longer use dynamic scoping for the Read
    operation. Also, compound equality operators (including +=, -=, *=, %=, ++,
    --) do not use dynamic scoping.  The variable is always in the current scope.

Sample

    $x = 1
    & { $x += 1; $x }
    # Returns 2 in Windows PowerShell 2.0
    # Returns 1 in Windows PowerShell 3.0

Error Message

    No error. Results differ.

Workaround

    Rewrite to use only the simple assignment operator:
    $x = 1
    & { $x = $x + 1; $x}

Scripts

- [Test-1.1.ps1](Test-1.1.ps1) shows different results in v2 and v3 for the operator `+=`.
- [Test-1.2.ps1](Test-1.2.ps1) shows same results in v2 and v3 for the operator `++`, in contrast to the release notes.

### In PowerShell v3+ results may be affected by other commands

The script [Test-2.ps1](Test-2.ps1) in v3+ shows how the result of the operator
`+=` is affected by the seemingly unrelated preceding `New-Variable` added to
the script [Test-1.1.ps1](Test-1.1.ps1).

---

- Stack Overflow [question](http://stackoverflow.com/q/30290555/323582)
- Microsoft Connect 1341920
