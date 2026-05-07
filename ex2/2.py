from hashlib import sha256
import time

d = 2**240
x = 0

start = time.time()

while True:
    msg = f"BBSE_E01{x}"
    h = sha256(msg.encode()).hexdigest()

    if int(h, 16) < d:
        end = time.time()
        print("x =", x)
        print("hash =", h)
        print("time =", end - start, "seconds")
        break

    x += 1
