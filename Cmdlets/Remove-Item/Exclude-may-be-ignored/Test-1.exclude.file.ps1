
# make a test directory
if (Test-Path z) {Remove-Item z -Force -Recurse}
$null = mkdir z

# and two files in it
1 > z\z1
1 > z\z2

# remove the directory with -Exclude z1
Remove-Item z -Force -Recurse -Exclude z1

try {
	# v5.1: the directory z and its file z1 exist
	# v2: z is removed together with z1
	Get-ChildItem z -Recurse

	# clean
	Remove-Item z -Force -Recurse
}
catch {
	$_
}
