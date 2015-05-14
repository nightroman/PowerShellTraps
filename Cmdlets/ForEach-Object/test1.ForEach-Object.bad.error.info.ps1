
<#
The code fails in the script "Oops.ps1" but this not clear from the shown error:

	Get-ChildItem : Oops
	At ...\test1.ForEach-Object.bad.error.info.ps1 ...
	+ Get-ChildItem | ForEach-Object {

Note that the information looks like Get-ChildItem has failed.
#>

Get-ChildItem | ForEach-Object {
	.\Oops.ps1 $_
}
