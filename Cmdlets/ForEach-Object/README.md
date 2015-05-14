
When `ForEach-Object` is used in a pipeline with other commands and its
scriptblock causes an error then the error info tends to be not clear.

`ForEach-Object` can be replaced with `.{process{...}}`. The latter works
faster and does not obfuscate information of potential errors.

Scripts

- *Oops.ps1* simulates a problematic script, it just throws an error.
- *test1.ForEach-Object.bad.error.info.ps1* uses `ForEach-Object` and shows bad error information.
- *test2.ScriptBlock.good.error.info.ps1* uses `.{process{...}}` and shows clear error information.
- *test3.measure.performance.ps1* shows that `.{process{...}}` is much faster than `ForEach-Object`.

See also

- [Where-Object](../Where-Object)
