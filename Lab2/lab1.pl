%women
woman(ana). 
woman(sara).
woman(ema).
woman(maria).
woman(carmen).
woman(irina).
woman(dorina).
%men
man(andrei).
man(george).
man(alex).
man(mihai).
man(marius).
man(sergiu).
%parrents
parent(maria, ana). % maria is ana’s parent
parent(george,ana). % george also is ana’s parent
parent(maria,andrei).
parent(george,andrei).
parent(carmen,sara).
parent(carmen,ema).
parent(alex,ema).
parent(alex,sara).
parent(irina,george).
parent(irina,carmen).
parent(mihai,carmen).
parent(mihai,george).
parent(dorina,maria).
parent(marius,maria).

%mother has to be a woman and to be a parent of someone
mother(X,Y):-woman(X), parent(X,Y).

%mother has to be a woman and to be a parent of someone
father(X,Y):-man(X), parent(X,Y).


sibling(X,Y):-father(T,X), father(T,X), mother(M,X), mother(M,Y), X\=Y, M\=T.

%
brother(X,Y) :- man(X), sibling(X,Y).

% 
sister(X, Y) :- woman(X), sibling(X,Y).

%
aunt(X,Y) :- sister(X,_), parent(_,Y).

uncle(X,Y) :- brother(X,_), parent(_,Y).

grandmother(X,Y) :- mother(X,_), mother(_,Y).

grandfather(X,Y) :- father(X,_), father(_,Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, _), ancestor(_, Y).