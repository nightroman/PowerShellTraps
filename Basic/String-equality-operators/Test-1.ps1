
# https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/15151431-bug-string-equals-and-eq-inconsistency-when-s

# True, null character is ignored
"`0xyz" -ceq 'xyz'

# False
[string]::Equals("`0xyz", 'xyz')
