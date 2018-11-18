
# https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/13275057-bug-or-doing-comparison

# True
'ae' -ceq 'æ'

# False
'ae'.Equals('æ')
