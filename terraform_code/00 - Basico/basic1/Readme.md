# Terraform

## Utilizacao basica

Para comecar precisamos entender que o provider é necessário quando utilizamos o terraform, já que ele diz onde iremos provisionar o ambiente.

## Exemplo

Neste exemplo usaremos docker, com apenas um arquivo chamado config.tf iremos provisionar no provider docker:

```
provider "docker" {
  host = "tcp://localhost:2345/"
}
```

Após isso iremos declarar nosso resource que será criado, neste caso um container **nginx**.

Lembrando que toda declaracao de resource possui um TYPE **docker_container** e NAME que no caso é **nginx-server**.

```
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
```




