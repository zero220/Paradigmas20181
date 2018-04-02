isBin :: String -> Bool
isBin ""=False
isBin "0" = True
isBin "1" = True
isBin (x:xs)= if (x=='0' || x=='1') then isBin(xs) else False

isBin' :: String -> Bool
isBin' str = length(filter (`notElem` "01") str) ==0 && str/=""

auxBin2Dec :: Int -> Int -> Int
auxBin2Dec num expn = num ^ expn

bin2dec :: [Int] -> Int
bin2dec [] =undefined
bin2dec [1] = 1
bin2dec [0] = 0
bin2dec (x:xs)
     |x==1 || x==0        =auxBin2Dec (2*x) (length(xs)) + bin2dec(xs)
     |otherwise           =undefined