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

connected([P1, P2]) ->
	belong([P1,P2], lines()).

lines() -> 
	Line1 = [$a,$c,$b],
	Line2 = [$c,$d],
	Lines = [Line1, Line2],
	Lines.

test_connected() ->
	true = connected([$a,$c]),
	true = connected([$a,$b]),
	true = connected([$c,$b]),
	true = connected([$c,$d]),
	false = connected([$a,$d]),
	ok.

%% what does "on_a_line" mean
%% points P1, P2, P3 is on a line
on_a_line(P1, P2, P3) ->
	belong([P1,P2,P3], lines()).

test_on_a_line() ->
	true = on_a_line($a,$c,$b),
	false = on_a_line($a,$b,$d),
	ok.
