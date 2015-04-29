
# make a directory z\6d460559-a89d-405c-9782-42bf39b70894
$null = mkdir .\z\6d460559-a89d-405c-9782-42bf39b70894

# and a file 6d460559-a89d-405c-9782-42bf39b70894 in it
Set-Content .\z\6d460559-a89d-405c-9782-42bf39b70894\6d460559-a89d-405c-9782-42bf39b70894 1

# In v2 it fails due to missing .\6d460559-a89d-405c-9782-42bf39b70894
# In v3+ it gets the directory and the file found in .\z
try {
	Get-ChildItem .\6d460559-a89d-405c-9782-42bf39b70894 -Recurse
}
finally {
	# clean up
	Remove-Item z -Force -Recurse
}
