# .SYNOPSIS
#     This script checks for the presence of a Dockerfile and runs docker compose accordingly.
#
# .DESCRIPTION
#     This Bash script is designed to automate the process of building and running Docker containers.
#     It first checks if a Dockerfile is present in the current directory. If found, it runs docker compose
#     with the build and detach options. If not found, it runs docker compose in detach mode without building.
#
# .NOTES
#     [Original Author]
#         o Michael Arroyo
#     [Original Build Version]
#         o 1.0.1.20050210 (Major.Minor.Patch.Date<YYYYMMDD>)
#     [Latest Author]
#         o Michael Arroyo
#     [Latest Build Version]
#         o 1.0.1.20050210 (Major.Minor.Patch.Date<YYYYMMDD>)
#     [Comments]
#         o
#     [Forked Project]
#         o
#
# .DEPENDENCIES
#     o Docker
#
# .BUILD NOTES
#     o 1.0.1.20050210
#         [Michael Arroyo] Initial Post
#
# .EXAMPLES
#     Command: ./build_and_run.sh
#     Description: Runs the script to check for Dockerfile and execute docker compose accordingly.
#     Notes: Ensure Docker is installed and running on your system.
#!/bin/bash

if [ -f "Dockerfile" ]; then
    echo "Dockerfile found. Running docker compose with build and detach..."
    docker compose up --build -d
else
    echo "Dockerfile not found. Running docker compose in detach mode..."
    docker compose up -d
fi
