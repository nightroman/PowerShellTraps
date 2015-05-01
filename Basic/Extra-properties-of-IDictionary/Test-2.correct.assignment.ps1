
# DbConnectionStringBuilder which has the property ConnectionString
$builder = New-Object System.Data.Common.DbConnectionStringBuilder

# correct assignment of the property ConnectionString
$builder.set_ConnectionString('server = server1; user = user1')

# the setter was called, the string was parsed, keys were added
$builder.Keys
