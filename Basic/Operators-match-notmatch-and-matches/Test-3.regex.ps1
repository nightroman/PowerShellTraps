
$regex = [regex] 'Fi Fo'

# regex finds a match ($match.Success ~ True) and gets not empty $match
$stuff = 'Fee Fi Fo Fum'
$match = $regex.Match($stuff)
$match.Success
$match.Groups[0].Value

# regex does not find a match ($match.Success ~ False) and gets "empty" $match
$stuff = 'Rickity Tickity Tin'
$match = $regex.Match($stuff)
$match.Success
$match.Groups[0].Value
