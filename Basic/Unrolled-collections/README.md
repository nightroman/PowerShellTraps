
PowerShell may unroll collections, that is replace an original collection with
an array of its items.

This fact is especially easy to forget for some complex objects like
`[System.Data.DataTable]`. PowerShell may treat it as a collection of
`[System.Data.DataRow]` and the original table instance may be "lost".

The common workaround is use of the comma operator which wraps an argument with
an array of a single item. This array is unrolled and this gets its single item
as it is, not unrolled.

Scripts

- *unrolled.on.adding.ps1* shows unrolling on adding items to an array using `+=`.
- *unrolled.on.output.ps1* shows a collection unrolled on output from a function.
- *unrolled.on.return.ps1* is the similar script which uses `return` explicitly.
- *.test.ps1* tests the above.

---

- Stack Overflow [Append an Array to an Array of Arrays](http://stackoverflow.com/q/6157179/323582)
- Stack Overflow [Strange behaviour in function returning DataSet/DataTable](http://stackoverflow.com/q/1918190/323582)
