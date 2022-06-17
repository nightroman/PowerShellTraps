# `Set-Content` unexpected output location

What is the location of `data.txt` produced by this command?

    Get-Data | Set-Content data.txt

It turns out that the current location is not always the case. If `Get-Data`
changes the current location before the first output then the whole output is
created at the changed location.

Compare with `Out-File`. If the same `Get-Data` is used with `Out-File` then
`data.txt`  is created at the current location:

    Get-Data | Out-File data.txt

The script [unexpected.output.location.ps1](unexpected.output.location.ps1) shows the problem.

**Ensure the original location on the first output**

If a command outputs data and temporarily (a good practice) changes the current
location for its own convenience then it has to ensure that on the first output
the original location is restored. Otherwise, if such a command is used in the
pipeline with `Set-Content` or `Add-Content` then the output may be created
where it is not expected.

---

- Microsoft Connect 686310
