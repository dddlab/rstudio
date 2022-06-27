FROM jupyter/r-notebook:2022-06-20

USER root

COPY .devcontainer/library-scripts/common-debian.sh /tmp/library-scripts/
COPY .devcontainer/library-scripts/get-token.sh /opt/conda/bin/
# COPY --chown="${NB_UID}:${NB_GID}" library-scripts/get-token.sh /opt/conda/bin/

RUN curl --silent -L --fail \
        https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.3-492-amd64.deb > /tmp/rstudio.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        /tmp/rstudio.deb lmodern && \
    groupadd jovyan && \
    usermod -g jovyan -a -G users jovyan && \
    bash /tmp/library-scripts/common-debian.sh && \
    apt-get clean -y && \
    rm -rf /tmp/rstudio.deb /var/lib/apt/lists/* /tmp/library-scripts

USER ${NB_UID}

RUN pip install --no-cache-dir \
        jupyter-server-proxy==3.2.1 \
        jupyter-rsession-proxy==2.0.1 && \
    jupyter labextension install @jupyterlab/server-proxy@3.2.1 && \
    jupyter lab build

# COPY --chown="${NB_UID}:${NB_GID}" library-scripts/get-token.sh /opt/conda/bin/
# COPY library-scripts/get-token.sh /tmp/library-scripts/
# COPY library-scripts/get-token.sh /opt/conda/bin/
