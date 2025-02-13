terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Create Jenkins container
resource "docker_container" "jenkins" {
  image = "jenkins/jenkins:lts"
  name  = "jenkins"

  ports {
    internal = 8080
    external = 8080
  }

  ports {
    internal = 50000
    external = 50000
  }

  volumes {
    host_path      = "${local.envs["project_dir"]}/jenkins_data"
    container_path = "/var/jenkins_home"
  }

  env = [
    "JAVA_OPTS=-Djenkins.install.runSetupWizard=false"
  ]

  networks_advanced {
    name = docker_network.jenkins_net.name
  }
}

# Create Vault container
resource "docker_container" "vault" {
  image = "hashicorp/vault:latest"
  name  = "vault"

  ports {
    internal = 8200
    external = 8200
  }

  volumes {
    host_path      = "${local.env["project_dir"]}/vault_data"
    container_path = "/vault/file"
  }

  env = [
    "VAULT_DEV_ROOT_TOKEN_ID=root",
    "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200"
  ]

  command = ["server", "-dev"]

  networks_advanced {
    name = docker_network.jenkins_net.name
  }
}

# Create Portainer container
resource "docker_container" "portainer" {
  image = "portainer/portainer-ce:latest"
  name  = "portainer"

  ports {
    internal = 9000
    external = 9001
  }

  volumes {
    host_path      = "${local.env["project_dir"]}/portainer_data"
    container_path = "/data"
  }

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  networks_advanced {
    name = docker_network.jenkins_net.name
  }
}

# Define persistent volumes for Vault and Portainer
resource "docker_volume" "vault_data" {
  name = "vault_data"
}

resource "docker_volume" "portainer_data" {
  name = "portainer_data"
}
