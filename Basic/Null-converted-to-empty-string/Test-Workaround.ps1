
# The workaround is for v3+
#requires -Version 3

# Add the test method
.\MethodWithStringParameter.ps1

# Invoke the test method with a special value instead of null
[TestMethodWithStringParameter]::Test([System.Management.Automation.Language.NullString]::Value)
