maximum([], M, M).
maximum([H|T], MP, M) :- H > MP, !, maximum(T, H, M).
maximum([_|T], MP, M) :- maximum(T, MP, M).

depth([],1).
depth([H|T],R):- atomic(H), !, depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, maximum(R3,R2,R).

flatten([],[]).
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append(R1,R2,R).

heads([],[],_).
heads([H|T],[H|R],1):- atomic(H), !, heads(T,R,0).
heads([H|T],R,0):- atomic(H), !, heads(T,R,0).
heads([H|T],R,_):- heads(H,R1,1), heads(T,R2,0), append(R1,R2,R).
heads_pretty(L,R):- heads(L, R, 1).

member1(H,[H|_]).
member1(X,[H|_]):-member1(X,H).
member1(X,[_|T]):-member1(X,T).

member2(X,L):- flatten(L,L1), member(X,L1).

% 7.3.1
count_atomic(L,R) :- flatten(L,L1), length(L1,R).

% 7.3.2
sum_atomic([], 0).
sum_atomic([H|T], R) :- atomic(H), !, sum_atomic(T, R1), R is R1+H.
sum_atomic([H|T], R) :- sum_atomic(H,R1), sum_atomic(T, R2), R is R1+R2.

% 7.3.3
member3(H,[H|_]).
member3(X,[H|_]):-member3(X,H).
member3(X,[_|T]):-member3(X,T), !.

% 7.4.1
getLastAtomic([],[]).
getLastAtomic([A], [A]):-atomic(A), !.
getLastAtomic([H|T],R):- atomic(H), !, getLastAtomic(T,R).
getLastAtomic([H|T],R):- getLastAtomic(H,R1), getLastAtomic(T,R2), append(R1,R2,R).

% 7.4.2
replace_all(_,_,[],[]).
replace_all(X,Y,[H|T],[Y|L]) :-  H == X, !, replace_all(X,Y,T,L).
replace_all(X,Y,[H|T],[H|L]) :-  atomic(H), H \== X, !, replace_all(X,Y,T,L).
replace_all(X,Y,[H|T],L) :- replace_all(X,Y,H,R1), replace_all(X,Y,T,R2), !, append([R1],R2,L).

% 7.4.3
part_dep(H, [X|T], [X|Sm], Lg) :- depth(X, XD), depth(H, HD), XD < HD, !, part_dep(H, T, Sm, Lg).
part_dep(H, [X|T], Sm, [X|Lg]) :- part_dep(H, T, Sm, Lg).
part_dep(_, [], [], []).

quickiesort_dep([H|T], R) :- 
    part_dep(H, T, Sm, Lg), 
    quickiesort_dep(Sm, SmS), 
    quickiesort_dep(Lg, LgS), append(SmS, [H|LgS], R).
quickiesort_dep([], []).

sort_dep(L,R) :- quickiesort_dep(L,R).






