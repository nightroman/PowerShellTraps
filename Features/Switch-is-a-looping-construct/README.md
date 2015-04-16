
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

Yet another trap is use of `break` in order to skip next switch cases. This is
tempting because exactly `break` is used with `switch` in other languages. It
even works fine when `switch` is used on a single value. But when `switch` is
used on a collection, i.e. as a loop, then `continue` should be used for
skipping next cases. `break` stops the whole loop. The script
*use-continue-not-break.ps1* shows some examples.
