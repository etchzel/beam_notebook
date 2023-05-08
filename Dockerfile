FROM python:3.10-slim-bullseye

RUN apt-get update -yq \
    && apt-get install -yq ca-certificates \
        curl \
        git \
        gnupg \
        graphviz \
        jq \
        sudo \
        wget \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash \
    && apt-get update -yq \
    && apt-get install -yq nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

RUN python -m pip install --upgrade pip setuptools wheel --no-cache-dir
RUN pip install 'apache-beam[gcp,test,interactive]'
RUN pip install jupyterlab ipykernel ipywidgets
RUN pip install jupyterlab_widgets
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

RUN useradd -m -U jupyter

EXPOSE 8888

USER jupyter
WORKDIR jupyter
