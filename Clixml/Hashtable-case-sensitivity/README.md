# Hashtable case sensitivity

### PowerShell 3.0

Case sensitivity of a hashtable exported by `Export-Clixml` and imported by
`Import-Clixml` depends on its content, not on the original case sensitivity.
Thus, a case sensitive hashtable may become case insensitive after rehydration.

- The script [v3.case.sensitivity.depends.ps1](v3.case.sensitivity.depends.ps1) shows the problem.
- Microsoft Connect 771175

### PowerShell 2.0

Any hashtable is rehydrated as case sensitive.

- The script [v2.case.sensitive.always.ps1](v2.case.sensitive.always.ps1) shows the problem.
- Microsoft Connect 243386
