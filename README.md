# Metodo Montecarlo

## Benchmarking, tra Python, Ruby, Nodejs e Golang, per la risoluzione del valore di $\Pi$ utilizzando il metodo Monte Carlo.

> ### Prerequisiti
>
> Devono essere installati:
> - Python ver. 3.12.4 o successiva
> - Ruby ver. 3.3.5 o successiva
> - Nodejs ver. 20.18.0 o successiva
> - Golang ver. 1.22.4 o successiva

### Confronto efficienza

Utilizzando Python, Ruby, Nodejs e Golang sono stati implementati quattro script con lo stesso algoritmo di risoluzione del valore di $\Pi$.
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
### Risultati

Utilizzando un MACBook Air con processore M2 e 16Gb, i risultati con 1000000 iterazioni sono:

```sh
PY = 0.239897 seconds for => inside_circle: 785481 , outside_circle: 214519
PY = PI value with 1000000 => 3.141924
-------------------------------------------------
RB = 1.160356 seconds for => inside_circle: 785084 , outside_circle: 214916
RB = PI value with 1000000 => 3.140336
-------------------------------------------------
JS =  0.047 seconds for => insideCircle:  785905  , outsideCircle:  214095
JS = PI value with  1000000  =>  3.14362
-------------------------------------------------
GO = 0.027339 seconds for => insideCircle: 785532 , outsideCircle: 214468
GO = PI value with 1000000 => 3.142128
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

In sostanza otterremo $\Pi$ = 4 * M / N.

Maggiore sarà il numero di punti generati più precisa sarà l'approssimazione di $\Pi$.

Chiaramente ogni esecuzione darà un valore leggermente diverso ma aumentando il numero di punti possiamo "stabilizzare" un numero di cifre decimali a piacere. Osserviamo come l'implementazione del random sia determinante per questo calcolo: se i double non fossero generati in maniera uniforme tra 0 e 1 il valore di pi risulterebbe sbagliato!