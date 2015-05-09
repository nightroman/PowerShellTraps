
# ArrayList of items
$list = [System.Collections.ArrayList]@(1..5)

# This function outputs the unrolled items, not the list
function Test-GetList1 {
	$list
}

# Object[]
(Test-GetList1).GetType()

# This function outputs the original list not unrolled
function Test-GetList2 {
	, $list
}

# ArrayList
(Test-GetList2).GetType()
