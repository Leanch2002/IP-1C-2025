import math

# Ejercicio 1
# 1)
def imprimir_hola_mundo():
    print("¡Hola mundo!")
    
# 2)
def imprimir_un_verso():
    print("Las ostras se han servido de tu nácar...\n")
    
# 3)
def raiz_de_2() -> float:
    return round(math.sqrt(2), 4)

# 4)
def factorial_2() -> float:
    return 2 * 1

# 5)
def perimetro() -> float:
    return round(2 * math.pi, 4)

# Ejercicio 2
# 1)
def imprimir_saludo(nombre: str):
    print("Hola " + nombre)
    
# 2)
def raiz_cuadrada_de(numero: int) -> float:
    return round(math.sqrt(numero), 4)

# 3)
def fahrenheit_a_celcius(temp_far: float) -> float:
    return ((temp_far - 32) * 5) / 9

# 4)
def imprimir_dos_veces(estribillo: str):
    print((estribillo + '\n') * 2)
    
# 5)
def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

# 6)
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)

# 7)
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    porciones_totales: int = comensales * min_cant_de_porciones
    
    return math.ceil(porciones_totales / 8)

# Ejercicio 3
# 1)
def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0

# 2)
def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0

# 3)
def es_nombre_largo(nombre: str) -> bool:
    largo_nombre: int = len(nombre)
    
    # Presunta correccion: >= 8 por <= 8 
    return 3 <= largo_nombre and largo_nombre <= 8

# 4)
def es_bisiesto(año: int) -> bool:
    return es_multiplo_de(año, 400) or (es_multiplo_de(año, 4) and not es_multiplo_de(año, 100))

# Ejercicio 4
def peso_pino(h_mts: float) -> float:
    h_cm: int = h_mts * 100
    h_superior_cm: int = 0
    
    if h_cm > 300:
        h_superior_cm = h_cm - 300
        
    # funciona tal cual la consigna
    return (h_cm * 3) - (h_superior_cm) 

def es_peso_util(kg: float) -> bool:
    return (400 <= kg) and (kg <= 1000)

def sirve_pino(h_mts: float) -> float:
    return es_peso_util(peso_pino(h_mts))

# Ejercicio 5
# 1)
def devolver_el_doble_si_es_par(numero: int) -> int:
    if es_par(numero):
        numero = numero * 2
    
    return numero

# 2) -

# 3) -

# 4)
def lindo_nombre(nombre: str) -> str:
    frase: str = "Tu nombre tiene menos de 5 caracteres"
    
    if len(nombre) >= 5:
        frase = "Tu nombre tiene muchas letras!"
        
    return frase

# 5)
def el_rango(numero: int):
    if numero < 5:
        print("Menor a 5")
    elif (10 <= numero) and (numero <= 20):
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")

# 6)
def explotacion(sexo: str, edad: int):
    if (18 <= edad) and ((edad < 60) or (edad < 65 and sexo == 'M')):
        print("Te toca trabajar")
    else:
        print("Andá de vacaciones")

# Ejercicio 6
# 1)
def uno_al_diez():
    i: int = 1
    
    while i <= 10:
        print(i)
        i += 1

# 2)
def pares_10_40():
    i: int = 10
    
    while i <= 40:
        print(i)
        i += 2

# 3)
def eco_10():
    i: int = 0
    
    while i < 10:
        print("eco")
        i += 1

# 4)
def cuenta_regresiva(n: int):
    while n > 0:
        print(n)
        n -= 1
    
    print("Despegue")
    
# 5)
def viaje_al_pasado(partida: int, llegada: int):
    while partida > llegada:
        partida -= 1
        print("Viajó un año al pasado, estamos en el año: "  + str(partida))
        
# 6)
def viaje_a_platon(partida: int):
    # -384 + 20 = -364 (Para que no se pase)
    while partida >= -364:
        partida -= 20
        print("Viajó veinte años al pasado, estamos en el año: "  + str(partida))

# Ejercicio 7
# Quizas en otra linea temporal lo haga

# Ejercicio 8 y 9 no son codigo