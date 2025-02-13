import os
import subprocess

if os.path.isfile("Dockerfile"):
    print("Dockerfile found. Running docker compose with build and detach...")
    subprocess.run(["docker", "compose", "up", "--build", "-d"])
else:
    print("Dockerfile not found. Running docker compose in detach mode...")
    subprocess.run(["docker", "compose", "up", "-d"])
