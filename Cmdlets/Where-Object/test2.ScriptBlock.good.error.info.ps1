
<#
The code fails in the script "Oops.ps1" and the shown error is very clear:

	Oops
	At ...\Oops.ps1 ...
	+ throw 'Oops'

The information tells where the error is exactly, unlike with Where-Object.
#>

Get-ChildItem | .{process{
	if (.\Oops.ps1 $_) {$_}
}}
