
# https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/13275057-bug-or-doing-comparison

# True
# False (v7.1.0-rc.2)
'ae' -ceq 'æ'

# False
'ae'.Equals('æ')
