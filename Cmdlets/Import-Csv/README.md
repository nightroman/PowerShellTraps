
### Import-Csv may trim leading spaces

`Import-Csv` may trim leading spaces. Thus, it may change data. Compare: open
*Import-Csv.trims.leading.spaces.csv* in *Excel*, all the spaces are preserved.
Interestingly, `Import-Csv` in the same example keeps trailing spaces.

Note that this is not be a problem if `Import-Csv` reads data exported by
`Export-Csv`. `Export-Csv` uses double quotes for values. In this case
`Import-Csv` preserves data as they are.

Scripts

- *Import-Csv.trims.leading.spaces.ps1* imports *Import-Csv.trims.leading.spaces.csv* and shows the data.
- *.test.ps1* tests the data.

---

- Microsoft Connect [658253](https://connect.microsoft.com/PowerShell/feedback/details/658253)
