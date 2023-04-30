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

// YU[b][o] == 1 si U[b] == o, sino 0
dvar boolean YU[Bancos][1..N];

// Representa el aumento de dinero en el camión
// al llegar al destino de orden i
dvar float+ DeltaCajaPos[1..N];

// Representa la disminución de dinero en el camión
// al llegar al destino de orden i
dvar float+ DeltaCajaNeg[1..N];

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
  
  // -------------------------------
  // TODO: modificar restricciones
  // -------------------------------

  // Definición de las variables YU
  forall (b in Bancos)
    indicador_de_orden:
      sum (o in 1..N) (o * YU[b][o]) == U[b];

  // Definición de las variables DeltaCajaPos/Neg
  forall (o in 1..N)
    delta_caja:
      sum (b in Bancos) (Ganancia[b] * YU[b][o]) == DeltaCajaPos[o] - DeltaCajaNeg[o];

  // En cada paso la cantidad de dinero en el camión
  // no es negativa ni mayor a la capacidad
  forall (o in 1..N)
    total_caja:
      0 <= sum (i in 1..o) (DeltaCajaPos[i] - DeltaCajaNeg[i]) <= Capacidad;
}
