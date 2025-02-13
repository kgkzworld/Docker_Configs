if (Test-Path -Path "Dockerfile" -PathType Leaf) {
    Write-Host "Dockerfile found. Running docker compose with build and detach..."
    docker compose up --build -d
} else {
    Write-Host "Dockerfile not found. Running docker compose in detach mode..."
    docker compose up -d
}
