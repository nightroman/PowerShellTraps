
Set-StrictMode -Off

# some fake customer data
$customers = 1..3 | .{process{ @{Id = $_; Name = "Name$_"} }}

foreach($customer in $customers) {
	# $customers is used instead $customer (a typo or wrong copy/paste)
	# As a result, none is processed (relatively safe).
	if (2 -eq $customers.Id) {
		'Processed Id 2'
	}
}
