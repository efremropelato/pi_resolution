#! /bin/bash

clear && \
python3 ./PY/main.py && \
ruby ./RB/main.rb && \
node ./JS/index.js && \
go run ./GO/main.go && \
cd RS && cargo build --release -q && cd .. && \
./RS/target/release/main