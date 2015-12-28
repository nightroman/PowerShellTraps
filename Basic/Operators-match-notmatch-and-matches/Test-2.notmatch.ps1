
# -notmatch finds a match (False) and populates $matches
$stuff = 'Fee Fi Fo Fum'
$stuff -notmatch 'Fi Fo'
$matches.values

# -notmatch does not find a match (True) and does not change $matches
$stuff = 'Rickity Tickity Tin'
$stuff -notmatch 'Fi Fo'
$matches.values
