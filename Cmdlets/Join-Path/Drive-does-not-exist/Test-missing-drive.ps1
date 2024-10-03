
# find missing drives and take the first
$MissingDrives = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
foreach($d in [System.IO.DriveInfo]::GetDrives()) { $MissingDrives = $MissingDrives -replace $d.Name[0] }
$drive = $MissingDrives[0]

# a path with the missing drive and a file name
$path = "${drive}:\test"
$file = 'test.txt'

# Path.Combine() works fine
[System.IO.Path]::Combine($path, $file)

# Join-Path fails
Join-Path $path $file
