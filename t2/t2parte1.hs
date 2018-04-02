--Exercícios feitos em aula

geraTabela :: Int -> [(Int,Int)]
geraTabela 0 = []
geraTabela num1 = (num1,num1^2) : (geraTabela (num1 -1))

contido :: Char -> String -> Bool
contido chr1 "" = False
contido chr1 (x:xs)
    |chr1 == x        =True
    |otherwise        =contido chr1 xs

translate :: [(Float, Float)] -> [(Float, Float)]
translate [] = []
translate x = (\(n1,n2) -> (n1+2,n2+2)) (head x) : translate(tail x)

geraTabela' :: Int -> [(Int, Int)]
geraTabela' 0 = []
geraTabela' x = geraTabela' (x-1) ++ [(x, x^2)]