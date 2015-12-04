-module(fizzBuzzWhizz).
-compile(export_all).



% Rule 1
% rule1_3() -> atom(times(3), fun(_) -> "Fizz" end)
% rule1_5() -> atom(times(5), fun(_) -> "Buzz" end)
% rule1_7() -> atom(times(7), fun(_) -> "Whizz" end)

atom(Cond, Action) ->
	fun(I) ->
		case Cond(I) of true ->
			Action(I)
		end
	end.

times(N) ->
	fun(I) ->
		I rem N =:= 0 end.

test() ->
	"Fizz" = (atom(times(3), fun(_) -> "Fizz" end))(6),
	"Buzz" = (atom(times(5), fun(_) -> "Buzz" end))(15),
	"Whizz" =(atom(times(7), fun(_) -> "Whizz" end))(49).
	
