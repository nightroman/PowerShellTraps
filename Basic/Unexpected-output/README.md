
PowerShell outputs everything which is evaluated to something, even without
`Write-Output`, `return`, and etc. This may result in unexpected output.

For example, for `ArrayList.Add` or `StringBuilder.Append` it is easy to forget
that these methods return values and they become part of the output unless they
are somehow used, e.g. assigned to a variable, or explicitly discarded.

Unused output of some statements should be discarded, for example

    $null = ...
    [void](...)
    ... > $null
    ... | Out-Null

Scripts

- *ArrayList.Add.1.ps1* shows a typical mistake, a called method actually gets something.
- *ArrayList.Add.2.ps1* is the above example corrected.
- *.test.ps1* tests the above.
