% 10.4.1
% convert an incommplete list into a difference list
convert_il_to_dl(X, LS, LE) :-
    var(X),
    !,
    LS = LE.
convert_il_to_dl([X|T], [X|LS], LE) :-
    convert_il_to_dl(T, LS, LE).

convert_dl_to_il(LS, LS, _):-
    var(LS),
    !.
convert_dl_to_il([X|LS], LE, [X|T]) :-
    convert_dl_to_il(LS, LE, T).

% 10.4.2

convert_cl_to_dl([], LS, LS):-!.
convert_cl_to_dl([X|T], [X|LS], LE) :-
    convert_cl_to_dl(T, LS, LE).

convert_dl_to_cl(LS, LS, []):-
    var(LS),
    !.
convert_dl_to_cl([X|LS], LE, [X|T]) :-
    convert_dl_to_cl(LS, LE, T).

% 10.4.3
%all decompositions of a list
all_decompositions(L, _):- 
    append(L1,L2, L),
    assert(p([L1,L2])),
    fail.
all_decompositions(_, R):-
    collect_decomp(R).

collect_decomp([L|R]):-
    retract(p(L)),
    !,
    collect_decomp(R).
collect_decomp([]).

% 10.4.3
%flatten a deep list using difference lists
flatten([],LS, LS):- var(LS).
flatten([H|T], [H|RS], RE):- 
    atomic(H), 
    !, 
    flatten(T, RS, RE).
flatten([H|T], RS, RE):- 
    flatten(H,RS1, RE1), 
    flatten(T,RS2, RE2), 
    RS = RS1,
    RE1 = RS2,
    RE = RE2.

% 10.4.4
% collect all even keys in a binary tree using difference lists
collect_even_keys(nil, LS, LS):- var(LS).
collect_even_keys(t(K,L,R), LS, RE):-
    K mod 2 =:= 0,
    !,
    collect_even_keys(L, LS1, RE1),
    collect_even_keys(R, LS2, RE2),
    LS = LS1,
    RE1 = [K|LS2],
    RE = RE2.
collect_even_keys(t(K,L,R), LS, RE):-
    collect_even_keys(L, LS1, RE1),
    collect_even_keys(R, LS2, RE2),
    LS = LS1,
    RE1 = LS2,
    RE = RE2.

% 10.4.5





tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))).








    