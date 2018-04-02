isBin :: String -> Bool
isBin ""=False
isBin "0" = True
isBin "1" = True
isBin (x:xs)= if (x=='0' || x=='1') then isBin(xs) else False

isBin' :: String -> Bool
isBin' str = length(filter (`notElem` "01") str) ==0 && str/=""

auxBin2Dec :: [Int] -> Int -> Int
auxBin2Dec [0] expn= 0
auxBin2Dec [1] expn= 1
auxBin2Dec (bits) expn
    |head bits==1 || head bits==0        =(2*head bits)^expn + (auxBin2Dec(tail bits) (expn) )
    |otherwise           =1

bin2dec :: [Int] -> Int
bin2dec [] = undefined
bin2dec bits = auxBin2Dec bits ((length bits)-1)