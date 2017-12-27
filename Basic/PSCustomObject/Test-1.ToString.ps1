
# make a custom object
$object = New-Object PSCustomObject
$object | Add-Member -Type NoteProperty -Name P1 -Value 42

# PSCustomObject
$object.GetType().Name

# ToString() is empty
'' -eq $object.ToString()
