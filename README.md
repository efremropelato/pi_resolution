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

Utilizzando Python, Ruby, Nodejs, Golang e Rust sono stati implementati quattro script con lo stesso algoritmo di risoluzione del valore di $\Pi$.
Alla fine dell'esecuzione, ogni script restituisce il tempo complessivo dell'elaborazione.

### Esecuzione

E' possibile eseguire tutti gli script in seguenza, tramite lo script `run.sh` o `run.bat`, oppure eseguirli singolarmente con:

- Python

  ```sh
  python3 ./PY/main.py
  ```

- Ruby

  ```sh
  ruby ./RB/main.rb
  ```

- Nodejs

  ```sh
  node ./JS/index.js
  ```

- Go

  ```sh
  go run ./GO/main.go
  ```

- Rust

```sh
cd RS
cargo build --release -q
./target/release/main
```

### Risultati

Utilizzando un MACBook Air con processore M2 e 16Gb, i risultati con 1000000 iterazioni sono:

```sh
PY = 0.243138 seconds for => inside_circle: 784925
PY = PI value with 1000000 => 3.139700
-------------------------------------------------
RB = 1.036472 seconds for => inside_circle: 785964
RB = PI value with 1000000 => 3.143856
-------------------------------------------------
JS =  0.039 seconds for => insideCircle:  785185
JS = PI value with  1000000  =>  3.14074
-------------------------------------------------
GO = 0.027645 seconds for => insideCircle: 786015
GO = PI value with 1000000 => 3.144060
-------------------------------------------------
Rust = 0.053900166 seconds for => inside_circle: 785279
Rust = PI value with 1000000 => 3.141116
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
