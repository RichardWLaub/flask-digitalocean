# Flask Hello World App Deployment

This repository contains a simple Flask "Hello World" application, Dockerized and deployed on DigitalOcean using Terraform.


## Overview

This repository demonstrates how to containerize a basic Flask application using Docker and deploy it to a DigitalOcean Droplet using Terraform.

## Prerequisites

1. **DigitalOcean Account**: Ensure you have a DigitalOcean account.
2. **DigitalOcean API Token**: Generate a Personal Access Token from DigitalOcean.
3. **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html).
4. **Docker**: Install [Docker](https://docs.docker.com/get-docker/).
5. **SSH Key**: Ensure you have an SSH key added to your DigitalOcean account.

## Flask Application

The Flask app is defined in `app/app.py`. This simple application responds with "Hello, World!" when accessed.

## Docker

### Build and Push Docker Image

1. **Log in to Docker Hub**:
    ```bash
    docker login
    ```

2. **Build the Docker image**:
    ```bash
    docker build -t yourdockerhubusername/flask-hello-world:latest app/
    ```

3. **Push the Docker image to Docker Hub**:
    ```bash
    docker push yourdockerhubusername/flask-hello-world:latest
    ```

## Terraform

The Terraform configuration files are located in the `terraform/` directory. These files will help you create and manage your DigitalOcean Droplet.

### Variables to Update

Update the following variables in `terraform/terraform.tfvars`:

- `digitalocean_token`: Your DigitalOcean API token.
- `ssh_fingerprint`: The fingerprint of your SSH key.
- `private_key_path`: The path to your private SSH key.

### Initialize and Apply Terraform

1. **Initialize Terraform**:
    ```bash
    terraform init
    ```

2. **Apply the Terraform configuration**:
    ```bash
    terraform apply
    ```

    Confirm the action by typing `yes` when prompted.

## Access Your Flask App

After the Terraform apply process completes, it will output the IP address of your DigitalOcean Droplet. You can access your Flask app by navigating to `http://<droplet-ip>` in your web browser.

## Summary

This setup provides a simple Flask "Hello World" application, containerized using Docker, and deployed to a DigitalOcean Droplet using Terraform. Ensure to replace placeholders like `yourdockerhubusername`, `your_digitalocean_api_token`, and `your_ssh_key_fingerprint` with your actual values.
