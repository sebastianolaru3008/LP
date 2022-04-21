% q9-1
append(V,L,L):-var(V), !.
append([H|T],L2,[H|L3]):-append(T,L2,L3).

% q9-2
reverse(V, V):- var(V), !.
reverse([H|T], R) :- reverse(T, Rcoada), append(Rcoada, [H|_], R).

% q9-3
complete(L,[]):-var(L),!.
complete([H|T],[H|L]):-complete(T,L).

% q9-4
% preorder on tree

tree1(t(6, t(4, t(2, _, _), t(5, _, _)), t(9, t(7, _, _), _))).
tree2(t(8, t(5, _, t(7, _, _)), t(9, _, t(11, _, _)))).

preorder(V, _):-var(V), !. 
preorder(t(K,L,R), List):-
    preorder(L,LL), preorder(R, LR),
    append([K|LL], LR, List).

% q9-5
% height of tree
height(V, 0):-var(V), !.
height(t(_,L,R), H):-
    height(L, HL), height(R, HR),
    H is max(HL, HR) + 1.

% q9-5

complete_tree(V, nil):-var(V), !.
complete_tree(t(K,L,R), t(K,L1,R1)):-
    complete_tree(L, L1), complete_tree(R, R1).

% p9-1
%flaten an incomplete list
flat_il(V,V):-var(V), !.
flat_il([H|T], [H|R]):- atomic(H), !, flat_il(T,R).
flat_il([H|T], R):- flat_il(H,R1), flat_il(T,R2), append(R1,R2,R).

% p9-2
%diameter of a tree
diameter(V, 0):-var(V), !.
diameter(t(_,L,R), D):-
    diameter(L, DL), diameter(R, DR),
    height(L, HL), height(R, HR),
    D is max(max(DL, DR), HL + HR + 2).

% p9-3
%verify if list is a sublist of aan incomplete list
subl_il(V, _):-var(V), !.
subl_il([], _).
subl_il(_, V):-var(V), !, fail.
subl_il([H|T], [H|R]):- subl_il_helper(T, R), !.
subl_il([H|T], [_|R]):- subl_il([H|T], R).

subl_il_helper(V, _):- var(V), !.
subl_il_helper([H|T], [H|T2]):- subl_il_helper(T,T2).

