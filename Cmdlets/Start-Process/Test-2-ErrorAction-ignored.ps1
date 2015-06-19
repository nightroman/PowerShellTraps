
try {
	Start-Process a13c52d9-c2b7-470b-99c5-919ce777f10a -ErrorAction SilentlyContinue
	throw 'should not be invoked'
}
catch {
	$_
}
