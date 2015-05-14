
<#
The code fails in the script "Oops.ps1" and the shown error is very clear:

	Oops
	At ...\Oops.ps1 ...
	+ throw 'Oops'

The information tells where the error is exactly, unlike with ForEach-Object.
#>

Get-ChildItem | .{process{
	.\Oops.ps1
}}
