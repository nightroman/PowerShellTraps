
In PowerShell `switch` is not just a way to avoid multiple `if` statements, it
is also a looping construct. In many cases this is a useful feature. But it
also introduces some difficulties and potential traps when `switch` is used
in other loops.

When `break` and `continue` are used inside of `switch` they work for this
`switch`. This is especially easy to forget for `continue` because in other
programming languages `continue` is not related to `switch`. The script
*continue-works-for-switch.ps1* shows a typical mistake.

When `switch` is used in a script block with `ForEach-Object` or `. {process{
... }}` there is another issue. The `switch` loop introduces its own automatic
variable `$_` for the current object. This variable hides the automatic
variable `$_` of the current pipeline object. The script
*switch-hides-current-item.ps1* shows a typical mistake.
