--1 Escreva uma função recursiva isBin :: String -> Bool para verificar se uma dada String representa um número binário, ou seja, contém apenas caracteres '0' ou '1'. As únicas funções pré-definidas autorizadas aqui são head e tail. 
isBin :: String -> Bool
isBin ""=False
isBin "0" = True
isBin "1" = True
isBin (x:xs)= if (x=='0' || x=='1') then isBin(xs) else False

--2 -Reescreva a função acima de forma não-recursiva. Dê outro nome para ela, por exemplo isBin'. Aqui você pode usar quaisquer funções auxiliares pré-definidas em Haskell.
isBin' :: String -> Bool
isBin' str = length(filter (`notElem` "01") str) ==0 && str/=""


-- 3 -Implemente a função auxBin2Dec de forma recursiva, para que bin2dec funcione corretamente, conforme os exemplos abaixo:
auxBin2Dec :: [Int] -> Int -> Int
auxBin2Dec [0] expn= 0
auxBin2Dec [1] expn= 1
auxBin2Dec (bits) expn
    |head bits==1 || head bits==0        =(2*head bits)^expn + (auxBin2Dec(tail bits) (expn) )
    |otherwise           =undefined

bin2dec :: [Int] -> Int
bin2dec [] = undefined
bin2dec bits = auxBin2Dec bits ((length bits)-1)

-- 4-Reescreva a função do exercício anterior de forma não-recursiva, usando funções pré-definidas em Haskell. Dê outro nome para a função (por exemplo, bin2dec').

--5 -Crie uma função recursiva dec2bin :: Int -> [Int] que receba um número inteiro positivo e retorne sua representação em binário, sob forma de uma lista de 0's e 1's. As funções auxiliares autorizadas aqui são mod, div e reverse. 

--Implemente uma dessas funções: isHex :: String -> Bool ou hex2dec :: String -> Int ou dec2hex :: Int -> String, que são semelhantes às dos exercícios anteriores, porém com números hexadecimais no lugar de números binários. Aqui está tudo liberado: você pode escolher qual das funções irá implementar, sem restrições sobre como deve fazer isso.
isHex :: String -> Bool
isHex "" = False
isHex strHex = length(filter(`notElem` "123456789ABCDEF") strHex) ==0 