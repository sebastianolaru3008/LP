%3.1
append([],[],L,L).
append([],[H2|T2],L,[H2|R]) :- append([],T2,L,R).
append([H1|T1],L1,L2,[H1|R]) :- append(T1,L1,L2,R).

%3.2
add_first(X,L,[X|L]).

%3.3
%sum all elements of a list with backwards recursion
sumB([],0).
sumB([H|T],S) :- sumB(T,S1), S is S1+H.

%sum all elements of a list with forwards recursion with accumulator
sumF([],S,S).
sumF([H|T],S,S1) :- S2 is S+H, sumF(T,S2,S1).

%3.4
%separate all even elements into a list and all odd ones into another
separate([],[],[]).
separate([H|T],[H|L1],L2) :- H mod 2 =:= 0, separate(T,L1,L2).
separate([H|T],L1,[H|L2]) :- H mod 2 =:= 1, separate(T,L1,L2).

%3.5
%remove duplicates of elements from a list keeping the last occurrence
remove_duplicates([],[]).
remove_duplicates([H|T],L) :- member(H,T), remove_duplicates(T,L).
remove_duplicates([H|T],[H|L]) :- not(member(H,T)), remove_duplicates(T,L).

%remove duplicates of elements from a list keeping the first occurrence (forwards recursion)
remove_duplicates_first([],A,A).
remove_duplicates_first([H|T],A,L) :- member(H,A), remove_duplicates_first(T,A,L).
remove_duplicates_first([H|T],A,L) :- not(member(H,A)), append(A,[H],A1), remove_duplicates_first(T,A1,L).


%3.6
%replace all occurrences of an element by another
replace_all(_,_,[],[]).
replace_all(X,Y,[H|T],[Y|L]) :- H =:= X, replace_all(X,Y,T,L).
replace_all(X,Y,[H|T],[H|L]) :- H =\= X, replace_all(X,Y,T,L).

%3.7
%drop every Nth element from a list
drop_k(L,C,R) :- drop_k(L,C,1,R).
drop_k([],_,_,[]).
drop_k([_|T],C,C,T1) :- drop_k(T,C,1,T1).
drop_k([H|T],N,C,[H|T1]) :- C<N, C1 is C+1, drop_k(T,N,C1,T1).







