#requires -version 5

# Compile the attribute and two C# test classes
Add-Type -TypeDefinition ([IO.File]::ReadAllText("$PSScriptRoot\Lib.cs"))

# Import two PowerShell test classes
. $PSScriptRoot\Lib.ps1

### Test PowerShell classes

# get KnownTypeAttribute of T1
$r = [Attribute]::GetCustomAttribute([T1], [KnownTypeAttribute])

# KnownTypeAttribute, expected
$r.GetType().Name

# KnownType is null, unexpected -- THIS IS AN ISSUE
$r.KnownType -eq $null


### Test C# classes

# get KnownTypeAttribute of MyT1
$r = [Attribute]::GetCustomAttribute([MyT1], [KnownTypeAttribute])

# KnownTypeAttribute, expected
$r.GetType().Name

# KnownType is MyT2, expected (not null like in PowerShell)
$r.KnownType -eq [MyT2]
