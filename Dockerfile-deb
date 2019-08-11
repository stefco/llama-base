#------------------------------------------------------------------------------
# CREATE /etc/docker-meta.yml
ARG DOCKER_TAG
ARG NAME
ARG VERSION
ARG COMMIT
ARG URL
ARG BRANCH
ARG DATE
ARG REPO
ARG DOCKERFILE_PATH
FROM alpine AS meta
ARG DOCKER_TAG
ARG NAME
ARG VERSION
ARG COMMIT
ARG URL
ARG BRANCH
ARG DATE
ARG REPO
ARG DOCKERFILE_PATH
COPY "${DOCKERFILE_PATH}" /provision/"${DOCKERFILE_PATH}"
RUN echo >>/etc/docker-meta.yml "- name: ${NAME}" \
    && echo >>/etc/docker-meta.yml "  version: ${VERSION}" \
    && echo >>/etc/docker-meta.yml "  commit: ${COMMIT}" \
    && echo >>/etc/docker-meta.yml "  url: ${URL}" \
    && echo >>/etc/docker-meta.yml "  branch: ${BRANCH}" \
    && echo >>/etc/docker-meta.yml "  date: ${DATE}" \
    && echo >>/etc/docker-meta.yml "  repo: ${REPO}" \
    && echo >>/etc/docker-meta.yml "  docker_tag: ${DOCKER_TAG}" \
    && echo >>/etc/docker-meta.yml "  dockerfile_path: ${DOCKERFILE_PATH}" \
    && echo >>/etc/docker-meta.yml "  dockerfile: |" \
    && sed >>/etc/docker-meta.yml 's/^/    /' </provision/"${DOCKERFILE_PATH}" \
    && rm -r /provision
# END CREATE /etc/docker-meta.yml
#------------------------------------------------------------------------------

FROM debian:stretch-slim

#------------------------------------------------------------------------------
# APPEND /etc/docker-meta.yml
COPY --from=meta /etc/docker-meta.yml /etc/new-docker-meta.yml
RUN cat /etc/new-docker-meta.yml >>/etc/docker-meta.yml \
    && echo Full meta: \
    && cat /etc/docker-meta.yml \
    && rm /etc/new-docker-meta.yml
# END APPEND /etc/docker-meta.yml
#------------------------------------------------------------------------------

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        psmisc \
        procps \
        ca-certificates \
        curl \
        bzip2 \
        vim \
        git \
        graphviz \
        htop \
        ncdu \
        ssh-client \
        certbot \
    && echo Installing LIGO DataGrid \
    || exit 1 \
    bash -c ' \
        v=1; \
        until [ $v -eq 0 ]; do \
            curl https://www.lsc-group.phys.uwm.edu/lscdatagrid/doc/ldg-client.sh | bash; \
            v=$?; \
        done \
    ' \
    && echo Installing nodejs \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh >~/miniconda.sh \
    && bash ~/miniconda.sh -b -f -p /opt/anaconda \
    && rm ~/miniconda.sh \
    && /opt/anaconda/bin/conda update conda \
    && /opt/anaconda/bin/conda update --all \
    && /opt/anaconda/bin/conda config --add channels conda-forge \
    && echo 'export PATH=/opt/anaconda/bin:"$PATH"' >/etc/profile.d/conda.sh \
    && rm -r /opt/anaconda/pkgs \
    && sh -l -c ' \
        git config --global user.name "LLAMA Docker Image" \
            && git config --global user.email "NA" \
    '

SHELL ["sh", "-l", "-c"]
