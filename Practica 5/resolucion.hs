-- Ejercicio 1
-- 1)
longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- 2)
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

-- 3)
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

-- 4)
reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso xs = ultimo xs : reverso (principio xs)

-- Ejercicio 2
-- 1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = n == x || pertenece n xs

-- 2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)

-- 3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:y:xs) = x /= y && todosDistintos (y:xs)

-- 4)
hayRepetidos :: (Eq t) => [t]-> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = x `pertenece` xs || hayRepetidos xs

-- 5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs)
    | n == x = xs
    | n /= x = x : quitar n xs

-- 6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs)
    | n == x = quitarTodos n xs
    | n /= x = x :quitarTodos n xs

-- 7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

-- 8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos n m = comparar (eliminarRepetidos n) (eliminarRepetidos m)

comparar :: (Eq t) => [t] -> [t] -> Bool
comparar [] [] = True
comparar _ [] = False
comparar [] _ = False
comparar (x:xs) ys = x `pertenece` ys && comparar xs (quitar x ys)
-- comparar (x:xs) ys
--     | x `pertenece` ys = comparar xs (quitar x ys)
--     | otherwise = False

-- 9)
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) = x == ultimo xs && capicua (principio xs)

-- Ejercicio 3
-- 1)
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

-- 2)
productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs

-- 3)
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs)
    | x `esMayor` xs = x
    | otherwise = maximo xs

esMayor :: Integer -> [Integer] -> Bool
esMayor _ [] = True
esMayor n (x:xs) = n > x && esMayor n xs

-- 4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [n + x]
sumarN n (x:xs) = n + x : sumarN n xs

-- 5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- 6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo x = sumarN (ultimo x) x

-- 7)
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | even x = x : pares xs
    | otherwise = pares xs

-- 8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
    | x `esMultiploDe` n = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n m
    | m == 0 = False
    | n < 0 = False
    | n == 0 = True
    | n > 0 = esMultiploDe (n - m) m

-- 9)
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs)
    | x `esMenor` xs = x
    | otherwise = minimo xs

esMenor :: Integer -> [Integer] -> Bool
esMenor _ [] = True
esMenor n (x:xs) = n < x && esMenor n xs

-- Ejercicio 4
-- a)
-- Funciones para normalizar strings
normalizar :: [Char] -> [Char]
normalizar str = quitarPrincipio (quitarFin (sacarBlancosRepetidos str))

quitarPrincipio :: [Char] -> [Char]
quitarPrincipio (x:xs)
    | x == ' ' = quitarPrincipio xs
    | otherwise = x:xs

quitarFin :: [Char] -> [Char]
quitarFin str = reverso (quitarPrincipio (reverso str))
-- Funciones para normalizar strings

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs)
    | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
    | otherwise = x : sacarBlancosRepetidos (y:xs)

-- b)
contarPalabras :: [Char] -> Integer
contarPalabras str = contar (normalizar str)

contar :: [Char] -> Integer
contar [] = 1
contar (x:xs)
    | x == ' ' = 1 + contar xs
    | otherwise = contar xs