terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "spring-boot-prometheus-grafana-sample-master-web" {
  name         = "spring-boot-prometheus-grafana-sample-master-web:latest"
  keep_locally = false
}

resource "docker_container" "spring-boot-prometheus-grafana-sample-master-web" {
  image = docker_image.spring-boot-prometheus-grafana-sample-master-web.image_id
  name  = "web_p"
  ports {
    internal = 2004
    external = 2004
  }
}