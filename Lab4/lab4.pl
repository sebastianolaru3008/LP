%3.1
%intesection between 2 lists
inters([], _, []).
inters([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inters(T1, L2, Res), !.

inters([_|T1], L2, Res) :-
    inters(T1, L2, Res).

    

%3.2
%difference between 2 lists
difference([], _, []).
difference([H1|T1], L2, [H1|Res]) :-
    \+ member(H1, L2), !,
    difference(T1, L2, Res).
difference([_|T1], L2, Res) :-
    difference(T1, L2, Res).

%3.3

delete_all(X, [X|T], R) :- delete_all(X, T, R). 
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).
delete_all(_, [], []).


min([H|T], M) :- min(T, M), M<H, !.
min([H|_], H).


del_min(L,R) :-
    min(L,M),
    delete_all(M,L,R),
    !.

max([H|T], M) :- max(T, M), M>H, !.
max([H|_], H).

del_max(L,R) :-
    max(L,M),
    delete_all(M,L,R),
    !.

%3.4
%reverse from the kth element onwards using reverse

reverse([], []).
reverse([H|T], R) :- reverse(T, Rcoada), append(Rcoada, [H], R).

reverse_k(L, K, R) :-
    reverse_k(L, K, [], R).
    
reverse_k([H|T], K, Acc, R) :-
    K>0,
    K1 is K-1,
    append(Acc, [H], Acc1),
    reverse_k(T, K1, Acc1, R), !.
reverse_k(L, 0, Acc, R) :-
    reverse(L,Rev),
    append(Acc, Rev, R), !.

%3.5
%run length encode a list

% rle_encode([1, 1, 1, 2, 3, 3, 1, 1], R).
% R = [[1, 3], [2, 1], [3, 2], [1, 2]] ;


rle_encode([H|T], R) :-
    rle_encode(T, R, H, 1).

rle_encode([], [[Elem,Count]], Elem, Count).
rle_encode([H|T], R, H, Count) :-
    Count1 is Count+1,
    rle_encode(T, R, H, Count1).
rle_encode([H|T], R, Elem, Count) :-
    H\=Elem,
    append([[Elem, Count]], R1, R),
    rle_encode(T, R1, H, 1).

%3.6
% rotate right a list by k elements

rotate_right(L, K, R):-
    append(R1, R2, L),
    length(R1, K),
    !,
    append(R2, R1, R).

%3.7
%select k elements randomly from a list
rnd_select([], _, []).
    




















