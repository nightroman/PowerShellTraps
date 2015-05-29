
Set-StrictMode -Off

# some fake customer data
$customers = 1..3 | .{process{ @{Id = $_; Name = "Name$_"} }}

foreach($customer in $customers) {
	# $customers is used instead $customer (a typo or wrong copy/paste)
	# As a result:
	# - In v2 none is processed (relatively safe).
	# - In v3 each is processed (not safe).
	if ($customers.Id -eq 2) {
		"Processed $($customer.Id)"
	}
}
