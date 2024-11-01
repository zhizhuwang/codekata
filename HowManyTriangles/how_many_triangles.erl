-module(howManyTriangles).
-compile(export_all).

%% Sementic of triangles.
%% What is meant by a Triangle ?

%% Three points can forms a triangle

% triangle(P1, P2, P3) ->
%	connected(P1, P2) andalso
%	connected(P1, P3) andalso
%	connected(P2, P3) andalso
%	(not on_a_line(P1, P2, P3)).

%% What does a Line mean?
%% A line from a to b, can be represented by [a,b]
%% A line from a through b to c, can be represented by [a,b,c]


%% What does "connected" mean?
%% For line [a,b],a and b is connected, 
%% means that (a E [a,b]) and (b E [a,b]), thus, ([a,b] C [a,b])

%% For line [a,c,b], a and b is connected,
%% means that (a E [a,c,b]) and (b E [a,c,b]), thus, ([a,b] C [a,c,b])

%% "connected" means Subset

%%  denote "connected" in Erlang symbols
%%  Line = [$a, $b], where P1 = $a, P2 = $b

%% set S1 is subset of set S2
subset([], _S2) ->
	true;
subset([H|T],S2) ->
	lists:member(H, S2) andalso  subset(T, S2).

test_subset() ->
	Line = [$a, $b],
	P1 = $a,
	P2 = $b,
	true = subset([P1,P2], Line),
	ok.

test_subset2() ->
	Line1 = [$a, $c, $b],
	Line2 = [$c, $d],
	P1 = $a,
	P2 = $b,
	P3 = $d,
	P4 = $c,
	true = subset([P1,P4], Line1),
	true = subset([P1,P2], Line1),
	true = subset([P4,P2], Line1),

	true = subset([P4,P3], Line2),
	ok.

%% given some lines
%% Line1 = [$a,$c,$b]
%% Line2 = [$c,$d]
%% Line3 = ...,
%% Lines = [Line1, Line2, Line3,...]

%% determin whether P1 P2 is connected
%%　sub([P1,P2] ,Line1) orelse
%%  sub([P1,P2] ,Line2) orelse
%%  sub([P1,P2] ,Line3) orelse
%%  ...


%%  set S1 is a subset of one element of set SS
%%  SS = [E1, E2, E3,...]
%%  sub(S1, Ei) == true
belong(_S1, []) -> false;
belong(S1, [E|T]) ->
	subset(S1, E) orelse belong(S1,T).

connected1([P1, P2]) ->
	belong([P1,P2], lines1()).

lines1() -> 
	Line1 = [$a,$c,$b],
	Line2 = [$c,$d],
	Lines = [Line1, Line2],
	Lines.

test_connected() ->
	true = connected1([$a,$c]),
	true = connected1([$a,$b]),
	true = connected1([$c,$b]),
	true = connected1([$c,$d]),
	false = connected1([$a,$d]),
	ok.

%% what does "on_a_line" mean
%% points P1, P2, P3 is on a line
test3() ->
	Line1 = [$a,$c,$b],
	Line2 = [$c,$d],
	true = subset([$a,$c,$b],Line1),
	false = subset([$a,$c,$b],Line2),
	false = subset([$a,$c,$d],Line1),
	false = subset([$b,$c,$d],Line2),
	ok.

on_a_line1(P1, P2, P3) ->
	belong([P1,P2,P3], lines1()).

test_on_a_line() ->
	true = on_a_line1($a,$c,$b),
	false = on_a_line1($a,$b,$d),
	ok.

%% count triangles now
%% first, formalize the counting process

lines2() ->
	Line1 = [$a, $b],
	Line2 = [$a, $c],
	Line3 = [$b, $c],
	[Line1, Line2, Line3].

connected2([P1, P2]) ->
	belong([P1,P2], lines2()).

on_a_line2(P1, P2, P3) ->
	belong([P1,P2,P3], lines2()).

test4() ->
	P1 = $a,
	P2 = $b,
	P3 = $c,
	true = triangle(P1, P2, P3),
	ok.

%% denote triangle() to Erlang 
%% points P1 P2 P3 forms a triangle
triangle(P1,P2,P3) ->
	connected2([P1,P2]) andalso
	connected2([P1,P3]) andalso
	connected2([P2,P3]) andalso
	(not on_a_line2(P1,P2,P3)).

%% multiple triangles

lines5() ->
	Line1 = [$a,$d,$b],
	Line2 = [$a,$c],
	Line3 = [$c,$d],
	Line4 = [$c,$b],
	[Line1,Line2,Line3,Line4].

connected5([P1, P2]) ->
	belong([P1,P2], lines5()).

on_a_line5(P1, P2, P3) ->
	belong([P1,P2,P3], lines5()).

triangle5([P1,P2,P3]) ->
	connected5([P1,P2]) andalso
	connected5([P1,P3]) andalso
	connected5([P2,P3]) andalso
	(not on_a_line5(P1,P2,P3)).

test5() ->
	true = triangle5([$a,$b,$c]),
	false = triangle5([$a,$b,$d]),
	true = triangle5([$a,$c,$d]),
	true = triangle5([$b,$c,$d]),
	ok.


%% what does it mean?
%% for points $a, $b ,$c $d,
%% [$a,$b,$c],[$a,$c,$d],[$d,$b,$c], [$a,$b,$d],...

%% We want all triple points 
%% that is all combinations of 3 points

com(S,1) -> 
	[[I]|| I <- S];

com(S,N) when length(S) =:= N -> 
	[S];

com([H|T],N) ->
	com(T, N) ++ [[H|I] || I <- com(T,N-1)].

lines6() ->
	Line1 = [$a,$d,$b],
	Line2 = [$a,$c],
	Line3 = [$c,$d],
	Line4 = [$c,$b],
	[Line1,Line2,Line3,Line4].

points6() ->
	[$a, $b, $c, $d].

connected6([P1, P2]) ->
	belong([P1,P2], lines6()).

on_a_line6(P1, P2, P3) ->
	belong([P1,P2,P3], lines6()).

triangle6([P1,P2,P3]) ->
	connected6([P1,P2]) andalso
	connected6([P1,P3]) andalso
	connected6([P2,P3]) andalso
	(not on_a_line6(P1,P2,P3)).

triple_points6() ->
	com(points6(), 3).

count6() ->
	Triples = triple_points6(),
	count6(Triples,0).

count6([],N) -> N;

count6([H|T],N) ->
	case triangle6(H) of
		true ->
			count6(T,N+1);
	    false ->
	        count6(T,N)
	end.

test6() ->
	3 = count6(),
	ok.

%% some sugars
%% [$a,$b,$c,$d] can be represented as "abcd"
lines() ->
	["abc","adef","aghi","ajk","bdgj","cehj","cfik"].

points() ->
	"abcdefghijk".

connected([P1, P2]) ->
	belong([P1,P2], lines()).

on_a_line(P1, P2, P3) ->
	belong([P1,P2,P3], lines()).

triangle([P1,P2,P3]) ->
	connected([P1,P2]) andalso
	connected([P1,P3]) andalso
	connected([P2,P3]) andalso
	(not on_a_line(P1,P2,P3)).

triple_points() ->
	com(points(), 3).

count() ->
	Triples = triple_points(),
	count(Triples,0).

count([],N) -> N;

count([H|T],N) ->
	case triangle(H) of
		true ->
			count(T,N+1);
	    false ->
	        count(T,N)
	end.

test() ->
	24 = count(),
	ok.
