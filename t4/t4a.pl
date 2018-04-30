/*João Vitor Azevedo da Costa
 * 
 * CD Independente
Uma banda formada por alunos e alunas da escola est ́a gravando um CD com exatamente sete m ́usicas
distintas – S, T, V, W, X, Y e Z. Cada m ́usica ocupa exatamente uma das sete faixas contidas no
CD. Algumas das m ́usicas s ̃ao sucessos antigos de rock; outras s ̃ao composi ̧c ̃oes da pr ́opria banda.  As
seguintes restri ̧c ̃oes devem ser obedecidas:
•
S ocupa a quarta faixa do CD.
•
Tanto W como Y precedem S no CD (ou seja, W e Y est ̃ao numa faixa que  ́e tocada antes de S
no CD).
•
T precede W no CD (ou seja, T est ́a numa faixa que  ́e tocada antes de W).
•
Um sucesso de rock ocupa a sexta faixa do CD.
•
Cada sucesso de rock  ́e imediatamente precedido no CD por uma composi ̧c ̃ao da banda (ou seja,
no CD cada sucesso de rock toca imediatamente ap ́os uma composi ̧c ̃ao da banda).
•
Z  ́e um sucesso de rock.
Quest ̃ao 11.
Qual das seguintes alternativas po-
deria ser a ordem das m ́usicas no CD, da primeira
para a s ́etima faixa?
(A)T, W, V, S, Y, X, Z
(B)V, Y, T, S, W, Z, X
(C)X, Y, W, S, T, Z, S
(D)Y, T, W, S, X, Z, V
(E)Z, T, X, W, V, Y, S

Consulta:
a)?-faixas([t,w,v,s,y,x,z).
b)?-faixas([v,y,t,s,w,z,x]).
c)?-faixas([x,y,w,s,t,z,s]).
d)?-faixas([y,t,w,s,x,z,v]).
e)?-faixas([z,t,x,w,v,y,s]).
*/
regra1(E) :-
    E = [_,_,_,s,_,_,_].

regra2(E) :-
    nth0(Xw, E, w),
    nth0(Xy, E, y),
    Xw<3,
    Xy<3.
    
regra3(E) :-
    nextto(t,w, E).

sucesso(z,_).

regra4(E) :-
    sucesso(X, E),
    E = [_,_,_,_,_,X,_].


faixas(E) :-
   Faixas = [w,y,t,s,x,v,z],
   E = [_,_,_,_,_,_,_],
   permutation(Faixas, E),
   regra1(E),
   regra2(E),
   regra3(E),
   regra4(E).