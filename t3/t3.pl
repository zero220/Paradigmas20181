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
 L1 = [H1|_],
 L2 = [H2|_],
 L3 is H1*H2.

%regra criada para invers�o de listas
inverte([], []).
inverte([H|T], L) :-
 inverte(T, X),
 append(X, [H], L).


potencias(1 , [1]).
potencias(N , L) :-
     N>0,
     N1 is N - 1,
     potN0(N1, L1),
     inverte(L1, L).


positivo1(N1,N2) :-
 N1<1,
 N2 is -1.
positivo1(N1,N2) :-
 N1>0,
 N2 is N1.

positivos([], []).
positivos(L1,L2) :-
 L1 = [H|T],
 positivos(T, LB),
 positivo1(H, N),
 LC = [N|LB],
 delete(LC, -1, L2).

mesmaPosicao(_,[],[]).
mesmaPosicao(A,L1,L2) :-
 nth0(N1,L1,A),
 nth0(N2,L2,A),
 N1 =:= N2.
