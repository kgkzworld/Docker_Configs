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
