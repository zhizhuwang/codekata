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

%% set S1 is subset of set S2
subset([], _S2) ->
	true;
subset([H|T],S2) ->
	lists:member(H, S2) andalso  subset(T, S2).

test_subset() ->
	true = subset([a,b],[a,b]),
	true = subset([a,b],[a,c,b]),
	false = subset([a,b],[a,c]),
	ok.
