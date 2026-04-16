# Highly experimental Dockerfile ahead!
# Instead of integrating this app in the
# terminal+ghostfs+virtualgl base we do
# it the other way round.

#ARG CI_REGISTRY_IMAGE
#ARG TAG
#ARG DOCKERFS_TYPE
#ARG DOCKERFS_VERSION

FROM pennlinc/qsiprep:latest
LABEL maintainer="paoloemilio.mazzon@unipd.it"

ARG DEBIAN_FRONTEND=noninteractive
ARG CARD
ARG CI_REGISTRY
ARG APP_NAME
ARG APP_VERSION
ARG WEZTERM=20240203-110809-5046fc22
ARG VIRTUALGL=3.1.1
ARG GHOSTFS=c296342

LABEL app_version=$APP_VERSION
#LABEL app_tag=$TAG

WORKDIR /apps/${APP_NAME}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \ 
    curl wget ca-certificates libfontconfig1 libwayland-egl1 libxcb-image0 \
    libxcb-util1 libxkbcommon-x11-0  libxkbcommon0 libxcb-keysyms1 \
    libglu1-mesa libegl1-mesa libxv1 libxtst6 libegl-mesa0 primus \
    fuse libfuse2 binutils && \
    wget https://github.com/VirtualGL/virtualgl/releases/download/${VIRTUALGL}/virtualgl_${VIRTUALGL}_amd64.deb && \
    dpkg -i virtualgl_${VIRTUALGL}_amd64.deb && \
    rm virtualgl_${VIRTUALGL}_amd64.deb && \
    curl -sSLO https://github.com/wez/wezterm/releases/download/${WEZTERM}/wezterm-${WEZTERM}.Ubuntu22.04.deb && \
    dpkg -i wezterm-${WEZTERM}.Ubuntu22.04.deb && \
    rm wezterm-${WEZTERM}.Ubuntu22.04.deb && \
    curl -sSOL https://github.com/pouya-eghbali/ghostfs-builds/releases/download/linux-ubuntu-22.04-${GHOSTFS}/GhostFS && \
    chmod +x GhostFS && \
    mv GhostFS /usr/bin && \
    apt-get remove -y --purge curl && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV APP_SPECIAL="terminal"
ENV APP_CMD=""
ENV PROCESS_NAME=""
ENV CONFIG_ARRAY=".profile"
ENV APP_DATA_DIR_ARRAY=""
ENV DATA_DIR_ARRAY=""

HEALTHCHECK --interval=10s --timeout=10s --retries=5 --start-period=30s \
  CMD sh -c "/apps/${APP_NAME}/scripts/process-healthcheck.sh \
  && /apps/${APP_NAME}/scripts/ls-healthcheck.sh /home/${HIP_USER}/nextcloud/"

COPY ./base-images/virtualgl/config/10_nvidia.json /usr/share/glvnd/egl_vendor.d/10_nvidia.json
COPY ./licenses/freesurfer-license.txt /opt/freesurfer/license.txt
COPY ./scripts/ scripts/
COPY ./apps/${APP_NAME}/config config/

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]
