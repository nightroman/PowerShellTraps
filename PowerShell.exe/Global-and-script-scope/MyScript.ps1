
Set-Alias MyScriptAlias Get-Item
$MyScriptVariable = 42

Get-Alias MyScript* -Scope Global | %{$_.Name}
Get-Variable MyScript* -Scope Global | %{$_.Name}
