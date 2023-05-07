# Trabajo Práctico Modelos y Optimización 1 [71.14]

1 – ENUNCIADO
Parte I: Análisis y aproximación al problema

La famosa empresa “Dinero Seguro” se dedica al transporte de caudales y ha decidido contratarte ya que necesita de tu ingenio para resolver su problema. 

En esta oportunidad tiene la misión de asegurarse que uno de sus camiones cumpla su recorrido por los bancos de forma exitosa. Dicho camión debe salir de una de las sedes de la empresa, pasar por 10 bancos y retornar a esa misma sede. Por razones de seguridad, el camión no podrá detenerse en ningún otro lugar alternativo.

Se sabe que en algunos bancos recaudará dinero de los cajeros (+$) y en otros, dejará (-$). Por cierto, los montos ya están preestablecidos y se indican a continuación:

| Banco                   | Parámetro |
| :---------------------- | :-------: |
| _Banco Porteño_         |   _+$A_   |
| _Banco Del Plata_       |   _-$B_   |
| _Banco De Los Andes_    |   _+$C_   |
| _Banco Plural_          |   _+$D_   |
| _Banco Del Norte_       |   _-$E_   |
| _Banco Pampeano_        |   _-$F_   |
| _Banco Cooperativo_     |   _+$G_   |
| _Banco Sol_             |   _-$H_   |
| _Banco República_       |   _+$I_   |
| _Banco Vientos del Sur_ |   _+$J_   |

Asimismo, el camión tiene espacio para transportar hasta `$MAX_DINERO` y debe asegurarse de tener dinero disponible para dejar en el caso en que le toque un banco con esa necesidad.
Las distancias entre dos bancos cualesquiera (medidas en kilómetros) son datos fijos. También lo es la distancia entre la sede de la empresa y cada banco.



A partir del problema presentado en la Parte I, se pide:

1.  Modelo lineal matemático y corrida en alguna de las herramientas sugeridas por la cátedra (se recomienda GLPK o CPLEX) eligiendo un set de datos factible. 
**Entrega: 08/05**

2.  Corridas de otros modelos vistos en clase que resuelven el problema. Comparación entre cada corrida y resultado.
**Entrega: 08/05**

3.  Heurística de construcción. Código y ejecución del algoritmo en algún lenguaje de programación eligiendo un conjunto de datos factibles.
**Entrega: 12/06**

4.  Heurística de mejoramiento. Código y ejecución del algoritmo en algún lenguaje de programación experimentando con otro set de datos que represente un mayor desafío para la heurística. 
**Entrega: 12/06**

5.  Comparación de resultados entre modelos y heurísticas. Comparación con bibliografía estudiada. Conclusión. 
**Entrega: 12/06**

Google Colabs de los ejercicios:

MÉTODO 2: https://colab.research.google.com/drive/1gui2CkmYT-nzkIaJLjXDN7S50oHtQgdi?usp=sharing

MÉTODO 3: https://colab.research.google.com/drive/1x70fOJMTesxFczDYnkrctvkvbi7QXsaH?usp=sharing
