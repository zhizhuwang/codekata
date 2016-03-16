-module(countdown).
-export([values/1, solutions/2, eval/1, solution/3,perms/1,subs/1,perms2/1]).
-export ([choices/1,exprs/1,interleave/2]).
-export([solutions2/2,solutions3/2]).
-type op() :: add | sub | mul | divi.

-spec apply_op(op(), integer(), integer()) -> integer().
apply_op(add, L1, L2) -> L1 + L2;
apply_op(sub, L1, L2) -> L1 - L2;
apply_op(mul, L1, L2) -> L1 * L2;
apply_op(divi, L1, L2) -> L1 div L2.

-spec valid(op(), integer(), integer()) -> boolean().
valid(add, _L1, _L2) -> true;
valid(sub, L1, L2) -> L1 > L2;
valid(mul, _L1, _L2) -> true;
valid(divi, L1, L2) -> L1 rem L2 =:= 0.


-type expr():: {val, integer()} | 
			{app, op(), expr(), expr()}.

-spec values(expr()) -> [integer()].
values({val, X}) -> [X];
values({app, _Op, L, R}) -> values(L) ++ values(R). 

-spec eval(expr()) -> [integer()].
eval({val, I}) -> [I || I > 0];
eval({app, Op, Expr1, Expr2}) ->
	[apply_op(Op, V1, V2) || V1 <- eval(Expr1),
							V2 <- eval(Expr2),
							valid(Op,V1,V2)].

%solution({val,3}, [1,2,3], 3) = true
%solution({app, add, {val,1}，{val,2}}, [1,2,3], 3) = true
%solution({val,2}, [1,2,3],3) = false

%values({val, 2}) = [2]
%values({app, add, {val,1},{val,2}}) = [1,2]

%valid({app, add, {val, 1}, {val,2}}) = true
%valid({app, sub, {val,1},{val,2}}) = false

%eval({app, add, {val,1},{val,2}}) = 3
%eval({val, 1}) = 1

%solution()


-spec subs([A]) -> [[A]].
subs([]) -> [[]];
subs([H|T]) -> YSS = subs(T),
               YSS ++ [[H] ++ YS || YS <- YSS].

interleave(X, []) -> [[X]];
interleave(X, [H|T]) -> 
		[[X,H|T]| [[H|I] || I <- interleave(X, T)]].

perms([]) -> [[]];
perms([H|T]) -> 
		lists:append([interleave(H, XS) || XS <- perms(T)]).

perms2([]) -> [[]];
perms2(L)-> [[I|XS]||I <-L, XS<-perms2(L -- [I])].

-spec choices([A]) -> [[A]].
choices(L) ->
	%ists:append([perms(S) || S<-subs(L)]).
	[E || S <- subs(L), E <- perms(S)].

-spec solution(expr(), [integer()], integer()) -> boolean.
solution(E, NS, N) ->
	(eval(E) =:= [N]) and lists:member(values(E), choices(NS)).

%solutions([1,2],3)
%==> [{app, add, {val,1},{val,2}},
%     {app, add, {val,2},{val,1}}]

-spec split([A]) -> [{[A], [A]}].
split([]) -> [];
split([_]) -> [];
split([H|T]) -> [{[H],T}] ++ [ {[H|LS], RS}||{LS, RS} <-split(T)].


ops() -> [add, sub, mul, divi].
combine(L,R) -> [{app, O, L, R} || O<-ops()].

-spec exprs([integer()]) -> [expr()].
exprs([]) -> [];
exprs([X]) -> [{val, X}]; 
exprs(L) ->
	[E || {L1, L2} <- split(L),
		S1 <- exprs(L1),
		S2 <- exprs(L2),
		E  <- combine(S1,S2)].



-spec solutions([integer()], integer()) -> [expr()].
solutions(NS, N) -> [E || NS2 <- choices(NS),
							E <- exprs(NS2),
							eval(E) =:= [N]].

-type result():: {expr(), integer()}.

-spec results([integer()]) -> [result()].
results([]) -> [];
results([I]) -> [{{val, I},I} || I > 0];
results(NS) -> [Res || {LS,RS} <- split(NS),
						LX <- results(LS),
						RY <- results(RS),
						Res <- combine2(LX,RY)].

-spec combine2(result(), result()) -> [result()].
combine2({EL,X}, {ER,Y}) ->
			[{{app,O,EL,ER}, apply_op(O,X,Y)}
			|| O <- ops(),
			valid(O,X,Y)].


-spec solutions2([integer()], integer()) -> [expr()].
solutions2(NS,N) -> [E || NS2 <- choices(NS),
							{E,M} <- results(NS2),
							M =:= N].


valid3(add, X, Y) -> X =< Y;
valid3(sub, X, Y) -> X > Y;
valid3(mul, X, Y) -> X =< Y andalso X =/= 1 andalso Y =/= 1;
valid3(divi, X, Y) -> X rem Y =:= 0 andalso Y =/= 1.

-spec combine3(result(), result()) -> [result()].
combine3({EL,X}, {ER,Y}) ->
			[{{app,O,EL,ER}, apply_op(O,X,Y)}
			|| O <- ops(),
			valid3(O,X,Y)].

%% -spec results([integer()]) -> [result()].
results3([]) -> [];
results3([I]) -> [{{val, I},I} || I > 0];
results3(NS) -> [Res || {LS,RS} <- split(NS),
						LX <- results3(LS),
						RY <- results3(RS),
						Res <- combine3(LX,RY)].

%% -spec solutions2([integer()], integer()) -> [expr()].
solutions3(NS,N) -> [E || NS2 <- choices(NS),
							{E,M} <- results3(NS2),
							M =:= N].
