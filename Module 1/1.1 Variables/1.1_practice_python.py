

# %%
#Ex. 1
gatos= 8

#Ex. 2
perros ="cuatro"

#Ex. 3
print(gatos)

#Ex. 4
print(perros)

#Ex. 5
print (perros, "más", "perros")

#Ex. 6
print ("perros:", perros, "más", perros, "es igual a", gatos)

#Ex. 7
print (perros, "más", perros, "=", "8")


# %%
#Ex. 8
pizza = float(2)

#Ex. 9
magdalena = "2"

#Ex. 10
postres = int(0)

#Ex. 11
print(type(pizza))

#Ex. 12
print(isinstance(magdalena, str))

#Ex. 13
postres = 0

#Ex. 14
print (gatos + pizza)

#Ex. 15
print (gatos - pizza)

#Ex. 16
print (gatos * 2)


# %%
#Ex. 17
piezas = pizza * 8

#Ex. 18
piezas_add = piezas + 3
piezas_multiply = piezas * 3

#Ex. 19
superficie = 9 ** 2

#Ex. 20
superficie_por_gato = superficie / gatos
print(superficie_por_gato)

#Ex. 21
print(piezas // gatos)

#Ex. 22 Cuántas piezas te quedan si cada gato se come 21 piezas?
piezas_que_comen = gatos * 21
piezas_que_quedan = piezas_add % piezas_que_comen
print(piezas_que_quedan)

#Ex. 23
print(round(superficie_por_gato,1))




# %%
#Ex. 24
print(gatos > pizza)

#Ex. 25
print(gatos < superficie)

#Ex. 26 es verdad que 2 veces la cantidad de pizzas es distinto de la cantidad de gatos? CASO INT VS FLOAT. 
print (pizza * 2 != gatos)

#Ex. 27
print (pizza * 2 is gatos)

#Ex. 28
print(piezas >= pizza and superficie != 0)

#Ex. 29
print(piezas >= pizza and piezas < superficie)

#Ex. 30
print ((pizza > gatos) or (piezas % gatos == 0))



# %%
#Ex. 31: Comprueba las comparaciones de 29. en una sola línea, sin usar la variable piezas más que una sola vez.
print (superficie > piezas >= pizza)

#Ex. 32
print(superficie is not int(0))

#Ex. 33
dia_cumple = input("Cuándo es tu cumpleaños? Ingresa el día:")

#Ex. 34
mes_cumple = input("En cuál mes es tu cumpleaños? Ingresa un mes:")

#Ex. 35
dia_cumple = dia_cumple.strip()
mes_cumple = mes_cumple.strip()

#Ex. 36
fecha_cumple = (mes_cumple + " " + dia_cumple)

#Ex. 37
print(f"La fecha del cumple es {fecha_cumple}")

#Ex. 38
print(perros.upper())