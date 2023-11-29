FROM jupyter/r-notebook:ubuntu-22.04

USER root

RUN apt-get update && \
    apt-get install -y gdebi-core && \
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.09.1-494-amd64.deb && \
    gdebi -n rstudio-server-2023.09.1-494-amd64.deb

USER ${NB_UID}

## RUN pip install --no-cache-dir jupyter-rsession-proxy
RUN pip install git+https://github.com/ryanlovett/jupyter-rsession-proxy@95759d85e95de6cb102702762d23f74ae2d46baa

## RUN alias get-jupyter-token="jupyter server list | grep -o 'token=[[:alnum:]]*' | sed 's/token=//'"