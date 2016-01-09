
# element with attribute "a"
$elem = ([xml]'<r a="1"/>').DocumentElement

# PowerShell does not convert a number to string as in many similar cases, it fails:
# Cannot set "a" because only strings can be used as values to set XmlNode properties
$elem.a = 42
