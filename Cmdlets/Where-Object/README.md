# `Where-Object`

When `Where-Object` is used in a pipeline with other commands and its
scriptblock causes an error then the error info tends to be not clear.

`Where-Object` can be replaced with `.{process{if (...) {$_}}}`. The latter
works faster and does not obfuscate information of potential errors.

Scripts

- [Oops.ps1](Oops.ps1) simulates a problematic script, it just throws an error.
- [test1.Where-Object.bad.error.info.ps1](test1.Where-Object.bad.error.info.ps1) uses `Where-Object` and shows bad error information.
- [test2.ScriptBlock.good.error.info.ps1](test2.ScriptBlock.good.error.info.ps1) uses `.{process{if ...}}` and shows clear error information.
- [test3.measure.performance.ps1](test3.measure.performance.ps1) shows that `.{process{if ...}}` is much faster than `Where-Object`.

See also

- [ForEach-Object](../ForEach-Object)
