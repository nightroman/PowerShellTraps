
# Set the parent directory current.
Set-Location ..

# Get items recursively and "resolve their paths". As a result, Resolve-Path
# works for the top level items and then writes errors for all nested items.
# Use the error action 'Stop' to fail at the first error.
Get-ChildItem -Recurse | .{process{ Resolve-Path $_ -ErrorAction Stop }}
