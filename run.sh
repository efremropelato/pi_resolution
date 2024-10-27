#! /bin/bash

clear && \
export PI_SIMULATIONS=$1 && \
python3 ./PY/main.py && \
ruby ./RB/main.rb && \
node ./JS/index.js && \
go build -o ./GO/main ./GO/main.go && \
./GO/main && \
cd RS && cargo build --release -q && cd .. && \
./RS/target/release/main && \
cd JV && javac ./Main.java && \
java Main && \
cd ..