repete(0, _, []).
repete(N, C, L) :-
 N > 0,
 L = [C | T],
 N1 is N - 1,
 repete(N1, C, T).

zeroInit(L) :-
    [H|_] = L,
    H =:= 0.

has5(L) :-
    L=[_,_,_,_,_].

hasN(L, N) :-
    length(L, X),
    X =:= N.

potN0(0, [1]).
potN0(N,L) :-
    N>0,
    N1 is N - 1,
    pow(2,N,X),
    L = [X|T],
    potN0(N1,T).

zipmult([],[],[]).
zipmult(L1, L2, L3) :-
 length(L1, N1),
 length(L2, N2),
 N1 > 0,
 N1 =:= N2,
 L1 = [H1|T1],
 L2 = [H2|T2],
 H3 is H1*H2,
 L3 = [H3|T3],
 zipmult(T1, T2, T3).
