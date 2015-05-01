
# In v2 this fails quickly because 6d460559-a89d-405c-9782-42bf39b70894 does
# not exist at C:\.

# In v3+ this command may take ages, write a lot of errors, and get nothing
# unless 6d460559-a89d-405c-9782-42bf39b70894 exists. The latter case is odd.
# If it exists as a directory at C:\ then all its items will be returned.
# Otherwise all directories and files with this name found anywhere in the
# whole drive C: will be returned (except denied locations, hence the errors).

Get-ChildItem C:\6d460559-a89d-405c-9782-42bf39b70894 -Recurse -Force -ErrorAction Continue
