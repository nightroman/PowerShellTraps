
# ArrayList of items
$list = [System.Collections.ArrayList]@(1..5)

# This function returns the unrolled items, not the list
function Test-GetList1 {
	return $list
}

# Object[]
(Test-GetList1).GetType()

# This function returns the original list not unrolled
function Test-GetList2 {
	return , $list
}

# ArrayList
(Test-GetList2).GetType()
