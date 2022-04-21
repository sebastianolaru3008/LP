gcd(X,X,X).
gcd(X,Y,Z):- X>Y, R is X-Y, gcd(R,Y,Z).
gcd(X,Y,Z):- X<Y, R is Y-X, gcd(X,R,Z). 

fact(0,1).
fact(N,F):-N>0, N1 is N-1, fact(N1,F1), F is F1*N.

fact1(0, FF, FF).
fact1(N, FP, FF):-N>0, N1 is N-1, FP1 is FP*N, fact1(N1, FP1, FF).

for(In,In,0):-!.
for(In,Out,I):-
    NewI is I-1,
    Intermediate is In + I,
    for(Intermediate,Out,NewI).

%3.1
lcm(X,Y,Lcm):-
    gcd(X,Y,Gcd), 
    Lcm is X*Y//Gcd. 

%3.2
powerB(_,0,1).
powerB(X,Y,Z):-
    Y>0,
    Y1 is Y-1,
    power(X,Y1,Z1),
    Z is Z1*X.

powerF(_1,0,_2,_2).
powerF(Base,Exp,Acc,Result):-
    Exp>0,
    Exp1 is Exp-1,
    Acc1 is Acc*Base, 
    powerF(Base,Exp1,Acc1,Result).

%3.3
fib2(0,1).                     
fib2(1,1).
fib2(N,R) :-
   N1 is N-1,
   N2 is N-2,
   fib2(N1,R1),
   fib2(N2,R2),
   R is R1+R2.

%3.4
fib1(0,1,_).
fib1(1,1,1).
fib1(N, R, LR) :-
    N > 1,
    N1 is N - 1,
    fib1(N1, LR, LR1),
    R is LR + LR1.

%3.5
triangle(X,Y,Z):-
    X+Y>Z,
    Y+Z>X,
    Z+X>Y.

%3.6
%solve quadratic equation ax^2+bx+c=0
delta(A, B, C, D):- D is B*B - 4*A*C.
solve(A,B,C,X):- 
    delta(A,B,C,D), 
    D>=0, 
    X is ((-1*B-sqrt(D))/2*A).
solve(A,B,C,X):- 
    delta(A,B,C,D), 
    D>=0, 
    X is ((-1*B+sqrt(D))/2*A).