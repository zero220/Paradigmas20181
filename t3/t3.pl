%Nome: Jo�o Vitor Azevedo da Costa
%Matricula: 201620767
%Aquecimento
repete(0, _, []).
repete(N, C, L) :-
 N > 0,
 L = [C | T],
 N1 is N - 1,
 repete(N1, C, T).

% 1 - Defina um predicado zeroInit(L) que � verdadeiro se L for uma lista
% que inicia com o n�mero 0 (zero).
zeroInit(L) :-
    [H|_] = L,
    H =:= 0.

% 2 - Defina um predicado has5(L) que � verdadeiro se L for uma lista de
% 5 elementos. Resolva este exerc�cio sem usar um predicado auxiliar.
has5(L) :-
    L=[_,_,_,_,_].

% 3 - Defina um predicado hasN(L,N) que � verdadeiro se L for uma lista
% de N elementos.
hasN(L, N) :-
    length(L, X),
    X =:= N.

% 4 - Defina um predicado potN0(N,L), de forma que L seja uma lista de
% pot�ncias de 2, com expoentes de N a 0.
potN0(0, [1]).
potN0(N,L) :-
    N>0,
    N1 is N - 1,
    pow(2,N,X),
    L = [X|T],
    potN0(N1,T).

%5 - Defina um predicado zipmult(L1,L2,L3), de forma que cada elemento da lista L3 seja o produto dos elementos de L1 e L2 na mesma posi��o do elemento de L3.
zipmult([],[],[]).
zipmult(L1, L2, L3) :-
 length(L1, N1),
 length(L2, N2),
 N1 > 0,
 N1 =:= N2,
 L1 = [H1|_],
 L2 = [H2|_],
 L3 is H1*H2.

% 6 - Defina um predicado potencias(N,L), de forma que L seja uma lista
% com as N primeiras pot�ncias de 2, sendo a primeira 2^0 e assim por
% diante. regra criada para invers�o de listas
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

% 7 - Defina um predicado positivos(L1,L2), de forma que L2 seja uma
% lista s� com os elementos positivos de L1.
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

% 8 - Considere que L1 e L2 sejam permuta��es de uma lista de elementos
% distintos, sem repeti��es. Sabendo disso, defina um predicado
% mesmaPosicao(A,L1,L2) para verificar se um elemento A est� na mesma
% posi��o nas listas L1 e L2.
mesmaPosicao(_,[],[]).
mesmaPosicao(A,L1,L2) :-
 nth0(N1,L1,A),
 nth0(N2,L2,A),
 N1 =:= N2.

% 9 - Dada uma lista de N alunos, deseja-se escolher NP alunos (NP < N)
% para formar uma comiss�o. Para isso, defina um predicado
% comissao(NP,LP,C), que permita gerar as poss�veis combina��es C com NP
% elementos da lista LP.

% 10 - Tem-se N azulejos 10cm x 10cm e, com eles, deve-se montar um
% conjunto de quadrados de modo a utilizar todos os azulejos dados, sem
% sobrep�-los. Inicialmente, deve-se montar o maior quadrado poss�vel;
% ent�o, com os azulejos que sobraram, deve-se montar o maior quadrado
% poss�vel, e assim sucessivamente. Por exemplo, se forem dados 31
% azulejos, o conjunto montado ter� 4 quadrados. Para resolver este
% problema, voc� dever� definir um predicado azulejos(NA, NQ), de forma
% que NQ seja o n�mero de quadrados que se deve montar com NA azulejos.
