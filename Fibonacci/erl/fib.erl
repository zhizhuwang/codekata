-module(fib).
-export([fib/1,fib_tail_recursive/1,fib_matrix/1]).


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




%/                 \     /         \(n+1)   
%| F(n+2)  F(n+1)  |     |  1    1 |
%|                 |  =  |         | 
%| F(n+1)  F(n)    |     |  1    0 |
%\                 /     \         /  
fib_matrix(N) ->
	{{_,M01},{_,_}} = matrix_pow({{1,1},{1,0}},N),
	M01.

matrix_mul({{M00,M01},{M10,M11}},{{N00,N01},{N10,N11}}) ->
	{
	{M00*N00+M01*N10,M00*N01+M01*N11},
	{M10*N00+M11*N10,M10*N01+M11*N11}
	}.

matrix_pow({{_,_},{_,_}},1) -> 
	{{1,1},{1,0}};
matrix_pow({{M00,M01},{M10,M11}},N) ->
	{{X00,X01},{X10,X11}} = matrix_mul(matrix_pow({{M00,M01},{M10,M11}},N div 2) ,
				matrix_pow({{M00,M01},{M10,M11}},N div 2)),
	case N rem 2 of
		1 ->
			matrix_mul({{X00,X01},{X10,X11}}, {{1,1},{1,0}});
		0 -> 
			{{X00,X01},{X10,X11}}
	end.
