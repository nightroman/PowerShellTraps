
### Differences between PowerShell 2.0 and 3.0

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

The script *Test-1.ps1* shows different results in v2 and v3.

### In PowerShell 3.0 the result may be affected by other commands

The script *Test-2.ps1* in v3 shows how the result is affected by the seemingly
unrelated presiding command `New-Variable`.

---

- Stack Overflow [question](http://stackoverflow.com/q/30290555/323582)
- Microsoft Connect [1341920](https://connect.microsoft.com/PowerShell/feedback/details/1341920)
