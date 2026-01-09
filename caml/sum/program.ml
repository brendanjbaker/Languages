let rec sum n acc =
	if n > 100 then acc
	else sum (n + 1) (acc + n);;

let result = sum 0 0;;

print_int result;
print_newline ();
flush std_out;;
