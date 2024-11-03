#! /bin/bash

export PI_SIMULATIONS=$1 &&\
hyperfine --shell zsh --warmup 5 --runs 10 \
--setup "" \
--cleanup "" \
--prepare "go build -o ./GO/main ./GO/main.g && cd RS && cargo build --release -q && cd .. && cd JV && javac ./Main.java && cd .. || true" \
"python3 ./PY/main.py" \
"ruby ./RB/main.rb" \
"node ./JS/index.js" \
"./GO/main" \
"./RS/target/release/main " \
"cd JV && java Main && cd .." \
--export-markdown ./banchmark.md