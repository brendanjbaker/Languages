:- initialization(main, main).

main :-
	findall(X, between(0, 100, X), List),
	sum_list(List, Sum),
	write(Sum), nl,
	halt.
