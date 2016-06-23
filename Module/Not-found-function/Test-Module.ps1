
Import-Module .\MyModule.psm1

function MyFunction {'MyFunction'}

# v5: it works
# v2: it fails
Test-MyFunction
