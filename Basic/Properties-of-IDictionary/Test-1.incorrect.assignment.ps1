
# DbConnectionStringBuilder which has the property ConnectionString
$builder = New-Object System.Data.Common.DbConnectionStringBuilder

# incorrect assignment of the property ConnectionString
$builder.ConnectionString = 'server = server1; user = user1'

# it is the key 'ConnectionString' added, not the property assigned
$builder.Keys
