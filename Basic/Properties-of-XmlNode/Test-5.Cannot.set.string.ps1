
# document with child elements "e1", "e2", "e2",
# they all have different nodes named "a"
$root = ([xml]'
<r>
	<e1 a="1"/>
	<e2>
		<a>2</a>
	</e2>
	<e3 a="3">
		<a>4</a>
	</e3>
</r>
').DocumentElement

# "e1.a" is the read/write property associated with the attribute "a"
$root.e1.a.GetType().Name
$root.e1.a = 'new attr'
$root.e1.a

# "e2.a" is the read/write property associated with the text of element "a"
$root.e2.a.GetType().Name
$root.e2.a = 'new text'
$root.e2.a

# "e3.a" is the read only property with the attribute "a" and the child element "a"
# Assignment fails with a confusing message because a string value is being assigned:
# Cannot set "a" because only strings can be used as values to set XmlNode properties.
$root.e3.a.GetType().Name
try {
	$root.e3.a = 'oops'
}
catch {
	$_
}
