
# fails, syntax error
foreach($e in 1..5) {$e} | .{process{"Result is $_"}}
