"""
.SYNOPSIS
    This script checks for the presence of a Dockerfile and runs docker compose accordingly.

.DESCRIPTION
    This Python script is designed to automate the process of building and running Docker containers.
    It first checks if a Dockerfile is present in the current directory. If found, it runs docker compose
    with the build and detach options. If not found, it runs docker compose in detach mode without building.

.NOTES
    [Original Author]
        o Michael Arroyo
    [Original Build Version]
        o 1.0.1.20050210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
    [Latest Author]
        o Michael Arroyo
    [Latest Build Version]
        o 1.0.1.20050210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
    [Comments]
        o
    [Python Compatibility]
        o 3.10
    [Forked Project]
        o

.DEPENDENCIES
    o os
    o subprocess

.BUILD NOTES
    o 1.0.1.20050210
        [Michael Arroyo] Initial Post

.EXAMPLES
    Command: python build_and_run.py
    Description: Runs the script to check for Dockerfile and execute docker compose accordingly.
    Notes: Ensure Docker is installed and running on your system.
"""

import os
import subprocess

if os.path.isfile("Dockerfile"):
    print("Dockerfile found. Running docker compose with build and detach...")
    subprocess.run(["docker", "compose", "up", "--build", "-d"])
else:
    print("Dockerfile not found. Running docker compose in detach mode...")
    subprocess.run(["docker", "compose", "up", "-d"])
