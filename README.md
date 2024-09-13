# My Docker Project

Test project to showcase GitHub Actions and pushing the image to GitHub Container Registry (GHCR) without creating any Personal Access Tokens (PAT) by using the default keys created from the workflow.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Setup GitHub Actions Workflow](#setup-github-actions-workflow)
- [Push Docker Image to GHCR](#push-docker-image-to-ghcr)
- [Useful Links](#useful-links)
- [License](#license)

## Introduction

This project demonstrates how to use GitHub Actions to build a Docker image and automatically push it to the GitHub Container Registry (GHCR). One key highlight is that this setup does not require you to create and manage Personal Access Tokens (PAT) manually. Instead, it leverages the default credentials provided by GitHub Actions.

## Prerequisites

To get started, ensure you have the following:

- A GitHub account.
- A repository created to store your Docker project.

## Setup GitHub Actions Workflow

1. **Create a Workflow File**: Inside your repository, navigate to `.github/workflows` and create a new file named `docker-image.yml`.

2. **Add the Following YAML Content**:

    ```yaml
    name: Build and Push Docker Image

    on:
      push:
        branches:
          - main

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout repository
            uses: actions/checkout@v2

          - name: Log in to GitHub Container Registry
            uses: docker/login-action@v1
            with:
              registry: ghcr.io
              username: ${{ github.actor }}
              password: ${{ secrets.GITHUB_TOKEN }}

          - name: Build the Docker image
            run: docker build . -t ghcr.io/${{ github.repository }}:latest

          - name: Push the Docker image
            run: docker push ghcr.io/${{ github.repository }}:latest
    ```

This workflow does the following:
- Triggers on pushes to the `main` branch.
- Checks out the repository.
- Uses Docker login action to authenticate against GHCR using default GitHub credentials (`GITHUB_TOKEN`).
- Builds the Docker image.
- Pushes the image to GHCR.

## Push Docker Image to GHCR

By using the default `GITHUB_TOKEN` provided by GitHub Actions, you can authenticate and interact with the GHCR without needing to create a PAT manually. The `GITHUB_TOKEN` is automatically created for each workflow run and has permissions scoped to the repository.

## Useful Links

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Container Registry Documentation](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [GitHub Context and Expression Syntax for Workflows](https://docs.github.com/en/actions/learn-github-actions/contexts#github-context)
- [Docker Login Action](https://github.com/docker/login-action)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
