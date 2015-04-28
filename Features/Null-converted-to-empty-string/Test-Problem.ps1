
# Add the test method
.\MethodWithStringParameter.ps1

# Invoke the test method with null, null is converted to an empty string
[TestMethodWithStringParameter]::Test($null)
