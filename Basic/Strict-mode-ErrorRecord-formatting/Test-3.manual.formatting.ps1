
[PowerShell]::Create().AddScript({
	Set-StrictMode -Version 2
	try {
		throw 'Oops!'
	}
	catch {
		@"
$($_.ToString())
$($_.InvocationInfo.PositionMessage)
    + CategoryInfo          : $($_.CategoryInfo.ToString())
    + FullyQualifiedErrorId : $($_.FullyQualifiedErrorId)
"@
	}
}).Invoke()