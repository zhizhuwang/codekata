-module(fizzBuzzWhizz).
-compile(export_all).



% Rule 1
% rule1_3() -> atom(times(3), fun(_) -> "Fizz" end)
% rule1_5() -> atom(times(5), fun(_) -> "Buzz" end)
% rule1_7() -> atom(times(7), fun(_) -> "Whizz" end)

% Rule 2
% rule2_3_5() -> 'AND'(rule1_3(), rule1_5)
% rule2_3_7() -> 'AND'(rule1_3(), rule1_7)
% rule2_5_7() -> 'AND'(rule1_5(), rule1_7)
% rule2_3_5_7() -> 'AND'(rule2_3_5(), rule1_7())

% Rule 3
% rule3 -  atom(contains(3), fun(_) -> "Fizz" end)


atom(Cond, Action) ->
	fun(I) ->
		case Cond(I) of 
			true ->
				Action(I);
			_ ->
				false

		end
	end.

times(N) ->
	fun(I) ->
		I rem N =:= 0 end.

contains(N) ->
	fun(I) ->
		(I rem 10 =:= N) or 
		(((I div 10) rem 10) =:= N) or 
		(((I div 100) rem 10) =:= N) 
	end.


'AND'(R1, R2) ->
	fun(I) ->
		Res1 = R1(I),
		Res2 = R2(I),
		case Res1 of
			false  ->
				R2(I);
			_ ->
				case Res2 of
					false  ->
						Res1;
					_ ->
						Res1 ++ Res2
				end
		end
	end.


test() ->
	"Fizz" = (atom(times(3), fun(_) -> "Fizz" end))(6),
	"Buzz" = (atom(times(5), fun(_) -> "Buzz" end))(15),
	"Whizz" =(atom(times(7), fun(_) -> "Whizz" end))(49),
	
	"FizzBuzz" = ('AND'(atom(times(3), fun(_) -> "Fizz" end),
						atom(times(5), fun(_) -> "Buzz" end))
				)
				(15),
	"FizzWhizz" = ('AND'(atom(times(3), fun(_) -> "Fizz" end),
					atom(times(7), fun(_) -> "Whizz" end))
				)
				(21),
	"BuzzWhizz" = ('AND'(atom(times(5), fun(_) -> "Buzz" end),
						atom(times(7), fun(_) -> "Whizz" end))
					)
					(35),
	"FizzBuzzWhizz" = ('AND'(atom(times(3), fun(_) -> "Fizz" end),
							'AND'(atom(times(5), fun(_) -> "Buzz" end),
									atom(times(7), fun(_) -> "Whizz" end))
							)
					)
					(105),

	"Fizz" = (atom(contains(3), fun(_) -> "Fizz" end))(13)
	.
	
