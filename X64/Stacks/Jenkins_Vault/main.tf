provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a custom network
resource "docker_network" "jenkins_net" {
  name = "jenkins-net"
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
    host_path      = "./jenkins_data"
    container_path = "/var/jenkins_home"
  }

  environment = {
    JAVA_OPTS = "-Djenkins.install.runSetupWizard=false"
  }

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
    host_path      = "./vault_data"
    container_path = "/vault/file"
  }

  environment = {
    VAULT_DEV_ROOT_TOKEN_ID     = "root"
    VAULT_DEV_LISTEN_ADDRESS    = "0.0.0.0:8200"
  }

  command = "server -dev"
  
  networks_advanced {
    name = docker_network.jenkins_net.name
  }
}

# Define persistent volume for Vault
resource "docker_volume" "vault_data" {
  name = "vault_data"
}
