/*********************************************
 * OPL 22.1.1.0 Model
 * Author: gruner
 * Creation Date: Apr 30, 2023 at 3:50:15 PM
 *********************************************/

// Tercera forma de resolución del ejercicio del TP

// ----- Constantes -----

{string} Bancos = {
  "Porteño",
  "Del Plata",
  "De Los Andes",
  "Plural",
  "Del Norte",
  "Pampeano",
  "Cooperativo",
  "Sol",
  "República",
  "Vientos del sur"
};

int N = card(Bancos);

{string} Nodos = {"Casa central"} union Bancos;

float Ganancia[Bancos] = ...;
float Distancia[Nodos][Nodos] = ...;

// ----- Variables -----

dvar boolean Y[Nodos][Nodos];
dvar float+ U[Bancos];

// ----- Funcional -----

minimize
  sum (i in Bancos) (
    sum (j in Bancos) (
      Y[i][j] * Distancia[i][j]
    )
  );


// ----- Restricciones -----

subject to {
  forall (j in Nodos)
    entradas:
      sum (i in (Nodos diff {j})) Y[i][j] == 1;

  forall (i in Nodos)
    salidas:
      sum (j in (Nodos diff {i})) Y[i][j] == 1;

  forall (i in Bancos)
    forall (j in Bancos) if (i != j)
      orden:
          U[i] - U[j] + N * Y[i][j] <= N - 1;

  // faltan restricciones de capital
}

