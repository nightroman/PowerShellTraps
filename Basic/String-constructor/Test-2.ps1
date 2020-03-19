
Add-Type -Path ./Lib.cs

# Instead of using arguably suitable constructor User1(uint)
# PowerShell converts 42 to string and calls User1(string)

[User1] 42
