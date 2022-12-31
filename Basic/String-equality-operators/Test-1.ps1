
# True, null character is ignored
"`0xyz" -ceq 'xyz'

# False
[string]::Equals("`0xyz", 'xyz')
