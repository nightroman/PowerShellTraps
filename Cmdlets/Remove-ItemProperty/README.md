
### Remove-ItemProperty -Confirm fails on 'No' (Registry)

When `Remove-ItemProperty -Confirm` is called in order to remove an *existing*
property from a registry item and a user answers 'No' then the command fails
with an error:

> Property X does not exist at path Y.

The script *Test-Confirm-No-fails.ps1* shows the problem. Note that it creates
a key *HKCU:\77eeaf81-0b82-4b2e-93f3-ce464d61b955* with a property *p1* in the
registry and removes it after the test. When a script shows the confirmation
prompt answer 'No', i.e. type 'n' and Enter. As a result, the command fails.

---

- Microsoft Connect [507505](https://connect.microsoft.com/PowerShell/feedback/details/507505)
