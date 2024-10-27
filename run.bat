@echo off

cls
set PI_SIMULATIONS=%1

python ./PY/main.py
ruby ./RB/main.rb
node ./JS/index.js

go build -o ./GO/main.exe ./GO/main.go
if exist ./GO/main.exe (
    ./GO/main.exe
)

cd RS
cargo build --release -q
cd ..
if exist ./RS/target/release/main.exe (
    ./RS/target/release/main.exe
)

cd JV
javac ./Main.java
if exist ./Main.class (
    java Main
)
cd ..

pause