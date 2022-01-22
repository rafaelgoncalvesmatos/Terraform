# Terraform

Terraform é uma ferramenta de provisionamento de recurso voltado para o ambiente corporativo, que auxilia na contrução de novos ambientes deixando de forma documentada e de fácil contrução.

### Indice

## Utilizacao basica

Para comecar precisamos entender que o provider é necessário quando utilizamos o terraform, já que ele diz onde iremos provisionar o ambiente.

Neste exemplo usaremos docker, com apenas um arquivo chamado config.tf iremos provisionar no provider docker:

```md
provider "docker" {
  host = "tcp://localhost:2345/"
}
```

Após isso iremos declarar nosso resource que será criado, neste caso um container **nginx**.

Lembrando que toda declaracao de resource possui um TYPE **docker_container** e NAME que no caso é **nginx-server**.

```md
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

## Validacao

A proxima fase é a validacao onde podemos checar o que será feito:

```md
terraform plan --out config.tfplan
```

## Aplicando 

Para aplicar as definições execute:

```md
terraform apply
```

## Outros comandos

Podemos através do parametro output verificar o que foi gerado:

```md
terraform output

```