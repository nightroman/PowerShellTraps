# `Write-Information` writes nothing in `ForEach` method

For some reason (a bug?), `Write-Information` writes nothing in `.ForEach({...})` method script blocks.

See [Test-1.ps1](Test-1.ps1). It shows the problem in `.ForEach({...})` and
also shows that `Write-Information` works fine in `| .{process{...}}` and `|
ForEach-Object {...}` script blocks.
