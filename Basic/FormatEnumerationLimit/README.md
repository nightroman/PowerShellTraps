# FormatEnumerationLimit

## Local FormatEnumerationLimit is ignored

Help *about_Preference_Variables*

    $FormatEnumerationLimit
    -----------------------
        Determines how many enumerated items are included in a display. This
        variable does not affect the underlying objects; just the display.
        When the value of $FormatEnumerationLimit is less than the number of
        enumerated items, Windows PowerShell adds an ellipsis (...) to
        indicate items not shown.

        Valid values: Integers (Int32)
        Default value: 4

Formatting uses only the global value of `$FormatEnumerationLimit`. In other
words, it is useless to set this variable locally in a function in order to
control format enumeration limit.

The workaround is to change this value globally. Ideally the value should be
changed temporarily and then restored. To do this properly is rather tedious:

```powershell
# save the global value
$oldFEL = $global:FormatEnumerationLimit

# change it globally
$global:FormatEnumerationLimit = 8

# try/finally to ensure the global value is restored
try {
    # do some formatting
    ... | Format-List
}
finally {
    # restore the global value in the finally block
    $global:FormatEnumerationLimit = $oldFEL
}
```

## Different representation of truncated outputs

v6.2.0-preview.4 started to use `…` instead of `...` for truncated outputs, see
test script results.

***

Scripts

- [Test-1-local-value-ignored.ps1](Test-1-local-value-ignored.ps1) shows that setting `$FormatEnumerationLimit` locally has no effect.
- [Test-2-global-value-works.ps1](Test-2-global-value-works.ps1) show that changing the global value works.

***

- Microsoft Connect 355675
