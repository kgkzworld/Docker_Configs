REM .DESCRIPTION
REM     This script checks for the presence of a Dockerfile and runs docker compose accordingly.
REM 
REM .NOTES
REM     [Original Author]
REM         o Michael Arroyo
REM     [Original Build Version]
REM         o 1.0.1.20050210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
REM     [Latest Author]
REM         o Michael Arroyo
REM     [Latest Build Version]
REM         o 1.0.1.20050210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
REM     [Comments]
REM         o
REM     [Forked Project]
REM         o
REM 
REM .DEPENDENCIES
REM     o Docker
REM 
REM .BUILD NOTES
REM     o 1.0.1.20050210
REM         [Michael Arroyo] Initial Post
REM 
REM .EXAMPLES
REM     Command: build_and_run.bat
REM     Description: Runs the script to check for Dockerfile and execute docker compose accordingly.
REM     Notes: Ensure Docker is installed and running on your system.

@echo off
setlocal

if exist Dockerfile (
    echo Dockerfile found. Running docker compose with build and detach...
    docker compose up --build -d
) else (
    echo Dockerfile not found. Running docker compose in detach mode...
    docker compose up -d
)

endlocal
