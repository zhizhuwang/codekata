-module(fib).
-export([fib/1,fib_tail_recursive/1]).


fib(0) -> 0;
fib(1) -> 1;
fib(N) -> 
	fib(N-1) + fib(N-2).
	

fib_tail_recursive(0) -> 0;
fib_tail_recursive(1) -> 1;
fib_tail_recursive(N) -> 
	fib_tail_recursive_internal(N, 0, 1).

fib_tail_recursive_internal(1, _, B) -> B;
fib_tail_recursive_internal(N, A, B) ->
	fib_tail_recursive_internal(N-1, B, A+B).