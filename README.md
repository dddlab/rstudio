# RStudio on GitHub Codespaces

## What is Codespaces?

[GitHub Codespaces](https://docs.github.com/en/codespaces/overview#what-is-a-codespace) is a hosted development environment in the cloud. Codespaces is [Remote Containers](https://code.visualstudio.com/docs/remote/containers) customized for GitHub. Once set up, Codespaces can be access through the web-based frontend or local installation of [Visual Studio Code](https://code.visualstudio.com).

## What is in this repository?

This repository shows how you can run RStudio on GitHub Codespaces starting from [Jupyter r-notebook image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-r-notebook). The main advantage of this setup is that the [resulting container image](.devcontainer/Dockerfile) will also run on [Jupyter Hub](https://jupyter.org/hub).

There are three ways to use the [container image](.devcontainer/Dockerfile) in this repository.

1. **[Jupyter Hub](https://zero-to-jupyterhub.readthedocs.io/en/latest/jupyterhub/customizing/user-environment.html#choose-and-use-an-existing-docker-image)**
2. **GitHub Codespaces**
3. **[`docker-compose`](https://docs.docker.com/compose/install/)** (requires command line)

### Jupyter Hub

Your IT staff will know what to do with the [`dockerfile`](.devcontainer/Dockerfile)

### GitHub Codespaces

First, you need [access to Codespaces](https://docs.github.com/en/codespaces/developing-in-codespaces/creating-a-codespace#access-to-codespaces) and enabled. Then, the files in [`.devcontainer`](.devcontainer) directory will do all the work!

### Docker Compose

Here are the steps:

```bash
# Clone this repository
git clone https://github.com/dddlab/rstudio
cd rstudio

# Symlink .devcontainer contents except devcontainer.json
ln -s .devcontainer/!(devcontainer.json) .

# Build image and start container
docker-compose build rstudio
docker-compose up
```