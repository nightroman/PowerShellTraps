# Switch parameter with value

If a script has a switch parameter then it is tricky to invoke it with a
specified switch value by `PowerShell.exe`. Also, it is only possible with
`Command`, not `File`.

The script [Script1.ps1](Script1.ps1) has the switch parameter `Option`. The switch value
(`$true` or `$false`) is defined by the variable `$useOption`. How to invoke
the script with this value specified?

In the same session this done as:

```powershell
.\Script1.ps1 -Option:$useOption
```

How to invoke the script as a new process?

#### PowerShell -Command

The script [Test-1-command-fails.ps1](Test-1-command-fails.ps1) tries to use the similar syntax:

```powershell
PowerShell .\Script1.ps1 -Option:$useOption
```

It fails. The arguments are converted to text and the actual command is:

```powershell
.\Script1.ps1 -Option:True
```

It turns out strings `True` or `False` cannot be converted to a switch value.
This may look strange because they are converted to `[bool]` fine:

```powershell
[bool]'True'
```

But `[switch]` (`[System.Management.Automation.SwitchParameter`) is not
designed to be created from a string, even from `True` or `False`.

The script [Test-2-command-works.ps1](Test-2-command-works.ps1) uses the syntax which works:

```powershell
PowerShell .\Script1.ps1 -Option:`$$useOption
```

The above arguments are converted to valid commands:

```powershell
.\Script1.ps1 -Option:$True
.\Script1.ps1 -Option:$False
```

#### PowerShell -File

**Fixed in v6.0.0-beta.5**

There is no way to pass a switch value in a script invoked by `File`. It is
expected that not all data can be passed in another process via parameters.
But switch parameters are so basic that such a way ideally should exist.

The workaround for a single switch is relatively simple:

```powershell
if ($useOption) {
    PowerShell -File Script1.ps1 -Option
}
else {
    PowerShell -File Script1.ps1
}
```

But for two or more switches defined by variables the code becomes too complex
for such a simple task.

---

- Stack Overflow [question](http://stackoverflow.com/q/30523948/323582)
- [Allow passing $true/$false as a parameter to scripts using powershell.exe -File](https://github.com/PowerShell/PowerShell/pull/4178)
- Microsoft Connect 742084
