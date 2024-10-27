import time
import random
import os

def main():
    points_number = int(os.environ['PI_SIMULATIONS'])

    inside_circle = 0
    start = time.time()

    for i in range(points_number):
        x = random.random()
        y = random.random()

        if x * x + y * y < 1:
            inside_circle += 1

        # os.system('cls' if os.name == 'nt' else 'clear')  # Clear console
        # print(f"Countdown {points_number - i}")

    # os.system('cls' if os.name == 'nt' else 'clear')  # Clear console
    finish = time.time()
    print(f"PY = {finish - start:.6f} seconds for => inside_circle: {inside_circle}")

    pi = 4.0 * inside_circle / points_number
    print(f"PY = PI value with {points_number} => {pi:.6f}")
    print("-------------------------------------------------")

if __name__ == "__main__":
    main()

