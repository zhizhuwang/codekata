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
% rule3_contains_3() ->  atom(contains(3), fun(_) -> "Fizz" end)
% rule3() -> 'OR'(rule3_contains_3(),rule2_3_5_7())
% 

% Rule deault
% rule4() -> atom(always_true(_), fun(I) -> I end)
%

% Final Rule
% Rule -> 'OR'(rule3(),rule4())

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

always_true(_N) ->
	fun(_I) -> true end.

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


'OR'(R1, R2) ->
	fun(I) ->
		Res1 = R1(I),
		case Res1 of
			false ->
				R2(I);
			_ ->
				R1(I)
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

	"Fizz" = (atom(contains(3), fun(_) -> "Fizz" end))(13),

	"Fizz" = ('OR'(atom(contains(3), fun(_) -> "Fizz" end),
					'AND'(atom(times(3), fun(_) -> "Fizz" end),
							'AND'(atom(times(5), fun(_) -> "Buzz" end),
									atom(times(7), fun(_) -> "Whizz" end))
							)
					))
					(13),

	"Fizz" = ('OR'(atom(contains(3), fun(_) -> "Fizz" end),
					'AND'(atom(times(3), fun(_) -> "Fizz" end),
							'AND'(atom(times(5), fun(_) -> "Buzz" end),
									atom(times(7), fun(_) -> "Whizz" end))
							)
					))
					(35),
	"FizzBuzzWhizz" = ('OR'(atom(contains(3), fun(_) -> "Fizz" end),
					'AND'(atom(times(3), fun(_) -> "Fizz" end),
							'AND'(atom(times(5), fun(_) -> "Buzz" end),
									atom(times(7), fun(_) -> "Whizz" end))
							)
					))
					(105),

	11 = (atom(always_true(0), fun(I) -> I end))(11),

	Rule = 'OR'(
				'OR'(atom(contains(3), fun(_) -> "Fizz" end),
					'AND'(atom(times(3), fun(_) -> "Fizz" end),
							'AND'(atom(times(5), fun(_) -> "Buzz" end),
									atom(times(7), fun(_) -> "Whizz" end))
							)
					), 
				atom(always_true(0), fun(I) -> I end)),

	11 = Rule(11),
	[io:format("~p~n",[Rule(I)]) || I <- lists:seq(1,100)]
	.
	
%%  Solution 2
%%  represents rules as lists
%%  Rule 1 
%%  rule1_3 = atom(times(3), fun(_) -> "Fizz" end)
%%  rule1_5 = atom(times(5), fun(_) -> "Buzz" end)
%%  rule1_7 = atom(times(7), fun(_) -> "Whizz" end)
%%  rule2 = 'OR'([rule1_3,rule1_5,rule1_7])

%%  Rule 2
%%  rule2 = 'AND'([rule1_3,rule1_5,rule1_7])


%%  Rule 3
%%  rule3_1 = atom(contains(3), fun(_) -> "Fizz" end)
%%  rule3 = 'OR'([rule3_1,rule2])

%%  Rule 4
%%  rule4 = atom(always_true(0), fun(I) -> I end)

'OR'([]) -> fun(_I) -> false end;

'OR'([H|T]) ->
	fun(I) ->
		R = H(I),
		if  R =:= false -> ('OR'(T))(I);
			true -> R
		end
	end.
	

test2() ->
	Rule1_3 = atom(times(3), fun(_) -> "Fizz" end),
	Rule1_5 = atom(times(5), fun(_) -> "Buzz" end),
	Rule1_7 = atom(times(7), fun(_) -> "Whizz" end),

	Rule1 = 'OR'([Rule1_3,Rule1_5,Rule1_7]),

	"Fizz" = Rule1(6),
	"Buzz" = Rule1(10),
	"Whizz" = Rule1(49)
	.
	
	
	
