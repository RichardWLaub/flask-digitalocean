terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.22.2"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_droplet" "web" {
  image  = "docker-20-04"
  name   = "flask-hello-world"
  region = "nyc3"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    var.ssh_fingerprint
  ]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.private_key_path)
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "docker run -d -p 80:5000 richardwlaub1/flask-hello-world:latest"
    ]
  }
}

output "ip_address" {
  value = digitalocean_droplet.web.ipv4_address
}

