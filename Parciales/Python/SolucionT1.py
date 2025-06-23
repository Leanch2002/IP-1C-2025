"""
Yo:
@author: <Leandro Choque>
Certifico que el siguiente archivo fue elaborado únicamente por mí.

Siendo la última modificación con la solución final:
@date: <18 de jun 19:13>
"""
from queue import Queue as Cola
from queue import LifoQueue as Pila

# Ejercicio 1
def dupla_que_mas_suma(s: list[int]) -> tuple[int,int]:
    i: int = 0
    j: int = 0
    long: int = len(s)
    min: int = minimo(s)
    # Fija los 2 valores con el mínimo, asegurandose de que siempre 
    # se reemplacen (ya que no hay repetidos)
    res: tuple[int, int] = (min, min)

    for i in range(long - 1):
        for j in range(i + 1, long):
            if s[i] + s[j] > res[0] + res[1]:
                if s[i] < s[j]:
                    res = (s[i], s[j])
                else:
                    res = (s[j], s[i])

    return res

# Auxiliares 1)
def minimo(s: list[int]) -> int:
    min_aux: int = 0

    for e in s:
        if e < min_aux:
            min_aux = e

    return min_aux

# Ejercicio 2 
def atencion_con_prioridad(clientes: Cola[tuple[str, str]]) -> Cola[tuple[str,str]]:
    prioritarios: Cola[tuple[str,str]] = Cola()
    no_prioritarios: Cola[tuple[str,str]] = Cola()
    cliente: tuple[str,str] = ()

    # Separa en dos colas distintas según prioridad
    while not clientes.empty():
        cliente = clientes.get()
        if cliente[1] == "prioritario":
            prioritarios.put(cliente)
        elif cliente[1] == "no_prioritario":
            no_prioritarios.put(cliente)

    # La lista de no prioritarios se vuelve a cargar en clientes
    while not no_prioritarios.empty():
        cliente = no_prioritarios.get()
        clientes.put(cliente)

    return prioritarios

# Ejercicio 3 
def espejar_vertical(A: list[list[int]]) -> None:
    for fila in A:
        espejar(fila)

    return None

# Auxiliares 3)
def espejar(s: list[int]) -> None:
    pila_aux: Pila[int] = Pila()
    long: int = len(s)
    corte: int = (long + 1) // 2

    # Apila hasta la mitad e ignora la mitad exacta si la longitud es impar
    for i in range(long - corte):
        pila_aux.put(s[i])

    # Desapila 1 por 1 y reemplaza los elementos restantes
    for i in range(corte, len(s)):
        s[i] = pila_aux.get()

    return None

# Ejercicio 4
def recursantesAprobados(cuat1: dict[str,int], cuat2:dict[str,int]) -> int:
    lista_desaprobados: list[str] = []
    res: int = 0

    # Recolecta el nombre de los alumnos que desaprobaron el primer cuatrimestre
    for nombre, nota in cuat1.items():
        if nota < 7:
            lista_desaprobados.append(nombre)

    # Busca si se inscribieron en el segundo y, ademas, si esta vez lo aprobaron
    for nombre, nota in cuat2.items():
        if nombre in lista_desaprobados:
            if nota >= 7:
                res += 1

    return res