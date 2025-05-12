-- Ejercicio 1
fibonacci :: Integer -> Integer
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | n > 1 = fibonacci (n - 1) + fibonacci (n - 2)

-- Ejercicio 2
parteEntera :: Float -> Int
parteEntera x
    | 0 <= x && x < 1 = 0
    | otherwise = 1 + parteEntera (x - 1)

-- Ejercicio 3
esDivisible :: Integer -> Integer -> Bool
esDivisible a b
    | a < 0 = False
    | a == 0 = True
    | a > 0 = esDivisible (a - b) b

-- Ejercicio 4
sumaImpares :: Integer -> Integer
sumaImpares n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = (2 * n - 1) + sumaImpares (n - 1)

-- Ejercicio 5
medioFact :: Int -> Int
medioFact n
    | n == 0 = 1
    | n == 1 = 1
    | otherwise = n * medioFact (n - 2)

-- Ejercicio 6
todosDigitosIguales :: Int -> Bool
todosDigitosIguales n
    | n `div` 10 == 0 = True
    | n `mod` 10 /= (n `div` 10) `mod` 10 = False
    | otherwise = todosDigitosIguales (n `div` 10)

-- Ejercicio 7
iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = mod (n `div` 10 ^ (cantDigitos n - i)) 10

cantDigitos :: Int -> Int
cantDigitos n
    | n `div` 10 == 0 = 1
    | otherwise = 1 + cantDigitos (n `div` 10)

-- Ejercicio 8
sumaDigitos :: Int -> Int
sumaDigitos n
    | n == 0 = 0
    | otherwise = mod n 10 + sumaDigitos (n `div` 10)

-- Ejercicio 9
esCapicua :: Int -> Bool
esCapicua n
    | cantDigitos n == 1 = True     
    | primero /= ultimo = False
    | otherwise = esCapicua (quitarExtremos n)
    where
        primero = iesimoDigito n 1
        ultimo = n `mod` 10

quitarExtremos :: Int -> Int
quitarExtremos n = sinUltimoDigito - primerDigito * (10 ^ (cantDigitos n - 2))
    where
        sinUltimoDigito = n `div` 10
        primerDigito = n `div` (10 ^ (cantDigitos n - 1))

-- Ejercicio 10
-- a)
f1 :: Integer -> Integer
f1 i
    | i == 0 = 1
    | otherwise = 2 ^ i + f1 (i - 1)

-- b)
f2 :: Integer -> Double -> Double
f2 i q
    | i == 1 = q
    | otherwise = q ^ i + f2 (i - 1) q

-- c)
f3 :: Integer -> Double -> Double
f3 i q
    | i == 1 = (q ^ 2) + q
    | otherwise = q ^ (2 * i) + q ^ ((2 * i) - 1) + f3 (i - 1) q

f4 :: Integer -> Double -> Double
f4 i q = f3 i q - f2 i q

-- Ejercicio 11
-- a) 
eAprox :: Integer -> Float
eAprox n
    | n == 0 = 1
    | otherwise = 1 / fromIntegral (factorial n) + eAprox (n - 1)

factorial :: Integer -> Integer
factorial n
    | n == 0 = 1
    | otherwise = n * factorial (n - 1)

-- b)
e :: Float
e = eAprox 10

-- Ejercicio 12
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = a n - 1

a :: Integer -> Float
a n
    | n == 1 = 2
    | otherwise = 2 + 1 / a (n - 1)

-- Ejercicio 13
f :: Integer -> Integer -> Integer
f n m
    | n == 1 = sumaInterna n m
    | otherwise = sumaInterna n m + f (n - 1) m

sumaInterna :: Integer -> Integer -> Integer
sumaInterna n m
    | m == 1 = n
    | otherwise = (n ^ m) + sumaInterna n (m - 1)

-- Ejercicio 14
sumaPotencias :: Integer ->Integer -> Integer -> Integer
sumaPotencias q n m
    | n == 1 = sumaInterna q (m + n) - sumaInterna q n
    | otherwise = sumaInterna q (m + n) - sumaInterna q n + sumaPotencias q (n - 1) m

-- Ejercicio 15
sumaRacionales :: Integer ->Integer -> Float
sumaRacionales n m
    | n == 1 = divisionInterna n m
    | otherwise = divisionInterna n m + sumaRacionales (n - 1) m

divisionInterna :: Integer -> Integer -> Float
divisionInterna n m
    | m == 1 =  fromIntegral n / fromIntegral m 
    | otherwise =  fromIntegral n / fromIntegral m + divisionInterna n (m - 1)

-- Ejercicio 16
-- a)
menorDivisor :: Integer -> Integer
menorDivisor n = buscar 2
  where
    buscar i
        | n `mod` i == 0 = i
        | otherwise = buscar (i + 1)

-- b)
esPrimo :: Integer -> Bool
esPrimo n
    | n <= 1 = False
    | n == 2 = True
    | even n = False
    | otherwise = corroborar maxImpar
  where
    -- Hasta raizDeN para mayor eficiencia.
    -- Si no se admite "floor", entonces hasta la parte entera de n / 2
    raizDeN = floor (sqrt (fromIntegral n :: Double)) 

    maxImpar
        | even raizDeN = raizDeN + 1
        | otherwise = raizDeN

    corroborar m
        | m < 3 = True
        | n `mod` m == 0 = False
        | otherwise = corroborar (m - 2)

-- c)
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos 0 0 = False
sonCoprimos n 0 = n == 1
sonCoprimos n m = sonCoprimos m (n `mod` m)

-- d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimo (nEsimoPrimo (n - 1))
    where
    siguientePrimo m
        | m == 2 = 3
        | esPrimo (m + 2) = m + 2
        | otherwise = siguientePrimo (m + 2)