
It is typical to assign command results to a variable. What does this variable
contain if a command outputs nothing? It turns out that in PowerShell 3.0+ it
is something that looks like null and behaves like null is most cases except
some special. Such special cases are potential traps.

The script *Test-1-different-results.ps1* shows that "no results" assigned to a
variable looks like null but may cause different results, comparing with a true
null variable.

The script *Test-2-not-exactly-null.ps1* shows how "no results" null can be
distinguished from a true null. This is just a fact, not a suggested method.
This feature is not documented in known official sources.

Note: yet another difference between PowerShell 2.0 and 3.0 was found. In the
strict mode `$null.PSObject` fails in v2 and works in v3+. In the latter case
it gets null for a true null and a `PSCustomObject` instance for a "no result"
null.

---

- [PowerShellTraps/issues/2](https://github.com/nightroman/PowerShellTraps/issues/2)
