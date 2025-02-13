<#
    .SYNOPSIS
        This script checks for the presence of a Dockerfile and runs docker compose accordingly.

    .DESCRIPTION
        This PowerShell script is designed to automate the process of building and running Docker containers.
        It first checks if a Dockerfile is present in the current directory. If found, it runs docker compose
        with the build and detach options. If not found, it runs docker compose in detach mode without building.

    .PARAMETER None
        This script does not take any parameters.

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
        [PowerShell Compatibility]
            o  5.x, 7.x
        [Forked Project]
            o
        [Links]
            o
        [Dependencies]
            o Docker

    .EXAMPLE
        Command: .\build_and_run.ps1
        Description: Runs the script to check for Dockerfile and execute docker compose accordingly.
        Notes: Ensure Docker is installed and running on your system.
#>

#region Build Notes
<#
    .BUILD NOTES
        o 1.0.1.20050210
            [Michael Arroyo] Initial Post
#>
#endregion Build Notes

if (Test-Path -Path "Dockerfile" -PathType Leaf) {
    Write-Host "Dockerfile found. Running docker compose with build and detach..."
    docker compose up --build -d
} else {
    Write-Host "Dockerfile not found. Running docker compose in detach mode..."
    docker compose up -d
}
