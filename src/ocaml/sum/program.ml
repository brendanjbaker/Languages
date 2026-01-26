let () =
	let sum = ref 0 in

	for i = 0 to 100 do
		sum := !sum + i
	done;

	print_int !sum;
	print_newline ()
