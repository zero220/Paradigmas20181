import Data.Char
--1 Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.
isVowel :: Char -> Bool
isVowel chara = length(filter (`elem` [chara]) "aeiou") >0

--2  Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.
addComma :: [String] -> [String]
addComma listr = map (++ ",") listr

--3Crie uma função htmlListItems :: [String] -> [String], que receba uma lista de strings e retorne outra lista contendo as strings formatadas como itens de lista em HTML. Resolva este exercício COM e SEM funções anônimas (lambda).
addLI :: String -> String
addLI xs = "<LI>" ++ xs

closeLI :: String -> String
closeLI ys = ys ++ "</LI>"

htmlListItems :: [String] -> [String]
htmlListItems listr2 = map(addLI) (map (closeLI) listr2)

--Função com Lambda
--htmlListItems :: [String] -> [String]
--htmlListItems listr2 = map(\xs ->"<LI>" ++ xs) (map (++"</LI>") listr2)

--4  Defina uma função que receba uma string e produza outra retirando as vogais, conforme os exemplos abaixo. Resolva este exercício COM e SEM funções anônimas (lambda).
semVogais :: String -> String
semVogais strv = filter (`notElem` "aeiou") strv

--Não foi preciso criar uma função, devido a utilização  do filtro

--5  Defina uma função que receba uma string, possivelmente contendo espaços, e que retorne outra string substituindo os demais caracteres por '-', mas mantendo os espaços. Resolva este exercício COM e SEM funções anônimas (lambda). 
codeword :: Char -> Char
codeword charb = if charb==' 'then ' ' else '-'

codifica :: String -> String
codifica cdstr = map(codeword) cdstr

--função com Lambda
--codifica :: String -> String
--codifica cdstr = map (\xs -> if (xs==' ') then ' ' else '-') cdstr

--6  Escreva uma função firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome. Dica: estude funções pré-definidas em Haskell (List operations -> Sublists) em http://hackage.haskell.org/package/base-4.10.1.0/docs/Prelude.html#g:18.
firstName :: String -> String
firstName strname = takeWhile (/=' ') strname

--7  Escreva uma função isInt :: String -> Bool que verifique se uma dada string só contém dígitos de 0 a 9. 
isInt :: String -> Bool
isInt strint = (length(filter (`notElem` "1234567890") strint)) == 0

--8  Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome. 
lastName :: String -> String
lastName string1ro = if (length(filter(`elem` " ") string1ro)==1) 
    then drop 1 (dropWhile (/=' ') string1ro) 
    else 
      if (length(filter(`elem` " ") string1ro)==0) 
      then string1ro 
      else lastName (drop 1 (dropWhile (/=' ') string1ro))
      
--9  Escreva uma função userName :: String -> String que, dado o nome completo de uma pessoa, crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas. Dica: estude as funções pré-definidas no módulo Data.Char, para manipulação de maiúsculas e minúsculas. Você precisará carregar este módulo usando import Data.Char no interpretador ou no início do arquivo do programa.
userName :: String -> String
userName userstr = map (toLower) ((take 1 userstr) ++ lastName userstr)

--10  Escreva uma função encodeName :: String -> String que substitua vogais em uma string, conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.
encodeChar1 :: Char -> Char
encodeChar1 charc
          |charc=='a' || charc=='A'  ='4'
          |charc=='e' || charc=='E' ='3'
          |charc=='i' || charc=='I' ='2'
          |charc=='o' || charc=='O' ='1'
          |charc=='u' || charc=='U' ='0'
          |otherwise = charc

encodeName :: String -> String
encodeName codingStr = map (encodeChar1) codingStr

--11  Escreva uma função betterEncodeName :: String -> String que substitua vogais em uma string, conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00.
encodeChar2 :: Char -> Char
encodeChar2 charc
          |charc=='a' || charc=='A'  ='4'
          |charc=='e' || charc=='E' ='3'
          |charc=='i' || charc=='I' ='1'
          |charc=='o' || charc=='O' ='0'
          |charc=='u' || charc=='U' ='0'
          |otherwise = charc

doubleU :: String -> String
doubleU stringU = if (length(filter(`elem` "uU") stringU)==1)
    then (takeWhile(/='u') stringU) ++ "u" ++ (dropWhile(/='u') stringU)
    else 
          if (length(filter(`elem` "uU") stringU)==0)
          then stringU
          else doubleU(take (div (length(stringU)) 2) stringU) ++ doubleU(drop (div (length(stringU)) 2) stringU)

doubleU2 :: String -> String
doubleU2 stringU2 = if (length(filter(`elem` "U") stringU2)==1)
    then (takeWhile(/='U') stringU2) ++ "u" ++ (dropWhile(/='U') stringU2)
    else 
          if (length(filter(`elem` "U") stringU2)==0)
          then stringU2
          else doubleU2(take (div (length(stringU2)) 2) stringU2) ++ doubleU2(drop (div (length(stringU2)) 2) stringU2)

betterEncodeName :: String -> String
betterEncodeName betterStr = map (encodeChar2) (doubleU2(doubleU betterStr))

--12  Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas, strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres.
addDot :: String -> String
addDot stringDot = if(length(stringDot)>10)
    then take 10 stringDot
    else if(length(stringDot)<10)
        then addDot (stringDot ++ ".")
        else stringDot

tenCharString :: [String] -> [String]
tenCharString listr3 = map addDot listr3