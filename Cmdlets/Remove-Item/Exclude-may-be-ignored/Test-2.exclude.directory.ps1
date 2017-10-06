
# make a test directory
if (Test-Path z) {Remove-Item z -Force -Recurse}
$null = mkdir z

# and two directories in it
$null = mkdir z\z1
$null = mkdir z\z2

# remove the directory with -Exclude z1
Remove-Item z -Force -Recurse -Exclude z1

# the directory z is removed together with z1
Test-Path z
