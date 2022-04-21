perm(L, [H|R]) :- append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

is_ordered([_]).
is_ordered([H1, H2|T]) :- H1 =< H2, is_ordered([H2|T]).

perm_sort(L, R) :- perm(L, R), is_ordered(R), !.

minimum([], M, M).
minimum([H|T], MP, M) :- H < MP, !, minimum(T, H, M).
minimum([_|T], MP, M) :- minimum(T, MP, M).

min([H|T], R) :- minimum([H|T], H, R). 

delete1(X, [X|T], T) :- !. 
delete1(X, [H|T], [H|R]) :- delete1(X, T, R). 
delete1(_, [], []).

sel_sort(L, [M|R]):- min(L, M), delete1(M, L, L1), sel_sort(L1, R).
sel_sort([], []).

ins_sort([H|T], R) :- ins_sort(T, R1), insert_ord(H, R1, R).
ins_sort([], []).

insert_ord(X, [H|T], [H|R]) :- 
    X > H, !, 
    insert_ord(X, T, R).
insert_ord(X, T, [X|T]). 

bubble_sort(L, R) :- one_pass(L, R1, F), nonvar(F), !, bubble_sort(R1, R).
bubble_sort(L, L).

one_pass([H1, H2|T], [H2|R], F) :- H1 > H2, !, F = 1, one_pass([H1|T], R, F).
one_pass([H1|T], [H1|R], F) :- one_pass(T, R, F).
one_pass([], [] ,_).

partition(H, [X|T], [X|Sm], Lg) :- X < H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]) :- partition(H, T, Sm, Lg).
partition(_, [], [], []).

quick_sort([H|T], R) :- 
    partition(H, T, Sm, Lg), 
    quick_sort(Sm, SmS), 
    quick_sort(Lg, LgS), append(SmS, [H|LgS], R).
quick_sort([], []).

merge_sort(L, R) :- 
    split1(L, L1, L2), 
    merge_sort(L1, R1), 
    merge_sort(L2, R2), 
    merge(R1, R2, R).
merge_sort([H], [H]).
merge_sort([], []).

length1([],0).
length1([_|T], Len):- length1(T, Len1), Len is Len1 + 1.

split1(L, L1, L2) :- 
    length1(L, Len), 
    Len > 1, 
    K is Len/2, 
    splitK(L, K, L1, L2).
					
splitK([H|T], K, [H|L1], L2):- 
    K > 0, !, 
    K1 is K-1, 
    splitK(T, K1, L1, L2).
splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]):- 
	H1 < H2, !, 
    merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]):- merge([H1|T1], T2, R).
merge([], L, L).
merge(L, [], L).

% q5-1.
perm1(L, [H|R]):- delete2(H, L, Rest), perm1(Rest, R).
perm1([], []).

delete2(X, [X|T], T). 
delete2(X, [H|T], [H|R]) :- delete2(X, T, R). 

% q5-2.
maximum([], M, M).
maximum([H|T], MP, M) :- H > MP, !, maximum(T, H, M).
maximum([_|T], MP, M) :- maximum(T, MP, M).

max([H|T], M):- maximum([H|T], H, M).

sel_sort1(L, [M|R]):- max(L, M), delete2(M, L, L1), sel_sort1(L1, R).
sel_sort1([], []).

sel_sort1(L, R, Acc):-   
    max(L, M), 
    delete1(M, L, L1), 
    Acc1 = [M|Acc],
    sel_sort1(L1, R, Acc1).
sel_sort1([], Acc, Acc).			

% q5-3.
ins_sort_for([], L, L).
ins_sort_for([H|T], Acc, R) :- 
    insert_ord(H, Acc, PR),
    ins_sort_for(T, PR, R).
ins_sort1(L, R) :- ins_sort_for(L, [], R).

% q5-4.
bubble_sort1(L, R, K) :- 
    one_pass(L, R1, F),
    nonvar(F),
    NK is K - 1, !,
    bubble_sort1(R1, R, NK).
bubble_sort1(L, L, 0).
bubble_sort1(L, L, _).

bubble_wrap(L, R) :- length(L, K), bubble_sort1(L, R, K).

% p5-1.
part_char(H, [X|T], [X|Sm], Lg) :- char_code(X, XC), char_code(H, HC), XC < HC, !, part_char(H, T, Sm, Lg).
part_char(H, [X|T], Sm, [X|Lg]) :- part_char(H, T, Sm, Lg).
part_char(_, [], [], []).

quickiesort_char([H|T], R) :- 
    part_char(H, T, Sm, Lg), 
    quickiesort_char(Sm, SmS), 
    quickiesort_char(Lg, LgS), append(SmS, [H|LgS], R).
quickiesort_char([], []).

sort_chars(L,R) :- quickiesort_char(L,R).

% p5-2.
part_len(H, [X|T], [X|Sm], Lg) :- length(X, XL), length(H, HL), XL < HL, !, part_len(H, T, Sm, Lg).
part_len(H, [X|T], Sm, [X|Lg]) :- part_len(H, T, Sm, Lg).
part_len(_, [], [], []).

quickiesort_len([H|T], R) :- 
    part_len(H, T, Sm, Lg), 
    quickiesort_len(Sm, SmS), 
    quickiesort_len(Lg, LgS), append(SmS, [H|LgS], R).
quickiesort_len([], []).

sort_len(L,R) :- quickiesort_len(L,R).