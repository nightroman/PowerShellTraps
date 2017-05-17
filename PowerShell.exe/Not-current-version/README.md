
If a script invokes `PowerShell.exe` and does not specify its version in some
cases or its path if some others then an unexpected PowerShell version may be
invoked.

**Example 1: v2 mode with v3+ installed**

Given:

- (1) The installed Windows PowerShell version is v3+.
- (2) *Script1.ps1* is invoked in v2 mode:

```powershell
    PowerShell -Version 2 .\Script1.ps1
```

- (3) This script should invoke *Script2.ps1*, also in v2 mode.
- (4) *Script2.ps1* should be invoked in a new session.

Then this command

```powershell
    PowerShell .\Script2.ps1
```

is not correct.
It invokes *Script2.ps1* in v3+ mode, the current installed PowerShell version.

The correct way for the above scenario is

```powershell
    PowerShell -Version 2 .\Script2.ps1
```

The script [Not-current-version.ps1](Not-current-version.ps1) shows how a newer PowerShell version is invoked.

**Example 2: v6 Core on Windows**

Given:

- (1) Some Windows PowerShell is installed, say, v5.
- (2) *Script1.ps1* is invoked in v6 Core edition.
- (3) This script should invoke *Script2.ps1*, also in v6.
- (4) *Script2.ps1* should be invoked in a new session.

Then this command

```powershell
    PowerShell .\Script2.ps1
```

is not correct.
It invokes *Script2.ps1* by the installed PowerShell v5.

The correct way for the above scenario is

```powershell
    $exe = (Get-Process -Id $PID).Path
    & $exe .\Script2.ps1
```

The script [Not-same-exe.ps1](Not-same-exe.ps1) shows how a different PowerShell executable is invoked.
