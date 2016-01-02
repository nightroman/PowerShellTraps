
# XML document and its element
[xml]$xml = '<elem1> <name>value1</name> </elem1>'
$elem = $xml.DocumentElement

# gets child value "value1", not node name "elem1"
$elem.Name

# gets element name "elem1"
$elem.get_Name()
