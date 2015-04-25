
### Write-Progress may hide information

*Write-Progress.may.hide.information.ps1* shows a warning message and continues
with `Write-Progress`. The progress hides the details of the warning message.
They remain hidden while the script works.

- Microsoft Connect [869651](https://connect.microsoft.com/PowerShell/Feedback/Details/869651)

### Write-Progress may hurt performance

`Write-Progress`, especially in the console host, may hurt performance.

The script *Write-Progress.may.hurt.performance.ps1* shows that
`Write-Progress` takes seconds for just 1000 iterations.

---

- Microsoft Connect [337323](https://connect.microsoft.com/PowerShell/feedback/details/337323)
