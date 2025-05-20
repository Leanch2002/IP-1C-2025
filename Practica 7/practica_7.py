import math

# Ejercicio 1
# 1)
def pertenece(s: list[int], e: int) -> bool:
    i: int = 0
    longitud: int = len(s)
    
    while i < longitud and s[i] != e:
        i += 1
    
    return i < longitud

# 2)
def divide_a_todos(s: list[int], e: int) -> bool:
    i: int = 0
    longitud: int = len(s)
    
    while i < longitud and s[i] % e == 0:
        i += 1
    
    return i == longitud
        
# 3)
def suma_total(s: list[int]) -> int:
    sumatoria: int = 0
    
    for e in s:
        sumatoria += e
        
    return sumatoria

# 4)
def maximo(s: list[int]) -> int:
    i: int = 0
    j: int = 1
    longitud: int = len(s)

    while i < longitud and j < longitud:
        if s[i] >= s[j]:
            j += 1
        else:
            i = j
            j +=1

    return s[i]
        
# 5)
def minimo(s: list[int]) -> int:
    i: int = 0
    j: int = 1
    longitud: int = len(s)

    while i < longitud and j < longitud:
        if s[i] <= s[j]:
            j += 1
        else:
            i = j
            j +=1

    return s[i]

# 6)
def ordenados(s: list[int]) -> bool:
    i: int = 0
    longitud: int = len(s)
    
    while i < (longitud - 1) and s[i] < s[i + 1]:
        i += 1
        
    return i == (longitud - 1)

# 7)
def pos_maximo(s: list[int]) -> int:
    i: int = 0
    
    if s == []:
        i = -1
    else:
        val_max: int = maximo(s)

        while s[i] != val_max:
            i += 1

    return i

# 8)
def pos_minimo(s: list[int]) -> int:
    i: int = 0
    
    if s == []:
        i = -1
    else:
        val_min: int = minimo(s)

        while s[i] != val_min:
            i += 1

    return i

# 9)
def long_mayor_a_7(s: list[str]) -> bool:
    i: int = 0
    longitud: int = len(s)
    
    while i < longitud and len(s[i]) <= 7:
        i += 1
    
    return i != longitud

# 10)
def es_palindromo(s: str) -> bool:
    i: int = 0
    longitud: int = len(s)
    tope: int = math.floor(longitud / 2)
    
    while i < tope and s[i] == s[(longitud - 1) - i]:
        i += 1
    
    return i == tope

# 11)
def iguales_consecutivos(s: list[int]) -> bool:
    i: int = 0
    longitud: int = len(s)

    while (i + 2) < longitud and not (s[i] == s[i + 1] == s[i + 2]):
        i += 1
        
    return (i + 2) < longitud

# 12)
def vocales_distintas(s: str) -> bool:
    vocales: str = "aeiou"
    vocales_encontradas: str = ""

    for c in s:
        if c in vocales and c not in vocales_encontradas:
            vocales_encontradas += c

    return len(vocales_encontradas) > 2

# 13)
def pos_secuencia_ordenada_mas_larga(s: list[int]) -> int:
    max_inicio: int = 0
    max_longitud: int = 1

    inicio: int = 0
    longitud: int = 1

    for i in range(1, len(s)):
        if s[i - 1] < s[i]:
            longitud += 1
        else:
            if longitud > max_longitud:
                max_longitud = longitud
                max_inicio = inicio
            inicio = i
            longitud = 1

    if longitud > max_longitud:
        max_inicio = inicio

    return max_inicio

# 14)
def cantidad_digitos_impares(s: list[int]) -> int:
    i: int = 0

    for numero in s:
        for digito in separar_digitos(numero):
            if digito % 2 == 1:
                i += 1

    return i

def separar_digitos(n: int) -> list[int]:
    digitos: list[int] = []
    
    while n != 0:
        digitos.append(n % 10)
        n = n // 10

    if not digitos:
        digitos = [0]

    return digitos