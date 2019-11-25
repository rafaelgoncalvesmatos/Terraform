provider "docker" {
  host = "tcp://localhost:2345/"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = "nginx"

  ports {
    internal = 80
  }

  volumes {
    container_path = "/usr/share/nginx/html"
    host_path      = "/tmp"
    read_only      = true
  }
}
