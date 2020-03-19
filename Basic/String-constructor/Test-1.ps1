
Add-Type -Path ./Lib.cs

# $Host is just converted to string by ToString()
# and User1(string) is called for creating User1

New-Object User1 $Host
