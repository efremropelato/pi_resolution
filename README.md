# Metodo Montecarlo

## Benchmarking, tra Python, Ruby, Nodejs, Golang, Java e Rust, per la risoluzione del valore di $\Pi$ utilizzando il metodo Monte Carlo.

> ### Prerequisiti
>
> Devono essere installati:
>
> - Python ver. 3.12.4 o successiva
> - Ruby ver. 3.3.5 o successiva
> - Nodejs ver. 20.18.0 o successiva
> - Golang ver. 1.22.4 o successiva
> - Rust ver. 1.82.0 o successiva
> - Java ver. 1.8.0_422 o successiva

### Confronto efficienza

Utilizzando Python, Ruby, Nodejs, Golang, Java e Rust sono stati implementati quattro script con lo stesso algoritmo di risoluzione del valore di $\Pi$: per nessuno di essi è stato utilizzato parallelismi o multithreading per ottimizzazione delle prestazioni.
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

- Java

  ```sh
  cd JV
  javac ./Main.java
  export PI_SIMULATIONS=<numero interazione>
  java Main && cd ..
  ``` ```
  ```

#### Hyperfine

Per eseguire `./hyperfine.sh`, si deve installare il binario: [Hyperfine installation](https://github.com/sharkdp/hyperfine/tree/master?tab=readme-ov-file#installation)

### Risultati

Utilizzando un **Intel® Core™ i5-6500 e 32Gb** i risultati, misurati in secondi, sono:

|            | ver.        | 1.000                       | 5.000                      | 1.000.000                  | 5.000.000                    |
| ----------:|:-----------:|:---------------------------:|:--------------------------:|:--------------------------:|:----------------------------:|
| **Python** | *3.12.4*    | 0,00017<br> [739,13%]       | 0,000806<br> [680,92%]     | 0,171172<br> [1022,83%]    | 0,871845<br> [936,66%]       |
| **Ruby**   | *3.3.5*     | 0,003380644<br> [14698,45%] | 0,01664606<br> [14062,85%] | 3,185276161<br> [19033,5%] | 16,004425921<br> [17194,31%] |
| **Nodejs** | *20.18.0*   | **\***       | 0,001<br> [844,81%]        | 0,03<br> [179,26%]         | 0,135<br> [145,03%]          |
| **Golang** | *1.22.4*    | **0,000023<br> [100%]**     | 0,000132<br> [111,51%]     | 0,022069<br> [131,87%]     | 0,119983<br> [128,9%]        |
| **Rust**   | *1.82.0*    | 0,000030641<br> [133,22%]   | **0,000118369<br> [100%]** | **0,016735104<br> [100%]** | **0,093079769<br> [100%]**   |
| **Java**   | *1.8.0_422* | 0,001604<br> [6973,91%]     | 0,004325<br> [3653,82%]    | 0,050392<br> [301,11%]     | 0,224448<br> [241,13%]       |

Utilizzando un **Apple® M2 e 16Gb** i risultati, misurati in secondi, sono:

|            | ver.      | 1.000                     | 5.000                   | 1.000.000                | 5.000.000                 |
| ----------:| --------- |:-------------------------:|:-----------------------:|:------------------------:|:-------------------------:|
| **Python** | *3.12.4*  | 0,000101<br> [721,43%]    | 0,000489<br> [444,55%]  | 0,100177<br> [778,62%]   | 0,529444<br> [788,34%]    |
| **Ruby**   | *3.3.5*   | 0,000484<br> [3457,15%]   | 0,002548<br> [2316,37%] | 0,545488<br> [4239,77%]  | 2,631342<br> [3918,02%]   |
| **Nodejs** | *20.18.0* | **\***     | 0,001<br> [909,1%]      | 0,036<br> [279,81%]      | 0,11<br> [163,79%]        |
| **Golang** | *1.22.4*  | **0,000014<br> [100%]**   | 0,000182<br> [165,46%]  | **0,012866<br> [100%]**  | **0,06716<br> [100%]**    |
| **Rust**   | *1.82.0*  | 0,000025167<br> [179,77%] | **0,00011<br> [100%]**  | 0,022051792<br> [171,4%] | 0,115934333<br> [172,63%] |
| **Java**   | *17.0.12* | 0,000559<br> [3992,86%]   | 0,000761<br> [691,82%]  | 0,042703<br> [331,91%]   | 0,221541<br> [329,88%]    |

> **\*** Nodejs non misura frazioni del millisecondo

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
