module SolucionT1 where

-- Ejercicio 1
mayorSumaPosicionPares :: Integer -> Integer -> Integer
mayorSumaPosicionPares n m
    | sumaPosicionPares n >= sumaPosicionPares m = n
    | otherwise = m

-- Devuelve la suma de las posiciones pares
sumaPosicionPares :: Integer -> Integer
sumaPosicionPares n = aux n 1
    where
        aux :: Integer -> Integer -> Integer
        aux 0 _ = 0
        aux n i
            | i `mod` 2 == 0 = n `mod` 10 + aux (n `div` 10) (i + 1)
            | otherwise = aux (n `div` 10) (i + 1)

-- Ejercicio 2
productosAReponer :: [(String, Integer, Integer)] -> Integer -> [(String, Integer)]
productosAReponer [] _ = []
productosAReponer ((producto, codigo, disponibilidad):xs) cantidad
    | disponibilidad < cantidad = (producto, codigo) : productosAReponer xs cantidad
    | otherwise = productosAReponer xs cantidad

-- Ejercicio 3
hayColumnaSumaCero :: [[Integer]] -> Bool
hayColumnaSumaCero matriz = aux matriz (cantidadDeColumnas matriz)
    where
        aux :: [[Integer]] -> Integer -> Bool
        aux matriz n
            | n == 0 = False
            | sumaColumnaN matriz n == 0 = True
            | otherwise = aux matriz (n - 1)

-- Devuelve la cantidad de columnas de una matriz
cantidadDeColumnas :: [[Integer]] -> Integer
cantidadDeColumnas (fila:fs) = longitud fila

-- Devuelve la longitud de una lista de de tipo 't'
longitud :: (Eq t) => [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

-- Devuelve la suma de los elementos de la columna N de una matriz
sumaColumnaN :: [[Integer]] -> Integer -> Integer
sumaColumnaN [] _ = 0
sumaColumnaN (fila:fs) n = elementoN fila n + sumaColumnaN fs n

-- Devuelve el elemento N partiendo desde el 1
elementoN :: [Integer] -> Integer -> Integer
elementoN fila n = aux fila n 1
    where
        aux :: [Integer] -> Integer -> Integer -> Integer
        aux (x:xs) n i
            | n == i = x
            | otherwise = aux xs n (i + 1)

-- Ejercicio 4
primerosKNumerosAritmeticos :: Integer -> [Integer]
primerosKNumerosAritmeticos k = aux k 1
    where
        aux :: Integer -> Integer -> [Integer]
        aux k i
            | k == 0 = []
            | esNumeroAritmetico i = i : aux (k - 1) (i + 1)
            | otherwise = aux k (i + 1)

-- True si es numero aritmetico, False en caso contrario
esNumeroAritmetico :: Integer -> Bool
esNumeroAritmetico n = promedioEsEntero (listaDivisoresN n)

-- True si el promedio de una lista es un numero entero, False en caso contrario
promedioEsEntero :: [Integer] -> Bool
promedioEsEntero lista = sumatoria lista `mod` (longitud lista) == 0

-- Devuelve la suma de todos los elementos de una lista
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

-- Devuelve la lista de todos los divisores de un numero N
listaDivisoresN :: Integer -> [Integer]
listaDivisoresN n = aux n n
    where
        aux :: Integer -> Integer -> [Integer]
        aux n i
            | i == 0 = []
            | n `mod` i == 0 = i : aux n (i - 1)
            | otherwise = aux n (i - 1)