REM .DESCRIPTION
REM     This script is used to build and run a docker compose
REM         file in detach mode.
REM
REM .NOTES
REM     [Original Author]
REM         o Michael Arroyo
REM     [Original Build Version]
REM         o 1.0.1.20250210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
REM     [Latest Author]
REM         o Michael Arroyo
REM     [Latest Build Version]
REM         o 1.0.1.20250210 e.g [XX = Major (.) XX = Minor (.) XX = Patch (.) XXXX = Build Date (YYYYMMDD)]
REM     [Comments]
REM         o
REM     [Forked Project]
REM         o
REM
REM .DEPENDENCIES
REM     o
REM
REM .BUILD NOTES
REM     o 1.0.1.20250210
REM         [Michael Arroyo] Initial Post

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
