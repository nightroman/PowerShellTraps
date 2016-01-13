
PowerShell functions and script blocks consist of blocks. If none of them is
explicitly specified then the `end` block is assumed for functions and script
blocks and the `process` block for filters, the special form of functions.

One of the blocks is `process`. It is supposed to be called with each item from
the data piped to a command. There are three edge cases. One of them may be not
intuitively expected.

When a null is piped to a command then its `process` block is called once with
the null item. It looks reasonable, one item is piped and it is null.

    $null | Invoke-MyCommand

When an empty array or empty result from a command is piped to a command then
its `process` block is not called. It looks reasonable, nothing is piped.

    @() | Invoke-MyCommand
    Get-Nothing | Invoke-MyCommand

It may be not obvious that the `process` is called with a null item when a
command is invoked without a pipeline. Thus, it works as if null is piped.
One may expect it to work as if nothing is piped.

    Invoke-MyCommand

The following scripts illustrate the last two facts.

- [Test-1.Simple.function.ps1](Test-1.Simple.function.ps1)
- [Test-2.Advanced.function.ps1](Test-2.Advanced.function.ps1)

The script [Test-3.Pipe.nothing.ps1](Test-3.Pipe.nothing.ps1) shows what
happens if nothing is piped to a command, either directly or via a result
variable. Depending on a PowerShell versions these scenarios may be different.
