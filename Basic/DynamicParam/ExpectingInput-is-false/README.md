# `$MyInvocation.ExpectingInput` is false in `DynamicParam`

**Fixed in v6**

In a PowerShell function `$MyInvocation.ExpectingInput` is supposed to get true
if the function is invoked with a pipeline input. This is not the case for the
`DynamicParam` block, it gets false.

The script [Test-1.ps1](Test-1.ps1) shows the fact.

***

- windowsserver.uservoice.com/forums/301869-powershell/suggestions/13737072--myinvocation-expectinginput-doesn-t-work-]in-dynam
