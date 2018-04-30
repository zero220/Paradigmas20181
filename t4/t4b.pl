/*
 * João Vitor Azevedo da Costa
 * 
 * Olimpíada Brasileira de Informática – OBI2016 – Iniciação Nível 2 – Fase 1
 * 
 * Quadrados:
 * Uma série de diagramas com quadrados é construída usando palitos de fósforo, como mostrado na
figura abaixo.

Questão 1.
Quantos quadrados há no diagrama de número 4?
(A)10
(B)12
(C)13
(D)15
(E)16

Consulta:
a)?-quadrados(4, 10).
b)?-quadrados(4, 12).
c)?-quadrados(4, 13).
d)?-quadrados(4, 15).
e)?-quadrados(4, 16).

Questão 2.
Quantos quadrados há no diagrama de número 25?
(A)71
(B)75
(C)79
(D)97
(E)100

Consulta:
a)?-quadrados(25, 71).
b)?-quadrados(25, 75).
c)?-quadrados(25, 79).
d)?-quadrados(25, 97).
e)?-quadrados(25, 100).

Questão 4.
Quantos palitos de fósforo são necessários para construir o diagrama de número 11?
(A)124
(B)135
(C)140
(D)144
(E)154

Consulta:
a)?-palitos(11,124).
b)?-palitos(11,135).
c)?-palitos(11,140).
d)?-palitos(11,144).
e)?-palitos(11,154).
*/

quadrados(N, NQ):-
    NQ is (N*4)-3.

palitos(N, NP):-
    NP is 4 + 12*(N-1).


    