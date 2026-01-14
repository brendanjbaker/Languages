-module(program).
-export([program/0]).

program() ->
	Sum = lists:sum(lists:seq(1, 100)),
	io:format("~p~n", [Sum]).
