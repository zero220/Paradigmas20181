isBin :: String -> Bool
isBin ""=False
isBin "0" = True
isBin "1" = True
isBin (x:xs)= if (x=='0' || x=='1') then isBin(xs) else False

isBin' :: String -> Bool
isBin' str = length(filter (`notElem` "01") str) ==0 && str/=""
