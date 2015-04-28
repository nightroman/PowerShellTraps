
# The workaround is for v3+
#requires -Version 3

# Add the test method
.\MethodWithStringParameter.ps1

# Invoke the test method with null
[TestMethodWithStringParameter]::Test([System.Management.Automation.Language.NullString]::Value)
