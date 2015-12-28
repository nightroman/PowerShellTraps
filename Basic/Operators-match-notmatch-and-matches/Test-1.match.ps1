
# -match finds a match (True) and populates $matches
$stuff = 'Fee Fi Fo Fum'
$stuff -match 'Fi Fo'
$matches.values

# -match does not find a match (False) and does not change $matches
$stuff = 'Rickity Tickity Tin'
$stuff -match 'Fi Fo'
$matches.values
