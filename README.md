# Metodo Montecarlo

## Benchmarking, tra Python, Ruby, Nodejs, Golang e Rust, per la risoluzione del valore di $\Pi$ utilizzando il metodo Monte Carlo.

> ### Prerequisiti
>
> Devono essere installati:
>
> - Python ver. 3.12.4 o successiva
> - Ruby ver. 3.3.5 o successiva
> - Nodejs ver. 20.18.0 o successiva
> - Golang ver. 1.22.4 o successiva
> - Rust ver. 1.82.0 o successiva

### Confronto efficienza

Utilizzando Python, Ruby, Nodejs, Golang e Rust sono stati implementati quattro script con lo stesso algoritmo di risoluzione del valore di $\Pi$: per nessuno di essi è stato utilizzato parallelismi o multithreading per ottimizzazione delle prestazioni.
Alla fine dell'esecuzione, ogni script restituisce il tempo complessivo dell'elaborazione.

### Esecuzione

E' possibile eseguire tutti gli script in seguenza, tramite lo script `run.sh <numero interazioni>` o `run.bat <numero interazioni>`, oppure eseguirli singolarmente con:

- Python

  ```sh
  export PI_SIMULATIONS=<numero interazione>
  python3 ./PY/main.py
  ```

- Ruby

  ```sh
  export PI_SIMULATIONS=<numero interazione>
  ruby ./RB/main.rb
  ```

- Nodejs

  ```sh
  export PI_SIMULATIONS=<numero interazione>
  node ./JS/index.js
  ```

- Go

  ```sh
  go build -o ./GO/main ./GO/main.go
  export PI_SIMULATIONS=<numero interazione>
  ./GO/main
  ```

- Rust

  ```sh
  cd RS
  cargo build --release -q
  export PI_SIMULATIONS=<numero interazione>
  ./target/release/main
  ```

### Risultati

Utilizzando un MACBook Air con processore M2 e 16Gb, i risultati con 1000000 iterazioni sono:

```sh
# ./run.sh 1000000

PY = 0.230278 seconds for => inside_circle: 785422
PY = PI value with 1000000 => 3.141688
-------------------------------------------------
RB = 1.010184 seconds for => inside_circle: 785856
RB = PI value with 1000000 => 3.143424
-------------------------------------------------
JS =  0.042 seconds for => insideCircle:  785553
JS = PI value with  1000000  =>  3.142212
-------------------------------------------------
GO = 0.026024 seconds for => insideCircle: 784907
GO = PI value with 1000000 => 3.139628
-------------------------------------------------
Rust = 0.045973375 seconds for => inside_circle: 785296
Rust = PI value with 1000000 => 3.141184
-------------------------------------------------

```

### Algoritmo per risoluzione $\Pi$

Il metodo "Monte Carlo" è una stategia di risoluzione di problemi che utilizza la statistica: se la probabilità di un certo evento è P possiamo simulare in maniera random questo evento e ottenere P facendo:

`P = (numero di volte in cui il nostro evento è avvenuto)/(simulazioni totali)`.

Vediamo come applicare questa strategia per ottenere un'approssimazione di pi greco $\Pi$.

Data un cerchio di raggio 1, esso può essere inscritto in un quadrato di lato 2.

Guardiamo solamente ad uno spicchio del cerchio:

![PI_greco](./pi.png)

In questo modo sappiamo che l'area del quadrato in blu è 1 e l'area dell'area rossa invece è $\Pi$/4.

Se generiamo N numeri random all'interno del quadrato il numero di punti che cadono nel cerchio M diviso il numero totale di numeri generati N dovrà approssimare appunto l'area del cerchio e quindi $\Pi$/4.

In sostanza otterremo $\Pi$ = 4 \* M / N.

Maggiore sarà il numero di punti generati più precisa sarà l'approssimazione di $\Pi$.

Chiaramente ogni esecuzione darà un valore leggermente diverso ma aumentando il numero di punti possiamo "stabilizzare" un numero di cifre decimali a piacere. Osserviamo come l'implementazione del random sia determinante per questo calcolo: se i double non fossero generati in maniera uniforme tra 0 e 1 il valore di pi risulterebbe sbagliato!
