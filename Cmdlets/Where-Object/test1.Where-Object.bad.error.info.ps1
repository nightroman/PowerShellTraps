
<#
The code fails in the script "Oops.ps1" but this is not clear from the shown error:

	Get-ChildItem : Oops
	At ...\test1.Where-Object.bad.error.info.ps1 ...
	+ Get-ChildItem | Where-Object {

It looks like Get-ChildItem has failed in "test1.Where-Object.bad.error.info.ps1".
#>

Get-ChildItem | Where-Object {
	.\Oops.ps1 $_
}
