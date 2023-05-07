/*****************************************************
 * Modelo utilizando la primera forma vista en clase
 *****************************************************/


// TODO: modificar restricciones


// ----- Constantes -----

// Todos los bancos por los que se quiere pasar
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

// Cantidad de bancos
int N = card(Bancos);

// Todos los "nodos" que se visitarán (Bancos + "Casa central")
{string} Nodos = {"Casa central"} union Bancos;

// $MAX_DINERO
float Capacidad = ...;

// Dinero recaudado (+$) o dejado (-$) en cada banco
float Ganancia[Bancos] = ...;

// Distancia entre cada par de nodos
float Distancia[Nodos][Nodos] = ...;

// ----- Variables -----

// Y[i][j] == 1 si se viaja de i a j, 0 sino
dvar boolean Y[Nodos][Nodos];

// El número de orden en que se visita cada banco
dvar float+ U[Bancos];

// Representa la cantidad de dinero al salir del banco
dvar float+ C[Bancos];

// X[i][j] == 1 si U[i] < U[j], sino 0
dvar boolean X[Bancos][Bancos];

// ----- Funcional -----

minimize
  sum (i in Bancos) (
    sum (j in Bancos) (
      Y[i][j] * Distancia[i][j]
    )
  );


// ----- Restricciones -----

subject to {
  // Todos los nodos son visitados una sola vez
  forall (j in Nodos)
    entradas:
      sum (i in (Nodos diff {j})) Y[i][j] == 1;

  // Se sale de todo nodo por lo menos una vez
  forall (i in Nodos)
    salidas:
      sum (j in (Nodos diff {i})) Y[i][j] == 1;

  // La visita de los bancos tiene un orden
  // (formulación Miller-Tucker-Zemlin)
  forall (i in Bancos)
    forall (j in Bancos) if (i != j)
      orden:
          U[i] - U[j] + N * Y[i][j] <= N - 1;

  // El dinero en cada paso es igual a una variable
  // (mayor o igual a 0 por c.n.n.)
  forall (i in Bancos)
    dinero_cada_paso:
      sum (j in Bancos diff {i}) (Ganancia[j] * X[j][i]) + Ganancia[i] == C[i];

  // Definición de las X
  forall (i in Bancos)
    forall (j in Bancos) if (i != j)
      i_antes_de_j:
        U[i] <= U[j] + N * X[j][i]; // N == M
}
