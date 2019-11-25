provider "docker" {
  host = "ssh://root@127.0.0.1:22"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = "nginx"

  # image = "${docker_image.nginx.latest}"

  ports {
    internal = 80
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path      = "/tmp"
    read_only      = true
  }
}
